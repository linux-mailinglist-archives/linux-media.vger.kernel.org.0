Return-Path: <linux-media+bounces-31656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED87DAA83C9
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 05:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2265F7ACB3E
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 03:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE53154425;
	Sun,  4 May 2025 03:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X9/ng8x1"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E2D17BD3
	for <linux-media@vger.kernel.org>; Sun,  4 May 2025 03:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746329719; cv=none; b=py6qbnmzU0DysiKfF50d8VoB4HEm+o7Za6uEq2zByaXOY4whhEURUYksAipueVPsC53RSk6OFtMMdQ4UsJvoZxVTS9HqJTvX86hqaACGYuKVgYX+4nrRf2zQX221tMLP1tZUbWecstzlE32+cxuES0VyGT6Q1rPtUKfbJj8S2R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746329719; c=relaxed/simple;
	bh=G38Y6ejHHNy25foI2rFjn1QAdikdVwNhEtaER9WcXtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ceKar7iCKPtgTm/5W5eSPYIdsyUXDJWbg13HfK198GQ2nkaQQ9UWAKaDZRf1nwLF7y1+rF/COYt9aauaIeBajRe7uPqsWkP+OesrHl4ta/7a73eMTeBtxR/sqFmINgNr+2fgKMN4Xpuw41sxqUnOwMpYHd9Gdx56RFjCxsCSRXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X9/ng8x1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746329715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0v/OjtH+AYMPDo4HyiUOT8RSQOKjvKJRz99zAdE5I5g=;
	b=X9/ng8x1a9PQetQzlDtNOAbngFfFYnKKgz3DyHJPAfEDkgu0f3MTA3C/glM5kJQtnaxVNk
	Jt3FJ6f4yYIw6Hym0FUj2pAFRS4og5l3NiZO1NDaptMdoBSbKi0IgSabPxjhWueoO/71KP
	9cdlj52j6FOIbLoGhfQzoOJJZHzGVnQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-b-1wA-h5MACO716AsLk-jQ-1; Sat, 03 May 2025 23:35:14 -0400
X-MC-Unique: b-1wA-h5MACO716AsLk-jQ-1
X-Mimecast-MFC-AGG-ID: b-1wA-h5MACO716AsLk-jQ_1746329713
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acb8f9f58ebso247559666b.2
        for <linux-media@vger.kernel.org>; Sat, 03 May 2025 20:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746329713; x=1746934513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0v/OjtH+AYMPDo4HyiUOT8RSQOKjvKJRz99zAdE5I5g=;
        b=aBHNWk71PJwUPaebEGR6x2CyogpyyRJT1o4AwRg4V1mi2XB7mkMK5vpJEIFH9M/dXe
         4k6RIuvdHVG42sWpeE42yVzpMdwJBi02eIO4Wc/PQA7rlJ2xE8b7Hu01i6XTZSVqSUjL
         cDiCQ8RolY0CERQIvWotTVj7lphUNW6Zoyyy8XtTOlyOpqLzCZG+TmsyWXAFo3BQqqhc
         IfaD4cSmCDhZsVUlBqhiMFh9hOEFARld5cq+RvnaICBlpeTlXoL5bog24U/AxHqZDnNx
         WkgSpGSMrCTExcqu0DVQbJZ3OfzQpwmhKHbgp4kBd5a9Ncmj6ICvC0PJPNOdHUusvfMH
         4O2g==
X-Forwarded-Encrypted: i=1; AJvYcCVdVgXIGU02c9gQKvP+TLN3abAsKfR9A0mFJjuSKx3YBt2cScc1rLkfIQyO1SnS+p/j1Jdb+shLDlGihg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwEJSAG5VCMbbg9OZUKsw/GO89jOgtwt8C0jJtLCYCMuXwcNi5
	1KjY3ERQr23zMUmhip0vw7k4ntX7TwChh17xlYEyI/HZfPwPJqx7L6/W2AHnbv7ykUK9MGdAyk2
	jA36N9SX0RncHHYjxLEFya68L+/h9nDa4t6/J+mxsL/6/891njKpdJCZbwNZO
X-Gm-Gg: ASbGncvwveEWimvQs5j8T1cLNBvPso4end1uhnYvZd+x0Vj35/8ByjdTlCQ+nb5olIK
	kxB8B6udo5Q2+FrjBznQeATS5gEXcPpWvznUjt2vRAPrXTM0zkwfRVf7p6f6XcwM+bJ+immxYie
	MqtGdsHGOYAc470Qf3/abql7Y/w726BnR3A1jYuJVbw109Zf7cm9BK4WROie0K9y4ZAoPTIRcqW
	CFfnMVxbYyDh4/BbdLcqmBoetXcS75JHj4yVUJ70PQW+S4s16HahKaYjxQVfIWsSoVjtwn1L4T8
	ZjMyE3s1iSQjtEuMZ8KccKadC9jZA9CiYIh7qxEPa6lvF3x1LxtwY2TPvA==
X-Received: by 2002:a17:907:2d07:b0:ac7:e815:6e12 with SMTP id a640c23a62f3a-ad1a4a09f38mr245224566b.33.1746329713061;
        Sat, 03 May 2025 20:35:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3DPNJBEfULAFRQwM0mCppaXVmV0b1Gm6boTIP80Vx6UREkQTGIelmuYJ6z6ENgBGk1YNm4g==
X-Received: by 2002:a17:907:2d07:b0:ac7:e815:6e12 with SMTP id a640c23a62f3a-ad1a4a09f38mr245223866b.33.1746329712719;
        Sat, 03 May 2025 20:35:12 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540751sm269222266b.166.2025.05.03.20.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 20:35:11 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: David Heidelberg <david@ixit.cz>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in OMNIVISION OV7670 SENSOR DRIVER
Date: Sun,  4 May 2025 05:35:02 +0200
Message-ID: <20250504033502.37809-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 59b24c0047a2 ("media: dt-bindings: media: i2c: align filenames
format with standard") renames the files in
Documentation/devicetree/bindings/media/i2c/, but misses to adjust the file
entry in OMNIVISION OV7670 SENSOR DRIVER.

Adjust the file entry after this renaming.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7b78a98d1f42..78872ebb1aac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18163,7 +18163,7 @@ OMNIVISION OV7670 SENSOR DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
 T:	git git://linuxtv.org/media.git
-F:	Documentation/devicetree/bindings/media/i2c/ov7670.txt
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov7670.txt
 F:	drivers/media/i2c/ov7670.c
 
 OMNIVISION OV772x SENSOR DRIVER
-- 
2.49.0


