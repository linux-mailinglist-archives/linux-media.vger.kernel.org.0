Return-Path: <linux-media+bounces-34824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A03AADA25D
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 17:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BEB616D0C1
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 15:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70DE427AC43;
	Sun, 15 Jun 2025 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b="aNJ8Pi8B"
X-Original-To: linux-media@vger.kernel.org
Received: from devloop.tasossah.com (devloop.tasossah.com [145.239.141.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41F927A105
	for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 15:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.141.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750001883; cv=none; b=Hox2YpZOoaUvAD7sAp1S9mLFA7NJ0oUvDF8L1n5GFDWI3FDfoWkRU8d2ZQ31xfmCnqjULDqknLiT/t9B4/fYnsiUZbQG56tMq7jv4AhMgLXf0HgjfSUlc9l8lRPKVY+NOyvoaqCPObNjBFUVxa2NV6lDj889s/uyxWlMsL4rnLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750001883; c=relaxed/simple;
	bh=iCFnpQs9+Gmd0bcsjnRjBwWCwVP3kbz9Q1TbVhB716o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FW2l76dJgg/118ObbIsolbqAFme7LXbglI/EiE6mCSSKcIKNR6sopDtVKMw9A1bN6wHoWP70ywig3U36wYXeATSr9zy/xl9QGUJDclxTWPdQsIaE9r6iXaZKzMLtflpULNf/VWP59uQ6YqAHDoywzpAitfbD/iWMg5EoeLxwqmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com; spf=pass smtp.mailfrom=tasossah.com; dkim=pass (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b=aNJ8Pi8B; arc=none smtp.client-ip=145.239.141.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tasossah.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=tasossah.com; s=devloop; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GG4hdp4f4pLHydwghYPJVPiFD9Ifc3uWOoQUdBcenNE=; b=aNJ8Pi8BAZjlkzgQWmzrhS3zbZ
	3IUlJzKhV4uLynkkubP6nbTvTAyGh/3p0YNTvlObTwpU5/z0HCKkPd2tVWsoSnCXvPYd846PRQInH
	byysdbxnuSpi1VNJtgHKiva9d0uB85EvK0GJaz86jQjqTpXseVV6XeAo6RvrshGSm33ImCXMmBOLs
	YD0Ta+ELtHTPgJ3EtHFMfYKe6pffuAWJJFiEh1MLtNPhjx7VB4vKVl+PfnJV6Zyw3DRkCFdizEOAr
	IGjaSKlym7xQ68qpl2RflrLx1DtF4hDs6v5Gz+R/JSoadZwbHlG/VhZ7uWw06cRy+xHQVa+C5d9nw
	X2+8tPuPoq35NYlLJ98TPiaAgkv6kkS1zG3pFGsAiOY870BxZ7kyWHistQxXLkGBgLXT6uwwBlg2E
	CpdqfZUTMTmhNfnfaXxqC810Z7CU87UPQZaCu7Amm56HCIy1f/MuIjKkOh27vzMyZscp4qt0qWQKN
	XSaAUPW6QR8OntLJ+NaUWaCqS70ffjnvZa4wKNQD1EcN7DijoNoFjbwsh4EeDtDiZU5VabdmVSqYG
	X3QCnYdQX/GPuaojw/uoX37eiwtGbtDvDTLuKAv2fmMLEUwPEgoRiVRzT7u39P9a7Ma9faXWrm0wx
	QYDjZm8U8KDbrUAFUBgR+Rt2x05Aca9+Zluj3WU5w=;
Received: from [2a02:587:6a09:4a00:d0fc:27f9:c172:9792] (helo=localhost.localdomain)
	by devloop.tasossah.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97)
	(envelope-from <tasos@tasossah.com>)
	id 1uQpQl-0000000HJaM-0Mqn;
	Sun, 15 Jun 2025 18:37:59 +0300
From: Tasos Sahanidis <tasos@tasossah.com>
To: linux-media@vger.kernel.org
Cc: Tasos Sahanidis <tasos@tasossah.com>
Subject: [PATCH tvtime 1/4] Fix use after free on quit
Date: Sun, 15 Jun 2025 18:21:12 +0300
Message-ID: <20250615153751.1707298-2-tasos@tasossah.com>
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

mixer_exit() uses the config, so move the call to config_delete()
after it.

Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 src/tvtime.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/src/tvtime.c b/src/tvtime.c
index 438664c..baffe20 100644
--- a/src/tvtime.c
+++ b/src/tvtime.c
@@ -2582,7 +2582,6 @@ int tvtime_main( rtctimer_t *rtctimer, int read_stdin, int realtime,
     if( vidin ) {
         videoinput_delete( vidin );
     }
-    config_delete( ct );
     input_delete( in );
     commands_delete( commands );
     performance_delete( perf );
@@ -2602,6 +2601,8 @@ int tvtime_main( rtctimer_t *rtctimer, int read_stdin, int realtime,
     }
     mixer_exit();
 
+    config_delete( ct );
+
     /* Free temporary memory. */
     free( colourbars );
     free( saveframe );
-- 
2.43.0


