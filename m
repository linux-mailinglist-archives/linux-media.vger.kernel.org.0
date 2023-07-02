Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2FC4744FA0
	for <lists+linux-media@lfdr.de>; Sun,  2 Jul 2023 20:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjGBSSe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Jul 2023 14:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjGBSSd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Jul 2023 14:18:33 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 279F8A0;
        Sun,  2 Jul 2023 11:18:32 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4QvHNv2SZjzyV2;
        Sun,  2 Jul 2023 21:18:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1688321906;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7lI2A2qjPCBlExV9+ZB1/YBwUAzA2MonmUQlX+M6HBs=;
        b=s0XsxIB64ux6/3Aw16bvgGfQD9LsCPD5Ks6pdoTxXjEcb+pEMfxK1eVNPu/6JuN+DhNx6A
        rZ3/EGyLC1FF+DvsyPFuWUjKDsPFqRN2ipzQ+FiPQw2RZKoghnq3HHMKRsrbT4RRmGfmZE
        b0FS9e53bFuhbPwcmGhH07W6mVfHxNw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1688321906;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7lI2A2qjPCBlExV9+ZB1/YBwUAzA2MonmUQlX+M6HBs=;
        b=Yebic20bYbLNpnn9xFX27i1u+mF32OO/4gU0gMmEOct+BPZN2NzVq5Y3lJGDXdM/IQFPqd
        1TfDnQLWS7ntr8jwu934zgRFAbXiUMDB8moVHaNXB0cnQ3MDVivwN7VrUhjKQiJQYjaLQp
        xNx06WnZrSieH+BcMAc8SPpD3hbsEnE=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1688321906; a=rsa-sha256; cv=none;
        b=EJkAxodtQDmJ7Rh2bT3o0TjsP19zVDTuiweCZbL+jOft+DskktMUQKZFJyiacAW5oNbImI
        yajxfIsJc3ugffje353I3yRL7kA9Lr7oYfUiD6de45kkCuXmDuLzBUAT8+wICko71wwSiF
        QoSN5DzhDsbnrYvKB4RlCBNejNuk3aI=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 47958634C93;
        Sun,  2 Jul 2023 21:18:21 +0300 (EEST)
Date:   Sun, 2 Jul 2023 18:18:21 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        dave.stevenson@raspberrypi.com, devicetree@vger.kernel.org,
        kernel-list@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, lukasz@jany.st,
        mchehab@kernel.org, naush@raspberrypi.com, robh@kernel.org,
        tomi.valkeinen@ideasonboard.com,
        bcm-kernel-feedback-list@broadcom.com, stefan.wahren@i2se.com
Subject: Re: [PATCH v5 04/11] media: bcm2835-unicam: Add support for
 CCP2/CSI2 camera interface
Message-ID: <ZKG/bej80eL13Qqp@valkosipuli.retiisi.eu>
References: <20220208155027.891055-1-jeanmichel.hautbois@ideasonboard.com>
 <20220208155027.891055-5-jeanmichel.hautbois@ideasonboard.com>
 <YhihbncnSlmvrn/D@valkosipuli.retiisi.eu>
 <20230702152356.GA16995@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230702152356.GA16995@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Jul 02, 2023 at 06:23:56PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Fri, Feb 25, 2022 at 11:29:18AM +0200, Sakari Ailus wrote:
