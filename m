Return-Path: <linux-media+bounces-18929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 678AE98BF1A
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AFEF283B65
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585611C6F53;
	Tue,  1 Oct 2024 14:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSeHzJQ7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6E01C6899;
	Tue,  1 Oct 2024 14:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791779; cv=none; b=W278OPvrG2BlnH+nBXNaHI1xvHV0DfKyn4vQKp+X7uBan3AXRfkj2c21tCVcGjbBExSBQIfQKAj9tA9TGMrK6nsQVmQw37qHjGtM95Xvnrwx4zfc3P9+Tmw96I53HRhKmphPNDF4N/WVPlmMMgi+gakjC5ugvOggSVJarUZIFjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791779; c=relaxed/simple;
	bh=l5vbDexJZYLqVrio8XqYUZt5qR95Y/YOl/YKwAIZBB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fYGrQ9vlMqErr++j3y7bfQKMxEOyoIEh0GBP4F5MyUVe4p1IEygdrXpg57ZsQ3FU+Pl9KsR6a6BALWw4CwCqcnuThKSyV7ol0RwMhe0vSnU70U17BFFJ///6ARDF0SrdSEIMykAa5yH90EtlS+c/SyAAwWwjp7JfJW4rvKz5Yiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSeHzJQ7; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fad6de2590so21791641fa.0;
        Tue, 01 Oct 2024 07:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727791776; x=1728396576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I0BW3zJMCDVDC+cJUw8LxvuLNWN0y0JnmO2i0aX9BIo=;
        b=SSeHzJQ73Uon5tZxiok6q7t+s+n7V4YA4dGERWs8vaZoIQzECAaTK+YBF3sdLEXh+m
         GyCxX0MNxhiRCXP2g/rr958C4oS1DNDaRaHWa4Pk2vNU+d3Y95J4qpLycaSN7QjjD8vh
         ycEVsOdkpQqVZi9QasRlfzZWgnZojAO2vDSYuQ1AvvwbdW5fO2y0Ia+YmHJnkL8PY+Ws
         m0Sr5zhkRsYdcdTBaWdSu60cMDpDUpHRMIj8hgYgSsheCBLsjMJEm0S3ytYr3x8zjD6b
         YDSLLJB34cveERHypt3Niyq9GEoLaDq7cmLEwhdOrcH8057L/XK+VpnOMvY+wwQBa80U
         zy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791776; x=1728396576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0BW3zJMCDVDC+cJUw8LxvuLNWN0y0JnmO2i0aX9BIo=;
        b=ekOTv6A7DVJhn7jszg4Lere4uIXUMomf0WZ15uSs++14hjS8s5pK6hXJLymrWRKv91
         Tfv0ZTnNgPgZH7rtfySRB1APD+iSm/XvQNTwgmkIUBVb64CO/pDCoucSjstiBow3u1li
         gSM6Yqyj40PQC29+FUdWL9XQx+UbswhMC6Fv5ot150iJFY2xqvS6/L6CxdG1Dyip6iGI
         LcFLGP3hDXRBI1hlrzJNJO891tR9mq6Y791pLYI9fJ0SQ8cBAvBnNJ3aAeViBPCUKfIn
         RAS0jjqJyVY1fqBrkXtgyhZ3jFCOT+zi2n8csQrBlBXUzcqK8j3HQeXkbTCwR+mOYKNA
         7Jwg==
X-Forwarded-Encrypted: i=1; AJvYcCVDb1tZzS5QIZzxxewz5+H6ZXPwM05Y6a7gVBvHvXC2fYX/J6XFkmls3DKy04uHNaBMAhMMwGa1EKvAu6Q=@vger.kernel.org, AJvYcCVPoAHwhl0iDL/ZOG4mDJe+az+RqGI/oX/5qHNrymSx8JNSs4JpUAwEMMnbncdyfLNifk+c0JojfktdX9nHeJIE+gg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ8kFhYJK5P8Y4WWxTrJ3pIplG/KQ9tYak595t4sfzEP7IGoPw
	sk9p+3E7Qkisf9MxQXhB1872kcmbsULZIXqXnJLbwtt+rbS/EWaA
X-Google-Smtp-Source: AGHT+IHwbbG6VS0fm1tK/JbSvEZnLxASPFRvME3znuWgdG/Hr1XTtDe5jS0vm/SgkTwJsSCXAWAiMg==
X-Received: by 2002:a05:6512:ba3:b0:539:8fcd:520 with SMTP id 2adb3069b0e04-5398fcd0637mr7124871e87.36.1727791775606;
        Tue, 01 Oct 2024 07:09:35 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2776de0sm723532966b.2.2024.10.01.07.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:09:35 -0700 (PDT)
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
Subject: [PATCH v3 00/17] media: platform: rzg2l-cru: CSI-2 and CRU enhancements
Date: Tue,  1 Oct 2024 15:09:02 +0100
Message-ID: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  79 +++++
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  30 +-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  39 ++-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  79 ++++-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 289 ++++++++----------
 6 files changed, 325 insertions(+), 194 deletions(-)
 create mode 100644 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h

-- 
2.43.0


