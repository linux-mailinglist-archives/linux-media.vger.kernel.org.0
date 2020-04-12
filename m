Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B60AF1A5FCA
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2020 20:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727575AbgDLSaH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Apr 2020 14:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:43936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727561AbgDLSaG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Apr 2020 14:30:06 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A05C008778;
        Sun, 12 Apr 2020 11:20:26 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id k21so6789590ljh.2;
        Sun, 12 Apr 2020 11:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=did1T2/HwLMbYWYOlmzUGj6USB2Yk/B/7FfjOftQ9s8=;
        b=hipBb+D/jP/qEHd5BxbwYSODqx8BortuRIMkzRERp+XNGiT4yk7To7/dmj1lelc1as
         +0NSQvV64w2t/PnzKb1LJ3XbFzahoqefh/RWPrxsSegizIkWgg36JQCN7Pzo1nK5cvN0
         lJGNzou6X3se3VQTxHXXbePUXVNBOzKlaBO7QS8ktk7UZG46dTbDykrRvVjsRkLAqgvJ
         nurSgm8718ek6yzWafK9i7ZgFVeXqFJyZ81gy03GMLVQhUJHCwpBjnj6wwSdxV6cn8Pu
         EsR5rTAsyO+knJtNRCnAFVxaQC0KxbtqlP0eGap3QBlcASp7GH3XKhXAjIACUV/Pci/X
         cG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=did1T2/HwLMbYWYOlmzUGj6USB2Yk/B/7FfjOftQ9s8=;
        b=gqenxPtsgrVf+7cDgUvJRSYBykZox9GQcxSgrqgWMq2rHG5hQ3vld0g0QT1CJpYZNs
         jlyzJI8LvdPxEMVPvgM6Jzua7cdEcs+PbUdhunVB3YqKImMxY34XiV7Ky9e5aFETeXup
         hayTDMatHXjPNZImEyoXWhsh59m0z92qTu453ATRa/Y8mEbqJ8c6m4APNCGazw7mwNCy
         wvxBeVz9SmCLgTQlBbpvcPhhIr5mOQgsnizv8QqlJtoic8twIVfKEXK6wI5+6f6zZkuR
         h3tFkpQoTuvrdssRIS/13yxbIerGol3tE9mVqGKIukNEhaF4Uj1CldJuHjMw45AndQzJ
         lHGw==
X-Gm-Message-State: AGi0PuaVHQ7AK4XScHG5Fp2d4pn3anaeKq6ow7iHEpgwOls4JIBXqg3c
        EFKKIP1e8NTcJ7uxpNto5l5whAEilMQ=
X-Google-Smtp-Source: APiQypLW6zIR1umbR/uxwiVl6Mu1txVZ1wgbVD7efr/eOYIQSegWjWS1ZWxFJ0MQHCvZ9C0SrDDCRg==
X-Received: by 2002:a2e:7d09:: with SMTP id y9mr8491929ljc.146.1586715624424;
        Sun, 12 Apr 2020 11:20:24 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id m13sm6434394lfk.12.2020.04.12.11.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2020 11:20:23 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        dri-devel@lists.freedesktop.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 3/4] dt-bindings: media: add wiring property to video-interfaces
Date:   Sun, 12 Apr 2020 20:20:11 +0200
Message-Id: <20200412182012.27515-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200412182012.27515-1-sam@ravnborg.org>
References: <20200412182012.27515-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The wiring property is used to describe the wiring between
the connector and the panel. The property can be used when the
wiring is used to change the mode from for example
BGR to RGB. The first users are the at91sam9 family where
such a wiring trick is sometimes used.
The possilbe values are so far limited to what is required
by the at91sam9 family, but using "text" allows us to extend
this in the future.

There exists similar properties today:
 - display/tilcdc/tilcdc.txt: blue-and-red-wiring
 - display/atmel,lcdc.txt: atmel,lcd-wiring-mode

Neither of the above are defined as endpoint properties.

The new property "wiring" has a more general name and
is defined as an endpoint property.
It will replace atmel,lcd-wiring-mode and may replace
blue-and-red-wiring.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
---
 Documentation/devicetree/bindings/media/video-interfaces.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index f884ada0bffc..c3bb87c5c9a9 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -141,6 +141,9 @@ Optional endpoint properties
 - link-frequencies: Allowed data bus frequencies. For MIPI CSI-2, for
   instance, this is the actual frequency of the bus, not bits per clock per
   lane value. An array of 64-bit unsigned integers.
+- wiring: Wiring of data lines to display.
+  "straight" - normal wiring.
+  "red-blue-reversed" - red and blue lines reversed.
 - lane-polarities: an array of polarities of the lanes starting from the clock
   lane and followed by the data lanes in the same order as in data-lanes.
   Valid values are 0 (normal) and 1 (inverted). The length of the array
-- 
2.20.1

