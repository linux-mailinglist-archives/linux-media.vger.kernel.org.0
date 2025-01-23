Return-Path: <linux-media+bounces-25216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4593A1A851
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 18:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82BA83A22D8
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 17:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D547140E5F;
	Thu, 23 Jan 2025 17:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RHhREVkr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6723B1E871;
	Thu, 23 Jan 2025 17:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737651882; cv=none; b=TOtMLaLEY9fvBiFknu23rJA95cTmZ0oZ8VoW3UftfC94evA34v0bIVMnq2NzFkv0EOlSD3sl7M08oakP8Je7RHWgp67tQksupRK+i201BUp37547H2xk0TGJwphrhfRm8ZxVKd/G7Kpg3O2BPgZNfzhj4mksBqaa2EI/z4f2S4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737651882; c=relaxed/simple;
	bh=X01n217zP1s670QbzRTI9ZoXQJ3eI/8JlGBoCNDc8CY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rQVBp3UPhWon+oWPwKaUSaVTxT+JdUWTgNxc/wb0iJt60qTUfwohdzWQJs1nXTksJPXCmDFNM5kmvkETeYRviceWyjReRxm235rBaaEGeHJPMK/vS4Qu59e4Tc3LdZs2qoryCdgxDAq6AuKjFiiwU28P4JtA1W+tQcagSbWfKiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RHhREVkr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.103] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BFFA89A;
	Thu, 23 Jan 2025 18:03:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737651814;
	bh=X01n217zP1s670QbzRTI9ZoXQJ3eI/8JlGBoCNDc8CY=;
	h=From:Subject:Date:To:Cc:From;
	b=RHhREVkr85j6rS74WOpEBr2hgMikbga9kWs+38Hbbo9eiuAI3kv1Pd1FRhBDJGbYS
	 97bSPQlieYytH7CA7UOFzSMbXUQPAjNkVowbFQ+dMToUwavKGI59I7ZJy/xzz3P5So
	 4B0OWifduho+YlV+6B2C1N1XqennWtCEjhZUmWnk=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH 0/6] media: renesas: vsp1: Add support for IIF
Date: Thu, 23 Jan 2025 18:04:01 +0100
Message-Id: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIF2kmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyNj3TKTDN3MzDTdRMOUlEQzE4NkS9MUJaDqgqLUtMwKsEnRsbW1ACO
 ZU9RZAAAA
X-Change-ID: 20250123-v4h-iif-a1dda640c95d
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=X01n217zP1s670QbzRTI9ZoXQJ3eI/8JlGBoCNDc8CY=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnknak6VNcIt7MepIFP12Mnqo3sB0x5r+uP0c6q
 jSgv3sbld6JAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ5J2pAAKCRByNAaPFqFW
 PAH7EACkrXdNWshlQtDPAAKSv31gxPyKYVN3TPLr7AEXKtm88JQgCpx8QrUw7pouUirVo3IX69n
 1RSXyrzVosET+6KUtERvYVZ+8mBMfbFDWmbNNgATVf+uGzGsGTxBnqWui5Mki5cEFsUaog20yzm
 ccvG+CIcdVWZDvQtWjcu3fjypdAxu3E5EK1ob1Yzab0ySxUQkKnfmSdoGaS4zJ6SaoxI74iUn7r
 MrRqXz9sY/o1e4ptm/ueDIb9oyHFosrF/maTRjy4M+QS5lTShbrMGcftUrdOpiZqcuSTIjEWaPn
 /DSkK5J9JZaYOnJ6mStmhu0sbdkFX8Aaj3Qo4kFQIGkaNGtMZi95kuCzj20UCRrlMH4FmoGzoEN
 S5ZKwaU+W0HOs5GX07Q6DhDTH12T+jlLRQq43kKbm2SG4ie0K2tlzmJFalYmZGR/gqs++A3/KmI
 WM9bQV9k7fjns8OCDFMGHMvKKmqs08F1uK1KBSEcYe+c9e0v1MAVAD2aXUb/4q3/x52HurjapuC
 y45skmbW/JutRroHk1tzEqU0xIJT2DQwQfVWVXZnl9cy3SNUusStoU6gA8D8y7/b6rkifk/VGtB
 K1qPEl0GVrDMYh/mTXEuxCWQ8NhEEo8MLwLEGA8X7sYEkAwyqPlpOTNR5LVFO19NpGpzoerCr8y
 k46iL5Qw1cyeRIw==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The IIF (ISP InterFace) is specialized BRU version that reads data from
external memory using two RPF instances and feed it to the ISP.

The IIF support is modeled in the vsp1 driver as a new, simple, entity type.

IIF is part of VSPX, a version of the VSP2 IP specialized for ISP
interfacing. To prepare to support VSPX, support IIF first by
introducing a new entity and by adjusting the RPF/WPF drivers to
operate correctly when an IIF is present.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Jacopo Mondi (6):
      media: vsp1: Add support IIF ISP Interface
      media: vsp1: Enable FREE interrupt
      media: vsp1: dl: Use singleshot DL for VSPX
      media: vsp1: rwpf: Break out format handling
      media: vsp1: rwpf: Support RAW Bayer and ISP config
      media: vsp1: rwpf: Support operations with IIF

 drivers/media/platform/renesas/vsp1/Makefile      |   2 +-
 drivers/media/platform/renesas/vsp1/vsp1.h        |   3 +
 drivers/media/platform/renesas/vsp1/vsp1_dl.c     |   7 +-
 drivers/media/platform/renesas/vsp1/vsp1_drv.c    |  14 ++-
 drivers/media/platform/renesas/vsp1/vsp1_entity.c |   8 ++
 drivers/media/platform/renesas/vsp1/vsp1_entity.h |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_iif.c    | 134 ++++++++++++++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_iif.h    |  31 +++++
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c   |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_pipe.h   |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_regs.h   |   7 ++
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c    |  66 ++++++-----
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c   |  42 +++++--
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c    |  23 +++-
 14 files changed, 293 insertions(+), 47 deletions(-)
---
base-commit: 94794b5ce4d90ab134b0b101a02fddf6e74c437d
change-id: 20250123-v4h-iif-a1dda640c95d

Best regards,
-- 
Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>


