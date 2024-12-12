Return-Path: <linux-media+bounces-23337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3379EED95
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 16:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70DE5188DDAE
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 15:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7297223C53;
	Thu, 12 Dec 2024 15:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="U1wQpTr3";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="hfVElm0g"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-45.smtp-out.eu-west-1.amazonses.com (a7-45.smtp-out.eu-west-1.amazonses.com [54.240.7.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E50223323;
	Thu, 12 Dec 2024 15:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018219; cv=none; b=RhAB+sBNpIs7PRjS9hbxwqTyn6M9+ukT7+dt17snTXNoxJmDk6jG6kSVildj9Ueimro/canTVkNFcaHzaZ8D+cw51oYw4dpRj8hYmdKkXLUg6s2oX6M/KZvNBWQowFtSJuaZQSOa18JZ9n1Sr9xhWOzykdKXsVTe2vvBi4nu+kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018219; c=relaxed/simple;
	bh=ltUDALF8WtRUBRtQU/ZvlBBXaB0jB77q/PnuMmcP0BA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kXYPWJohZrA41HP7QEOwVo5nIQeDaO1f1RhKSOECxNf2bdKGPQ1Bj0Fiek49qzzoeZk0HJ5sPVcSMpa/07YDwuQfcDbLvXQuRKboZTTr37LtcoI+J82Ew9iSmV2iXHVtBWlzfSbZlqfPWrkz9cO3F2Eu0zJpZ5RpkgR3CdhlSmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=U1wQpTr3; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=hfVElm0g; arc=none smtp.client-ip=54.240.7.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bc7lryepznv65m6r2ewkpoafjt4fiq42; d=collabora.com; t=1734018213;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=ltUDALF8WtRUBRtQU/ZvlBBXaB0jB77q/PnuMmcP0BA=;
	b=U1wQpTr3k8eLSbyCBCHyrpP+wbs1XpZS9hsaqkvPRaoxq25BZr/dM6k1xQAk267h
	RA5aOEbkc8rqk9RtQaIX+xl4oRR/h3CotlGUAvrd6J05OlHZTwauyYcdE+yjcn5hhew
	6v2FVSJ/8hzUTRFdtt7IpFFG/5dfHZgHK11x+SyBo/p4RksDDs6W02B6shK1uB9xJ3K
	tyfyd9N5rUU4WeK+EA+4SPx8BgFBzG5tjKntqL3LAcum9J3xETUWBWqxyDDOejpNpnU
	bsRefvfbI/j9XGZEV68GLxyyXkrwfSssvjRaGNia40a+5TV2mTyNEdyec8jvOrlnRmP
	sMO4u7KNAw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1734018213;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=ltUDALF8WtRUBRtQU/ZvlBBXaB0jB77q/PnuMmcP0BA=;
	b=hfVElm0gkL4Grt7PQrESSMWpcfKYEgyVVCSfM2oBuEj4LnmE7/FKiGmRp5KC6fNY
	hW1Sk8gIv52BHGqp5Ak2Z3dd5PdFzQ9mmnXWAfBvv7m1np5iAJRzjjQs9l5Zh1OlTvq
	k2sYNA/KDD0SzebN6C92B88egzp1dsvD1taccRNM=
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 0/2] media: verisilicon: fix reference padding issue
Date: Thu, 12 Dec 2024 15:43:33 +0000
Message-ID: <01020193bb8a24ad-99eafebb-3b0b-40c0-9b28-3a0dbc84327a-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.12.12-54.240.7.45

Hantro hardware is splited into two parts: the decoder which produce
tiled pixels formats and the post-processor which produce raster pixels
formats.
When post-processor is used the selected pixels format may not have the
some padding/stride than the decoder output pixels format. This led to
miscomputing chroma and motion vectors offsets so data are overlapping.
This series introduce a reference pixels format that decoder use to
compute the various needed offsets and size.

With this series Fluster for VP9 tests is now 207/305 vs 145/305.
HEVC test score isn't impacted by these patches (still 141/147).

Version 2:
- rebased on top of media-commiter/next
- Add reviewed-by tags

Benjamin Gaignard (2):
  media: verisilicon: Store reference frames pixels format
  media: verisilicon: Fix IMX8 native pixels format steps values

 drivers/media/platform/verisilicon/hantro.h   |  2 ++
 .../media/platform/verisilicon/hantro_g2.c    |  2 +-
 .../platform/verisilicon/hantro_postproc.c    | 32 +++++++------------
 .../media/platform/verisilicon/hantro_v4l2.c  | 21 ++++++++++++
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 10 +++---
 5 files changed, 40 insertions(+), 27 deletions(-)

-- 
2.43.0


