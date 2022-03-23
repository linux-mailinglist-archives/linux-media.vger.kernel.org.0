Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 018354E5091
	for <lists+linux-media@lfdr.de>; Wed, 23 Mar 2022 11:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239579AbiCWKnj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Mar 2022 06:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240536AbiCWKnh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Mar 2022 06:43:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2647475219
        for <linux-media@vger.kernel.org>; Wed, 23 Mar 2022 03:42:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 900019DE;
        Wed, 23 Mar 2022 11:42:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648032124;
        bh=3x/5292xlkkoMEmBCmCEetJ+epx8ixgrNswUhrL5qM0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hNCwpxPFhaWf7lztJ6yKpqAzX4+uqvBxz7f21SkP8ipFHpFvqV3YMwHSp7xdfJsS/
         xZSzV/Om6RGXY+oPcXNn3yWepTMTDJ+PWYw6ym4asRu3+x8qGj6Rf6yehCarVaCBgL
         +Z66dj/jxV3c9+67sIuGMcFH/VO/wuLl5iGfqT5Y=
Date:   Wed, 23 Mar 2022 12:41:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 00/27] media: ov5640: Rework the clock tree
 programming for MIPI
Message-ID: <Yjr5axPO2oDMUlKJ@pendragon.ideasonboard.com>
References: <20220224094313.233347-1-jacopo@jmondi.org>
 <7c082420-63f4-0520-21a2-7e10a1e2c321@ideasonboard.com>
 <20220323095019.edql22tjb3ea5npx@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220323095019.edql22tjb3ea5npx@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 23, 2022 at 10:50:19AM +0100, Jacopo Mondi wrote:
> Hi Tomi thanks for testing
> 
> On Wed, Mar 23, 2022 at 10:51:04AM +0200, Tomi Valkeinen wrote:
> > Hi Jacopo,
> >
> > On 24/02/2022 11:42, Jacopo Mondi wrote:
> > > v1:
> > > https://patchwork.linuxtv.org/project/linux-media/list/?series=7249
> > > v2:
> > > https://patchwork.linuxtv.org/project/linux-media/list/?series=7311
> > > v3:
> > > https://patchwork.linuxtv.org/project/linux-media/list/?series=7385
> > > v4:
> > > https://patchwork.linuxtv.org/project/linux-media/list/?series=7389
> > >
> > > A branch for testing based on the most recent media-master is available at
> > > https://git.sr.ht/~jmondi_/linux #jmondi/media-master/ov5640-v5
> >
> > I tested these with DRA76 EVM & CAL, using CAL's legacy non-MC mode. It
> > doesn't work. I think there are two problems:
> >
> > - CAL uses mbus codes like MEDIA_BUS_FMT_UYVY8_2X8 for CSI-2, not 1X16.
> > OV5640 used to support 2X8, but now it doesn't.
> >
> > - OV5640 sets the default code to MEDIA_BUS_FMT_UYVY8_2X8, even for CSI-2
> > where it doesn't support MEDIA_BUS_FMT_UYVY8_2X8.
> 
> This might be worth an additional patch that decides what default
> format to use based on the bus type.
> 
> > I'd like to just change CAL and drop the 2X8 support and instead use 1X16,
> > but then any sensor that uses 2X8 would work. So I guess I need to change
> > the code to support both.
> >
> > Anyway, both of those issues might also surface on other platforms, as
> > ov5640 behavior has changed.
> 
> I'm afraid sooner or later this should have happened ?
> 
> I think CSI-2 receivers should be updated, but I share your concerns
> about breaking other platforms.
> 
> On one side we shouldn't be breaking userspace and this change might
> break some assumptions in users' pipeline configuration scripts and
> could prevent drivers that used to work together from being
> compatible at all.
> 
> On the other side we would never be able to change anything at all if
> such a change is expected to happen atomically on all platforms and
> sensors.
> 
> As the change is so trivial I guess it's fair to expect users of
> bridge drivers not compatible with 1X16 to fix them, but I cannot tell
> if it's an acceptable policy or not.
> 
> As Sakari suggested we could also move all CSI-2 transmitters to use 1X16
> and have receivers adjust as soon as someone detects a breakage.
> 
> I can revert the change that restricts the enumerated format to the
> currently in use bus type[1] if desired, but I would prefer receivers
> to adjust when needed. Is this acceptable ?

That would be my preference too. How about implementing Sakari's
suggestion of turning the 2X8 formats into 1X16 in .set_fmt() for CSI-2
? That way we'll minimize any risk of breakage for userspace. Host-side
drivers that use the OV5640 will still need to be converted from 2X8 to
1X16, but that's in-kernel only and should be manageable.

> [1] "media: ov5640: Split DVP and CSI-2 formats

-- 
Regards,

Laurent Pinchart
