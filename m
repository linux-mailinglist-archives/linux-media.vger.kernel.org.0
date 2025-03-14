Return-Path: <linux-media+bounces-28250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB27FA614FC
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE7A67AABFE
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B31205AB4;
	Fri, 14 Mar 2025 15:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMoqIfE+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01384205509;
	Fri, 14 Mar 2025 15:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966210; cv=none; b=mySMOa+MdYPdXxXJD/neP6/p0lLtBfRl+qSFzxDZSyb3nyzJWU2WaX7RH6oQwFWrz/CPsXVucnRFkFvNT35pE1hRJfa6vmNwcd3B+76OMMG9xwH7sW8w/g/Fnn9NhHBeIcssNezPXKtILCY8HdXdjCuqEuVKLArf24hLPM/o4A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966210; c=relaxed/simple;
	bh=IYw8bQmY0zhIJDGNiGACVKHm0UdYuajycgMpjcWVlR8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ELJt5Mgcdyn+KNtH1v4T11UyjZZNJgRZsJ3sTPxTetNitXHshvjqgiiepqcQJHcQgGppFMK0fqfnikEXWGiXn0gPEBOxuSLDp4f6pjlXHv380RHxUguAI15imyyY41UkD4XXmElt5xFAWiWsvobl3ebUoxB6wgSDYCh1+hRK08s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMoqIfE+; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30761be8fa8so24261741fa.2;
        Fri, 14 Mar 2025 08:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741966206; x=1742571006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqgNTYoxC0fFFzF4qZiqTPN5SVQGUZ+pgTF4nitLk24=;
        b=ZMoqIfE+1KpCr45/qvoyR7EZePoXcHnaJGlG/cst9P/JDOVZxSvRWVibYsaGhUTWsx
         4z89+c5JIAveikCK+lcQwCFk8MqhRSvGyKloJMNBRGCq0wk6RuOetnYATHvZ07uKfKId
         mlIsENhSKAoBxPtBFKi/jwAIe+/OUfaz8YDSnRj0iOqFPnvYCq2e3uKxu1F604oHNw+A
         llxZMr0FBR2MzQQzoGUFcPeYVni9TWJGIU2mFu9L8wSPE1Uk1WUJIB4NLP3Op9BX33Jc
         yxtPdQJZXmTrl50U6YwM3133vACIHmT9oV3AcTRvJxldrLGXDKZXMxSRfx9FZof72vMr
         pWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966206; x=1742571006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqgNTYoxC0fFFzF4qZiqTPN5SVQGUZ+pgTF4nitLk24=;
        b=H8s688weozZNhnFXGD+JO2YtymZUWM94nzrcZ1IBPT/3/DVT/uTr1iKRNLhaDR0R43
         H7Pwc/9duzbdZNuFX9mnmloen2t+O6+FLDH4NwrSx/20wDnggpedT0wK3wLeEAFsSJaM
         kd1/hbuePCCkmTmn0DUyQIkT7dzpP81AfB+nHWLB16mD6VYG34F+41Xub7qg5SQ8WQOf
         XhZ6h8A6Vo1+6fYhdf3I/Vn7Jy/4JAiaxk4BgHjWhOi6pyF06qXC/azjLkrZ2TudYD75
         RPOn/28eXjJG1PuyjiSzjcclwt8QyX2Qnbk5KXZBoTy7ziTPzhTsqYOhBicUt88iqlke
         07DA==
X-Forwarded-Encrypted: i=1; AJvYcCUK+9mltXqsIGh2P8z7e7cu9NbE904WRhroq4BkEZR1+DVNQ1zm9p2veL/sxDwOYZ7o3EoYXfNlpvLUm3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK7Er2GOK1KX5ACBCg7iakCCNU81AhYXoi8d50skV/MnzE4krE
	4H9n6jAbucAmOqut8Sf04eAynqm9gHlM6iabJ74gUe+8di3i5pvpqTMzajQa+Rw=
X-Gm-Gg: ASbGncsIUapqhy1kCsKjaXFmPPNVpWSuNNNdfeiZ+AV1Ey27ToVoBJt2Xi2ZCIL4LZb
	aDfYyuPNQ8BKog0bihOh/rtGgfvBI8kf0H3cbrZZgWpqrJM5j1AvXTE8LHAiriSVtOT+cgNuwLJ
	z6Lt94aNZ1DL9uiPWMTDtdco8o3kzoz1JVESPt1QBjIG+FWPFOh1OJCBGZBRyp0NdVZ4+30oCyQ
	6anaHpY7rKFWQJWPr3DtiIruwQI4YlPXpq2fVydFoSuHTNrojPUuLrVcrCnWP9p5TgD0B5njCWK
	K0DKgPQBj4moIOvogQI0XmyxxgbLON1kU80UmLxoJ1bhaofmBPPD6hB+0P46XEG19s4h
X-Google-Smtp-Source: AGHT+IFkDKyABkKs01BMWlaO0zX3qY3/V3ioYwTNprK0FuL0fAgXrS0KkPQvm/KLdUlZXideJA8RlA==
X-Received: by 2002:a05:651c:b22:b0:30b:fe19:b07a with SMTP id 38308e7fff4ca-30c4a8cea76mr10216971fa.25.1741966206282;
        Fri, 14 Mar 2025 08:30:06 -0700 (PDT)
Received: from skhimich.dev.yadro.com (avpn02.yadro.com. [89.207.88.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e99f6sm6253581fa.37.2025.03.14.08.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:30:05 -0700 (PDT)
From: Sergey Khimich <serghox@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: [PATCH 13/18] media: coda: Fix support for all mpeg4 levels
Date: Fri, 14 Mar 2025 18:29:34 +0300
Message-Id: <20250314152939.2759573-14-serghox@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250314152939.2759573-1-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladimir Yakovlev <vovchkir@gmail.com>

Mpeg-4 level also depends on img resolution.
Therefore, driver must support all levels in the range of supported
resolutions. Coda's hw can calculate level automatically.

Co-developed-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/media/platform/chips-media/coda/coda-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index 555b73816952..29b01ade8829 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -2383,7 +2383,7 @@ static void coda_encode_ctrls(struct coda_ctx *ctx)
 		v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
 			V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL,
 			V4L2_MPEG_VIDEO_MPEG4_LEVEL_5,
-			~(1 << V4L2_MPEG_VIDEO_MPEG4_LEVEL_5),
+			0,
 			V4L2_MPEG_VIDEO_MPEG4_LEVEL_5);
 	}
 	v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
-- 
2.30.2


