Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 597C2693197
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 15:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbjBKOmF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 09:42:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbjBKOmC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 09:42:02 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 676FD2D14F
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 06:42:01 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id r2so7923654wrv.7
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 06:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=em11TH6tXpCp0BGHc8xOy3fFHB+Z1zlo2jzAWB92LFk=;
        b=z7REsh3QtJvacSHuyrczIDyjP0xNSTYYwf0nTu7uHL9PsjfTDYFaz0aPXsBGaGcP+n
         VFCrF17pTgzuqYMtpqBRY2brkX1bzj4aG/Ys1YOib1z+hY+mwjziXnADVkHT5IwbneyJ
         fLyWiiatpvn9f31iFo27vVCLWM7wagH4owAFbhM3/rSPlCAFTugapxDN6xG89OM7fwKp
         vkiXTBPjh4imTV4VYHqN86zjOdLXcjcFY8Xa60JD4LTZqs/0HySs6y1kyI/K3XvqFSw3
         esNQdip95LW5V+S4WWNl2B+HpBN1WC58ts/24LH7QMYo7oRJBC2VrBx02rN8+CPUSIRl
         Udnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=em11TH6tXpCp0BGHc8xOy3fFHB+Z1zlo2jzAWB92LFk=;
        b=odEQGuIwMkUMhKRNG6MiIza5+MoK5sTj0bFeHhyRBdqxT/4lbsbVJ5BOJ4358qBuHu
         H6pQCPnY7mqocgzi3nlmrs6WenkP6EiHXzMH/hFy4G/cOmy8FzmOXhDx9kxkNpJXrTvZ
         5dgCoHSvHBQ8v5Rqg2k8PZofbvf84UjCnedzGYIsvBNVFlnAOnfmUIN7A/LQzEwPM0fu
         lsuJWIQMLj+nh+aZD1LjypTdFu9ShaBH9WsiGmA7NALDQ+mycpXEsAKtW2kk93L2jaRl
         KHvedtEx3jnDtiSIWstf404xR1rkt4fUNxHDuB5FlIlWgIWLOg3HuHaCO1SZNxCoIZSm
         Ay8g==
X-Gm-Message-State: AO0yUKV+/pa8jIVWiwfjm2LnyuvVPXfPvhmqZlgglEoSvnaifKBqpB/P
        fYCl6t5vasoj9XMNIbVHcFhEYg==
X-Google-Smtp-Source: AK7set/MFSU0qQmNB0oo7vA8rboqtvuSKRFQ5suQtyBeTKDPUbAans0l5I4UiKocpZzfEGj7EOGeuQ==
X-Received: by 2002:adf:fcd2:0:b0:2c5:48cd:2f04 with SMTP id f18-20020adffcd2000000b002c548cd2f04mr4527971wrs.6.1676126519885;
        Sat, 11 Feb 2023 06:41:59 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id i8-20020a5d4388000000b002c5493a17efsm4202510wrq.25.2023.02.11.06.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 06:41:59 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] media: dt-bindings: media: renesas,vin: Add binding for V4H
Date:   Sat, 11 Feb 2023 15:41:47 +0100
Message-Id: <20230211144147.3812388-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211144147.3812388-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230211144147.3812388-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document support for the VIN module in the Renesas V4H (r8a779g0) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index c0442e79cbb4..dbd6745ab7d2 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -53,6 +53,7 @@ properties:
               - renesas,vin-r8a77990 # R-Car E3
               - renesas,vin-r8a77995 # R-Car D3
               - renesas,vin-r8a779a0 # R-Car V3U
+              - renesas,vin-r8a779g0 # R-Car V4U
 
   reg:
     maxItems: 1
-- 
2.39.1

