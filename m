Return-Path: <linux-media+bounces-16339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B53A952DC9
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 13:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44EE31C2462A
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 11:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56DA3176AC6;
	Thu, 15 Aug 2024 11:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b="kmcbaxRx"
X-Original-To: linux-media@vger.kernel.org
Received: from azazel.net (taras.nevrast.org [35.176.194.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C239C7DA9F
	for <linux-media@vger.kernel.org>; Thu, 15 Aug 2024 11:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.176.194.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723722871; cv=none; b=g5ltLPrX7pBn3pcS7nAgW+VYC+osJrAQpxKd2snrx4cJLri6yRzWqLh/dKiTibxZ05wI9Q03c3wEatutyiTrmIdSKCGNhXjQ03T/N1u4y5cGk6OKzuvWLRw5jcyAz23S1iPYlt/yV0d09zvlgq0fGUgGrEnz6dpEKyl8yEjwjnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723722871; c=relaxed/simple;
	bh=MOA6KauWo57lSSDDmM60VY7SV4gVdVsAu6JfiRQPuDo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWanuzys0Duut4VjTYnaQr/XFsdz1BJ0Aks0ib4vcB2u6NQ8NyhHRDkQNoExTFYmfoiDS6fea1fZyJccNPS9fjeeUU6OXrTYwV6GNDmIDahk/C2d3XtPzqiwgA1g2DeCgif/t2n9uLeSFlUYfETwUqMg5qr2SjXf9unrP0i3Bq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net; spf=pass smtp.mailfrom=azazel.net; dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b=kmcbaxRx; arc=none smtp.client-ip=35.176.194.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=azazel.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=azazel.net;
	s=20220717; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vN93bRKca0zv/L2pwmGS4rrzVdQ3N7QEPwLt8BVq+qo=; b=kmcbaxRx8ogtkCQhlZGc1THTqL
	gfgNDT10wzv2iL+ZAkPUmKtPNAChpDPP1yg0Cw/aKzTstjJ+qu1a+cUgr6za5rkHQ56Lo68S9e8T8
	UXT71EjfQ1+mN+7J2dxsIYva8Cg1CYJ5m79MRIDxeJdYZ7nfAltDZds4Trr7hGBEjZHLjr+/vSu5I
	Xeinkzo0y+Rh6g3wD1aT2rPxqQmne+tJNUFd0fYgOJQS3lOVh7jdwmz4eXUQTnF3IF1q8QY2OxpM8
	IES9QduqD6x5WNRxVYiRCucDj48ev5lc8jLsXphPp1hr+5C4LfaMBx9yhcXqOgrzYq/fQhOT1MbIT
	TwTRIedg==;
Received: from ulthar.dreamlands.azazel.net ([2001:8b0:fb7d:d6d7:2e4d:54ff:fe4b:a9ae])
	by taras.nevrast.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jeremy@azazel.net>)
	id 1seZ3i-00CeCX-05
	for linux-media@vger.kernel.org;
	Thu, 15 Aug 2024 12:54:26 +0100
From: Jeremy Sowden <jeremy@azazel.net>
To: Linux Media <linux-media@vger.kernel.org>
Subject: [PATCH xawtv3 1/2] Fix gcc-14 compilation failures caused by incompatible pointer types
Date: Thu, 15 Aug 2024 12:54:14 +0100
Message-ID: <20240815115415.3371544-2-jeremy@azazel.net>
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

`XawListChange` declares the type of its second parameter as `_Xconst
char **`.  However, xawtv passes `str_list`, which is declared as
`String *`, or `&empty` which is declared as `char *`.  With gcc 14, these
result in incompatible-pointer errors:

 x11/propwatch.c: In function 'RebuildList':
 x11/propwatch.c:319:43: error: passing argument 2 of 'XawListChange' from incompatible pointer type [-Wincompatible-pointer-types]
   319 |     XawListChange(bl,str_count ? str_list : &empty,
       |                      ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
       |                                           |
       |                                           char **
 In file included from x11/propwatch.c:28:
 /usr/include/X11/Xaw/List.h:170:27: note: expected 'const char **' but argument is of type 'char **'
   170 |  _Xconst char           **list,
       |                           ^
 x11/propwatch.c: In function 'ProcessPropertyChange':
 x11/propwatch.c:498:34: error: passing argument 2 of 'XawListChange' from incompatible pointer type [-Wincompatible-pointer-types]
   498 |                 XawListChange(bl,str_list,str_count,1000,1);
       |                                  ^~~~~~~~
       |                                  |
       |                                  char **
 /usr/include/X11/Xaw/List.h:170:27: note: expected 'const char **' but argument is of type 'char **'
   170 |  _Xconst char           **list,
       |                           ^

Both variables are only used as arguments to `XawListChange`, so change
their types to match its expectations.

Link: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1075650
Signed-off-by: Jeremy Sowden <jeremy@azazel.net>
---
 x11/propwatch.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/x11/propwatch.c b/x11/propwatch.c
index 465c4ea1546e..f7aac657a4c8 100644
--- a/x11/propwatch.c
+++ b/x11/propwatch.c
@@ -58,8 +58,8 @@ static char *watch_default[] = {
     "WM_COMMAND",
 };
 
-static String   *str_list;
-static int      str_count;
+static const char **str_list;
+static int          str_count;
 
 static void AddWatch(Display *dpy, Window win, int i);
 static void DeleteWatch(Window win);
@@ -306,13 +306,13 @@ cmp(const void *a, const void *b)
 static void
 RebuildList(void)
 {
-    static char *empty = "empty";
+    static const char *empty = "empty";
     int i;
     struct WATCHLIST *this;
 
     if (str_list)
 	free(str_list);
-    str_list = malloc(str_count*sizeof(String));
+    str_list = malloc(str_count*sizeof(*str_list));
     for (i=0, this=watchlist; this!=NULL; i++, this=this->next)
 	str_list[i] = this->text;
     qsort(str_list,str_count,sizeof(char*),cmp);
-- 
2.43.0


