Return-Path: <linux-media+bounces-52119-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGeBBtQqgmnFPwMAu9opvQ
	(envelope-from <linux-media+bounces-52119-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 18:05:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF4BDC7A8
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 18:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45810310AAFB
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 16:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC853D348B;
	Tue,  3 Feb 2026 16:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n237boGu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B354922B594;
	Tue,  3 Feb 2026 16:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137913; cv=none; b=FyvQKEctDGP1If/RzUPlO709hOq1EGOB/sNT6NeUBet9D1+kLXajrQh3UfmmP9hJSjmaKlOb4Lv4R+hYID5KGej4F9vg8Pdrg4hiwSxweq82eUYeoQQvTn3q57TIXZtexFl6ppxJQHigjovdzY+vowlWA6W5jVRgqN6Faquajgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137913; c=relaxed/simple;
	bh=NSYPUPZWXDLuCtO39t5GyykpA1ZOhaUNZcwUuf6zVQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7vhvVhsNNMoD7UtkqVSgO4Cpn8MaU/FVyr7jEg77eOr+taS0J+ayG6OcwZbl/vsqN5MBMgf09Ku61CtbPzflkQBprOAv3u4A47BkqeX4UKakpvuoapW4vsvZxYlznuHmcmepGtExyHLKYrql/hIA1KX2HQAezwp8Y3FX+6MKQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n237boGu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65D381C6;
	Tue,  3 Feb 2026 17:57:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770137867;
	bh=NSYPUPZWXDLuCtO39t5GyykpA1ZOhaUNZcwUuf6zVQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n237boGuSEMhCNzRCGdQjcQHn/aGtDAHdOd5l+/pvjqzaosOeZgIUItXQJ6Ro/Zom
	 VP0XrFPNMMrLpIhZpU6E3REhd427vqfHPhwA7NwJ+LPE21LKmpR2KCV90zLWqk8Q6j
	 Vdbibs49jVEfAKte33Yynrx79VudptUKR61QrMEQ=
Date: Tue, 3 Feb 2026 17:58:25 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, 
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com, 
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC v1 03/11] media: Documentation: uapi: Update V4L2 ISP for
 extensible stats
Message-ID: <aYIguNosvsnnraZO@zed>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-4-antoine.bouyer@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260123080938.3367348-4-antoine.bouyer@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52119-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 9CF4BDC7A8
X-Rspamd-Action: no action

Hi Antoine

On Fri, Jan 23, 2026 at 09:09:30AM +0100, Antoine Bouyer wrote:
> Add driver documentation for V4L2 ISP generic statistics format, mainly
> copied from the generic parameters one.
>
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> ---
>  .../userspace-api/media/v4l/v4l2-isp.rst      | 42 +++++++++++++++++--
>  1 file changed, 39 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/v4l2-isp.rst b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
> index facf6dba1ca7..9024c6998b2c 100644
> --- a/Documentation/userspace-api/media/v4l/v4l2-isp.rst
> +++ b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
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
> @@ -59,7 +59,43 @@ definition without invalidating the existing ones.
>  ISP statistics
>  ==============
>
> -Support for generic statistics format is not yet implemented in Video4Linux2.
> +The generic ISP statistics format is similar to the generic ISP configuration
> +parameters format. It is realized by defineing a C structure that contains a
> +header, followed by binary buffer where the ISP driver copies a variable number
> +of ISP statistics block.
> +
> +The :c:type:`v4l2_isp_stats_buffer` structure defines the buffer header which
> +is followed by a binary buffer of ISP statistics data. ISP driver shall
> +correctly populate the buffer header with the generic statistics format version
> +and with the size (in bytes) of the binary data buffer where it will store the
> +ISP statistics data.
> +
> +Each *ISP statistics block* is preceded by a header implemented by the
> +:c:type:`v4l2_isp_stats_block_header` structure, followed by the statistics
> +data for that specific block, defined by the ISP driver specific data types.
> +
> +Driver is responsible for correctly populating each block's header fields
> +(type, flags and size) and the block-specific statistics data.
> +
> +ISP statistics block configuration
> +----------------------------------
> +
> +When ISP driver wants to share statistics from an ISP block, it shall fully
> +populate the block statistics and set the V4L2_ISP_STATS_FL_BLOCK_VALID
> +bit in the block header's `flags` field.
> +
> +When ISP driver wants userspace to ignore statistics from an ISP block, it can

What would be the use case here ?

I checked a few datasheet and drivers and I haven't found any "failed
to read stats" bits, and even if that would be a thing, isn't it easier to
simply overwrite the header of the failed stat block instead of
marking it invalid ?


> +simply omit the full block, or set the V4L2_ISP_STATS_FL_BLOCK_INVALID bit in
> +the block headers's `flags` field. Then driver can omit the additional data
> +after header, and set block header's `size` to the header structure's size only
> +in such case.
> +
> +Setting both the V4L2_ISP_STATS_FL_BLOCK_VALID and
> +V4L2_ISP_STATS_FL_BLOCK_INVALID  bits in the flags field is not allowed and
> +userspace shall not handle it.
> +
> +Extension to the statistics format can be implemented by adding new blocks
> +definition without invalidating the existing ones.
>
>  V4L2 ISP uAPI data types
>  ========================
> --
> 2.52.0
>
>

