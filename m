Return-Path: <linux-media+bounces-57682-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBmIFbjVymk1AgYAu9opvQ
	(envelope-from <linux-media+bounces-57682-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 21:57:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB89C360AF7
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 21:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23C313035010
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 19:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5883DEFE6;
	Mon, 30 Mar 2026 19:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B39SHbzo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F58F3DDDC1
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 19:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774900634; cv=none; b=kUmr0InqZ5+tXz50Z5bALEF7RMd46V7SD8CCq/NdtFakVwtPMG5mAiWcIZesneYInFAfrKllcqmgwZRp93K2U9LTuoQQqXX/eUOQAKd7dQ+J0UxORfteh/2oC/xkSkzgWBo5D/Fx/f7HnF+YmHzDiTNsns12awQ9elrwrzjLuFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774900634; c=relaxed/simple;
	bh=B2g9vySkmOpaRu5NcYoeuXx7HJ/gTyaZa6RsgR7f3NM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1F19QhZkvoNr7un1L47TvTKo/Gu0wNldyppf8fUAeJJZdv01tBsiMyBLbLSHgkBQgnUm3dHCY1K3EK9nUAISNdOmGg+FavQ0EaKEkRkXPkispBFUUp3ghUIhAPsTp/UQLbQ7pE9WYuDL/Ln1JMlOgSzOYsT/gnMD7AxTf3f48c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B39SHbzo; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d7447778b9so2594677a34.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 12:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774900632; x=1775505432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57iCKkU5dxJL67EkipSKY4dLfnD+CbHLtZ2i9pHfp+g=;
        b=B39SHbzo+4nTq/8Omdgldbx+e0tCbSJUyQWbIZqmW+im4R0z2/zRb1TFtJuVyZTYfg
         GeO9gR6UvJSY94tXEpseSiE1SInCZOOdl0ndp9ZLtINrC6pgrM9RlOFN/Fia+RJUiY8l
         XapZfA3joPrPHK7Y2aSAQSd6Qf3hhIZGunMOuWJKafAcLvZ/AhRKVdatORFOwiP9y156
         WFUDQ3j4fcYfFSrSb0OYJ9tR2w7vnl4ylVxnCiuJcuRi6Qi9cJIZpov6eno5tqUQ4k6B
         oSNmxJCzz3dIwlNIAR7L9Y8M+TanKT/zyNVsu8BOa4K256wNq9t0D+7s13vfWXciqrvK
         xdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774900632; x=1775505432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=57iCKkU5dxJL67EkipSKY4dLfnD+CbHLtZ2i9pHfp+g=;
        b=iiieT2D3My1W1n2MjPMkeI1FHdY5c90PYqY+jkR8N0X5GFxCNYB7NDEEQeIxUo9tAS
         v9td3iopX0HMbAL18A24W7iPuGhaV3b+2xOxtrKq6W8fmg4H6Uopg4np7sVxRHihcr0/
         dAB9Uxvnvoa+cgWiJkXzJKTXeNS7AqZML13q8yE6hQ0ynDNPJroOPVNYUwGSpABI+oQt
         lO9lYkqxS6QBZYuNLtnN70Pm2xcQITKq4c61j/UHBicCydivqXVb9UdV8hLncHEluRGe
         4K41mzBvfiKpOVoewbTvkH5yw6WPsixt1DxZLrp0g/XGsoEsVKj2YMJ50/YwqMNDihAH
         PxWg==
X-Gm-Message-State: AOJu0YyW2Q7WwV/v1X3ELSwA7/VUB/BY73HDyFHA+DAN7m/SZy65PJV3
	CJbBAB/g/ZWi/5oVXzpFGV/YaKJXpWsNKN4AiShaiTF/ucFdvdLXTgIQd6OrLSCN
X-Gm-Gg: ATEYQzz7S6sXq1dIgvaVpeJ+0AqGOC4VOlvzdNpxOVNOaAOB/FJH1aMpcVzyeobxxKm
	1PGUnfsXNlQtDBdkLnmHWTr+t81033EIliu8XBZuo9YXCV1Nqp+e60wKjZFj8p1vZBDTJJGIFOa
	JnloywqolOBWhJaM5Y5VJMFXxdxPREdqaAAmzFS0BA4WxbVggtxt9fR8H8hZbfpivOsdVzuek0i
	XWtQ5uAmP0RpCccr0JCyAH9lRJ16AROpuh27/U5pa9kIIS0tpkaoOoa/eTd0dnQXy3U5FoJg6Sy
	7/cuBn1xVGg3/IvM7F7mCjc7LRTuUwT/SYue1jD2Q8Y4xmaFKnKXLtfZRA42LZUOxneh/3Tlu2g
	CqB+mzbNUzjSbmWUs2h5U4Kuo5ynEZWT1f7DXOfBJPnlpWlTDhf0sfvKqeOomkIZ6C2znvOU5Z6
	/soLJUPPwCy/V83AgmfAdXoqwSo/xZqRhgF6X/N1Qsl2TOpmU9f2OOJF8hp5Wa7UeasGqFdriK
X-Received: by 2002:a05:6830:67e9:b0:7d7:d216:2b26 with SMTP id 46e09a7af769-7d9fad70c69mr8071501a34.4.1774900632027;
        Mon, 30 Mar 2026 12:57:12 -0700 (PDT)
Received: from father (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a0f2bf9sm6452102a34.0.2026.03.30.12.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:57:11 -0700 (PDT)
From: hoff.benjamin.k@gmail.com
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	Ben Hoff <hoff.benjamin.k@gmail.com>
Subject: [PATCH v3 2/2] MAINTAINERS: add entry for AVMatrix HWS driver
Date: Mon, 30 Mar 2026 15:56:55 -0400
Message-ID: <20260330195703.304466-3-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330195703.304466-1-hoff.benjamin.k@gmail.com>
References: <20260318001056.465071-1-hoff.benjamin.k@gmail.com>
 <20260330195703.304466-1-hoff.benjamin.k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-57682-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org]
X-Rspamd-Queue-Id: DB89C360AF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ben Hoff <hoff.benjamin.k@gmail.com>

Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c3fe46d7c4bc..2c5511d740f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7471,6 +7471,12 @@ S:	Maintained
 F:	Documentation/admin-guide/media/mgb4.rst
 F:	drivers/media/pci/mgb4/
 
+AVMATRIX HWS DRIVER
+M:	Ben Hoff <hoff.benjamin.k@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	drivers/media/pci/hws/
+
 DIOLAN U2C-12 I2C DRIVER
 M:	Guenter Roeck <linux@roeck-us.net>
 L:	linux-i2c@vger.kernel.org
-- 
2.53.0


