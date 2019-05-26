Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF412AC79
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 00:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbfEZWZt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 18:25:49 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34270 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbfEZWZs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 18:25:48 -0400
Received: by mail-wm1-f66.google.com with SMTP id e19so5829643wme.1;
        Sun, 26 May 2019 15:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tSjq6cIX1DBnOadzNlGlYQSWPqtvc5vqU2shjVT0VqA=;
        b=DyTp61SP0Ajg+qJr5HMvRFP8uWUstjPCGfpVpH1DtwYvX6E8jkV3KDuQ7XAKg0rHPJ
         kwFIoJheoQUBARMO10TNkMWn53v7M7fEhyxHghmvvaFptYKopQQkHvf5nsEsVHpK1JJA
         8Zp/vwbQdBxS5KiY14QdI5A5noMG1ipZLgb97xgv+RdmHuenldFZhp1EL639uWmc9zd6
         Ea58bLdfhEfG+KgE5EXgFphIwd/8hz4SBhzo1q0AUMzAZw4p7JtwLvaA/iUO+El/jUb4
         RA23qWDcUOTs1/LVYXkSlFjfyF6WjGd5G25vzWCYpl4o/U2yyymxSbN/qf/SnHVNulmc
         CoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tSjq6cIX1DBnOadzNlGlYQSWPqtvc5vqU2shjVT0VqA=;
        b=B7hdlOmV/Eq1rGpeUmg8h61xaG+GTa8URJ1nDGpDKtGHGUkagqLP952IFbAW5Hbg8H
         PGMkPtULX6cD9fYbaBcyeJwepVqQbm1xFUmILU75v9ygDnZpo401BrdOe+7EmgkCruIL
         teajMPwAAXhDJrvkUK8NB2kHJxgn7GkqL9OAO5rv0EfR5clKs9YoyLZPURnMNPZU4WMp
         1WC0HH09bFQ/EzaPIZP7DbJqI3JTH4OMDmqiLFYrew+KhFhtysjO5FkvTOzQIvSfh9nF
         4gtUw/fGW6kjM82r/d+RmlYzFlVTR5bfxCYsl3ILjoX9tJas2DIlYK++oEFF0daOEZ5J
         vltw==
X-Gm-Message-State: APjAAAWMD/NKflg5OLN90r3BIsR9BISEnPMdmGiIEa0V3WYRLGR7Ljpg
        TYDLPsct1wS8oqVXyKbN+F8=
X-Google-Smtp-Source: APXvYqyD4ft6i0D2tWp18wsIxIDnCCerDip6b9YYpNjRi+NTD88o8jCyOH5HkT8sp25ZVDrosHjoPA==
X-Received: by 2002:a1c:1947:: with SMTP id 68mr7674843wmz.171.1558909545865;
        Sun, 26 May 2019 15:25:45 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id o20sm10368398wro.2.2019.05.26.15.25.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 May 2019 15:25:45 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2 02/10] media: rc: sunxi: Add A31 compatible
Date:   Mon, 27 May 2019 00:25:28 +0200
Message-Id: <20190526222536.10917-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190526222536.10917-1-peron.clem@gmail.com>
References: <20190526222536.10917-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwiner A31 has a different memory mapping so add the compatible
we will need it later.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 drivers/media/rc/sunxi-cir.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 307e44714ea0..29ac33b68596 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -319,6 +319,7 @@ static int sunxi_ir_remove(struct platform_device *pdev)
 static const struct of_device_id sunxi_ir_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-ir", },
 	{ .compatible = "allwinner,sun5i-a13-ir", },
+	{ .compatible = "allwinner,sun6i-a31-ir", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, sunxi_ir_match);
-- 
2.20.1

