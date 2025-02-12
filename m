Return-Path: <linux-media+bounces-26028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D67DBA31A8A
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 01:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 836B0167608
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 00:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5F68F77;
	Wed, 12 Feb 2025 00:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KaFcib7l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655781876
	for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 00:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739320514; cv=none; b=RF4b3srjlFLCmGq5/sy66N37UhFwylK4wN2TLpVBxaLE7fY8InH1dCFGJXlcUx9mvCQm+/EHl/IWONLv/EmdQw3P+/go+CiQpuVltDf9RDT6lqXqG3NjDkeUZO1kRCyBBRqsAx+CdBh3kKj0BTXh8CobVx2BPPnYdbU901edSMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739320514; c=relaxed/simple;
	bh=/zoYSnZhploCCxHOu5+795pfizcOWqSCa+DKwvVdtE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=laBJtT6laz/K5w171cZIAJWORhlf9MiVetsnWe9t1VdtDfI5xOH8g3zoVON6w/YXc9Wh1tahEBtcuuqqGrQTkEyrWQDxMzy+V3v3oXTc+9sc5ZlOR5EeAQcKdF2AQuzi6WLDqbeSX4Qf3gvJOCMtinQYrUj+64LlOwSEznJ3Lmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KaFcib7l; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f6022c2c3so5019865ad.0
        for <linux-media@vger.kernel.org>; Tue, 11 Feb 2025 16:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739320512; x=1739925312; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mZNbqOyLMkR4zYGETdYI1Ds8jvtDMMy7KcjMP1dhBIk=;
        b=KaFcib7l3JP1dFKeUUGOXPV0NZQML1/16GFWQin+WN7dR/afG92y4BIzoXFC8L1M03
         D+jLpEqcnN6AZQLgO7kUzWeS5Oxi4FJ5V6QF+qXZgrERUcZNQ88BpLNz05I8DH2RHfi6
         5BSw5ffKEipoJHoEsBNLig+p8FncEsIXGQv+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739320512; x=1739925312;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZNbqOyLMkR4zYGETdYI1Ds8jvtDMMy7KcjMP1dhBIk=;
        b=k0qcwypdX0z8bsLOBOkE2AfO9GIwzmScK3Q08pCMHRb1OLNJQDZMr0/hHS/Cs2n12y
         EG1E0uSqLpgUeXojc5WcdSfE68S80dLe0bFedjy1NTcTlvafTqJV2UhPEHG42YkLLbFf
         O3MxSWyCoVz8DUntpl3brFEU08Nc2jYl2Nf4ivZVP44wiDEOphj3sMse/hXooxDgyBl8
         A0hESTctYXTfT1HcGy9QCVamVFcrBqoqugTN/cFF7lkn7enepoGKS8n5ZwYRemFIvENo
         +GPDHY08iiFSNtfQe2Q6oTVxXz03m4B4QY7I1YI73vCHb8d6gLKnX7dlW7VcftvM5EfU
         OhjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6+a1wStRAKC4HDA7zFADpsGozdfj3p7ZArNLX6UdeIHNiLN9bz2fVQj4shQVvgEPsg2SaM9bfXQLO4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+hhRcJaMJFf8K0Oe9UYTXv6t+t9W2yvEC6W2B5lt4RvppEOe2
	1POggka6MuE2mouXmgwbMs8qXcySsi3dccqqOG4705ACvtZpgggAGvpeH4AM3Q==
X-Gm-Gg: ASbGncv+VcRlN+XfozQeqOEndoQkg65EPzxFlo9s4aubKpUYaBgn683i8k1UV0eEzHI
	4oVcb1SlAVhSJgZ4DsmVfibGdZ2wcr0QuTS+VNUHeIw0kntZ1XeatNsnV0NZ2JQZTDzVLoAJ0/k
	tMwMph6FVCIwUn8xOTBc5M3OYpdeOvUmlk1AXIbPMDcJFslBx3DX9LIGdMdC5EU5tVr2njpp6OH
	oY62q0HqAot8MCSa/jC8/RGG7cTKdkCkLx+LmS5orJ0bSK2X3GYVJwYujdT29fQox+ewq2U5Zfj
	rFNBFpl5ezbS7qT06AVocAcAZ1fL22lKDVZ1SKMKDIBoFIbAFds4jCKZrmFm2q8gPFRNQrkV
X-Google-Smtp-Source: AGHT+IGU2vBf6I17uMlZ6vPzIppLSPDMm3Mc2t33rkKE8ywv2pPmz0SDcC2eFj6qRDS96L9Z49Rppg==
X-Received: by 2002:a17:90b:510a:b0:2fa:2c61:3e5a with SMTP id 98e67ed59e1d1-2faa0913af0mr8652088a91.10.1739320512530;
        Tue, 11 Feb 2025 16:35:12 -0800 (PST)
Received: from nhebert9.pdx.corp.google.com ([2a00:79e0:2e13:6:34c2:323:b5a8:3074])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf999b639sm165958a91.38.2025.02.11.16.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:35:12 -0800 (PST)
From: Nathan Hebert <nhebert@chromium.org>
Date: Tue, 11 Feb 2025 16:34:51 -0800
Subject: [PATCH] media: mediatek: vcodec: Enable HEVC main still picture
 decode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-enable_hevc_still_picture-v1-1-0c06c0c9add2@chromium.org>
X-B4-Tracking: v=1; b=H4sIAKrsq2cC/x3MWwqDMBBG4a3IPDeQjHihWxEJJv7qQEglsVIQ9
 27o4/dwzkUZSZDpXV2UcEqWTywwr4r8NsUVSuZiYs2NZmMU4uQC7IbT23xICHYXf3wTFLeubuB
 0z52m0u8Ji/z+72G87wcNGPdLawAAAA==
To: Yunfei Dong <yunfei.dong@mediatek.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Nathan Hebert <nhebert@chromium.org>
X-Mailer: b4 0.13.0

Mediatek devices that support HEVC also support the main still picture
profile, but today, the main still picture profile is excluded.

This removes the skip mask for HEVC, and enables the main still
picture profile decoding.

Signed-off-by: Nathan Hebert <nhebert@chromium.org>
---
On Mediatek devices that support HEVC decoding, HEVC Main Still Picture
profile is also supported by the SOC and firmware. However, this
capability is turned off in the vcodec driver.

This removes the code that disables HEVC Main Still Picture profile
decoding. Validation of the decoder has been done via V4L2-backed
Android CTS tests on an MT8196 device.
---
 .../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c   | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index afa224da0f41..d873159b9b30 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -152,8 +152,6 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
 			.id = V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
 			.def = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
 			.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
-			.menu_skip_mask =
-				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
 		},
 		.codec_type = V4L2_PIX_FMT_HEVC_SLICE,
 	},

---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250211-enable_hevc_still_picture-26b35eb08270

Best regards,
-- 
Nathan Hebert <nhebert@chromium.org>


