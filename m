Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 539744A681
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729988AbfFRQQi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:16:38 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34263 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729958AbfFRQQh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:16:37 -0400
Received: by mail-lj1-f196.google.com with SMTP id p17so176491ljg.1;
        Tue, 18 Jun 2019 09:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M9elc0PQ+TI8jbg2PmLg+UuOO6GjGx+5PwCXytaA0Wc=;
        b=O/pn7VfDOFwqdv15F3iQkKn3V4qI1G+IU3hn3oDAncam27yuMK0zyPSh0axdj7pNBT
         qjcE/cfkXlJXFyZj45vWJbzHOHm3UsbQ69UKeg9eQHCCAdd/h7xclqyEicFrzrNt16N2
         KPxz+cPgkfG0HtY+938BK6Xb9b4ieoogOOT3IIKGJMr/xfxQoDi3bCvAx7t8eIfNmVDa
         sAQGOioA2Rhv3n2FPqkAtSGSfRcuB27FBrQnvaXiy79yKM8Jf6yufxY9CcIlU6u9LJVh
         XVaitU2gCXpZC8vWCFm7QXDch3Fj3+4aHg/L/ZdoefLVjU1NDG/Knjhf+bpcw9r8Tou5
         ofDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M9elc0PQ+TI8jbg2PmLg+UuOO6GjGx+5PwCXytaA0Wc=;
        b=g3Ta9Si9sKbygUUf8CjLWTznRKy4JGNakVpQRPV4cdztzgqj0jNs/ZSXPDk6jBcPQK
         PCIZiDvrHywpQOAIAQygIZE02LCN5TINcJGqScJd0FkF4QTGyubnjoNRIQCvAkJoQKKz
         0oF3k8/dfyW5cwxMlFko03Ye2q3G063nEUCpGjUHk35PM+iw+cbJOOXcZVV5Utgv/Yi7
         vTPDkBgL6t0hgSg5IzIpycmAyOxymipExmNqj4Ov1VwBS8FUICBWuYSxvMC9ZxnJCfHd
         IysQUcay4MZWdpWNoH7vR+DzLMnnWEfoelXXSEp6Fm9xkAQMNer9pXBGZIGF7JZTzOYj
         MFjA==
X-Gm-Message-State: APjAAAUl3ypVgoFxguKRXHoCSrBSmbTEId0a9F8dKoT4k5jLZGOWscDM
        Lu0Zw1Wm4IGH0y97Ox+Fq2U=
X-Google-Smtp-Source: APXvYqx7PzGgocqiXoAMJo2xgjOlIYUwHli5qhQR5fD8FLxuQPyq/dImXrGmtvQKGt6P85jtFdwlAw==
X-Received: by 2002:a2e:9ac6:: with SMTP id p6mr35542859ljj.100.1560874594123;
        Tue, 18 Jun 2019 09:16:34 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.gmail.com with ESMTPSA id v15sm2273295lfd.53.2019.06.18.09.16.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 09:16:33 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] staging: media: tegra-vde: Manually pack UAPI structures
Date:   Tue, 18 Jun 2019 19:14:56 +0300
Message-Id: <20190618161458.20499-6-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190618161458.20499-1-digetx@gmail.com>
References: <20190618161458.20499-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The __packed macro isn't available in userspace with the kernel headers.
Checkpatch asks to use the macro, which is unwanted in a case of a UAPI
header. There is no much benefit in a tight packing of the structures,
hence let's pack them manually to cleanup things a tad. Note that there
is no old-stable userspace that will suffer from this change, hence it's
fine to change the ABI. In a result also more space is reserved for a
possible future expansion of the UAPI as it was already shown that more
fields will be needed for a later SoC generations.

Suggested-by: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/tegra-vde.c | 13 +++++-
 drivers/staging/media/tegra-vde/uapi.h      | 44 +++++++++++----------
 2 files changed, 34 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/tegra-vde.c b/drivers/staging/media/tegra-vde/tegra-vde.c
