Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C424175D13
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 15:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbgCBOao convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 2 Mar 2020 09:30:44 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46468 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727104AbgCBOao (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 09:30:44 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C7561294B57;
        Mon,  2 Mar 2020 14:30:41 +0000 (GMT)
Date:   Mon, 2 Mar 2020 15:30:39 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v6 5/6] media: rkvdec: Add the rkvdec driver
Message-ID: <20200302153039.0c4ff54f@collabora.com>
In-Reply-To: <20200302145746.3e94c1d1@coco.lan>
References: <20200220163016.21708-1-ezequiel@collabora.com>
        <20200220163016.21708-6-ezequiel@collabora.com>
        <20200302145746.3e94c1d1@coco.lan>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2 Mar 2020 14:57:46 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> > +#define M_N(ctxidx, idc0_m, idc0_n, idc1_m, idc1_n,		\
> > +	    idc2_m, idc2_n, intra_m, intra_n)			\
> > +	[0][(ctxidx)] = {idc0_m, idc0_n},			\
> > +	[1][(ctxidx)] = {idc1_m, idc1_n},			\
> > +	[2][(ctxidx)] = {idc2_m, idc2_n},			\
> > +	[3][(ctxidx)] = {intra_m, intra_n}  
> 
> Hmm... I can't even imagine what a macro named "M_N" would do.
> Please use a better name for it.

Well, the meaning of those fields is explained in the spec, and the
name itself has been chosen so it's short enough to not have lines
exceeding 80 chars while still keeping the number of lines used for the
cabac_table[] definition acceptable. But, I'm open to any other
suggestion.

> 
> -
> 
> With regards to the macro itself, at least for my eyes, it looked bad,
> from long-term maintenance PoV, to have a first argument (ctxidx) whose
> value is just a monotonic linearly-incremented counter.

It's not, we have holes in the middle, hence the explicit indexing. I
also tried to have something as close as possible to the spec, so
people can easily see where it comes from.

> 
> I mean, the way it is, it sounds risky, as one might miss a number
> and one entire line of the array would be filled with zeros.

That's exactly why I used explicit indexing: I want specific portions
of the table to be 0-filled :-).

> 
> > +
> > +/*
> > + * Constant CABAC table.
> > + * Built from the tables described in section '9.3.1.1 Initialisation process
> > + * for context variables' of the H264 spec.
> > + */
> > +static const s8 rkvdec_h264_cabac_table[4][464][2] = {
> > +	/* Table 9-12 – Values of variables m and n for ctxIdx from 0 to 10 */
> > +	M_N(0, 20, -15, 20, -15, 20, -15, 20, -15),  
> 
> So, (maybe except if the ctxidx value has some real meaning),
> perhaps you could, instead, switch the array order at the tables,
> and get rid of ctxidx parameter for good, so the above code would
> be like:

I can't switch the array order since the HW expects things to be
organized this way (that table is directly copied to a memory region
that's passed to the HW).

> 
> #define INIT_MN_PAIRS(idc0_m, idc0_n, idc1_m, idc1_n,	\
> 	       idc2_m, idc2_n, intra_m, intra_n)	\
> 	{						\
> 		[0] = {idc0_m, idc0_n},			\
> 		[1] = {idc1_m, idc1_n},			\
> 		[2] = {idc2_m, idc2_n},			\
> 		[3] = {intra_m, intra_n}		\
> 	},
> 
> static const s8 rkvdec_h264_cabac_table[464][4][2] = {
> 	/* Table 9-12 – Values of variables m and n for ctxIdx from 0 to 10 */
> 	INIT_MN_PAIRS(20, -15, 20, -15, 20, -15, 20, -15),
> 	...

