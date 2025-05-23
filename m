Return-Path: <linux-media+bounces-33245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B47FAC209E
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 12:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15A834A6E84
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 10:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1964A226CFD;
	Fri, 23 May 2025 10:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pHvfurta"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84421DD889;
	Fri, 23 May 2025 10:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994877; cv=none; b=CGe9iYgzMXbs/uF1e0nXyfpGFUXYldt9ZGLw4SZ6b05HhjaXQYCNuL6/mF08rx5gocyz5WQe9G7aXc1STFDMg2U3JrhRKln5LNQwv9jFP3VBd5oejUS3ZZtr0kCvZTy1CdYMMLl2JYrhEgZEm1Nni4qRQwiGoFGidxsC7KqScqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994877; c=relaxed/simple;
	bh=bElBq/KjMYNxvtZnPGAHpUkChi7qdQIIEQkH2F10hAI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eoIqli3/CNBtrL01D6bhLM9b8UTTLKaU/Mb8pW0bTiNISwe3vLZMEs1w6iHcXORzNcSI8NZVIsPCif99rocHpZZrGoeOCYGJg7eIUeiWfHLQeaUH4x/3itF8PNDagNb7w8nMu/5L/9nCfvfE8R7gWwyD9yVeb96rCf7GMdlSen0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pHvfurta; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:a882:21a2:2327:ac4f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7D13346;
	Fri, 23 May 2025 12:07:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747994850;
	bh=bElBq/KjMYNxvtZnPGAHpUkChi7qdQIIEQkH2F10hAI=;
	h=From:Subject:Date:To:Cc:From;
	b=pHvfurta0vUf2KuUuyqPiI4DAiUvLRH7wZgq++AMbeLxVQjCZZMN0KBR5Vnf3U85Y
	 pEg7XvHPSU5k3VsODWQfbGD1+ADy1WxDs+n+plUvpF9CnTOE7EVX8IHFzgnN6Dx9N4
	 TFllHP+yMFBr/paVfvNLfUXfMCRbxEpEM61JTsP4=
From: Stefan Klug <stefan.klug@ideasonboard.com>
Subject: [PATCH v2 0/2] media: rkisp1: Add
 RKISP1_CID_SUPPORTED_PARAMS_BLOCKS ctrl and WDR support
Date: Fri, 23 May 2025 12:07:30 +0200
Message-Id: <20250523-supported-params-and-wdr-v2-0-5a88dca5f420@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJIMGgC/03MQQ6CMBBA0auQrh1Sh5YEV97DuBjoAI3SNlNQE
 8LdbVy5fIv/d5VZPGd1qXYl/PLZx1CAp0oNM4WJwbtihRqttthA3lKKsrKDREJLBgoO3k7g3Ni
 mMz1j64wqeRIe/ee3vt2LR4kLrLMw/Q/xbHVnTG201qYFhLzySKF+PLfp6h1TjqGPJK4e4qKO4
 wtmDdKzsQAAAA==
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Stefan Klug <stefan.klug@ideasonboard.com>, 
 Paul Elder <paul.elder@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.13.0

Hi all,

This series adds RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control to query the
parameters blocks that are supported by the current kernel on the
current hardware. This is required to be able to enable/disable the
corresponding algorithms in user space without relying solely on the
kernel version.

In addition to that it includes the WDR patch by Jai which is already in v5 and
was reviewed here:
https://lore.kernel.org/linux-media/20250521231355.GN12514@pendragon.ideasonboard.com/

Version 2 of this series drops the unnecessary initial cleanup patch.
Patch 1 was updated and has a local changelog. Patch 2 is unmodified.

Laurent I didn't collect your tag on the first patch, as it was a bit
more than touch ups.

---
Jai Luthra (1):
      media: rockchip: rkisp1: Add support for Wide Dynamic Range

Stefan Klug (1):
      media: rkisp1: Add RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control

 .../media/platform/rockchip/rkisp1/rkisp1-common.h |   2 +
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 150 ++++++++++++++++++++-
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |  99 ++++----------
 include/uapi/linux/rkisp1-config.h                 | 101 ++++++++++++++
 include/uapi/linux/v4l2-controls.h                 |   6 +
 5 files changed, 280 insertions(+), 78 deletions(-)
---
base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
change-id: 20250523-supported-params-and-wdr-135394be26d4

Best regards,
-- 
Stefan Klug <stefan.klug@ideasonboard.com>


