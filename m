Return-Path: <linux-media+bounces-16337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2486E952DCA
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 13:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C77C11F2188D
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 11:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D1F176AC1;
	Thu, 15 Aug 2024 11:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b="oonhyqQR"
X-Original-To: linux-media@vger.kernel.org
Received: from azazel.net (taras.nevrast.org [35.176.194.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23E414BFA8
	for <linux-media@vger.kernel.org>; Thu, 15 Aug 2024 11:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.176.194.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723722871; cv=none; b=VBbf6fYoEfc6tPpZCTFH6qKeweVMPutl30rbTA68QDHG8lmQsJXeDnGnhw2d2ajbsToNnfF4rb/wnI8JHp/mdMzjzZtqztmetT7XkBO67l0ZfSbF5PBxeKMxn6l6YlgsClnd6AEc6f/XHl9z1q1MAZ3X7FdFB4hWswqzcMIgIQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723722871; c=relaxed/simple;
	bh=+uhHEgpn44Es/WOyTJ50lnKyN5iX1xSQuK7iKZj04c0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=KEOwRYDHH4JhmbU3bT2myGuakRy8La/ijkwRxAQvvpAf1QfrpMD7mtOxO8qhCVMV1fR7Q/ufQyNojtSVmEhQhHGTH4IY5mr9iYRc8iuWqsDPopUxrdfNX0X33HculD1o+8+TH5SuzQBesJYzWkHoJxDeWo+Xwyiz3o89IAvbpqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net; spf=pass smtp.mailfrom=azazel.net; dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b=oonhyqQR; arc=none smtp.client-ip=35.176.194.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=azazel.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=azazel.net;
	s=20220717; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=gk96W3iLiIgfQxOAZzEJe2RPULYPsPwcnZDMJ6IcFag=; b=oonhyqQRpVHU07i0steJ6QzdAu
	BKUE/tXhH2kGDwH3APXiRb6Qurz1Tu0sW2dHmPjJQPT4JVE4moO1Uw540n34lDgsEYOO4owQDfGvO
	PjIm0GGS2+LomdYOVmmWVuh1C7/AnVMlN5Ii+yVH9QNiEMwid2yARjHOTFTrreVpQ3tui5eE4tC6T
	N9vEWgTb3L7F18CnIdbNBnxh9duS+mQJPhCjIwQNWWzfy6sMHx8VJHGfkwVsadMhf7sy5VACUok1K
	ZH3VneDrYMFU4r3HEnjoRZAiP78s8rQKwQv/ToqG2ms3bch3hTEdf9QjcziZgGEQgUktY6Kk3Pt3m
	lYw66toQ==;
Received: from ulthar.dreamlands.azazel.net ([2001:8b0:fb7d:d6d7:2e4d:54ff:fe4b:a9ae])
	by taras.nevrast.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jeremy@azazel.net>)
	id 1seZ3h-00CeCX-3A
	for linux-media@vger.kernel.org;
	Thu, 15 Aug 2024 12:54:25 +0100
From: Jeremy Sowden <jeremy@azazel.net>
To: Linux Media <linux-media@vger.kernel.org>
Subject: [PATCH xawtv3 0/2] A couple of fixes
Date: Thu, 15 Aug 2024 12:54:13 +0100
Message-ID: <20240815115415.3371544-1-jeremy@azazel.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:8b0:fb7d:d6d7:2e4d:54ff:fe4b:a9ae
X-SA-Exim-Mail-From: jeremy@azazel.net
X-SA-Exim-Scanned: No (on taras.nevrast.org); SAEximRunCond expanded to false

The former is a gcc-14 compilation failure that was reported in Debian.  The
latter is something unrelated I spotted while testing the former.

Jeremy Sowden (2):
  Fix gcc-14 compilation failures caused by incompatible pointer types
  Use `pclose` to close file-pointer created with `popen`

 x11/man.c       | 2 +-
 x11/propwatch.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.43.0


