Return-Path: <linux-media+bounces-57512-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id F+LUIeYXyWkFugUAu9opvQ
	(envelope-from <linux-media+bounces-57512-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 14:15:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D65AB351E59
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 14:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E962F30191B5
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 12:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E45304BA3;
	Sun, 29 Mar 2026 12:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQ7qZFGw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED783603E7
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 12:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774786520; cv=none; b=UiISrSzcRhOaTFcu3iyXIUp9C/Tu9fxqxS8bZMu9K5LHx0yttrqIUoRA03IqTo3HSFaLasC2mjBBF88jdDMuA/042edjPxFJXjNNZIPz2L/gJ9IPAGS0Aq1r2JftIdFNTNGlQZbW/JjPYPV4z2ABiFVDlfEpIsYuTgaCc+7F3eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774786520; c=relaxed/simple;
	bh=4+YpmXMhnzBcEo6XfmETEXML22ItISwI4YoNHx5TKmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PWHBRliDKICZoElqcPtw8BsmCyoiHM6ZRoXaLqD3SSsDYiRxiYtncKBKZylyOK+sQRsy4Oino/zJH6pRRRgVpoPdwHgezwezFRMhZoCPArkfnKyj72Z1duotUXPQFNGfTTl0nwiiicITnPXMbZRxFwYQ87yMTchxDaC3yYO0TSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQ7qZFGw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483487335c2so37349465e9.2
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 05:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774786517; x=1775391317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LNOLo0OS7Age/PXJ8R9gpObdEtaSycos4+/7fDNETBo=;
        b=AQ7qZFGwIYpVaHABNtH3oQEvIZ5XL7bt9mAue1LIOzUKZdU+0dKELQ9mgxlminGZom
         7zmr5N2AHq7nGWhrrV1XiH9aM3Q9uJhqqjQxtnLHChPr53ujgPs41b/0M/rfU9zWGVzq
         1/AShdPxNiaUmehySujbsahZnKEKpLBFo0iqtv+9rci2ewAxq/5uf/RPfSQltfoB3CKZ
         sVI2bmnJYH7b85be/iGVfWNr56Gm8a1K/ty+LL2A/WnHUHoadsojDYS+VIIFsWu4fOEv
         sKN04eVNRB4eeRPxDhOHgtoYPsEc13gkFlmnmU+fFlf7+8GNOgTR58cp58dHEgXJI4QC
         IJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774786517; x=1775391317;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNOLo0OS7Age/PXJ8R9gpObdEtaSycos4+/7fDNETBo=;
        b=A98R6UKCh1kVPozjJFwj1+O2COQcslUDUagsOrHCcFYY24NxV5kmo5bvYEd+27LnnW
         tu5D4Uij9J7/1+PquBt5+NeQ/Vk6mtto0TEiQVNGNEBFdpS8cD7DCbWGSt/BmmM0gwIW
         cfKdpP2v+35D1JqaEwlmO8vLYDUvPYKpuZrPa4dxalhQz0WWD96IyxKLeySiHzx0dBSH
         w1iw67ZbYmC1Kto5tUEN1KRRr85GOz6BfFWY/kgJvxJ3mPyP2ExafBiJi9nGN8/bzWck
         KFQgozr7PF1jFc09QEJoS0aywDxFL6q2oQlXQ8hoBX+RHIPLbhSUaYfJizKNeaUzTDfY
         P1Aw==
X-Gm-Message-State: AOJu0Yy1rq2QISO+bK/q0XY8OiKrvDUuzN9KQ2mpwk+pEdI1A3U75HlP
	gpTVqlUMYQVPW+W3L7HIHTU3pjBqyP7kBlvB5BjM2c7PcXNUXqv7yokvZ1rYbaTa
X-Gm-Gg: ATEYQzy8o4GSI9Oz8F6g+mCLapAkBfVlnc1ILjz9CZlwWr6+1apY1a3XvGesz1/SzEc
	ybFkqn1SLEi3sjbvnGJ1nu9B837u8ezytDeAF3jNxcKJUA8On2w3s5cnTn194msbPNJyBrhCACG
	g6KBAMfSwA+BHja64Q22+VTwwqpoMAnu8MYvTBIO8hI9j1fszo8OzlCOrVirAE/tvTAKpBCTyHG
	hDq40xXxGi36SyBpKt0HQ8ykaVnBsd13+KbtYAk+1vyXFtDjwYrECrytxkN5MugGVu8M5TiEedM
	nbgWri1ulEcKKY4dLhb487hWQBF7KgisbJWssw8wJ2uHaJ73LuFKMfrmlyscuBDpbwghJ8pxvmW
	RpFYx17ERutW80RP5Ykomil2s3JAjWZ/XwLmt/NlxP1NtEZF12RdtQPyv+N+7dHr5sV0KmJQmnI
	+A+LaH8HtJEMSssMLZ5cYnI5L/eNA2Pj9p0xuEmTzojdhCuEdLAqMu6Zi3sA==
X-Received: by 2002:a05:600c:1d1e:b0:485:3f1c:d897 with SMTP id 5b1f17b1804b1-48727f0b0femr148622055e9.9.1774786516925;
        Sun, 29 Mar 2026 05:15:16 -0700 (PDT)
Received: from localhost (net-2-34-154-96.cust.vodafonedsl.it. [2.34.154.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873ab203e9sm16436675e9.0.2026.03.29.05.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 05:15:16 -0700 (PDT)
Date: Sun, 29 Mar 2026 14:11:31 +0200
From: Riccardo Boninsegna <rboninsegna2@gmail.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sean@mess.org, mchehab@kernel.org
Subject: [PATCH] media: rc: mceusb: add support for 04eb:e033
Message-ID: <20260329141131.2b3acb25@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57512-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rboninsegna2@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,skintek.it:url]
X-Rspamd-Queue-Id: D65AB351E59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=46rom 42c23a7c8f45eb44ebb56fbbd94ca6318e643bcb Mon Sep 17 00:00:00 2001
From: Riccardo Boninsegna <rboninsegna2@gmail.com>
Date: Sun, 29 Mar 2026 12:37:09 +0200
Subject: [PATCH] media: rc: mceusb: add support for 04eb:e033

This is a Sonix SN8P2202XG microcontroller with firmware compatible with
the already supported Northstar 04eb:e004, implementing an MCE IR receiver
(PCB seems to be tracked for a transmitter too but missing related parts)

Found in a Skintek SK-CR-IN+IR ( http://www.skintek.it/SK-CR-IN+IR.php )
internal 3.5 inch USB card reader and MCE receiver combo
(implemented by, and wired as, separate USB devices)
PCB marking: AU6475 966816 STIR REV:A02 MCE

Signed-off-by: Riccardo Boninsegna <rboninsegna2@gmail.com>
---
Hello everyone, yesterday I've bought this MCE IR receiver "for VISTA!"
from 2008 and it didn't work (not recognized by LIRC);
luckily adding its VID:PID to the driver was enough for it to work:

# sudo mode2
Using driver devinput on device auto
Trying device: /dev/input/event15
Using device: /dev/input/event15
Running as regular user riki
code: 0xad0ec96900000000f3c1030000000000040004000d740f80
code: 0xad0ec96900000000f3c10300000000000000000000000000

This is my first use of git patches, which I've "learnt" on=20
http://docs.kernel.org/process/submitting-patches.html using
git://linuxtv.org/media.git as a base, so apologies for any style issues!
Greetings from Italy

 drivers/media/rc/mceusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index 6a9e4382a224..39ba7f6a2549 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -397,6 +397,8 @@ static const struct usb_device_id mceusb_dev_table[] =
=3D {
 	{ USB_DEVICE(VENDOR_COMPRO, 0x3082) },
 	/* Northstar Systems, Inc. eHome Infrared Transceiver */
 	{ USB_DEVICE(VENDOR_NORTHSTAR, 0xe004) },
+	/* Northstar Systems, Inc. eHome Infrared Transceiver - variant */
+	{ USB_DEVICE(VENDOR_NORTHSTAR, 0xe033) },
 	/* TiVo PC IR Receiver */
 	{ USB_DEVICE(VENDOR_TIVO, 0x2000),
 	  .driver_info =3D TIVO_KIT },

base-commit: fd55319692151de2b89c21356d1445bce364769b
--=20
2.47.3


