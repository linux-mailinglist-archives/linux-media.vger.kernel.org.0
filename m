Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70E005F6DEC
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 21:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231600AbiJFTJg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 15:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232230AbiJFTI3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 15:08:29 -0400
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D625C9E0DA;
        Thu,  6 Oct 2022 12:08:27 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-132af5e5543so3266760fac.8;
        Thu, 06 Oct 2022 12:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KGbs2wG1XpjcFxnClmxfH82w20P++hEoah3yPVaJJE=;
        b=cq1f9YkqhNsFDQNXVWQ3zeSUlU3mU5T9lTMSrfIu7MXIRPLYMIzehi5c4bXHDTxznJ
         8anPkNZ47QPSbxsgTyIpMwnjHG43Hubn1wpW6TfXxQGvfFA9L0XoaEGuFZJmpkvqpgKm
         O3ehuL4G0ekCS/torCRk+WvOq4RnmEPtnJmj7c4MmslN3Nhb+rDQEXs4IEb3y9R+astg
         wScLvCfapqdD0TLlSmsXSiTNY9+CIOrD7xftP/llJtqo0E4pUz5VsLjDOmkFzjmSgAaI
         cIk6DYqhDiWb57AzbhtEvZCr0d5A9v6AeC+EA/oC+7S2eTCeMQZWr4auWGP4DvH127fJ
         Acpg==
X-Gm-Message-State: ACrzQf21mOvE3Dvnom2l9QlS7ZmtTAkfQ/juqmva80rb7L9td/adNz5C
        JIh0L181O51tjFQHMwrkQg==
X-Google-Smtp-Source: AMsMyM5IxWAjxrNgwFoey5JJ9f72FNN7loa5+9TTlbM8aGx16nwY4UZktckMJSiRkRJ1UsutZqaZzg==
X-Received: by 2002:a05:6870:d598:b0:12c:25b9:53ee with SMTP id u24-20020a056870d59800b0012c25b953eemr6536321oao.235.1665083307071;
        Thu, 06 Oct 2022 12:08:27 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:8a65:c536:245:842:a3a4:9017])
        by smtp.gmail.com with ESMTPSA id e7-20020a9d63c7000000b00660f6fa097fsm139598otl.77.2022.10.06.12.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 12:08:26 -0700 (PDT)
Received: (nullmailer pid 40888 invoked by uid 1000);
        Thu, 06 Oct 2022 19:08:25 -0000
Date:   Thu, 6 Oct 2022 14:08:25 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        daniele.alessandrelli@intel.com, robh+dt@kernel.org,
        paul.j.murphy@intel.com
Subject: Re: [PATCH 1/2] dt-bindings: media: ovti,ov9282: Add optional
 regulators
Message-ID: <166508330490.40818.3935401811729256182.robh@kernel.org>
References: <20221005152018.3783890-1-dave.stevenson@raspberrypi.com>
 <20221005152018.3783890-2-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005152018.3783890-2-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 05 Oct 2022 16:20:17 +0100, Dave Stevenson wrote:
> The OV9282 image sensor takes 3 voltage supplies, so
> define the relevant regulators.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../devicetree/bindings/media/i2c/ovti,ov9282.yaml       | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
