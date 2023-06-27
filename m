Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4320073FDAA
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 16:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbjF0OUv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 10:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjF0OUt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 10:20:49 -0400
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C91410FB;
        Tue, 27 Jun 2023 07:20:43 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-78372b896d0so34139639f.2;
        Tue, 27 Jun 2023 07:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687875642; x=1690467642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfMhQxv/tqq5qRWXSfqHV0OsP7qCdcYWK9QnNf2Zs2Q=;
        b=itygGYcYH1wOkz7+Vy2M+pLdV9rGEsdYwZJ3imXP1jT2oN6Kgbw7SUacU3rtGZ+hDG
         SELyGFejna9+INsZN6XYIzQutGYRUc0NTTXPelbqPKYb2qnyaiaA0R80g6ZTTDNJ7pgZ
         MGF+QvG+kwFIhhXyVc/Exa2qx47QbQFeD0GQ7XtcPRcHLNEDpgzpmlNLDoH393Sx/Cvy
         TN8WWzHBGLbzdaUACTFNqfs3bek3VgfjkS8BgKVZm1ZcwGwLEDbw9kp4vQfJpMsLQiky
         34gPJcJRtWyhjITguaURKNBXw19YzmWIu01KvVhfkST5UkJ2YK1QN9IAA1kQGFzu+1Im
         vT+w==
X-Gm-Message-State: AC+VfDwrHtu8+t68Ortn6UiHkFpCXo141BbBPyUgL9mvrGUFqs8mFbCt
        yafcT+iowaTiILUgydBhVQ==
X-Google-Smtp-Source: ACHHUZ7SLW0mgiR2gKe0dOlQ2akkFzOYwTZ2w032utRrALWSg63J2LjZSHDTS+/BC8Ct7GzzJGN7Nw==
X-Received: by 2002:a6b:5905:0:b0:77e:2883:13f3 with SMTP id n5-20020a6b5905000000b0077e288313f3mr32407254iob.14.1687875642644;
        Tue, 27 Jun 2023 07:20:42 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id q2-20020a02a302000000b004291389c449sm1633115jai.5.2023.06.27.07.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 07:20:41 -0700 (PDT)
Received: (nullmailer pid 1866655 invoked by uid 1000);
        Tue, 27 Jun 2023 14:20:39 -0000
Date:   Tue, 27 Jun 2023 08:20:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     guoniu.zhou@oss.nxp.com, linux-media@vger.kernel.org,
        linux-imx@nxp.com, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        xavier.roumegue@oss.nxp.com, kernel@pengutronix.de,
        jacopo.mondi@ideasonboard.com, sakari.ailus@linux.intel.com,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 3/4] media: dt-bindings: media: nxp,imx-isi: i.MX93
 support
Message-ID: <20230627142039.GA1857774-robh@kernel.org>
References: <20230625080916.3553621-1-guoniu.zhou@oss.nxp.com>
 <20230625080916.3553621-4-guoniu.zhou@oss.nxp.com>
 <63eb8605-fa23-fe13-e635-1cfdbcafb5c7@linaro.org>
 <82371522-c062-6fb4-7449-96edeae33a09@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82371522-c062-6fb4-7449-96edeae33a09@linaro.org>
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

On Sun, Jun 25, 2023 at 10:27:08AM +0200, Krzysztof Kozlowski wrote:
> On 25/06/2023 10:22, Krzysztof Kozlowski wrote:
> > On 25/06/2023 10:09, guoniu.zhou@oss.nxp.com wrote:
> >> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> >>
> >> Add i.MX93 support since it reuse ISI which used in i.MX8M family.
> >>
> >> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> > 
> > Subject: Drop duplicated "media:"
> > 
> >> ---
> >>  Documentation/devicetree/bindings/media/nxp,imx-isi.yaml | 5 ++++-
> >>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
> >> index 1ce9440bde32..ddad1d8778f3 100644
> >> --- a/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
> >> +++ b/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
> >> @@ -21,6 +21,7 @@ properties:
> >>      enum:
> >>        - fsl,imx8mn-isi
> >>        - fsl,imx8mp-isi
> >> +      - fsl,imx93-isi
> > 
> > Imx93 is a family of devices, not specific device, so I hope you
> > understand that it is a bit against the recommendation of specific
> > compatibles and you guarantee that all devices within family will be
> > identical.
> 
> 
> And looking more this won't be true. There are significant differences
> between devices in the "imx93" family:
> 1. number of A55 cores and their frequency
> 2. Presence or not of NPU
> 3. MIPI-CSI or Parallel camera
> 4. MIPI-DSI, LVDS or Parallel display
> 5. 1 or 2 Gigabit Ethernet
> 
> Why NXP just cannot follow standard rules here?

That could all be just binning, packaging, or fused options in which 
case a common compatible is fine.

Rob

