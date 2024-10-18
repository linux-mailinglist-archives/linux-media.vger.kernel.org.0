Return-Path: <linux-media+bounces-19861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C260D9A3FCB
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FB67288C76
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077651D79B3;
	Fri, 18 Oct 2024 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEAvarnq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA2D1D545;
	Fri, 18 Oct 2024 13:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258498; cv=none; b=PByhtZJzbGVw84aVtXUFJDbKiVOMs373yWWc6LvG/SpLr2Sz6zm7XvyjP7KN1H2l4YGQU+x0xZzv9zTE2vQAzs0oOJf0H0K27ujvp464zkJf6s7Jx3MtZpJ8jPMV1L5+juUu+K4RZee/3KZFt5iRDCq/jLYMjMWLcaBbQtZ0pZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258498; c=relaxed/simple;
	bh=AFmB76VJGeowgB2Thg2t6WHOWKw0M5egccb0wvXV0YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bEyq1iRoUIkZknwbn3wNH2ubG2kHVXv4/Hj1JuBwhONOGBy98/yUCJiayRvVT3KOne7+4qTwblcfadufrLmvo+w3IrvxzMc6pDybU90rysYq9eRubbhG1KpUoDHP78r32fuZCOtztWFflKfNhschzLuch7s04AKQZ36J/NpSoKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEAvarnq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315eac969aso10218245e9.1;
        Fri, 18 Oct 2024 06:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258495; x=1729863295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=++pIOVcgHU4Vk6ENEp+x6Rm2aLgwu4POcyN1W5+/SAs=;
        b=gEAvarnq71RohjaAgv6uytqyLZdmEBH9+3BqrKcUDha34Yu8fNBnh3k9Tn7yYZJzVB
         ZemmnUyByto62q4tZEwSIGQ7H1icNXQ4erJtWnckv2OqBHlZxZRSXKELQu8qe4Ek08dy
         YerYDdZCFtW5IEkfmZMIdePvZCau0qtcX1t9/LqRPg/TND0YMiosHjEePJKGoeTs9VKy
         Cj0EWKn/QkDuRkMGEkhmV2V2RuuLQJbuJP4uZZ+R+8Rn2Lp+Pxp7iMFbej9qp4LBTVOO
         wS0Mu7ub/xSGvmF3BP3x5muZRZlzdryB48MwOBbmhenBqDXWW5e4aQZTY/711cB3JPjd
         lcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258495; x=1729863295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++pIOVcgHU4Vk6ENEp+x6Rm2aLgwu4POcyN1W5+/SAs=;
        b=uXw5XVN4q4E3/SG6RRvD0NH0euo3rgz4hhLXBBNcA/ln6eBbHPaeTjMM8NryV+UUa6
         Bvbz6r/stB8SbHWQNHEnjamuWamYXODFugf7YOPCsOSNPxU2P78LoQy8g4ZJ9K1Vi85o
         VaKRMEeqVl2bBoKSeTg3wJPFan2lFHyyENiKaLpUTK+T4MZ/ZRNg4nNQHMtYZUXYqHiM
         SlPRznGlzwMtd8B9yns28hTqr6vXL3KATokaWiiy8aT6Yfxf9DGWUgE29cWrSnHrkI4w
         idGZ08lQ32nCamvjv/835k4LV9ACBFcf5UZmzPnGV5x1fTR1JKktlt4Anmhm6n1tg/nG
         JGqA==
X-Forwarded-Encrypted: i=1; AJvYcCVObAWjCiTX7AhVGb1ywZpqIEC/uQ/Gc2pS2CyxnLhNoKdrEQ3ypVyAtDkpl8i1+oyFHOpHRbERrA0BNko=@vger.kernel.org, AJvYcCXYadIe/5ApIPONLqv3kXoShYJIzpSzcFT2F+9ZZduDQmPlsQccD7ocbrk4MjQGYAPd9gr7wDxdvv1+ZTPZyYPtgQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTYShTQlSiwvU2hNTShYRMFcKynTkgsYxzCVNwgGXy67N+9S5y
	2viI/w3PpdPx42tdytCZ2BEE2glLeQtQTtXfCzFzP7zn3tF/rpIg
X-Google-Smtp-Source: AGHT+IEIsaEy4ZK8gHV2HIpK6Uq9LWxVHaudx1taU6OGXxnBFpcULNSUy8e1lLJAWsc22Xs3/7HbAA==
X-Received: by 2002:a05:600c:5489:b0:42c:b8c9:16c8 with SMTP id 5b1f17b1804b1-431616415f4mr16309715e9.10.1729258494309;
        Fri, 18 Oct 2024 06:34:54 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:34:53 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 00/23] media: platform: rzg2l-cru: CSI-2 and CRU enhancements
