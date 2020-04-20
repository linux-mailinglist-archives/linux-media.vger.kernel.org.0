Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 199A11B0CB4
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 15:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbgDTNdn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 09:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726211AbgDTNdn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 09:33:43 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E80C061A0C;
        Mon, 20 Apr 2020 06:33:42 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id d17so12145775wrg.11;
        Mon, 20 Apr 2020 06:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:subject:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8BFEyEY0pQowkZqKW1UkfT7rrgGTA/DT5VZkesq580U=;
        b=jI6iP14b7dzEFoZQvAAIUYghaAf74HD2b1ii3wq9eMvvEjaomCD7s16mvfUIQ3rDjA
         n5zzGtHPJnqu8IG4W2z0EORu4pNg2WrZLng5F5k5QzOFEylOaUGwxN+82zE2B47vgRIQ
         WLMY9m8uHHcghaTF0wunUg+LFTcKRF4gbhCPF5op07R8yWMAi3J69LC3QtnD3C3lkdMu
         3ASAmvnv/2rus6HAuPIVE7WBgsN0oPVDV7aV0dqd3pBPdC18aIFKwVlmxa+v4y+UOnKU
         eqXdkvPDSZ2DyO3uodzwMos8ejLoUotD4Zx7aoJTfF9GesOL5Hx+Mw3nbLUWgNWTRpWy
         eNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:subject:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8BFEyEY0pQowkZqKW1UkfT7rrgGTA/DT5VZkesq580U=;
        b=AyMQJmjaKhxNuifXQ/CuFtJfVluJmQ2AgqxOByXyckW6Xl/gLshKK0/EVFSa0uAkoK
         EWb5ciyrVcoUKIVKdZwu4L546Llc0K/aZDJPkkCQAc2dryWznlClrAKPoVPI2jP6U6Nf
         YXZOuzmwFWojuKi+bU/UBLXLo/o9C+laX7MUAOXYjiWV53PA2dmOtVIPmYBVrtty00MR
         +nlgjp5vYQ08KHjQ0Bv1U0msZJtjKicecjJ6qin1TtIat+I3787EQ9NTl8N69Rn9I3xm
         Rx9l6k0EIM67xYlMkX918py5WU0baRpFzk6TTHZrjo3jfNM068FJtoMtpO/Q5PX7UitN
         GbUQ==
X-Gm-Message-State: AGi0PuYxXJY0UC3e7w3DMmZq719hTSOOyHUVCheuewwmaVd+UdV1Hz6I
        KG+3Hc/bMXvh4GoUOLTlX+M=
X-Google-Smtp-Source: APiQypKZk4QdbUtcxcSUADGSPzH1arT+R3V9CoHvjnRas3SWIG9QuEjLf0kMSsO0onIm5RbW3IJU1g==
X-Received: by 2002:a05:6000:f:: with SMTP id h15mr18501426wrx.408.1587389621483;
        Mon, 20 Apr 2020 06:33:41 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id v19sm1310706wra.57.2020.04.20.06.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 06:33:40 -0700 (PDT)
To:     heiko@sntech.de
Cc:     ezequiel@collabora.com, devicetree@vger.kernel.org,
        hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        mark.rutland@arm.com, robh@kernel.org
References: <20200326191343.1989-1-ezequiel@collabora.com>
Subject: Re: [PATCH v4] dt-bindings: rockchip-vpu: Convert bindings to
 json-schema
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <12f6d7cf-6af6-4f54-3188-65e73b703a72@gmail.com>
Date:   Mon, 20 Apr 2020 15:33:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200326191343.1989-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Heiko,

This patch was applied by the media people Hans and Ezequil without note
and test I think.

make ARCH=arm64 dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-vpu.yaml

Errors for example:

  DTC     arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
  CHECK   arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml: video-codec@ff350000:
interrupts: [[0, 9, 4]] is too short
arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml: video-codec@ff350000:
interrupt-names: ['vdpu'] is too short
arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml: video-codec@ff350000:
interrupt-names:0: 'vepu' was expected

See:
https://lore.kernel.org/lkml/20200403124316.5445-1-jbx6244@gmail.com/

+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    oneOf:
+      - const: vdpu
+      - items:
+        - const: vepu
+        - const: vdpu

Vs.:


+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: vepu
+      - const: vdpu
