Return-Path: <linux-media+bounces-15712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60300944DB0
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 16:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7750D1C256FB
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 14:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E2B1A487B;
	Thu,  1 Aug 2024 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosalinux.ru header.i=@rosalinux.ru header.b="ICzdFklB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rosalinux.ru (mail.rosalinux.ru [195.19.76.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24A916DECD;
	Thu,  1 Aug 2024 14:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.19.76.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722521310; cv=none; b=Ye8GwrDqbOf4N44LskInENazaAiy1LY+zb5EjblqY52hxjrB/c49bKc46hA1oFOINf3ioTXidKYh3fuz9I1QVWBEltjqhQCd1ipHo0MSlQlS3OSYFnxEpQqEIyTnhX1zJgtM0TXm84emIWegChoRK3J2d/IJlG5lP2bOdjBpN4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722521310; c=relaxed/simple;
	bh=+wIP2IpBSze0xXSCICsVKYMXwNpOamqXqxQrr1Bo4fE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XQGVv3XO3xy2WS5hP7e6KsVjNYzo1YRCTX7CzZ0BdMqcCpeC9zAczif5WmAMt1c98QXpWAV3CI8tD2m/zzoyWC/ZrfCxUVaghEoua+vIlDJm0J8aUZcVS5Galt6AIhSLGzIM4WSaAk/8rjj6FRj1tRs6KlOXlkOSMEY0Zgo6EcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosalinux.ru; spf=pass smtp.mailfrom=rosalinux.ru; dkim=pass (2048-bit key) header.d=rosalinux.ru header.i=@rosalinux.ru header.b=ICzdFklB; arc=none smtp.client-ip=195.19.76.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosalinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosalinux.ru
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id EA58FDF0CB95B;
	Thu,  1 Aug 2024 16:59:10 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 2Vm2f6NnzNIT; Thu,  1 Aug 2024 16:59:10 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id BEA44DF0CB95C;
	Thu,  1 Aug 2024 16:59:10 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru BEA44DF0CB95C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
	s=1D4BB666-A0F1-11EB-A1A2-F53579C7F503; t=1722520750;
	bh=nyt6BxCMhJ7NmxYlOnTb0vneDAkrEuic8pbknsp9NjM=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=ICzdFklBGI12G3g32z/WJbbW3wiTWHjij5NN8OJQg4Fe+/rfUaebH91M2ThC5nQ0g
	 5XK9/tXhe9c5p4bm45hyHxgNSlEOfVlW2F/QPsGv06sJad5BxqcidXfr23hxpBFXEK
	 T88FaNP2A/LkHpPTM1tFdaXlkRTVmTCREyrN8suFgEZgaw/4Oc/sBW5bxtr3m5LFtH
	 cZkjG8bxg4dIrHRSP1sWIOczV0kCtL9kMksKDqQxNriYBqo0Kw+0sFUQnKdXgYLTn8
	 Kld0E7AjeaSqoX3tcB/AEaMmEAPKUkVhWQXE7+8SHyISdCR9PWJuOrmE8VNDLcEdZT
	 IHKWic8v5G/0w==
X-Virus-Scanned: amavisd-new at rosalinux.ru
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id T3tdluQnV2nU; Thu,  1 Aug 2024 16:59:10 +0300 (MSK)
Received: from localhost.localdomain (unknown [89.169.48.235])
	by mail.rosalinux.ru (Postfix) with ESMTPSA id 869F9DF0CB958;
	Thu,  1 Aug 2024 16:59:10 +0300 (MSK)
From: Mikhail Lobanov <m.lobanov@rosalinux.ru>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mikhail Lobanov <m.lobanov@rosalinux.ru>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: 
Date: Thu,  1 Aug 2024 09:54:28 -0400
Message-ID: <20240801135649.76995-1-m.lobanov@rosalinux.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Subject: [PATCH] cobalt:  adding a check to the driver

This patch addresses an issue in cobalt-flash.c where the return value of=
 the mtd_device_register function,=20
was not being checked. This omission could lead to unhandled errors if th=
e registration fails.
The patch adds error handling by checking the return value and logging an=
 error message if registration fails.
It ensures that the function returns the appropriate error code, improvin=
g error detection and the robustness=20
of the code.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 85756a069c55 ("[media] cobalt: add new driver")
Signed-off-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
---
 drivers/media/pci/cobalt/cobalt-flash.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/cobalt/cobalt-flash.c b/drivers/media/pci/=
cobalt/cobalt-flash.c
index 1d3c64b4cf6d..06ad9aaeff1b 100644
--- a/drivers/media/pci/cobalt/cobalt-flash.c
+++ b/drivers/media/pci/cobalt/cobalt-flash.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-only
+/// SPDX-License-Identifier: GPL-2.0-only
 /*
  *  Cobalt NOR flash functions
  *
@@ -104,6 +104,10 @@ int cobalt_flash_probe(struct cobalt *cobalt)
 	mtd->owner =3D THIS_MODULE;
 	mtd->dev.parent =3D &cobalt->pci_dev->dev;
 	mtd_device_register(mtd, NULL, 0);
+        if (ret) {
+        cobalt_err("Registering MTD device failed with error %d\n", ret)=
;
+        return ret;
+    }
 	return 0;
 }
=20
--=20
2.43.0


