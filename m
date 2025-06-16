Return-Path: <linux-media+bounces-34969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F7AADB57C
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 17:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 897157AACFF
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E58128136C;
	Mon, 16 Jun 2025 15:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lo8vdmQm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D803B260587
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087764; cv=none; b=JpZa044edS2YW83znATByusrYK+SSHnBHd2EtPTUnlaNcyOZOu5QLAg42BKkfF3KdOiWbS5UcDYkExZmzuV4YeULC7j0JqLNCeLWSE9CfehMGkeYh5cwWWNQ9vyGbZvE4sxwZzLvVrcrSDPBqRiB2jAsSqXKTj8jcapHzNLBKZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087764; c=relaxed/simple;
	bh=6eIWkWuKOIsBSFSU81VrPxHUw8nDWPxgWAtBDL7zshI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mhHx+3WNeR8k6RIy2FXs7HGd3qe1mK/hcqPvItGsmiSq/DmUTKAhTykPDsxffmmtPyjzriWLPAP7piDD+Ui4gPhnvZWeTCX1PfFurYAmWAuoec5lKNkt5Hd4oCOwFsXW+zW0Nhb28ytCbe8zPCi1PcPt4mC/O3+bciFW9PQ2fG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lo8vdmQm; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54e98f73850so4466817e87.1
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 08:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087761; x=1750692561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CXcagyWgdxPaOdyolF8VUudFwWviLYrCDNyLuJgMIK8=;
        b=lo8vdmQmQIuBU+rG6oVMZ3Paswhb7vfDWvcnzuQ9VQgwSm73+wZs6xsP9lUDT8jxCS
         0bfa0mtN3r+4xz60vJS+YuAUcEU+EiAboktTxBD/urpXRUp/uuplWUYa3h4cZa1h31W+
         QyjUb/VOSXjBPjtKF+P6xvxtHE/o7ZW0TLuxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087761; x=1750692561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXcagyWgdxPaOdyolF8VUudFwWviLYrCDNyLuJgMIK8=;
        b=iYqxphXbWITqMEqzWC7NdZqLyRwiODrRM/4FaNta4gEyM6BttJ51YwBkj2k7D34s0F
         G97byKJUC2C3YXK92sVeKEa4/tQ3W6Ufoo6HZgV7llncTJ/6HWNdF6caabqiZy2HQ4zN
         Z0C10jaWFxHd5u9myeo9EevQVEXbe36/O+F6oEaNYmVm35BXppwFMalL6+SMoWIcFDYA
         xZZTjqVCX8ZkZKm2trAJvCYCvlK4yM/1mAZoUe1RdNbJsn2pYIYc1SlSGkGWx4G9xvNx
         nZGntTpLUBZ2zX1+HsVqFLcDK5ve33gPsjywyk+v10hIGZ5xd4C68DW9VT31aABDrFUF
         G9pQ==
X-Gm-Message-State: AOJu0Ywli+FhWE7hwXyoQfjO6EINVACYkk+d2UY7WW7YfGowFVQZttZQ
	0yZc/MxWUmuSOpVZb/379cvOisN/FUB624D/LyIwpB65F91OQrh1l4nVJxuo+bdSqg==
X-Gm-Gg: ASbGncu0URRiNALf7oo1SDh+m1UViDPTbadOj1kIoV6s239MK6vJfTKHNo+ncdAG6u2
	UFq30LBF0g6IYTcYMdTNfVZQbif+v1TgePpkrEjsQ2l/Z081Vma7YXk9eA7Og5cUMCvuFvOoCjh
	1MHGT0smWDSb8ztFNxfDMEdTZ/1pLMAKCr22isTHRr2XY+53+rEK740bf7ty9wtCAfh9onqJj7U
	mtv51eHzLl+MwUHCqb49UZ1mNMWSU1GwX6jXLHhf8x6vXNKVQYx4N3UfuMjFpEuvtGk5AFUbc1r
	q1jVCpIGKxUR1+d9lu4cQIT7Fyk6+pxQV9dN3qVEuioUzB14OLquVoxb3DWdnLdH1paq0jls3+V
	UYV+2uSbQx4Wp/iOAavKMMWeoxmEfYdt4bmyCxaPomw==
X-Google-Smtp-Source: AGHT+IH1S4ALM2gMeb/svq1KORr41xuNr85Hs8gIC4o8fbK5Xpu5PFMKGkdjJyiQOAmowu8Unfeo7w==
X-Received: by 2002:a05:6512:1114:b0:553:510d:f46b with SMTP id 2adb3069b0e04-553b6f0f99bmr2569990e87.32.1750087760767;
        Mon, 16 Jun 2025 08:29:20 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11ff5dsm1568020e87.31.2025.06.16.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:29:20 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 15:29:18 +0000
Subject: [PATCH v7 5/5] media: venus: vdec: Make the range of us_per_frame
 explicit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-test-v7-5-b8c0f98494fa@chromium.org>
References: <20250616-test-v7-0-b8c0f98494fa@chromium.org>
In-Reply-To: <20250616-test-v7-0-b8c0f98494fa@chromium.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Fps bigger than 0.000232829 fps, this fits in a 32 bit us_per_frame.
There is no need to do a 64 bit division here.
Also, the driver only works with whole fps.

Found by cocci:
drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5615-rb5
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 7d6612234d18a49573dc502d48ee61a900b63194..6042eb1e8705196b754dffc16bdb714378bb4cd4 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -484,8 +484,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	do_div(us_per_frame, timeperframe->denominator);
 
 	us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
+	fps = USEC_PER_SEC / (u32)us_per_frame;
 	fps = min(VENUS_MAX_FPS, fps);
 
 	inst->fps = fps;

-- 
2.50.0.rc1.591.g9c95f17f64-goog


