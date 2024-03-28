Return-Path: <linux-media+bounces-8115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8EB8906FE
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 18:14:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 389331C32099
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 17:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2BA5A78E;
	Thu, 28 Mar 2024 17:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FK3ClEZ8"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00693D55B
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 17:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711646053; cv=none; b=Tt+YPuSOHyd/GnTjZNMby8a/XE7zMRBLztsv0isQFJt4LvE66VRfjvh+3qql2qrIi5NAoYoGmUlMkQY7P4zsLexD26g5rKqN3bOg9unNp35xcgDs6wbxVmqmIqj+uQ1RTtHmLV2xhZErcfP5ZbBderCRBB5JVnpuAsbnMMi1EBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711646053; c=relaxed/simple;
	bh=LizP2gPKZdS8tHQBxdqLFN/B0JbS29AjfRvAYmbG8DA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NrldtGVjQhyl89Nb9SdsdYHOGz6t576j8PVcDut5BcmLnxBYosH+VZXMHoUHyssqD/yLLnxUWLNH1sqeRjSkC4iEyWRoYNhMKM8D2hpE5l6C5711iKO/2qgyQaRPeGzI618+m5lClC6oxtDPYnB8Ev1FB/wxYT5KQYDEHquX+Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FK3ClEZ8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711646050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lpc4lzv9nKY0MIoN4tUc0exYrHVaM6gTV4qo/KP0sbw=;
	b=FK3ClEZ87YImaRw+6uU90cW+aDbdH7nStGJSv5ykXYRl5SKCu6Z6F+myrYluRGAqNBzutk
	HM8+BogIdqSkeObbYL5KeRLkqAILkSqe7S8wMlWG2f40tYEMX3nEfynV9ulb502pdFWcnx
	wievm+rrX65Dh9Ey3k+NsJMOu46Y5fc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-18iodPVNPmSRSs7tJkv2eg-1; Thu, 28 Mar 2024 13:14:09 -0400
X-MC-Unique: 18iodPVNPmSRSs7tJkv2eg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-414aa7bd274so5957775e9.1
        for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 10:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711646047; x=1712250847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpc4lzv9nKY0MIoN4tUc0exYrHVaM6gTV4qo/KP0sbw=;
        b=efQLw+Z94eisBs/1E1MpbKg/9nGaLBvfw2Fo7a3gLX8RNRESLfWhzmnlafV1bSIhBy
         7bgMl1TLdms8HT15W4ijX01fA+FIp497YDE2EubbAjnoDjKcn0MNoBtv3cAzcZ2X8VEa
         9UOoOd+SEX1+pFyLeRqsv2jMEfcIksy8KjdWGSdWeo1YD4V979ZU9hPDK6yQXh/IyoGQ
         kHeovWxO6VE5AyCQfwY3GFmLItEHXXmCy22O/XCt0OaKGtE/QOfzKTvOSm4hoAZgOOnW
         S6KvYk3I7++Nd9Zb8YikNEN9Et271f3iVkO/b1pXcHg4jQoBgQVUlv8NhOK/3ID9xJbg
         VTRA==
X-Gm-Message-State: AOJu0YyYTGN/PQ8DOriTNdEtspkt9D68NOeTAfHzNSJ+N/U5qmlwpgrX
	lWovON7ehj/+yBgX8cyrWuTvJ4VMItd26Z2SwRYwH9iAtWfbQUhJia/Ia/n1BbPQItD7r41x7pi
	DgNJBze9cUtL5J7uDLkXOskBPwGHpgr+camMlOOFievfrD5gM1XnYtYpdBe00CCEt4nPXbOEcJQ
	D+LNQnftStyZ4N1ChtZ/GvX+GmRUtLlrFlmxK2BdzPhP2JI2KxNt3J
X-Received: by 2002:a05:600c:190d:b0:414:7ddd:b92e with SMTP id j13-20020a05600c190d00b004147dddb92emr2753152wmq.39.1711646047271;
        Thu, 28 Mar 2024 10:14:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdhJ9ACAOtxJJ8jZdhrOTlJEg104+rSB2g5SadPsNZ+PoQDyfXSOX1ahVanBcKafNVK3Yn7A==
X-Received: by 2002:a05:600c:190d:b0:414:7ddd:b92e with SMTP id j13-20020a05600c190d00b004147dddb92emr2753138wmq.39.1711646046930;
        Thu, 28 Mar 2024 10:14:06 -0700 (PDT)
Received: from toolbox.fritz.box ([2001:9e8:89ba:b800:db5:a00d:ab15:6bde])
        by smtp.gmail.com with ESMTPSA id fc11-20020a05600c524b00b0041408e16e6bsm2881366wmb.25.2024.03.28.10.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 10:14:06 -0700 (PDT)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] edid-decode: print hdmi 3d audio max channels same as SAT
Date: Thu, 28 Mar 2024 18:14:03 +0100
Message-ID: <20240328171406.140333-1-sebastian.wick@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In libdisplay-info we parse the HDMI 3D Audio descriptor into a SAT
structure and use the same function to print it. It almost matches with
edid-decode but the max channels is printed differently.

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 parse-cta-block.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index e26579a..4d2afc6 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2512,8 +2512,8 @@ static void cta_hdmi_audio_block(const unsigned char *x, unsigned length)
 		if (length > 4) {
 			unsigned format = x[0] & 0xf;
 
-			printf("    %s, max channels %u\n", audio_format(format).c_str(),
-			       (x[1] & 0x1f)+1);
+			printf("    %s:\n", audio_format(format).c_str());
+			printf("      Max channels: %u\n", (x[1] & 0x1f)+1);
 			printf("      Supported sample rates (kHz):%s%s%s%s%s%s%s\n",
 			       (x[2] & 0x40) ? " 192" : "",
 			       (x[2] & 0x20) ? " 176.4" : "",
-- 
2.44.0


