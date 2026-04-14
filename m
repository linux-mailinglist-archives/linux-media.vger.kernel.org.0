Return-Path: <linux-media+bounces-58751-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGr4Lndi3mldDgAAu9opvQ
	(envelope-from <linux-media+bounces-58751-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 17:51:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 288973FC247
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 17:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3568C30911F2
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 15:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370EC3EC2FB;
	Tue, 14 Apr 2026 15:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MAbti3BW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1D03EC2FD
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 15:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776181617; cv=none; b=A8Gdm8h8VMF+H97ZRvHv2YT0Y4f5UHX44OGpLP3vwXT1Mf7UfResbsXA2ehBLxe5sSMbbgcHYZjEZbcUXx4wdKT63lg+hnTIA1g79ThSNCeOca3IjHcH6Nc1TbgGlLh+9Lkn72fwyHsKCsKfMKqO08iN/bqpt6yS09B3HRZib8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776181617; c=relaxed/simple;
	bh=5HmdW4NBI8fhvU6C1IU3YacEUUAomllmtzA6ArkCMJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYY7QUoJAQqbqpj/BqaXXBaOcTZuI9bSbvthaT75sD2o8Hcfdi4BLMiaITCp8OKyi1ZZC2cXddKSQFGalB62tocevqZ1HZd1Cm/inUx4YS3gkI6wYpt4Y0vGrPs7SY30H/5XGso3pEohdRYxzEp5kUYSPWfYtKJRhUa1R1Wg8Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MAbti3BW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F96963D;
	Tue, 14 Apr 2026 17:45:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776181522;
	bh=5HmdW4NBI8fhvU6C1IU3YacEUUAomllmtzA6ArkCMJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MAbti3BWhVrXXX4Fuxupi1PKogfDZxLBuQfS1ZFI66ykvhIVeseR5568UVrYmpN9D
	 4ahVU6fIpUtXBZYdzInt1gdkhvfJy/0C6w9gmBI1ospMIfTcJquKlJgmACHjdP7dwZ
	 wCf6ub0LfeSULVVDHeWlNHWCLFtZeRbwNJru/Ujo=
Date: Tue, 14 Apr 2026 17:46:51 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, jai.luthra@ideasonboard.com
Subject: Re: [PATCH 1/1] media: Documentation: Improve PIXEL_RATE control
 documentation
Message-ID: <ad5d_I4LGrLLEVK2@zed>
References: <20260414103559.1021712-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414103559.1021712-1-sakari.ailus@linux.intel.com>
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58751-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 288973FC247
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Tue, Apr 14, 2026 at 01:35:59PM +0300, Sakari Ailus wrote:
> Document explicitly that the PIXEL_RATE control reflects the actual
> frequency at which the pixels are read in the pixel array. It is thus
> orthogonal to analogue binning.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> index 6d516f041ca2..8616bcd67270 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> @@ -41,6 +41,11 @@ Image Process Control IDs
>      The configuration of the frame rate is performed by selecting the desired
>      horizontal and vertical blanking. The unit of this control is Hz.
>
> +    Note that this control isn't affected by analogue binning as the pixels are
> +    still being read at the same frequency as without analogue binning, only
> +    what is being read is different (a single pixel value vs. a binned pixel
> +    value based on the values of two or more pixels).
> +

This breaks the model implemented to support "special" (aka analogue
?) binning mode on imx219 where we double the pixel rate to express an
higher frame rate and halve the blanking values before writing them to
registers

I guess we have to keep this mode working not to break existing
userspace, also because it's the only way we can have it working
without the introduction of the FLL and LLP controls.

With the new model and FLL and LLP controls, I presume analog binning
would require userspace to program halved FLL and LLP values ?

Currently in your proposal of V4L2_CID_BINNING_FACTORS it doesn't seem
there is a way to distinguish between  a digital and an analogue
binning mode, they're both 2x2 so I guess it's the driver that has to
realize that if FLL and LLP are smaller the [output width + blank] it
has to activate the analogue binning mode ?


>  ``V4L2_CID_TEST_PATTERN (menu)``
>      Some capture/display/sensor devices have the capability to generate
>      test pattern images. These hardware specific test patterns can be
> --
> 2.47.3
>

