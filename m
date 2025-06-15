Return-Path: <linux-media+bounces-34821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E15ADA256
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 17:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 869E51890B8A
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 15:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAC727991C;
	Sun, 15 Jun 2025 15:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b="R5cp4VVp"
X-Original-To: linux-media@vger.kernel.org
Received: from devloop.tasossah.com (devloop.tasossah.com [145.239.141.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071D6136672
	for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 15:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.141.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750001340; cv=none; b=B//7MLHuxMtireorHsh+S1dtKsopb73i3WRLAmJnuNeiiMTdIYZiz+NGauY8IWdzXhaKpgsGe+1CCQsZUoI5EIFEe+dEE9mvHjcKvCfieV3oJbOQojTHc5jLEolMbCBvEA5NJGcDumM0jbm1OFKWRJiw8S6oBw3DHB4fhWCZEkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750001340; c=relaxed/simple;
	bh=iD86fyfMmNdPQrP/h7BesM5vpkvrgc5dRw4Trnk3IDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kKHcr/amng94ZBa4WKaGZIyRGy0sZWVSbIbVCux/fZkMSDLIZHDB+3ebdJNmNMyNEpCPClZD5/M+G9goxcWeqToweY3scGAUZ606wtC5cVGghC9SoFSW1lwhyW7OON8kccdqWyr2LSqt5eLoXjMOQyR0W3aUqFaCx0zxem5JcFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com; spf=pass smtp.mailfrom=tasossah.com; dkim=pass (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b=R5cp4VVp; arc=none smtp.client-ip=145.239.141.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tasossah.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=tasossah.com; s=devloop; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=emBXkrv4rY3BZkkCSlWo26b5rVpAZepFc/lORhKC+q0=; b=R5cp4VVpSpf7NlabLdpeoFNvd6
	Imbcr4wKW2y+6tJdyLnO4wOMoeI5HfiSoNNJRSz6ITxFQzPwaXFwXY8W6s+RYynL8cZEC+HY3YXfJ
	5rtIFdwTbu+qu9vPwleAWcrJtbA5cVl5lxTeEh4cEHqksF6yq4E0w2WGh36fuyfKV06YLqXQ2K4k1
	1FHXxSiRQRM4NE1TkmAwrhhvmgpKicXCJAyQNBlSFV8fOIPDV3xp/8/gkQFqyIAP3KSNjZugDU590
	UcSKVxjCXQrXI8Ekov7/XXlwE6HwL7tRM1mJ2cQb+lCixVL9RhFDpBR1kqU5FwhXqI0LFmDf16uKU
	LkxVaTU7Qbf7E6Seo/40QXUuZ58T1CTi7A9qqkhdg/wCiWzS7MaZcUn/PrdlNwp8G51Lni7jXe6K3
	eLSbq/ohearul6l6Yj0X4v76LKFEsitbs2TEas73kDcF0s/CXXNcxe5oj6cSmNmKda5uBYb3rmZuw
	bVierhppPKO1pKcS6y1w4N8YDogzkS/3KIG1OY+ljemiaIPaeuD9y54ZqEAMQM0TBN6GUSs0aFlH2
	xfjv9hMRwGG2eyT2HxJw3uza5R2QFTRqFrXHU48BM4TC5nkmxb8aW7mCUckzxTBC0MtD2ja584yR/
	kbhyniMQQ+JZqHcEx/qCYNq4dyMm7p7jH2858fZXY=;
Received: from [2a02:587:6a09:4a00:d0fc:27f9:c172:9792] (helo=localhost.localdomain)
	by devloop.tasossah.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97)
	(envelope-from <tasos@tasossah.com>)
	id 1uQp7r-0000000HJTY-25IJ;
	Sun, 15 Jun 2025 18:18:27 +0300
From: Tasos Sahanidis <tasos@tasossah.com>
To: linux-media@vger.kernel.org
Cc: Tasos Sahanidis <tasos@tasossah.com>
Subject: [PATCH tvtime] Fix fullscreen on vertically stacked screens
Date: Sun, 15 Jun 2025 18:17:13 +0300
Message-ID: <20250615151712.1706986-2-tasos@tasossah.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Due to a typo, the top left (x) of the window was used to calculate
the bottom coordinate (y2), thus miscalculating the area and picking
the wrong fullscreen size.

Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 src/xfullscreen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/xfullscreen.c b/src/xfullscreen.c
index d6da57d..6936ce7 100644
--- a/src/xfullscreen.c
+++ b/src/xfullscreen.c
@@ -259,7 +259,7 @@ void xfullscreen_get_position( xfullscreen_t *xf, int window_x, int window_y,
     } else {
         /* Find the screen that displays the largest part of the window */
         int win_x1 = window_x, win_x2 = window_x + window_width - 1;
-        int win_y1 = window_y, win_y2 = window_x + window_height - 1;
+        int win_y1 = window_y, win_y2 = window_y + window_height - 1;
         int max_area = -1;
         int i;
 
-- 
2.43.0


