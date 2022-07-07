Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC80956A1D3
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 14:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235443AbiGGMR4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 08:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231406AbiGGMRz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 08:17:55 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32344205DC
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 05:17:54 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id r6so11471786edd.7
        for <linux-media@vger.kernel.org>; Thu, 07 Jul 2022 05:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=60N8M/nRnM//t+C1HJLgQyIh2MzYGHSkKBYpJ2zSJko=;
        b=Kds6zwJqERFx4b+AMgYRkkipOmZn/9MKCL6MujKN+VIeXuM/+8dQgVkb+V07WtkS3V
         VAwuJQG3beibjuh5o4sxO9Nev3j2Bwe/Ufw6YM3MG1gjB4sEK62bAoZzAHUBVHX3W9BO
         iQhkmwHEs1X7hspnzMTOMCg03JsnAy1rk2sGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=60N8M/nRnM//t+C1HJLgQyIh2MzYGHSkKBYpJ2zSJko=;
        b=UstAdCWdHuMmEN/5BvDL+2nscB3HxVuqvcght1zyBWY10uVcQLBCliBvqYiCwJuuH4
         KaN9CnHvhu9eshIlFNC11bdkzeLFMwS6iyRyrD1U3NrVsT2EDp5WZqGjJpi8CLSn3RcG
         8L5GplsoV6WHTsMCLowKyf7uNyGH618IQBU6wrLkELsd4PoxPGnf+dEPBxuWASbYx7Il
         BXLbZB6os2R3F5QSuO2S2GESzfIGviqSdTJhGFCjr2lnjdGozC3sneus+g5na6XNIzh6
         fvtezl0TWXbFigQJyr1VGmbLd8v8NI9D0fCO4eCyQfUROUQk5rR4f+f2frCV00bdX50g
         qhAw==
X-Gm-Message-State: AJIora+NYCwQ3ly/qfEWSiyoyqPZ8oGKMAc0rpGYhzmbqZMHEC+Ga/zR
        i7d37rt9ftQT5V2i5k8GDi+RZvUBQZEBiQ==
X-Google-Smtp-Source: AGRyM1sZIR4+21LWH+CSarN9dij84q5dNBCR/Bzh3HG24ea+ENbR1sp36BADeX2CcaTWpxspjJhGeA==
X-Received: by 2002:a05:6402:510e:b0:435:9052:3b16 with SMTP id m14-20020a056402510e00b0043590523b16mr64156983edd.20.1657196272737;
        Thu, 07 Jul 2022 05:17:52 -0700 (PDT)
Received: from carbon.gago.life (78-83-68-78.spectrumnet.bg. [78.83.68.78])
        by smtp.gmail.com with ESMTPSA id g1-20020a170906538100b0072a55ebbc77sm10794721ejo.66.2022.07.07.05.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 05:17:52 -0700 (PDT)
Date:   Thu, 7 Jul 2022 15:17:51 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, jacopo@jmondi.org
Subject: Re: Re: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Message-ID: <YsbO74eGybz7uFBe@carbon.gago.life>
References: <YrwFf7Jw2/yDlcDq@carbon.lan>
 <12352558.O9o76ZdvQC@steina-w>
 <YsRVAV8a48CwpaSY@p310.k.g>
 <2450654.irdbgypaU6@steina-w>
 <YsWJBEPhp9WhiYe1@p310.k.g>
 <YsWTXnTpeM+mCImc@pendragon.ideasonboard.com>
 <YsXh/arQZXnaeGAi@carbon.gago.life>
 <YsYC6eMtotq7FR2i@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsYC6eMtotq7FR2i@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-07-07 00:47:21, Laurent Pinchart wrote:
> 
> MEDIA_BUS_FMT_* are media bus formats, they describe the format of data as it
> gets transmitted on buses between entities. The main purposes of those formats
> are configuration of entities in the pipeline (an IP core will need to be
> configured differently if it receives 10-bit raw data or 12-bit raw data for
> instance), and validation of the pipeline configuration (the format on the
> output of an entity must match the format on the input of the next entity).
> 
> V4L2_PIX_FMT_* are pixel formats, and they describe the format of data as
> stored in memory. They're only meaningful for the DMA engines at the end of
> the pipeline, and while they're related to the media bus formats (the DMA
> engine can't write to memory, for instance, V4L2_PIX_FMT_YUYV if it receives
> MEDIA_BUS_FMT_SGRBG10 from the previous entity), there's no fixed 1:1 mapping
> between the two formats. The mapping is device-dependent. For instance, a DMA
> engine that receives YUV 4:2:2 data in the form of MEDIA_BUS_FMT_YUYV8_1X16
> could support writing it in different pixel formats, such as
> V4L2_PIX_FMT_YUYV, V4L2_PIX_FMT_NV12, V4L2_PIX_FMT_NV16, ...

Thanks for these details.

I was wondering why V4L2_PIX_FMT_SGBRG12 would not be used for
MEDIA_BUS_FMT_SGBRG12_1X12 bus formats, but i guess the answer i can extract
from the info above is "device dependent".

> I have work in progress patches that address issues with the imx7-csi-bridge
> driver, once they land we could look into this. I'm afraid I'm a bit slow
> these days due to covid.

Quick recovery!  Looking forward to these patches.

For me, changing VID_MEM_LIMIT to 512MB works OK for the moment.  I am not yet
certain how this constant is related to the global CMA parameter.  In the
default kernel config CMA is 32MB, while VID_MEM_LIMIT is 64MB.  Isn't this
wrong?


		Petko
