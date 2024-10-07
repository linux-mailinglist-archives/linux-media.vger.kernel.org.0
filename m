Return-Path: <linux-media+bounces-19169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E54993690
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D07D28485A
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4421DBB13;
	Mon,  7 Oct 2024 18:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8iiwJuI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B82D320F;
	Mon,  7 Oct 2024 18:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326930; cv=none; b=XDHe+eN95Ls18uemJEZtMbGKJASqTzgHWajMNX9IAuyj8VZqpv6yiJFfMLZtavC4j1eeA39D7xpcsop/BoVxsp6rmWeSsmqKrOn8fwBjge5DKTrkUjOnfnDMrzNHf4M+shAMpoOYKFLUGm6HUXofYI+bLO+y29flfdj6ScBb7cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326930; c=relaxed/simple;
	bh=njJJkeqdaAV652jJ0Jt7eQ9LNCzFRBRnnrx+2dFV3eE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XeVqNUbg+FbOVrtwo2L3+aJHkyg6E2GsosMc+U6sOFfY6PRYK98NM1PyOB7PIh5aoAHIqC8CgU0QiQ85BwH+E1+5s6ct52mM/MTALzWBJEvJcdXF/tx1mVCENUIiKFTbviIzFOipvVOGXY2XASrW2QelEgDeFm/GD1v92sdWr20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8iiwJuI; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9932aa108cso397552966b.2;
        Mon, 07 Oct 2024 11:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326927; x=1728931727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EYUrN451FB7o3qKFIAmiroE8Q5bO7IF8luYbym8ajnE=;
        b=e8iiwJuIfCSkJde8g9kL9ToWjXRqlCbWiUyX9bEDr7fQdHig89nOgN4SYUEMLtC0jm
         jM870CqFTN/pHtjOv9G/h2mV7I6311FhPtrkCBQpLIEvIAPBVLztikR1Ry6c2NBNNVFG
         nGWMJoYvH6tknd/ktcG5GpGaGQ0vWqez8YeP+sLriYDkUrM+Pgyp1FjtLJjV4rfvoSig
         EX9tSJ+o0rKnh6v0FFaboeiVmUBMFq9aG+KZqswWEja5rdqWXQLrgYhB1ePreC/7ddlO
         qSojsRYMs5zJtSeXzFv+TwLhATuOS3M3LnSoevO1AYiaIopDBYt21qotnRq5Isoj+p+m
         Wd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326927; x=1728931727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYUrN451FB7o3qKFIAmiroE8Q5bO7IF8luYbym8ajnE=;
        b=a+Tq7bQTtASeyrcBrksBLlIzDWKCmyxaOYW8dbYOkGeiMJg4lG5TV3bA8O7dYUZMb4
         Zfx+CHtOYLbPx6NVI3hpfwR/mZFpQ4/Zc0AEOKMXtzIBSbdKVirm4msAwbxfn8jjp/ul
         uevMZQBoENjTJXL4hy44gkk4UGlYrwuwrCh3p1KIPGQwuM9bzd5tX2AZDltXyRLVAmu3
         HM9Cc+sfMh9dI15sZlCYPY0E1v/TqOqODUUqVZc/zSXS3w3Jm2kthADyZVzqsPi7YIs9
         mNQLGMFKjEXyRGr7r3Af/+/bNZzW1KCMNOEqrfbJsuWq9HylsavBGLhyfIKf0UfA2iTc
         dt1A==
X-Forwarded-Encrypted: i=1; AJvYcCUdcFrmf/sUDFuzeQAyE/8OQz8dcJbgv3HlU70+NCZ/0yQobAXu+ilEjkdqjFlgqkOohiZyUQV9gtWLgUAzU7UjKMM=@vger.kernel.org, AJvYcCVxEUca7IuTn0yt3fSd8kT27emTt57/hpJ6r1CaAbwvONewyF0BfhCHmy/hfPEWFn+tiEHaImrYsfSkDMo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4SU7r19ARk+5Sht9TJ0DfZzqxs4/p0qUZL1ql3KY/kxbG36dz
	jbltH0GGJoiBPPbrfpxmHavgRVA/Lbr8kfA65paeY1Ep3TBK38suHGxJrA==
X-Google-Smtp-Source: AGHT+IG9qC+7nCFxm13RMAyWp/QkdPHCf9Ae051LfTtJcKLU7ok52thmGgaX1YUWoCTgHWNBfaFTJQ==
X-Received: by 2002:a17:907:25c1:b0:a93:c1dd:7952 with SMTP id a640c23a62f3a-a991c02203amr1524769766b.56.1728326927043;
        Mon, 07 Oct 2024 11:48:47 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:f429:642d:d66a:1085])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9953d48594sm180102766b.176.2024.10.07.11.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:48:46 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 00/17] media: platform: rzg2l-cru: CSI-2 and CRU enhancements
Date: Mon,  7 Oct 2024 19:48:22 +0100
Message-ID: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Lad Prabhakar (17):
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
  media: rzg2l-cru: Simplify handling of supported formats
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
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  28 +-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  39 ++-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  81 ++++-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 283 +++++++-----------
 6 files changed, 318 insertions(+), 196 deletions(-)
 create mode 100644 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h

-- 
2.43.0


