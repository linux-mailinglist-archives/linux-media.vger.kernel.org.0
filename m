Return-Path: <linux-media+bounces-11042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 291BD8BE627
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 16:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3E4728E570
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 14:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD2915FA80;
	Tue,  7 May 2024 14:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DM1tNcBD"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3737B15FA97
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 14:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715092610; cv=none; b=JdiZRu7zX//QPBCyW34GOCVvL6uBn2Q2FtfX0sTtRTzR+v/qqTwd0d/27ilHdWQdmCsVy7MwKvwEO8t1aLiVc4MU04QKX7Dvn5l5dz8bkIoFRAZuGQKiSzMKn/tdkdVxVKqMaQa9w2QnX9bZ7UOhbansUTH3CMC6bqlsjRsMm78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715092610; c=relaxed/simple;
	bh=1nLbM1ptcwD7xsCexw9/9id1x6y7D7jbqpEOYd4k+OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yj5EJVlXCp3NB1dlIqF16qD2pVrRAkJbBP5a8gD9jTZ19ijexAjQSOHohQQO/njOj7Kk6NBhKMh5tvvjLet2TMqvt/LeYxemSwmDaD3BoNopjUiLCK78sCvYFKobIKAje//RUf1O21brLwAIPYXdvqxG7S5PgJSiOiSVCa5Svmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DM1tNcBD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715092608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q7HVnwjvSt8iPkONjlCrJffpYCEpxZC33LnAmwF0ZIs=;
	b=DM1tNcBDezClZ7dJWwhTIvRzuZNeUF0t2b7lvsiMlrLy6t92mylml5FzxwVqRL7pHlTxZo
	U7qsw/EzkMdWB/FyhYUt31VDlryGHJi3QmeH9E/Byi/d4npAtHRGMs/Z+a8qzAS5K+zLUc
	lGiQhVEc2zhiXAleLgqquMZb+VHunuY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-SY8DYiezNBedtZdtkt3-EA-1; Tue, 07 May 2024 10:36:43 -0400
X-MC-Unique: SY8DYiezNBedtZdtkt3-EA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-572cd3a3687so934730a12.1
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 07:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715092602; x=1715697402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7HVnwjvSt8iPkONjlCrJffpYCEpxZC33LnAmwF0ZIs=;
        b=udsSf17GJsew9oUR4ofGRnCa6QPfSNbeNBJASi1UZSf5uurVp0X5n3rudV4fUKOBpc
         PjL5EEbLMYU15Dmb/qikF+tQyI5F2SUHWF5hptnJLs4QFyjuxq76aDfl8HWfeULHUNuI
         ro9Xt4KiA8QwlFczNimh+NslGc4pP2YyJZIx79bwz71+MNPQz5uC2tQUvVByfD5M65pt
         7N6718hWDzlicALAXbxsK5wxN3IqVBjEHY2yzIc6OBC5Es7Bvfs+h7KucDjBDAYJUK6x
         q7hnDFerKd5jcXC2nSWW9li2Kx9bNStSSH/ic2DX3NPePq2NVhqCMzC+roHq/ymBe7D1
         KuaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaDfJ/YBdsR/FbyzhwYP4g/AZiX5lt4dwQPP+pZCfWikA/AUWH/MAk4hB9QdnhRawIAhDzFu+1/6s5VGX3WdjnHOvAfHwF/gqfXNQ=
X-Gm-Message-State: AOJu0Yw/MxkyQkRmloocCDJbW+3bVKiplNSwru0x7q4jW4AU2gtKnRbA
	sa+kf/6I3VaXXcFSNTWeDpASHkktC5WnGbVTXjJfOxmW3aYGWVJJ+fbHH9pER2UmvaF8uYc7vps
	ul5wmFhyYoeu8ctOanEAPIk6xFn21qqoIUta64ghm7Z1puTZWzp/sqFwOh0Qb
X-Received: by 2002:a50:cd5d:0:b0:56c:1696:58a8 with SMTP id d29-20020a50cd5d000000b0056c169658a8mr12098642edj.0.1715092602093;
        Tue, 07 May 2024 07:36:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY7d0zX5iF23LmZa2kdYMHYLArbIB3lGdBmgCb7Vbc8ZFRfJsz9dwxj/ZSVy7TQT4rRhoceQ==
X-Received: by 2002:a50:cd5d:0:b0:56c:1696:58a8 with SMTP id d29-20020a50cd5d000000b0056c169658a8mr12098622edj.0.1715092601795;
        Tue, 07 May 2024 07:36:41 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id u1-20020aa7d541000000b00572eebbfc61sm3485364edr.35.2024.05.07.07.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 07:36:41 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: repair file entry in BROADCOM BCM2835 CAMERA DRIVERS
Date: Tue,  7 May 2024 16:36:37 +0200
Message-ID: <20240507143637.179101-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2
camera interface") adds the new file entry drivers/media/platform/bcm2835/.
The commit however adds the driver in drivers/media/platform/broadcom/.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Repair this file entry in the BROADCOM BCM2835 CAMERA DRIVERS section.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fe4506f9fe8..fe6d37745106 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4176,7 +4176,7 @@ M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
-F:	drivers/media/platform/bcm2835/
+F:	drivers/media/platform/broadcom/
 
 BROADCOM BCM47XX MIPS ARCHITECTURE
 M:	Hauke Mehrtens <hauke@hauke-m.de>
-- 
2.44.0


