Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3108686D5D
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 18:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbjBARro (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 12:47:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbjBARrm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 12:47:42 -0500
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1C971677;
        Wed,  1 Feb 2023 09:47:41 -0800 (PST)
Received: by mail-oi1-f179.google.com with SMTP id r9so16372294oig.12;
        Wed, 01 Feb 2023 09:47:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V23HrrQKl0Cy9s84FfPuJe6OSp4CMIQkMKvIgxymkvE=;
        b=jXG1h7OacGW5v4talQgqaLMLVhHXuc/0jcuO8Xyo01Upsu/mp0zDkqd8DU+R+1mHtE
         9j+cHGP/v8HMOsZSp0ihGa2w9RMfbBNuOq8M1WET3QBKJ5017jUWkilzqSHYSq+/68EU
         udlpLEkX/Ow5Kf4f5IKsOIc0w6A5zVVE/bOLUux7THJACTyHAmL2nNLkmp230/orfQRy
         MriuseJMahSnNJmV0NCraw0h9h68dQ8D1fRzvjm+Qiyfcsumo3Qw1oXNFNshwGcURrge
         Q1qF07k5ftrES61MH1FZ+vSNVe7R1ID+elXRz0jXGUIkEO7NMMuWzLwyWxWdGSAjPT4w
         tbEA==
X-Gm-Message-State: AO0yUKVcMHFbS1mrqnEo77J5fys0QfK3/6DQtrm1S11YiNOq76mlwZgk
        wVy2ARt5PhT/vZcd/mYfTw==
X-Google-Smtp-Source: AK7set/5ypdFEG0oCaJlt0OCW/78F6uIuyFlfMPmcnv9Tv0FU7A8sFxNxVsQnOwPx9B3iBNdcP1++A==
X-Received: by 2002:a05:6808:b07:b0:364:9fbc:f197 with SMTP id s7-20020a0568080b0700b003649fbcf197mr1588161oij.35.1675273660685;
        Wed, 01 Feb 2023 09:47:40 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u10-20020a54438a000000b003780e80fad6sm4882381oiv.49.2023.02.01.09.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 09:47:40 -0800 (PST)
Received: (nullmailer pid 4065855 invoked by uid 1000);
        Wed, 01 Feb 2023 17:47:39 -0000
Date:   Wed, 1 Feb 2023 11:47:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: media: i2c: Add mono version to
 IMX290 bindings
Message-ID: <167527365915.4065205.16958079619924053127.robh@kernel.org>
References: <20230131190700.3476796-1-dave.stevenson@raspberrypi.com>
 <20230131190700.3476796-2-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131190700.3476796-2-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Tue, 31 Jan 2023 19:06:59 +0000, Dave Stevenson wrote:
> The IMX290 module is available as either monochrome or colour and
> the variant is not detectable at runtime.
> 
> Add a new compatible string for the monochrome version.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx290.yaml        | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

