Return-Path: <linux-media+bounces-12149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D48078D33F0
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 12:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74E2A1F24296
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 10:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94211179957;
	Wed, 29 May 2024 10:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C2PrDGu8"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F9716ABEB
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 10:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716976990; cv=none; b=ehe3C6Ij0SXZiVL88QTmdCp53OdEELc515LMQk/qkbsKSE7IGfxPghMtSIAgOAv5AHrjYMe268b60aU008K1ejRgTXhr0/s2Ktz807c/DccqqnNZDzliI/fbw1yuGukJzxuUxvVX5tfA6do7Eahk+SudzoHkfi/zuH0ScFg4g7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716976990; c=relaxed/simple;
	bh=uQM8TrRnoW4SCPeJEP/zhX4aNiTl8yZtQQAFqgd+8vc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JSsDGNVU8CmTsuazmuEe8kzvVt8OeBwYRZvbvNwmqBKa2l/T3IQDLP6/CFSbmesaEAfaY1W58OjNKXM4JQCI3fV4qN9c6xwD6ycOUgJGg4gC3a3v0iSbtWxfqHhgLSZksUWEIcmVufP56bTzI750omSBQ5GectchJrjCK9pOAn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C2PrDGu8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716976987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KmyFhEv7WHXB4gNfnjh8aHOAhz66Z1kOLbEuDJueO1A=;
	b=C2PrDGu8KrrKhooLpY9vGtsaVWjzDeRNN29B8KLUboXehioo1Ogil5Np0ru40IsHLtYXEk
	BBy1MvZDTRWRt3aQXRxoPiAA0lZfCEQ7IzIATxr4xAhx2s7jpMMG03AnZCA7Q3lS8E+yaJ
	T1IsN1UTRbBTp4hiGBbgSvTIN0+U8S0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-ut9HYGmZMR-w4ZIpXKdvjw-1; Wed, 29 May 2024 06:03:05 -0400
X-MC-Unique: ut9HYGmZMR-w4ZIpXKdvjw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-57865139b7dso1058944a12.1
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 03:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716976984; x=1717581784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KmyFhEv7WHXB4gNfnjh8aHOAhz66Z1kOLbEuDJueO1A=;
        b=inNFbfXeOYsTvzq6QCx6ORtKH8gCXLWvnyBRiTXK5gb6c7a5FjXRgn2HNbaZPhrZuO
         ESWjdrFRMLz3vo3rdFEYln22f08oW8TVAov2cHihXGj0puUpRfe+46OJZct2nfmCSiSd
         malyyRTCzJLC571TKAxEbpd2b9aRbt+LBWL2gRlpVLZXlgp1/y3lIiwROC0+o3nKscDb
         gVbZMBw41otbR4rsSNVW5dFUEv9Dm7bUtmqcjC2lc/75WDCgS0yd8C0sf16r0hXGZgj/
         jK9oarmAYCEEfTrfZNy7+L177MJIO3fV4e/IIdgc4t065lxZ5lv7zKoVUPiWPt5FrjV9
         Neag==
X-Gm-Message-State: AOJu0Yx8UG2CzT1TPb2F2fd/z3DQXZPxU059f9xPdJNNaEE1W9GwhMqZ
	Lhby4BN5QlD91DpxpyBWnGVOtkxr8vn3BHLyItALCvt0pOeSycCjdCemItKBJ1EVSooLBWjNsWW
	2ou47ovcuS0dlveq1PdevHrlx4WvlIaPEg4I3PU89kkgTH2R5ZxAxYzWe6rqavSzBUc1flx7n7K
	yCYyvB6y5DoT8Oya5SkBuZDvrmHRY018EsiCtpDuHj16SnVc3RGZUinFk=
X-Received: by 2002:a50:aad8:0:b0:579:fb7e:2112 with SMTP id 4fb4d7f45d1cf-57a03f866fdmr1530333a12.11.1716976983818;
        Wed, 29 May 2024 03:03:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpFi4a1H1qq+zi7aCRbW8YrcqsMUJR4FWUpLePFNUuFfNXihW7wnRAI6zDzavoPuIG5m3bxg==
X-Received: by 2002:a50:aad8:0:b0:579:fb7e:2112 with SMTP id 4fb4d7f45d1cf-57a03f866fdmr1530298a12.11.1716976983211;
        Wed, 29 May 2024 03:03:03 -0700 (PDT)
Received: from toolbox.fritz.box ([2001:9e8:899d:ec00:43fd:d227:4d66:eb29])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5798d861b05sm5646956a12.25.2024.05.29.03.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 03:03:02 -0700 (PDT)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] edid-decode: Cannot support NonMixed MS without MS
Date: Wed, 29 May 2024 12:02:58 +0200
Message-ID: <20240529100301.127652-1-sebastian.wick@redhat.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When `Max Stream Count` is zero, the sink does not support multistream
and thus cannot support NonMixed MS.

An EDID with Max Stream Count = 0 and Non Mixed MS = 1 can be found in
linuxhw/EDID ./Digital/TCL/TCL5655/1723FF2DC6D1 at commit cff7fe4d44.

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 parse-cta-block.cpp | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git ./parse-cta-block.cpp ../parse-cta-block.cpp
index 4d2afc6..7cd7a3a 100644
--- ./parse-cta-block.cpp
+++ ../parse-cta-block.cpp
@@ -2498,10 +2498,11 @@ static void cta_hdmi_audio_block(const unsigned char *x, unsigned length)
 		fail("Empty Data Block with length %u.\n", length);
 		return;
 	}
-	if (x[0] & 3)
+	if (x[0] & 3) {
 		printf("    Max Stream Count: %u\n", (x[0] & 3) + 1);
-	if (x[0] & 4)
-		printf("    Supports MS NonMixed\n");
+	    if (x[0] & 4)
+		    printf("    Supports MS NonMixed\n");
+	}
 
 	num_descs = x[1] & 7;
 	if (num_descs == 0)
-- 
2.45.0


