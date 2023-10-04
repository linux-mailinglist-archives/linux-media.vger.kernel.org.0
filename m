Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCBC07B8220
	for <lists+linux-media@lfdr.de>; Wed,  4 Oct 2023 16:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242799AbjJDOSi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Oct 2023 10:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233358AbjJDOSg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Oct 2023 10:18:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A9F1BF;
        Wed,  4 Oct 2023 07:18:30 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A485C433C9;
        Wed,  4 Oct 2023 14:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696429110;
        bh=1K/ESMwnOEMlbEG9ktb1fmA9mzOtZ+tcyEgq1mER8VQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EKeXBf043zVs66pXD4O0UHu/p2vS+VtUJoZpZnPe3MFu7kuCfxXHTK/pn5LcZEU+K
         unMw32EXe+VpIjDIvFS3HL9RWjcI1xZGri6/Ze2X3BVT7+nrXnjoTvCJ4Xe3vKcrPt
         Vh6w95bg3VaB7uYsheFHoFDifHDZj3JDsYd8GBKwJPventY43RU5eZgCaLnm24ReOJ
         G3UYBbpdyenoDpKRSiuhBO6FZdh3mswiL7ss4VgqUSWYH5su1IAU0Pxd0uT/mIy8+v
         BoK3t4VzubAhNqdF1P43Vu9RTHmJxX3bk7tmi8BCozslpy8M/+uKGtqr/3w6JK3bTf
         O6ggqxvpyj2uA==
Received: (nullmailer pid 2974241 invoked by uid 1000);
        Wed, 04 Oct 2023 14:18:28 -0000
Date:   Wed, 4 Oct 2023 09:18:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH] dt-bindings: media: renesas,vin: Fix field-even-active
 spelling
Message-ID: <169642910594.2973718.8843179693428717704.robh@kernel.org>
References: <c999eef0a14c8678f56eb698d27b2243e09afed4.1696328563.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c999eef0a14c8678f56eb698d27b2243e09afed4.1696328563.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Tue, 03 Oct 2023 12:22:57 +0200, Geert Uytterhoeven wrote:
> make dt_binding_check:
> 
>     field-active-even: missing type definition
> 
> The property is named "field-even-active", not "field-active-even".
> 
> Fixes: 3ab7801dfab998a2 ("media: dt-bindings: media: rcar-vin: Describe optional ep properties")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/media/renesas,vin.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!

