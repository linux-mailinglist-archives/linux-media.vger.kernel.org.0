Return-Path: <linux-media+bounces-1349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34097FD465
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 11:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AFFDB20AA6
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 10:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D969B1B28F;
	Wed, 29 Nov 2023 10:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RxPjpMoY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 606761BD3
	for <linux-media@vger.kernel.org>; Wed, 29 Nov 2023 02:37:51 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40b4f6006d5so11759295e9.1
        for <linux-media@vger.kernel.org>; Wed, 29 Nov 2023 02:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701254270; x=1701859070; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s7sxeOizxeeQP9IDj8gb2CduxEiKvpNt2VF3HpmNNvU=;
        b=RxPjpMoYQbjorrjk/dGyZpVwvst4oDzUJtcI92E9d3wwDXzhYFaPhYt5X2ZLq6xU8m
         5v8Q/LNKJZKb/PMGLYNfQQWbew+2EflKdCtA2MHkmcW7BA0dx1A6BLcw4Q7XtI59oDzl
         nZDCSFsrIpLdBfFjyAPNzghOhwOYHekD6QmnLFHZ4F3yAfwzSnheUm2n9kEaYFAqh7Cg
         /+uRWupLXv2t4TPyY7K/jN9szBGKP//uVIgAwKliiwMhiG6t3L6sHi+dY1Njs0L2t+IW
         /x3c0FyeowP2NAneaJ4dAUuBnwYjfNm75ZEPEhtGAa19n1eFrX4xY2tPJUgZwsJY65WC
         67FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701254270; x=1701859070;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7sxeOizxeeQP9IDj8gb2CduxEiKvpNt2VF3HpmNNvU=;
        b=A4IuDbjNifKMKKI2jt1iEGt0ST0wtluK2z8eOCYZLTdk/84DRoQX6GkuSey5+wD+i4
         eYkcc1vAzjwrM1j9QvX5avMez0qi3JaW+0/zqU5sBn6B8r6FOpbSD9cCuueZOfXc6CzA
         +Qi9C6DoDocHaEOpc+LdD7BdxKbu8CGufZVvP1U0NpU5nN6m/2OUqY1g9g3HAZu6Cf2n
         bZhhGjwI4RYUUSJGyjIVFZJ02s8VT2t8gE1NKGf0nOXjZ4FCQipM+/9WtsrU7jQecomQ
         BudnsqNo15XROgDvEQXAi614C9QZAWoH0pCOMSu7J6C6ouTaJxB8DeFV2oa3jOZoLugt
         hyKw==
X-Gm-Message-State: AOJu0YynIqt5duXXDIDALy5798BTNUeyALDpkvbqx8yuLm+VRtC255m5
	4pYKDdHcpXx3UTnI9BkVSyfwCGzlCHxyAf31JQM=
X-Google-Smtp-Source: AGHT+IH0y2oAKRYEHw284HB6475mCMq0AgQJqvJZxc8ce/C8PK+m9gn3Qf0tRYCIbHTY6hkfvPST0Q==
X-Received: by 2002:a05:600c:a0b:b0:40b:3643:48bf with SMTP id z11-20020a05600c0a0b00b0040b364348bfmr7870901wmp.17.1701254269661;
        Wed, 29 Nov 2023 02:37:49 -0800 (PST)
Received: from [192.168.1.20] ([2a01:cb19:95ba:5000:d6dd:417f:52ac:335b])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c1c9200b0040b2976eb02sm1700502wms.10.2023.11.29.02.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 02:37:49 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date: Wed, 29 Nov 2023 11:37:40 +0100
Subject: [PATCH] media: chips-media: wave5: fix panic on decoding
 DECODED_IDX_FLAG_SKIP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-wave5-panic-v1-1-e0fb5a1a8af4@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAHMUZ2UC/x3MQQqAIBBA0avErBN0LKiuEi1Ex5qNiYIF4t2Tl
 m/xf4VMiSnDNlRIVDjzHTrUOIC9TDhJsOsGlKiVwlU8ptAsoglsxYJk0GkpJ/TQi5jI8/vf9qO
 1D4mDPJldAAAA
To: Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guillaume La Roque <glaroque@baylibre.com>, 
 Brandon Brnich <b-brnich@ti.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
