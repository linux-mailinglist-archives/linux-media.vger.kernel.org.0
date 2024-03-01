Return-Path: <linux-media+bounces-6226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 435A286E002
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 12:16:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D96C42854DD
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 11:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809AB1E4BD;
	Fri,  1 Mar 2024 11:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosalinux.ru header.i=@rosalinux.ru header.b="Pf0ZLA1h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rosalinux.ru (mail.rosalinux.ru [195.19.76.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADAD20E6
	for <linux-media@vger.kernel.org>; Fri,  1 Mar 2024 11:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.19.76.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709291776; cv=none; b=XfB7BPPg9I/8J96WCXVUXmllNcwHYCc61af7kWzSqU5du+ln4rd9K8utupDqIfIVwe6GZd0lGfn1VJQM7GvGH6p4onC4Hx/KK2ThL9ZyAqpR1LTAClYGBXywudVJiIq5aq86IPjWq/AeN3Ki2D/OuaxD4FfXbuMG323EEsm1u/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709291776; c=relaxed/simple;
	bh=y3nmN2RvyV2X54OghQae43aLhN5ozvhftmOeITs8ftc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oTloYnxJyJ8yxFTcThP5Bb1avAyZVRbS/rcXtI4Kqqjq85zLj3EV+F7UmINduEeNc0LRQiRzgbbz9OAQmht71KBI/tGFuK+vw3r7R9O9ZxVNMd3zSu+ophN3PD7OYjovGSJd2wW06vMur1WVD462NkmmLdX2mJoF8WzUs+i+2P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosalinux.ru; spf=pass smtp.mailfrom=rosalinux.ru; dkim=pass (2048-bit key) header.d=rosalinux.ru header.i=@rosalinux.ru header.b=Pf0ZLA1h; arc=none smtp.client-ip=195.19.76.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosalinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosalinux.ru
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id BCA00D998D03B;
	Fri,  1 Mar 2024 14:16:01 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id j67MNjgoA9H1; Fri,  1 Mar 2024 14:16:01 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id 824D2D998D03D;
	Fri,  1 Mar 2024 14:16:01 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 824D2D998D03D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
	s=1D4BB666-A0F1-11EB-A1A2-F53579C7F503; t=1709291761;
	bh=8truhmrQY76QOWlOKaFV9fkDp1Cndo5etDjhe6LwO3I=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=Pf0ZLA1hV5Ep12Xp6g6QuAEoeV0DRTVAg779YOB8XF92G3KA1G7/vwv7TAsc7e9OJ
	 1Sif67cE8RuSBoQdLdTfcRWbv9zSiCmakxZNEhBId9eIfvTAcKZjSRWSJrvsLQn1OQ
	 Fjtjec/HZjI1yOjFcmDopRpCyGmVtpJQzgMdDyhzyMy4viRbD2CwhNzbpsfVLzBak5
	 ehfEKTWwLOYUjDGK6yVvqhRWqJGw7Ddbs1nMHxEx5GMAPBpcNKH0//2IhufOizup92
	 C5uYxHQtjffUS29J4s9CF/YUNDkDRqR1Pa4UYfbgt4guCgQVFetvTwXS5Grnduq87b
	 hfaZmClW0gRZg==
X-Virus-Scanned: amavisd-new at rosalinux.ru
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lsTaG2i_RY2K; Fri,  1 Mar 2024 14:16:01 +0300 (MSK)
Received: from ubuntu.localdomain (unknown [144.206.93.23])
	by mail.rosalinux.ru (Postfix) with ESMTPSA id 400B0D998D03B;
	Fri,  1 Mar 2024 14:16:00 +0300 (MSK)
From: Aleksandr Burakov <a.burakov@rosalinux.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Aleksandr Burakov <a.burakov@rosalinux.ru>,
	linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] media: ngene: Add dvb_ca_en50221_init return value check
Date: Fri,  1 Mar 2024 14:15:53 +0300
Message-Id: <20240301111553.23995-1-a.burakov@rosalinux.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The return value of dvb_ca_en50221_init() is not checked here that may
cause undefined behavior in case of nonzero value return.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 25aee3debe04 ("[media] Rename media/dvb as media/pci")
Signed-off-by: Aleksandr Burakov <a.burakov@rosalinux.ru>
---
 drivers/media/pci/ngene/ngene-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/ngene/ngene-core.c b/drivers/media/pci/nge=
ne/ngene-core.c
index 7481f553f959..24ec576dc3bf 100644
--- a/drivers/media/pci/ngene/ngene-core.c
+++ b/drivers/media/pci/ngene/ngene-core.c
@@ -1488,7 +1488,9 @@ static int init_channel(struct ngene_channel *chan)
 	}
=20
 	if (dev->ci.en && (io & NGENE_IO_TSOUT)) {
-		dvb_ca_en50221_init(adapter, dev->ci.en, 0, 1);
+		ret =3D dvb_ca_en50221_init(adapter, dev->ci.en, 0, 1);
+		if (ret !=3D 0)
+			goto err;
 		set_transfer(chan, 1);
 		chan->dev->channel[2].DataFormatFlags =3D DF_SWAP32;
 		set_transfer(&chan->dev->channel[2], 1);
--=20
2.25.1


