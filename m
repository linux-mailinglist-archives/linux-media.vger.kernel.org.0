Return-Path: <linux-media+bounces-4636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B86584864B
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 13:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89FBA1C209CC
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 12:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2211B22099;
	Sat,  3 Feb 2024 12:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b="uFxOg41R"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9365E17C77
	for <linux-media@vger.kernel.org>; Sat,  3 Feb 2024 12:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706964518; cv=none; b=Jj4cUnT66/Yxi8cj9PV2cKTPUr8zoxwo48mLFbaukAjciEOfFythjLqCsa5nEBGcMYWlegXiwSvuI1eTXLikjax78Pl4Oml7ihAeesNvORBbsnDUrKflaNz2p2nf/en54QLwkov/pKwVURr9O9GdruWxsPg47kn23KnrC8qjExw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706964518; c=relaxed/simple;
	bh=EL5RquL2R4LT9n2uvDLz+FuCeufJh07vgBOx808VsNY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jGo+XZ1ujVL8fvwz5p54J+mwnPgxUKU60JNH5JmS5+g99mxNYB17JywKs/ivf2DaZLrtd3Wgj9SrhLnimnkhvoY0LDYg63iA9NvTpD6XBkls2kQdHsdLuxLBcB1RJAjta1UfjIq6X1aN5VyALeSesxUZ70ruFnATpsy1ZPXgF/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b=uFxOg41R; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1706964509; x=1707569309; i=nils.rothaug@gmx.de;
	bh=EL5RquL2R4LT9n2uvDLz+FuCeufJh07vgBOx808VsNY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=uFxOg41RyhlQzIf9cs8gdMdVAMnmND7ex6Vuo/f/Rmp9rRBRthLWxgSlicSUDeL2
	 SPXu8QNa+0WCUwJBeicx+Um731t/hyrhhWnw5nQltG+1k1VsSfbZ9NN0JykGqO27M
	 p+3z+oWRhf4aqqDZiy5161xJo7Gc5XN2p7l0jy+SEZ21+jlqH7VVGpPkpsexJ+iTx
	 +mApUqL/Xr+UH4bXt/bSJ4fcqkkl7hot4TaZy5nKFvCvbon12kt+idlMhmqOj6wpb
	 yV+U1+Yio+D+cywbuAA7BfI6Z5AxiWaWnOkvznwB7L86ZfYm9for34PFcQd2lpGfq
	 SqLEu8zCe43EJQr2sg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from nilsr-VirtualBox ([83.78.44.59]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MkHMZ-1qmRJF476v-00kf6c; Sat, 03
 Feb 2024 13:48:29 +0100
From: Nils Rothaug <nils.rothaug@gmx.de>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	Nils Rothaug <nils.rothaug@gmx.de>
Subject: [PATCH 0/4] media: em28xx: Add support for MyGica UTV3 and its tuner
Date: Sat,  3 Feb 2024 13:47:41 +0100
Message-Id: <20240203124745.10257-1-nils.rothaug@gmx.de>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:H0t2lEJ43LFcEiLw1slXe9bx5xmGRERDMHC9pq4O6fw2ltpfDEm
 wRaFJeMrYYyoV5xsG0gtIwCDa2cCRn6DnSfrnXNyWJTFq47IO8VNzdF/yVRMIa/3XenKV1I
 Q+cCtTnfuY/LyJ6OLmSr7a235o8R5ehuWIKF61B2By+blplYqR8dIOFB9daM46osrzKzXyp
 Ut1kctFgH5Y1IVCG8EdqA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:um7xnv3Uk1g=;BYhahNPeTioZrKoSDpqpjSJCXHB
 j6dKCLSLeEeAPAmDY7cfDl5uqnHV4e4k7n+WQJwKpU55e34DFCu8UqpqnwohTSKTYAV6xIM88
 H61qdV+EfhI4ty+DUaS27Mz3bQm6l+U57xzwtAXQxTyVfU5uho1lXPpOm4ighCAQcNisi7zW/
 n0aYE/awgwe1B1JSg3UCwughKpKdwvAKtc3TrrCz7UEFWxfsIIHbXZ/oE257updNMvIHVyt5/
 5DIuMrBrliDMlxaqPgVIhp9wt0cIEwvXn2LUfC89lHL9jcMz/H1jwPYQ+iXBGj9gmUa69ynlY
 yADefHFUP6iC9WS+DixQp8QcByiF8ugqyx/IyMNVx1gx/7lZHxIwMldQStYEZli9GosET6kN8
 D2s1HUM9DVYW7mSneNaf1Lv8NyJ0Otow8K1mufLO24K4SYlAewru08Sh263oWP9zQn2HGPy9q
 E379YfHibWcb7uc1UwJofh+EGwLRsobOmCTiNB0poQI8/xijzEQTyTcaHuRyicvpMgLSPQQPF
 sMgHlhYu5YjjoA9SRJJNe25y6bOhSaEboOdtF1v8n2GgN564Gngc0kaQnGJOa0Ft3Z/rzut2Z
 KVEapyGrLBn1+LKwC3y+fCY4oj3NXjnY45AgE94cJ0YvqwrDEolDwGRZidvodOHD0k9cTgwiq
 ivngQtBtG9xzZkmbbSb7QQF3NKIo3o33udEVbj+x0aAuC+GPwXngW7RqmhEDSmfR3JOAcaZbr
 50p15KhKUDMLL5X64tpLNkKRpJRMr4AW8FDmg+19LvP7t6SoVjHAThi+KQhPT3kip9s6LcUtJ
 WyA6P4RFRuXYwYcIFnPLvowtrmnCwSmWNfiZK8ArPNoIM=

Nils Rothaug (4):
  media: tuner-simple: Add support for Tena TNF931D-DFDR1
  media: em28xx: Add support for MyGica UTV3
  media: em28xx: Set GPIOs for non-audio boards when switching input
  media: admin-guide: Update cardlists

 .../admin-guide/media/em28xx-cardlist.rst     |  8 +++
 .../admin-guide/media/tuner-cardlist.rst      |  2 +
 .../devicetree/bindings/media/rc.yaml         |  1 +
 drivers/media/rc/keymaps/Makefile             |  1 +
 drivers/media/rc/keymaps/rc-mygica-utv3.c     | 69 +++++++++++++++++++
 drivers/media/tuners/tuner-types.c            | 22 ++++++
 drivers/media/usb/em28xx/em28xx-cards.c       | 52 ++++++++++++++
 drivers/media/usb/em28xx/em28xx-core.c        |  3 +-
 drivers/media/usb/em28xx/em28xx.h             |  1 +
 include/media/rc-map.h                        |  1 +
 include/media/tuner.h                         |  1 +
 11 files changed, 160 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/rc/keymaps/rc-mygica-utv3.c

=2D-
2.34.1


