Return-Path: <linux-media+bounces-61930-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDDJLivpCmpt9QQAu9opvQ
	(envelope-from <linux-media+bounces-61930-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:25:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E8856AA47
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF252301CFE7
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832593E314F;
	Mon, 18 May 2026 10:25:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B43318B9C;
	Mon, 18 May 2026 10:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099932; cv=none; b=ppm9414pKX3O7DU4WJHV6Fpr4b1b30yuAdscCqi8w1rKbAMMq/MDjsMHttVxTjL3+DsgbfSpdxbGySCV/ty9lLjtA4nC9fDWXi1C502QxWmG5AM5Ga/DPw16YVo7x7HHh1wcy12Ay428I1Ha+0B8fKDMH+avm0VSy1qiXVR9hx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099932; c=relaxed/simple;
	bh=E1ZW9i0dYv/14hDo1SM4GZvuEWLlo3tOKSKIoH/g3qM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CAH9Eb+RVas9Zsb3iAbl0vkn/9s7K9trSJPlSgtCqxqiRlJnAGK4KHUCax14DULLaeERvqLSnlgho55RJBK2Kq51op1/5PrcnnJdOVXMljt/NuGIAPdFkonCF9y9OLzSfP5Jd5G4rJxfCnE/Qdv6MJRGpGoadVPNEz7dyisFAYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 9147F1F8004A;
	Mon, 18 May 2026 10:25:27 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 1588EB407E7; Mon, 18 May 2026 10:25:26 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 52013B407E7;
	Mon, 18 May 2026 10:24:52 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 00/16] media: sun6i-csi/isp MC-centric support and cleanups
Date: Mon, 18 May 2026 12:24:35 +0200
Message-ID: <20260518102451.417971-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 68E8856AA47
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61930-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[sys-base.io];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[sys-base.io,kernel.org,gmail.com,sholland.org,linuxfoundation.org,ideasonboard.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This series first introduces some fixes and new formats to v4l2 format
info, one of which we need for the sun6i-csi driver. Support for
MC-centric format enumeration is then added, along with cleanups and
improvements for both the sun6i-csi and sun6i-isp drivers.

The first 4 patches are already reviewed and ready to go and are
included here as a reminder that this series depends on them.

Arash Golgol (4):
  media: sun6i-csi: bridge: Use V4L2 subdev active state
  media: sun6i-csi: capture: Implement vidioc_enum_framesizes
  media: sun6i-mipi-csi2: Use V4L2 subdev active state
  media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state

Paul Kocialkowski (12):
  media: v4l2-common: Fix NV15_4L4 format info block height
  media: v4l2-common: Add missing tiled format info block sizes
  media: v4l2-common: Add NV12_16L16 pixel format to v4l2 format info
  media: v4l2-common: Add NV12_32L32 pixel format to v4l2 format info
  media: sun6i-csi: Split format validation to a dedicated helper
  media: sun6i-csi: Add support for MC-centric format enumeration
  media: sun6i-csi: Tidy up and unify coding style
  media: sun6i-mipi-csi2: Fix parenthesis alignment
  media: sun6i-isp: Add dummy params link_validate implementation
  media: sun6i-isp: Use V4L2 subdev active state
  media: sun6i-isp: Add support for MC-centric format enumeration
  media: sun6i-isp: Add support for frame size enumeration

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 153 +++++++---------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 168 +++++++++++++-----
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++-----
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
 .../sun8i_a83t_mipi_csi2.c                    | 113 ++++++------
 .../sun8i_a83t_mipi_csi2.h                    |   2 -
 drivers/media/v4l2-core/v4l2-common.c         |  12 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.c |  47 ++++-
 .../media/sunxi/sun6i-isp/sun6i_isp_params.c  |  37 +++-
 .../media/sunxi/sun6i-isp/sun6i_isp_params.h  |   4 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    | 117 ++++++------
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.h    |   7 -
 13 files changed, 437 insertions(+), 341 deletions(-)

-- 
2.54.0


