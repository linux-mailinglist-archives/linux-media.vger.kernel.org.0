Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2818F18A127
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 18:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbgCRRGz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 13:06:55 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:47036 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgCRRGy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 13:06:54 -0400
Received: by mail-wr1-f68.google.com with SMTP id w16so14972748wrv.13;
        Wed, 18 Mar 2020 10:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dzFJiKd50+r7JmSCvXFkX7Q5ndGmo0yxcfITWT8k4UU=;
        b=hBXiS9NY0oY2qPkAhvl50YQTCoXtoj3/8zrutzdEPom7kEPOguLiTOXJJO9vQL/OAF
         dUH7Oc02I09oFiOtrfHoq756ga41Ef2xsIAJvudJGpFqifbiMMSCAFH9IazDkQuhRlLA
         aOEh8ZDvinijqtGb0BHFXcAIhwd56mzyARd+wk1UfcgUodhh8fl+sNbBCRT6EYIUTzF6
         Co2UKaogJgOSni8hL6eGuhdj7GSU9OcFEDDHn8Zq0LKMZMgnt3WpZqRdswW9Bdx6jJHg
         rGbXHNi7HG3ipGSmhxKR2yksSL54Az9d07+lV6BrdmBw7UtYDCaHgB7Y4iANsG8BazUc
         NGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dzFJiKd50+r7JmSCvXFkX7Q5ndGmo0yxcfITWT8k4UU=;
        b=MNuLIgSEsTvYVpaeHU9cNOZf8GmrTiiYLmhWR+uFsxf+6F5da9AeTdCneAJI8uctet
         CSeKVgZzwUux1hPk9t88Z9e4Z9Ck2fDvSQeVrNkTZKmkj2Tn3MPOXa9mYCNg7sRghNFW
         9UMS4kxxSxo8ZR4ITfy7xZPs8gXTsARbZA9eRA0khFBvI503vp6QjflNPaibO4opTu17
         eYSdT0FnECJHvueyDZ+dNrwMZ4Wkqwanr0H61qq5av0DSAvkMyDmrz6zWGc9+wlF42F6
         CPIY7EVYXoz0L1BHzh8ycoOyz7MOJG1727PhVVZh/yHHrGEsBj/7XHX6DTfG3Uw/vxEx
         bYzA==
X-Gm-Message-State: ANhLgQ2TKRhNBAlYsN8I/WpmpIw0DJEQqDkXdO5B1lpLl9yRkVVt06Dp
        M7UTs5/nwYudW1uiqbpp08E=
X-Google-Smtp-Source: ADFU+vu1BVAFQDoGbXbxQoYORYxzmLSmHAwkyNsRY00vGVDzoZh+U3zhY5IRv5YwhescANtKfyF1Kw==
X-Received: by 2002:adf:fdc6:: with SMTP id i6mr6560649wrs.414.1584551211485;
        Wed, 18 Mar 2020 10:06:51 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2510:d000:caa:1f1f:ffe5:ef76])
        by smtp.gmail.com with ESMTPSA id k5sm4661283wmj.18.2020.03.18.10.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 10:06:49 -0700 (PDT)
From:   Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 2/2] media: rcar-vin: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format
Date:   Wed, 18 Mar 2020 17:06:38 +0000
Message-Id: <20200318170638.18562-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200318170638.18562-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200318170638.18562-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds support for MEDIA_BUS_FMT_SRGGB8_1X8 format for CSI2
input.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index faa9fb23a2e9..3d1945d7996c 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -320,6 +320,7 @@ static const struct rcar_csi2_format rcar_csi2_formats[] = {
 	{ .code = MEDIA_BUS_FMT_YUYV8_1X16,	.datatype = 0x1e, .bpp = 16 },
 	{ .code = MEDIA_BUS_FMT_UYVY8_2X8,	.datatype = 0x1e, .bpp = 16 },
 	{ .code = MEDIA_BUS_FMT_YUYV10_2X10,	.datatype = 0x1e, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8,     .datatype = 0x2a, .bpp = 8 },
 };
 
 static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
-- 
2.20.1

