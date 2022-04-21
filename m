Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD54509DA0
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 12:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1388406AbiDUK2l convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 21 Apr 2022 06:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388370AbiDUK1P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 06:27:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E192F012
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 03:24:25 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nhTz5-0007J4-Ic; Thu, 21 Apr 2022 12:24:23 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nhTz6-004LF4-1Q; Thu, 21 Apr 2022 12:24:22 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nhTz4-00079G-05; Thu, 21 Apr 2022 12:24:22 +0200
Message-ID: <2d160491ffdba0642e2bda6096524d10ad2b647d.camel@pengutronix.de>
Subject: Re: [PATCH 1/7] media: coda: set output buffer bytesused to appease
 v4l2-compliance
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Date:   Thu, 21 Apr 2022 12:24:21 +0200
In-Reply-To: <3b1ace8f-a425-6a61-cb97-39e93100e75c@xs4all.nl>
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
         <3b1ace8f-a425-6a61-cb97-39e93100e75c@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Do, 2022-04-21 at 11:44 +0200, Hans Verkuil wrote:
> On 04/04/2022 18:35, Philipp Zabel wrote:
> > The V4L2 specification states:
> > 
> >  "If the application sets this to 0 for an output stream, then bytesused
> >   will be set to the size of the buffer (see the length field of this
> >   struct) by the driver."
> > 
> > Since we set allow_zero_bytesused, we have to handle this ourselves.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  drivers/media/platform/chips-media/coda-bit.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/media/platform/chips-media/coda-bit.c b/drivers/media/platform/chips-media/coda-bit.c
> > index c484c008ab02..705a179ea8f0 100644
> > --- a/drivers/media/platform/chips-media/coda-bit.c
> > +++ b/drivers/media/platform/chips-media/coda-bit.c
> > @@ -381,6 +381,9 @@ void coda_fill_bitstream(struct coda_ctx *ctx, struct list_head *buffer_list)
> >  		/* Dump empty buffers */
> >  		if (!vb2_get_plane_payload(&src_buf->vb2_buf, 0)) {
> >  			src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> > +			vb2_set_plane_payload(&src_buf->vb2_buf, 0,
> > +					      vb2_plane_size(&src_buf->vb2_buf,
> > +							     0));
> 
> Would it be possible to stop using allow_zero_bytesused altogether?
> 
> Are there still applications that rely on zero-sized output buffers to stop the
> decoder?

This was used by GStreamer 1.8. The code is still left in current
versions, but is never executed unless the decoder stop command fails:

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/main/subprojects/gst-plugins-good/sys/v4l2/gstv4l2videodec.c#L446-454

Whether there are still any applications using GStreamer 1.8 for V4L2
video decoding on devices that get kernel updates, I don't know.

> I'm not actually sure that I want this in the driver, perhaps v4l2-compliance
> can be modified to turn a fail into a warn if the driver is the coda driver.

Same for nxp/imx-jpeg, qcom/venus and samsung/s5p-mfc?

> Patching the driver is hiding the fact that the coda driver does something
> non-standard for legacy reasons. It doesn't make sense either to change
> bytesused to the buffer size since there really is nothing in the buffer.
>
> v4l2-compliance already has checks for two drivers, search for is_vivid and
> is_uvcvideo.

Ok.

> I'm skipping this patch for now.

regards
Philipp
