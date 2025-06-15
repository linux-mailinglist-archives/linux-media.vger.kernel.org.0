Return-Path: <linux-media+bounces-34825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA814ADA25C
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 17:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFDB216D165
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 15:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7255727AC4D;
	Sun, 15 Jun 2025 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b="eZvZGiyJ"
X-Original-To: linux-media@vger.kernel.org
Received: from devloop.tasossah.com (devloop.tasossah.com [145.239.141.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8D927A114
	for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 15:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.141.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750001883; cv=none; b=gEeEINlqjiXLwCbe+v/mMgq9P2oVMS8+QVZbiRTfTe6+jX296QMxYzy9WDxhf0B814KnSpSMD8QUUAa/RIg03D7TyxFHXmenBFXMevW4rUs3k/16didZazm36sc9puVbyxdDwML3nKVxoXOjt8ZzNVM/ffekor/e7JmXlP2GhkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750001883; c=relaxed/simple;
	bh=co+rxh5Ui/UucY+Ko5WqnkYO2J7HKOu/hhwnozyGFxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OLwEeDDLaxeJl9FtkN0Alqb2tIIEHc62FOObHUTpTma9ElPxIwsvqLNDPmME7uKQrllhcfl5Glvnvzdn22uMuDRoM4ZOgKNAJkj9h6Fyoo4Ku9IM+6f46PQttCeDZ6mPh0jpwXTM/9mmXgZXM3ALIZWQgtLpQ57WxRxrVz7BOjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com; spf=pass smtp.mailfrom=tasossah.com; dkim=pass (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b=eZvZGiyJ; arc=none smtp.client-ip=145.239.141.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tasossah.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=tasossah.com; s=devloop; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3C+Q9mZpyqKRnYLSUKB2J+oY/tFxwWc+5aypkDGpz1Y=; b=eZvZGiyJPQjFo5+Xp4RmIzPlTF
	1X5Dd3r3aPK47Ep8QP2RYClU8/ny0ijDZA4eKRl39iPKYwydie88Exs9svKnz9ny3hrJAB8QC8KXV
	MgPsVKm0p3j/y/KWbrPgmQeYc6R26uXQKiQ4pwesCm7ZqFkSXEPGw+pJu0GoINbHSjQ6I3o4/uMif
	x8IcByBoSgrJJaUmGriSoAcwCxDUsCV3u4N1PIzKU4kj2d4CpR2avm7S3nVtRZhwgGJPChMq5yYOh
	hrJN81Pi2RWPVDfFlsiPhm36xjk2MscZnhFpcjj4sUZ7Y8bc9MjP9+RUuTmLtVJuxq3Ev27p1an/N
	VkpTwQ0+2OVx0ra0IC2ST48SKuEdis4ceBT9wt+akL9f4nK67i4Wj3QvoUHmOrkt7AC4NdU46vYAv
	/UCEUD4dy7p+klNQTC2MsqPgYa+93mPIVmmOChHUNcyXx548+rWyo8o76rYRW0AMOQk72ChH02pFK
	f8o2d5Dnn/I6zVR1D313wIMNEvLr/ILhzXRUrujmHEuYdyt72vr7ngjsLf/7YqLk6r7KpXRiMinE4
	IrdczKYKtjE58JW86XGgW2UVmXs7wb2igqzQ1gDVRLYRAL/wqJoOZ09wlXK/RZCizI3TDkwYoF+Ku
	I7iHsoqTkKkEQa7UpctQe66HluRg9iMVIlOqvnN7c=;
Received: from [2a02:587:6a09:4a00:d0fc:27f9:c172:9792] (helo=localhost.localdomain)
	by devloop.tasossah.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97)
	(envelope-from <tasos@tasossah.com>)
	id 1uQpQl-0000000HJaM-2rqH;
	Sun, 15 Jun 2025 18:37:59 +0300
From: Tasos Sahanidis <tasos@tasossah.com>
To: linux-media@vger.kernel.org
Cc: Tasos Sahanidis <tasos@tasossah.com>
Subject: [PATCH tvtime 3/4] Fix fifofile memory leak
Date: Sun, 15 Jun 2025 18:21:14 +0300
Message-ID: <20250615153751.1707298-4-tasos@tasossah.com>
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

The return value of get_tvtime_fifo_filename() should be freed, as it
calls asprintf() internally.

Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 src/tvtimeconf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/tvtimeconf.c b/src/tvtimeconf.c
index a58a402..2e78e8a 100644
--- a/src/tvtimeconf.c
+++ b/src/tvtimeconf.c
@@ -1033,6 +1033,7 @@ int config_parse_tvtime_command_line( config_t *ct, int argc, char **argv )
             return 0;
         }
         close( fifofd );
+        free( fifofile );
     }
 
 
@@ -1251,6 +1252,7 @@ int config_parse_tvtime_config_command_line( config_t *ct, int argc, char **argv
             return 0;
         }
         close( fifofd );
+        free( fifofile );
     }
 
     ct->doc = configsave_open( ct->config_filename );
-- 
2.43.0


