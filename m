Return-Path: <linux-media+bounces-63576-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id afTCEvUIIGrcuQAAu9opvQ
	(envelope-from <linux-media+bounces-63576-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 12:59:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F77636C56
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 12:59:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=YLg7Gve8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63576-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63576-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 390463040A91
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 10:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DBF426EB2;
	Wed,  3 Jun 2026 10:56:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519B83314B9;
	Wed,  3 Jun 2026 10:56:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780484199; cv=none; b=ANC8kbT0YcoicFLUp6k6Zu5RLkLUYhyI6rvRSB/srkzWbIVTy83HRM4muy71N/BpE+TVFJulndjn2KfRwmpo2C5AnmO3eUxXpuTNO3RYweeJPtZPoeuEet6Yx9gv+PiNx+PsDJSepF7vo4w4nhQeNXvGorNRHDD+6XrJ+/oFpQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780484199; c=relaxed/simple;
	bh=bt8ClXGe1tma98inRptOqEQMuax6JOkpf6nqc1GOUKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bvXpMXZO5+rzCcmqpQqPRNwbLzQyJ+ohm+gb1jZ6vYO9lRgzIbQcDkOzfB2EnFd6zDl/jC5m1pW2f9o7VxIS/bpeWwzH1XIk2oim1F1Pusal9X33NNDdE31d/zw9llk+4yKBd+V3WmwIdzIwtYJxaYvWZjGfsBB6aQU6hZN59aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YLg7Gve8; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8911929;
	Wed,  3 Jun 2026 12:56:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780484171;
	bh=bt8ClXGe1tma98inRptOqEQMuax6JOkpf6nqc1GOUKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YLg7Gve8akVKtvHys5qEul6GB5NyHpaitunVARJlexKED0nmZvpIUDcjAlNHIrjVM
	 hu6TXpHv7vwW6t4H8ojLKJz76vMF/kqnBO/XcEL1b3IBdmRZGIZ3bBhU/QKChVnEC3
	 t7bxxks1TROPYpLQ6MNqNJdEdt28W1mEHVhcwyJQ=
Date: Wed, 3 Jun 2026 12:56:32 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v9 03/13] media: rppx1: Add framework to support
 Dreamchip RPPX1 ISP
Message-ID: <aiAHZnFg6UvFf0Xd@zed>
References: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
 <20260516211320.3041412-4-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260516211320.3041412-4-niklas.soderlund+renesas@ragnatech.se>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63576-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:hverkuil+cisco@kernel.org,m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:niklas.soderlund@ragnatech.se,m:hverkuil@kernel.org,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zed:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:from_mime,ideasonboard.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3F77636C56

Hi Niklas,
  let me point Hans to a single part of this patch then I'll review
  the rest

On Sat, May 16, 2026 at 11:13:10PM +0200, Niklas Söderlund wrote:

[snip]