index a5020dbf6eef..cc4244da2705 100644
--- a/drivers/staging/media/tegra-vde/tegra-vde.c
+++ b/drivers/staging/media/tegra-vde/tegra-vde.c
@@ -795,7 +795,7 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 {
 	struct device *dev = vde->miscdev.parent;
 	struct tegra_vde_h264_decoder_ctx ctx;
-	struct tegra_vde_h264_frame frames[17];
+	struct tegra_vde_h264_frame *frames;
 	struct tegra_vde_h264_frame __user *frames_user;
 	struct video_frame *dpb_frames;
 	struct dma_buf_attachment *bitstream_data_dmabuf_attachment;
@@ -830,11 +830,17 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 	if (ret)
 		return ret;
 
+	frames = kmalloc_array(ctx.dpb_frames_nb, sizeof(*frames), GFP_KERNEL);
+	if (!frames) {
+		ret = -ENOMEM;
+		goto release_bitstream_dmabuf;
+	}
+
 	dpb_frames = kcalloc(ctx.dpb_frames_nb, sizeof(*dpb_frames),
 			     GFP_KERNEL);
 	if (!dpb_frames) {
 		ret = -ENOMEM;
-		goto release_bitstream_dmabuf;
+		goto free_frames;
 	}
 
 	macroblocks_nb = ctx.pic_width_in_mbs * ctx.pic_height_in_mbs;
@@ -955,6 +961,9 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 free_dpb_frames:
 	kfree(dpb_frames);
 
+free_frames:
+	kfree(frames);
+
 release_bitstream_dmabuf:
 	tegra_vde_detach_and_put_dmabuf(bitstream_data_dmabuf_attachment,
 					bitstream_sgt, DMA_TO_DEVICE);
diff --git a/drivers/staging/media/tegra-vde/uapi.h b/drivers/staging/media/tegra-vde/uapi.h
index dd3e4a8c9f7e..ffb4983e5bb6 100644
--- a/drivers/staging/media/tegra-vde/uapi.h
+++ b/drivers/staging/media/tegra-vde/uapi.h
@@ -21,40 +21,42 @@ struct tegra_vde_h264_frame {
 	__u32 frame_num;
 	__u32 flags;
 
-	__u32 reserved;
-} __attribute__((packed));
+	// Must be zero'ed
+	__u32 reserved[6];
+};
 
 struct tegra_vde_h264_decoder_ctx {
 	__s32 bitstream_data_fd;
 	__u32 bitstream_data_offset;
 
 	__u64 dpb_frames_ptr;
-	__u8  dpb_frames_nb;
-	__u8  dpb_ref_frames_with_earlier_poc_nb;
+	__u32 dpb_frames_nb;
+	__u32 dpb_ref_frames_with_earlier_poc_nb;
 
 	// SPS
-	__u8  baseline_profile;
-	__u8  level_idc;
-	__u8  log2_max_pic_order_cnt_lsb;
-	__u8  log2_max_frame_num;
-	__u8  pic_order_cnt_type;
-	__u8  direct_8x8_inference_flag;
-	__u8  pic_width_in_mbs;
-	__u8  pic_height_in_mbs;
+	__u32 baseline_profile;
+	__u32 level_idc;
+	__u32 log2_max_pic_order_cnt_lsb;
+	__u32 log2_max_frame_num;
+	__u32 pic_order_cnt_type;
+	__u32 direct_8x8_inference_flag;
+	__u32 pic_width_in_mbs;
+	__u32 pic_height_in_mbs;
 
 	// PPS
-	__u8  pic_init_qp;
-	__u8  deblocking_filter_control_present_flag;
-	__u8  constrained_intra_pred_flag;
-	__u8  chroma_qp_index_offset;
-	__u8  pic_order_present_flag;
+	__u32 pic_init_qp;
+	__u32 deblocking_filter_control_present_flag;
+	__u32 constrained_intra_pred_flag;
+	__u32 chroma_qp_index_offset;
+	__u32 pic_order_present_flag;
 
 	// Slice header
-	__u8  num_ref_idx_l0_active_minus1;
-	__u8  num_ref_idx_l1_active_minus1;
+	__u32 num_ref_idx_l0_active_minus1;
+	__u32 num_ref_idx_l1_active_minus1;
 
-	__u32 reserved;
-} __attribute__((packed));
+	// Must be zero'ed
+	__u32 reserved[11];
+};
 
 #define VDE_IOCTL_BASE			('v' + 0x20)
 
-- 
2.22.0

