Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEAA34B6D5
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 12:27:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhC0L1r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 07:27:47 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:35777 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230288AbhC0L1q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 07:27:46 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Q76SlxJ3FMxedQ76VlW2Xl; Sat, 27 Mar 2021 12:27:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616844465; bh=bGFHaBVNhzZR/rrGqADPm/IVYw+9UBLKO27eHZ/10oU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=u5QhNd3LmhaXX5a9Bg3XwTnpOqRHrIoBGMXlVAdzTZI4WRImLZ4/6CD672lMne79x
         Ewv7Ps2WXGyDJI4R8TDz0WL244ABCP/s+j0RQcji1T3tzLxQBmOiM2fRqGJ4FD9Seb
         6pIcGVv80fUT8M2JDdhyDOUssNZCAsTLdADkPb66gw+FgZpsG+r3DR01/YgATZF81T
         BVe7+zB1NZbfJL/f/cQTUSBVHEm1/UjU3UZLt6AdvFZuy1LS9ivfusXrzwoR6ogol0
         ftMDR4WF21Gbq+l6ahGISC/KSZ4q1MtH+HU3MGbzMh9OgV3kP78XnImINv9xNA6Yu5
         RwrJBvKny2vNA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     John Cox <jsc66@cam.ac.uk>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v5.12] v4l2-ctrls.c: fix race condition in hdl->requests
 list
Message-ID: <ce92a438-4708-74a0-8fb4-c8fb6495e6b8@xs4all.nl>
Date:   Sat, 27 Mar 2021 12:27:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIe5DA8+ACsJXNR8Fn2XfY2KLI4XfhUsugQPIEfUS60ZG0A1v42lpBmL0p7oaRGgPV88aX1X7y7ZW1F3WXuNlb5DFlp8lquvGD3G9L8uZvSk1Yf67z/j
 O742sxc//By3DpUeYiNIfH+2tiz5ij5sVt4uEMGz8CTPiCQtUYDnxmN7G5sN/jQAdq+IeJAMcod3utxL8wQo3/3vJT9lr9MbQShFye/QlsfiCLIsOIHwBpTG
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When a request is re-inited it will release all control handler
objects that are still in the request. It does that by unbinding
and putting all those objects. When the object is unbound the
obj->req pointer is set to NULL, and the object's unbind op is
called. When the object it put the object's release op is called
to free the memory.

For a request object that contains a control handler that means
that v4l2_ctrl_handler_free() is called in the release op.

A control handler used in a request has a pointer to the main
control handler that is created by the driver and contains the
current state of all controls. If the device is unbound (due to
rmmod or a forced unbind), then that main handler is freed, again
by calling v4l2_ctrl_handler_free(), and any outstanding request
objects that refer to that main handler have to be unbound and put
as well.

It does that by this test:

	if (!hdl->req_obj.req && !list_empty(&hdl->requests)) {

I.e. the handler has no pointer to a request, so is the main
handler, and one or more request objects refer to this main
handler.

However, this test is wrong since hdl->req_obj.req is actually
NULL when re-initing a request (the object unbind will set req to
NULL), and the only reason this seemingly worked is that the
requests list is typically empty since the request's unbind op
will remove the handler from the requests list.

But if another thread is at the same time adding a new control
to a request, then there is a race condition where one thread
is removing a control handler object from the requests list and
another thread is adding one. The result is that hdl->requests
is no longer empty and the code thinks that a main handler is
being freed instead of a control handler that is part of a request.

There are two bugs here: first the test for hdl->req_obj.req: this
should be hdl->req_obj.ops since only the main control handler will
have a NULL pointer there.

The second is that adding or deleting request objects from the
requests list of the main handler isn't protected by taking the
main handler's lock.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: John Cox <jsc66@cam.ac.uk>
Fixes: 6fa6f831f095 ("media: v4l2-ctrls: add core request support")
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 39038c6ad8fb..757d215c2be4 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -2560,7 +2560,15 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
 	if (hdl == NULL || hdl->buckets == NULL)
 		return;

-	if (!hdl->req_obj.req && !list_empty(&hdl->requests)) {
+	/*
+	 * If the main handler is freed and it is used by handler objects in
+	 * outstanding requests, then unbind and put those objects before
+	 * freeing the main handler.
+	 *
+	 * The main handler can be identified by having a NULL ops pointer in
+	 * the request object.
+	 */
+	if (!hdl->req_obj.ops && !list_empty(&hdl->requests)) {
 		struct v4l2_ctrl_handler *req, *next_req;

 		list_for_each_entry_safe(req, next_req, &hdl->requests, requests) {
@@ -3634,8 +3642,8 @@ static void v4l2_ctrl_request_unbind(struct media_request_object *obj)
 		container_of(obj, struct v4l2_ctrl_handler, req_obj);
 	struct v4l2_ctrl_handler *main_hdl = obj->priv;

-	list_del_init(&hdl->requests);
 	mutex_lock(main_hdl->lock);
+	list_del_init(&hdl->requests);
 	if (hdl->request_is_queued) {
 		list_del_init(&hdl->requests_queued);
 		hdl->request_is_queued = false;
@@ -3694,8 +3702,11 @@ static int v4l2_ctrl_request_bind(struct media_request *req,
 	if (!ret) {
 		ret = media_request_object_bind(req, &req_ops,
 						from, false, &hdl->req_obj);
-		if (!ret)
+		if (!ret) {
+			mutex_lock(from->lock);
 			list_add_tail(&hdl->requests, &from->requests);
+			mutex_unlock(from->lock);
+		}
 	}
 	return ret;
 }
-- 
2.30.1

