Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEE07061E7
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 09:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbjEQH6X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 03:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbjEQH6O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 03:58:14 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A989DE7C
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 00:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1684310282; x=1715846282;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XeTGRo4nCYEE+hM7fE6QO/ij+6yEuygXsJVpL45zd+M=;
  b=AH6OhK62A360+K5fMIkakyucJYoVTWoAHGbM/XTlRYt4IbYifJOuwt35
   sMfSEsSmPzRO/xcrYp+1MefInTc143Tl4mNVKin/jBneacmfBzzdIKXpI
   EJKqR/RtIX7iiZN3PS4D8vse/QTTz2Rl6AYGPMT5+0v+kSomsRv9cAXnW
   JAqJHs88PTuUF5cVif//kpl15pfmPjoPXcfcBYr2v6X50NASmGkjxhU6G
   wv2GRrnrWA5CCXBLHF5ttRMEbO+mtg3mgpKLaAHPh9YjWyjwo6tGAX+Z5
   5POOD8mkq8pif9Ifxc+595wkSxy5+fq1ag4CG/tNe4NP8ul54JnzMa4HE
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,281,1677538800"; 
   d="scan'208";a="30952523"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 17 May 2023 09:58:00 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 17 May 2023 09:58:00 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 17 May 2023 09:58:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1684310280; x=1715846280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XeTGRo4nCYEE+hM7fE6QO/ij+6yEuygXsJVpL45zd+M=;
  b=XzYWCO2chdNFXVfsDl74nA+QJyiLe0G8WJgvLunJHFjXwI9COMJ87MN1
   P7JVxCjNvprjABQurwXF/xXqOdea3bThd8ZpJmaTO9Mh1MnLY8OujSb2f
   rkCCO9EejaAULyXZaq4fyCfbIosK12y35Sp3P7vBw15MlU3SnR0XFfvax
   maa3K+Eb68odScnpgZbXPGRLFvwoQAIDPXsVnzZH7uKEbKcWPHL0PTHTJ
   8mI+c/CEP7K+dzZQiLc8sC1lDiQUCW99clgaenLSFXzheYfVv5dDd6PgM
   wECwVNaLfSZDmWv1uihrKqTHk8mzVF/MQ69OiensF3F1VfUZqVxQri/F6
   w==;
X-IronPort-AV: E=Sophos;i="5.99,281,1677538800"; 
   d="scan'208";a="30952522"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 May 2023 09:58:00 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 37C5A280087;
        Wed, 17 May 2023 09:58:00 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: Re: [PATCH v2 00/31] Separate links and async sub-devices
Date:   Wed, 17 May 2023 09:57:59 +0200
Message-ID: <3501011.QJadu78ljV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

thanks for the update. That's awesome, device setup on media-ctl works agai=
n=20
on TQMa6x (i.MX6).
=46or the record, below is what the media-ctl dot looks like. I was able to=
=20
capture data on ipu1_csi0_capture device.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> #imx6q

Best regards,
Alexander

