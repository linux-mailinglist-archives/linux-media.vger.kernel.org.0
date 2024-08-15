Return-Path: <linux-media+bounces-16338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8024A952DC8
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 13:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3545E285CB2
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 11:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B34176ABF;
	Thu, 15 Aug 2024 11:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b="HKLBHKcE"
X-Original-To: linux-media@vger.kernel.org
Received: from azazel.net (taras.nevrast.org [35.176.194.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C242815D5D8
	for <linux-media@vger.kernel.org>; Thu, 15 Aug 2024 11:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.176.194.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723722871; cv=none; b=Qf5Ch7kpEm0cNL57xLTzwmC/RbJQjlA24UplrzwCr8uk7S57IIBNAW4FXLng34U5lDy/V5e024YA/ub0VDuMFXJwC8+Y3Hfq+DG4y61t87GT42rW5QGFpwx5IlgOE2hxhl4RzcH3k0MeMBvuRRSo7Rg8iHmvVbDfg0S56wQdpR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723722871; c=relaxed/simple;
	bh=in0SgKVukHQVY7hSNzsyXaEqTq7VkY9phTEYgRHw+us=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HtIB/34fSy8UC3ZFRGbLDUclL1IzI91z5TOL6l78fUwZtgVwtE3ytddsXbtdsMT03GcbmAp8kPiGIPF1nDzyMjfFJ1eT9m3Z0b9a4YCEjd1KAmWsO/7heGhqTBYcdnQVzn7kTKNQIKlYgbDljXeQdwkWZTAcdLEg3YrjjrS37Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net; spf=pass smtp.mailfrom=azazel.net; dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b=HKLBHKcE; arc=none smtp.client-ip=35.176.194.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=azazel.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=azazel.net;
	s=20220717; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=GRkjbYMXHTGu0tW3xWL2oeZwgq5QTLtjAllLA/Z9oyU=; b=HKLBHKcEZhK7bzpGUIFnn9XRtC
	I4bjEY13ypX24PFbpbl0YlLOyz0pUI/dEqQN0k9VJKdvceLtV3BfzLb7z0uhPKrUgoYOxkvwFaFQL
	R/5O7lCRHJALcUnwVxKyydSWgPc6gqg0+CLxDCcY9W29J75g7vrN4/iD2zfrEb9dBkcRDTAbNwcaH
	NMEFH+4m0mxkjiydj9lkGP4z7QD5XOHxh1it1M4Ogk9AANKl7SxcgFLdZc6XEredCYmYK530XVshy
	8glrYJB995lv6XcFD3EiX4HLnmxjlNBHIMseBrqOI8wsuevqcQGfa4EXgQO3qZqP3MpFe9uGSBdTf
	NVqozMBA==;
Received: from ulthar.dreamlands.azazel.net ([2001:8b0:fb7d:d6d7:2e4d:54ff:fe4b:a9ae])
	by taras.nevrast.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jeremy@azazel.net>)
	id 1seZ3i-00CeCX-0D
	for linux-media@vger.kernel.org;
	Thu, 15 Aug 2024 12:54:26 +0100
From: Jeremy Sowden <jeremy@azazel.net>
To: Linux Media <linux-media@vger.kernel.org>
Subject: [PATCH xawtv3 2/2] Use `pclose` to close file-pointer created with `popen`
Date: Thu, 15 Aug 2024 12:54:15 +0100
Message-ID: <20240815115415.3371544-3-jeremy@azazel.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240815115415.3371544-1-jeremy@azazel.net>
References: <20240815115415.3371544-1-jeremy@azazel.net>
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

gcc reports:

  x11/man.c: In function 'man':
  x11/man.c:106:5: warning: 'fclose' called on pointer returned from a mismatched allocation function [-Wmismatched-dealloc]
    106 |     fclose(fp);
        |     ^~~~~~~~~~
  x11/man.c:69:10: note: returned from 'popen'
     69 |     fp = popen(line,"r");
        |          ^~~~~~~~~~~~~~~

and the popen(3) man-page states:

  The return value from popen() is a normal standard I/O stream in all respects
  save that it must be closed with pclose() rather than fclose(3).

Signed-off-by: Jeremy Sowden <jeremy@azazel.net>
---
 x11/man.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/x11/man.c b/x11/man.c
index 482980565a63..b71785c31ab4 100644
--- a/x11/man.c
+++ b/x11/man.c
@@ -103,7 +103,7 @@ man(char *page)
     }
     XtVaSetValues(label,XmNlabelString,xmpage,NULL);
     XmStringFree(xmpage);
-    fclose(fp);
+    pclose(fp);
 }
 
 void
-- 
2.43.0


