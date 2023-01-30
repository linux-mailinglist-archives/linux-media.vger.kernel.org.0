Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 081E96819B6
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 19:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237979AbjA3Sz5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 13:55:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237373AbjA3Sz4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 13:55:56 -0500
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEEFF6582;
        Mon, 30 Jan 2023 10:55:55 -0800 (PST)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1636eae256cso12034447fac.0;
        Mon, 30 Jan 2023 10:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4seh/Ei7WAqCGJ7PlzynIqkRSRvPxmIJy7CfdHrTRP0=;
        b=pXZpAHTIOzuDdNR6Jdms+WAMqbZ8naCPfF3locCLMBS/8NAesZ8nUbxgYOIGomy3S+
         MCRVN4d5olH4HuQ2NEXwDtbDlpzkff8+FO2DW4wReWMxqVWe9naux1vKkv0rY6k6bdF3
         NTVHOgkngR3jG492rLx83sSqvrDJoWmxxQmpExQqL3+A7ZBQxW8Fn0IdoSeqB9i3Xet3
         z3o3fcxYlE70F9TOCS3kWKwgBf9p6SkmDb+BrkRTq3PrpzR6AqdYIUjxld2WF9qqF3oP
         Wse3tdjZp8/ORvnVodwFFn37r924BmED1YaRZRIIXgyx4bQ46YYNf8hEb3hxymUz1VP5
         9wHg==
X-Gm-Message-State: AO0yUKW7e1LCCRBjni7TtE5GkJvDzKc5cDL7JeBNtQ2nsCtqkJVN0/kP
        dGn1pUpJ3sgrp57fWRlfXQ2mYNRE1g==
X-Google-Smtp-Source: AK7set8sxh0a0SiInSIvhImrcd54NfN9cb+q/7EqZZA2GPwUitHjsBXSDahHOtTFAoF/hcNcC5D37A==
X-Received: by 2002:a05:6870:4714:b0:163:4e13:cd7e with SMTP id b20-20020a056870471400b001634e13cd7emr4758237oaq.8.1675104954839;
        Mon, 30 Jan 2023 10:55:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ms25-20020a0568706b9900b001631b545e7csm5449782oab.19.2023.01.30.10.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:55:54 -0800 (PST)
Received: (nullmailer pid 3113850 invoked by uid 1000);
        Mon, 30 Jan 2023 18:55:53 -0000
Date:   Mon, 30 Jan 2023 12:55:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Adam Ford <aford173@gmail.com>, linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: media: imx8-isi: Use 'port' instead
 of 'ports' for i.MX8MN
Message-ID: <20230130185553.GA3110926-robh@kernel.org>
References: <20230126170603.11896-1-laurent.pinchart@ideasonboard.com>
 <20230126170603.11896-3-laurent.pinchart@ideasonboard.com>
 <CAHCN7xJNGCd=Sghu3oe9_yjSg0ybXRFHaVLaZmC2guXCy7ty1A@mail.gmail.com>
 <Y9LI//H0a8P8c0gL@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9LI//H0a8P8c0gL@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 26, 2023 at 08:39:59PM +0200, Laurent Pinchart wrote:
> Hi Adam,
> 
> On Thu, Jan 26, 2023 at 12:31:16PM -0600, Adam Ford wrote:
> > On Thu, Jan 26, 2023 at 11:06 AM Laurent Pinchart wrote:
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  .../bindings/media/nxp,imx8-isi.yaml          | 39 +++++++++++--------
> > >  1 file changed, 22 insertions(+), 17 deletions(-)
> > 
> > Is there a reason not to squash the two bindings into just one patch?
> 
> As indicated in the cover letter, I've kept this separate to clearly
> show the impact on the bindings. If using a 'port' node is the preferred
> option, I can squash this patch, if using a 'ports' unconditionally is
> favoured, then I'll just drop it.

Just always use 'ports'.

Rob