> diff --git a/Documentation/userspace-api/media/v4l/metafmt-rppx1.rst b/Documentation/userspace-api/media/v4l/metafmt-rppx1.rst
> new file mode 100644
> index 000000000000..ad256ae1c1b2
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-rppx1.rst
> @@ -0,0 +1,99 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _v4l2-meta-fmt-rppx1-params:
> +.. _v4l2-meta-fmt-rppx1-stats:
> +
> +*************************************************************************
> +V4L2_META_FMT_RPP_X1_PARAMS ('DR1P'), V4L2_META_FMT_RPP_X1_STATS ('DR1S')
> +*************************************************************************
> +
> +Configuration Parameters
> +========================
> +
> +The configuration parameters are passed to the metadata output video node, using
> +the :c:type:`v4l2_meta_format` interface. Rather than a single struct containing
> +sub-structs for each configurable area of the ISP, parameters for the Dreamchip
> +RPPX1 use the v4l2-isp parameters system, through which groups of parameters are
> +defined as distinct structs or "blocks" which may be added to the data member of
> +:c:type:`v4l2_isp_buffer`. Userspace is responsible for populating the data
> +member with the blocks that need to be configured by the driver.  Each
> +block-specific struct embeds :c:type:`v4l2_isp_block_header` as its first member
> +and userspace must populate the type member with a value from
> +:c:type:`rppx1_params_block_type`.
> +
> +.. code-block:: c
> +
> +	struct v4l2_isp_params_buffer *params =
> +		(struct v4l2_isp_params_buffer *)buffer;
> +
> +	params->version = V4L2_ISP_PARAMS_VERSION_V1;
> +	params->data_size = 0;
> +
> +	void *data = (void *)params->data;
> +
> +	struct rppx1_ccor_params *ccor =
> +		(struct rppx1_ccor_params *)data;
> +
> +	ccor->header.type = RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST;
> +	ccor->header.flags |= V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
> +	ccor->header.size = sizeof(struct rppx1_ccor_params);
> +
> +        ccor->coeff[0][0] = 0x1000;
> +        ccor->coeff[0][1] = 0x0000;
> +        ccor->coeff[0][2] = 0x0000;
> +        ccor->coeff[1][0] = 0x0000;
> +        ccor->coeff[1][1] = 0x1000;
> +        ccor->coeff[1][2] = 0x0000;
> +        ccor->coeff[2][0] = 0x0000;
> +        ccor->coeff[2][1] = 0x0000;
> +        ccor->coeff[2][2] = 0x1000;
> +
> +        ccor->offset[0] = 0x200000;
> +        ccor->offset[1] = 0x200000;
> +        ccor->offset[2] = 0x200000;
> +
> +	data += sizeof(struct rppx1_ccor_params);
> +	params->data_size += sizeof(struct rppx1_ccor_params);
> +
> +3A Statistics
> +=============
> +
> +The ISP device collects different statistics over an input bayer frame. Those
> +statistics can be obtained by userspace from the metadata capture video node,
> +using the :c:type:`v4l2_meta_format` interface. Rather than a single struct
> +containing sub-structs for each statistics area of the ISP, statistics for the
> +Dreamchip RPPX1 use the v4l2-isp statistics system, through which groups of
> +statistics are defined as distinct structs or "blocks" which may be added to the
> +data member of :c:type:`v4l2_isp_buffer`. Userspace is responsible for parsing
> +the buffer and extracting the blocks of statistics. Each block-specific struct
> +embeds :c:type:`v4l2_isp_block_header` as its first member and userspace must
> +interpret the type member with a value from :c:type:`rppx1_stats_block_type`.
> +
> +.. code-block:: C
> +
> +        const struct v4l2_isp_buffer *stats =
> +                (struct v4l2_isp_buffer *)buf;
> +        size_t block_offset = 0;
> +
> +        while (block_offset < stats->data_size) {
> +                const struct v4l2_isp_stats_block_header *block =
> +                        (void*)(stats->data + block_offset);
> +
> +                block_offset += block->size;
> +
> +                switch (block->type) {
> +                case RPPX1_STATS_BLOCK_TYPE_HIST_POST:
> +                        for (unsigned int i = 0; i < RPPX1_HIST_NUM_BINS; i++)
> +                                printf("hist.hist_bins[%u] = 0x%08x\n",
> +                                        i, hist.hist_bins[%i]);
> +                        break;
> +                default:
> +                        printf("Unknown block type 0x%04x", block->type);
> +                        break;
> +                }
> +        }
> +
> +Dreamchip RPPX1 uAPI data types
> +===============================
> +
> +.. kernel-doc:: include/uapi/linux/media/dreamchip/rppx1-config.h

Hans, compare this with the existing (for example) Mali documentation
in Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst

The Mali one is short on the stats part, but here there's is really
nothing that is platform specific apart from the reference to the uAPI
file here above.

One reason why we want generic formats is exactly because we're
repeating this documentation bits on every formats, without them
adding much if anything at all.

Thanks
  j

