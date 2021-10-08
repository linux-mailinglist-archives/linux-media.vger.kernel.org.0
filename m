Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEB22426A2C
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 13:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240468AbhJHLzs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 8 Oct 2021 07:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240228AbhJHLzn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 07:55:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F55C061755
        for <linux-media@vger.kernel.org>; Fri,  8 Oct 2021 04:53:48 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mYoRa-0001Fw-GR; Fri, 08 Oct 2021 13:53:42 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mYoRZ-00063g-Kv; Fri, 08 Oct 2021 13:53:41 +0200
Message-ID: <c3d2e56b83b8b78b867089a5c815e30248c4f2e1.camel@pengutronix.de>
Subject: Re: [PATCH] i.MX6: Support 16-bit BT.1120 video input
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Krzysztof =?UTF-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date:   Fri, 08 Oct 2021 13:53:41 +0200
In-Reply-To: <m37deqmnli.fsf@t19.piap.pl>
References: <m3o882n0ir.fsf@t19.piap.pl>
         <568f79774cc148c58b9045da7b94b4e9e500810b.camel@pengutronix.de>
         <m37deqmnli.fsf@t19.piap.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Wed, 2021-10-06 at 12:52 +0200, Krzysztof Hałasa wrote:
> Hi Philipp,
> 
> Philipp Zabel <p.zabel@pengutronix.de> writes:
> 
> > > + * - BT.656 and BT.1120 (8/10-bit YUV422) data can always be processed
> > > + *   on-the-fly (converted to YUV420)
> > 
> > This comment seems misleading. The CSI converts to YUV 4:4:4 internally.
> 
> Well... this is surprising. You mean "on the internal bus", don't you?

Yes, anything apart from the bayer/generic data modes, internally
everything is converted into 32-bit YUVA/RGBA pixels (according to the
Reference Manual, 37.4.2.3 FCW & FCR). That is represented by the
MEDIA_BUS_FMT_AYUV8_1X32 media bus format at the CSI source pads.

> Please correct me if the following is wrong:
> 
> I always though that the "on-the-fly processing", in case of YUV422,
> means in practice I can get YUV420 out of the IPU, without a need to do
> e.g. NEON conversion.

That is done in the IDMAC, which can write any supported YUV format from
the internal YUV pixels (if not in bayer/generic data mode).

> I know I can get the original YUV422 as well,
> using the "generic data" mode, but it's incompatible with the CODA H.264
> encoder.

You should also be able to store the YUV formatted pixels as NV12, NV16,
YUYV, etc.

> Ok, the DQRM (37.4.3.2.1) states that for parallel YUV the output from
> CSI is always YUV444.

Ack.

> Then 37.4.3.9 says that the only YUV422 way is to use 16-bit "generic
> data". This doesn't seem to be very true, however I'm not exactly sure
> about the "on-the-fly" thing.

I think that statement is limited to the parallel 16-bit interface in
hsync/vsync mode, whereas in bt.656 / bt.1120 mode the interface
operates as if the two components were clocked in as two separate 8-bit
(or 10-bit) values.

> The fact is the patch works.
> Also, the CSIx_SENS_DATA_FORMAT field in IPUx_CSIx_SENS_CONF register
> shows YUV422 YUYV and UYVY input data formats, clearly separate from
> "Bayer of Generic data".
> 
> DQIEC, 4.12.10.1, isn't very clear either:
> 8) YCbCr 20-bit (10-bit Y + 10-bit U/V) is supported with BT.1120 only
> 7) YCbCr 16-bit is supported under the same conditions as 8)
> 6) YCbCr 16-bit (= YUV422) is also supported as "generic-data"
>    (no on-the-fly processing). This seems to imply 8) and 7) are
>    supported WITH o-t-f-p (and obviously I have tested it, 16-bit only).
>
> I think I will just remove the comment :-)

That sounds good to me.

regards
Philipp
