Return-Path: <linux-media+bounces-52474-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLtFCddtimlHKQAAu9opvQ
	(envelope-from <linux-media+bounces-52474-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 00:29:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 823D2115652
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 00:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA5BF3024A12
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 23:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A527832ABFD;
	Mon,  9 Feb 2026 23:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ka86n62T"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0362632AAD1;
	Mon,  9 Feb 2026 23:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770679755; cv=none; b=pdtFukM7MqFd2lNMgyfw8Cg706RU1zTrtAtsRrVA2VtRWAGQS+4eF/NhgToi+PzW8ymkfeCyac4Y6eqF97RN3C3PuPZJcjkV7xQyuQMbpL6hL3oA8YqrUi1g6EZmWAUn1uvBjMTMwc+Z1i1/EEshKhVGkE1sJH31k3d4jIYUcaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770679755; c=relaxed/simple;
	bh=6YRF/RM4C2vdyZRqt+2HD9H6qbE4nstaOyDBzNqk508=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHOfCGjxSufeY9BD+WO1BqA/sJTCPWcyBYZtwaWHahXsbJNVpblEHitPJmzZ6qM4g6zENL+LQ5WT+9xf90soPdjAoz3B+OOTPlY2BlXLT5QYfMW2AYG+o29Kt+DnwEdzeWPA0eRNn+MyHpCc+T3jBhWpRPlMmRJ8cY+WTyIEzPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ka86n62T; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 43A6412D6;
	Tue, 10 Feb 2026 00:28:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770679706;
	bh=6YRF/RM4C2vdyZRqt+2HD9H6qbE4nstaOyDBzNqk508=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ka86n62T5SDAhL/BulAPwZhsX429N/uzQ2oifRabGtI3C+jI78Y0LkXdVP68t2gYW
	 Cq6FTWb/LrF38MnxYdfHS47PS4QDYFbt+r6L2+mbFzZY7XXRbbD/Jymh2NTRSiNJBT
	 iG3gGkiv+P2ZI7EaVSI4RMv1usG3CBmqwBTgyMnQ=
Date: Tue, 10 Feb 2026 01:29:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC v1 08/11] media: uapi: Add NXP NEOISP user interface header
 file
Message-ID: <20260209232910.GH2405149@killaraus.ideasonboard.com>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-9-antoine.bouyer@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260123080938.3367348-9-antoine.bouyer@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52474-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: 823D2115652
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 09:09:35AM +0100, Antoine Bouyer wrote:
> Add user space api header file for meta data structures definitions.
> 
> This header describes `parameters` buffer for the ISP blocks control by
> userspace, and `statistics` buffer for userspace and IPA handling.
> 
> These 2 buffers both support legacy and extensible modes. Legacy mode is
> a static fixed buffer structure, while extensible mode uses the
> v4l2-isp generic definitions to support various amount of ISP blocks.
> 
> Parameters buffer uses v4l2-isp generic definitions, so as other ISP
> devices (rkisp1, mali-c55). Statistics buffer uses the newly introduced
> generic `v4l2_isp_stats_buffer`, which behaves the same as the generic
> `v4l2_isp_params_buffer`.
> 
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> ---
>  include/uapi/linux/media/nxp/nxp_neoisp.h | 1968 +++++++++++++++++++++
>  1 file changed, 1968 insertions(+)
>  create mode 100644 include/uapi/linux/media/nxp/nxp_neoisp.h
> 
> diff --git a/include/uapi/linux/media/nxp/nxp_neoisp.h b/include/uapi/linux/media/nxp/nxp_neoisp.h
> new file mode 100644
> index 000000000000..186973a1a6b2
> --- /dev/null
> +++ b/include/uapi/linux/media/nxp/nxp_neoisp.h
> @@ -0,0 +1,1968 @@
> +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR MIT) */
> +/*
> + * NXP NEOISP userspace API
> + *
> + * Copyright 2023-2026 NXP
> + */
> +
> +#ifndef __UAPI_NXP_NEOISP_H
> +#define __UAPI_NXP_NEOISP_H
> +
> +#include <linux/media/v4l2-isp.h>
> +#include <linux/types.h>
> +#include <linux/v4l2-controls.h>
> +
> +/*
> + * Check Documentation/admin-guide/media/nxp-neoisp.rst for control details.
> + */
> +#define V4L2_CID_NEOISP_SUPPORTED_PARAMS_BLOCKS (V4L2_CID_USER_NEOISP_BASE + 1)

I wonder if we should turn this into a standard control, given that all
ISPs will need it.

Would a control to report the supported statistics block be useful too ?

[snip]

-- 
Regards,

Laurent Pinchart

