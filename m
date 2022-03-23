Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 298B54E4ECE
	for <lists+linux-media@lfdr.de>; Wed, 23 Mar 2022 09:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242969AbiCWJA7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Mar 2022 05:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242418AbiCWJA6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Mar 2022 05:00:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BFD76EB0D
        for <linux-media@vger.kernel.org>; Wed, 23 Mar 2022 01:59:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDE689DE;
        Wed, 23 Mar 2022 09:59:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648025967;
        bh=Jk7+Ty1EK8IVHtF8Arsbx+CWNa8XfINSPXjmQg++3tc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N5nQEJs0AMegGuwkjs+b7SyCIfSgAIlsbHszKEPLUIkIM3gpZJP9vzV5afZ+nJmzL
         HYkS9emOqMGcV5iCpWpZkIdyUdNiSaGOaQVswn2tLgKCvDMLC3LxJVr3cdkbegk7It
         uEu2LkhBGwsJgJKUQbZzQywzqzwU4cSBjM3ksPww=
Date:   Wed, 23 Mar 2022 10:59:09 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
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
Message-ID: <YjrhXefKYaPdx55B@pendragon.ideasonboard.com>
References: <20220224094313.233347-1-jacopo@jmondi.org>
 <7c082420-63f4-0520-21a2-7e10a1e2c321@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7c082420-63f4-0520-21a2-7e10a1e2c321@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Wed, Mar 23, 2022 at 10:51:04AM +0200, Tomi Valkeinen wrote:
> On 24/02/2022 11:42, Jacopo Mondi wrote:
> > v1:
> > https://patchwork.linuxtv.org/project/linux-media/list/?series=7249
> > v2:
> > https://patchwork.linuxtv.org/project/linux-media/list/?series=7311
> > v3:
> > https://patchwork.linuxtv.org/project/linux-media/list/?series=7385
> > v4:
> > https://patchwork.linuxtv.org/project/linux-media/list/?series=7389
> > 
> > A branch for testing based on the most recent media-master is available at
> > https://git.sr.ht/~jmondi_/linux #jmondi/media-master/ov5640-v5
> 
> I tested these with DRA76 EVM & CAL, using CAL's legacy non-MC mode. It 
> doesn't work. I think there are two problems:
> 
> - CAL uses mbus codes like MEDIA_BUS_FMT_UYVY8_2X8 for CSI-2, not 1X16. 
> OV5640 used to support 2X8, but now it doesn't.
> 
> - OV5640 sets the default code to MEDIA_BUS_FMT_UYVY8_2X8, even for 
> CSI-2 where it doesn't support MEDIA_BUS_FMT_UYVY8_2X8.
> 
> I'd like to just change CAL and drop the 2X8 support and instead use 
> 1X16, but then any sensor that uses 2X8 would work. So I guess I need to 
> change the code to support both.

We really need to phase out 2X8 for CSI-2. Can you add a warning in that
case if you support both ?

> Anyway, both of those issues might also surface on other platforms, as 
> ov5640 behavior has changed.

-- 
Regards,

Laurent Pinchart
