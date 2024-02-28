Return-Path: <linux-media+bounces-6102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2655486B468
	for <lists+linux-media@lfdr.de>; Wed, 28 Feb 2024 17:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B63931F23223
	for <lists+linux-media@lfdr.de>; Wed, 28 Feb 2024 16:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC06E3FBBB;
	Wed, 28 Feb 2024 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="F1PDbmDH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C913FBB8
	for <linux-media@vger.kernel.org>; Wed, 28 Feb 2024 16:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709136777; cv=none; b=uV+2MRTrDmcdWgPgy8E/UzEBNTeSs4t/s5hypcxiSprMhUJommlbYkPMQXNzTWoQr9v6NhVlojWDOAcfOy3Vp/tkuirNOvRAg+mbOf821/5D8nHwfT1fzVAGyHzB65t4X8OU07GpXJixMldmfmS9NuuEBpbUFb+Qv85ULP6cE4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709136777; c=relaxed/simple;
	bh=u7uFXnDrICcdk8xlJjFPen//WVVlF6lAfMWp3oCwzrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nW8vDjdItKXnfMbD1IMZRkRTVrTqTDrF1RDkwD+mrMWqkDX3QKnG2BMmSt290nbLRXGT/CLgWveseBhBYSJ9rPtnQ2ycO3BmSlIUo/58zwIT2usqbrPYG7iAJ2NbEUFEpdkMFnnpDz366rBBI7oRHpddWYqxZZdPQK1rupmC6RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=F1PDbmDH; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d2ab9c5e83so19706981fa.2
        for <linux-media@vger.kernel.org>; Wed, 28 Feb 2024 08:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709136772; x=1709741572; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/+mYwQG2fiJMD7iBIPPcaK1rFS1aZsi0yXF5dIj9kc=;
        b=F1PDbmDHzqrLbcTb+0mGZx05DLKpzy6pqdgaTu1MopxNeNm6MdqbGS5T53DuGQD9Mu
         2m73vDI5VNVyVudf/ZgAF4NrOoDNVDemGbAcBlHzY+Mwq9+tA/H6IcIJnIZcXQG4xKgC
         aAqmb409HblK6wc2WTL/zU3rnxsZQtkrIQz/2XKLyVA98OSdrav83sMZ9YXCvMRWzqxw
         KROzuYkGvfTI3djoXx/I/HL+xplnLVns6wQIq4Ba7fx0247PW+/CXOuKs+DxzLFbsZFz
         mtymoWWxLHA0JvHMBZfSedh4pjQr+/7ZcwADDgxRON1qmdFHZJ3uUsWsauYJp0v0GpWx
         lM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709136772; x=1709741572;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/+mYwQG2fiJMD7iBIPPcaK1rFS1aZsi0yXF5dIj9kc=;
        b=GzhFXn8u2v/QykSwl32mPicFUNeyxvSyVqsM2ijJemyHPDZ66xhMEKFhFm9X0r/8b3
         IBcuK2bIS68PNha04p6lLz3OAnJYEnnK7Y1FgLf5l9wPxRmQi1TledislbOF3JDgegdW
         1WE/O8mqjnziJPqY3T83W4dihmDfhX8DiDkjDp8em4VX60id+yPlAI5gwAymkR+gPCa3
         z8qib5uVospPKHCd3WVG/uBWyuhQNxD2NHSdcOQVD3cNNXrAzy8WkjazslUrrfGNdmc+
         jEZrua6SIav1s4XQY3f7fVkvc/XaXrRLkgHg8K6asU+PmVBGa6xsXS20bAQqZvxtRQCW
         7ifg==
X-Forwarded-Encrypted: i=1; AJvYcCUczhXOZljqRX4itiSuglaZSpQcEdLvbeP4xsBU0HXwhL3vxQRJCEIldow0umttVToKBmUovEkV7l9e32qwYMPAQUTaustcct/AgaE=
X-Gm-Message-State: AOJu0YwrygSuuiCPMNY95q5/awXocCxypfmQYvdDRVtcWpjdU/efWcac
	R1xhAmhXhcSQhkLgtn+0ag+5mT7aBXlMAH91Jkb/RobIViPcTjhaGvUP0xH2Dws=
X-Google-Smtp-Source: AGHT+IHBjLzG7UAB1n8lEYV3PN0DccuLoMlritaDubua3q9huXs0XinGCKELgA5VpATwkGynNi8W2Q==
X-Received: by 2002:a05:6512:ba7:b0:512:bdd3:153c with SMTP id b39-20020a0565120ba700b00512bdd3153cmr144237lfv.18.1709136771948;
        Wed, 28 Feb 2024 08:12:51 -0800 (PST)
