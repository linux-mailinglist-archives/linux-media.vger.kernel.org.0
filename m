Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E179C11E61D
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 16:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbfLMPFQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 10:05:16 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58752 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727706AbfLMPFQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 10:05:16 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 36FEE2924C9;
        Fri, 13 Dec 2019 15:05:12 +0000 (GMT)
Date:   Fri, 13 Dec 2019 16:05:08 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 6/7] media: rkvdec: Add the rkvdec driver
Message-ID: <20191213160508.0b9c9019@collabora.com>
In-Reply-To: <036d3ecb-2307-4e8c-eaad-3c70c8cbda22@xs4all.nl>
References: <20191213125414.90725-1-boris.brezillon@collabora.com>
        <20191213125414.90725-7-boris.brezillon@collabora.com>
        <036d3ecb-2307-4e8c-eaad-3c70c8cbda22@xs4all.nl>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 13 Dec 2019 15:21:05 +0100
Hans Verkuil <hverkuil@xs4all.nl> wrote:

> 
> > +/*
> > + * dpb poc related registers table
> > + */  
> 
> Shouldn't the next two arrays be const?

Absolutely. I'll fix that in v4.

> 
> > +static u32 poc_reg_tbl_top_field[16] = {
> > +	RKVDEC_REG_H264_POC_REFER0(0),
> > +	RKVDEC_REG_H264_POC_REFER0(2),
> > +	RKVDEC_REG_H264_POC_REFER0(4),
> > +	RKVDEC_REG_H264_POC_REFER0(6),
> > +	RKVDEC_REG_H264_POC_REFER0(8),
> > +	RKVDEC_REG_H264_POC_REFER0(10),
> > +	RKVDEC_REG_H264_POC_REFER0(12),
> > +	RKVDEC_REG_H264_POC_REFER0(14),
> > +	RKVDEC_REG_H264_POC_REFER1(1),
> > +	RKVDEC_REG_H264_POC_REFER1(3),
> > +	RKVDEC_REG_H264_POC_REFER1(5),
> > +	RKVDEC_REG_H264_POC_REFER1(7),
> > +	RKVDEC_REG_H264_POC_REFER1(9),
> > +	RKVDEC_REG_H264_POC_REFER1(11),
> > +	RKVDEC_REG_H264_POC_REFER1(13),
> > +	RKVDEC_REG_H264_POC_REFER2(0)
> > +};
> > +
> > +static u32 poc_reg_tbl_bottom_field[16] = {
> > +	RKVDEC_REG_H264_POC_REFER0(1),
> > +	RKVDEC_REG_H264_POC_REFER0(3),
> > +	RKVDEC_REG_H264_POC_REFER0(5),
> > +	RKVDEC_REG_H264_POC_REFER0(7),
> > +	RKVDEC_REG_H264_POC_REFER0(9),
> > +	RKVDEC_REG_H264_POC_REFER0(11),
> > +	RKVDEC_REG_H264_POC_REFER0(13),
> > +	RKVDEC_REG_H264_POC_REFER1(0),
> > +	RKVDEC_REG_H264_POC_REFER1(2),
> > +	RKVDEC_REG_H264_POC_REFER1(4),
> > +	RKVDEC_REG_H264_POC_REFER1(6),
> > +	RKVDEC_REG_H264_POC_REFER1(8),
> > +	RKVDEC_REG_H264_POC_REFER1(10),
> > +	RKVDEC_REG_H264_POC_REFER1(12),
> > +	RKVDEC_REG_H264_POC_REFER1(14),
> > +	RKVDEC_REG_H264_POC_REFER2(1)
> > +};  

[...]

> > +static int rkvdec_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
> > +			      unsigned int *num_planes, unsigned int sizes[],
> > +			      struct device *alloc_devs[])
> > +{
> > +	struct rkvdec_ctx *ctx = vb2_get_drv_priv(vq);
> > +	struct v4l2_pix_format_mplane *pixfmt;
> > +	struct v4l2_format *f;
> > +	unsigned int i;
> > +
> > +	if (V4L2_TYPE_IS_OUTPUT(vq->type))
> > +		f = &ctx->coded_fmt;
> > +	else
> > +		f = &ctx->decoded_fmt;
> > +
> > +	if (*num_planes) {
> > +		if (*num_planes != f->fmt.pix_mp.num_planes)
> > +			return -EINVAL;
> > +
> > +		for (i = 0; i < f->fmt.pix_mp.num_planes; i++) {
> > +			if (sizes[i] < f->fmt.pix_mp.plane_fmt[i].sizeimage)
> > +				return -EINVAL;
> > +		}  
> 
> Shouldn't there be a 'return 0' here? In the CREATE_BUFS case all you do is check
> if the given size is large enough, and if so then you are done.

I end up returning 0 anyway, it's just that size[0] is updated to
account for the extra MV size, is that a problem?

> 
> > +	} else {
> > +		*num_planes = f->fmt.pix_mp.num_planes;
> > +		for (i = 0; i < f->fmt.pix_mp.num_planes; i++)
> > +			sizes[i] = f->fmt.pix_mp.plane_fmt[i].sizeimage;
> > +	}
> > +
> > +	if (V4L2_TYPE_IS_OUTPUT(vq->type))
> > +		return 0;
> > +
> > +	pixfmt = &ctx->decoded_fmt.fmt.pix_mp;
> > +	sizes[0] += 128 * DIV_ROUND_UP(pixfmt->width, 16) *
> > +		    DIV_ROUND_UP(pixfmt->height, 16);

This makes me realize we decided to take the MV extra size into account
in our ->sizeimage calculation in the hantro driver, so I should
probably move this code to try_s_capture_fmt().

