Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0BDF3B0529
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 14:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbhFVMv3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 08:51:29 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34864 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbhFVMv2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 08:51:28 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id C16AE1F41707
Message-ID: <326b03302aeaec817f675e6e0523eb8060bf2f67.camel@collabora.com>
Subject: Re: [PATCH v3 1/8] media: hantro: Trace hevc hw cycles performance
 register
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        hverkuil@xs4all.nl, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk,
        jernej.skrabec@gmail.com, nicolas@ndufresne.ca
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Tue, 22 Jun 2021 09:48:49 -0300
In-Reply-To: <41682f40-3b5e-e21c-d75e-f57f8f3310da@collabora.com>
References: <20210618131526.566762-1-benjamin.gaignard@collabora.com>
         <20210618131526.566762-2-benjamin.gaignard@collabora.com>
         <418311dac48d3a29b4fe9e363f7d4e82c360f586.camel@collabora.com>
         <41682f40-3b5e-e21c-d75e-f57f8f3310da@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-06-22 at 14:23 +0200, Benjamin Gaignard wrote:
[..]
> > > +
> > > +TRACE_EVENT(hantro_hevc_perf,
> > > +       TP_PROTO(struct hantro_ctx *ctx, u32 hw_cycles),
> > > +
> > > +       TP_ARGS(ctx, hw_cycles),
> > > +
> > > +       TP_STRUCT__entry(
> > > +               __field(int, minor)
> > > +               __field(u32, hw_cycles)
> > > +       ),
> > > +
> > > +       TP_fast_assign(
> > > +               __entry->minor = ctx->fh.vdev->minor;
> > Tracking performance per minor doesn't seem useful,
> > we'd like to track per-fd (i.e. per context).
> 
> This part of the driver doesn't know for which fd the decoding job is done
> so impossible to add it there.
> 

Maybe you can explore using struct v4l2_m2m_ctx.
There's an RFC where this is discussed:

https://lore.kernel.org/linux-media/20210517183801.1255496-1-emil.l.velikov@gmail.com/

Kindly,
Ezequiel

