Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFE0B667302
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 14:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232596AbjALNRH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 08:17:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjALNRD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 08:17:03 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B479598
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 05:16:59 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id BB8121B001DE;
        Thu, 12 Jan 2023 15:16:53 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1673529413;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=A6zHwTWLLRmRMv1lLIdB9+J3S98BZdM+mjBxi08RGQg=;
        b=RLMEMuo8B5yGBDeTyI9j3nZxw1r6A0ZCp/v9yoxSv/LfLPhw6FGFEd3yDM5xHVlIheFhwA
        +TXCHAaVYFS5cq5Epi3a2sKpcB6fcbFzBTz2RuSe75/J84rMb4vXt1Q+hwj4VLEo/1K++9
        asHJ3Fu1+wVq6frVwpdjXvheDOaQ4BSQmysd8uX+fRyMfgRRI6U2pkQ+Yk7Q0A7wZL6+4z
        us2K2qm5Mgu0UFyZk6Li0P3MIS2j6MQiB9XnryRQ+xgYQ+xDtfTnFtULwYv99qmuBf1wQi
        7gJiaFNAPhaS7SPwVFVE/LezuBy6IV9spDcs/O10yIQ+LKU9yPTP/Py8R112LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1673529413;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=A6zHwTWLLRmRMv1lLIdB9+J3S98BZdM+mjBxi08RGQg=;
        b=ZYqT+cY9BfIyD9l5MbBG/n12VL6i9CDKXvWl126oquK7D4m266paDHy3/0Ck2/LEuhEwx2
        5qvewaUKmPqGNNhi0LuxYEu+gi1rE3r6bgTfIijl8nz39Dj++nFQKu572RV/oPDZ896Qve
        d4zlYgj0EvJtuLxNNS2M83WKX3WnZxVb8I7N2OFAigQc0PEcWWx4nfITP4hjidsyOCGwDq
        aZ6PqK0Ew/KVv8/XPauDL3FHoSYdkYnDlIFKEtbVdokQSPqkPC1GCOI2J33Hi05mFLysLu
        OysqDKswAqNqaAxbxPEgyAiMnvb9aOb0xmypSPyU9N0DejSTewCt+MzJ+Z7iUg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1673529413; a=rsa-sha256;
        cv=none;
        b=BjwGOm1h5ZoOpkhhzRJwYH6UZ3RoO6GrVQNc2RBweEdjaBMXETufabGzE8xa3Rl9JRPFYP
        JkehxILm80F3PBJvKKpI4bLkPeNfNm2z7Gz4QIwGwY8PiJPwxDXkkO22exNUlUq2e7ytIe
        i/ojnYZRdLpyL1Ehil3DgF2t8Qil3AvkCdDm4QiRcz0tW0WrJRdRAnpKfHsf1iT4Zt5gL7
        TkkWcTa4wS/lNqcVa0l5ZbEISGiMHWcAvV0zre5FiAMrxVbTZgIbrPMIiRlOM8PbRxV+YY
        XNtGkCIFQOcyxotDvFpbuOW+YeK6B4+ZSJkJBQwQHFOGKhcxX6AUHpBBrDu5wQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 47F8D634C91;
        Thu, 12 Jan 2023 15:16:53 +0200 (EET)
Date:   Thu, 12 Jan 2023 15:16:52 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Francesco Dolcini <francesco@dolcini.it>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Aishwarya Kothari <aishwaryakothari75@gmail.com>,
        linux-media@vger.kernel.org, francesco.dolcini@toradex.com,
        marcel.ziswiler@toradex.com
Subject: Re: Issue with ov5640 camera sensor on apalis imx6
Message-ID: <Y8AIRPd4RFYmssal@valkosipuli.retiisi.eu>
References: <081cc2d3-1f3a-6c14-6dc7-53f976be7b2b@gmail.com>
 <Y5De/R956xERjjP/@pendragon.ideasonboard.com>
 <20221207190529.tkphzyuf7w56t43g@uno.localdomain>
 <1f316bda-5bc7-009c-ee22-a1e72653d58c@gmail.com>
 <20221222132828.pyfgjl57ntwfe4xl@uno.localdomain>
 <0d9748b7-457f-6274-bf3f-3f37944decf4@gmail.com>
 <20230111115038.ncu2kt3jnnn7xotv@uno.localdomain>
 <Y7/c9IVUkC9Mbb7/@pendragon.ideasonboard.com>
 <Y7/sVZNTf2sGHwbo@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7/sVZNTf2sGHwbo@francesco-nb.int.toradex.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Francesco,

