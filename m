Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2116E54556E
	for <lists+linux-media@lfdr.de>; Thu,  9 Jun 2022 22:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233185AbiFIUPR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jun 2022 16:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244052AbiFIUPQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jun 2022 16:15:16 -0400
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 426F71451D2;
        Thu,  9 Jun 2022 13:15:15 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id p1so19536082ilj.9;
        Thu, 09 Jun 2022 13:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iOJjb/HQ4gdA4/3VBeufzwLFhD15y3cbhKQBI6TlzwI=;
        b=FV1oIczFvSBzvMlLmkm41ZJ0/e3FMCHlco38LeZdDwIzAuRlD6J7DQBUwb/Z5Z8stN
         D7K9upJsFU/CN6gEDBQB7SAGVPdfxfgX5M4qpsC3HbriH1Sb6QK+UxUMRb/UWhZYJxWR
         TQZzdgyUgcRYQ7tr5IrEpxg8L0A7qOaZ9VYXO7JKHZvqOTzLffkmIcLNGoA8xKE9aitx
         y/l8hpQl8T/2S7Mu5MPT6tprIzq112QQX38Sq3NO0ZIrfZLKPJkUKu+Ph+DaSxOvIqWH
         k9i+nH7M+NtvQvYjgp9Ud7wCh3uFQ4ijaUTRIyaif14n73J5aRUgyJDNVFJz5pSqkw/h
         NoTQ==
X-Gm-Message-State: AOAM531Uif8RBIOBUXCI40yGSxPWh2ymnyk1Nt88a5JTNSLfcEe5IcAu
        XjobSDYv3tHjatb122GOXJtQGmWYAQ==
X-Google-Smtp-Source: ABdhPJwWF+nD7Jp+sp0RDDh/8/VRzbg2P7oAecSyl3ztlo2OIB6mkUosVVHv1uCx5AahIIawzICIJw==
X-Received: by 2002:a05:6e02:1a8e:b0:2d3:bd16:40ee with SMTP id k14-20020a056e021a8e00b002d3bd1640eemr23791377ilv.20.1654805714463;
        Thu, 09 Jun 2022 13:15:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id k18-20020a6b3c12000000b0065a47e16f59sm9916092iob.43.2022.06.09.13.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 13:15:14 -0700 (PDT)
Received: (nullmailer pid 29881 invoked by uid 1000);
        Thu, 09 Jun 2022 20:15:12 -0000
Date:   Thu, 9 Jun 2022 14:15:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     paul.j.murphy@intel.com, sakari.ailus@iki.fi,
        dmitry.baryshkov@linaro.org, andrey.konovalov@linaro.org,
        daniele.alessandrelli@intel.com, devicetree@vger.kernel.org,
        jacopo@jmondi.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: imx412: Add imx577 compatible
 string
Message-ID: <20220609201512.GA29786-robh@kernel.org>
References: <20220607134057.2427663-1-bryan.odonoghue@linaro.org>
 <20220607134057.2427663-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607134057.2427663-2-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 07 Jun 2022 14:40:56 +0100, Bryan O'Donoghue wrote:
> The Sony IMX577 uses the same silicon enabling reference code from Sony in
> the available examples provided.
> 
> Add an imx577 compatible string to allow for chip differentiation and
> accurate description of hardware in dts.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
