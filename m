Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBBC55A49F
	for <lists+linux-media@lfdr.de>; Sat, 25 Jun 2022 01:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbiFXXDd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jun 2022 19:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbiFXXDc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jun 2022 19:03:32 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CADB52E5D
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 16:03:31 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id fd6so5404944edb.5
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 16:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pGYlZSXrL+oaB0Q/zXs3LZ4NFxxmWuNHZP0D34FWGxY=;
        b=CPJGBltRQMTNQ0gqN29pV2a5f+a8qkKK5suEXswUmGRVbkS07Ncv2z2e1clEqmF7fN
         K4FhzM+mpjyRZ+OOFcPCcdcVho5zjb9RhKavj2lOuHtOQ2QfGQi2eB1rvB6dycwJGK6q
         cIzS/eOHsirikEIc+8JmANSMg/fnrwf+7OMi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pGYlZSXrL+oaB0Q/zXs3LZ4NFxxmWuNHZP0D34FWGxY=;
        b=KL/qslAbkOVU+4x2Tl3FvyPPgl+UKnaiigN9drXBJiHFuArlttSvc42tzUSWsaGfH2
         qJV7edHKD+OLYzAg3N1jB3YO9iNckHoKTZggFPqsJf8PJBgIm6XDoFYMorZ2BvqXLxhR
         uTtYRigSPlKc98Ovh7oHaGPwFRoN9dRKcQSwAfAf/VD+26tvVKPxFGRnZg2DNaarzzsb
         7Q+7CtZ0H3LOQZn1cNRZTIguggQhKuFLp7832LMCJUW070ooxNgTNNbukqu22iK7SUc3
         NJFCfoO2IkUYAVVSLt33c3GMZwQPJgqH7jw92XvK5ttJ/1aTuw6LPAQRgJwm/i3FroAN
         L3Dg==
X-Gm-Message-State: AJIora8DaYVTqnqdDLdtJlWpFwcZHDK2749EBkfBxlxsnSngoXEKnqmu
        UpK6Ry+T8qJYKtBG/uPJxpcMBw==
X-Google-Smtp-Source: AGRyM1u6hdDfTgUzidUtOS7Pa1meRutKonF/+CpYb+2IG1xaeYJn3J0ptqYgolsj3R1f1S7qejJK0Q==
X-Received: by 2002:a05:6402:1f14:b0:435:97f3:640 with SMTP id b20-20020a0564021f1400b0043597f30640mr1718726edb.169.1656111809799;
        Fri, 24 Jun 2022 16:03:29 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id w1-20020aa7da41000000b004356a647d08sm2880291eds.94.2022.06.24.16.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 16:03:29 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] media: ov5693: add dvdd into ov5693_supply_names array
Date:   Sat, 25 Jun 2022 01:03:02 +0200
Message-Id: <20220624230307.3066530-3-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624230307.3066530-1-tommaso.merciai@amarulasolutions.com>
References: <20220624230307.3066530-1-tommaso.merciai@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add missing "dvdd" (Digital circuit power) entry into ov5693_supply_names
array

Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
---
 drivers/media/i2c/ov5693.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index f410333c4c67..9e84468d920e 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -132,6 +132,7 @@
 static const char * const ov5693_supply_names[] = {
 	"avdd",		/* Analog power */
 	"dovdd",	/* Digital I/O power */
+	"dvdd",		/* Digital circuit power */
 };
 
 #define OV5693_NUM_SUPPLIES	ARRAY_SIZE(ov5693_supply_names)
-- 
2.25.1

