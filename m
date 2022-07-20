Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F15757B8F7
	for <lists+linux-media@lfdr.de>; Wed, 20 Jul 2022 16:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240961AbiGTOyX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jul 2022 10:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236357AbiGTOyW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jul 2022 10:54:22 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86435DF7A
        for <linux-media@vger.kernel.org>; Wed, 20 Jul 2022 07:54:21 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id u14so13411137lju.0
        for <linux-media@vger.kernel.org>; Wed, 20 Jul 2022 07:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GBxaS+Rw2Vle09T/tMIK9azudirhVy9SOHc5cji6SFY=;
        b=hv5cO9rW4bNcbgTVTCp7Dfd3dDf1ImSk1AhDwzKs5IJwS912EW+ziRAwuoyPFh49Ip
         Zd3SOyCflYYjtj+agjFDP5BHOcwNmbHJzqKP1DMNQQCIbt8ForGSFJN2RIP+TJs83m9A
         kYoI2xM5AqwvGrTinLsH75+CkE/QrHALu8wQTKt5u0hWfgFfjvJyv9CPUzJ/c7gnZMSq
         zex+lLkXCvGkdNZTCcaUN+mLgNwD81RR3t7WGgtMnvWTNQfab/DmF+JJ5xoAXbIgOaoQ
         4D7zaEdGgsRAZOAFVE3h8H7ODashQcvNuU6Aq8K3VC+JM3LyeG/1PkgutwqqdSVktzLr
         9ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GBxaS+Rw2Vle09T/tMIK9azudirhVy9SOHc5cji6SFY=;
        b=hD5XScqMkLjkEuoQChHsT9sdxbiuiqNGUEPi9ytcsOOnMRQjKcPfDUd3DISFWhdcY/
         G/mlmUa/qgp9e+xNlwKTABbNpdp7klKEiKDhLv92WvY7zn+0eBW0UwMFg1PxNQsvM6fB
         t0t4aunHwRVKoPQX91tti0h8Wl6FAMxAM/cK0/zsNo/oNMJtGQ0vihazddjP1fyw0aDf
         +1fzmuXjpVzwGbe+CB1w3mmgqEc/W7U0LUDiWPR3FzQMCfWKWh17lM3ZR0EDaIuFZA0Q
         hyJPZREYTwzHiSJjU2dSUVonFBayF4njY17HpLB/E57Mofqq6KGLfQauDacX+c8Qb/wW
         4lqA==
X-Gm-Message-State: AJIora8ik+YWlG2scrNxWvxCwnf3RY0i7nWOjWv6qO3Nx+Rj0Uu2/Vpm
        ql6owRxoyu9zG0az3kBvewVO3g==
X-Google-Smtp-Source: AGRyM1uzAE4k+thS1qLyza6m0G3HldGXVrimf6Dvao33IjMoftpCb9gHbr17bHWAcnZ0I0Vn0CFOdg==
X-Received: by 2002:a05:651c:2c1:b0:25d:79be:766a with SMTP id f1-20020a05651c02c100b0025d79be766amr16729111ljo.225.1658328859867;
        Wed, 20 Jul 2022 07:54:19 -0700 (PDT)
Received: from melexis.com ([194.44.50.51])
        by smtp.gmail.com with ESMTPSA id b15-20020a2eb90f000000b0025dd70ecbaasm362202ljb.63.2022.07.20.07.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 07:54:19 -0700 (PDT)
Date:   Wed, 20 Jul 2022 17:54:16 +0300
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/6] media: dt-bindings: media: i2c: Add mlx7502x
 camera sensor binding
Message-ID: <20220720145416.GA46182@melexis.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85cb8f2d-5d8b-ffa9-9f53-0e8bc1233e69@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

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
> 
> > 
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
Thanks for explanation. Now I understand the device tree better and
the whole idea behind it. I'll remove wildcard and autodetect.
Instead I will use of_match_table only.
> 
> 
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
> 
> Best regards,
> Krzysztof

-- 
--
Volodymyr Kharuk
Embedded Software Engineer
Melexis-Ukraine
Mykhaila Kotel'nykova St, 4, Kyiv
Mobile phone: +38 050 346 5527
www.melexis.com
---
The contents of this e-mail are CONFIDENTIAL AND PROPRIETARY. Please read
our disclaimer at http://www.melexis.com/mailpolicy

