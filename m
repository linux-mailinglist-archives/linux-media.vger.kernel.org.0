Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5284E5BF95F
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 10:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbiIUIff (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 04:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbiIUIfe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 04:35:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F25D157239
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 01:35:32 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1oavCN-0008WV-Eg; Wed, 21 Sep 2022 10:35:15 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1oavCL-0001H2-6Z; Wed, 21 Sep 2022 10:35:13 +0200
Date:   Wed, 21 Sep 2022 10:35:13 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org, jacopo@jmondi.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kieran.bingham+renesas@ideasonboard.com,
        linux-kernel@vger.kernel.org, kishon@ti.com, hverkuil@xs4all.nl,
        vkoul@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
        mchehab@kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 3/4] media: dt-bindings: add bindings for Toshiba
 TC358746
Message-ID: <20220921083513.drt4rggqj7tpaygr@pengutronix.de>
References: <20220916134535.128131-1-m.felsch@pengutronix.de>
 <20220916134535.128131-4-m.felsch@pengutronix.de>
 <YyZTCsflWtUbo2ld@pendragon.ideasonboard.com>
 <20220919100844.bb7tzbql2vpk76xz@pengutronix.de>
 <YyhDO4ohv47uIij2@paasikivi.fi.intel.com>
 <YyhKoDxFoobY9vBd@pendragon.ideasonboard.com>
 <20220920152632.mjpgpmelvx4ya4k7@pengutronix.de>
 <Yyn5MqqKYH7VpFhw@pendragon.ideasonboard.com>
 <74b6b670-747a-f326-44ea-7588c3989b0e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74b6b670-747a-f326-44ea-7588c3989b0e@linaro.org>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-09-21, Krzysztof Kozlowski wrote:
> On 20/09/2022 19:32, Laurent Pinchart wrote:
> >>>
> >>> Explicit bus types in DT indeed makes it easier for drivers, so if a
> >>> device can support multiple bus types (even if not implemented yet in
> >>> the corresponding drivers), the property should be there.
> >>
> >> Okay, I will make it required.
> >>
> >>>> Why do you have hsync-active and vsync-active if both are always zero? Can
> >>>> the hardware not support other configuration?
> >>
> >> Sure the device supports toggling the logic but it is not implemented.
> >> So the bindings needs to enforce it to 0 right now. As soon as it is
> >> implemented & tested, we can say that both is supported :)
> > 
> > Bindings are not supposed to be limited by the existing driver
> > implementation, so you can already allow both polarities, and just
> > reject the unsupported options in the driver at probe time. Future
> > updates to the driver won't require a binding change.
> > 
> 
> +1

I don't wanna do that because this let the binding user assume that
this mode is already supported. Adapting a binding is just 1 commit and
since the property is already existing, there is no breaking change.

Regards,
  Marco
