Return-Path: <linux-media+bounces-34572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D0BAD6842
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 08:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 941AF16D838
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 06:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BAA202F79;
	Thu, 12 Jun 2025 06:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="UAVReQKV"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858A745948;
	Thu, 12 Jun 2025 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749711259; cv=none; b=XWgyFaRCTQGHTNNccaflJC42snKWy+Vl8ob/2Zu4UQ1j8yvNidd7AW6xY3QPGxWwW6tuauR33rtPhW0RNgmLKdr6BM7jmQg+FRQEQ4ykVpym/csTHKaDOVJjBTTdzvz++N6Yh1K5155G+VMuARu9EpL0AD1RuM0icjJjtOE7Umg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749711259; c=relaxed/simple;
	bh=PzPtaGSdBkLz6S2v2qC7RyJk+Y+e0u9UjEVDT2yKpWw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P+++1CGdE3sbhzm3DhYuF5Gsm2wvoQrCmz5LZtieKQJIcjZZDK6br0U2JmC51OtiIFR9H067PGKYjNRk8vtdAfYw7hMOaxddp7kDKDbitt9bco06TdZ/anKDJlnv/csT2nU+lkaTaQ+rn+SPQiGUS2eDi7YiNNJAbm74KYOyUR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=UAVReQKV; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=chjwl3pOPxc4IG5rSXNObzcCIHR/xPckR5Zij95VUcg=; b=UAVReQKV0T7x/4Uy+vHtMs/7+l
	bL8jTpi0hPWhOkJilOchLipTAO7QU8SzxeNhi3mV/Q0L/hXlBkcLEvWyCxj+2S4N3GNW8Zfx9nQIH
	A0b0ekKTlQPzbbXXRjS3W4wxrDp65OTlbtfxAookQllD1OsaBQ8525ZtOZWwIDZ/37FE=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:59918 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1uPbpF-003wuh-6z; Thu, 12 Jun 2025 08:54:13 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Subject: [PATCH 0/3] media: dw9714: support for powerdown pin and minor
 cleanups
Date: Thu, 12 Jun 2025 08:54:09 +0200
Message-Id: <20250612-dw9714-v1-0-1a2d6d682829@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJF5SmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0ND3ZRyS3NDE12D5GTTxBRLs0Qjw1QloOKCotS0zAqwQdGxtbUAitd
 sNFgAAAA=
X-Change-ID: 20250611-dw9714-0cc5ad96a21e
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com
X-Mailer: b4 0.14.2
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Besides minor fixes, this series mainly adds support for the powerdown pin.

Note: I already sent a single patch for power down pin support, but since
more things have changed and this has become a series, I've decided to
start it with V1.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
Matthias Fend (3):
      media: dw9714: coding style fixes
      media: dw9714: move power sequences to dedicated functions
      media: dw9714: add support for powerdown pin

 drivers/media/i2c/Kconfig  |  2 +-
 drivers/media/i2c/dw9714.c | 62 +++++++++++++++++++++++++++++++++-------------
 2 files changed, 46 insertions(+), 18 deletions(-)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250611-dw9714-0cc5ad96a21e

Best regards,
-- 
Matthias Fend <matthias.fend@emfend.at>


