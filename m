Return-Path: <linux-media+bounces-18230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A979773C3
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 23:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77B7EB2302E
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 21:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458AD18EFED;
	Thu, 12 Sep 2024 21:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="B2snj8pG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7832C190047
	for <linux-media@vger.kernel.org>; Thu, 12 Sep 2024 21:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726177522; cv=none; b=pGsvGhVDuopgFmcxfV209wYmEfNYkfMH9ja9LpHSh+JmEKUdci1+d20NhtFpmpWWO12gfaMtvc5/Tutzd5L4Qr1kTCfLNdvDC2YI01/KOt6FHrJiB9HFxkxMTYUlgLprNdkGKMFqHyxd2G3+Yy2b2LhwGPJVRaUEPsuz6LgpH4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726177522; c=relaxed/simple;
	bh=QeQeRgHYzciFXarHMGK4pJrZJ7IUGGtKVgYRFMp2yBU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g7Fh8lgauVVEKk6L9m0ddU6eBMWl57s05zR29ZS3EW8K7clrKUwveC8bc2Der+DtdRLD2U5rucLtySVzxxrBni3vJvSc1CwVyjsln3Ih5+pI9HlyTHrYnAa8afoQ4HLaiU8dkzSeDn10LUeDDSsksA134DPtSu4/w/uLW07nJ00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=B2snj8pG; arc=none smtp.client-ip=185.70.43.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1726177497; x=1726436697;
	bh=a2FNSbtlmAl871wxBHtsJ79Qcx6CVUfTQE+lnwadJCI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=B2snj8pGDevCUVv31aiX/DomN/es1zvLongt38Lt6XXsQSfdOZYr1I8AdDgvNK+YB
	 b6+ag6LI5aTEor1yhVtoFtmDGz7UsbPAVARHGQvRJgpbIcFb/KGhsRSYW6T1MOz+me
	 54Zif4QfiBH+QzJx12/ukt5tvRlt8LVvb5p9FcgxXfQ5OXdFcRF+jaoilfH1ipCmBE
	 d8hwgzCcStfeHe11ew9zU3OgEp3asebu33uSLNleMCEIS9sX4MgJtV/22JC7xDXmiq
	 3oCpjenvbkNFMosrmyfPf9UzGl+fbDbc31FyVECGGgpXJjCgmvNw6XNCnZB0gqEH7w
	 ipCdGBR0Yt4qA==
Date: Thu, 12 Sep 2024 21:44:52 +0000
To: o-takashi@sakamocchi.jp
From: Edmund Raile <edmund.raile@protonmail.com>
Cc: apais@linux.microsoft.com, edmund.raile@protonmail.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-sound@vger.kernel.org, netdev@vger.kernel.org, tiwai@suse.de
Subject: firewire: use sleepable workqueue to handle 1394 OHCI IT/IR context events: test 2
Message-ID: <20240912214404.10616-2-edmund.raile@protonmail.com>
In-Reply-To: <20240904125155.461886-1-o-takashi@sakamocchi.jp>
References: <20240904125155.461886-1-o-takashi@sakamocchi.jp>
Feedback-ID: 43016623:user:proton
X-Pm-Message-ID: 01bc3483bc2521001e61230b823aa401971571ee
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Sakamoto-San, I came around to testing your patch [1], after RFT.

I've had to make the following changes to patch 1/5 again for it to apply t=
o
mainline (d1f2d51b711a3b7f1ae1b46701c769c1d580fa7f), due to missing b171e20
from 2009 and a7ecbe9 from 2022.

@@ -584,9 +601,13 @@ int fw_card_add(struct fw_card *card,
=20
 =09generate_config_rom(card, tmp_config_rom);
 =09ret =3D card->driver->enable(card, tmp_config_rom, config_rom_length);
 =09if (ret =3D=3D 0)
 =09=09list_add_tail(&card->link, &card_list);
+=09else
+=09=09destroy_workqueue(isoc_wq);
+
+=09card->isoc_wq =3D isoc_wq;

 =09mutex_unlock(&card_mutex);

 =09return ret;
@@ -709,7 +729,9 @@ void fw_core_remove_card(struct fw_card *card)
 {
 =09struct fw_card_driver dummy_driver =3D dummy_driver_template;
 =09unsigned long flags;
=20
+=09might_sleep();
+
 =09card->driver->update_phy_reg(card, 4,
 =09=09=09=09     PHY_LINK_ACTIVE | PHY_CONTENDER, 0);
 =09fw_schedule_bus_reset(card, false, true);
@@ -719,6 +741,7 @@ void fw_core_remove_card(struct fw_card *card)
 =09dummy_driver.free_iso_context=09=3D card->driver->free_iso_context;
 =09dummy_driver.stop_iso=09=09=3D card->driver->stop_iso;
 =09card->driver =3D &dummy_driver;
+=09drain_workqueue(card->isoc_wq);
=20
 =09spin_lock_irqsave(&card->lock, flags);
 =09fw_destroy_nodes(card);

Then everything applied fine.

This resulted in 6.11.0-rc6-1-mainline-00326-gd1f2d51b711a-dirty.

Testing it with TI XIO2213B and RME Fireface 800 so far:

Initially I had a buffer freeze after 3 hours of continuous ALSA playback
from mpv:
  mpv --audio-device=3Dalsa/sysdefault:CARD=3DFireface800 Spor-Ignition.fla=
c
accompanied by stresstest (mprime).

It didn't freeze/crash the kernel, just the audio buffer kept repeating.
Gone after power-cycling the interface and restarting playback.

Can't say with certainty whether it's related, have been unable to replicat=
e
the issue for the past 3 days (good sign I hope).
That's why I was holding this message back a bit.

Kind regards,
Edmund Raile.

Signed-off-by: Edmund Raile <edmund.raile@protonmail.com>
Tested-by: Edmund Raile <edmund.raile@protonmail.com>


