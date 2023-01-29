Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 968FC67FED0
	for <lists+linux-media@lfdr.de>; Sun, 29 Jan 2023 13:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjA2MLj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Jan 2023 07:11:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjA2MLi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Jan 2023 07:11:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E72813527;
        Sun, 29 Jan 2023 04:11:38 -0800 (PST)
Received: from ideasonboard.com (host-212-171-97-20.retail.telecomitalia.it [212.171.97.20])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5316F327;
        Sun, 29 Jan 2023 13:11:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674994296;
        bh=OS1g3id9yLFElSxgnIR6E5bjNpHr/fm+bGWQodV9fuM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l1mVsCsc2NlTDzRy1KiLkOC+kWlmKatV00F9a7gt+wnqwuTrCttKApKAXPgfmV8L4
         g4ZS51XbWLzBd3Eaz9vWNK3wrWuwEPP3kx7UorrMkx9TCK7VmA6dSy0HUzpLvz07Xx
         FV38lP/ouZubLRYxJ094AirxY+VKOtJDrJImhiKw=
Date:   Sun, 29 Jan 2023 13:11:32 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        chiranjeevi.rapolu@intel.com, luca@z3ntu.xyz, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6.1] media: dt-bindings: Add OV5670
Message-ID: <20230129121132.uamuvywdsuah5ivn@uno.localdomain>
References: <20230126165909.121302-2-jacopo.mondi@ideasonboard.com>
 <20230128112736.8000-1-jacopo.mondi@ideasonboard.com>
 <b4794490-b059-373a-dec0-58fcd2344f6f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b4794490-b059-373a-dec0-58fcd2344f6f@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jan 29, 2023 at 12:40:03PM +0100, Krzysztof Kozlowski wrote:
> On 28/01/2023 12:27, Jacopo Mondi wrote:
> > Add the bindings documentation for Omnivision OV5670 image sensor.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> > v6->6.1
> > - Use additionalProperties: false for endpoint properties from
> >   video-interfaces.yaml
> > - List 'remote-endpoint' among the accepted endpoint properties
> >   now that we use additionalProperties: false
>
> b4 diff '20230128112736.8000-1-jacopo.mondi@ideasonboard.com'
> Could not create fake-am range for lower series v1
>
> Can you send patches in a way it does not break out workflows? Why
> making our review process more difficult?

Because it's a nit on a 10 patches series with no other changes
requested ?

What is difficult exactly ?

I see several patches in linux-media being sent inline to a previous
version for small fixes if the only required changed is a nit like
this one.


> Best regards,
> Krzysztof
>
