Return-Path: <linux-media+bounces-52116-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDYzGykhgmlIPgMAu9opvQ
	(envelope-from <linux-media+bounces-52116-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 17:24:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1F8DBE30
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 17:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70A9030FD018
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 16:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 952903D1CBF;
	Tue,  3 Feb 2026 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u2Wk5TNQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF1131A564;
	Tue,  3 Feb 2026 16:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135352; cv=none; b=anwRWB7UmeLGMihIbCv7Dy5xI+WbjwluxPxcFLnmqBKLxA83nQmCbn+CgazU1m92RlbYZqJOmnjY8vpU21yqRbriTq95AOKxAcdrT+HnWdlxxocOGZDYe4YYDl0ZfGaX5h9DpYvgxEFMcGU5QuiBwpC08g5PB71hz71rRCOfTgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135352; c=relaxed/simple;
	bh=DkKX1srFlOf/cA3V3LOS4z6CTtQcX81Fl8DmOWPMReg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GH18C0Jir8H9s4mYtfZdSqkFGJX9p4RDIgJjhcRaGsZcADMihb3Fm78szw8oYddfC/kUB8QgSiQQDTrqal+7VolU6HljQ5GWS7Iv8iLXfZjr6BOGX1n4UUQq0xeyPDYLePe3DPnOkuhwaGKXy6QcOIJ5xdWz5rtvh+NxzeTt+uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u2Wk5TNQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52E611C6;
	Tue,  3 Feb 2026 17:15:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770135306;
	bh=DkKX1srFlOf/cA3V3LOS4z6CTtQcX81Fl8DmOWPMReg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u2Wk5TNQujT72+Gbb4httoVy8nu6JSH8XZZHPIWk/X7mfhjsAYkAvTowvj4hNud9f
	 vtxLLhHk3p4Oz1E3HCKsFGTItxsUBDAtA4AIHnHZrO9JsMmoLznWaDNt6UGsDAqU2y
	 NjmEQj0scbxihkgKsJRckEVvk0CU/WE9LHjEGWOs=
Date: Tue, 3 Feb 2026 17:15:44 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, 
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com, 
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC v1 01/11] media: uapi: v4l2-isp: Add v4l2 ISP extensible
 statistics definitions
Message-ID: <aYIb8ZIZDfCJZEZ9@zed>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-2-antoine.bouyer@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260123080938.3367348-2-antoine.bouyer@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52116-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BB1F8DBE30
X-Rspamd-Action: no action

Hi Antoine
  thanks a lot for extendable stats

On Fri, Jan 23, 2026 at 09:09:28AM +0100, Antoine Bouyer wrote:
> Extend the v4l2-isp extensible format introduced for isp parameters buffer
> to the statistics buffer as well.
>
> Like for ISP configuration purpose, that will help supporting various ISP
> hardware versions reporting different statistics data with less impact on
> userspace.
>
> The `v4l2_isp_stats_buffer` reuses the `v4l2_isp_params_buffer` container
> definitions, with similar header, versions and flags. V0 and V1 versions

Why do you need two flags ?

Params had to introduce two because we had two drivers already
mainlined using the pre-v4l2-isp version of extensible params which
had defined their version identifier as 1 and 0 and we didn't want to
break existing userspace using those identifiers. So we had to accept
both V0 and V1 as "first version of the v4l2-isp extensible parameters
format".

For stats we don't have users, so I guess we can start with V1 == 0 ?

> are provided to match with params versions. On the other side, ENABLE and
> DISABLE flags are not really meaningfull for statistics purpose. So VALID
> and INVALID flags are introduced. Purpose is to force ISP driver to
> validate a statistics buffer, before it is consumed by userspace.

Interesting. What do you mean with "validate a statistics buffer" ?
And if a driver has to do validation, why would it send upstream a
non-validated buffer ?

