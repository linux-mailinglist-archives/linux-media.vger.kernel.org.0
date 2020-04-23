Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB3E61B5B8D
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 14:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgDWMgy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 08:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726090AbgDWMgx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 08:36:53 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A928BC08E934;
        Thu, 23 Apr 2020 05:36:53 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id 188so6248774wmc.2;
        Thu, 23 Apr 2020 05:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mi3rnUMPvy/QR3Ps6vsxVuv41qLYHh/uNXwCdOf964o=;
        b=PgsVLVg2fEE4UgEw5ybsRRcMm8D0szEHNj4jYCN/y3Piw4K0Zvmgpeth5Hjb8gCVI0
         Y2HAif5w2DxAfImAwIjZYnbyP7fEaBREjKHo0lML6cKH1VCtmlwGLGXxHftgpxo7RyJk
         5ta54tkpyf8ALl3fGhh7E3u2HGxUH2dYnvxhZ8FMENxzdzOtQmlhJPnxAadF68Z+W+uf
         V2We74ZXkgSjQP/TIAUvhG6NnMiAjbgwaE6w/Kt2o6aFnsYbbqeZjmXF+ac+tinjBO/U
         p6YlOnEegbdG2PF+zK/S49wjLppEutcfSgHcBipTrQvS9xAjVt25l7orY3r29/DAPQFs
         eEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mi3rnUMPvy/QR3Ps6vsxVuv41qLYHh/uNXwCdOf964o=;
        b=AJEX3QCfh+BdO/SJSsU6fd+pe8gAHYmfdgPph9hLCcL+0xYgeC9iv2cuMhtr3gw29A
         69CSsnmLo02w0/m39jVR21ho08JdMdxSVlMDwAXigFn02wVUduu7Xk+cG8xasfg6vF/C
         v/l53Usc8cNm93UMKmaAGQJW8YgFj3UfYjc9BDZbsuoPGYAZA618fn217CQoI7Dy3xBd
         2TVevSaMV65aApOn1yuoLYYG4jMaLPo9sW4w0ffeniPxg0zJxpRpjGEmPcr/TWyLqzGY
         HEHg/EZeJj9cV1iPYXmDwcUS+9LWIzDg9+1aJ2U9M872Z6TDsNXHQ8wsJrKxnTt0TIiP
         2N9g==
X-Gm-Message-State: AGi0PuZrXUPYarTT6xRInH1CYEC1O4iEonudktsiIn5n8wB9LA92ukjN
        Gsfp2zQMBW4R8Mcg4Zee/Os=
X-Google-Smtp-Source: APiQypLOTc7Zk2kFUmf/qLTme2iOBIANPeVm3oJWV5ReTH48bHyBCwfMNIZwZ1IBZDmEt730DGE/4A==
X-Received: by 2002:a05:600c:2316:: with SMTP id 22mr3898972wmo.164.1587645412306;
        Thu, 23 Apr 2020 05:36:52 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id 68sm3672991wrm.65.2020.04.23.05.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 05:36:51 -0700 (PDT)
Subject: Re: [PATCH v2 6/9] dt-bindings: media: rkisp1: move rockchip-isp1
 bindings out of staging
To:     Helen Koike <helen.koike@collabora.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com, kishon@ti.com
References: <20200403161538.1375908-1-helen.koike@collabora.com>
 <20200403161538.1375908-7-helen.koike@collabora.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <7da8fb4d-018e-894a-884b-760eaf2959e6@gmail.com>
Date:   Thu, 23 Apr 2020 14:36:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403161538.1375908-7-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

make ARCH=arm dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
  CHKDT   Documentation/devicetree/bindings/media/rockchip-isp1.yaml
  DTC
Documentation/devicetree/bindings/media/rockchip-isp1.example.dt.yaml
Documentation/devicetree/bindings/media/rockchip-isp1.example.dts:22.27-99.11:
Warning (unit_address_vs_reg): /example-0/parent@0: node has a unit
name, but no reg or ranges property
  CHECK
Documentation/devicetree/bindings/media/rockchip-isp1.example.dt.yaml

On 4/3/20 6:15 PM, Helen Koike wrote:
> Move rkisp1 bindings to Documentation/devicetree/bindings/media
> 
> Verified with:
> make ARCH=arm64 dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
> 
> V2:
> - no changes
> 
>  .../devicetree/bindings/media/rockchip-isp1.yaml                  | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename {drivers/staging/media/rkisp1/Documentation => Documentation}/devicetree/bindings/media/rockchip-isp1.yaml (100%)
> 
> diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> similarity index 100%
> rename from drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> rename to Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> 

