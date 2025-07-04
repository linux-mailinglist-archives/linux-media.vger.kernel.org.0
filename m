Return-Path: <linux-media+bounces-36745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B54AF84B6
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 02:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC19F4A7D64
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 00:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47098F58;
	Fri,  4 Jul 2025 00:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mJpHQyei"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92ABA48;
	Fri,  4 Jul 2025 00:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751588324; cv=none; b=GieubIJkZX0IdbD6yPcKtBaEqf2hhuYo3akWvlRsfABbCK1zt9fZjq7GnU/f7r7CtFelKOQ5iXwsCkdh+3VTs+i2A95uBl62nr0NrprC4MBUELWPoeYLTR97JytM2ESnBg0ROFEYYoiq9wd79Xlox6LEP05FLwUXitR/VQn7fsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751588324; c=relaxed/simple;
	bh=w59yCbyVYLeKW7J7CfFPxVOeJUlnH2OvcmUrVuoZlzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g8qAitvm08IT87eu1rTds+CaNJ70HE1N4u1cUkemoimaNQJSLQj99epyf05/KDC2rhb3uHkiX0TCjK4sVnOhVgLptm9eFnotApd/pqd9DUhfjoVPMolWiEvTU3AX4TQuxxb7fny0Zj0rmyDNI7xmiiKml/EC0ZakdL32QKT2FCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mJpHQyei; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6D4C1669;
	Fri,  4 Jul 2025 02:18:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751588295;
	bh=w59yCbyVYLeKW7J7CfFPxVOeJUlnH2OvcmUrVuoZlzc=;
	h=From:To:Cc:Subject:Date:From;
	b=mJpHQyei4r7Azkxg+XbdlkafWqOH6RwCVb0ZtufKDku1Qtqpxl0uSf6bQ/QS7r9h8
	 LH4KkCSsxCs1V+qjWiCbvjc+CTF7sxs3z5bxx27eOaxXaQL87LtjgwTQRUnpxN99fv
	 e558mltdDtlgpnsFf4HnKyalZZOJWlmni8A96RuY=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 0/8] media: renesas: vsp1: Fix v4l2-compliance failures
Date: Fri,  4 Jul 2025 03:18:04 +0300
Message-ID: <20250704001812.30064-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series fixes all v4l2-compliance failures in the VSP1 driver. The
v4l2-compliance log is long, and not that interesting as there's no
failure. Here's the executive summary, if anyone wants the full log,
please let me know.

----------------------------------------
root@buildroot ~ # v4l2-compliance -m /dev/media1
v4l2-compliance 1.31.0-5383, 64 bits, 64-bit time_t
v4l2-compliance SHA: 58fb1141ca7c 2025-07-03 19:50:58

Compliance test for vsp1 device /dev/media1:

Media Driver Info:
        Driver name      : vsp1
        Model            : VSP2-BD
        Serial           :
        Bus info         : platform:fe960000.vsp
        Media version    : 6.16.0
        Hardware revision: 0x01011504 (16848132)
        Driver version   : 6.16.0

[...]


Grand Total for vsp1 device /dev/media1: 751, Succeeded: 751, Failed: 0, Warnings: 0
----------------------------------------

The series has also been tested with the vsp-tests suite, which reported
no regression.

Compared to v2, I've fixed a bisection compilation breakage in patch 1/8.

Laurent Pinchart (8):
  media: renesas: vsp1: Store supported media bus codes in vsp1_entity
  media: renesas: vsp1: Store size limits in vsp1_entity
  media: renesas: vsp1: Fix code checks in frame size enumeration
  media: renesas: vsp1: Fix crop left and top clamping on RPF
  media: renesas: vsp1: Fix crop width and height clamping on RPF
  media: renesas: vsp1: Fix RWPF media bus code and frame size
    enumeration
  media: renesas: vsp1: Fix format propagation on the BRX
  media: renesas: vsp1: Implement control events

 .../media/platform/renesas/vsp1/vsp1_brx.c    |  37 ++---
 .../media/platform/renesas/vsp1/vsp1_clu.c    |  47 ++-----
 .../media/platform/renesas/vsp1/vsp1_entity.c | 110 +++++++--------
 .../media/platform/renesas/vsp1/vsp1_entity.h |  21 +--
 .../media/platform/renesas/vsp1/vsp1_histo.c  |  27 ++--
 .../media/platform/renesas/vsp1/vsp1_histo.h  |   2 -
 .../media/platform/renesas/vsp1/vsp1_hsit.c   |  24 ++--
 .../media/platform/renesas/vsp1/vsp1_iif.c    |  39 ++----
 .../media/platform/renesas/vsp1/vsp1_lif.c    |  40 ++----
 .../media/platform/renesas/vsp1/vsp1_lut.c    |  47 ++-----
 .../media/platform/renesas/vsp1/vsp1_rpf.c    |   7 +-
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 127 ++++++++++++++----
 .../media/platform/renesas/vsp1/vsp1_rwpf.h   |   6 +-
 .../media/platform/renesas/vsp1/vsp1_sru.c    |  63 ++++-----
 .../media/platform/renesas/vsp1/vsp1_uds.c    |  62 ++++-----
 .../media/platform/renesas/vsp1/vsp1_uif.c    |  40 ++----
 .../media/platform/renesas/vsp1/vsp1_wpf.c    |  13 +-
 17 files changed, 335 insertions(+), 377 deletions(-)


base-commit: c26e8dcd9d4e86d788c5bf7a5dd0ea70a95ab067
-- 
Regards,

Laurent Pinchart


