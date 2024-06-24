Return-Path: <linux-media+bounces-14014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6FF914161
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 06:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25CEFB225B2
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 04:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE482561B;
	Mon, 24 Jun 2024 04:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="stakPYYw"
X-Original-To: linux-media@vger.kernel.org
Received: from msa.smtpout.orange.fr (smtp-82.smtpout.orange.fr [80.12.242.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B582C184;
	Mon, 24 Jun 2024 04:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719204603; cv=none; b=u0P5EdJmo9lzIxDNrhSPsR21RiJQfpfueRKYh03n0CbsVOGTr9yI4LMuVnyaK2f/ovy4/DW49FJE6+lmzHrCpAi52kElhBBq2ziCqqrfSM25wUc5jLE1vqyiFlQyxpV0FSRcPdTsB2TliQOzLlLPs5hr5xjXqqBEU+fubzTlCm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719204603; c=relaxed/simple;
	bh=uql83TR+LhFEbAqX/gSmzSwtbblR2rDJyV/rXbSUJjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J+07Fi4W1VT9RL02VOpauWBVljhBwxFo1nRObk/c1ODT+iWr0D4OOCDZ9ahOwTGnSWrw480vkP20bBbKRUQ3OArAflmy14PtDaSvUu9a4YGkLweo9iwyPKBFME+y0e+5zBVet5GuwZpnCSpoyjusKPASx2nq4w3BaWKpRGaFDt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=stakPYYw; arc=none smtp.client-ip=80.12.242.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id LbVTsQqVmgtIjLbVTscF1s; Mon, 24 Jun 2024 06:40:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1719204045;
	bh=qPoWHq3Ne6R96KbVu+6syweqYC10tItN+9c5RNppYnY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=stakPYYwd6jdG4ImX8Az5WVzf4+Edhb5JXs/PH6FM/FYxoU3IYGpeB7zqCn3jBXXT
	 Fy7J5R3ilAk1TBV75rBO3Rb/It0rd5Ru/w5dqd7z/I5TSd8P7BjYeLdgmTlvCTzPZM
	 cBBMS0XcRsvY/ueCy1polacmVRmPUn5QDm+Y/t1xdE6yHkmmjvgErnuC6ilV71zsmr
	 EPtCCspGh53Qg2CBPQlWJYYd04HMOSKgSDbrFfDkr2N5mvXVzEROG18ZZiXn//dNTs
	 0Uubl9zedTH5ded+ThIWuIXYpD0dHtc6yq5IoIdSyhq+uetHtTvmxAee+Qe5ib+8cB
	 0uYCO7/V0KHiw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 24 Jun 2024 06:40:45 +0200
X-ME-IP: 86.243.222.230
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Benoit Parrot <bparrot@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: ti: cal: Constify struct media_entity_operations
Date: Mon, 24 Jun 2024 06:40:38 +0200
Message-ID: <fa248cf5c11c480e73a342ab3b3fb2aa93c21e47.1719174792.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct media_entity_operations' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  20694	   1394	     32	  22120	   5668	drivers/media/platform/ti/cal/cal-camerarx.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  20726	   1362	     32	  22120	   5668	drivers/media/platform/ti/cal/cal-camerarx.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only
---
 drivers/media/platform/ti/cal/cal-camerarx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index 4afc2ad00330..42dfe08b765f 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -798,7 +798,7 @@ static const struct v4l2_subdev_internal_ops cal_camerarx_internal_ops = {
 	.init_state = cal_camerarx_sd_init_state,
 };
 
-static struct media_entity_operations cal_camerarx_media_ops = {
+static const struct media_entity_operations cal_camerarx_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
-- 
2.45.2


