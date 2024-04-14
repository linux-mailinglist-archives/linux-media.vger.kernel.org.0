Return-Path: <linux-media+bounces-9286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8118A4589
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 23:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 772D31F21BF3
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 21:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECEF136E0C;
	Sun, 14 Apr 2024 21:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zlz39vWB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35698134CE0
	for <linux-media@vger.kernel.org>; Sun, 14 Apr 2024 21:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713128956; cv=none; b=ebVV33E6ZbdJi7KHfHmIIDe3tQLQPrejmcJgRfy1RW1D7MVjQA30wh/0PMk4c/6UwDV6ZoloWkjBHAN7z0nTxddWOTdiGDvLGaymodJhdffNz7il9WIbz5fjjet0S7UHBHIFG6cmjROHfIilMPrG24hcFm2punqolBNKyf6E1Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713128956; c=relaxed/simple;
	bh=ZUDR4BkouYMkjgRgukvzr6cNFVehEvmbsKuuyCE6H3k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L57RqBHvcD0CPnAPhnSgFGvx2SFqFOx93XEb6JmhXtu4qatRsbxlisjKtfRuO6Td1ONFwksEa1tCJMno6F5xXW44CxP/ERdeJiITA4Z9HRUdc3MJRHmi2Hsev58sG2epSLdHus9h50kRrXQ4dAqZgyv2lBA4AOHqra1Fvwvk2DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zlz39vWB; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2a58d2e5be8so995065a91.0
        for <linux-media@vger.kernel.org>; Sun, 14 Apr 2024 14:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713128954; x=1713733754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iSMfzoEnV8/Rld53bajw0+MQbqMxYTk3CWBnGIobWAA=;
        b=Zlz39vWBafM51l6kJAcuMbBauOwvSjXbEJBkV9rFuqVA/dheXgZdLKrFQh3WryFzk4
         QP0VNojS0pPOHOA7NrmtfWAudvvLRyW82YOjKNXRC5zUDJIHf2BDkdtPq7POt+RajX9w
         MXowteg0z6K29RfVmAlnrQmTBgHrbQDHE1nbrVUOoQzeSS02NOHlrbXTJYFnVrqNigZK
         OySckKWled+UHjgQ3LX3Mh82/CIsdzNMvquNRPzrb37kzt9rBp45AT44yJzIhX+5xB1+
         ZJxo/9ZD3e2I3MkDRWFWZKiS8XNHpi362VCb9ipdMhZ4sPYSSPHY1yx3QGA1x+XRFXdi
         3AWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713128954; x=1713733754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSMfzoEnV8/Rld53bajw0+MQbqMxYTk3CWBnGIobWAA=;
        b=PVlti+Lvw0UN04eHZiQDD1R9LvXxAxqsEhRhkLI+Zxk+Ps2juFT5/bkuS1O1IHfPSm
         D6qavZHKJYA40TI82+p/3cR3Iz8Wh2xTEVRL0efkcKjvdvkbtpR8lLGuKfpmmstZvL6m
         TJckNxzEuqyKzZyW/lk8EbgrEFG/fzr8pHSUmxtoJzhMmQNNNykXaZyXlrvN1warYocV
         ylhgY+3pqTfXLEUOHxsl1ixT8EQ31bJ2cQ3WQanz/+tbhrCgylXoHr7TZWim/z786i3H
         QItVtkRlExXaltrTp4/HgeMBj/QLbqZKEqqI/KsUPILicSkCPo8s9X/tWaYUmqLuWW/u
         4tjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCTZ3L9YzCQ+Ca7DyCtqcYJ/zB+9F5A0UxBHy8IUr1s0H61C3MrSWnb7o6QNad/epYxmpHqktpt2ZINCl0hs75YSyVHepZMa5mzPo=
X-Gm-Message-State: AOJu0YxDo0c4AoyInLeBLimywAzv7CnWCYR/dsFHWIxrhzeP4PMirlwL
	O3kr91M2zUiV7GuGEHQXyPHh3sR1+9vSynRV8lie0wR0ZldmibgF
X-Google-Smtp-Source: AGHT+IEE2LpSMJgrzbAtg8C5tMwXz6FOUnW7T+Ln8jj811Ik4C8T5kYdaYFRLl/m5m9ewSPOhUucKg==
X-Received: by 2002:a05:6a00:399d:b0:6ec:f406:ab17 with SMTP id fi29-20020a056a00399d00b006ecf406ab17mr9268725pfb.0.1713128954341;
        Sun, 14 Apr 2024 14:09:14 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:aa8a:a0c2:133a:a27c])
        by smtp.gmail.com with ESMTPSA id b15-20020a631b0f000000b005e857e39b10sm5929216pgb.56.2024.04.14.14.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 14:09:13 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: rmfrfs@gmail.com,
	hansg@kernel.org,
	linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] media: ov2680: Do not fail if data-lanes property is absent
Date: Sun, 14 Apr 2024 18:09:06 -0300
Message-Id: <20240414210906.3497879-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Since commit 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint
property verification") the ov2680 driver no longer probes when the
'data-lanes' property is absent.

The OV2680 sensor has only one data lane, so there is no need for
describing it the devicetree.

Remove the unnecessary data-lanes property check. 

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Fixes: 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint property verification")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/media/i2c/ov2680.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index a857763c7984..4577a8977c85 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -1116,13 +1116,6 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 	sensor->pixel_rate = sensor->link_freq[0] * 2;
 	do_div(sensor->pixel_rate, 10);
 
-	/* Verify bus cfg */
-	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1) {
-		ret = dev_err_probe(dev, -EINVAL,
-				    "only a 1-lane CSI2 config is supported");
-		goto out_free_bus_cfg;
-	}
-
 	if (!bus_cfg.nr_of_link_frequencies) {
 		dev_warn(dev, "Consider passing 'link-frequencies' in DT\n");
 		goto skip_link_freq_validation;
-- 
2.34.1


