Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1717667104
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 12:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbjALLfd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 06:35:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbjALLea (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 06:34:30 -0500
X-Greylist: delayed 479 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 12 Jan 2023 03:25:56 PST
Received: from smtp-out-01.comm2000.it (smtp-out-01.comm2000.it [212.97.32.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B60FBB2
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 03:25:55 -0800 (PST)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: francesco@dolcini.it)
        by smtp-out-01.comm2000.it (Postfix) with ESMTPSA id B408E84343D;
        Thu, 12 Jan 2023 12:17:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
        s=mailsrv; t=1673522274;
        bh=qoiMCIEx5Mt5N1J/TFTL5+BhCcqUVBK8t2KYpDfxmvU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=qAyeCYg9E86kbQ+SKApduh3GK/TfnbjzsfpS7AnYjHrO4Z1wKYz5WZW33K4lbQTjs
         oM2pZG+a5E/jbCjMuW8h9secVKmluMTtDUaOXS3QAUSDNHooUCGnH5IhuU7HhicMMn
         rIZepIIbEbr29SignYooDHWsRbZ5zdq52LhcF7VfTONFIHfytMt42dfCenrbZZhhRs
         XdbfHWtHTXnJf9FRLnB69+dJ6JhgDIIMRAI2he7q2gpFyRxFITn12R3XTi+S0AfGgY
         2wwYottSwORJlfeGkxqvFagiKgTmZEtDnkFCaQwoenVKcLwwTpI9DomtIpme1O2dVh
         dVhkZ56gJZ5QQ==
Date:   Thu, 12 Jan 2023 12:17:41 +0100
From:   Francesco Dolcini <francesco@dolcini.it>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Aishwarya Kothari <aishwaryakothari75@gmail.com>,
        linux-media@vger.kernel.org, francesco.dolcini@toradex.com,
        marcel.ziswiler@toradex.com, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: Issue with ov5640 camera sensor on apalis imx6
Message-ID: <Y7/sVZNTf2sGHwbo@francesco-nb.int.toradex.com>
References: <081cc2d3-1f3a-6c14-6dc7-53f976be7b2b@gmail.com>
 <Y5De/R956xERjjP/@pendragon.ideasonboard.com>
 <20221207190529.tkphzyuf7w56t43g@uno.localdomain>
 <1f316bda-5bc7-009c-ee22-a1e72653d58c@gmail.com>
 <20221222132828.pyfgjl57ntwfe4xl@uno.localdomain>
 <0d9748b7-457f-6274-bf3f-3f37944decf4@gmail.com>
 <20230111115038.ncu2kt3jnnn7xotv@uno.localdomain>
 <Y7/c9IVUkC9Mbb7/@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7/c9IVUkC9Mbb7/@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 12, 2023 at 12:12:04PM +0200, Laurent Pinchart wrote:
> On Wed, Jan 11, 2023 at 12:50:38PM +0100, Jacopo Mondi wrote:
> > On Thu, Jan 05, 2023 at 03:35:42PM +0100, Aishwarya Kothari wrote:
> > > Thanks
> > > Reverting the commit 1f391df4 (media: v4l2-async: Use endpoints in
> > > __v4l2_async_nf_add_fwnode_remote()) and setting the format as below works
> > > fine when tested on v6.0 and v6.1
> > > root@apalis-imx6-10774951:~# cat ov5640.sh
> > > media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
> > > media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> > > media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
> > > # Configure pads
> > > media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/1920x1080 field:none]"
> > > media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
> > > media-ctl -V "'ipu1_csi1':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
> > 
> > I reproduced the issue by booting the most recent media tree master on
> > an i.MX6Q board with an ov5640 sensor connected.
> > 
> > Looking at the list of pending async subdevices at the end of the boot
> > sequence (thanks Laurent for letting me know such sysfs attribute
> > existed :)
> > 
> > # cat /sys/kernel/debug/v4l2-async/pending_async_subdevices
> > ipu2_csi1_mux:
> >  [fwnode] dev=21dc000.mipi, node=/soc/bus@2100000/mipi@21dc000/port@4/endpoint
> > ipu1_csi0_mux:
> >  [fwnode] dev=21dc000.mipi, node=/soc/bus@2100000/mipi@21dc000/port@1/endpoint
> > imx6-mipi-csi2:
> > ipu2_csi1:
> > ipu2_csi0:
> > ipu1_csi1:
> >  [fwnode] dev=21dc000.mipi, node=/soc/bus@2100000/mipi@21dc000/port@2/endpoint
> > ipu1_csi0:
> > imx-media:
> > ov5640 2-003c:
> > 
> > it is clear that there are unsatisfied dependencies on subdevices that
> > should be registered by the mipi-csi2 driver.
> > 
> > The mipi-csi2 DTS layout is the following
> > https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/imx6q.dtsi#L486
> > with 1 source port connected to the sensor and 4 sink ports with an
> > endpoint each connected to the 2 muxes and the 2 IPU[1,2] CSI[0,1] (see
> > "Figure 19-1. CSI2IPU gasket connectivity" of the IMX6DQRM TRM).
> > 
> > The CSI-2 driver registers one subdevice only
> > https://elixir.bootlin.com/linux/latest/source/drivers/staging/media/imx/imx6-mipi-csi2.c#L629
> > and with the logic implemented in v4l2_async for heterogeneous
> > matching
> > https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/v4l2-async.c#L79
> > the first driver that probes and that searches from an endpoint in
> > the mipi-csi2 device node gets satisfied while the other 3 will be
> > left pending. That's why you see "ipu2_csi0:" above having no pending
> > subdevs, while "ipu1_csi1:", "ipu1_csi0_mux:" and "ipu2_csi1_mux:"
> > have pending subdevices.
> > 
> > Before commit 1f391df4 (media: v4l2-async: Use endpoints in
> > __v4l2_async_nf_add_fwnode_remote())" all the notifiers in ipu1_csi1,
> > ipu1_csi0_mux, ipu2_csi0 and ipu2_csi1_mux pointed to the same device
> > node "imx6-mipi-csi2". In order to register multiple notifiers with
> > an asd that point the same device node you can see that both the
> > imx-media-csi and video-mux implement a workaround in the form of:
> > 
> > 		asd = v4l2_async_nf_add_fwnode_remote(&vmux->notifier, ep,
> > 						      struct v4l2_async_subdev);
> > 
> > 		fwnode_handle_put(ep);
> > 
> > 		if (IS_ERR(asd)) {
> > 			ret = PTR_ERR(asd);
> > 			/* OK if asd already exists */
> > 			if (ret != -EEXIST)
> > 				return ret;
> > 		}
> > 
> > https://elixir.bootlin.com/linux/latest/source/drivers/staging/media/imx/imx-media-csi.c#L1925
> > https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/video-mux.c#L382
> > 
> > as registering multiple asd with on the same fwnode fails when adding
> > the asd at:
> > https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/v4l2-async.c#L459
> > (thanks again Laurent for spotting this 'workaround')
> > 
> > This can also be seen in the kernel logs when running with 1f391df4
> > reverted and debug enabled on v4l2-async:
> > 
> > [    3.735368] (NULL device *): subdev descriptor already listed in this or other notifiers
> > [    4.242167] (NULL device *): subdev descriptor already listed in this or other notifiers
> > [    4.245655] (NULL device *): subdev descriptor already listed in this or other notifiers
> > 
> > The end result is that a single notifier that points to the mipi_csi2
> > device node is registered instead of 4 notifiers as it happens when
> > matching on endpoints. When the single notifier binds it registers
> > links for all its sink pads (see the _bound callbacks in imx-media-csi
> > and video-mux that call v4l2_create_fwnode_links() and
> > v4l2_create_fwnode_links_to_pad() respectively) and you have a working
> > media-device. Fragile at best as a design, but that's what we'll have
> > to live with I'm afraid.
> > 
> > Now, how to fix this. I tried to think of a way to let the remote
> > subdev decide if it has to be matched on endpoints or device node so
> > that the decision is up to the mipi-csi2 driver. The alternative would
> > be to manually add to the notifier an asd that points to the device
> > node instead of using v4l2_async_nf_add_fwnode_remote(). This would be
> > fine for the imx-mipi-csi component, as it is always paired the
> > mipi-csi2 device so it can safely assume the remote has to be matched
> > on device node.  However the video-mux would have to be modified in
> > the same way, and as it is a generic component we cannot make any
> > assumption on the remote there...
> > 
> > Any ideas ?
> 
> Not any easy one :-S

Wouldn't be the case that we should revert that change till we have a
proper solution in place given that is not going to be an easy fix?
In the end no matter the reason it was working before, this is just a
regression.

Francesco


