Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 556ED82457
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 19:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728800AbfHER7F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 13:59:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56052 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726779AbfHER7F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 13:59:05 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4C74C28A3AC;
        Mon,  5 Aug 2019 18:59:03 +0100 (BST)
Date:   Mon, 5 Aug 2019 19:59:00 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFC PATCH 3/5] media: v4l2: Add m2m codec helpers
Message-ID: <20190805195900.7c25d99c@collabora.com>
In-Reply-To: <bca63b3d-7254-99db-bcf4-cb3f2511c69a@xs4all.nl>
References: <20190805094827.11205-1-boris.brezillon@collabora.com>
        <20190805094827.11205-4-boris.brezillon@collabora.com>
        <bca63b3d-7254-99db-bcf4-cb3f2511c69a@xs4all.nl>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 5 Aug 2019 13:53:20 -0300
Hans Verkuil <hverkuil@xs4all.nl> wrote:

> > +/**
> > + * struct v4l2_m2m_codec_ctx - Codec context
> > + * @fh: file handle
> > + * @coded_fmt: current coded format
> > + * @decoded_fmt: current decoded format
> > + * @coded_fmt_desc: current coded format desc
> > + * @decoded_fmt_desc: current decoded format desc
> > + * @ctrl_hdl: control handler
> > + * @codec: the codec that has created this context
> > + */
> > +struct v4l2_m2m_codec_ctx {
> > +	struct v4l2_fh fh;
> > +	struct v4l2_format coded_fmt;
> > +	struct v4l2_format decoded_fmt;
> > +	const struct v4l2_m2m_codec_coded_fmt_desc *coded_fmt_desc;
> > +	const struct v4l2_m2m_codec_decoded_fmt_desc *decoded_fmt_desc;
> > +	struct v4l2_ctrl_handler ctrl_hdl;
> > +	struct v4l2_m2m_codec *codec;
> > +};  
> 
> ...this struct.
> 
> So basically everything in this header :-)
> 
> I haven't done an in-depth review, but my main concern is that I
> believe these structs and the helpers depending on them are too
> high-level.
> 
> The helpers themselves often look reasonable, except that they could
> be more generic if it wasn't for these high-level structs.

I'll have to double check, but I fear most of those helpers are useless
if we don't have these generic structs.

> 
> My feeling is that it would make more sense if you would create structs 
> dealing just with formats and structs just for controls and don't try
> to mix in things like struct video_device or struct v4l2_fh.

Except that's where most of the boiler-plate code is (basically all the
ioctl and vb2_queue ops).

> 
> I think that will create a better balance between providing helpers
> for codec drivers without hiding too much inside v4l2_m2m_codec_* structs.

I'm fine with that, just not sure this will significantly reduce code
duplication...
