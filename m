Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88DFD2487C4
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 16:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgHROhZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 10:37:25 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:58897 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727895AbgHROhX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 10:37:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 82jnkV8V2uuXO82jpkcevx; Tue, 18 Aug 2020 16:37:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597761441; bh=itvpLW26PAwAoKzXIVYdrK7gfIgVYx+7yxm5Sz+P0W8=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=JgIvxn63VHLlHPIUi0vAnHIfu966Ui6G92s8hzmMGopmkqHrLHNovvFOjvdv680Hb
         o3moYR1Td9CPaxqZMy5YeXWUOAC5aqrPvw+PXBEnZO8O9qe+BNMC10OyWrFH6uHZNq
         kVwNQLTv11uHTOeRuicTTqpVinjdFp5Yf/iqNzN+zS0jGsDWM1J0hQUPY15DlCVUig
         zJd2LpDGp72fi0YjteRCtx4LVhTKhLc/TEekBINZnoNuRY39D8NY2Phn6DccPdpiCW
         PQT5t1I3R+c4ymz0A2scNMwLK2aSGFVe0x1O5fOLI3v86jgW1780vTXKrIaSnirt9C
         8VAFggKhPnm2Q==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 08/12] vivid: add ro_requests module option
Date:   Tue, 18 Aug 2020 16:37:15 +0200
Message-Id: <20200818143719.102128-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200818143719.102128-1-hverkuil-cisco@xs4all.nl>
References: <20200818143719.102128-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCuwSrPvT4fumm6uq5Q5WMyOX6OnYFqvqUTKnnAc42oTX5UrWuzWMQXEHZ0Xwab3bjAqBvapkeMtcnah8py0+THUdibAVA3JlkwbJKBA3FfrJVRuZCf9
 MutHBxYoEallZtP/q0OB2XnCJYFdu6h4EqCQrwiCWra8okfqXdZAkac5bbCbmkYM4fe4xJG4EgawT0xEbOL5+hT3oI9SgWjgRVgJ29iPievIqXhZJd6d629a
 vLCVQBuRiPUnJBSOtzjJGfW8g2/2zvya2zTX+mLp3FNEr3SVaCewyR1Wov6ClyHz5BVDVJeeN6e+zXNlMbcW5xoP9uhUmaOfWpjS5OYLoWNoNuaLH/wbAw26
 Wji31XDc
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the ro_requests module option to test Read-Only Requests with vivid.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/admin-guide/media/vivid.rst     | 10 ++++++++++
 drivers/media/test-drivers/vivid/vivid-core.c | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/admin-guide/media/vivid.rst b/Documentation/admin-guide/media/vivid.rst
index 6d7175f96f74..423a61797a1d 100644
--- a/Documentation/admin-guide/media/vivid.rst
+++ b/Documentation/admin-guide/media/vivid.rst
@@ -302,6 +302,16 @@ all configurable using the following module options:
 		- 0: forbid hints
 		- 1: allow hints
 
+- ro_requests:
+
+	specifies if the capture device supports the standard Request API (i.e.
+	userspace can set controls in a request before queueing it), or
+	the Read-Only Request API (userspace can only read back controls after
+	the request was completed). Default is 0.
+
+		- 0: regular requests
+		- 1: read-only requests
+
 Taken together, all these module options allow you to precisely customize
 the driver behavior and test your application with all sorts of permutations.
 It is also very suitable to emulate hardware that is not yet available, e.g.
diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index c21bc27bbfeb..cc1510024b68 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -177,6 +177,14 @@ MODULE_PARM_DESC(cache_hints, " user-space cache hints, default is 0.\n"
 			     "\t\t    0 == forbid\n"
 			     "\t\t    1 == allow");
 
+static unsigned int ro_requests[VIVID_MAX_DEVS] = {
+	[0 ... (VIVID_MAX_DEVS - 1)] = 0
+};
+module_param_array(ro_requests, uint, NULL, 0444);
+MODULE_PARM_DESC(ro_requests, " use read-only requests instead of regular requests, default is 0.\n"
+			     "\t\t    0 == regular requests\n"
+			     "\t\t    1 == read-only requests");
+
 static struct vivid_dev *vivid_devs[VIVID_MAX_DEVS];
 
 const struct v4l2_rect vivid_min_rect = {
@@ -869,6 +877,8 @@ static int vivid_create_queue(struct vivid_dev *dev,
 	q->lock = &dev->mutex;
 	q->dev = dev->v4l2_dev.dev;
 	q->supports_requests = true;
+	if (V4L2_TYPE_IS_CAPTURE(buf_type))
+		q->supports_ro_requests = (ro_requests[dev->inst] == 1);
 	q->allow_cache_hints = (cache_hints[dev->inst] == 1);
 
 	return vb2_queue_init(q);
-- 
2.27.0

