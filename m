Return-Path: <linux-media+bounces-38228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 397AFB0E779
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 02:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F6F71CC09AB
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 00:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D351A1862;
	Wed, 23 Jul 2025 00:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dCmFNv99"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB9C19A;
	Wed, 23 Jul 2025 00:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753229522; cv=none; b=Y4ZwDb3tDlR+CbMPMlMB3NEGVU+X0gNUrmspqDnZUPqWUzlydD8xUHDkaVKOSG9DkfR9UuIwOqQqJ0IQ7+NEFXqSMaBDmSC9eT2MwRv5JZD+nP2GyFr3CGTFj9TqXkZm5bN0gAyTWOiBrs9FH7BkbvWapvu0R42ozZaIF2+91OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753229522; c=relaxed/simple;
	bh=teLKBe2kJ5/3LnQHzCbkON1atwSeMBVnWzX3tR55sfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oZcL3d5PGlZNMy0R9EU0Cvyk9BWV37uaiLOQj6rlxlbAUDtEDcPRHDbvVkqqAxIhvTKZ3Nbkdn4ePDAG1aqAib9iDNmT6UqF5Dcn2jvctGsQBdhdLmHs4fldR69g79AHx3vrrBhXNco3HYed62vJQtvwzEdRBOPIMN9FBnCuJBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dCmFNv99; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=1+dF16tnesRRQqXxIkQKObIagoJP4MlV7fbKQJOW92c=; b=dCmFNv99g6nXA7jrkXd5/v+MN6
	6YZ4v0BGaRym6DaRvBFktEtlj9mFGRUw2wV4+i/aoSwt/O9fcXCx1ZC7da1HU2fPwe/TrACeccIKD
	o9CW839bQAR2byPAGFqUg6eS0/0CTT3hDjgS7nLz2hx9jxHeqrlQ6R7qstzhNWfG1PW2NV8bt4eZ0
	JGk6BxPuJs5pTJMu/qk3ybosUgZn35lSkv0AQAu7vE17xgkVj1gmFdcLyUlf2zPKFWNecddwRzFoM
	Tp5Bs2kajpEEKXn5Z59guZIhbFoflQaVPL0v8VqMwuJPlVuAEjh7YTC+ndr/F+2hnudFj8WSrMynL
	0S7qeeNg==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueN5U-00000003iTo-2ah5;
	Wed, 23 Jul 2025 00:12:00 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-media@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	stable@vger.kernel.org,
	Hans Verkuil <hverkuil@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2] media: cec: extron-da-hd-4k-plus: drop external-module make commands
Date: Tue, 22 Jul 2025 17:12:00 -0700
Message-ID: <20250723001200.3672990-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete the external-module style Makefile commands. They are not needed
for in-tree modules.

This is the only Makefile in the kernel tree (aside from tools/ and
samples/) that uses this Makefile style.

The same files are built with or without this patch.

Fixes: 056f2821b631 ("media: cec: extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: stable@vger.kernel.org
---
v2 changes, per the Media CI bot:
- add Cc: stable@vger.kernel.org
- move other Cc:s to mail headers only, not in the signoff area

Cc: Hans Verkuil <hverkuil@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>

 drivers/media/cec/usb/extron-da-hd-4k-plus/Makefile |    6 ------
 1 file changed, 6 deletions(-)

--- linux-next-20250718.orig/drivers/media/cec/usb/extron-da-hd-4k-plus/Makefile
+++ linux-next-20250718/drivers/media/cec/usb/extron-da-hd-4k-plus/Makefile
@@ -1,8 +1,2 @@
 extron-da-hd-4k-plus-cec-objs := extron-da-hd-4k-plus.o cec-splitter.o
 obj-$(CONFIG_USB_EXTRON_DA_HD_4K_PLUS_CEC) := extron-da-hd-4k-plus-cec.o
-
-all:
-	$(MAKE) -C $(KDIR) M=$(shell pwd) modules
-
-install:
-	$(MAKE) -C $(KDIR) M=$(shell pwd) modules_install

