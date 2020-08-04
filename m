Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67C3823BA3A
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 14:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgHDMXg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Aug 2020 08:23:36 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:60354 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730381AbgHDLs7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Aug 2020 07:48:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596541738; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From;
 bh=vGH9LKTOm9sL1O4ddHVopCGrjaeylS/jHpnPnE8H5C0=; b=IcBXwAmab5jAWTqr7nkLgSl6TspGn9nNWXOP0b0flkNpnlr0cbx6zChzlvim9d7yxYQNrTxy
 I5U8scuQ+5IQx1ERG8481DyMBFD7SjHJcSifIByouP8wQgKVpLcPx9f3efradN0ZsfZe1lWo
 bckrl0Y7aC4n8V/Tv1Ynot1H3cc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-west-2.postgun.com with SMTP id
 5f294b2a781ba1c5e2e7a4a7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 Aug 2020 11:48:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6E201C433C9; Tue,  4 Aug 2020 11:48:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=2.0 tests=ALL_TRUSTED,FROM_ADDR_WS,
        SPF_HELO_NONE,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from vgarodia-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vgarodia)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 70F7BC433C6;
        Tue,  4 Aug 2020 11:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 70F7BC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=fail (p=none dis=none) header.from=qti.qualcomm.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.helo=vgarodia-linux.qualcomm.com
From:   Vikash Garodia <"Vikash Garodia"@qti.qualcomm.com>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, mansur@codeaurora.org,
        rkurapat@qti.qualcomm.com, gkapalli@qti.qualcomm.com
Subject: [PATCH] venus: fixes for list corruption
Date:   Tue,  4 Aug 2020 17:18:45 +0530
Message-Id: <20200804114845.25086-1-user@vgarodia-linux>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Vikash Garodia <vgarodia@codeaurora.org>

There are few list handling issues while adding and deleting
node in the registered buf list in the driver.
1. list addition - buffer added into the list during buf_init
while not deleted during cleanup.
2. list deletion - In capture streamoff, the list was reinitialized.
As a result, if any node was present in the list, it would
lead to issue while cleaning up that node during buf_cleanup.

Corresponding call traces below:
[  165.751014] Call trace:
[  165.753541]  __list_add_valid+0x58/0x88
[  165.757532]  venus_helper_vb2_buf_init+0x74/0xa8 [venus_core]
[  165.763450]  vdec_buf_init+0x34/0xb4 [venus_dec]
[  165.768271]  __buf_prepare+0x598/0x8a0 [videobuf2_common]
[  165.773820]  vb2_core_qbuf+0xb4/0x334 [videobuf2_common]
[  165.779298]  vb2_qbuf+0x78/0xb8 [videobuf2_v4l2]
[  165.784053]  v4l2_m2m_qbuf+0x80/0xf8 [v4l2_mem2mem]
[  165.789067]  v4l2_m2m_ioctl_qbuf+0x2c/0x38 [v4l2_mem2mem]
[  165.794624]  v4l_qbuf+0x48/0x58

[ 1797.556001] Call trace:
[ 1797.558516]  __list_del_entry_valid+0x88/0x9c
[ 1797.562989]  vdec_buf_cleanup+0x54/0x228 [venus_dec]
[ 1797.568088]  __buf_prepare+0x270/0x8a0 [videobuf2_common]
[ 1797.573625]  vb2_core_qbuf+0xb4/0x338 [videobuf2_common]
[ 1797.579082]  vb2_qbuf+0x78/0xb8 [videobuf2_v4l2]
[ 1797.583830]  v4l2_m2m_qbuf+0x80/0xf8 [v4l2_mem2mem]
[ 1797.588843]  v4l2_m2m_ioctl_qbuf+0x2c/0x38 [v4l2_mem2mem]
[ 1797.594389]  v4l_qbuf+0x48/0x58

Signed-off-by: Vikash Garodia <vgarodia@codeaurora.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 7c4c483d5438..76be14efbfb0 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1088,8 +1088,6 @@ static int vdec_stop_capture(struct venus_inst *inst)
 		break;
 	}
 
-	INIT_LIST_HEAD(&inst->registeredbufs);
-
 	return ret;
 }
 
@@ -1189,6 +1187,14 @@ static int vdec_buf_init(struct vb2_buffer *vb)
 static void vdec_buf_cleanup(struct vb2_buffer *vb)
 {
 	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct venus_buffer *buf = to_venus_buffer(vbuf);
+
+	mutex_lock(&inst->lock);
+	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		if (!list_empty(&inst->registeredbufs))
+			list_del_init(&buf->reg_list);
+	mutex_unlock(&inst->lock);
 
 	inst->buf_count--;
 	if (!inst->buf_count)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

