Return-Path: <linux-media+bounces-10095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 639A28B1788
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 01:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20D572865C4
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 23:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3B116F916;
	Wed, 24 Apr 2024 23:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BCpDfuL2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278CD16F296
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 23:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714003078; cv=none; b=WGJ5nnr/pMC9rEDKo4nUcD79sgPm+J9VX0YuvBFNND48yLirqEO0Q/a5dPgt9Ofc3AFD0cUh+QxtepgNjAm5DBOmV8zdDYSHHKVRx16zFpt2Gs53pMG9E0RGpTTQWHwAMiLsZTMGzqCCq+F64EYQteDbeOKQtdvPZydkbNeHUpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714003078; c=relaxed/simple;
	bh=XDgtgyB7iuoTy8nBr1sgTVbvQfUsx/cX4VGmubee/1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tGBejWEqhnoinRGb3xrvsKr2DnuhpA3Fe80l1SzzzFJiR3qXCF6aDVLFkrN8RkkrIcYqBpTuY1+qw8NCnV/mOJYXe//+AH58gqdSyK02PHiskqW3tdmd5mfjjQFeLlIZ7+YdvMf0RGDibK45WnPw17NDhFEoEDZXxoPu7Cdfl04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BCpDfuL2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02C2C674;
	Thu, 25 Apr 2024 01:57:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714003021;
	bh=XDgtgyB7iuoTy8nBr1sgTVbvQfUsx/cX4VGmubee/1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BCpDfuL2uibj0gLC4d+TusJtYXuS2HczphAo5IY9mH5fqKZHqcjwLFeHIBdF4A1kL
	 Spco5C5Tr1GdxhKXPYwL00ucg/3VJ6VJ2MySlNR8YcmclSXXPQgbS7GaepOUBXLmXP
	 gUB7ZINWd902Lfkp6aKcvSDGPNvjN8zec4MGRjOU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v1 3/9] media: vimc: Constify the ent_config array
Date: Thu, 25 Apr 2024 02:57:35 +0300
Message-ID: <20240424235741.17093-4-laurent.pinchart@ideasonboard.com>
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

The ent_config array contains data that is never modified. Make it
const.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/test-drivers/vimc/vimc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
index af127476e920..2083c60e34d6 100644
--- a/drivers/media/test-drivers/vimc/vimc-core.c
+++ b/drivers/media/test-drivers/vimc/vimc-core.c
@@ -81,7 +81,7 @@ struct vimc_pipeline_config {
  * Topology Configuration
  */
 
-static struct vimc_ent_config ent_config[] = {
+static const struct vimc_ent_config ent_config[] = {
 	[SENSOR_A] = {
 		.name = "Sensor A",
 		.type = &vimc_sensor_type
-- 
Regards,

Laurent Pinchart


