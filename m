Return-Path: <linux-media+bounces-58874-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNUgNCC64GmIlAAAu9opvQ
	(envelope-from <linux-media+bounces-58874-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 12:29:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7EC40CEBF
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 12:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08C3B30BE3BF
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 10:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DB139FCAE;
	Thu, 16 Apr 2026 10:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eTu2aUO6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31873947A1;
	Thu, 16 Apr 2026 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776335279; cv=none; b=gfaQekVwL5BDUZnpFgjSCdK8VObCzBYq75sozkkFl3GbQBs4ln6pkE225TWMpuW1zr54D069bHNfUezVsi3V1xeaFGhDPaDiy92VcnpE8VLEbXgN4EROi0YwyrEtDyQyTDT3NLN7eEOlD0QCtWr4AuDvGYfx1fK6NU7WhWRgdhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776335279; c=relaxed/simple;
	bh=AQZQJXirR5uwff0hEtbTJcJQnw1BCQ4XAeUKJ+CP6VI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSLPP3i8/GhApK+7H5KDFE2WevyKtPQnb3e063jFBEqyczPApG9fFWKwH1YyvJtT/cfOQnYPAml+/ruT6fv97I3HSJqHC9y+LuGjM5thgBcs97oC00ueD5PQOAaJKzDJGBwEUzdAgXqml8QzSpJSI07it0aMm9hW9+r4boSRLDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eTu2aUO6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED188132;
	Thu, 16 Apr 2026 12:26:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776335182;
	bh=AQZQJXirR5uwff0hEtbTJcJQnw1BCQ4XAeUKJ+CP6VI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eTu2aUO6sA1fG+YdBTolGqXCKa5IC38ZxKNl+0vnLUVIWMo3I4QSvRuV1IxhW0bcL
	 dQauGNfl0cAuXGdChE9PZkYzm0x5J/Nd1+nzyuLImWzfR0ZQGHqIfnOZrom+WOUHqJ
	 0JPYiMwONuoAkb5+eNMyv9edH3vBFJNyIS67aAxc=
Date: Thu, 16 Apr 2026 12:27:53 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, 
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com, 
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	michael.riesch@collabora.com, anthony.mcgivern@arm.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	jai.luthra@ideasonboard.com, paul.elder@ideasonboard.com
Subject: Re: [PATCH v1 01/11] media: Documentation: uapi: Update V4L2 ISP for
 extensible stats
Message-ID: <aeC29bLZM3iuba_U@zed>
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
 <20260413160331.2611829-2-antoine.bouyer@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260413160331.2611829-2-antoine.bouyer@nxp.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58874-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 3F7EC40CEBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Antoine

On Mon, Apr 13, 2026 at 06:03:21PM +0200, Antoine Bouyer wrote:
> Add driver documentation for V4L2 ISP generic statistics format, mainly
> copied from the generic parameters one.
>
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> ---
>  .../userspace-api/media/v4l/v4l2-isp.rst      | 39 +++++++++++++++++--
>  1 file changed, 35 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/v4l2-isp.rst b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
> index facf6dba1ca7..9e9c71bfc0df 100644
> --- a/Documentation/userspace-api/media/v4l/v4l2-isp.rst
> +++ b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
> @@ -24,7 +24,7 @@ correctly populate the buffer header with the generic parameters format version
>  and with the size (in bytes) of the binary data buffer where it will store the
>  ISP blocks configuration.
>
> -Each *ISP configuration block* is preceded by an header implemented by the
> +Each *ISP configuration block* is preceded by a header implemented by the
>  :c:type:`v4l2_isp_params_block_header` structure, followed by the configuration

I would update all occurences of v4l2_isp_params_block_header with
v4l2_isp_block_header (same for the stats counterpart).

The same goes for v4l2_isp_params_buffer and v4l2_isp_stats_buffer to be
replaced with v4l2_isp_buffer.

The compatibilty types should only be there to allow existing
applications to continue working.

>  parameters for that specific block, defined by the ISP driver specific data
>  types.
> @@ -32,8 +32,8 @@ types.
>  Userspace applications are responsible for correctly populating each block's
>  header fields (type, flags and size) and the block-specific parameters.
>
> -ISP block enabling, disabling and configuration
> ------------------------------------------------
> +ISP parameters block enabling, disabling and configuration
> +----------------------------------------------------------
>
>  When userspace wants to configure and enable an ISP block it shall fully
>  populate the block configuration and set the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
> @@ -59,7 +59,38 @@ definition without invalidating the existing ones.
>  ISP statistics
>  ==============
>
> -Support for generic statistics format is not yet implemented in Video4Linux2.
> +The generic ISP statistics format is similar to the generic ISP configuration

Similar or identical ? :)

> +parameters format. It is realized by defining a C structure that contains a
> +header, followed by binary buffer where the ISP driver copies a variable number
> +of ISP statistics block.
> +
> +The :c:type:`v4l2_isp_stats_buffer` structure defines the buffer header which

In this case I would say:

  Extensible statistics buffers have :c:type:`v4l2_isp_buffer` header
  followed by ...


> +is followed by a binary buffer of ISP statistics data. ISP drivers shall
> +correctly populate the buffer header with the generic statistics format version

s/generic statistics format version/serialization format version/

Please check if this has to be changed for paramters as well

> +and with the size (in bytes) of the binary data buffer where it will store the
> +ISP statistics data.

  and with the size (in bytes) of the binary data buffer where ISP statistics
  data are serialized.

> +
> +Each *ISP statistics block* is preceded by a header implemented by the
> +:c:type:`v4l2_isp_stats_block_header` structure, followed by the statistics

Use v4l2_isp_block_header

> +data for that specific block, defined by the ISP driver specific data types.
> +
> +Drivers are responsible for correctly populating each block's header fields
> +(type and size) and the block-specific statistics data. The flags field can be
> +left empty, it is not relevant for statistics data.

I would say that

  The flags field can be populated with driver-specific flags, if any.

> +
> +ISP statistics block configuration
> +----------------------------------
> +
> +When an ISP driver wants to share statistics from an ISP block, it shall fully
> +populate the block statistics.
> +
> +When ISP driver wants userspace to ignore statistics from an ISP block, it can
> +either simply omit the full block, or omit the additional data after header.
> +In second case, block header's `size` shall be filled with header structure's
> +size only.

Mmmm, I would not do that. Drivers should only report stats blocks if
populated. Is there a use case for reporting only the header ? (we
allow this for params as userspace can enable/disable blocks).

> +
> +Extension to the statistics format can be implemented by adding new blocks
> +definition without invalidating the existing ones.

Thanks!
  j

>
>  V4L2 ISP uAPI data types
>  ========================
> --
> 2.51.0
>
>

