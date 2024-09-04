Return-Path: <linux-media+bounces-17619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 331EA96C8E3
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 22:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 662CE1C21AC6
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 20:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4E5191F7E;
	Wed,  4 Sep 2024 20:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="B1Tu7C0o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch [185.70.40.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B18914B976;
	Wed,  4 Sep 2024 20:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725482767; cv=none; b=arY6aiPoBeUwtdBMpNvSKzMdr00rlRmvr0XAXD2sZKWYREezodpRrv7kfnZiWfY/c4J3JdLYveqsK2/EruXKC4HYg22XEXocYJTRvhmpQhcXOs25YHNBLqkiS7pVl0OTwUhGAnoEYFOy1k531QSzf7DByDHkvT0HYaEJeuvxzLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725482767; c=relaxed/simple;
	bh=pHKsfEey7k+Kut2kFq2Fse32WE02kFkgk5ihNfV18aI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pgPv7W9YgBsvY/fUCC+W0WoSEjHQXUxgd2aP4iH6+2W1Cn+mDbckWFC5fpZdG+gWlJk5vu3YcHjbGbpQnQ8fmGvXWV/tSgdQqkk5avKaZHpeNAzh3y/zFe/Jpy+ztguUN9pckn0uecjEXZHPdnoUVVRnmKifQEt9RX7GeeZLs78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=B1Tu7C0o; arc=none smtp.client-ip=185.70.40.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1725482753; x=1725741953;
	bh=7dpimP15520NeL54t8R2z7oW/gXYIFdOGf+8XOb1730=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=B1Tu7C0o6+ZZ5C7eE92YubtQWSq3LG0U+WPUDYjC0+74pmfYCUb4XfBZ9AqDBdW/k
	 d8fuf9d9fbKaQynPx2Pn3Wrv+VE9OIDvYICxB+j4N7fzi3PI1KSmtNguf09sNa6L8z
	 Q9SJsSx1OgvRV01onguG6VgjHndp5c2ksAuWF6g50PoPacjnJsml7hKwCK1NUh38p+
	 +90JZthXc7BzMg42gVfq07ktrCAqiidXWpJUqH136XhOHlQXIG4zuxiy8Srsu+AkAl
	 leWqxXCbWIEo1mQMDXvXRmXVSBbaRIlGdjjmxMH6a/1/M78cnsc3n/Gl5NL+CvfT8S
	 3B9GPYBuv6YrQ==
Date: Wed, 04 Sep 2024 20:45:51 +0000
To: o-takashi@sakamocchi.jp
From: Edmund Raile <edmund.raile@protonmail.com>
Cc: apais@linux.microsoft.com, edmund.raile@protonmail.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-sound@vger.kernel.org, linux1394-devel@lists.sourceforge.net, netdev@vger.kernel.org
Subject: firewire: use sleepable workqueue to handle 1394 OHCI IT/IR context events: test 1
Message-ID: <20240904204531.154290-1-edmund.raile@protonmail.com>
In-Reply-To: <20240901110642.154523-1-o-takashi@sakamocchi.jp>
References: <20240901110642.154523-1-o-takashi@sakamocchi.jp>
Feedback-ID: 43016623:user:proton
X-Pm-Message-ID: 4ed8ea6d8f4fdb7d65623a1afb01f1502d3fca6f
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Sakamoto-San, I very much appreciate the idea and effort to take on t=
he tasklet conversion in small steps instead of all-at-once!

I also thank you for the CC, I'd like to be the testing canary for the coal=
 mine of firewire ALSA with RME FireFace!
The ALSA mailing list is a bit overwhelming and I'll likely unsubscribe so =
a direct CC for anything I can test is a good idea.

Trying to apply patch 1 of 5 to mainline, your kernel tree appears to be ou=
t of sync with mainline!
It was missing b171e20 from 2009 and a7ecbe9 from 2022!
I hope nothing else important is missing!

Since in fw_card_initialize, ret is tested to be 0 we'd need an else instea=
d, is this correct?

I edited these functions of patch 1, now everything applies just fine:

@@ -571,11 +571,28 @@ void fw_card_initialize(struct fw_card *card,
 }
 EXPORT_SYMBOL(fw_card_initialize);
=20
-int fw_card_add(struct fw_card *card,
-=09=09u32 max_receive, u32 link_speed, u64 guid)
+int fw_card_add(struct fw_card *card, u32 max_receive, u32 link_speed, u64=
 guid,
+=09=09unsigned int supported_isoc_contexts)
 {
+=09struct workqueue_struct *isoc_wq;
 =09int ret;
=20
+=09// This workqueue should be:
+=09//  * !=3D WQ_BH=09=09=09Sleepable.
+=09//  * =3D=3D WQ_UNBOUND=09=09Any core can process data for isoc context=
. The
+=09//=09=09=09=09implementation of unit protocol could consumes the core
+=09//=09=09=09=09longer somehow.
+=09//  * !=3D WQ_MEM_RECLAIM=09=09Not used for any backend of block device=
.
+=09//  * =3D=3D WQ_HIGHPRI=09=09High priority to process semi-realtime tim=
estamped data.
+=09//  * =3D=3D WQ_SYSFS=09=09Parameters are available via sysfs.
+=09//  * max_active =3D=3D n_it + n_ir=09A hardIRQ could notify events for=
 multiple isochronous
+=09//=09=09=09=09contexts if they are scheduled to the same cycle.
+=09isoc_wq =3D alloc_workqueue("firewire-isoc-card%u",
+=09=09=09=09  WQ_UNBOUND | WQ_HIGHPRI | WQ_SYSFS,
+=09=09=09=09  supported_isoc_contexts, card->index);
+=09if (!isoc_wq)
+=09=09return -ENOMEM;
+
 =09card->max_receive =3D max_receive;
 =09card->link_speed =3D link_speed;
 =09card->guid =3D guid;
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

Building a kernel with the patch produced 6.11.0-rc6-1-mainline-00019-g6778=
4a74e258-dirty.
Testing it with TI XIO2213B and RME Fireface 800 so far > 1 hour reveals no=
 issues at all.
ALSA streaming works fine:
  mpv --audio-device=3Dalsa/sysdefault:CARD=3DFireface800 Spor-Ignition.fla=
c

Though I haven't the faintest clue how to measure CPU usage impact of the p=
atch, it looks like it would be neglible.

As of finishing this, I noticed you released [2] https://lore.kernel.org/lk=
ml/20240904125155.461886-1-o-takashi@sakamocchi.jp/T/
I'll get around to testing that one too, but tomorrow at the earliest.

Kind regards,
Edmund Raile.

Signed-off-by: Edmund Raile <edmund.raile@protonmail.com>
Tested-by: Edmund Raile <edmund.raile@protonmail.com>