X-Mailer: b4 0.12.4-dev-9f269

The display frame region information received from the vpu also
contains the frame display index: info->index_frame_display.

This index, being a s32, can be negative when a skip option is passed.
In that case, its value is DECODED_IDX_FLAG_SKIP (-2).

When disp_idx == -2, the following exception occurs:

[ 1530.782246][ T1900] Hardware name: Texas Instruments AM62P5 SK (DT)
[ 1530.788501][ T1900] pstate: a0400005 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[ 1530.796144][ T1900] pc : wave5_vpu_dec_get_output_info+0x300/0x308 [wave5]
[ 1530.803060][ T1900] lr : wave5_vpu_dec_get_output_info+0x80/0x308 [wave5]
[ 1530.809873][ T1900] sp : ffffffc00b85bc00
[ 1530.813872][ T1900] x29: ffffffc00b85bc00 x28: 0000000000000000 x27: 0000000000000001
[ 1530.821695][ T1900] x26: 00000000fffffffd x25: 00000000ffffffff x24: ffffff8812820000
[ 1530.829516][ T1900] x23: ffffff88199f7840 x22: ffffff8873f5e000 x21: ffffffc00b85bc58
[ 1530.837336][ T1900] x20: 0000000000000000 x19: ffffff88199f7920 x18: ffffffc00a899030
[ 1530.845156][ T1900] x17: 00000000529c6ef0 x16: 00000000529c6ef0 x15: 0000000000198487
[ 1530.852975][ T1900] x14: ffffffc009f2b650 x13: 0000000000058016 x12: 0000000005000000
[ 1530.860795][ T1900] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
[ 1530.868615][ T1900] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000004086
[ 1530.876434][ T1900] x5 : 0000000000000001 x4 : ffffffc001454b94 x3 : ffffffc001454d94
[ 1530.884256][ T1900] x2 : ffffffc00b8201d0 x1 : 0000000000000020 x0 : 0000000000000000
[ 1530.892087][ T1900] Call trace:
[ 1530.895225][ T1900]  wave5_vpu_dec_get_output_info+0x300/0x308 [wave5]
[ 1530.901788][ T1900]  wave5_vpu_dec_finish_decode+0x6c/0x3dc [wave5]
[ 1530.908081][ T1900]  wave5_vpu_irq_thread+0x140/0x168 [wave5]
[ 1530.913856][ T1900]  irq_thread_fn+0x44/0xa4
[ 1530.918154][ T1900]  irq_thread+0x15c/0x288
[ 1530.922330][ T1900]  kthread+0x104/0x1d4
[ 1530.926247][ T1900]  ret_from_fork+0x10/0x20
[ 1530.930520][ T1900] Code: 2a1f03ea 2a1f03eb 35ffef2c 17ffff74 (d42aa240)
[ 1530.937296][ T1900] ---[ end trace 0000000000000000 ]---
[ 1530.942596][ T1900] Kernel panic - not syncing: BRK handler: Fatal exception
[ 1530.949629][ T1900] SMP: stopping secondary CPUs
[ 1530.954244][ T1900] Kernel Offset: disabled
[ 1530.958415][ T1900] CPU features: 0x00,00000000,00800184,0000421b
[ 1530.964496][ T1900] Memory Limit: none

Move the disp_info assignment after testing that the index is positive
to avoid the exception.

Fixes: 45d1a2b93277 ("media: chips-media: wave5: Add vpuapi layer")
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index 86b3993722db..1a3efb638dde 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -508,8 +508,8 @@ int wave5_vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_output_i
 	info->rc_decoded = rect_info;
 
 	disp_idx = info->index_frame_display;
-	disp_info = &p_dec_info->dec_out_info[disp_idx];
 	if (info->index_frame_display >= 0 && info->index_frame_display < WAVE5_MAX_FBS) {
+		disp_info = &p_dec_info->dec_out_info[disp_idx];
 		if (info->index_frame_display != info->index_frame_decoded) {
 			/*
 			 * when index_frame_decoded < 0, and index_frame_display >= 0

---
base-commit: a00b3f296eac3d43328615c3113e1a74143fc67a
change-id: 20231129-wave5-panic-82ea2d30042f

Best regards,
-- 
Mattijs Korpershoek <mkorpershoek@baylibre.com>


