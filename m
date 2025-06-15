Return-Path: <linux-media+bounces-34822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E4BADA25A
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 17:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06FD716D08B
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 15:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3EE27A92A;
	Sun, 15 Jun 2025 15:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b="U0+0GyIb"
X-Original-To: linux-media@vger.kernel.org
Received: from devloop.tasossah.com (devloop.tasossah.com [145.239.141.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEF1157493
	for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 15:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.141.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750001883; cv=none; b=ucwo8xPieqeUCnXWif8rlbboWSVC2TTHaZKCxSyZi5ph8PsFDxqDqhw2l99zpMLZW2v4yaJq1G7zVmnsCFGz58pdeDWmrhhUfsCDDuuA793R4LYRcOTd9idOekevHMehLi2xqv/YKmjrS2hp/5yrKffkgPc+KW4yJV7oYnv/BUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750001883; c=relaxed/simple;
	bh=9rb5tefi9qatvD73wIBviAUVcbndIzx3mRcrEkG4LZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eRv8X5qiBZo7pLZBzKqoMce3o+jpCxDpRmMhM0PHf0PN2tJcT7HA+ojBsVCZaTJBiksw3EphrMgCzQQ3ucwOKTIhMuL22Hb+4yUi8yHgGwVkIvczGoAuXAGMyhDONcdrhYVfSUMX6QkKKpDhBBhfFPXTZxdjKtZk17rS3aOBwc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com; spf=pass smtp.mailfrom=tasossah.com; dkim=pass (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b=U0+0GyIb; arc=none smtp.client-ip=145.239.141.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tasossah.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=tasossah.com; s=devloop; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Sw6H6xbme+8XCKpmh/vyumeweC/LVv3PyhtgzVsIXN8=; b=U0+0GyIbMG8U4PVh5AJBJ7gA4O
	qnUrDSTQ4lnI5MyBQrWhyLfrLouZxKyB/UTnVJ8PrBF269sN/JUcNAep5d5KTRqcki+FFReTS2Hys
	WP/2tnyZUTy4RsSh/se3iFtxqUqC8UXsFikcDnOPRfIjSlSDBGu8tmRm6UPf7xTSpMwGTnbdcFoNN
	WL9EgCcGLsHaOnlPe39SccpyGsyRBg0hIAHoCK5/0AnWMcqmOJZM6HcQEPU2aJbm0guNcawKjzyCd
	kWirVrCetnEMapkTtfbPhY9Qp3BqK/3mXLFgDmH4RlAngAWXA+ngIcEkuGr2AeyJYicRwOaFTzy+U
	++OUePi0Ah5g1zF3KsFKj5IA1lQ63UC0Eg7PQmtuY65WUI94Q0H4xQb8TvIgUT1hxWs9p/HKo/Z0M
	lvNeAtAIIgsnpq+PuHjFB7JhXRRe067hnrqRvAjuGTmeP+JzLT7agbZlCSe3fM4wXLtm2/sfRaFZZ
	lbvfAIJdSdjI94usHj/1EFcwQn1jfE1wcHBQCMXjKUTCKyxmagO3PiDvMInZtuqxr8bbk8gwGJlP1
	t1JZjvCxHov1/gNhGlbGBwZV26zrc+qvnyXhhIlTlxpdAcdpyw+D5Ndr1YVsnhbSnSgkW9aH88ljX
	RdshFCGShBIXjwZrQkbEivPflN577sfktwknkCH/Q=;
Received: from [2a02:587:6a09:4a00:d0fc:27f9:c172:9792] (helo=localhost.localdomain)
	by devloop.tasossah.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97)
	(envelope-from <tasos@tasossah.com>)
	id 1uQpQk-0000000HJaM-3JYD;
	Sun, 15 Jun 2025 18:37:58 +0300
From: Tasos Sahanidis <tasos@tasossah.com>
To: linux-media@vger.kernel.org
Cc: Tasos Sahanidis <tasos@tasossah.com>
Subject: [PATCH tvtime 0/4] Resolve various memory-related issues
Date: Sun, 15 Jun 2025 18:21:11 +0300
Message-ID: <20250615153751.1707298-1-tasos@tasossah.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series resolves a few memory-related issues present in tvtime.

It includes three memory leaks, a U-A-F, and an out of bounds read.

Tasos Sahanidis (4):
  Fix use after free on quit
  Fix XineramaScreenInfo memory leak
  Fix fifofile memory leak
  Fix out of bounds access in MMX scanline blit

 src/speedy.c      | 2 +-
 src/tvtime.c      | 3 ++-
 src/tvtimeconf.c  | 2 ++
 src/xfullscreen.c | 2 ++
 4 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.43.0


