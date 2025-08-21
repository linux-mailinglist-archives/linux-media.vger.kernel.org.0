Return-Path: <linux-media+bounces-40602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6612BB2FB1C
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE897AE4463
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8258A341675;
	Thu, 21 Aug 2025 13:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QOHWCwc6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46681341660
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 13:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783355; cv=none; b=mR3PCnd0nT0xMskMhK4NxpMRLkB1QBQJrKZqbhZg7THaIHdQd8MEXgd3Z0Q5FzPhlj+wdt6/B/q0nYuRaeOpAxt7VffCwsVZthM0zhefkYR6vQBLBnDwyUfIAiE1vMtZBd/w3rl1VJlKyWgNLcnsLg0GLzU+fu0rMWRSoDsm2E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783355; c=relaxed/simple;
	bh=ciExmzo9EJPLx3gD5Z3HNVmu1olV2ONrRUp+sH5Nk+Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Pg30LEL9A8rpEqupxMJet3+GR2qYFFb3iOqP6HlRGIkdvdz8t+SC2Up/vzA6ixbepqy8bIymZyXYzlBNT/Xrp2d2RmiLI4GnTVYVSeus5hmU1wVkHXPdUcU60wSa/A3cQEXYDHL7G4j6SCSrVwrDwn4IgMMK0SpeTI7emnsSS/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QOHWCwc6; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3b9e41037e6so663768f8f.1
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 06:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755783353; x=1756388153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8nelKIncwI/x1u9VaIkU0iKbGn5Mrkkuwzjfbier8s=;
        b=QOHWCwc60G+i1qxKSDJWZ6AtbRoMX0Xl4V98iyiQ4gm3qPk6Fn7I7/CGzPKjWE7bsY
         z+gLrex1PwTlDybhB3MhX30PZKrp7og60ajLi4Kiboyr5ZR3vryBM9c4scB0dXa5NyHy
         X6eslojGc3w8u59aZGMR+0sXB1cAc2tYPM2qYA4RbHEJzi8LnhxqKdqUESJArriLjpu1
         kFMh6t7v2aVJjB6desU1xQY8zxH+DeaRYIL2EYXg6bjKw5JBPjp0sr/MKUzsytGNYYCm
         IWa1XW+HarvJ6TKRAO9+FTCk7D7jHvt4ZZz1AzZN6p6cUeBFQlw9/FrnZppPJPEWali5
         asmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783353; x=1756388153;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q8nelKIncwI/x1u9VaIkU0iKbGn5Mrkkuwzjfbier8s=;
        b=J2WZsk4m7Dnrkj5a17YGJv31ndVmcB9UsChV3qpBvXOQMd132HsaGMMJjLjIXfAdZP
         9YaJ0p2LJPvvH7Z/UfuOxlxoMkhDL5lJ5ZI4+QLjkL9FXglUMQyI9ybG2nAD9bzXNMbh
         VmYBeGV7TiYIAIAFgAxqn/3EluPqgo7Y/kDGSjdDCwCrR/jbmkpyVf3pWXEUhTeFiWoM
         Ycvx+SZyFBBqJDXKpsarrbmSUrn6r4DCNumyjNDx7DjCcWd8w6aHWRVvIpAEGSqp6Slh
         MNwefUVr2cIk9nZouIw3OlVIpu6kEEcKDEwivhYaMF4wbUWfJYeNqg08Sf/A/BKqZP4+
         qE5A==
X-Forwarded-Encrypted: i=1; AJvYcCVqjisFCYdW9x2MrXhwf2qzBigSLxjglzFbz1Od98gMd5lv3qLBALHqtqtqdPyN8GaCtdXp+24bLlyhqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD3OVbtq/oeW5Vl2W+/HxtHHMTu1bJE6R+TaQ8C4+7eDr7j3H+
	erk6KgGRqSt+kBqsISZOHaimbi7eq/v1nsZDxi9gPnLq0yRj2m2AOIZoo/nKyvK7eim+CSvCFu8
	sAY0aVUuBMQ==
X-Google-Smtp-Source: AGHT+IGoeb9qMtnY0byB8qbwt2AQUvSpswXowm/lbVJEvWyPvIRthWMZy0Z/kNnivC3EcOI5uD+SgMqANpxc
X-Received: from wmbhc5.prod.google.com ([2002:a05:600c:8705:b0:458:6799:d779])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2387:b0:3b9:16a3:cf9b
 with SMTP id ffacd0b85a97d-3c494fc64a9mr2439269f8f.5.1755783352693; Thu, 21
 Aug 2025 06:35:52 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:35:21 +0000
In-Reply-To: <20250821133521.2665734-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250821133521.2665734-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821133521.2665734-3-abarnas@google.com>
Subject: [PATCH v3 3/3] staging: media: atomisp: Remove return from end of
 void function in gdc.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fix checkpatch.pl warning on useless return on the end of the void
function.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc=
.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
index bd44410729bb4..0906f1d1051b7 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
@@ -43,7 +43,6 @@ void gdc_lut_store(const gdc_ID_t ID, const int data[4][H=
RT_GDC_N])
 		gdc_reg_store(ID, lut_offset++, word_0);
 		gdc_reg_store(ID, lut_offset++, word_1);
 	}
-	return;
 }
=20
 /*
--=20
2.51.0.rc2.233.g662b1ed5c5-goog


