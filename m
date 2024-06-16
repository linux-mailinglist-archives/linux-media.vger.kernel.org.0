Return-Path: <linux-media+bounces-13316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 439ED909BE9
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 08:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E63991F22596
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 06:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96BB16E87C;
	Sun, 16 Jun 2024 06:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="sgMLiiT5"
X-Original-To: linux-media@vger.kernel.org
Received: from msa.smtpout.orange.fr (out-66.smtpout.orange.fr [193.252.22.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C26D3D6B;
	Sun, 16 Jun 2024 06:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718519590; cv=none; b=tDzAwME3DhHQSWx9zwEaP5H3O0L82aANSNeo6f/PcS+R6HuHw7/HLJiaRqPpgmN06mlOrbMiybBrx7n7bVzOaFm47ZDHenZB7Ig1G/ow3fdleixc8BactG10Yp+jJ3ksYC47xKSvAz3+Uk9duzcjNYyHByAkFvYj/VC2lQWy5Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718519590; c=relaxed/simple;
	bh=yeoIMmYjnCnd/pF+KBMuEywu1kWoSjejTx402xlCfNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jPg/YmPhBfmjwyEuJEp74lj58CVdclqRO8papcn1Rya8aUHbAhKCKAPnJAPBBcZhXOnJwBOeN8DvL6QDv8UFn1rQZh3ii0uL+B90VKvyPYUY03P5L4xBDS+kT/RFlu0oDJ4KC+kO/8gGns0NF9LzUW3oG4fXmg918mjrlI5cgfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=sgMLiiT5; arc=none smtp.client-ip=193.252.22.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id IjRgskqeZcHC1IjRgs1VRU; Sun, 16 Jun 2024 08:32:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1718519579;
	bh=6NSWUuG4Lk7knZmNrGbInQc1afr3STzYY6T1YDhKlzM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=sgMLiiT5qNRVPo5JY9+6TQ00OTzgWM8xId95Ct6NGIpPBo6eQ9Hp+v6cZWJbY6ycW
	 8j/XloTOljJBBPAqxkjP0edNKeCHI2id2KUGjgd8tF0Pf+ChTpAHor1iDw9LYGaSN5
	 zxnX96UH8dvauHcJABiRWoBkxe4iQGEUtWYvEqS4Mq8BaBm2vlpNNRnS2P40gc0Oy2
	 tXP6WRCxxKxRhFDc8hvxBJx1ibRloNHJD1Vb5Ud+1/TXjUTJqF12tplH5JzPgVOXgJ
	 orogC+8OFuZBxbM4+o2EOElWh5HX4l3sP/pOMpb8sWkzh9/oT/zcHjhS2cm9gOhIoL
	 RolGPE2MIeSpQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 16 Jun 2024 08:32:59 +0200
X-ME-IP: 86.243.222.230
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: cx231xx: Constify struct vb2_ops
Date: Sun, 16 Jun 2024 08:32:53 +0200
Message-ID: <9813724e0fe5a8a7067bb37475226ff2e0f042ed.1718519562.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"struct vb2_ops" are not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  36607	   1156	      0	  37763	   9383	drivers/media/usb/cx231xx/cx231xx-417.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  36735	   1016	      0	  37751	   9377	drivers/media/usb/cx231xx/cx231xx-417.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/usb/cx231xx/cx231xx-417.c   | 2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index 343a4433ed24..abb967c8bd35 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1453,7 +1453,7 @@ static void stop_streaming(struct vb2_queue *vq)
 	return_all_buffers(dev, VB2_BUF_STATE_ERROR);
 }
 
-static struct vb2_ops cx231xx_video_qops = {
+static const struct vb2_ops cx231xx_video_qops = {
 	.queue_setup		= queue_setup,
 	.buf_queue		= buffer_queue,
 	.start_streaming	= start_streaming,
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 8f347bbeeb32..435eb0b32cb1 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -795,7 +795,7 @@ static void stop_streaming(struct vb2_queue *vq)
 	return_all_buffers(dev, VB2_BUF_STATE_ERROR);
 }
 
-static struct vb2_ops cx231xx_video_qops = {
+static const struct vb2_ops cx231xx_video_qops = {
 	.queue_setup		= queue_setup,
 	.buf_queue		= buffer_queue,
 	.start_streaming	= start_streaming,
-- 
2.45.2


