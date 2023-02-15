Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B77B697254
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 01:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbjBOAAn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 19:00:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232312AbjBOAA2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 19:00:28 -0500
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E8F28855;
        Tue, 14 Feb 2023 16:00:26 -0800 (PST)
Received: by mail-il1-f179.google.com with SMTP id 18so899217ilg.3;
        Tue, 14 Feb 2023 16:00:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+gIix5fWh0gUQTk0kA6P0Al18ffyqafbtgxdAHNsCk8=;
        b=gfnpGjT2n8KI9DRc6mIrYtb6jWdDl5BzRPljjBzWDE7hZYYyf06HiDP9whuatJLskf
         Ut3pbvmcFnPJGieGrrtzC1cWtfRTN9qi682JCHfcjT8jJ+ULXQFgThIit4xgMx6PFqMv
         mngp3tYbPXQrIj7guAQ2E7JV1qRgepQUmd6M18oB3s0E46d1zG6XcSeDOsKC2nJBheKy
         jKZBVA9SrXqIePGKkQ0p23hoRJMTnaK1/Fro/Nklr/eXmYP2RLHGxeq9SO5WC26xsN74
         UveKM/UQM/k3ddfS9yDXa9hZLyfmo14DskBlagLkqp41iK0frnB1inQ+EzuIIHI6EBnu
         FUdg==
X-Gm-Message-State: AO0yUKVQS4Yw3Gl2Ac3P6PKd4/7zset98hAXxlCFHu+qtGmt2qmMMAOR
        AoPQeNRVfJSw3P82TbpuEA==
X-Google-Smtp-Source: AK7set/ve/j8PAkGEqoNqxrUj+2RF/57Fc34iDUVHoClOSrG/1JxSPDmqDzIC9OV05PiiFO8d0K3iQ==
X-Received: by 2002:a05:6e02:1c29:b0:315:7004:3e69 with SMTP id m9-20020a056e021c2900b0031570043e69mr61414ilh.13.1676419225460;
        Tue, 14 Feb 2023 16:00:25 -0800 (PST)
Received: from robh_at_kernel.org ([65.158.198.3])
        by smtp.gmail.com with ESMTPSA id b4-20020a02a584000000b003c4e8efcd09sm320726jam.32.2023.02.14.16.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 16:00:25 -0800 (PST)
Received: (nullmailer pid 60177 invoked by uid 1000);
        Wed, 15 Feb 2023 00:00:19 -0000
Date:   Tue, 14 Feb 2023 18:00:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/3] media: dt-bindings: media: renesas,csi2: Add binding
 for V4H
Message-ID: <167641921840.60125.15481359888099103849.robh@kernel.org>
References: <20230211144147.3812388-1-niklas.soderlund+renesas@ragnatech.se>
 <20230211144147.3812388-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211144147.3812388-3-niklas.soderlund+renesas@ragnatech.se>
X-Spam-Status: No, score=2.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Sat, 11 Feb 2023 15:41:46 +0100, Niklas Söderlund wrote:
> Document support for the CSI-2 module in the Renesas V4H (r8a779g0) SoC.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

