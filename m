Return-Path: <linux-media+bounces-18746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4995C9895BB
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 15:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4DEA1F215FF
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 13:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45AC17BB25;
	Sun, 29 Sep 2024 13:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X92iHOh4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EBE166F3D;
	Sun, 29 Sep 2024 13:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727617440; cv=none; b=lw3ddDSHgM5L7XOLEhoO2ZgjSQU0wchT56KIQCgk81ulx+PLWtg8bhzNHlUCKva93c1Zb3w30hlIKXSXNz1V/UaP/zHtcy/hasFZ9wKciE71HeywNmJjfNpEVATXOW4E0wBhhUoGC7XRwlDSi48qdakERxii5hkFpJb0oR6Wzqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727617440; c=relaxed/simple;
	bh=inAw3f7g7F3IY2IUkhvyADvA2yVM55yNgSiBz0oXYM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ls2gn2rYpiygWssTDpmntTNivW15xjNGEzv9LB+4fNYaLEgmIolEGD9mdke33wKBEazrN/KaCjYqkHkm1l/lduFQ6KQeCvWZq4zC5TWQHKpwnnqMv/RYGCCtN/A8HHitVbMZ7VfwoAq/8mXSH+GmGUdKfjSawR/VCO7evm86vUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X92iHOh4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA820B3;
	Sun, 29 Sep 2024 15:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727617346;
	bh=inAw3f7g7F3IY2IUkhvyADvA2yVM55yNgSiBz0oXYM4=;
	h=From:To:Cc:Subject:Date:From;
	b=X92iHOh48Tso/ejvdM04wgkdGsyPTGos0/OhqFcjyuZEGkvpzSAvqZqutSuEnTt1x
	 LW0AxFrYAJFqy+Eg8A66Gt65AxVsPfj2+UQko7+at+kqbofvH/SLf9AuuY6GtIrLLJ
	 pXXCji005Ndm3hw9bP3Foz/8Wit0EKQL+soiaCrk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: rmfrfs@gmail.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: guoniu.zhou@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] media: imx8mq-mipi-csi2: Simplify power management handling
Date: Sun, 29 Sep 2024 16:43:51 +0300
Message-ID: <20240929134354.20735-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small patch series is a reaction to "[PATCH] media: nxp:
imx8mq-mipi-csi2: Fix CSI clocks always enabled issue" ([1]). Instead of
making the PM handling more complex, I think it can be greatly
simplified.

I have only compile-tested the patches. Guoniu, could you give this a
try ?

[1] https://lore.kernel.org/r/20240929101635.1648234-1-guoniu.zhou@oss.nxp.com

Laurent Pinchart (3):
  media: imx8mq-mipi-csi2: Drop stream stop/restart at suspend/resume
    time
  media: imx8mq-mipi-csi2: Drop ST_SUSPENDED guard
  media: imx8mq-mipi-csi2: Drop system suspend/resume handlers

 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 113 ++----------------
 1 file changed, 10 insertions(+), 103 deletions(-)


base-commit: 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad
-- 
Regards,

Laurent Pinchart


