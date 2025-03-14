Return-Path: <linux-media+bounces-28237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B41A614DF
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8B381B63760
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DD7202994;
	Fri, 14 Mar 2025 15:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHFBprcQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0811202968;
	Fri, 14 Mar 2025 15:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966187; cv=none; b=jfgP46J/Bdh0L/sXAmvxdiZaKhNREcG0eHUmbllp9OtQSkJiyKkZdfCTuOTCly1GwC0zbUQgt1CM8KIbomx7EzTuUWEg5WynEZRGsAcdSeSAByFsp5LuNprKab6t4cY4qOTh0sqZkvgD9wB/psg2JwnHDcFZyRotvk15GcglRA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966187; c=relaxed/simple;
	bh=rHNB3cncIFXRVXjuxgfdKYQlC0Tsam7anJFpLJEfQPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DgMk3VbXkv5dkUbk6ut17bakXw6RnNobm48dR43oSCVyXbpe99l3UvvrCP+NOzDco+mHrxh+amf/Ny83RTeaZ/RvZygtdM4/TS6Amt7su+TZRi1KQVscWKyv63cvPcaK48kGyTBbrN6NrOdV6PHlrz26X5oIX2125w8K48yIzPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHFBprcQ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30c461a45f8so13562681fa.1;
        Fri, 14 Mar 2025 08:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741966183; x=1742570983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MPyk6XcUmnWugQP4HxO4j5PfsjDj3sqCpKeOAvSBxB8=;
        b=PHFBprcQifHp7Si/G5srN0uoGFlo8CvthZl5HA6kDHjMPe03wLutV4cMdOLGB1206s
         S+7EIg1QBMo92uqoYrMDbb6QqtEljkT4XYyGx6qlhbxlD+LJbJZoQk5QgRyToII/wTwW
         KosG/aKeQEtV6X0jaCmrGOMea0zPQ+Xxl5ZCqbXC7WyHw9O2izvoXMNOxBzOIG/0fgLo
         Rvxl692qiitAL7vEtS2Oux9qNmP7yFb9UaMnqOpLqPa8ntOFApAoaZzkPOeRCvC8/PEN
         43Fmmzw8hRYEuh3Kcfz3TSs+oMDRdeKqskgbi5g7u/1Iz/vGGhR2nzJVBD2qX1p0HlrF
         jLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966183; x=1742570983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPyk6XcUmnWugQP4HxO4j5PfsjDj3sqCpKeOAvSBxB8=;
        b=MqwRQAdU3dKGq/fdTAOr7IDU9zfCWW5m6FpRejeIDCgBU10DzEZ6/x0wQNFlMTA78g
         DLAj3zs+ZnZuLx5B99mJPViXCF/3gsj4K3sJj0Y2EUvIOFjXZEJKTvViZ3vRD36lNWq/
         h3oDFmVtSL5bbEN3k09+AFNpWLO7gtdhag5bhIqhRxCMnaWkUaUmn0hewKI2QM3IfGoB
         TYDeALalufJaaxqPIuBznkQICzV00X3JSAlryXZZdJXc8rEP2njyT2S+BowJTBXqpHWn
         +dK5u8MTTsMu1m1HEMKM+C3Jp7+1cJOyc6jF3vE/MvN8TpuUcXVetpAnFz9dW9IVtk1g
         hvBw==
X-Forwarded-Encrypted: i=1; AJvYcCWjl7M5F+NPCVco8hCIV6cSEWPsLWujiVKW4h39EHBJMyV4kjhSb59o+hcj7zEA015yTtFUM5481FVDLhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMFvirNxrmH5cPfMERpZpi2tMXi0zjECnAZqDVZ+Zqm0F4A7pL
	zKAjLZteNJciAhfMQWYE4VmHFfOHyvGwTkpAUV4Futy8N8+5ve5PgmDiaNddH9s=
X-Gm-Gg: ASbGncsh22bfmjyAq/svdAb+7tDpddlZlAOHLaFso46g9Xo07ZSAic5HHJWkvtIFGPG
	NHg6WS8DEaJ916cumMuBwlQ7MF/aH+9fsogurCU/Cuu/mM4iVlf5fdy1n4ocgZm0hcqUnodipsM
	NC+zc9eAVt/53aqyO4nYsQalU04sIYX9qd9X0ni0mFjllWF9FYQjpcWBlN0smgKNsO5SpYmfk0c
	sAtUrHR2DYPdqH0pAmku2Q2CMWqQrHQ2raD5Sc+FNw1xF0Nbyd6TgSk7gkM9Y3mvFYNSBcVGTLr
	aWJ8xOl0WL8KlW51agY4uz0WrW+oBOXB/AuN9gS6d8MXWSEqsi0PAhff84f7F6zH4kY9
