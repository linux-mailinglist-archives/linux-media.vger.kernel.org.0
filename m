Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43EBE483653
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 18:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233475AbiACRlQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 12:41:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233427AbiACRlP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 12:41:15 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 584CBC061761;
        Mon,  3 Jan 2022 09:41:15 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id n3-20020a4a3443000000b002dad63979b8so9657138oof.4;
        Mon, 03 Jan 2022 09:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F97Z9MZZpfYYxOf9tOkgxm3NqcNPkDJulog1JYW2wkA=;
        b=dOtxezKa29TR5UHXkO0ngMZqU94ibNi/K3SMr2BwvdmXMEcuDpozQZ0ff+rGyk8QHf
         c90HT7xjFDAzAh3bKvKZnZMZ8oN58RRqt5TOUdrsWPz1fIc5dgXRGw4OVCuBBABOIjtp
         qw6zn4WvaDh6Fd/pS8T9N1WA1IEv7QYVs954yLO7DNFPVClvx/aea97kafU9UpIHD4RA
         HpugxMhyOKayXf1vlEoHxeFzp8TFzmVKIiMJG0N2yVAfCtOjei+yTXgqksP4AbqDoM87
         j1WXrlzE4QbnH2IgdhwM8RRR9r/FeI9+PFTojQZ056Pxz8K0d6Nv/TgdJokiolKS+ZMz
         wh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F97Z9MZZpfYYxOf9tOkgxm3NqcNPkDJulog1JYW2wkA=;
        b=kJRIwlMmCpl+LdZ10oLH4M1zxyaf4ti5P6u4PseYdIuBMbFRWf/E3VLLbzar69j7bc
         kzSJD963wqe/8eTEdepcFY7TrtYwvVZr2C2L90IwoSwCwlstx6O4QvvCKWUOQRDcEWqj
         PA+7UiPcEXtF7BciXu2PZo4zRf2xVhtC3xPjYIBzKPfcNR0C5eY/331YNFXxk+/XnYbT
         w0I1KNYd2BygsscBVoFNdD87nS/28wejYIvrTDHT9CFC3XjtnS7gjaw9+SEXS4xTZOPh
         7KYRu2bY5nDg6deAoKOZFSNlWtY7P7maghnEuVifAIOCkYdi+5+viK4ryTzEWwf6Y7s+
         lydg==
X-Gm-Message-State: AOAM530s3xeJR/yK2s4m2ibBOCNSw+atpPjU/GUBCKfDrUgbpLCeS/Zz
        jjjfKpaNuHjBIeRNGcAZQNY=
X-Google-Smtp-Source: ABdhPJwhLZm58BF48DzWth3dk9AzV0nqspsGlOg2xF4GseTe775h725SnrX2OOATigfI2ja3r0QI6A==
X-Received: by 2002:a4a:ab05:: with SMTP id i5mr29072440oon.61.1641231674801;
        Mon, 03 Jan 2022 09:41:14 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id s6sm9368864ois.3.2022.01.03.09.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 09:41:14 -0800 (PST)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mchehab@kernel.org, emma@anholt.net,
        mripard@kernel.org, linux-media@vger.kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 3/5] dt-bindings: display: simple: add Geekworm MZP280 Panel
Date:   Mon,  3 Jan 2022 11:41:04 -0600
Message-Id: <20220103174106.907-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103174106.907-1-macroalpha82@gmail.com>
References: <20220103174106.907-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

The Geekworm MZP280 panel is a 480x640 (portrait) panel with a
capacitive touch interface and a 40 pin header meant to interface
directly with the Raspberry Pi. The screen is 2.8 inches diagonally,
and there appear to be at least 4 distinct versions all with the same
panel timings.

Timings were derived from drivers posted on the github located here:
https://github.com/tianyoujian/MZDPI/tree/master/vga

Additional details about this panel family can be found here:
https://wiki.geekworm.com/2.8_inch_Touch_Screen_for_Pi_zero

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index f3c9395d23b6..659db7206c96 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -148,6 +148,8 @@ properties:
       - frida,frd350h54004
         # FriendlyELEC HD702E 800x1280 LCD panel
       - friendlyarm,hd702e
+        # Geekworm MZP280 2.8" 480x640 LCD panel with capacitive touch
+      - geekworm,mzp280
         # GiantPlus GPG48273QS5 4.3" (480x272) WQVGA TFT LCD panel
       - giantplus,gpg48273qs5
         # GiantPlus GPM940B0 3.0" QVGA TFT LCD panel
-- 
2.25.1