>
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> ---
>  include/uapi/linux/media/v4l2-isp.h | 85 +++++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
>
> diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
> index 779168f9058e..ed1279b86694 100644
> --- a/include/uapi/linux/media/v4l2-isp.h
> +++ b/include/uapi/linux/media/v4l2-isp.h
> @@ -99,4 +99,89 @@ struct v4l2_isp_params_buffer {
>  	__u8 data[] __counted_by(data_size);
>  };
>
> +/**
> + * enum v4l2_isp_stats_version - V4L2 ISP statistics versioning
> + *
> + * @V4L2_ISP_STATS_VERSION_V0: First version of the V4L2 ISP statistics format
> + *			       (for compatibility)
> + * @V4L2_ISP_STATS_VERSION_V1: First version of the V4L2 ISP statistics format
> + *
> + * V0 and V1 are identical, and comply with V4l2 ISP parameters versions. So
> + * both V0 and V1 refers to the first version of the V4L2 ISP statistics
> + * format.
> + *
> + * Future revisions of the V4L2 ISP statistics format should start from the
> + * value of 2.
> + */
> +enum v4l2_isp_stats_version {
> +	V4L2_ISP_STATS_VERSION_V0 = 0,
> +	V4L2_ISP_STATS_VERSION_V1,

As suggested I would make V1 == 0

> +};
> +
> +#define V4L2_ISP_PARAMS_FL_BLOCK_VALID		(1U << 0)
> +#define V4L2_ISP_PARAMS_FL_BLOCK_INVALID	(1U << 1)
> +
> +/*
> + * Reserve the first 8 bits for V4L2_ISP_STATS_FL_* flag.
> + *
> + * Driver-specific flags should be defined as:
> + * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(0))
> + * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(1))
> + */
> +#define V4L2_ISP_STATS_FL_DRIVER_FLAGS(n)       ((n) + 8)

Currently we have no users of V4L2_ISP_PARAMS_FL_DRIVER_FLAGS so we
could even consider making it a V4L2_ISP_FL_DRIVER_FLAGS

Or do you think it is worth creating a new symbol ?

> +
> +/**
> + * struct v4l2_isp_stats_block_header - V4L2 extensible statistics block header
> + * @type: The statistics block type (driver-specific)
> + * @flags: A bitmask of block flags (driver-specific)
> + * @size: Size (in bytes) of the statistics block, including this header
> + *
> + * This structure represents the common part of all the ISP statistics blocks.
> + * Each statistics block shall embed an instance of this structure type as its
> + * first member, followed by the block-specific statistics data.
> + *
> + * The @type field is an ISP driver-specific value that identifies the block
> + * type. The @size field specifies the size of the parameters block.
> + *
> + * The @flags field is a bitmask of per-block flags V4L2_STATS_ISP_FL_* and
> + * driver-specific flags specified by the driver header.
> + */
> +struct v4l2_isp_stats_block_header {
> +	__u16 type;
> +	__u16 flags;
> +	__u32 size;
> +} __attribute__((aligned(8)));
> +

This is currently identical to v4l2_isp_params_block_header.

Can we create a single header for both stats and params and provide a

#define v4l2_isp_params_block_header v4l2_isp_block_header

for maintaining compatibility with existing users ?

Or do you expect stats and params to eventually need different headers ?

> +/**
> + * struct v4l2_isp_stats_buffer - V4L2 extensible statistics data
> + * @version: The statistics buffer version (driver-specific)
> + * @data_size: The statistics data effective size, excluding this header
> + * @data: The statistics data
> + *
> + * This structure contains the statistics information of the ISP hardware,
> + * serialized for userspace into a data buffer. Each statistics block is
> + * represented by a block-specific structure which contains a
> + * :c:type:`v4l2_isp_stats_block_header` entry as first member. Driver
> + * populates the @data buffer with statistics information of the ISP blocks it
> + * intends to share to userspace. As a consequence, the data buffer effective
> + * size changes according to the number of ISP blocks that driver intends to
> + * provide and is set by the driver in the @data_size field.
> + *
> + * The statistics buffer is versioned by the @version field to allow modifying
> + * and extending its definition. Driver shall populate the @version field to
> + * inform the userpsace about the version it intends to use. The userspace will
> + * parse and handle the @data buffer according to the data layout specific to
> + * the indicated version.
> + *
> + * For each ISP block that driver wants to report, a block-specific structure
> + * is appended to the @data buffer, one after the other without gaps in
> + * between. Driver shall populate the @data_size field with the effective
> + * size, in bytes, of the @data buffer.
> + */
> +struct v4l2_isp_stats_buffer {
> +	__u32 version;
> +	__u32 data_size;
> +	__u8 data[] __counted_by(data_size);
> +};
> +

Same question. Should we introduce a struct v4l2_isp_buffer ?

Thanks!

>  #endif /* _UAPI_V4L2_ISP_H_ */
> --
> 2.52.0
>
>

