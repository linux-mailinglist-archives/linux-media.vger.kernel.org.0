Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2232BC2E5
	for <lists+linux-media@lfdr.de>; Sun, 22 Nov 2020 01:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgKVAs7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Nov 2020 19:48:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726398AbgKVAs7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Nov 2020 19:48:59 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2969C0613CF;
        Sat, 21 Nov 2020 16:48:58 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 2183B1F45C12
Message-ID: <36568623119c57a6d5253300ad937aeb708f4ec8.camel@collabora.com>
Subject: Re: [PATCH v3 07/13] media: controls: Validate H264 stateless
 controls
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Date:   Sat, 21 Nov 2020 21:48:48 -0300
In-Reply-To: <ce737ae7-053d-1171-1c03-5ff1efb5ea8c@xs4all.nl>
References: <20201118184700.331213-1-ezequiel@collabora.com>
         <20201118184700.331213-8-ezequiel@collabora.com>
         <ce737ae7-053d-1171-1c03-5ff1efb5ea8c@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2020-11-20 at 10:30 +0100, Hans Verkuil wrote:
> On 18/11/2020 19:46, Ezequiel Garcia wrote:
> > Check that all the fields that correspond or are related
> > to a H264 specification syntax element have legal values.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls.c | 83 ++++++++++++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> > 
[..]
> >  	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
> >  		p_h264_dec_params = p;
> >  
> > +		if (p_h264_dec_params->nal_ref_idc > 3)
> > +			return -EINVAL;
> >  		for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
> >  			struct v4l2_h264_dpb_entry *dpb_entry =
> >  				&p_h264_dec_params->dpb[i];
> > 
> 
> General question: I don't see anything in std_init_compound() for these
> controls. Is initializing these compound controls to 0 enough to make them
> pass std_validate_compound()? It probably is, otherwise you'd see errors
> in the compliance test, I guess.
> guess.
> 

Indeed. You can see all the checks are for fields to not
exceed some maximum value.

This is common in H264/HEVC: you'll see  spread of _minusN
syntax. This is so to make zero-valued syntax common,
which in turns creates more redundancy, and make headers
more compressed.

Thanks,
Ezequiel

