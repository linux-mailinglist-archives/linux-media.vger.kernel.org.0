Return-Path: <linux-media+bounces-25085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF835A188AF
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 01:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E64E188B3A7
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 00:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB2427470;
	Wed, 22 Jan 2025 00:01:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0798B1BDCF
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 00:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737504070; cv=none; b=F/kD1qF7ra/oTcWnaclEv589Hg7vMULlI5TwNY3w5sos5+RRP2W4aYdEOm3gCJ8NiPdwszylpbaO+ZkKtKsMgHfowFNGdoFAGXkH9JDuofT1VyxTFLUdLKimaVbuXfHH1jUgQczAGb3oYKsZHROGEDiIYyxerCWhexiai+y8VtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737504070; c=relaxed/simple;
	bh=n15X3Uxt7f0hOIdleyV7r32M0ZTRfA35s30PJIO+tZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OMvateM26bFyp9wEqgG3yVgyP5dW8/0wORaN/kyL2AC+Jfwe7Z93bGKg1vmKYLKDX9bjwBrmOaN4HcvvIBMd7WDz2qbHVoTn55GvAOJBxDiN158VGuXNVgW1IO1QbaouA0teOeJAGCrNdEih+amSmVNWKq+vuxBfWUyhhjoGiO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=basealt.ru; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basealt.ru
Received: from localhost (broadband-46-242-4-129.ip.moscow.rt.ru [46.242.4.129])
	(Authenticated sender: gremlin)
	by air.basealt.ru (Postfix) with ESMTPSA id 202D423371;
	Wed, 22 Jan 2025 03:01:04 +0300 (MSK)
Date: Wed, 22 Jan 2025 03:01:03 +0300
From: "Alexey V. Vissarionov" <gremlin@altlinux.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "Alexey V. Vissarionov" <gremlin@altlinux.org>,
	Manu Abraham <abraham.manu@gmail.com>,
	Luca Olivetti <luca@ventoso.org>, linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] AF9005: fix typo in the bitmask size
Message-ID: <20250122000103.GB12162@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Found by ALT Linux Team (altlinux.org) and Linux Verification Center (linuxtesting.org)

Fixes: af4e067e1dcf ("V4L/DVB (5625): Add support for the AF9005 demodulator from Afatech")

Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>

diff --git a/drivers/media/usb/dvb-usb/af9005-fe.c b/drivers/media/usb/dvb-usb/af9005-fe.c
index 404e56b32145f1e6..4621c1d24d578ede 100644
--- a/drivers/media/usb/dvb-usb/af9005-fe.c
+++ b/drivers/media/usb/dvb-usb/af9005-fe.c
@@ -453,7 +453,7 @@ static int af9005_fe_read_status(struct dvb_frontend *fe,
 	ret = af9005_read_register_bits(state->d,
 					xd_r_mp2if_sync_byte_locked,
 					mp2if_sync_byte_locked_pos,
-					mp2if_sync_byte_locked_pos, &temp);
+					mp2if_sync_byte_locked_len, &temp);
 	if (ret)
 		return ret;
 	if (temp)

-- 
Alexey V. Vissarionov
gremlin נעי altlinux פ‏כ org; +vii-cmiii-ccxxix-lxxix-xlii
GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net