=2D-8<--
digraph board {
	rankdir=3DTB
	n00000001 [label=3D"{{<port0> 0} | ipu1_csi0\n/dev/v4l-subdev0 |=20
{<port1> 1 | <port2> 2}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgre=
en]
	n00000001:port2 -> n00000005
	n00000001:port1 -> n0000000f:port0 [style=3Ddashed]
	n00000001:port1 -> n0000000b:port0 [style=3Ddashed]
	n00000005 [label=3D"ipu1_csi0 capture\n/dev/video4", shape=3Dbox,=20
style=3Dfilled, fillcolor=3Dyellow]
	n0000000b [label=3D"{{<port0> 0 | <port1> 1} | ipu1_vdic\n/dev/v4l-
subdev1 | {<port2> 2}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
	n0000000b:port2 -> n0000000f:port0 [style=3Ddashed]
	n0000000f [label=3D"{{<port0> 0} | ipu1_ic_prp\n/dev/v4l-subdev2 |=20
{<port1> 1 | <port2> 2}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgre=
en]
	n0000000f:port1 -> n00000013:port0 [style=3Ddashed]
	n0000000f:port2 -> n0000001c:port0 [style=3Ddashed]
	n00000013 [label=3D"{{<port0> 0} | ipu1_ic_prpenc\n/dev/v4l-subdev3 |=20
{<port1> 1}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
	n00000013:port1 -> n00000016 [style=3Ddashed]
	n00000016 [label=3D"ipu1_ic_prpenc capture\n/dev/video5", shape=3Dbox,=20
style=3Dfilled, fillcolor=3Dyellow]
	n0000001c [label=3D"{{<port0> 0} | ipu1_ic_prpvf\n/dev/v4l-subdev4 |=20
{<port1> 1}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
	n0000001c:port1 -> n0000001f [style=3Ddashed]
	n0000001f [label=3D"ipu1_ic_prpvf capture\n/dev/video6", shape=3Dbox,=20
style=3Dfilled, fillcolor=3Dyellow]
	n0000002f [label=3D"{{<port0> 0 | <port1> 1} | ipu1_csi0_mux\n/dev/
v4l-subdev5 | {<port2> 2}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dg=
reen]
	n0000002f:port2 -> n00000001:port0
	n00000035 [label=3D"{{<port0> 0} | imx6-mipi-csi2\n/dev/v4l-subdev6 |=20
{<port1> 1 | <port2> 2 | <port3> 3 | <port4> 4}}", shape=3DMrecord,=20
style=3Dfilled, fillcolor=3Dgreen]
	n00000035:port1 -> n0000002f:port0
	n00000035:port2 -> n00000041:port0 [style=3Ddashed]
	n00000035:port3 -> n00000051:port0 [style=3Ddashed]
	n00000035:port4 -> n0000008f:port0 [style=3Ddashed]
	n0000003d [label=3D"{{} | tc358743 0-000f\n/dev/v4l-subdev7 | {<port0>=20
0}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
	n0000003d:port0 -> n00000035:port0
	n00000041 [label=3D"{{<port0> 0} | ipu1_csi1\n/dev/v4l-subdev8 |=20
{<port1> 1 | <port2> 2}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgre=
en]
	n00000041:port2 -> n00000045 [style=3Ddashed]
	n00000041:port1 -> n0000000f:port0 [style=3Ddashed]
	n00000041:port1 -> n0000000b:port0 [style=3Ddashed]
	n00000045 [label=3D"ipu1_csi1 capture\n/dev/video7", shape=3Dbox,=20
style=3Dfilled, fillcolor=3Dyellow]
	n00000051 [label=3D"{{<port0> 0} | ipu2_csi0\n/dev/v4l-subdev9 |=20
{<port1> 1 | <port2> 2}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgre=
en]
	n00000051:port2 -> n00000055 [style=3Ddashed]
	n00000051:port1 -> n0000005f:port0 [style=3Ddashed]
	n00000051:port1 -> n0000005b:port0 [style=3Ddashed]
	n00000055 [label=3D"ipu2_csi0 capture\n/dev/video8", shape=3Dbox,=20
style=3Dfilled, fillcolor=3Dyellow]
	n0000005b [label=3D"{{<port0> 0 | <port1> 1} | ipu2_vdic\n/dev/v4l-
subdev10 | {<port2> 2}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgree=
n]
	n0000005b:port2 -> n0000005f:port0 [style=3Ddashed]
	n0000005f [label=3D"{{<port0> 0} | ipu2_ic_prp\n/dev/v4l-subdev11 |=20
{<port1> 1 | <port2> 2}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgre=
en]
	n0000005f:port1 -> n00000063:port0 [style=3Ddashed]
	n0000005f:port2 -> n0000006c:port0 [style=3Ddashed]
	n00000063 [label=3D"{{<port0> 0} | ipu2_ic_prpenc\n/dev/v4l-subdev12 |=20
{<port1> 1}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
	n00000063:port1 -> n00000066 [style=3Ddashed]
	n00000066 [label=3D"ipu2_ic_prpenc capture\n/dev/video9", shape=3Dbox,=20
style=3Dfilled, fillcolor=3Dyellow]
	n0000006c [label=3D"{{<port0> 0} | ipu2_ic_prpvf\n/dev/v4l-subdev13 |=20
{<port1> 1}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
	n0000006c:port1 -> n0000006f [style=3Ddashed]
	n0000006f [label=3D"ipu2_ic_prpvf capture\n/dev/video10", shape=3Dbox,=20
style=3Dfilled, fillcolor=3Dyellow]
	n00000081 [label=3D"{{<port0> 0} | ipu2_csi1\n/dev/v4l-subdev14 |=20
{<port1> 1 | <port2> 2}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgre=
en]
	n00000081:port2 -> n00000085 [style=3Ddashed]
	n00000081:port1 -> n0000005f:port0 [style=3Ddashed]
	n00000081:port1 -> n0000005b:port0 [style=3Ddashed]
	n00000085 [label=3D"ipu2_csi1 capture\n/dev/video11", shape=3Dbox,=20
style=3Dfilled, fillcolor=3Dyellow]
	n0000008f [label=3D"{{<port0> 0 | <port1> 1} | ipu2_csi1_mux\n/dev/
v4l-subdev15 | {<port2> 2}}", shape=3DMrecord, style=3Dfilled, fillcolor=3D=
green]
	n0000008f:port2 -> n00000081:port0 [style=3Ddashed]
}
=2D-8<--

Am Dienstag, 16. Mai 2023, 11:54:46 CEST schrieb Sakari Ailus:
> Hi all,
>=20
> This set adds support for multiple downstream links in an async
> sub-device, by separating the sub-device registration from the link
> creation.
>=20
> A new concept, V4L2 async connection is added. A connection later on
> translates to an MC ancillary or data link. Generally async notifiers have
> a number of connections but at that level there is no knowledge of how
> many sub-devices they will connect to. The bound and unbound callbacks now
> work on connections. For the existing drivers there's only one connection
> so I do not expect regressions because of that.
>=20
> Async sub-device fwnode matching will now take place between the device
> (the dev field of struct v4l2_subdev) and a struct v4l2_async_connection
> (an endpoint for devices that have endpoints or the device for those that
> do not). This is because the graph data structure only describes
> point-to-point connections so therefore defining one end of the connection
> defines the entire connection.
>=20
> This set is unlikely to address all needs people have related to the async
> framework but I think that beyond what it does, it paves some way for
> addressing more of those additional needs.
>=20
> To be frank, I'd like to get rid of the entire V4L2 async framework, but
> it would require allowing much more dynamic driver initialisation,
> including sub-devices and device nodes popping up in the system in the
> order and extent there is successfully probed hardware. Until that, and
> this may well be the entire foreseeable future, we have at least some of
> this complexity.
>=20
> since v1:
>=20
> - Fixed object relation issues. The set has now been tested on an
>   async sub-device with two pads connected by data links to sub-devices on
>   a notifier (struct) device. (Multiple notifiers should work, too, but
>   has not been tested.)
>=20
> - Add a function to obtain an async connection based on the sub-device.
>   This is useful for drivers for accessing their own link specific data.
>=20
> - Improved documentation. Include a patch documenting
>   v4l2_async_nf_add_fwnode().
>=20
> - Return endpoint matching and address adv748x driver breakage in v1. It's
>   a special case so other drivers can remain simpler.
>=20
> - Swap notifier initialisation arguments, by making the notifier the first
>   argument.
>=20
> - Remove extra fwnode_handle_put() in max9286_v4l2_unregister().
>=20
> - Make struct device available before notifier initialisation for
>   consistent debug messages.
>=20
> - Simplify notifier and async sub-device linked lists. Consistent list
>   head and list entry naming.
>=20
> - Drop leftovers from an early experimenation work in rkisp1 and omap3isp
>   drivers.
>=20
> - Simplify xilinx-vipp sub-device binding.
>=20
> - Use if()s in notifier_dev() of v4l2-async.c.
>=20
> - Improved debug messages in v4l2-async.c, use v4l2-async prefix and
>   generally with notifier device.
>=20
> - Call match types with macros V4L2_ASYNC_MATCH_TYPE_* (was
>   V4L2_ASYNC_MATCH_*).
>=20
> - Create ancillary links only when the sub-device is registered, not when
>   a connection is bound (which can take place more than once for a
>   sub-device).
>=20
> - Rename struct v4l2_async_match as v4l2_async_match_desc.
>=20
> - Perform list initialisation in notifier init rather than registration.
>=20
> - Get rid of the "readd" parameter for v4l2_async_nf_unbind_all_subdevs().
>=20
> - Check async sub-device validity on a notifier only when the notifier is
>   registered. This removes extra list traversal and simplifies the code.
>=20
> - Remove extra list initialisation in v4l2_async_register_subdev().
>=20
> - Drop v4l2_async_cleanup(). It was no longer useful, called from a single
>   place.
>=20
> - Lots of kerneldoc fixes (mostly changed argument names).
>=20
> since RFC v1:
>=20
> - Address missing API usage changes in a lot of drivers.
>=20
> - Fix compilation problems in intermediate patches.
>=20
> - Move V4L2 device registration earlier or move notifier initialisation
>   and fwnode endpoint parsing past the current V4L2 device registration
>   (patches 11--16).
>=20
> Jacopo Mondi (1):
>   media: v4l: async: Drop v4l2_async_nf_parse_fwnode_endpoints()
>=20
> Sakari Ailus (30):
>   media: Documentation: v4l: Document missing async subdev function
>   media: xilinx-vipp: Clean up bound async notifier callback
>   media: v4l: async: Add some debug prints
>   media: v4l: async: Clean testing for duplicated async subdevs
>   media: v4l: async: Drop unneeded list entry initialisation
>   media: v4l: async: Don't check whether asd is NULL in validity check
>   media: v4l: async: Make V4L2 async match information a struct
>   media: v4l: async: Rename V4L2_ASYNC_MATCH_ macros, add TYPE_
>   media: v4l: async: Only pass match information for async subdev
>     validation
>   media: v4l: async: Clean up list heads and entries
>   media: v4l: async: Simplify async sub-device fwnode matching
>   media: v4l: async: Rename v4l2_async_subdev as v4l2_async_connection
>   media: v4l: async: Clean up error handling in v4l2_async_match_notify
>   media: v4l: async: Drop duplicate handling when adding connections
>   media: v4l: async: Rework internal lists
>   media: v4l: async: Obtain async connection based on sub-device
>   media: v4l: async: Differentiate connecting and creating sub-devices
>   media: v4l: async: Try more connections
>   media: v4l: async: Support fwnode endpoint list matching for subdevs
>   media: adv748x: Return to endpoint matching
>   media: pxa_camera: Fix probe error handling
>   media: pxa_camera: Register V4L2 device early, fix probe error
>     handling
>   media: marvell: cafe: Register V4L2 device earlier
>   media: am437x-vpfe: Register V4L2 device early
>   media: omap3isp: Initialise V4L2 async notifier later
>   media: xilinx-vipp: Init async notifier after registering V4L2 device
>   media: davinci: Init async notifier after registering V4L2 device
>   media: qcom: Initialise V4L2 async notifier later
>   media: v4l: async: Set v4l2_device in async notifier init
>   media: Documentation: v4l: Document sub-device notifiers
>=20
>  .../driver-api/media/v4l2-subdev.rst          |  28 +-
>  drivers/media/i2c/adv748x/adv748x-csi2.c      |  13 +-
>  drivers/media/i2c/max9286.c                   |  27 +-
>  drivers/media/i2c/rdacm20.c                   |  16 +-
>  drivers/media/i2c/rdacm21.c                   |  15 +-
>  drivers/media/i2c/st-mipid02.c                |  12 +-
>  drivers/media/i2c/tc358746.c                  |  15 +-
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  14 +-
>  drivers/media/platform/atmel/atmel-isi.c      |  12 +-
>  drivers/media/platform/atmel/atmel-isi.h      |   2 +-
>  drivers/media/platform/cadence/cdns-csi2rx.c  |  10 +-
>  drivers/media/platform/intel/pxa_camera.c     |  77 +-
>  drivers/media/platform/marvell/cafe-driver.c  |  18 +-
>  drivers/media/platform/marvell/mcam-core.c    |  12 +-
>  drivers/media/platform/marvell/mmp-driver.c   |   6 +-
>  .../platform/microchip/microchip-csi2dc.c     |  11 +-
>  .../platform/microchip/microchip-isc-base.c   |   4 +-
>  .../media/platform/microchip/microchip-isc.h  |   2 +-
>  .../microchip/microchip-sama5d2-isc.c         |   9 +-
>  .../microchip/microchip-sama7g5-isc.c         |   9 +-
>  drivers/media/platform/nxp/imx-mipi-csis.c    |  10 +-
>  drivers/media/platform/nxp/imx7-media-csi.c   |  10 +-
>  .../platform/nxp/imx8-isi/imx8-isi-core.c     |  12 +-
>  drivers/media/platform/qcom/camss/camss.c     |  26 +-
>  drivers/media/platform/qcom/camss/camss.h     |   2 +-
>  drivers/media/platform/renesas/rcar-isp.c     |  12 +-
>  .../platform/renesas/rcar-vin/rcar-core.c     |  26 +-
>  .../platform/renesas/rcar-vin/rcar-csi2.c     |  12 +-
>  .../platform/renesas/rcar-vin/rcar-vin.h      |   4 +-
>  drivers/media/platform/renesas/rcar_drif.c    |  12 +-
>  drivers/media/platform/renesas/renesas-ceu.c  |  10 +-
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  14 +-
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |   2 +-
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  12 +-
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |   2 +-
>  .../platform/rockchip/rkisp1/rkisp1-csi.c     |   7 +-
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     |  12 +-
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     |   8 +-
>  .../platform/samsung/exynos4-is/media-dev.c   |  11 +-
>  .../platform/samsung/exynos4-is/media-dev.h   |   2 +-
>  drivers/media/platform/st/stm32/stm32-dcmi.c  |  12 +-
>  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  10 +-
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |   8 +-
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   2 +-
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |  10 +-
>  .../sun8i_a83t_mipi_csi2.c                    |  10 +-
>  .../media/platform/ti/am437x/am437x-vpfe.c    |  36 +-
>  .../media/platform/ti/am437x/am437x-vpfe.h    |   2 +-
>  drivers/media/platform/ti/cal/cal.c           |  10 +-
>  .../media/platform/ti/davinci/vpif_capture.c  |  33 +-
>  drivers/media/platform/ti/omap3isp/isp.c      |  28 +-
>  drivers/media/platform/ti/omap3isp/isp.h      |  15 +-
>  drivers/media/platform/ti/omap3isp/ispccdc.c  |  13 +-
>  drivers/media/platform/ti/omap3isp/ispccp2.c  |   2 +
>  drivers/media/platform/ti/omap3isp/ispcsi2.c  |   2 +
>  .../media/platform/ti/omap3isp/ispcsiphy.c    |  15 +-
>  drivers/media/platform/video-mux.c            |  10 +-
>  drivers/media/platform/xilinx/xilinx-vipp.c   |  55 +-
>  drivers/media/v4l2-core/v4l2-async.c          | 781 +++++++++++-------
>  drivers/media/v4l2-core/v4l2-fwnode.c         | 109 +--
>  drivers/media/v4l2-core/v4l2-subdev.c         |  13 +
>  .../media/deprecated/atmel/atmel-isc-base.c   |   4 +-
>  .../media/deprecated/atmel/atmel-isc.h        |   2 +-
>  .../deprecated/atmel/atmel-sama5d2-isc.c      |   9 +-
>  .../deprecated/atmel/atmel-sama7g5-isc.c      |   4 +-
>  drivers/staging/media/imx/imx-media-csi.c     |  10 +-
>  .../staging/media/imx/imx-media-dev-common.c  |   6 +-
>  drivers/staging/media/imx/imx-media-dev.c     |   2 +-
>  drivers/staging/media/imx/imx-media-of.c      |   4 +-
>  drivers/staging/media/imx/imx6-mipi-csi2.c    |  12 +-
>  drivers/staging/media/imx/imx8mq-mipi-csi2.c  |  10 +-
>  .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |   6 +-
>  .../media/sunxi/sun6i-isp/sun6i_isp_proc.h    |   2 +-
>  drivers/staging/media/tegra-video/vi.c        |  18 +-
>  drivers/staging/media/tegra-video/vi.h        |   2 +-
>  include/media/davinci/vpif_types.h            |   2 +-
>  include/media/v4l2-async.h                    | 236 +++---
>  include/media/v4l2-fwnode.h                   |  68 +-
>  include/media/v4l2-subdev.h                   |  12 +-
>  79 files changed, 1088 insertions(+), 1015 deletions(-)


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


