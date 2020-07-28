Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF542306E3
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 11:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728472AbgG1Jsz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 05:48:55 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:37281 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728393AbgG1Jsz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 05:48:55 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 0ME7kqEDGuuXO0ME9kI7x4; Tue, 28 Jul 2020 11:48:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595929733; bh=B09D7nGlRQRXLulC9Lr8Yv3TFcR0/GPu9lC3G81SE50=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=UVMcET6I0rlKZ3BHP2sW7vvkcsuv0+9uiBWASuaqt4Feib3ejEK7oLFpu+Lepe3Oq
         OeJit0r1aSPBUvEvtZEznEYKg6mOwY9K6b2nCMXU/TEJc8gdEYcoo5l977VqilrBgG
         oKi1MdPgX5WtlII3yEtMCQewzEeuVAWcrORsr4u7Yp3W37E51/DEDSpcrZc2n4cjRh
         dipTltgtVQOw7Qjpp+0T3/j3kSZWS+ZZy89i2KXSypOKKXJd6CFTOgBX3rBVbldQYO
         q1d8cTF6Vg7J3eaoqZM9R+e+fGwx4nl4+jS0kQN5jko1uTCRSA4aohLkC34t9JZaAY
         NKZylqBomqhQA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 2/2] vivid: call v4l2_ctrl_request_create()
Date:   Tue, 28 Jul 2020 11:48:51 +0200
Message-Id: <20200728094851.121933-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728094851.121933-1-hverkuil-cisco@xs4all.nl>
References: <20200728094851.121933-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHzVj9eR94V8IN+XQnKBTLoYkSjzbT6H6XasTrh1RTJY3iucTWtJZyujAS+vnZI9E3dLHazurw3gRLu05k5INnO38/H6SiVdAwVT/yyfNEcfHWF+/wxF
 UxzB+4l3GC3vAMB1++uhbt+YcySSPiyYuj6XOn2Yhc6FSUkQosBoTREwGERtF0aSe3n0kIBtvKWoxVNzKpViNg3SGJSA7sM5VJnCmhxwzlpzCW1/9wGmdXp3
 aKJ+kJlueHWHmrCuYiJWAtlTmhs+bZqIqkmXtLWO0xUfb+yaiEJ7PRdWxPwVMwODHFMYLIMWDmJzKlRaDvtulIbF4lp2OQlbyAo/SNwgDSI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Call v4l2_ctrl_request_create() from req_validate() to create the
control request object if needed.

Without this the returned request object would not have a copy of the
controls used for the captured frame.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index f7ee37e9508d..59e155a8765e 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -783,7 +783,11 @@ static void vivid_dev_release(struct v4l2_device *v4l2_dev)
 static int vivid_req_validate(struct media_request *req)
 {
 	struct vivid_dev *dev = container_of(req->mdev, struct vivid_dev, mdev);
+	int ret;
 
+	ret = v4l2_ctrl_request_create(req, &dev->ctrl_hdl_vid_cap);
+	if (ret)
+		return ret;
 	if (dev->req_validate_error) {
 		dev->req_validate_error = false;
 		return -EINVAL;
-- 
2.27.0

