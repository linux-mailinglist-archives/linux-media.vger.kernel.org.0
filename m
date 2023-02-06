Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4121A68BAA9
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 11:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjBFKpn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 05:45:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjBFKpl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 05:45:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145F361B0;
        Mon,  6 Feb 2023 02:45:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [109.136.43.56])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81F8D7FE;
        Mon,  6 Feb 2023 11:45:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675680338;
        bh=FGFNJRib2QlX+H+LoX0S7Qjo8ZGpyaK+yzxOUDQ53hg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A1UlZlfFNSgKw6ovRZS7G90vDmIIm648NHdzjQj9eewZM5YgNFmEdKJqmUBr9jJV1
         7a77nZYHXum1E+najsQEfXYeiwGn763SybES/3YUtip5EFfWbmcRVYYtQMP/5PtQVK
         hKkTTw+Ve86HsyUQ3VsoXYehqSAeXBUUtnymgvGc=
Date:   Mon, 6 Feb 2023 12:45:37 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Volodymyr Kharuk <vkh@melexis.com>, linux-media@vger.kernel.org,
        Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/6] media: dt-bindings: media: i2c: Add mlx7502x
 camera sensor binding
Message-ID: <Y+DaUaGqxXQLQq3i@pendragon.ideasonboard.com>
References: <cover.1657786765.git.vkh@melexis.com>
 <712c1acff963238e685cbd5c4a1b91f0ec7f9061.1657786765.git.vkh@melexis.com>
 <Ys/qq4hIQ25KXB2/@pendragon.ideasonboard.com>
 <c87132c4-5801-2f1f-8ef9-3997474cf7a5@linaro.org>
 <Ys/zvH3ICr4zpTLH@pendragon.ideasonboard.com>
 <7e362d83-36c2-00ed-6525-37197ee8e5d7@linaro.org>
 <Ys/6O2H/eDEWYHei@pendragon.ideasonboard.com>
 <20a88191-0c4e-710f-e6ab-4087e5980533@linaro.org>
 <Ys/+KaNltkZZmRE4@pendragon.ideasonboard.com>
 <85cb8f2d-5d8b-ffa9-9f53-0e8bc1233e69@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <85cb8f2d-5d8b-ffa9-9f53-0e8bc1233e69@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

Very late reply, this had fallen through the cracks.

On Thu, Jul 14, 2022 at 01:56:13PM +0200, Krzysztof Kozlowski wrote:
> On 14/07/2022 13:29, Laurent Pinchart wrote:
> > On Thu, Jul 14, 2022 at 01:23:41PM +0200, Krzysztof Kozlowski wrote:
> >> On 14/07/2022 13:12, Laurent Pinchart wrote:
> >>>>>>> One option would be to support the following three compatible values:
> >>>>>>>
> >>>>>>> 	compatible = "melexis,mlx75026", "melexis,mlx7502x";
> >>>>>>> 	compatible = "melexis,mlx75027", "melexis,mlx7502x";
> >>>>>>> 	compatible = "melexis,mlx7502x";
> >>>>>>>
> >>>>>>> The last one only would trigger autodetection. I'm still not sure how to
> >>>>>>> document that properly in bindings though.
> >>>>>>
> >>>>>> I missed that part of binding.
> >>>>>>
> >>>>>> Wildcards are not allowed in compatible, so mlx7502x has to go.
> >>>>>
> >>>>> Really ? We've had fallback generic compatible strings since the
> >>>>> beginning.
> >>>>
> >>>> Fallback generic compatibles are allowed. Wildcards not. Wildcards were
> >>>> actually never explicitly allowed, they just slipped in to many
> >>>> bindings... We have several discussions on this on mailing list, so no
> >>>> real point to repeat the arguments.
> >>>>
> >>>> There is a difference between generic fallback. If the device follows
> >>>> clear specification and version, e.g. "foo-bar-v4", you can use it for
> >>>> generic compatible. This is more common in SoC components. Requirement -
> >>>> there is a clear mapping between versions and SoCs.
> >>>
> >>> I'm not sure to see a clear difference between the two concepts.
> >>
> >> The clear difference is that you have a versioned and re-usable hardware
> >> block plus clear mapping which version goes to which SoC. Version
> >> numbers usually start with 1, not with 75025. 75025 is a model name.
> > 
> > How about Documentation/devicetree/bindings/serial/renesas,scif.yaml for
> > instance, where the version number isn't known and the SoC name is used
> > instead ? Is that acceptable ?
> 
> This is the second case I mentioned - family of devices where the family
> fallback is not allowed to be alone. You cannot use just "renesas,scif"
> in DTS.

OK. Does this mean you are fine with

	compatible = "melexis,mlx75026", "melexis,mlx7502x";
	compatible = "melexis,mlx75027", "melexis,mlx7502x";

where "melexis,mlx7502x" is considered to be the family fallback, but
not

	compatible = "melexis,mlx7502x";

alone ?

> > How should we deal with devices that have different models, where the
> > model is irrelevant to the kernel driver, but relevant to userspace ?
> > Imagine, for instance, a light sensor with 10 models than only differ by
> > the filter they use to tune the sensitivity to different light spectrums
> > ? They are all "compatible" from a software point of view, would the
> > driver need to list all 10 compatible strings ?
> 
> I don't understand that example, I mean, what's the problem here? If
> they are all compatible, you can use only one comaptible, e.g.
> melexis,mlx75026.
> 
> If you ever need to differentiate it for user-space, you add specific
> compatible for the model and you have:
> 
> melexis,mlx75027, melexis,mlx75026
> 
> If user-space needs dedicated compatibles - add them, no one here argues
> to not to use specific compatibles.

OK.

> >>> For cameras, we often deal with complex pipelines with multiple external
> >>> devices and multiple IP cores, with drivers that need to communicate
> >>> with each other to initialize the complete camera system. For instance,
> >>> each camera-related component in the system registers itself in a media
> >>> graph that can be queried from userspace and exposes information about
> >>> all devices, including their model. There's no power up of any device
> >>> when this query is being performed from userspace. It could possibly be
> >>> changed (and maybe it should, for reasons unrelated to this discussion),
> >>> but we're looking at pretty much a complete redesign of V4L2 and MC
> >>> then.
> >>
> >> Is then autodetection a real use case since you have to power up the
> >> sensor each time system boots and this violates privacy? Several I2C
> >> sensors do not care about this and they always do it on power up, so
> >> aren't we solving here something unimportant?
> > 
> > In a laptop or tablet with a camera sensor, you likely don't want
> > autodetection. In an industrial device, you don't care, and having the
> > ability to auto-detect the exact sensor model when booting saves cost in
> > the production chain as a single image can work across different models.
> 
> We talk about the case here, not generic. Do you want to have
> autodetection possible here or not?

I'd like to support auto-detection, but not make it mandatory. Assuming
a family of chips supported by one driver with hardware that makes
auto-detection possible, I have use cases where I specifically don't
want auto-detection as it would have undesirable side effects at probe
time, and other use cases where I want auto-detection as it lowers the
costs in the production chain. I thus need to be able to specify, in DT,
whether to use auto-detection or not, and when not using auto-detection,
specify the exact chip model.

-- 
Regards,

Laurent Pinchart
