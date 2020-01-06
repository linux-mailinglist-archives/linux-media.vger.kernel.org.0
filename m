Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC18130E35
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 08:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgAFHwl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 02:52:41 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58938 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgAFHwk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 02:52:40 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 657BB283C0A;
        Mon,  6 Jan 2020 07:52:38 +0000 (GMT)
Date:   Mon, 6 Jan 2020 08:52:35 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 6/7] media: rkvdec: Add the rkvdec driver
Message-ID: <20200106085235.0e639ecb@collabora.com>
In-Reply-To: <20191213125414.90725-7-boris.brezillon@collabora.com>
References: <20191213125414.90725-1-boris.brezillon@collabora.com>
        <20191213125414.90725-7-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 13 Dec 2019 13:54:13 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> +static int rkvdec_try_capture_fmt(struct file *file, void *priv,
> +				  struct v4l2_format *f)
> +{
> +	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
> +	const struct rkvdec_coded_fmt_desc *coded_desc;
> +	u32 fourcc, width, height;
> +	unsigned int i;
> +
> +	/*
> +	 * The codec context should point to a coded format desc, if the format
> +	 * on the coded end has not been set yet, it should point to the
> +	 * default value.
> +	 */
> +	coded_desc = ctx->coded_fmt_desc;
> +	if (WARN_ON(!coded_desc))
> +		return -EINVAL;
> +
> +	fourcc = f->fmt.pix_mp.pixelformat;
> +	for (i = 0; i < coded_desc->num_decoded_fmts; i++) {
> +		if (coded_desc->decoded_fmts[i] == fourcc)
> +			break;
> +	}
> +
> +	if (i == coded_desc->num_decoded_fmts)
> +		return -EINVAL;
> +
> +	/* Save the original width/height before aligning them. */
> +	width = f->fmt.pix_mp.width;
> +	height = f->fmt.pix_mp.height;
> +
> +	/* Always apply the frmsize constraint of the coded end. */
> +	v4l2_apply_frmsize_constraints(&f->fmt.pix_mp.width,
> +				       &f->fmt.pix_mp.height,
> +				       &coded_desc->frmsize);
> +
> +	v4l2_fill_pixfmt_mp(&f->fmt.pix_mp, fourcc, f->fmt.pix_mp.width,
> +			    f->fmt.pix_mp.height);
> +
> +	/*
> +	 * Now that we have computed sizeimage and bytesperline we can restore
> +	 * the original width/height (before macro block alignment).
> +	 */
> +	f->fmt.pix_mp.width = width;
> +	f->fmt.pix_mp.height = height;

Looks like restoring the original width/height was a bad idea (it
breaks the odd_size tests of the VP9 testsuite [1]). I'll adjust the
test in validate_dec_params() [2] to align the ctrl width/height params
on a superblock size (64 pixels) instead.

> +
> +	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
> +
> +	return 0;
> +}

[1]https://storage.googleapis.com/downloads.webmproject.org/vp9/decoder-test-streams/Profile_0_8bit.zip
[2]https://patchwork.kernel.org/patch/11290603/
