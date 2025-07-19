Return-Path: <linux-media+bounces-38107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 722DEB0AD23
	for <lists+linux-media@lfdr.de>; Sat, 19 Jul 2025 02:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C51BD1C439AA
	for <lists+linux-media@lfdr.de>; Sat, 19 Jul 2025 01:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30245130A73;
	Sat, 19 Jul 2025 00:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lvHa87lc"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF2423CE;
	Sat, 19 Jul 2025 00:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752886785; cv=none; b=a3PRLQaF/7nlWqhHE9tgUH8tPX5IrgWRijy3RBO7Q62bSNINugDY/v8H1DTfXVY/gu1cib1lJaCl1E2Z37sJS367MbSbERjKji6LiKIoEeh3kqaLQV79OGf/6Xoi/XccBNawzhveEdmFxsj8gztYWf1S4IVHM7dCrNaTaDp1mUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752886785; c=relaxed/simple;
	bh=CTmsjqTvtqAwbgr7Rv8fk5l++nTRQU9RTaXyFUDoidQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IbFaoyL4H9t1p8OcZqZcMdf3XbUsSHA1S9Gbv9UjqmCORzNXq6hD8IZL0/GCZB4YpID/KLMWzfA8nz6wjWF/W89Pl+GapLhfvszBrySihqw+sRB/8qD59RW9ZhJSaHLTeET/267zW7ZGp3SpuwEyza4O34PqzvpUOhL0/CzSKZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lvHa87lc; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=kg0F1jN3Lg4yOnv3ZgRzGrGT36gwo/UO0wIzOaqdbKU=; b=lvHa87lce+TkYcY2d8+ZdP3xjM
	r4JYCJI0JRx6kRQSKdIvWGvi8n+Y+J+i8rOBuS93PrK9YkOCRJvXJyb1SHMzeLlBFNs+h/wYps6x8
	l7bB5AuUMGCcTZJHpyaL4oWZvkr2ka1gmjn5uGVmc7llXBVqDuWD27mwy756TDU8CObVTm2HXkqqC
	Rk3YfE6cMA3C68e8OIhI3maBiJ37L1s4G237uW+XRd7hGQfeunllgogX59VudCbzqZHki5DGuh+Nq
	k6UKrvkKMU++DpSJ14Xs/iY3Xam4qrAAGJBGAqDaegm++otCtmhqzGe334e1QiCmmrgfVOq4W6/Is
	qdyZF1YA==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucvvT-0000000DgLN-0HK6;
	Sat, 19 Jul 2025 00:59:43 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] media: cec: extron-da-hd-4k-plus: drop external-module make commands
Date: Fri, 18 Jul 2025 17:59:42 -0700
Message-ID: <20250719005942.2769713-1-rdunlap@infradead.org>
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
Cc: Hans Verkuil <hverkuil@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>
---
 drivers/media/cec/usb/extron-da-hd-4k-plus/Makefile |    6 ------
 1 file changed, 6 deletions(-)

--- linux-next.orig/drivers/media/cec/usb/extron-da-hd-4k-plus/Makefile
+++ linux-next/drivers/media/cec/usb/extron-da-hd-4k-plus/Makefile
@@ -1,8 +1,2 @@
 extron-da-hd-4k-plus-cec-objs := extron-da-hd-4k-plus.o cec-splitter.o
 obj-$(CONFIG_USB_EXTRON_DA_HD_4K_PLUS_CEC) := extron-da-hd-4k-plus-cec.o
-
-all:
-	$(MAKE) -C $(KDIR) M=$(shell pwd) modules
-
-install:
-	$(MAKE) -C $(KDIR) M=$(shell pwd) modules_install

