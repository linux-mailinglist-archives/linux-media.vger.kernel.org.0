Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0335E697257
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 01:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbjBOAAo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 19:00:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232004AbjBOAAM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 19:00:12 -0500
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4F9828855;
        Tue, 14 Feb 2023 16:00:11 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id 18so898944ilg.3;
        Tue, 14 Feb 2023 16:00:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GdnOc8Rw0xQA+X2ORwY/P1SBgpvcAT9ng4m6T6MLKbc=;
        b=4Tm5LiWzvboiuPCydGCcoMuKLS34kvEaWfzbb3t9PTomNE1Subp1cKpdu5E6lt1HvK
         LLqXnHNFVVBXFTB4CR0qRM9TsC4zitMq3J05lVskO2TCyCmHqKFClblPTnZP0DKhT73A
         osofEXO2MdO5hiv0s/D9GJGtHjHH1RAucsYCo1TLzp8wwNP/CYrvKjH/ocOIitt4wEWM
         O0VCAlJM7mUzDrxbajwT2OZsEmeOKHAHnJQ4Q42q2ileWeeE6nNh+OvYu8FCaM//q8JO
         85ijEKuuDaDY4POmMUSGGPZMXYwhiV1j6q8WliZ95387mO60jZNglXq9Q2leMoDptt6e
         xcNA==
X-Gm-Message-State: AO0yUKVy65y4egm6o6q99MTjda9CH2/TtDFmsTIWY3C39uo7ZYyjV74f
        ASUaboke4/P0AC91S1ONuQ==
X-Google-Smtp-Source: AK7set+VFtlGR9O6ONinVbvRhR8mt3S1/86u++8R8x0HH+Sl39VPNMFdu/pbdfaseAfVcml9cBwA0w==
X-Received: by 2002:a05:6e02:b4b:b0:315:4c18:5142 with SMTP id f11-20020a056e020b4b00b003154c185142mr450688ilu.10.1676419210941;
        Tue, 14 Feb 2023 16:00:10 -0800 (PST)
Received: from robh_at_kernel.org ([65.158.198.3])
        by smtp.gmail.com with ESMTPSA id k2-20020a02c762000000b003c4907302a1sm5166865jao.107.2023.02.14.16.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 16:00:10 -0800 (PST)
Received: (nullmailer pid 59722 invoked by uid 1000);
        Wed, 15 Feb 2023 00:00:03 -0000
Date:   Tue, 14 Feb 2023 18:00:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] media: dt-bindings: media: renesas,isp: Add binding
 for V4H
Message-ID: <167641920328.59670.12720988583639874176.robh@kernel.org>
References: <20230211144147.3812388-1-niklas.soderlund+renesas@ragnatech.se>
 <20230211144147.3812388-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211144147.3812388-2-niklas.soderlund+renesas@ragnatech.se>
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


On Sat, 11 Feb 2023 15:41:45 +0100, Niklas Söderlund wrote:
> Document support for the ISP module in the Renesas V4H (r8a779g0) SoC.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  Documentation/devicetree/bindings/media/renesas,isp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