X-Google-Smtp-Source: AGHT+IGrPtC3VrEHEEFt0tCDqtq7pafLx+YUJGI03PvlnWrRQ+jjv8GbXZJIe5ZIKt1VdBk+rs9rPw==
X-Received: by 2002:a05:651c:b0e:b0:309:2653:5dda with SMTP id 38308e7fff4ca-30c4a8d2068mr9904591fa.29.1741966183276;
        Fri, 14 Mar 2025 08:29:43 -0700 (PDT)
Received: from skhimich.dev.yadro.com (avpn02.yadro.com. [89.207.88.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e99f6sm6253581fa.37.2025.03.14.08.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:29:41 -0700 (PDT)
From: Sergey Khimich <serghox@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: [PATCH 00/18] coda988 video codec support
Date: Fri, 14 Mar 2025 18:29:21 +0300
Message-Id: <20250314152939.2759573-1-serghox@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello!

This is the implementation of the Chips&Media "CODA988" video codec support
within v4l2 driver for coda. Support for the following codecs
was implemented:
 * h264:   decoder & encoder
 * h263:   decoder & encoder
 * mpeg4:  decoder & encoder
 * vp8dec: decoder

Support for the following formates was implemented:
 * yuv420p(I420)
 * yvu420p(YV12)
 * NV12
 * NV21

Also the following features and fixes were implemented for coda988:
 * special config for mem_ctrl
 * special config for encoder header (sps and pps)
 * special set profile_idc
 * special set RC config
 * special set QP
 * special set slice mode
 * special set Motion Extimation (ME)
 * v4l2_ctrl for h264 profile 
 * v4l2_ctrl for h264 level
 * v4l2_ctrl for h.264 RC mode
 * v4l2_ctrl for h.264 skipFrame
 * v4l2_ctrl for h.264 i-frame min/max qp
 * v4l2_ctrl for h.264 p-frame min/max qp
 * v4l2_ctrl for h.264 entropy mode
 * v4l2_ctrl for h.264 8x8transform
 * v4l2_ctrl for h.264 i-frame period
 * v4l2_ctrl for h.264 Access Unit Delimiter(AUD)
 * v4l2_ctrl for h.264 me x/y search range
 * v4l2_ctrl for h.264 intra refresh period
 * v4l2_ctrl for h.263 intra/inter qp
 * v4l2_ctrl for h.263 min/max qp
 * v4l2_ctrl for mpeg4 min/max qp

During adding support for "CODA988" we also did some extra work
related to refactoring and improvement of generic part of C&M coda
driver:
 * Improve error checking for probe, irq-handle and etc.
 * Update work with resets
 * Replace hard_irq by threaded_irq
 * Remove double setting of stop flag
 * Improve some prints
 * Fix loglevel to avoid performance failure
 * Fix support of MPEG4 levels
 * Fix setting gamma for h264enc
 * Update default velues of QP for mpeg4 I/P
 * Other minor fixes

Sergey Khimich (18):
  media: coda: Add print if irq isn't present
  media: coda: Use get_array to work use multiple reset
  dt-bindings: media: coda: Fix resets count
  media: coda: Add check result after reset
  media: coda: using threaded_irq for 0 (bit) interrupt
  media: coda: Add reset device before getting interrupt
  media: coda: Add fake IRQ check
  media: coda: Add log to finish_encode if buffer is too small
  media: coda: Fix max h.264 level for CODA_DX6
  media: coda: Remove double setting of stop flag
  media: coda: Print size of encoded buff in other place
  media: coda: Fix loglevel for seq mismatch print
  media: coda: Fix support for all mpeg4 levels
  media: coda: Fix handling wrong format in coda_try_fmt
  media: coda: Use v4l2_ctrl to set gamma for h264enc
  media: coda: Update default velues of QP for mpeg4 I/P
  media: coda: Use preferred usleep_range than udelay
  media: coda: add support coda988 enc and dec

 .../devicetree/bindings/media/coda.yaml       |    2 +-
 .../platform/chips-media/coda/coda-bit.c      | 1114 ++++++++++++++---
 .../platform/chips-media/coda/coda-common.c   |  430 ++++++-
 .../platform/chips-media/coda/coda-gdi.c      |  149 +++
 .../platform/chips-media/coda/coda-h264.c     |   10 +
 .../media/platform/chips-media/coda/coda.h    |   41 +-
 .../platform/chips-media/coda/coda_regs.h     |  157 +++
 .../media/platform/chips-media/coda/trace.h   |   16 +
 8 files changed, 1703 insertions(+), 216 deletions(-)

-- 
2.30.2


