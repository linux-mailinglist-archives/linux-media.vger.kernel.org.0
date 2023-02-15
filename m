Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BAD369725F
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 01:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbjBOABp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 19:01:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbjBOAB3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 19:01:29 -0500
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9732928D34;
        Tue, 14 Feb 2023 16:01:28 -0800 (PST)
Received: by mail-il1-f177.google.com with SMTP id b9so6785302ila.0;
        Tue, 14 Feb 2023 16:01:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pb2H4GiIUQIXiuA5pS1/cg1DhHmIuGZWc8k9dBVDaag=;
        b=RX4EcP4OLQIldp4IHmwjboIgXSxqr3k+BFhgGrRkL0uJwPRpaMRFJ6kKV3A7cpvikZ
         BERR71ZH3/rl/uefWmeXJij/g5ZCDxtxDe6dVnXtr9wsCUkcCHbenLUo36F1NfdONuRN
         nArApFTkCkmge4NpZ80WyD7AsGrO5VvE3cy0+A+n9J67WMVaXemU5WU/13SKyXOZxIVs
         jQXEL0GrC+7jNO4jXM6kMKp+oKhDd4e2p0t5lZRxyW1C6FLC0M+ONfL5ABE/BhbN77w4
         LC9U5sythEUhTvTNUDm4WhVQxZx0zuOw+VW2F2EyHVOt3//egZ0comYyzZY09QxkRi/X
         NUeA==
X-Gm-Message-State: AO0yUKUNKdfBWYUzhqfIue+yoYwVLSvdV1rSVlu3yo8h2DfeTwEayL8b
        SVwvqTnRx0EGcXBb4RWJBw==
X-Google-Smtp-Source: AK7set/JyoKpdnldNrGJbltZQn5Y55sfH5/h77nSeeIFktAfVu/5IBqE2yRGicdeo4fk1tJjtWxfJw==
X-Received: by 2002:a05:6e02:16ca:b0:310:e816:8c8c with SMTP id 10-20020a056e0216ca00b00310e8168c8cmr467838ilx.3.1676419287830;
        Tue, 14 Feb 2023 16:01:27 -0800 (PST)
Received: from robh_at_kernel.org ([65.158.198.5])
        by smtp.gmail.com with ESMTPSA id g2-20020a0566380c4200b003c4920e7c74sm4877864jal.57.2023.02.14.16.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 16:01:27 -0800 (PST)
Received: (nullmailer pid 61769 invoked by uid 1000);
        Wed, 15 Feb 2023 00:01:26 -0000
Date:   Tue, 14 Feb 2023 18:01:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] media: dt-bindings: media: renesas,vin: Add binding
 for V4H
Message-ID: <167641928588.61712.1165960499628432111.robh@kernel.org>
References: <20230211144147.3812388-1-niklas.soderlund+renesas@ragnatech.se>
 <20230211144147.3812388-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211144147.3812388-4-niklas.soderlund+renesas@ragnatech.se>
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


On Sat, 11 Feb 2023 15:41:47 +0100, Niklas Söderlund wrote:
> Document support for the VIN module in the Renesas V4H (r8a779g0) SoC.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

