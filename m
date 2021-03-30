Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7172534E375
	for <lists+linux-media@lfdr.de>; Tue, 30 Mar 2021 10:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbhC3Io7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Mar 2021 04:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbhC3Iog (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Mar 2021 04:44:36 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82882C061764
        for <linux-media@vger.kernel.org>; Tue, 30 Mar 2021 01:44:31 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id c8so15372425wrq.11
        for <linux-media@vger.kernel.org>; Tue, 30 Mar 2021 01:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=QeJyxgGc10pDaYNNAjfeii+zaUwklx3peLYUlVYiAaY=;
        b=S0tYOpSD/ZJh3ZD7i+RsmuoE59o3Fsn7qNYvfw9oPctsWGSiOdyIUNGklFbIi0fdsD
         pwi7wMid3Z3j+CdJybOtWWuaWNgtjPUfE2xGD2PTf1/qoiKJSlZ+HCGXID02oT3hNxwb
         wFfTiuw5mtTFyiHCn57eMyQBy7yHwNuHAByWKjuPeyx4ibEjHKhyYYXeD2gKi6je+0+Y
         D2ThNL57aMz67FZzq6m/CBo0WnoEiJCEWjxCdzRXAuydHHyi9hSpo/k2I9EFc4JdU6/9
         +w6XjthOg3GOVgupCJakziw3iI0LPjdRR8LzXIk/qJC7wW2mwR1JcaYeU8Arid9vdw4M
         1EsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=QeJyxgGc10pDaYNNAjfeii+zaUwklx3peLYUlVYiAaY=;
        b=Cfqh0tqv2+J10yxBbKMjDn7EuGIXwUgEpAYcVF/TJBxSWqJHqoF/7FGzQezID1cpsH
         5RWc9uOPIHl6zzJbA38BDsrXDYZAzu2eTHxq1BwZ37sMF0jMkQpILmtRz+dnmuU9HDL2
         KhBioK3DffZYKGNIdDz1NfIwezlkhbHCjdAc9jFNe73DACGfKsPAyrUPb9mUuOrp+owc
         P86+E5RtCD+VIv3NfdvhsqlMr4kN6AeuqCmUwjzkrs1rz2niOob8gS9TGk67STImF242
         olKaHcU19FQzW0emWCOr1L3IpJuLPx+kztk7jBP7eBmTVargJWlhUk1Q2QzWhPfW0T7f
         xsog==
X-Gm-Message-State: AOAM5311dixn51NNKbX19KJLHJH0KckM/LHEN2yNaKaarhG0rtQbfSw4
        9BGpNQUxLRTEpkAO5etkruCEqw==
X-Google-Smtp-Source: ABdhPJwBXFQGjk2ZQOQhpWfWn7D2BeJN+Kgv2+n/4a86q735GB6I+PE7RNQIN/9Rot8sUxrlUiubMA==
X-Received: by 2002:adf:f150:: with SMTP id y16mr32802937wro.414.1617093870312;
        Tue, 30 Mar 2021 01:44:30 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id k13sm40191578wri.27.2021.03.30.01.44.29
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 30 Mar 2021 01:44:29 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH for v5.12] v4l2-ctrls.c: fix race condition in hdl->requests list
Date:   Tue, 30 Mar 2021 09:44:29 +0100
Message-ID: <p1p56gp29io74ma4dkd3hd7hsafdvsl84p@4ax.com>
References: <ce92a438-4708-74a0-8fb4-c8fb6495e6b8@xs4all.nl>
In-Reply-To: <ce92a438-4708-74a0-8fb4-c8fb6495e6b8@xs4all.nl>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 27 Mar 2021 12:27:40 +0100, you wrote:

