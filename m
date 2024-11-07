Return-Path: <linux-media+bounces-21045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F20589C02E4
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 11:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FDBEB230A7
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 10:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09FF51EC01C;
	Thu,  7 Nov 2024 10:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WrFm3Qse"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AAA1EF08E
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 10:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730976579; cv=none; b=t3WEqyly6pgp3yTSksSRpua5iB17nh4AZx20JH44g8RXXpIkC75uEAO3XitoFn5mecTmQ2JArmXhp9HB3n2OtTulOLMzAfWGRqM+pm1q2xuIq2T10tlitvZWW6V7mJD52QpGBzv/iKiRbtsAdgG4oCMye+rtZ5HpP45J/0F5ucQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730976579; c=relaxed/simple;
	bh=SviAwAGuCoqc9bmfSpk3DfFcKrNK20C4VW9TVzw9FTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EolUcOo8rz0XP7GLs3Gm1WaP+UzelBjKt8E/UkLVedWgZ/l0qJ7rwlWVdC1WHr1JP6drG3QeKj8hLSSbtO4YMuEMhxyqnt1cIx3FHL9rDzX9qZXjOZ7eDXnTUm6gUMUlOcdFQHfiPdE4Xj12Nd7pjRskRud6QQ5f9UTO9H0ie4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WrFm3Qse; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730976576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R2WuXLnB8mOLdsuQNFiKBFcG/cUr2A+92n4a/BNdcQ4=;
	b=WrFm3QseiIbmqyHjKtbIHlmZKLpK0NN1+rKfl0Wx7MYmXCU6+NBm/8rmCbANXRhi1QDtQk
	Bb6kkZcBc48rSCEo1wQw52I06V2ItoMdlTsVEtJYIshnNW4Es0iwMYSSHTyQ7WrQEoMjP2
	7zCtvB83zIrMh4sMTSA+cFBIEurEFDg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-251-igFYZhMdMmKV9Q2ZwyKvYA-1; Thu,
 07 Nov 2024 05:49:30 -0500
X-MC-Unique: igFYZhMdMmKV9Q2ZwyKvYA-1
X-Mimecast-MFC-AGG-ID: igFYZhMdMmKV9Q2ZwyKvYA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A9D181954B0E;
	Thu,  7 Nov 2024 10:49:29 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.177])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0E4341953880;
	Thu,  7 Nov 2024 10:49:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/2] media: i2c: Add driver for AD5823 VCM
Date: Thu,  7 Nov 2024 11:49:24 +0100
Message-ID: <20241107104926.257636-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi All,

Here is v2 of my patches to add a driver for the AD5823 lens voice coil.

The kernel test robot <lkp@intel.com> reported an issue in v1 with
missing depends / selects in the Kconfig snippet. Instead of copy
and pasting the usual depends + selects for VCM drivers I decided to
follow what was done to simplify this for sensor drivers and to turn
the "Lens drivers" menu into a menuconfig with the necessary depends
and selects, cleaning up the Kconfig parts of all the VCM drivers
in the process.

The actual driver itself (patch 2/2) is unchanged in v2.

Regards,

Hans


Hans de Goede (2):
  media: i2c: Automatically select common options for lens drivers
  media: i2c: Add driver for AD5823 VCM

 drivers/media/i2c/Kconfig  |  45 +++---
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/ad5823.c | 312 +++++++++++++++++++++++++++++++++++++
 3 files changed, 332 insertions(+), 26 deletions(-)
 create mode 100644 drivers/media/i2c/ad5823.c

-- 
2.47.0


