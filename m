Return-Path: <linux-media+bounces-34823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A1FADA25B
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 17:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3AAE3B0B58
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 15:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16AC827AC21;
	Sun, 15 Jun 2025 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b="JV2/WWqP"
X-Original-To: linux-media@vger.kernel.org
Received: from devloop.tasossah.com (devloop.tasossah.com [145.239.141.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF97D2116EE
	for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 15:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.141.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750001883; cv=none; b=io/v00qSybTZw/UO06fIvA7bsKXE3QYzF6yOUJ7ofNsegLU63WCIkzjUKzzW6FwKT61cIG2HToaDuvrvUFvzZqCVoHMwWskDSUihkRwfTh0lzGHfbjFBYfL1KPdGNToHbA6q1HpHdguAUkAlcXRSXDMASbyXpZtoTmgj4DM1408=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750001883; c=relaxed/simple;
	bh=hmKRqFEGX9uEL25kUxbEqYAvOEBXs2viuUoCVE7fKyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UPVnwbxQIq8GBlFxUpnCjek7iO+6p71nBy2tPE42BJS/4uSRITNhTl7KnGbFC6kUXPBT8eVg0q0C6FEURLBlkppqsTIHQeVSUzZVYDAsCjxNoyuDsP/W+YecQoA2T/ityRrmYt8nItYwxbXi0xiUSNI6pkWOLeWg4hGut5NjKSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com; spf=pass smtp.mailfrom=tasossah.com; dkim=pass (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b=JV2/WWqP; arc=none smtp.client-ip=145.239.141.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tasossah.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=tasossah.com; s=devloop; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8cRJPWIVqUU7HDuCK8qcv3q/0WpWTEif04EomwnQHNQ=; b=JV2/WWqPxShpaBQx4V5dR7FsqR
	XsP4+32cZH8UELfxQGL/t+VrXKjJD4SV6A2Q38OXQzm77p2CGHfXrs2IEOMcuj/euWXqh03q4yk4L
	kic8kKxZQaOVPwMP0J9aXVelsxYFX8yfLv7TNJOAO76gThtsdVuuU4SAJtjytSD7zQezHJnX4vZHm
	V/pJo1vE+YgwJAU0X7LCo7UelBlrV9XqiE7ECYyESSekQHTj4zYCbOCIsOWjuvnYpEjEQ/x5F7s67
	aaYboqmKtrMDBTlmNb489tsMBs7Qez+0C71MeWjviyLrslyzJUMnLIXvf1ZAMVsv+Z5HgW4Pitm6x
	4jwTaTRyFsuTP/mjxGFDatMTyO8vkIaynNVep+0gNoPyuqLgjPNM0xihIQ4rxrg6moARTkQTjRxzw
	Et2y1gNQOtQhSV8Ao+x7m3sfmiZryzK3KGHLiLwYQH6cXiJHzsrqdCDqz1IklxGspGzYySNtJCVNi
	dmfzuHE6g45N9tLBU7XznQ5COeW2eKp/mtYqbOfUWEduVwHK2M38YXTUWoWmiyeorLO+SN0ZSi0Sa
	dLkKaQtbB92ciiDvPfh0DwVBHxv4XxOPfVKBWpA9YtX7g9JqO2/zklfRERKjGS2qTltSi7C+Abl7G
	2P3eDngDKSXvDWVP8NN6gLqP3NjtfifjrZnalC81o=;
Received: from [2a02:587:6a09:4a00:d0fc:27f9:c172:9792] (helo=localhost.localdomain)
	by devloop.tasossah.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97)
	(envelope-from <tasos@tasossah.com>)
	id 1uQpQl-0000000HJaM-1cF7;
	Sun, 15 Jun 2025 18:37:59 +0300
From: Tasos Sahanidis <tasos@tasossah.com>
To: linux-media@vger.kernel.org
Cc: Tasos Sahanidis <tasos@tasossah.com>
Subject: [PATCH tvtime 2/4] Fix XineramaScreenInfo memory leak
Date: Sun, 15 Jun 2025 18:21:13 +0300
Message-ID: <20250615153751.1707298-3-tasos@tasossah.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250615153751.1707298-1-tasos@tasossah.com>
References: <20250615153751.1707298-1-tasos@tasossah.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pointer needs to be XFree()d afterwards

Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 src/xfullscreen.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/xfullscreen.c b/src/xfullscreen.c
index d6da57d..cfa4bd7 100644
--- a/src/xfullscreen.c
+++ b/src/xfullscreen.c
@@ -151,6 +151,8 @@ xfullscreen_t *xfullscreen_new( Display *display, int screen, int verbose )
             fprintf( stderr, "xfullscreen: Using XINERAMA for "
                              "dual-head information.\n" );
         }
+
+        XFree( screens );
         return xf;
     }
 #endif
-- 
2.43.0


