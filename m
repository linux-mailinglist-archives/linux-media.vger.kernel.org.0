Return-Path: <linux-media+bounces-25906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 044B8A2EBBF
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 12:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA9A03A6DDB
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5FF1F5612;
	Mon, 10 Feb 2025 11:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9WyhbCt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F12D1F540C;
	Mon, 10 Feb 2025 11:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187998; cv=none; b=tI0P64nNoEbX3mhIAE20/hBtbXGp1gmpEc1kuXz+K3SwcA1vuz1oNY5A22y8SYNx2YbxgMg/nqfT3KpQD+0A8MF2OiyGDiN8h2nS0W6JX9xD/w9BI+X8yvoHjqGdFHMjpofbFWW/3MElIBI7laMaAfj81q1Y6DAFGdey/fcZ6Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187998; c=relaxed/simple;
	bh=oiV3oL9dSD4CI/6Eb1rg9fApuIg6n3xWhtO/IS5Xd48=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O7KXIrpridJ8H/3ICQsDoIqdLvW/cIEW/jMt/Y6ukGHE9W9+dgCJLnEpQkJPmPqClh19rsppD4FKmU821HU9z4OcIjF4cozHeBLwDJVSsDJ88I21btItr0RJsR5qeKsUNsYaJHILhCSdu/iemQ499Nje6JTwL8jx2A4xgrYZ5lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9WyhbCt; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab7cb1154abso80040166b.0;
        Mon, 10 Feb 2025 03:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739187995; x=1739792795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cHOLKsMbINIaOJV+51j6N1WbHFmr4xoYh8MR/djTMs=;
        b=P9WyhbCtbNBI6CLG1Aip4ammIGtd70bzSzCPDZg3qEnKYpKIFmxcekkjAiEakvteiH
         JFF1jeo9f6NY1As+vooVCGmPTqyBl+E9qqSXCuvwJ6Yo/RTpUqAyMGkyEW0lzDt7ueLi
         swaJhMN+az0NeT10dMw/dm900KmoOC71mlJWi0Hxtum0kF/3TV2zXmiiPt8zhuu1OOsa
         V/kpAa2dz5jJbOErzU7Q+1Hq0+boji5KKibPEvW1v1auJGuzAvVg8CNqmgXhIsCy2GVL
         Jik/j9LTC9cfK00i/tsDPAy2uhSnMq2NP/4Pc44e6EvGb6iHdDfAaZMn0eDGc1RMOOYD
         5maA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739187995; x=1739792795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cHOLKsMbINIaOJV+51j6N1WbHFmr4xoYh8MR/djTMs=;
        b=W4msDnMckXR7pi9Ey/Ed/sElA2nLtX5J3Trj09xsnpPqDDjUncWWG+NmBMOzPAa1Qn
         J2IF38QDSke9HkiYPRk5V6/6iLgmVesqal4neQpf0KSJT4eTx8ssRHUGg5o6rcTumhiE
         Mz+0mBYx7HFZvXjCzolLc2vIL1HL24tKZ58/g3L6p4qRRxM5uN3c8lxEyBQwco2mHsoC
         XRro9LudJ+Vvpa6tnAoqC81X0OHTO7is1Nqnmof3DDy0OaY5Op9Bfp6AssM/d3Gjhi2c
         pWwa0MjRVNTpnPvj5Cg/O3h5KpD0z3GY8e7x/9eHpx+jxfUNXECo47cuhWMxCDxaNU8G
         BLXA==
X-Forwarded-Encrypted: i=1; AJvYcCUj8NKa/YuqysARBghDdvYkETo7Ws6M4OTjHRax2XI2M4ASVNi7SRjY2Eeah7iJAu1Lgi+i1QwMEEAQ74A=@vger.kernel.org, AJvYcCX9ZYu17O893YwFzLpXI5WrGMN0UueyFbHTaXILKAwwXFQcYkKoGv8onWFvSymQ9q/scXlwlTcCE4m+OyRT@vger.kernel.org, AJvYcCXIWxd08+jnPaBTiWEJM/+2yGjtd4XqTFe7nxn6ug/FrXnkLHORfd9OlEDiBoyt+skudSaflH0WzQ8+@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ6lP/oPLsIUZPk1w1Mud1ngZ7NqgAYdMYqvi9db0orFUZQYNz
	ixHj4FwgE+5NY0CogQLtvVGG2mq1ECdBZbejPjYdZUacuYi0LSv8z8eKDQ==
