Return-Path: <linux-media+bounces-19448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A319099AA0D
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 346022868DC
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB361C174A;
	Fri, 11 Oct 2024 17:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXUjkvQg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE13E1BDA9F;
	Fri, 11 Oct 2024 17:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667862; cv=none; b=QJcXcvjOWPjlwHxGEhM8FWZNo35EuMbNCdpfeSm9thWs4Dg9tOFbiU/6dyUt8GKqX0hwOvQwANDxeuQtYIPkrwdTTihM8XEuIhYI9VqAnz/obj60ldEXDcKrOiHMQjb5kO/R3m1kA9cU0g21YE4T9aG3GDtLxWw64gZgmmSRVQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667862; c=relaxed/simple;
	bh=5twtfBGEC9Y/biXF9Rx/SgFIAEqQ6cngNM0xO3Hz0pc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=equnGYc/EF9WTIsPUftPlk/5maUqpZsCXakuPpf6YiBYHgv/+fvBsBOv4A9pqBSra4GLKd68baW1r+L0marjQ8iEP900fHpL7Cbwzv+6QFrLDhXXpfvAUNzgvW8g4jNSCxMsT+Dr6GCHdTN7dpG0UsZUVusFsysbDu5ANf+e9io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXUjkvQg; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4311420b675so19634585e9.2;
        Fri, 11 Oct 2024 10:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667859; x=1729272659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xVlDKfegapTUq3xoWuai0NDMGbC838Jbw+hf7VuNFq4=;
        b=NXUjkvQgBF0Lvtj6G8yGgmu8KuSYS12nD/uMNj1GVukVsHdcZOxqWxPn8iXrc60qap
         8NBqsXD4cMbdheuBziu9M6X3xfKvempNBwp0HcFBdiJo5A/l6SrthUb+f/XpUhOsDQ2H
         J9d1EZylIvpphLRgSlZdWk8KajJEOcOkFFUush70nE51I9KamFpYL+86AdhTfmn/OLaE
         uobTQPpuKvdGSMfn8tCMD9Uf74RBw3rkS1JuPpx/DXLrcXjeG32RONDumRibZpJ5x4r7
         sfBHbyI3Gk1qscy87JPEk+YqnYgsfiatYLmafnwmB4unMNWx9SALM+iiGwTmmhY8xQHG
         yg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667859; x=1729272659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xVlDKfegapTUq3xoWuai0NDMGbC838Jbw+hf7VuNFq4=;
        b=D1YDZme1990+Jum/qnbuqSlxbrDEgqMN8D6gB/mHglLbhj1UehNXsWp8NZCAJAuVIr
         40ny3HMaZy9kLsjVLrsYgctaqZIf2cgWM/4OnjuwGgsK7awp9JWsIeR3zOUVeDk9XMln
         hGkROgds+5JpcwZ2KnMWdzSV4I7OdyUhL/MoQxpzhIOXa6DsOgq6wwWspqV2l38lVebX
         sHB0EZr6Fw2zEXQejAtE5NFfuyc450yNB9tCVrg3yWMTl6kqCzO7rM2Q+0qhiVturspD
         QeP2PR9WMOm6guLfu/p5OksBN16luAg2I4Xp2tEXNlAEu/1aoL2w9ZLhlNLQ6vRRCo0Y
         uWhw==
X-Forwarded-Encrypted: i=1; AJvYcCWAfpRT+3jqGhlvWxfAYVSuo/KdE0GJI9pqZmLBHV5UTZxbZowr7uIfNGCzLdg9BcINcIXftALuCP4hyik=@vger.kernel.org, AJvYcCXYC0g0C9sHsBLT5BPJakmMSzs9nXdbEXhsJ1gPtAd9OiNDaN4qu56QaT3AlBGjVAajY82b32iPsHbtFX3l2uU05bM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrFkzoaIXccer8BswG6lhP56hqh9nUQW7yuJqs45Vtm64FrzxK
	o+IQBcOXxaNMn5MgFd6du7l+cNJbRxZFwJ2EZa4QxFEwpJAOXbjb
X-Google-Smtp-Source: AGHT+IExtp/q/7ecCO/FKeK3vqzsBLQuqHYvklETY0JEv/6HmCX3ZJMObBwICm92hX0REmool00XIw==
X-Received: by 2002:a05:600c:1c9e:b0:42c:c28c:e477 with SMTP id 5b1f17b1804b1-4311df1e5camr28109375e9.23.1728667858835;
        Fri, 11 Oct 2024 10:30:58 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:30:58 -0700 (PDT)
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
Subject: [PATCH v5 00/22] media: platform: rzg2l-cru: CSI-2 and CRU enhancements
Date: Fri, 11 Oct 2024 18:30:30 +0100
Message-ID: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
- Retrieve virtual channel from remote subdev
- Support to capture 8bit Bayer formats.

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

Lad Prabhakar (22):
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

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |   3 +-
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  80 +++++
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  26 +-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  39 ++-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  80 ++++-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 291 +++++++-----------
 6 files changed, 312 insertions(+), 207 deletions(-)
 create mode 100644 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h

-- 
2.43.0


