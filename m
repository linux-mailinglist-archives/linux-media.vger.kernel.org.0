Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA0B168C5E4
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 19:35:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbjBFSfx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 13:35:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbjBFSfw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 13:35:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1ED2B60F;
        Mon,  6 Feb 2023 10:35:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [109.136.43.56])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1823E88E;
        Mon,  6 Feb 2023 19:35:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675708548;
        bh=mIdJ+Y/n4cj8mqda3qys/2rWYaFQFIQmefPq0XDNoXA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vdnfiiObMb3DIy65SWo4D+yATJTu5Y4eYPOocvGUtXwvXzslqBdrNZNlvrgGUAShA
         STJ2FDA1Cb4Lx9ejqzuPIcnyugta4IGVcwOKhNnxvhtAsmzI/RGCZ8fsQdB0mVL+A2
         IuhBgutb/EOSLZJ3BHqAZ5Q8Y0lRvMnUu1eGoU0Y=
Date:   Mon, 6 Feb 2023 20:35:46 +0200
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
Message-ID: <Y+FIgu01vjc0MQiG@pendragon.ideasonboard.com>
References: <Ys/qq4hIQ25KXB2/@pendragon.ideasonboard.com>
 <c87132c4-5801-2f1f-8ef9-3997474cf7a5@linaro.org>
 <Ys/zvH3ICr4zpTLH@pendragon.ideasonboard.com>
 <7e362d83-36c2-00ed-6525-37197ee8e5d7@linaro.org>
 <Ys/6O2H/eDEWYHei@pendragon.ideasonboard.com>
 <20a88191-0c4e-710f-e6ab-4087e5980533@linaro.org>
 <Ys/+KaNltkZZmRE4@pendragon.ideasonboard.com>
 <85cb8f2d-5d8b-ffa9-9f53-0e8bc1233e69@linaro.org>
 <Y+DaUaGqxXQLQq3i@pendragon.ideasonboard.com>
 <45b9574d-a146-fec0-02cc-714ff8ddc469@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <45b9574d-a146-fec0-02cc-714ff8ddc469@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Mon, Feb 06, 2023 at 07:20:21PM +0100, Krzysztof Kozlowski wrote:
> On 06/02/2023 11:45, Laurent Pinchart wrote:
> > On Thu, Jul 14, 2022 at 01:56:13PM +0200, Krzysztof Kozlowski wrote:
> >> On 14/07/2022 13:29, Laurent Pinchart wrote:
> >>> On Thu, Jul 14, 2022 at 01:23:41PM +0200, Krzysztof Kozlowski wrote:
> >>>> On 14/07/2022 13:12, Laurent Pinchart wrote:
> >>>>>>>>> One option would be to support the following three compatible values:
> >>>>>>>>>
> >>>>>>>>> 	compatible = "melexis,mlx75026", "melexis,mlx7502x";
> >>>>>>>>> 	compatible = "melexis,mlx75027", "melexis,mlx7502x";
> >>>>>>>>> 	compatible = "melexis,mlx7502x";
> >>>>>>>>>
> >>>>>>>>> The last one only would trigger autodetection. I'm still not sure how to
> >>>>>>>>> document that properly in bindings though.
> >>>>>>>>
> >>>>>>>> I missed that part of binding.
> >>>>>>>>
> >>>>>>>> Wildcards are not allowed in compatible, so mlx7502x has to go.
> >>>>>>>
> >>>>>>> Really ? We've had fallback generic compatible strings since the
> >>>>>>> beginning.
> >>>>>>
> >>>>>> Fallback generic compatibles are allowed. Wildcards not. Wildcards were
> >>>>>> actually never explicitly allowed, they just slipped in to many
> >>>>>> bindings... We have several discussions on this on mailing list, so no
> >>>>>> real point to repeat the arguments.
> >>>>>>
> >>>>>> There is a difference between generic fallback. If the device follows
> >>>>>> clear specification and version, e.g. "foo-bar-v4", you can use it for
> >>>>>> generic compatible. This is more common in SoC components. Requirement -
> >>>>>> there is a clear mapping between versions and SoCs.
> >>>>>
> >>>>> I'm not sure to see a clear difference between the two concepts.
> >>>>
> >>>> The clear difference is that you have a versioned and re-usable hardware
> >>>> block plus clear mapping which version goes to which SoC. Version
> >>>> numbers usually start with 1, not with 75025. 75025 is a model name.
> >>>
> >>> How about Documentation/devicetree/bindings/serial/renesas,scif.yaml for
> >>> instance, where the version number isn't known and the SoC name is used
> >>> instead ? Is that acceptable ?
> >>
> >> This is the second case I mentioned - family of devices where the family
> >> fallback is not allowed to be alone. You cannot use just "renesas,scif"
> >> in DTS.
> > 
> > OK. Does this mean you are fine with
> > 
> > 	compatible = "melexis,mlx75026", "melexis,mlx7502x";
> > 	compatible = "melexis,mlx75027", "melexis,mlx7502x";
> > 
> > where "melexis,mlx7502x" is considered to be the family fallback, but
> > not
> > 
> > 	compatible = "melexis,mlx7502x";
> > 
> > alone ?
> 
> Correct.
> 
> (...)
> 
> >>>
> >>> In a laptop or tablet with a camera sensor, you likely don't want
> >>> autodetection. In an industrial device, you don't care, and having the
> >>> ability to auto-detect the exact sensor model when booting saves cost in
> >>> the production chain as a single image can work across different models.
> >>
> >> We talk about the case here, not generic. Do you want to have
> >> autodetection possible here or not?
> > 
> > I'd like to support auto-detection, but not make it mandatory. Assuming
> > a family of chips supported by one driver with hardware that makes
> > auto-detection possible, I have use cases where I specifically don't
> > want auto-detection as it would have undesirable side effects at probe
> > time, and other use cases where I want auto-detection as it lowers the
> > costs in the production chain. I thus need to be able to specify, in DT,
> > whether to use auto-detection or not, and when not using auto-detection,
> > specify the exact chip model.
> 
> OK, I understand. This however stretches the Devicetree approach - you
> are putting OS policy of device probing into the DT binding. What's
> more, it serves only Linux' purpose. If other OS/software is fine with
> auto-detection on first use (thus no privacy concerns), then all this
> discussion is not relevant. The binding is independent of OS, thus we
> should not align it to our specific OS behavior.
> 
> Maybe Linux needs some generic runtime knob to turn on/off autodetection
> for all devices. It does not look like a job for DT.

If we want to be able to run without auto-detection, regardless of the
operating system, we need to specify the exact model in DT, otherwise a
driver wouldn't be able to identify the device.

If we want to use auto-detection, that's for the purpose of simplifying
system integration, with a single DT that covers multiple device
variants.

Those two use cases thus require DT binding that allow for both options,
specifying an exact model, or being more generic. I agree that deciding
to auto-detect based on what compatible strings are specified may be
specific to a particular Linux driver, but the fact that we need the two
options to support both use cases isn't OS-specific in my opinion.

-- 
Regards,

Laurent Pinchart
