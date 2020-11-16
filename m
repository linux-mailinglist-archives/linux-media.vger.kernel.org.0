Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB522B3C20
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 05:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbgKPEbC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Nov 2020 23:31:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbgKPEbC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Nov 2020 23:31:02 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3A65C0613CF;
        Sun, 15 Nov 2020 20:31:01 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id w24so22405383wmi.0;
        Sun, 15 Nov 2020 20:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=1ykM2PQF8UjrQNrIxTj9JuB0X1XIeh6YbXFFU1ntkCM=;
        b=Uwebiu4HIVuABcHK8lNqFk0NZxgyA8PCsBSykCBhRoz6Sd9lzj/QOTTFvWpIUZrVZx
         QUceQi9d7XcR4i19LHPrx4fblUKtMmwshf1qn10aMaxtvcK6kBkHNCxfzocXZpUz9Dcy
         IWJ+iywdzys16kK91aM4ZpnMMiE9AKVFpLI+4QB6Cax/MVTnBYn+vb5UWyu4DVS6Rh/L
         cRpU1hmnB3pUSE8RzfHK1DxQhszbJt9nLsROaDrZnHwg0TSojiOebIOvgDrdhQjgU5/m
         8J4pG92sRVO7NC82GjsIeoBmyaj6MdsxAOIfTn3bpIaE67W2iO8KHgA14OpXrcBx1iSt
         gjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1ykM2PQF8UjrQNrIxTj9JuB0X1XIeh6YbXFFU1ntkCM=;
        b=X1Kd8aUxaK9Xkd7TPRA/czPrGDHspLmpprP2ZNjfuFKQ6xj+HFhIDEvv1OeFd0l2I1
         8wFkDeqOaF4UT5PUVaud+zQthLqgROeAtE4gMLxysNE0LAbxeMLOXnhYHD92pRUW0NPx
         Cnu/DdVznWd9OBwxe0MurFgNcx2njueZRZKzQzAIMoRjBh0FhcN5DHM2BOk53qk6DFM2
         lVga4jvU369/m95sLr14ImI3yXSDsM+TI4jZMi9Bp1n3nm5ZgU4/P39DzqSPJ21juxdF
         a1ayTapdqRr+X7ydR3YWGFYkCfiKQ9A1iNjj+fn5Av1iWjdb1Fw/GWKT7wa1TmaQs5ZE
         +dCQ==
X-Gm-Message-State: AOAM532uY/1IIU9qXVNUCVV+BfCDao9+lpNBUIWZ5y2Ni+cvrVlw6EDi
        pvvanolCov2zd67CEJZIUK5Id4TLyNg=
X-Google-Smtp-Source: ABdhPJx8GlPd1wNv46eUCTw1UhIOajMx1D+l6Y9uVJsmoqiC4qc5rEMeGJXgpeioam+KFMondDJWFQ==
X-Received: by 2002:a1c:6704:: with SMTP id b4mr12684331wmc.96.1605501060484;
        Sun, 15 Nov 2020 20:31:00 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id f19sm17609525wml.21.2020.11.15.20.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 20:30:59 -0800 (PST)
From:   Christian Hewitt <christianshewitt@gmail.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] media: meson: vdec: add G12/SM1 to module description
Date:   Mon, 16 Nov 2020 04:30:55 +0000
Message-Id: <20201116043055.23655-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The meson vdec driver also supports Amlogic G12/SM1 hardware.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 5ccb3846c879..5d4db7a5b4b5 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1131,6 +1131,6 @@ static struct platform_driver meson_vdec_driver = {
 };
 module_platform_driver(meson_vdec_driver);
 
-MODULE_DESCRIPTION("Meson video decoder driver for GXBB/GXL/GXM");
+MODULE_DESCRIPTION("Meson video decoder driver for GXBB/GXL/GXM/G12/SM1");
 MODULE_AUTHOR("Maxime Jourdan <mjourdan@baylibre.com>");
 MODULE_LICENSE("GPL");
-- 
2.17.1

