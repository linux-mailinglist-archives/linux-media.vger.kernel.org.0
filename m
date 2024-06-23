Return-Path: <linux-media+bounces-13980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D08B591399F
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 12:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9293028130D
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 10:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376C512E1C5;
	Sun, 23 Jun 2024 10:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b="arM/7TKV"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F9479CC;
	Sun, 23 Jun 2024 10:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719139625; cv=none; b=VreRfTkLMF4GDPyeAOfzzKvYjHSdCV+zZBNx/m4hd1oAlqx4uL59SqYAWlXvt5q2Kl1gVXCZhuiyko9FLV7/N+9+fTrgZ+CxRFRAM4EHWIEUje6+3bRseRodIwN3OrBUGqgQ9wIJZc0ftCc4uISWDj6AcNDchsd8cC2y16ZMUr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719139625; c=relaxed/simple;
	bh=SGB6kMl4DzxVbloZdG4kTLuxyUdkNElMEEG0irB3xhw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zd2LfF6FC1O+Fk0se0w8JmYFzZo2N8WpwcsZZhlXZiFLCfwbF43Z/U4HtOwfQBr59LnFn5N5dQr51iGIt3qf3cFAVZloTipjAYQH2RbY0LroIiPuCq2ChqEwl/sEcGHTBvdLvDKRI5BpmjUFCsWF70dCrv64wr7v89wgnv4boTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b=arM/7TKV; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1719139616; x=1719744416; i=nils.rothaug@gmx.de;
	bh=qXSH1Y6FKtoMVwohjHLa1lmjMgeSyY8TbL9uw1woyCU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=arM/7TKVUHOaRB4effSQMr7TX5FBqEeQIZh86hXNZ4TEM2K2v46yd4rg9C6xoNhC
	 XICcMw1gMy2Nm//ptyTY5RrTZKXes3zEEZKPNV8KXVvxZDcR0dHVk3QaxsoaKqqbi
	 3cseEG+yIKQj5UeAtc23JTlNbrzojclyL6FSwA42nLVunPZpYZROSzaqJI6/NsOfO
	 rY+4hWOPD95CYirsj2ega/LlIFJpHjKDpIRwPAn7HV0K+c8MhhAQuE8ZCaLqAJK0J
	 vWKivEvAlQ9lN83MYSw+8ouKWrYCkMQW+ri/X/xaei2C3iZbR1tcf2KX/Ms9Y0uao
	 eNDE+EM5lm6MHdNquQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from nilsr-VirtualBox ([83.78.44.59]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N9Mta-1sON8V3yL6-00usFb; Sun, 23
 Jun 2024 12:46:56 +0200
From: Nils Rothaug <nils.rothaug@gmx.de>
To: hverkuil@xs4all.nl
Cc: sean@mess.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	mchehab@kernel.org,
	nils.rothaug@gmx.de
Subject: [PATCH v2 0/5] media: em28xx: Add support for MyGica UTV3, its IR remote, and its tuner
Date: Sun, 23 Jun 2024 12:46:42 +0200
Message-Id: <20240623104647.7697-1-nils.rothaug@gmx.de>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:h3NJSZdZweBAlZgwboPxMQIhMDC8tIHF1bPdeKdtDZ/h5RUF5K1
 Ys/niVOumUlqfnIi9odwE9QqU3kMzZdXyUMHuc9Oj5Ki/xJjX3srSU5we8iyna6RUsYUtrV
 G/2WqZECyFCS9vtp1y9FZ7CroomGKUHT20KOQ9OibhMC1vFtoWauTJllZ6qwSR7yqhFBjkS
 hM1hzy5dwFmTbuUavaKBw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FgG8s57O1QM=;xjomLhBxrzx/IUt2CE363TyHqap
 IozSuMLqu88X7PXZ8ckIlnZC7K83WG1BnMbSyYbR50DmBilgJ+/5dQxi58L7btxjnjSoQ0p0r
 e/nTIOOg914BWcuTakFiBtmFFC31uVJBgp30P7jgKUlI3Ce+ZWxHb/vOVw5YOLBlLbc7Eunjo
 v36nU1WwvlwzN3GLOC80nk3+jqUdRIQCn3iwRTPXaoJs7YU7ohxpWh64j8Dfmo7JHcUJjqHIa
 u+Mn5boseJZKwnnHgNDuCtfG8HL99tUHKSczLR7Gb/meye/ADiBm0MiOAPwwa0tU6o5INw9r6
 79+LH6QKtTfAo7YK54mnEF2b+lCxKuvGDgLEj+Z2EJrSRf0arX0PeuTYRfK32/qZEmlb8hTIw
 ZfNfMQAHIyFy8VJGtnV//AOw9Djwnhsm6bNUSxCx/YjtEVxt2npDMXaPnSzNgnjXGCISn27p1
 /P8i7wFXdk0kJomTfZoGIrqQg1sf8XERg0KVVHwcMykGBaYVsUoM1fYGhF1thA3nYVD1qLD8J
 ZTMvWFZ4mk3huFgOtACR0LID0ResEUhbv3y67KBdTkHRqapewDIgmC2FCQjeBR3Bi919uVMBS
 MyrD5Jh8bg6gXnopODM2tzPYvK9UL9TVaFMyn1U+0OhB2BqqIJbUzQ8/cGGRueb6arDnvNhDV
 rnJ531frVo1Cca5wgbZZfF4AC9U5h6DLEXpeRKa8CSEV/7CzatC97/8F7cU8KEcsc3Zw6dfRa
 2K/23tRuK5TE6kZAw5YrGeJVQdvJt3XDAs5ZphLbn3CrBKaQjs51hyeU/MCKSB4OOO1UzDsTb
 jjc71pxF2P79LJrG+aJDlD9cO0tf6wS4rl2dM6WrXmcqw=

Changes in v2:
	1. Split v1 patch 4 and rc changes from v1 patch 2 as
	   recommended by hverkuil@xs4all.nl
	2. Patch 1: Drop empty line to fix checkpatch warning per
	   feedback from hverkuil@xs4all.nl
	3. Patch 4: Fix indentation in em28xx-cards.c line 2614
	4. Patch 5: Fix comment per feedback from hverkuil@xs4all.nl

Nils Rothaug (5):
  media: tuner-simple: Add support for Tena TNF931D-DFDR1
  media: rc: add keymap for MyGica UTV3 remote
  media: dt-bindings: rc: add rc-mygica-utv3
  media: em28xx: Add support for MyGica UTV3
  media: em28xx: Set GPIOs for non-audio boards when switching input

 .../admin-guide/media/em28xx-cardlist.rst     |  8 +++
 .../admin-guide/media/tuner-cardlist.rst      |  2 +
 .../devicetree/bindings/media/rc.yaml         |  1 +
 drivers/media/rc/keymaps/Makefile             |  1 +
 drivers/media/rc/keymaps/rc-mygica-utv3.c     | 69 +++++++++++++++++++
 drivers/media/tuners/tuner-types.c            | 21 ++++++
 drivers/media/usb/em28xx/em28xx-cards.c       | 52 ++++++++++++++
 drivers/media/usb/em28xx/em28xx-core.c        |  3 +-
 drivers/media/usb/em28xx/em28xx.h             |  1 +
 include/media/rc-map.h                        |  1 +
 include/media/tuner.h                         |  1 +
 11 files changed, 159 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/rc/keymaps/rc-mygica-utv3.c

=2D-
2.34.1


