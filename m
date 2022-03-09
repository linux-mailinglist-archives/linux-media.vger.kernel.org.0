Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96E114D30B0
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 15:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbiCIOAF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 09:00:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbiCIOAF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 09:00:05 -0500
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E8465BD3C;
        Wed,  9 Mar 2022 05:59:06 -0800 (PST)
Received: by mail-ot1-f43.google.com with SMTP id k9-20020a056830242900b005ad25f8ebfdso1778654ots.7;
        Wed, 09 Mar 2022 05:59:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9WQKUq5qEG5jbo/MSG1p6dhiqJZzacE/65VAuqXyMI8=;
        b=xa3SXitqsSSgxuJxllJ4K3pHyrOWxcLYQM7QUm32lJesf3ZYiqo2G8xda9Sm98WIQi
         whBKBvAxhpAp7hcl1BbNK8n371KiUgemtreAOunAyCpIHh7iyLvdUMWl5Ncumj6ZmEgK
         CN+wP55b4KZOlWtEcIo0B/SH8VoW61EMTsX6peNuREh0bZ7H8GimR36X01wzRTjV454P
         jU1HHDCRF1ZAcscZl8Lr+S/roJiA24URuBYcaPLA0SQf/hoDNbDi4opEv8kIomGwuktT
         2WMeH4x5RnJ0MRi2bGPfwBDFiHlLQK7xnIHC1v64Wwt6H8kbFLAhKMkk7VqimqHMROVp
         6v5w==
X-Gm-Message-State: AOAM530FVUL5fTAhubzJ3C/Da4u9Y+3aQ4w/rqoIs8mXSLr51huXQHpK
        BH4OnKi8uf5+lfdM04iXWQ==
X-Google-Smtp-Source: ABdhPJyIdw5ufiYGJL0AhzWJGoQk9y5LeODaq2SRRogv/yy+DGd+T6GkLzBW7LpSkOVWfkrCfnPzuw==
X-Received: by 2002:a05:6830:2055:b0:5b2:5659:542f with SMTP id f21-20020a056830205500b005b25659542fmr3189142otp.189.1646834345759;
        Wed, 09 Mar 2022 05:59:05 -0800 (PST)
Received: from rob (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s82-20020acadb55000000b002d9ce64bea0sm967979oig.48.2022.03.09.05.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 05:59:05 -0800 (PST)
Received: (nullmailer pid 2792610 invoked by uid 1000);
        Wed, 09 Mar 2022 13:59:04 -0000
Date:   Wed, 9 Mar 2022 06:59:04 -0700
From:   Rob Herring <robh@kernel.org>
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: media: add ovti,ovm6211 bindings
Message-ID: <20220309135904.GA2790178@robh.at.kernel.org>
References: <20220309102215.891001-1-petko.manolov@konsulko.com>
 <20220309102215.891001-3-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309102215.891001-3-petko.manolov@konsulko.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 09, 2022 at 12:22:15PM +0200, Petko Manolov wrote:
> Omnivision OVM6211 MIPI CSI-2 sensor bindings.
> 
> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> ---
>  .../devicetree/bindings/media/i2c/ovm6211.txt | 49 +++++++++++++++++++

Not sure how you got to v5 already, but bindings must be in DT schema 
format now.

Rob