X-Gm-Gg: ASbGncs6pyPMGgMptQoHofOp+Y7DuNSmopRBeKOgn7xUnmtE4QIkPo0/uWCUMIVyp/m
	nbJxNbHiEAjs5baH7ahQ0BSzd3bmDmqetf4d0jyB8LN0asmpIsEfMAz2luDjH6ontJatL8cgQwv
	SaMd0Tvqim+uEkFasyAx/Vw9/w9s/DtLv0m2i3K7ttvyxv4ObfLVdXFUsscSFRscrnnKEzA9iVG
	7pp2X3Vq0bbpwxzmWhouDtgNQZbrmoh7daifiAVRWlLwn3ndfa/1W0OKNUdtnM98pJNH0MXf+/2
	4lBBctLCP0RctHGNNpY3aA5tUrxQOrLHkv+YtwyEkuljderyJZJjZiQLjzohORPwr9TMgRYuJLD
	P8Hcb32ZDzzvzA5h4loJrMuMc8xc=
X-Google-Smtp-Source: AGHT+IGiMPiccONylC0UKLjyKhZ3k7AFdWfFUq7AG4w3wNHe1IsClqnJ+KBsn761/bgnqxFp08ff7Q==
X-Received: by 2002:a05:6402:40cb:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5de45070884mr29082944a12.23.1739187994776;
        Mon, 10 Feb 2025 03:46:34 -0800 (PST)
Received: from tom-desktop.example.org (net-188-217-54-237.cust.vodafonedsl.it. [188.217.54.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7a9e6e06fsm428948566b.80.2025.02.10.03.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:46:34 -0800 (PST)
From: Tommaso Merciai <tomm.merciai@gmail.com>
X-Google-Original-From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
Date: Mon, 10 Feb 2025 12:45:38 +0100
Message-Id: <20250210114540.524790-7-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use newly added devm_pm_runtime_enable() into rzg2l_csi2_probe() and
drop error path accordingly. Drop also unnecessary pm_runtime_disable()
from rzg2l_csi2_remove().

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 948f1917b830..4ccf7c5ea58b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -805,11 +805,13 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = rzg2l_validate_csi2_lanes(csi2);
 	if (ret)
-		goto error_pm;
+		return ret;
 
 	csi2->subdev.dev = dev;
 	v4l2_subdev_init(&csi2->subdev, &rzg2l_csi2_subdev_ops);
@@ -834,7 +836,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	ret = media_entity_pads_init(&csi2->subdev.entity, ARRAY_SIZE(csi2->pads),
 				     csi2->pads);
 	if (ret)
-		goto error_pm;
+		return ret;
 
 	ret = v4l2_subdev_init_finalize(&csi2->subdev);
 	if (ret < 0)
@@ -852,8 +854,6 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	v4l2_async_nf_unregister(&csi2->notifier);
 	v4l2_async_nf_cleanup(&csi2->notifier);
 	media_entity_cleanup(&csi2->subdev.entity);
-error_pm:
-	pm_runtime_disable(dev);
 
 	return ret;
 }
@@ -867,7 +867,6 @@ static void rzg2l_csi2_remove(struct platform_device *pdev)
 	v4l2_async_unregister_subdev(&csi2->subdev);
 	v4l2_subdev_cleanup(&csi2->subdev);
 	media_entity_cleanup(&csi2->subdev.entity);
-	pm_runtime_disable(&pdev->dev);
 }
 
 static int rzg2l_csi2_pm_runtime_suspend(struct device *dev)
-- 
2.34.1


