Return-Path: <linux-media+bounces-5786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88513861219
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 13:59:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D0141F22E0D
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 12:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B6A7E771;
	Fri, 23 Feb 2024 12:59:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5073311CB3
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 12:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708693172; cv=none; b=YwiHTFnTaol4CgoT/xsuI6IJJBk2+ZpIvwLU/ZCbvqK3HSOPIU8bKDndsN1LQaLbE7knHwfZ1Z2kGKALVlYpZSO2TsbbB/DvcihV7Dv5bCPmtntJMZXebVdU37/XqwhJm5n/ImngAXRVwOgDAuspjjgUns5GqFd0ueZZVQI0XjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708693172; c=relaxed/simple;
	bh=dNTdMhvFNVyajGGdPnCRtbGM3K5852fvZvh1CYrbK2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R/rhtqElSM7druaZCpxg2hQSdXR9d+CTnGTfPe9h2slwTT/r8Ru0t4Iowbx4/GSxO4uq11yAPfHMKDEEvjaIYHEwXJSSkk+bZijiH+UalHj9UW+Nz4anpQdVgMQnhr97ry01+Bd5cg2rFm7/FKeFsGgIer52PGXVqFGkJdx//NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9D-0005Vj-7r; Fri, 23 Feb 2024 13:59:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9B-002QaH-Cu; Fri, 23 Feb 2024 13:59:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9B-00AKBb-0v;
	Fri, 23 Feb 2024 13:59:25 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	linux-media@vger.kernel.org,
	kernel@pengutronix.de,
	Joseph Liu <kwliu@nuvoton.com>,
	Marvin Lin <kflin@nuvoton.com>,
	openbmc@lists.ozlabs.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [PATCH 0/5] media: Convert to platform remove callback returning void
Date: Fri, 23 Feb 2024 13:59:03 +0100
Message-ID: <cover.1708692946.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1449; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=dNTdMhvFNVyajGGdPnCRtbGM3K5852fvZvh1CYrbK2o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl2JaYWAXNZR/7vO+Bhsce5/fJuAZT6zSbuHJIf qyZmLanS2iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdiWmAAKCRCPgPtYfRL+ TsCEB/9hU+G65ugHIoFQGGiGBeQzlf7/ojqYt07VM6PK8HM5TcBKqVYRvdkr2G+JYUPSvJu0XA7 lkRiL1bokmXfTeF9di/aLwQqxGWm2k1n33BvnTAwUyEKs8Ku/WbNPVt3wcsJjXmsVmYob65XB8h XZcxwAx36IZliajjFgcX41VlwYyXbK5xj6QlQU1EnVJoMbrohK/as6V/nIahFkvM3usLvRpx9gn s6jMpbpohpPqfhnWRXXzljkY4193tKWCjbyvf6/oKEPjBn2lzwm+GrQ5XSgB5PM/eHd/zMLRHqj 8KyYqrTwsB2ulA89sHoPOQkHao/DjhfOrr3PBtyMCOHCKs5L
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hello,

this series converts all drivers below drivers/media/platform to struct
platform_driver::remove_new(). See commit 5c5a7680e67b ("platform:
Provide a remove callback that returns no value") for an extended
explanation and the eventual goal.

All conversations are trivial, because their .remove() callbacks
returned zero unconditionally.

There are no interdependencies between these patches, so they could be
picked up individually. But I'd hope that they get picked up all
together by Mauro.

Best regards
Uwe

Uwe Kleine-König (5):
  media: chips-media: wave5: Convert to platform remove callback
    returning void
  media: nuvoton: Convert to platform remove callback returning void
  media: nxp: imx8-isi: Convert to platform remove callback returning
    void
  media: stm32-dcmipp: Convert to platform remove callback returning
    void
  media: ti: j721e-csi2rx: Convert to platform remove callback returning
    void

 drivers/media/platform/chips-media/wave5/wave5-vpu.c       | 6 ++----
 drivers/media/platform/nuvoton/npcm-video.c                | 6 ++----
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c        | 6 ++----
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 6 ++----
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c      | 6 ++----
 5 files changed, 10 insertions(+), 20 deletions(-)


base-commit: 33e1d31873f87d119e5120b88cd350efa68ef276
-- 
2.43.0