On Thu, Jan 12, 2023 at 12:17:41PM +0100, Francesco Dolcini wrote:
> On Thu, Jan 12, 2023 at 12:12:04PM +0200, Laurent Pinchart wrote:
> > On Wed, Jan 11, 2023 at 12:50:38PM +0100, Jacopo Mondi wrote:
> > > On Thu, Jan 05, 2023 at 03:35:42PM +0100, Aishwarya Kothari wrote:
> > > > Thanks
> > > > Reverting the commit 1f391df4 (media: v4l2-async: Use endpoints in
> > > > __v4l2_async_nf_add_fwnode_remote()) and setting the format as below works
> > > > fine when tested on v6.0 and v6.1
> > > > root@apalis-imx6-10774951:~# cat ov5640.sh
> > > > media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
> > > > media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> > > > media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
> > > > # Configure pads
> > > > media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/1920x1080 field:none]"
> > > > media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
> > > > media-ctl -V "'ipu1_csi1':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
> > > 
> > > I reproduced the issue by booting the most recent media tree master on
> > > an i.MX6Q board with an ov5640 sensor connected.
> > > 
> > > Looking at the list of pending async subdevices at the end of the boot
> > > sequence (thanks Laurent for letting me know such sysfs attribute
> > > existed :)
> > > 
> > > # cat /sys/kernel/debug/v4l2-async/pending_async_subdevices
> > > ipu2_csi1_mux:
> > >  [fwnode] dev=21dc000.mipi, node=/soc/bus@2100000/mipi@21dc000/port@4/endpoint
> > > ipu1_csi0_mux:
> > >  [fwnode] dev=21dc000.mipi, node=/soc/bus@2100000/mipi@21dc000/port@1/endpoint
> > > imx6-mipi-csi2:
> > > ipu2_csi1:
> > > ipu2_csi0:
> > > ipu1_csi1:
> > >  [fwnode] dev=21dc000.mipi, node=/soc/bus@2100000/mipi@21dc000/port@2/endpoint
> > > ipu1_csi0:
> > > imx-media:
> > > ov5640 2-003c:
> > > 
> > > it is clear that there are unsatisfied dependencies on subdevices that
> > > should be registered by the mipi-csi2 driver.
> > > 
> > > The mipi-csi2 DTS layout is the following
> > > https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/imx6q.dtsi#L486
> > > with 1 source port connected to the sensor and 4 sink ports with an
> > > endpoint each connected to the 2 muxes and the 2 IPU[1,2] CSI[0,1] (see
> > > "Figure 19-1. CSI2IPU gasket connectivity" of the IMX6DQRM TRM).
> > > 
> > > The CSI-2 driver registers one subdevice only
> > > https://elixir.bootlin.com/linux/latest/source/drivers/staging/media/imx/imx6-mipi-csi2.c#L629
> > > and with the logic implemented in v4l2_async for heterogeneous
> > > matching
> > > https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/v4l2-async.c#L79
> > > the first driver that probes and that searches from an endpoint in
> > > the mipi-csi2 device node gets satisfied while the other 3 will be
> > > left pending. That's why you see "ipu2_csi0:" above having no pending
> > > subdevs, while "ipu1_csi1:", "ipu1_csi0_mux:" and "ipu2_csi1_mux:"
> > > have pending subdevices.
> > > 
> > > Before commit 1f391df4 (media: v4l2-async: Use endpoints in
> > > __v4l2_async_nf_add_fwnode_remote())" all the notifiers in ipu1_csi1,
> > > ipu1_csi0_mux, ipu2_csi0 and ipu2_csi1_mux pointed to the same device
> > > node "imx6-mipi-csi2". In order to register multiple notifiers with
> > > an asd that point the same device node you can see that both the
> > > imx-media-csi and video-mux implement a workaround in the form of:
> > > 
> > > 		asd = v4l2_async_nf_add_fwnode_remote(&vmux->notifier, ep,
> > > 						      struct v4l2_async_subdev);
> > > 
> > > 		fwnode_handle_put(ep);
> > > 
> > > 		if (IS_ERR(asd)) {
> > > 			ret = PTR_ERR(asd);
> > > 			/* OK if asd already exists */
> > > 			if (ret != -EEXIST)
> > > 				return ret;
> > > 		}
> > > 
> > > https://elixir.bootlin.com/linux/latest/source/drivers/staging/media/imx/imx-media-csi.c#L1925
> > > https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/video-mux.c#L382
> > > 
> > > as registering multiple asd with on the same fwnode fails when adding
> > > the asd at:
> > > https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/v4l2-async.c#L459
> > > (thanks again Laurent for spotting this 'workaround')
> > > 
> > > This can also be seen in the kernel logs when running with 1f391df4
> > > reverted and debug enabled on v4l2-async:
> > > 
> > > [    3.735368] (NULL device *): subdev descriptor already listed in this or other notifiers
> > > [    4.242167] (NULL device *): subdev descriptor already listed in this or other notifiers
> > > [    4.245655] (NULL device *): subdev descriptor already listed in this or other notifiers
> > > 
> > > The end result is that a single notifier that points to the mipi_csi2
> > > device node is registered instead of 4 notifiers as it happens when
> > > matching on endpoints. When the single notifier binds it registers
> > > links for all its sink pads (see the _bound callbacks in imx-media-csi
> > > and video-mux that call v4l2_create_fwnode_links() and
> > > v4l2_create_fwnode_links_to_pad() respectively) and you have a working
> > > media-device. Fragile at best as a design, but that's what we'll have
> > > to live with I'm afraid.
> > > 
> > > Now, how to fix this. I tried to think of a way to let the remote
> > > subdev decide if it has to be matched on endpoints or device node so
> > > that the decision is up to the mipi-csi2 driver. The alternative would
> > > be to manually add to the notifier an asd that points to the device
> > > node instead of using v4l2_async_nf_add_fwnode_remote(). This would be
> > > fine for the imx-mipi-csi component, as it is always paired the
> > > mipi-csi2 device so it can safely assume the remote has to be matched
> > > on device node.  However the video-mux would have to be modified in
> > > the same way, and as it is a generic component we cannot make any
> > > assumption on the remote there...
> > > 
> > > Any ideas ?
> > 
> > Not any easy one :-S
> 
> Wouldn't be the case that we should revert that change till we have a
> proper solution in place given that is not going to be an easy fix?
> In the end no matter the reason it was working before, this is just a
> regression.

V4L2 async has never supported

1. multiple links from an async sub-device or

2. cases where a sub-notifier is a child of more than one parent notifier.

Device dependencies that exist in this hardware would seem to require
adding support for these in V4L2 async.

-- 
Kind regards,

Sakari Ailus
