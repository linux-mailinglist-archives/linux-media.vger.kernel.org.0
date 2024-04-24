Return-Path: <linux-media+bounces-10031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A34C8B0BDA
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 16:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C7E51C22568
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 14:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930CF15DBB7;
	Wed, 24 Apr 2024 14:03:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AC315D5A9
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 14:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713967387; cv=none; b=grnu5oiHKpVlP2L6cCprcfGtbT2EC/8u3VhZqfCMljNyVRiBQXXML81XDvnj+ByKeiC5P0VV8A5JcDLywwDPLDTFjDS2K+/hRNJBwT1od30l6gZAtVbS/OEe/itCi2e51/IXq4E9ZfsrAgzSPkixc95/omkorKMk/5KDqdR4Q24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713967387; c=relaxed/simple;
	bh=Pg8txjRVbzj2hFRPqum3z0ZJAjjvEu2hliTjBoZOI7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PBhXDt+bFOHjHSnzKfeSpA0LKn9apQXY6n7jG6drosr6eM1ctl1KRabFHfkEBO0Q/VLjpYw7EGb0ZKHC9A6XvXQTcXS2WK53FclFERIR6wUnV8MKrAiB4FxeMSKC0K4Bz3OYnwn1fmlWQaR2LmYmvhQ9TfhZg7PGilMbwqgYB/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rzdD5-0007ew-NN; Wed, 24 Apr 2024 16:02:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rzdD3-00E5yh-Rx; Wed, 24 Apr 2024 16:02:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rzdD3-007pZw-2V;
	Wed, 24 Apr 2024 16:02:53 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jack Zhu <jack.zhu@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH] media: staging: media: starfive: camss: Drop obsolete return value documentation
Date: Wed, 24 Apr 2024 16:02:48 +0200
Message-ID: <20240424140249.542283-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Pg8txjRVbzj2hFRPqum3z0ZJAjjvEu2hliTjBoZOI7c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmKREJ4zoXWj4ZwD1KB7S775jSuQv2HbykNQU0c Sipn/zM08OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZikRCQAKCRCPgPtYfRL+ TvMaCACycmcXxx/NvkNYKICM6N6Hde8P57yZGXRhzqndIjNlmYghNYGKqhWEpPgoRS3H2q10Ebv vPM1yWZSIvVvMi0DbH7lT5/DqDfayep2lSa3YapKSQe2Iaa62GMJSgimpgION55k9I0BkDD7HVK y4MmJ78gLhgoQxA7bzBF0PsIMHeH6YZnUANqD8se7gd5xR1exf+VzY9sPZsw81RaoymJ6v0NkV+ LRy2uwIJAyeBG64m2Vhzkws/T+r58dm5AsDNwT85Zswtvf4hktIaua1R1kWErJos9gm3XIdAsW0 xUVWNR88qhBfXJOOCCD13J9jPinb8j1efszq99CJd+KyDksg
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Recently the function stfcamss_remove() was changed to not return a
value. Drop the documentation of the return value in the kernel doc.

Fixes: b1f3677aebe5 ("media: staging: media: starfive: camss: Convert to platform remove callback returning void")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

during review of the patch that became b1f3677aebe5 Changhuang pointed
out this patch opportunity. But before I came around to send a v2,
b1f3677aebe5 was already applied. So here comes a separate patch.

If you prefer, feel free to squash this into b1f3677aebe5.

Best regards
Uwe

 drivers/staging/media/starfive/camss/stf-camss.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/starfive/camss/stf-camss.c b/drivers/staging/media/starfive/camss/stf-camss.c
index fecd3e67c7a1..b6d34145bc19 100644
--- a/drivers/staging/media/starfive/camss/stf-camss.c
+++ b/drivers/staging/media/starfive/camss/stf-camss.c
@@ -358,8 +358,6 @@ static int stfcamss_probe(struct platform_device *pdev)
 /*
  * stfcamss_remove - Remove STFCAMSS platform device
  * @pdev: Pointer to STFCAMSS platform device
- *
- * Always returns 0.
  */
 static void stfcamss_remove(struct platform_device *pdev)
 {

base-commit: a59668a9397e7245b26e9be85d23f242ff757ae8
-- 
2.43.0


