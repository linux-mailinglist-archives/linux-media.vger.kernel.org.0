Return-Path: <linux-media+bounces-6782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E2C877D95
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 11:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E9B71F224A4
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 10:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DE62261F;
	Mon, 11 Mar 2024 10:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KNal6aVA"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E394F2C68A
	for <linux-media@vger.kernel.org>; Mon, 11 Mar 2024 10:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710151459; cv=none; b=VWwkUDZf5042aKDr9Rd54wmXhBZ0hezuUbXUW+IXs2vmHr/OI1TXaqgj1rga9DnSGfP7HpP0c83O3+JnVxWBQM3QCCKnCcIxkrI56kCD6OAakifxTvhQ1fAlWmeJSApIt1Ik6StOwS5UOAIEZW/n7tUwtMj0bKBEn2IL2NZs/ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710151459; c=relaxed/simple;
	bh=zvN/20XvYiz2MyQjAVjvERquDHeyb5R/ADA4iz1fGRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eZ5qPDxZp+jAkTcftSpK6Flpe1iy4uuwY+kxIt5LFKhiWXjvNwIcLcs4alEwfRnMSAy60KkxKO3G4h87tvL3xJyuitkDo3GF+lCagsmOx50NRMZbwpPvk0zd/fUfs+8b4TzIqBMhxwxZ3DQYVZoOD/sUPvY7lDR8unwHnRAiVzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KNal6aVA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710151456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g+grVmqVVENPhg8oB0MZuBT0LePVxeVTb8DcmQebZ1s=;
	b=KNal6aVAouRXIPqgDGFFmqhdrBwk9V+B/131/OyWdB+XJeKUAh552Y3cO/BoG048J0a1fT
	1uqOV5z/cpWC81dlj4jT4m6xcGPTsyFJtCOzGbyNg3qg7gmfhP8ObyAl1EKj/c9EGGLelE
	s7dARLjg/VjqFSeUnK3rmT6RY7BRyD4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-FTDlSGHlPC-Z4E-R239aBw-1; Mon, 11 Mar 2024 06:04:15 -0400
X-MC-Unique: FTDlSGHlPC-Z4E-R239aBw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED0638007A4;
	Mon, 11 Mar 2024 10:04:14 +0000 (UTC)
Received: from kaapi.redhat.com (unknown [10.67.24.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C49CF2166AE4;
	Mon, 11 Mar 2024 10:04:12 +0000 (UTC)
From: Prasad Pandit <ppandit@redhat.com>
To: linux-media@vger.kernel.org
Cc: Yasunari.Takiguchi@sony.com,
	Prasad Pandit <pjp@fedoraproject.org>
Subject: [PATCH] media: cxd2880: Add terminating new line to Kconfig
Date: Mon, 11 Mar 2024 15:34:07 +0530
Message-ID: <20240311100407.1271331-1-ppandit@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

From: Prasad Pandit <pjp@fedoraproject.org>

Add terminating new line to the Kconfig file.

Fixes: 9dbaad428d69 ("media: cxd2880: Add all Makefile, Kconfig files and
Update MAINTAINERS file for the driver")

Signed-off-by: Prasad Pandit <pjp@fedoraproject.org>
---
 drivers/media/dvb-frontends/cxd2880/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/cxd2880/Kconfig b/drivers/media/dvb-frontends/cxd2880/Kconfig
index 9d989676e800..94a8e0b936b9 100644
--- a/drivers/media/dvb-frontends/cxd2880/Kconfig
+++ b/drivers/media/dvb-frontends/cxd2880/Kconfig
@@ -5,4 +5,4 @@ config DVB_CXD2880
 	depends on DVB_CORE && SPI
 	default m if !MEDIA_SUBDRV_AUTOSELECT
 	help
-	  Say Y when you want to support this frontend.
\ No newline at end of file
+	  Say Y when you want to support this frontend.
-- 
2.44.0


