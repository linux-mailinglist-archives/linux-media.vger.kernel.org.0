Return-Path: <linux-media+bounces-10096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6FD8B1789
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 01:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FBC71F24971
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 23:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E05171679;
	Wed, 24 Apr 2024 23:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L+4lgZLx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8F316FF28
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 23:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714003080; cv=none; b=FzmZLDhCzUFY151b1EBoXr2/NkL7D+zI8SlStq1Rymfd/Ze44y9kxXmGdb8qwESlurjrvc6porx7nNZfUlwbGGTu8cdFkGwtVLh2S+fdTJfHwDpnn6rZ9gu0aajxf2tLDQKjgYrwjnYRvZp3BJhqEtHqM3gW8tT4IfWTBbJ4RHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714003080; c=relaxed/simple;
	bh=r7TZlPWwRVT26vVbFP+I9+wHy1UW1sysVM12nMCRzJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFTTZbtBTrs0jlxM7Q8G1f9m6o0AIEUlnbGhdZ6oQjszF5c6zChAg/sJIT2pUHe94g3cSzP1DbGYZDRCnJP0fd60q/MqKSXJYeUNZt7CVsVXocOOxAgHrOc6a8v6CV/ByMyc5n4gFaKqhhrTEhtruxJr+0Rf1Zc8OI1v1AdcD7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L+4lgZLx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0D7DB0B;
	Thu, 25 Apr 2024 01:57:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714003021;
	bh=r7TZlPWwRVT26vVbFP+I9+wHy1UW1sysVM12nMCRzJc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L+4lgZLxIC/D2yLPesDeelpPT1Zz/bhD0fkpytKXQzMnFUs7UI4tf/Ldp20FOHZTM
	 Fgim/tdz4pM+n3vuSG+hoVxhgniGO+JmSBGcLidQcWWSStRl3EvpQ9LR9lP45fPE6m
	 7EGXkl5Vn3CCsC9RJ57M9Hjfj0taZjmRCIe0Jx68=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v1 4/9] media: vimc: scaler: Rename vic_sca_pad enum to vimc_scaler_pad
Date: Thu, 25 Apr 2024 02:57:36 +0300
Message-ID: <20240424235741.17093-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vic_sca_pad enum's name has been shortened to the extreme for no
good reason. Rename it to vimc_scaler_pad.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/test-drivers/vimc/vimc-scaler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
index 3e32cfb79c64..013cd84f82be 100644
--- a/drivers/media/test-drivers/vimc/vimc-scaler.c
+++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
@@ -15,7 +15,7 @@
 #include "vimc-common.h"
 
 /* Pad identifier */
-enum vic_sca_pad {
+enum vimc_scaler_pad {
 	VIMC_SCALER_SINK = 0,
 	VIMC_SCALER_SRC = 1,
 };
-- 
Regards,

Laurent Pinchart