Received: from [192.168.1.20] ([2a01:cb19:95ba:5000:d6dd:417f:52ac:335b])
        by smtp.gmail.com with ESMTPSA id y16-20020a05600c365000b00412656ba919sm2444276wmq.20.2024.02.28.08.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 08:12:50 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date: Wed, 28 Feb 2024 17:12:41 +0100
Subject: [PATCH] media: chips-media: wave5: Call v4l2_m2m_job_finish() in
 job_abort()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240228-wave5-fix-abort-v1-1-7482b9316867@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAHhb32UC/x2MSQqAMAwAvyI5G2iDYvEr4qFL1FxUWlGh9O8Wj
 8MwkyFxFE4wNhki35Lk2CvotgG/2X1llFAZSFGniAw+9uYeF3nRuiNeuAwUqDdGexegVmfkKv/
 jNJfyAeappsRhAAAA
To: Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guillaume La Roque <glaroque@baylibre.com>, 
 Brandon Brnich <b-brnich@ti.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Robert Beckett <bob.beckett@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.4-dev-6aa5d

When aborting a stream, it's possible that v4l2_m2m_cancel_job()
remains stuck:

[ 3498.490038][    T1] sysrq: Show Blocked State
[ 3498.511754][    T1] task:V4L2DecodeCompo state:D stack:12480 pid:2387  ppid:1      flags:0x04000809
[ 3498.521153][    T1] Call trace:
[ 3498.524333][    T1]  __switch_to+0x174/0x338
[ 3498.528611][    T1]  __schedule+0x5ec/0x9cc
[ 3498.532795][    T1]  schedule+0x84/0xf0
[ 3498.536630][    T1]  v4l2_m2m_cancel_job+0x118/0x194
[ 3498.541595][    T1]  v4l2_m2m_streamoff+0x34/0x13c
[ 3498.546384][    T1]  v4l2_m2m_ioctl_streamoff+0x20/0x30
[ 3498.551607][    T1]  v4l_streamoff+0x44/0x54
[ 3498.555877][    T1]  __video_do_ioctl+0x388/0x4dc
[ 3498.560580][    T1]  video_usercopy+0x618/0xa0c
[ 3498.565109][    T1]  video_ioctl2+0x20/0x30
[ 3498.569292][    T1]  v4l2_ioctl+0x74/0x8c
[ 3498.573300][    T1]  __arm64_sys_ioctl+0xb0/0xec
[ 3498.577918][    T1]  invoke_syscall+0x60/0x124
[ 3498.582368][    T1]  el0_svc_common+0x90/0xfc
[ 3498.586724][    T1]  do_el0_svc+0x34/0xb8
[ 3498.590733][    T1]  el0_svc+0x2c/0xa4
[ 3498.594480][    T1]  el0t_64_sync_handler+0x68/0xb4
[ 3498.599354][    T1]  el0t_64_sync+0x1a4/0x1a8
[ 3498.603832][    T1] sysrq: Kill All Tasks

According to job_abort() documentation from v4l2_m2m_ops:

  After the driver performs the necessary steps, it has to call
  v4l2_m2m_job_finish() or v4l2_m2m_buf_done_and_job_finish() as
  if the transaction ended normally.

This is not done in wave5_vpu_dec_job_abort(). Neither switch_state() nor
wave5_vpu_dec_set_eos_on_firmware() does this.

Add the missing call to fix the v4l2_m2m_cancel_job() hangs.

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
This has been tested on the AM62Px SK EVM using Android 14.
See:
    https://www.ti.com/tool/PROCESSOR-SDK-AM62P

Note: while this is has not been tested on an upstream linux tree, I
believe the fix is still valid for mainline and I would like to get
some feedback on it.

Thank you in advance for your time.
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index ef227af72348..b03e3633a1bc 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1715,6 +1715,7 @@ static void wave5_vpu_dec_device_run(void *priv)
 static void wave5_vpu_dec_job_abort(void *priv)
 {
 	struct vpu_instance *inst = priv;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
 	int ret;
 
 	ret = switch_state(inst, VPU_INST_STATE_STOP);
@@ -1725,6 +1726,8 @@ static void wave5_vpu_dec_job_abort(void *priv)
 	if (ret)
 		dev_warn(inst->dev->dev,
 			 "Setting EOS for the bitstream, fail: %d\n", ret);
+
+	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 }
 
 static int wave5_vpu_dec_job_ready(void *priv)

---
base-commit: 8c64f4cdf4e6cc5682c52523713af8c39c94e6d5
change-id: 20240228-wave5-fix-abort-f72d25881cbd

Best regards,
-- 
Mattijs Korpershoek <mkorpershoek@baylibre.com>


