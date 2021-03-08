Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11405331213
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 16:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbhCHPZa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 10:25:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbhCHPZ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 10:25:27 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971BDC06174A
        for <linux-media@vger.kernel.org>; Mon,  8 Mar 2021 07:25:26 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 2D7A61F4513C
Message-ID: <12bd921ce856590f5a4426de45865ad007b791e9.camel@collabora.com>
Subject: Re: [PATCH 7/7] ARM: dts: at91: sama5d4: add vdec0 component
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Emil Velikov <emil.l.velikov@gmail.com>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>, kernel@collabora.com,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org,
        linux-rockchip <linux-rockchip@lists.infradead.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date:   Mon, 08 Mar 2021 12:25:17 -0300
In-Reply-To: <CACvgo51peuKsuqx-NwZSWU4Ys1q5MuXb=BRx7GLo3tkWH+vb0w@mail.gmail.com>
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
         <20210305183924.1754026-8-emil.l.velikov@gmail.com>
         <915739c6fc01f17b00c4fac8b7fede1f25396286.camel@collabora.com>
         <CACvgo51peuKsuqx-NwZSWU4Ys1q5MuXb=BRx7GLo3tkWH+vb0w@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2021-03-08 at 13:07 +0000, Emil Velikov wrote:
>  Hi Ezequiel,
> 
> Thanks for the prompt reply
> 
> On Sat, 6 Mar 2021 at 11:25, Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > 
> > (adding another Nicolas)
> > 
> > Hi Emil,
> > 
> > Thanks a lot for the patch.
> > 
> > On Fri, 2021-03-05 at 18:39 +0000, Emil Velikov wrote:
> > > From: Emil Velikov <emil.velikov@collabora.com>
> > > 
> > > The SoC features a Hantro G1 compatible video decoder.
> > > 
> > > Cc: Ezequiel Garcia <ezequiel@collabora.com>
> > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > Cc: linux-media@vger.kernel.org
> > > Cc: linux-rockchip@lists.infradead.org
> > > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
[..]
> > > +static const struct hantro_fmt sama5d4_vdec_postproc_fmts[] = {
> > > +       {
> > > +               .fourcc = V4L2_PIX_FMT_YUYV,
> > > +               .codec_mode = HANTRO_MODE_NONE,
> > > +       },
> > > +};
> > > +
> > 
> > I haven't found information on how the series
> > was tested in the cover letter, could you add that to the next
> > iteration?
> > 
> > Please test the YUYV post-processed output and MPEG-2 decoding as well.
> > 
> Any recommendations for MPEG-2 and post-processing testing? For the
> former I could use gstreamer on Big Buck Bunny or other media, yet not
> sure about the latter.
> 

The post-processed YUYV output can be requested like this in
GStreamer:

gst-launch-1.0 -v filesrc location=$something  ! parsebin ! decodebin ! video/x-raw,format=YUY2 ! ...

For MPEG-2 testing, I'm afraid there's no GStreamer yet for this,
but Jonas' ffmpeg should work https://github.com/Kwiboo/FFmpeg/commits/v4l2-request-hwaccel-4.3.

Thanks,
Ezequiel