>When a request is re-inited it will release all control handler
>objects that are still in the request. It does that by unbinding
>and putting all those objects. When the object is unbound the
>obj->req pointer is set to NULL, and the object's unbind op is
>called. When the object it put the object's release op is called
>to free the memory.
>
>For a request object that contains a control handler that means
>that v4l2_ctrl_handler_free() is called in the release op.
>
>A control handler used in a request has a pointer to the main
>control handler that is created by the driver and contains the
>current state of all controls. If the device is unbound (due to
>rmmod or a forced unbind), then that main handler is freed, again
>by calling v4l2_ctrl_handler_free(), and any outstanding request
>objects that refer to that main handler have to be unbound and put
>as well.
>
>It does that by this test:
>
>	if (!hdl->req_obj.req && !list_empty(&hdl->requests)) {
>
>I.e. the handler has no pointer to a request, so is the main
>handler, and one or more request objects refer to this main
>handler.
>
>However, this test is wrong since hdl->req_obj.req is actually
>NULL when re-initing a request (the object unbind will set req to
>NULL), and the only reason this seemingly worked is that the
>requests list is typically empty since the request's unbind op
>will remove the handler from the requests list.
>
>But if another thread is at the same time adding a new control
>to a request, then there is a race condition where one thread
>is removing a control handler object from the requests list and
>another thread is adding one. The result is that hdl->requests
>is no longer empty and the code thinks that a main handler is
>being freed instead of a control handler that is part of a request.
>
>There are two bugs here: first the test for hdl->req_obj.req: this
>should be hdl->req_obj.ops since only the main control handler will
>have a NULL pointer there.
>
>The second is that adding or deleting request objects from the
>requests list of the main handler isn't protected by taking the
>main handler's lock.
>
>Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>Reported-by: John Cox <jsc66@cam.ac.uk>
>Fixes: 6fa6f831f095 ("media: v4l2-ctrls: add core request support")
>---
> drivers/media/v4l2-core/v4l2-ctrls.c | 17 ++++++++++++++---
> 1 file changed, 14 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c =
b/drivers/media/v4l2-core/v4l2-ctrls.c
>index 39038c6ad8fb..757d215c2be4 100644
>--- a/drivers/media/v4l2-core/v4l2-ctrls.c
>+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>@@ -2560,7 +2560,15 @@ void v4l2_ctrl_handler_free(struct =
v4l2_ctrl_handler *hdl)
> 	if (hdl =3D=3D NULL || hdl->buckets =3D=3D NULL)
> 		return;
>
>-	if (!hdl->req_obj.req && !list_empty(&hdl->requests)) {
>+	/*
>+	 * If the main handler is freed and it is used by handler objects in
>+	 * outstanding requests, then unbind and put those objects before
>+	 * freeing the main handler.
>+	 *
>+	 * The main handler can be identified by having a NULL ops pointer in
>+	 * the request object.
>+	 */
>+	if (!hdl->req_obj.ops && !list_empty(&hdl->requests)) {
> 		struct v4l2_ctrl_handler *req, *next_req;
>
> 		list_for_each_entry_safe(req, next_req, &hdl->requests, requests) {
>@@ -3634,8 +3642,8 @@ static void v4l2_ctrl_request_unbind(struct =
media_request_object *obj)
> 		container_of(obj, struct v4l2_ctrl_handler, req_obj);
> 	struct v4l2_ctrl_handler *main_hdl =3D obj->priv;
>
>-	list_del_init(&hdl->requests);
> 	mutex_lock(main_hdl->lock);
>+	list_del_init(&hdl->requests);
> 	if (hdl->request_is_queued) {
> 		list_del_init(&hdl->requests_queued);
> 		hdl->request_is_queued =3D false;
>@@ -3694,8 +3702,11 @@ static int v4l2_ctrl_request_bind(struct =
media_request *req,
> 	if (!ret) {
> 		ret =3D media_request_object_bind(req, &req_ops,
> 						from, false, &hdl->req_obj);
>-		if (!ret)
>+		if (!ret) {
>+			mutex_lock(from->lock);
> 			list_add_tail(&hdl->requests, &from->requests);
>+			mutex_unlock(from->lock);
>+		}
> 	}
> 	return ret;
> }

Tested-by: John Cox <jc@kynesim.co.uk>

Could you also change the report to

Reported-by: John Cox <jc@kynesim.co.uk>

Many thanks

John Cox
