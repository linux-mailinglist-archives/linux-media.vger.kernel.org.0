Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95E4459909F
	for <lists+linux-media@lfdr.de>; Fri, 19 Aug 2022 00:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237817AbiHRWie (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 18:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236627AbiHRWid (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 18:38:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72221BEBE
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 15:38:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AD1A8B;
        Fri, 19 Aug 2022 00:38:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660862307;
        bh=dL+7qdm6EidC2OVH6A7f1WNJn0e4WJZAppgwqohyYOA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rD+zrmb4D7AbdG08pZ0ts3Kmv2Z/Zv7jNFv2sM43ROpU5WPf2TzX1h5Ej6VkRbxIS
         GXUgm2/OGVCcM7MHNHn/f9ubBRbiZLu+RG1vNSsnSTUNyECsXCQn9QGNwW1pylKx57
         oGaRFGm3bVGqUQnItXzDJhGqT3O1HNWos70UhhNk=
Date:   Fri, 19 Aug 2022 01:38:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: Re: imx8m-mini csi-2 limitations
Message-ID: <Yv6/X3ffGwuXmqba@pendragon.ideasonboard.com>
References: <YvpPusE1rOzmgPYN@carbon.k.g>
 <Yv4GEUTj4rMiagAX@p310.k.g>
 <20220818105131.gurtn74av2ilr7bi@uno.localdomain>
 <Yv5cs6Rj3XsqyKsz@p310.k.g>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yv5cs6Rj3XsqyKsz@p310.k.g>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Thu, Aug 18, 2022 at 06:37:23PM +0300, Petko Manolov wrote:
> On 22-08-18 12:51:31, Jacopo Mondi wrote:
> > On Thu, Aug 18, 2022 at 12:27:45PM +0300, Petko Manolov wrote:
> > > 	Hello again,
> > >
> > > After digging down NXP's documentation and reading some comments within 

Please note that the documentation is sometimes confusing and sometimes
incorrect (it would be too easy otherwise, wouldn't it ?).

How to configure the CSIS output bus depends on the SoC integration. If
I recall correctly, all i.MX SoCs that connect the CSIS to a CSI bridge
have the same integration, but when the CSIS is connected to other IP
cores, configuration requirements may vary.

> > > kernel drivers (sorry Jacopo, you've left some nice comments in 
> > > imx7-media-csi.c, hence you're spammed now :) i came to the conclusion that 
> > > mipi-csi to csi-bridge data
> > 
> > No worries.
> > 
> > I tried re-reading all the discussions, but memory still fails me here.
> > 
> > I recall I had an issue with the CSIS bandwidth and somewhere I suggested that 
> > it might be due to the CSI-2 specification version that the peripheral 
> > implemented. I can't find that email anymore though :/
> 
> Well, only bumping up the frequency (to 1ghz) between the CSIS and bridge does 
> not work out of the box.  The latter stopped generating IRQs, which kind of 
> ruined the day for me.  It would be better if i know if that's at all possible, 
> before start debugging the issue.
> 
> > Yes, there has been quite some discussions about how to mix-and-match the 
> > settings between the CSIS (mipi-csi) and the CSI (csi-bridge) [*]
> > 
> > If I recall correctly there are at least three configurations at play:
> > 
> > - The CSIS pixel mode selection
> > 
> >   MIPI_CSI_ISP_CONFIG[13:12]
> 
> Got this one.
> 
> >   The driver currently forces dual pixel sampling mode for YUV422 and report a 
> >   TODO:
> > 
> >   * TODO: Verify which other formats require DUAL (or QUAD) modes.
> > 
> >   Here you're trying to transfer RAW12 data, which is indicated in the 
> >   register documentation as one of the formats suitable for DUAL/QUAD mode 
> >   transfer
> > 
> >   - I'm actually not sure how and if RAW12 gets expanded to 16 bit samples by 
> >     filling the 16-bit word with 0s or it either gets packed in 6 bytes with 
> >     no paddings. Figure "13-33. Pixel alignment" seems to suggest that, but 
> >     I'm not sure I really got that diagram

That would imply a 48-bit bus between the CSIS and the CSI bridge, and I
don't think that's the case.

When reading the CSIS documentation, keep in mind that the IP comes from
a third party (Samsung). The CSIS documentation in the i.MX8MM reference
manual comes from a generic documentation of the IP core, which offers
different output bus widths (among other integration options). It
doesn't precisely describe the synthesis options uses in the i.MX8MM.

> > - The CSI-bridge
> > 
> >   - CSI_CR3[3] SENSOR_16BITS
> >   - CSI_CR18[20] MIPI_DOUBLE_CMP
> 
> Ah, i did not set CSI_CR3 when i (quickly) tried to go to 16bit data width.  
> I'll give it another try based on the above.
> 
> >   The comment in imx7_csi_configure() explains how different versions of YUYV 
> >   (2X8 and 1X16) are handled, and why SENSOR_16BITS and MIPI_DOUBLE_CMP have 
> >   to be enabled when the csi-bridge has to be instructed to sample 16 bits 
> >   samples from the RX queue.
> 
> OK.
> 
> > I guess the key would be here to find out what combination of SINGLE/DUAL/QUAD 
> > sampling is opportune for RAW12 (I would try with DUAL first and then QUAD) 
> > and then configure the csi-bridge bus sampling mode accordingly (likely in the 
> > same was as it is done for YUYV_1X16)
> 
> I've come across this comment in imx-mipi-csis.c left by you earlier this year:
> 
> "Neither of the IP cores connected to the CSIS in i.MX SoCs (CSI bridge or ISI) 
> support quad pixel mode, so this will never work in practice."
> 
> I guess, if true, it doesn't make sense to waste time on quad mode.

To the best of my recollection, that's accurate.

> > When it comes to bandwidth limitation, can you try to reduce the sensor output 
> > size to make sure you chase one issue at the time ?
> 
> I am at Sony's mercy here.  The datasheed it full of holes and i get feeded 
> small bits of information at irregular intervals.  I asked them to provide me 
> with register setup for much slower data rate & pixel clock (at full speed the 
> damn thing is streaming at almost 7gbps), but i'm still waiting...
> 
> > [*] Is "CSI" the most abused acronym of history ?
> 
> Maybe.  I already hate spelling this acronym even in my mind. :)
> 
> > > So i guess there are two questions:
> > >
> > > 	a) can the csi-bridge (and mipi-csi) be persuaded to do two-bytes for
> > > 	raw12 format;
> > 
> > See above :)
> > 
> > > 	b) what's the maximum frequency for csi-bridge PIXCLK?
> > >
> > 
> > Not sure about this one.
> > 
> > I've anyway cc-ed Laurent and Xavier, which can surely be helpful here
> 
> Thanks a bunch, the above information is very helpful.

-- 
Regards,

Laurent Pinchart
