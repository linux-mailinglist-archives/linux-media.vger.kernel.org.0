Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0346B2487C5
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 16:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgHROh0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 10:37:26 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:56043 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727894AbgHROhX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 10:37:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 82jnkV8V2uuXO82jpkcevr; Tue, 18 Aug 2020 16:37:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597761441; bh=uNfv94trv5637tace882s+UbS3lhnS9zFszqciFMUSQ=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=RYbl+ph758el8VOusQ2blEG/1+04nmLQwX53gVk2yu5A8++4KoT5My6bed4RtYmxu
         oHfCbOYAfgyCSDNFtdYyojmFaiUG7zoqzRsvfr+h3B8uviZFP0SS8ZBa8+3WIHRvWc
         P7e/5vvJ8YazgJS5YVIcbaAp3LNlz6nUQhrBi3MP63LdoKuQce0lbpMKEuTjI9Lt6a
         rPo4RrlLm52L7JZIi4AyG8j1Hzg+YQNr+WUBc6aqh3rUqGfxT/Jkm3dvWtkOXo1Pnl
         NUlXtV/1NId8c0I5IZhSXSihUQMjV7fntHN1iwFwU0powZBbgvnHBlDxaijidNSrcA
         u99zMDcxVVKVw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 07/12] vivid: call v4l2_ctrl_request_add_handler()
Date:   Tue, 18 Aug 2020 16:37:14 +0200
Message-Id: <20200818143719.102128-8-hverkuil-cisco@xs4all.nl>
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

Call v4l2_ctrl_request_add_handler() from req_validate() to add the
control handler request object if needed.

Without this the returned request object would not have a copy of the
controls used for the captured frame.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index f7ee37e9508d..c21bc27bbfeb 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -783,6 +783,48 @@ static void vivid_dev_release(struct v4l2_device *v4l2_dev)
 static int vivid_req_validate(struct media_request *req)
 {
 	struct vivid_dev *dev = container_of(req->mdev, struct vivid_dev, mdev);
+	struct vb2_buffer *vb = vb2_request_buffer_first(req);
+	struct v4l2_ctrl_handler *hdl = NULL;
+	bool ro_req;
+	int ret;
+
+	if (!vb)
+		return -ENOENT;
+
+	switch (vb->vb2_queue->type) {
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		if (vb->vb2_queue == &dev->vb_touch_cap_q)
+			hdl = &dev->ctrl_hdl_touch_cap;
+		else
+			hdl = &dev->ctrl_hdl_vid_cap;
+		break;
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		hdl = &dev->ctrl_hdl_vid_out;
+		break;
+	case V4L2_BUF_TYPE_VBI_CAPTURE:
+	case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
+		hdl = &dev->ctrl_hdl_vbi_cap;
+		break;
+	case V4L2_BUF_TYPE_VBI_OUTPUT:
+	case V4L2_BUF_TYPE_SLICED_VBI_OUTPUT:
+		hdl = &dev->ctrl_hdl_vbi_out;
+		break;
+	case V4L2_BUF_TYPE_META_CAPTURE:
+		hdl = &dev->ctrl_hdl_meta_cap;
+		break;
+	case V4L2_BUF_TYPE_META_OUTPUT:
+		hdl = &dev->ctrl_hdl_meta_out;
+		break;
+	case V4L2_BUF_TYPE_SDR_CAPTURE:
+		hdl = &dev->ctrl_hdl_sdr_cap;
+		break;
+	}
+	ro_req = vb->vb2_queue->supports_ro_requests;
+	ret = v4l2_ctrl_request_add_handler(req, hdl, ro_req);
+	if (ret)
+		return ret;
 
 	if (dev->req_validate_error) {
 		dev->req_validate_error = false;
-- 
2.27.0