> > On Tue, Feb 08, 2022 at 04:50:20PM +0100, Jean-Michel Hautbois wrote:
> > > Add driver for the Unicam camera receiver block on BCM283x processors.
> > > It is represented as two video device nodes: unicam-image and
> > > unicam-embedded which are connected to an internal subdev (named
> > > unicam-subdev) in order to manage streams routing.
> > > 
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > > 
> > > ---
> > > v4:
> > >   - Add the vendor prefox for DT name
> > >   - Use the reg-names in DT parsing
> > >   - Remove MAINTAINERS entry
> > > 
> > > v3 main changes:
> > >   - Change code organization
> > >   - Remove unused variables
> > >   - Correct the fmt_meta functions
> > >   - Rewrite the start/stop streaming
> > >     - You can now start the image node alone, but not the metadata one
> > >     - The buffers are allocated per-node
> > >     - only the required stream is started, if the route exists and is
> > >       enabled
> > >   - Prefix the macros with UNICAM_ to not have too generic names
> > >   - Drop colorspace support
> > >     -> This is causing issues in the try-fmt v4l2-compliance test
> > >   test VIDIOC_G_FMT: OK
> > > 	fail: v4l2-test-formats.cpp(363): colorspace >= 0xff
> > > 	fail: v4l2-test-formats.cpp(465): testColorspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pix.quantization)
> > >   test VIDIOC_TRY_FMT: FAIL
> > > 	fail: v4l2-test-formats.cpp(363): colorspace >= 0xff
> > > 	fail: v4l2-test-formats.cpp(465): testColorspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pix.quantization)
> > >   test VIDIOC_S_FMT: FAIL
> > > 
> > > v2: Remove the unicam_{info,debug,error} macros and use
> > > dev_dbg/dev_err instead.
> > > ---
> > >  drivers/media/platform/Kconfig                |    1 +
> > >  drivers/media/platform/Makefile               |    2 +
> > >  drivers/media/platform/bcm2835/Kconfig        |   21 +
> > >  drivers/media/platform/bcm2835/Makefile       |    3 +
> > >  .../platform/bcm2835/bcm2835-unicam-regs.h    |  253 ++
> > >  .../media/platform/bcm2835/bcm2835-unicam.c   | 2570 +++++++++++++++++
> > >  6 files changed, 2850 insertions(+)
> > >  create mode 100644 drivers/media/platform/bcm2835/Kconfig
> > >  create mode 100644 drivers/media/platform/bcm2835/Makefile
> > >  create mode 100644 drivers/media/platform/bcm2835/bcm2835-unicam-regs.h
> > >  create mode 100644 drivers/media/platform/bcm2835/bcm2835-unicam.c
> 
> [snip]
> 
> > > diff --git a/drivers/media/platform/bcm2835/bcm2835-unicam-regs.h b/drivers/media/platform/bcm2835/bcm2835-unicam-regs.h
> > > new file mode 100644
> > > index 000000000000..b8d297076a02
> > > --- /dev/null
> > > +++ b/drivers/media/platform/bcm2835/bcm2835-unicam-regs.h
> 
> [snip]
> 
> > > +static int unicam_connect_of_subdevs(struct unicam_device *unicam)
> > > +{
> > > +	struct v4l2_fwnode_endpoint ep = { };
> > > +	struct fwnode_handle *ep_handle;
> > > +	struct v4l2_async_subdev *asd;
> > > +	unsigned int lane;
> > > +	int ret = -EINVAL;
> > > +
> > > +	if (of_property_read_u32(unicam->dev->of_node, "brcm,num-data-lanes",
> > > +				 &unicam->max_data_lanes) < 0) {
> > 
> > As you're already using fwnode API below, you could use
> > device_property_read_u32() here.
> > 
> > You can then replace of_device.h by mod_devicetable.h. Up to you.
> > 
> > > +		dev_err(unicam->dev, "DT property %s not set\n",
> > > +			"brcm,num-data-lanes");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	/* Get the local endpoint and remote device. */
> > > +	ep_handle = fwnode_graph_get_endpoint_by_id(dev_fwnode(unicam->dev),
> > > +						    0, 0,
> > > +						    FWNODE_GRAPH_ENDPOINT_NEXT);
> > > +	if (!ep_handle) {
> > > +		dev_err(unicam->dev, "No endpoint\n");
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	/* Parse the local endpoint and validate its configuration. */
> > > +	if (v4l2_fwnode_endpoint_alloc_parse(ep_handle, &ep)) {
> > 
> > As you don't need link-frequencies property parsing, you should use
> > v4l2_fwnode_endpoint_parse(). That avoids having to call
> > v4l2_fwnode_endpoint_free().
> > 
> > > +		dev_err(unicam->dev, "could not parse endpoint\n");
> > > +		goto cleanup_exit;
> > > +	}
> > > +
> > > +	dev_dbg(unicam->dev, "parsed local endpoint, bus_type %u\n",
> > > +		ep.bus_type);
> > > +
> > > +	unicam->bus_type = ep.bus_type;
> > > +
> > > +	switch (ep.bus_type) {
> > > +	case V4L2_MBUS_CSI2_DPHY:
> > > +		switch (ep.bus.mipi_csi2.num_data_lanes) {
> > > +		case 1:
> > > +		case 2:
> > > +		case 4:
> > > +			break;
> > > +
> > > +		default:
> > > +			dev_err(unicam->dev, "%u data lanes not supported\n",
> > > +				ep.bus.mipi_csi2.num_data_lanes);
> > > +			goto cleanup_exit;
> > > +		}
> > > +
> > > +		for (lane = 0; lane < ep.bus.mipi_csi2.num_data_lanes; lane++) {
> > > +			if (ep.bus.mipi_csi2.data_lanes[lane] != lane + 1) {
> > > +				dev_err(unicam->dev, "data lanes reordering not supported\n");
> > > +				goto cleanup_exit;
> > > +			}
> > > +		}
> > > +
> > > +		if (ep.bus.mipi_csi2.num_data_lanes > unicam->max_data_lanes) {
> > > +			dev_err(unicam->dev, "endpoint requires %u data lanes when %u are supported\n",
> > > +				ep.bus.mipi_csi2.num_data_lanes,
> > > +				unicam->max_data_lanes);
> > > +		}
> > > +
> > > +		unicam->active_data_lanes = ep.bus.mipi_csi2.num_data_lanes;
> > > +		unicam->bus_flags = ep.bus.mipi_csi2.flags;
> > > +
> > > +		break;
> > > +
> > > +	case V4L2_MBUS_CCP2:
> > > +		if (ep.bus.mipi_csi1.clock_lane != 0 ||
> > > +		    ep.bus.mipi_csi1.data_lane != 1) {
> > > +			dev_err(unicam->dev, "unsupported lanes configuration\n");
> > 
> > If the hardware doesn't support lane remapping for CCP2, then that should
> > be reflected in DT bindings, i.e. data-lanes isn't relevant. There's no
> > need to check that here.
> 
> Should the above check for CSI-2 be dropped as well then ?

Same for CSI-2, too: if there's nothing to configure there (lane remapping)
there's no need to validate that part of the DT either.

> 
> > > +			goto cleanup_exit;
> > > +		}
> > > +
> > > +		unicam->max_data_lanes = 1;
> > > +		unicam->active_data_lanes = 1;
> > > +		unicam->bus_flags = ep.bus.mipi_csi1.strobe;
> > > +		break;
> > > +
> > > +	default:
> > > +		/* Unsupported bus type */
> > > +		dev_err(unicam->dev, "unsupported bus type %u\n",
> > > +			ep.bus_type);
> > > +		goto cleanup_exit;
> > > +	}
> > > +
> > > +	dev_dbg(unicam->dev, "%s bus, %u data lanes, flags=0x%08x\n",
> > > +		unicam->bus_type == V4L2_MBUS_CSI2_DPHY ? "CSI-2" : "CCP2",
> > > +		unicam->active_data_lanes, unicam->bus_flags);
> > 
> > V4l2-fwnode already prints this information I believe.
> 
> True. It does so with pr_debug() though, it would be nice to use
> dev_dbg(). That's a candidate for a separate fix of course.

The reason for using pr_debug() is that the device isn't used by the fwnode
framework. Would you add that just for debug prints? Note that the device
nodes themselves are already being printed so it adds little to the
usefulness of the messages.

-- 
Kind regards,

Sakari Ailus
