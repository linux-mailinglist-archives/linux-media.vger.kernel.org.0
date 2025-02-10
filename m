Return-Path: <linux-media+bounces-25908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E67A2EBC2
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 12:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 457C2167061
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72121F8904;
	Mon, 10 Feb 2025 11:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdGFoGjw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4141F76B3;
	Mon, 10 Feb 2025 11:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188006; cv=none; b=gw5zGR6olLbqlbe1ugGcPIjH6VMCKnqFyn55VkHtVRdw6sDGHn0UpauB5qy6KStuq4pMNN24tqFlpqPiIyyXEvHVX1ATtKVMZoozl1k6nlgO2XHpvTVk1jnOcijevBv9P0epRfT4PLj4fXmqGDmil1Y3aMWmWJBJ79uL1n656bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188006; c=relaxed/simple;
	bh=ByguyBXADWYTX/oRAJYRKQiHaqitMS1wE2xl0S/y6xU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M5RCorPANVFY8csvgLFFZK2msGtRJ7TwyJXMcHu76uBB6pKAxC8ZRRTW8phO5+L8f3jmYxrIepeo5YoHHzi8ERTDfz/lDksrMeKa6+P5QX+vpHdtBertFQNx35MWpLapXAXdrAjrtR1uThhxnhAVBXp/cIGrSUGY+4huaB0bRu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdGFoGjw; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaedd529ba1so536087366b.1;
        Mon, 10 Feb 2025 03:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739188002; x=1739792802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ONRQIkN6hOeMPC6pr5QUst9OFB5Ve/NbKINHvThgHg=;
        b=cdGFoGjwEZUSbbQG+Uh79HkC2PaagBS/wxdNE/dzQXuJxjkQa3nl78BczLmAQt9xqc
         RibLwehWUXVgNbc28LDeUp+K1KFBvmCMuL5Q5n1teru/fRSZg5BK54VEGrFSajK5cfak
         foyBaWYyWJDOxbuJU9il3eSlMabWAZ29tVJOGGpBQASx57moTT5F0BORRwTPCLb+KpZy
         fkHX9xkIWgclo93gL5j9pahAKmz3eH0KqhMYum/+vPbFmtb+TR6IJ1IotpaUU57PzMly
         Gni7sYvOhnyv/O+XQlIfpduzhCCFgQfqyyaRLeUB99vjip/vX9v6abo/whjncS65EZlh
         fHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739188002; x=1739792802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ONRQIkN6hOeMPC6pr5QUst9OFB5Ve/NbKINHvThgHg=;
        b=cZKTv5AI4RYbxJhq30HwUO2nxD7QBoCDyi+nLX+M2g0v647z3dgywT0JITL8c0UJdU
         NMjkgtI16+G+wv4CreZQIa8j49bRRoTvAwYh5zI8bj9gk/eluPTj2gNpf9JQUSROyows
         bdjXZ/wIeCT/5cNcnSNDfldzCXUjLdcX2lBBAcpc3nWjkG+XKEzFjdpKX8lG6W8ITkVp
         wOXPSGSfeAaUL2OUhIBIL/mEIYei01v/pB5SuKnKDoYhWZI2XPQagi5EJQCQ2Zb2A3bG
         s9q1tY5GlQeCi/yPhyLIeygbdj4UPZWZ0vWiupZCL04pqSzm0p6Z0FCjSwGaK2EqQ8nq
         5CaA==
X-Forwarded-Encrypted: i=1; AJvYcCUwGMXT4dydeM+yO33hW0dMFLLA7m8VCJsPklX0IeWC3dfu4rbVTmxm/KmeoavIiLD8qZanGQ59v/tJ0/0=@vger.kernel.org, AJvYcCWy6I80n2ZAF4oEDJq1n8x4o7xzr6d4JFxYrJDevDVlh7aO+LE9mSMkSFe6Vbvru5dkqzLo+/NsvuQxEWAp@vger.kernel.org, AJvYcCXr5GZrzex/h+4s1lxxN/fgzMjaoOTB4P8LCCwuDE4hgWSdXkMpYewXrhW3M6MFOdoNG7nMMfh6EgaS@vger.kernel.org
X-Gm-Message-State: AOJu0YwlrtBSu+n5zeohCXzy31hfCH0Bzx28oWyabBLi7YqkHvfNr+eV
	VNl2GGWO8F3EaDo094EjiDD+k9cqhC+CUwTIvWDMIpenJMuKuCh+
X-Gm-Gg: ASbGncsNn4OLloybcAJiLASuM4HaU4SAt2W0vzf6ursobkGl0ZXfN/D/K6R+pNglLwm
	5TbWbx9nOQDWP+sdmbUsyk0TxrPrusLQUdv80+SPRYDChlrEzST2E4ivwVDjpf3/D5ZWmczIzpc
	CnkOO4lhl8fWdqslKDrYapqVRiV4yR97+OVBGoPJ687uQX8NorXkU2dRVxMQIH8id7ChhmySf8D
	wchVi64Q7t6ihkxvIkODjIItBs6wEWyURB0N6XImhdq/QFX8u5EgkMMRp/GZDOUWz2BGAXS56c/
	49T0KM7G4HCV7Dc2qdJFNMgLMtB5pxUPiwUOuioEq2rXc0y1z4CM+By4WH3jURhw0eEX9nzDsyt
	OZo+xDeWpiQQhD98WrXDo8UN4C7Y=
X-Google-Smtp-Source: AGHT+IHEAXMfF9ZZ1zfKKC4roNhEFvjRQ/KPi7La7Ne5MBIdI0BsVzZ518DZR9RFmVTLkdAeQcPxOw==
X-Received: by 2002:a05:6402:208a:b0:5dc:5a51:cbfa with SMTP id 4fb4d7f45d1cf-5de44fe949emr35419842a12.6.1739188001773;
        Mon, 10 Feb 2025 03:46:41 -0800 (PST)
Received: from tom-desktop.example.org (net-188-217-54-237.cust.vodafonedsl.it. [188.217.54.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7a9e6e06fsm428948566b.80.2025.02.10.03.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:46:41 -0800 (PST)
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
Subject: [PATCH 8/8] media: rzg2l-cru: rzg2l-core: Use devm_pm_runtime_enable()
Date: Mon, 10 Feb 2025 12:45:40 +0100
Message-Id: <20250210114540.524790-9-tommaso.merciai.xr@bp.renesas.com>
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

Use newly added devm_pm_runtime_enable() into rzg2l_cru_probe() and
drop unnecessary pm_runtime_disable() from rzg2l_cru_probe() and
rzg2l_csi2_remove().

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 70fed0ce45ea..5548b328d970 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -287,7 +287,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
 	pm_suspend_ignore_children(dev, true);
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = rzg2l_cru_media_init(cru);
 	if (ret)
@@ -297,7 +299,6 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 error_dma_unregister:
 	rzg2l_cru_dma_unregister(cru);
-	pm_runtime_disable(dev);
 
 	return ret;
 }
@@ -306,8 +307,6 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 {
 	struct rzg2l_cru_dev *cru = platform_get_drvdata(pdev);
 
-	pm_runtime_disable(&pdev->dev);
-
 	v4l2_async_nf_unregister(&cru->notifier);
 	v4l2_async_nf_cleanup(&cru->notifier);
 
-- 
2.34.1