Date: Fri, 18 Oct 2024 14:34:23 +0100
Message-ID: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to add the below:
- Support to capture 8bit Bayer formats.
- Simplify format handling
- Implement .link_validate callback
- Simplify configuring CRU
- Retrieve virtual channel from remote subdev

Note this patch series applies on top of branch -next + two additional patches:
- https://git.linuxtv.org/media.git next
- https://lore.kernel.org/all/20240826110740.271212-1-biju.das.jz@bp.renesas.com/
- https://lore.kernel.org/all/20240905111828.159670-1-biju.das.jz@bp.renesas.com/

v5->v6
- Updated commit message for patch 10/23, 12/23, 13/23 and 18/23
- Included RB tags from Laurent
- Added new patch 23/23

v4->v5
- Updated .link_validate function to drop local variable, invalid
  format check and input/output code fmt check
- Split up patch 10/17 from v4 into multiple patches (10/11/12/13/14/15)/22

v3->v4
- Added {} in rzg2l_cru_ip_format_to_fmt() for the for loop (in patch 10/17)
- Added checks for formats in .link_validate callback (in patch 13/17)
- Got rid of icndmr local variable in rzg2l_cru_initialize_image_conv()
 (in patch 15/17)
- Moved macro ICnDMR_YCMODE_UYVY to rzg2l-cru-regs.h
- Included RB tags from Laurent for patches 15 and 17

v2->v3
- Added MUST_CONNECT flag for source pads
- Used ARRAY_SIZE() instead of NR_OF_RZG2L_CSI2_PAD
- Implemented rzg2l_cru_ip_format_to_fmt() and rzg2l_cru_ip_index_to_fmt()
- Dropped checking fmt in rzg2l_cru_initialize_image_conv()
- Dropped fse->index checks
- Implemented link_validate for video node
- Re-used rzg2l_cru_ip_format_to_fmt() to fetch icndmr details
- Moved register definitions to separate header file
- Updated subject lines and commit messages
- Collected RB tag

v1->v2
- Fixed retrieving VC from subdev
- Fixed review comments pointed by Laurent
  * Refactored supported CRU formats
  * Added MUST_CONNECT flag wherever required
  * Dropped `channel` member from `struct

v1:
Link: https://lore.kernel.org/all/20240906173947.282402-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (23):
  media: rzg2l-cru: Use RZG2L_CRU_IP_SINK/SOURCE enum entries
  media: rzg2l-cru: Mark sink and source pad with MUST_CONNECT flag
  media: rzg2l-cru: csi2: Mark sink and source pad with MUST_CONNECT
    flag
  media: rzg2l-cru: csi2: Use ARRAY_SIZE() in media_entity_pads_init()
  media: rzg2l-cru: csi2: Implement .get_frame_desc()
  media: rzg2l-cru: Retrieve virtual channel information
  media: rzg2l-cru: Remove `channel` member from `struct rzg2l_cru_csi`
  media: rzg2l-cru: Use MIPI CSI-2 data types for ICnMC_INF definitions
  media: rzg2l-cru: Remove unused fields from rzg2l_cru_ip_format struct
  media: rzg2l-cru: Remove unnecessary WARN_ON check in format func
  media: rzg2l-cru: Simplify configuring input format for image
    processing
  media: rzg2l-cru: Inline calculating image size
  media: rzg2l-cru: Simplify handling of supported formats
  media: rzg2l-cru: Inline calculating bytesperline
  media: rzg2l-cru: Make use of v4l2_format_info() helpers
  media: rzg2l-cru: Use `rzg2l_cru_ip_formats` array in enum_frame_size
  media: rzg2l-cru: csi2: Remove unused field from rzg2l_csi2_format
  media: rzg2l-cru: video: Implement .link_validate() callback
  media: rzg2l-cru: csi2: Use rzg2l_csi2_formats array in
    enum_frame_size
  media: rzg2l-cru: Refactor ICnDMR register configuration
  media: rzg2l-cru: Add support to capture 8bit raw sRGB
  media: rzg2l-cru: Move register definitions to a separate file
  media: renesas: rzg2l-cru: Add 'yuv' flag to IP format structure

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |   3 +-
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  80 +++++
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  28 +-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  39 ++-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  85 +++++-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 287 +++++++-----------
 6 files changed, 315 insertions(+), 207 deletions(-)
 create mode 100644 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h

-- 
2.43.0


