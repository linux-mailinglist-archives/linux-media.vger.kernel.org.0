Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 873E527DD9C
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 03:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729175AbgI3BNa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 21:13:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728931AbgI3BNa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 21:13:30 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213E1C061755;
        Tue, 29 Sep 2020 18:13:30 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id w7so6668931pfi.4;
        Tue, 29 Sep 2020 18:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mb1e3aMT2LgSqsfeUGUg7tbMEDRyoXHpodtp76eO3uQ=;
        b=j7OltEzV18zPefNDxTypqamPpSStsTxCbzoVQUuP4/8S8G5E7Bq985aDEGg8aj+wGW
         j4Bvxmi9xDRso1t2LHJVutS4jLa5oG2hfWrdq6uBGWg5qAs1Et96Z9L1Drm5vUNcWHA7
         YPBModCFhELrwzlstiPZTSVrSCAdK8xK/EXaRTY04ZV7ksko6ANV7wMPei89Rtzju7aX
         pN53Ax2724g8mgM/bXytUK6lTauml2I1EvcCkOsqFQYOvZrySEjDlqAiZg03HbqKpePQ
         nIwR9s0MlaboGOiBOXy/pWglSX+VNVg1yu4xGfcg61BTb6Nj3KcCBZEGDxPg/en/JZZD
         A9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mb1e3aMT2LgSqsfeUGUg7tbMEDRyoXHpodtp76eO3uQ=;
        b=ll06dJgQGoLHbm7L3VbmcOwUNlUXZbOyXgAkbKPDkYO4IhExQwSQRnEoGu7eWwSdUU
         33rDUHpewG41InaSt3+kfhw/9sP1dARE+qDtSHQat4dmiDa9wRxl8j4nt5EyTGY9TlYk
         2r9qK2rUtZ/jtPHXJ29KFfjQa2fNyNdGwUQLOL/9QpupZ8D0juLseqj6IDIBAsPXFYJD
         izvHWg7LZbB64Iq62epWUN5LoXhFs5l7CWZnP5kivOEABvl7GlxCHXkC6uDalg/D1hUE
         PjVNFCoG//86VUgcdzFqkq+5ISYGjyQ6ZixssDf3xDOg4hyC+elte57940+tqYqD3my2
         XAyQ==
X-Gm-Message-State: AOAM532S8h/X/DRJp3rZUcbNCTlfpXWsJsFMK6iA3NpPeT+m6mpGmUYB
        0Mt9pLwlC73vPBKxOoI+Res=
X-Google-Smtp-Source: ABdhPJwrZ44D5LpTbMaB8o14t98qhK67vSbBcB4pthQGPLCMke7e9EdEnemDNVaA/cq/AwNiq3A+Vg==
X-Received: by 2002:a17:902:e9d3:b029:d1:f370:1e90 with SMTP id 19-20020a170902e9d3b02900d1f3701e90mr407905plk.76.1601428409604;
        Tue, 29 Sep 2020 18:13:29 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id x62sm6912825pfx.20.2020.09.29.18.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 18:13:28 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [PATCH] media: ov2740: select regmap
Date:   Wed, 30 Sep 2020 10:13:22 +0900
Message-Id: <20200930011322.97179-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix OV2740 build breakage by selecting REGMAP_I2C config:

ov2740.c:1011:23: error: variable has incomplete type 'struct regmap_config'
        struct regmap_config regmap_config = { };
                             ^
ov2740.c:1011:9: note: forward declaration of 'struct regmap_config'
        struct regmap_config regmap_config = { };
               ^
ov2740.c:1028:11: error: implicit declaration of function 'devm_regmap_init_i2c'
        regmap = devm_regmap_init_i2c(client, &regmap_config);

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
---
 drivers/media/i2c/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 878f66ef2719..c64326ca331c 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -877,6 +877,7 @@ config VIDEO_OV2740
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
+	select REGMAP_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV2740 camera.
-- 
2.28.0

