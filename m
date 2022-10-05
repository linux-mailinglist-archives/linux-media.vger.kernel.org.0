Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F20945F575B
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 17:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbiJEPVO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 11:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbiJEPVL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 11:21:11 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D3F94331B
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 08:21:08 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id bu30so6566065wrb.8
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 08:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=0ETjPjVaLUGYelarsY27uOlCTsNUqB6Io6lTtEDWJ0g=;
        b=Nn0SypSyWvJeuGsE/vkQjUErJwZ+YubWXkMSb4HOGRn00X52BBMz7l8ojES1nVU4by
         vwIXXYdy9C1hDzgoO1LdyYKaujMWvITExyQBYLm26JzYQj+q/tGUYLjeffpQrqnBR9CM
         VGxPLxvKROs6zfuPGirMIAN9m1aFDVxLwrZfaz0ZxEjgG+pV3S51FCgPK7vZOmnq+2rq
         y3diZnhL8YAdTfJZgoFjlf9m/Dynil9gDdYh74/VWdyoxi5bQRF8/ckRbovigLU0XOq1
         SjllRN9I42reY/2D3hV6sJzfcOBgCspw3CN5mu1n4iIwRNaq21+Wn91XMT+9xtmdeW0s
         TT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=0ETjPjVaLUGYelarsY27uOlCTsNUqB6Io6lTtEDWJ0g=;
        b=ciQ8QtGlp7rMlk62J6YOOfE3Vze0Txsk0DWDsO/JLyQFON25vJZH0Sb8+3WrIf0NOW
         v8+JdHvI+88xSyjRhapH91/HF8FUx7xLaV7CfH0+0pZ3g7fhtocWKuxSIx/MEpzHFbtl
         fysZER5pOGusHU3lKi+bzfnyURRnlIoWegl47nHCMqXiunrXi9T20NKLI+Vex5o7nf6O
         sudTDpgoyDPDlfWe16SfOmXDUfWZblo0Zpvg6cLMq32d7jixKNERurI8gtgSWTRhQ2gI
         rZGGamxUuYEsAlL5GohbjXl7noRmxDMR8Lx2J4WgOrF0U8RNzHMYRJeSXPznr/FdlwH/
         MOqg==
X-Gm-Message-State: ACrzQf3cp49NqZ56p5a8X+MspjGvRSZlbkqLpC1EO5+BzlfIgCbwGZV8
        /X1Z+59rLG6THqjZG67fGaeWRw==
X-Google-Smtp-Source: AMsMyM4ts8oPlVnDO/To/gr+/vnD0qk0fzHTS+20rrjMFMxhXe3S3fhDipsKVLn7CdHxgmyWX9TLNg==
X-Received: by 2002:a05:6000:1f1d:b0:22a:feb9:18a7 with SMTP id bv29-20020a0560001f1d00b0022afeb918a7mr183647wrb.152.1664983267235;
        Wed, 05 Oct 2022 08:21:07 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id p2-20020a05600c1d8200b003b4764442f0sm2306854wms.11.2022.10.05.08.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:21:06 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 1/2] dt-bindings: media: ovti,ov9282: Add optional regulators
Date:   Wed,  5 Oct 2022 16:20:17 +0100
Message-Id: <20221005152018.3783890-2-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221005152018.3783890-1-dave.stevenson@raspberrypi.com>
References: <20221005152018.3783890-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The OV9282 image sensor takes 3 voltage supplies, so
define the relevant regulators.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../devicetree/bindings/media/i2c/ovti,ov9282.yaml       | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
index bf115ab9d926..652b4cfeded7 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
@@ -36,6 +36,15 @@ properties:
     description: Reference to the GPIO connected to the XCLR pin, if any.
     maxItems: 1
 
+  avdd-supply:
+    description: Analog voltage supply, 2.8 volts
+
+  dvdd-supply:
+    description: Digital core voltage supply, 1.2 volts
+
+  dovdd-supply:
+    description: Digital I/O voltage supply, 1.8 volts
+
   port:
     additionalProperties: false
     $ref: /schemas/graph.yaml#/$defs/port-base
-- 
2.34.1

