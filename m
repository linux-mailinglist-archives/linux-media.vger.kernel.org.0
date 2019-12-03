Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9A891100EA
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2019 16:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbfLCPMO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 10:12:14 -0500
Received: from mail-lf1-f54.google.com ([209.85.167.54]:36767 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726319AbfLCPMO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Dec 2019 10:12:14 -0500
Received: by mail-lf1-f54.google.com with SMTP id f16so3287319lfm.3
        for <linux-media@vger.kernel.org>; Tue, 03 Dec 2019 07:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rV/L1vsLVQFxpCjXm88i46dKl0c4TvqiL9DsGNMtloM=;
        b=g2a64BKjv0E9pz4IB6v4VoyS1s4Su/CqbYHrFLAfz5oPvTFJa2zq+i2qZ1tIlRosnW
         s3jOZ88IyB5aPW6YZsAEL9DC4RLEH1F0sFdzIYEks/hmtEDke4Eq8qmwNmBg3qYgp50u
         ncOsjbykeADInZ6HGwi0JK+MqFgX0sf/EqJUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rV/L1vsLVQFxpCjXm88i46dKl0c4TvqiL9DsGNMtloM=;
        b=LN10S/WUbD3Sgm35W32er0OR8MfcAIDGAzqBvdEqHpG2jSkErwPKt1S3BnFm6wcarR
         XE/vD80TAfqAInXTxxoTCinfC5+vKhRLVlvUNEtCJrQNKJgp5UlC8dKT9xr5gkne9Byc
         Id26HxzK/MkMXqAlWwYA5eIensQhcypRsI2m9MKnRlnXlfpkKJqhuADoXL6k6lWhOkcU
         VBvc8hVgNKrurScQDrgx1KY5gkgnS9PhE3+WcOG/R+TsKmQMU2bX3KPQL5dGqq6AvfPm
         DGcB9aGVcjcEf7b6Fnw2tplHrMl7RhxKiGP0Kn09UVzsnE8EXdC78lMi6YHny5AhKlz6
         pIxw==
X-Gm-Message-State: APjAAAUHHBvzOKqleWIzgO7XqKhTsTSqXgSyJyaKQARP2KVnt1KR8u1r
        MFXtu+RhL7XdzGrV6sLWXSHUwGGDVyA=
X-Google-Smtp-Source: APXvYqz89um+ISOlOlGXStsbb5tyQs1jR9o1vkozrfloHO+C1GcWjAQEhjACJPu9zzW2ZN3Mzk3CyQ==
X-Received: by 2002:a19:4906:: with SMTP id w6mr3021490lfa.168.1575385932028;
        Tue, 03 Dec 2019 07:12:12 -0800 (PST)
Received: from turia.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id q186sm1544537ljq.30.2019.12.03.07.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 07:12:11 -0800 (PST)
From:   Daniel Gomez <daniel@qtec.com>
Cc:     daniel@qtec.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l2: Fix fourcc names for BAYER12P
Date:   Tue,  3 Dec 2019 16:12:00 +0100
Message-Id: <20191203151202.18081-1-daniel@qtec.com>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix documentation fourcc names for the 12-bit packed Bayer formats.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 Documentation/media/uapi/v4l/pixfmt-srggb12p.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb12p.rst b/Documentation/media/uapi/v4l/pixfmt-srggb12p.rst
index 960851275f23..7060a4ffad08 100644
--- a/Documentation/media/uapi/v4l/pixfmt-srggb12p.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-srggb12p.rst
@@ -13,7 +13,7 @@
 .. _v4l2-pix-fmt-sgrbg12p:
 
 *******************************************************************************************************************************
-V4L2_PIX_FMT_SRGGB12P ('pRAA'), V4L2_PIX_FMT_SGRBG12P ('pgAA'), V4L2_PIX_FMT_SGBRG12P ('pGAA'), V4L2_PIX_FMT_SBGGR12P ('pBAA'),
+V4L2_PIX_FMT_SRGGB12P ('pBCC'), V4L2_PIX_FMT_SGRBG12P ('pgCC'), V4L2_PIX_FMT_SGBRG12P ('pGCC'), V4L2_PIX_FMT_SBGGR12P ('pBCC'),
 *******************************************************************************************************************************
 
 
-- 
2.24.0.rc1

