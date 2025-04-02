Return-Path: <linux-media+bounces-29240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA45A79040
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 15:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A1271722F1
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 13:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3122D23A9A3;
	Wed,  2 Apr 2025 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFG7Op67"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2548F43AA4;
	Wed,  2 Apr 2025 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743601810; cv=none; b=FXDPdlXeQNVXeUMdp1m5Ra4c3oP6CvfBSpcjgyT2iMsquR8roXTm+lI4uCP6hr2XccJGJ2GW6Yo1P5sNkyVj7jShLqN9h3fLGFJnE8V1QQqY3LHDRReDKekcgnB8WVLDgphwTUH38/TGQTEKBE9SJ1jJf7TV8u2qReVkmFe+YRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743601810; c=relaxed/simple;
	bh=khdQRjKa1cJsLk+at6y8zDWPs5nydHHfCistC3DVK/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D4JG1B+h9e8VqS0MryLjXmeT/C6ibCvwvlfgFVhH4FTrU8u4LicRgKtc9A7SRuOVqC246plCzGGGW9KAMcRyp+y/Hna/HfBGylKxJqw3QnyaBTIO1yfgsFPVbN7jeUvG7cuGqEM7O1N66sccPWO96YBJ+g0beK/hWzp6EDq3LAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFG7Op67; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-47662449055so35340911cf.1;
        Wed, 02 Apr 2025 06:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743601808; x=1744206608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UpIRlo9dkfMDRtvBdGX/Xo5MPiwW/uzBzcuJlURA8sM=;
        b=kFG7Op67of3JC5g93uxYdcBXpotzEPzFynlMmmD8Q2TPs/yQnKllmXm8u448UwP0RD
         RMvvrpFKPdJu3UzIubXSfa1+jRmx/f76Ko6mk5wMFTvDCIRhKizCM4Ptbr3h8a3PQpYS
         tK4tkULyK9B8luYCZp9v1xnMwQSOGKnnx3FpC/piKG31bU7Q9ifgIOqecBy8Lv6EJPYv
         wyqlaGV7r07wz4Z9Gzaay9P+mrUjrwEB5w4uUDmjDP4kFss7QQ/UgomZtby9xLBBsNhD
         BenJlQeH6LhC33HBdyYCdlQuQkoVNRkHVvKPPWLm/DQxAfbDwggywMjuyvbzO5bbICoN
         ehBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743601808; x=1744206608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpIRlo9dkfMDRtvBdGX/Xo5MPiwW/uzBzcuJlURA8sM=;
        b=oCEbUqiwt3eHJHTutWs0lSJ8A6P+adQFOWmPdiEr+8HBFRQDKB+Pv+OOFIbCftvaow
         WIsuvsxL82ZGOaQJdU7jzmilb/+pdaMkwgYzzyiiNztC7CxRSlpv6P7eHlPc8mlkj7dN
         v+A1DPxCBROY56TJB0MAlfgV2hxMQeTQ3fOx7BVSrdHXgir4qHUH/7KyC21sETq02GmU
         5Scw/JODtnRDsWFvqRIwHbhfcPiaBVSV/kn5kPUl6LI6ubP+lTm/poJXLY/u0noNImtY
         BG/WhtyjeGNp6EbEyoxGzdI4aOtWGlyCf70hVcf6jOXL7dShMtk57A61cCryQ+BMf2ZK
         lReg==
X-Forwarded-Encrypted: i=1; AJvYcCXcDOQirFuzPTzeSw/wl0BcwMWtZD/8WLuomDbWODnVt4LHN6EF6hJGcHxTScmM24va1yR6pBWlsncx8ss=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9zkMPN0cPEQ3zo2U7Kr33QhiopED2zU5Yr04l2cHG8XwVmrN9
	1tMNj26ZVr3C7ILGkr2ID4a3B7DOLxWqyzy5UN1WTk+oSIWRw8vFdbLoRXRpZD8=
X-Gm-Gg: ASbGnctpj4VxB8yRtWjJCZ2RXrmU15gvR7l6N3tIhVp8khO/l9ng8v2E3oS1oUZqBNw
	rblZcKm8dhf7dl2UB3hgbTaxzo/vVd6wRaYfd+r805+/7UzBs7fMx6pgI2Niy+gLFC7FOYVZF1G
	361cOJ1Ar9kbHTVva9PLMFliMkDjbBtJpiU01JMhRvLXaV4mGb8Yq+W/7TmjaULJDIq2gEGyoG4
	nYkxmVdcLm4lkHLoPMulujhoKcASbcU3jJspn99TnYeWVkdAqSusbxsBsl3l9vz20EA2dFNUJyw
	smIZc2QAryK8Q415Qy3OOSN4EPo1fgRhEF/oMNAIRzrVLy3scx+oYAZ99js8tGkejE5lLfLNXWv
	cTC9pm1bJCULPCOWqAVEKK8k=
X-Google-Smtp-Source: AGHT+IGO8ahOi/G3jO/2cQgbGPiOCEtcsk4bHdTRa6rUhoN3n0aVnWghLd31gahPKyxhXN71T2kuCw==
X-Received: by 2002:a05:6214:dab:b0:6e8:f88f:b96b with SMTP id 6a1803df08f44-6eed5f616e6mr292528906d6.9.1743601807617;
        Wed, 02 Apr 2025 06:50:07 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec97bc7besm74799826d6.122.2025.04.02.06.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 06:50:07 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: linux-media@vger.kernel.org
Cc: andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	gshahrouzi@gmail.com
Subject: [PATCH v2] staging: media: Fix indentation to use tabs instead of spaces
Date: Wed,  2 Apr 2025 09:50:01 -0400
Message-ID: <20250402135001.12475-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace spaces with tab to comply with kernel coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
Changes in v2:
	- Resend using git send-email to fix formatting issues in email body.
---
 .../media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index ece5e3da34ee..127f12ba2214 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -114,7 +114,7 @@ configure_dma(
 }
 
 int ia_css_vf_configure(const struct ia_css_binary *binary,
-		        const struct ia_css_frame_info *out_info,
+			const struct ia_css_frame_info *out_info,
 			struct ia_css_frame_info *vf_info,
 			unsigned int *downscale_log2)
 {
-- 
2.43.0


