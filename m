Return-Path: <linux-media+bounces-58960-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEXRBj7e4WklzQAAu9opvQ
	(envelope-from <linux-media+bounces-58960-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:16:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E277A417CA4
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DABEC30211FF
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 07:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5576E340A5A;
	Fri, 17 Apr 2026 07:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cOWLAO1S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBF91C3BFC;
	Fri, 17 Apr 2026 07:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776410162; cv=none; b=RypRSI2qOWP62wGTicDg3rNsVPwl0DtQ5Bf4pkdg8ZSKY4D3Pto6zuOctTPyN3I3V+LbXZm0BBAltpeaLG3FSMMU+MRjBSrLQ/7iv1KimAMoTDAR8tZO/+rgvWpVmgwHbhlZzyEUyJKpBObkMS7s9ESB8F3gQ5FJVdFUkOEPxIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776410162; c=relaxed/simple;
	bh=4S2CWU6/SMrhpf9GUfOJN6Snxr66DLowPKAGkEZOrbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubL2VPbEytYQ91ouf6Cr9SZWIWa5mvATb4BElHq0YzH8XIofWQtv7yZ6Z3rP6OrVJuU2x/Ntve/ui+H4XB283SDOH3M07WN5fcZvqSkuyhAYMMUtRhh7CYLSm9era3FBS5Wb3iV5aXV5gOXyQX/w5ymkIiUjc9PKWVt0V1zJEQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cOWLAO1S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFD9949F;
	Fri, 17 Apr 2026 09:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776410060;
	bh=4S2CWU6/SMrhpf9GUfOJN6Snxr66DLowPKAGkEZOrbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cOWLAO1SnCkXbGrKMX8E6ClI6lCJluEf2bHzz4Xzjbh/sa5MTALFNaScwYsGVsXlE
	 EF973k+flVph55ugr0YBBn7uK/bM4csvatCnCxGFK0n8CO88zGHrO8Xp2ZGXoSAHo1
	 DeRsGoe7XV2+3dVR7Bv+xfdq1R5F2vLqPhQEDywY=
Date: Fri, 17 Apr 2026 09:15:52 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, 
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com, 
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	michael.riesch@collabora.com, anthony.mcgivern@arm.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	jai.luthra@ideasonboard.com, paul.elder@ideasonboard.com
Subject: Re: [PATCH v1 03/11] media: v4l2-isp: Add helper function to compute
 extended stats size
Message-ID: <aeHd0G_JDaROMWDd@zed>
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
 <20260413160331.2611829-4-antoine.bouyer@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260413160331.2611829-4-antoine.bouyer@nxp.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58960-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: E277A417CA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Antoine

On Mon, Apr 13, 2026 at 06:03:23PM +0200, Antoine Bouyer wrote:
> v4l2-isp framework only supports extended buffer for generic ISP
> configuration. This patch adds simple helper function to compute the
> extended statistics buffer size, exactly the same as for extended
> parameters, except that it uses the `v4l2_isp_stats_block_header`
> structure definition to prevent conflict with the
> `v4l2_isp_params_block_header` one.
>
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> ---
>  include/media/v4l2-isp.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
> index f3a6d0edcb24..9a93a534e7b0 100644
> --- a/include/media/v4l2-isp.h
> +++ b/include/media/v4l2-isp.h
> @@ -27,6 +27,19 @@ struct vb2_buffer;
>  #define v4l2_isp_params_buffer_size(max_params_size) \
>  	(offsetof(struct v4l2_isp_params_buffer, data) + (max_params_size))
>
> +/**
> + * v4l2_isp_stats_buffer_size - Calculate size of v4l2_isp_stats_buffer
> + * @max_stats_size: The total size of the ISP statistic blocks
> + *
> + * Users of the v4l2 extensible statistics buffers will have differing sized data
> + * arrays depending on their specific ISP blocks. Drivers and userspace will need
> + * to be able to calculate the appropriate size of the struct to accommodate all
> + * ISP statistics blocks provided by the platform.
> + * This macro provides a convenient tool for the calculation.
> + */
> +#define v4l2_isp_stats_buffer_size(max_stats_size) \
> +	(offsetof(struct v4l2_isp_stats_buffer, data) + (max_stats_size))
> +

Should we do this or simply:

--- a/include/media/v4l2-isp.h
+++ b/include/media/v4l2-isp.h
@@ -15,17 +15,21 @@ struct device;
 struct vb2_buffer;

 /**
- * v4l2_isp_params_buffer_size - Calculate size of v4l2_isp_params_buffer
- * @max_params_size: The total size of the ISP configuration blocks
+ * v4l2_isp_buffer_size - Calculate size of v4l2_isp_buffer
+ * @max_size: The total size of the ISP configuration or statistics blocks
+ *
+ * Users of v4l2-isp will have differing sized data arrays for parameters and
+ * statistics, depending on their specific blocks. Drivers need to be able to
+ * calculate the appropriate size of the buffer to accommodate all ISP blocks
+ * supported by the platform. This macro provides a convenient tool for the
+ * calculation.
+ *
+ * The intended users of this function are drivers initializing the size
+ * of their metadata (parameters and statistics) buffers.
  *
- * Users of the v4l2 extensible parameters will have differing sized data arrays
- * depending on their specific parameter buffers. Drivers and userspace will
- * need to be able to calculate the appropriate size of the struct to
- * accommodate all ISP configuration blocks provided by the platform.
- * This macro provides a convenient tool for the calculation.
  */
-#define v4l2_isp_params_buffer_size(max_params_size) \
-       (offsetof(struct v4l2_isp_params_buffer, data) + (max_params_size))
+#define v4l2_isp_buffer_size(max_size)                 \
+       (offsetof(struct v4l2_isp_buffer, data) + (max_size))

(I wrote this before noticing your patch :)

>  /**
>   * v4l2_isp_params_validate_buffer_size - Validate a V4L2 ISP buffer sizes
>   * @dev: the driver's device pointer
> --
> 2.51.0
>

