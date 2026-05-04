Return-Path: <linux-media+bounces-60280-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOFPF4yK+Gl+wQIAu9opvQ
	(envelope-from <linux-media+bounces-60280-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 14:01:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 098584BCB67
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 14:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D7AE302A062
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 12:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC54B3C197F;
	Mon,  4 May 2026 12:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xU7lD3QM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8ACB3C1412;
	Mon,  4 May 2026 11:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777896000; cv=none; b=hvTFZyNUqHVzel+K/1SJ7cK+yJnsb9sHoDQkbMqPoZekNfGYu3ztow5EXD1WY2z5PBbtJ/0OVLnM7MQ88kAE+Rn5ErkntdH2WPc0Lf4aBVJy05zQL1UedahmPluog0RcRIMnCYbRgV4Z1CC4U/d3OfYvI1NTbYUTYTi5W4p4aCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777896000; c=relaxed/simple;
	bh=FmmU1zdzb/NwHV/okkpMG5ffX1wADS5zh2r5zlKF9J0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuumQZ3qHW5USMcJdryqcDErSTLSLqKyoEisVnWbfDR6zm3Ev/PIL0Z9WlGIxK6zMU/aXqhf43Hp4Sr2DY3w0Kq0m2hsYx6STivDXpwfkVvif7T48FQGA4KiKXYne5dPpDnMckYaNMgiTZqS/28jYXyKnrJ1XO4qYiuML/b3WOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xU7lD3QM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5C4C2BCB8;
	Mon,  4 May 2026 11:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777895998;
	bh=FmmU1zdzb/NwHV/okkpMG5ffX1wADS5zh2r5zlKF9J0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xU7lD3QMbhkmxDobaKClWo0Ll+gqvoaXSTlzZeHGZZ3iffFnzpMwX+5f1E3r/WFqd
	 L8lwnD76oZHMLGYxeePjOEDzIrJ83gLCqJQ6KFn2TFIn7fhgzcpsY+m+Mc+MNUrq3+
	 eMdHsGfftMnf1k3rFNS3asR73qnTjm1SBBGZQnf4=
Date: Mon, 4 May 2026 13:59:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Cc: neil.armstrong@linaro.org, mchehab@kernel.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hverkuil+cisco@kernel.org
Subject: Re: [PATCH] staging: media: meson: fix typo in codec files
Message-ID: <2026050442-rut-zipping-5de8@gregkh>
References: <20260504111219.7797-1-mahamaryamjavaid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504111219.7797-1-mahamaryamjavaid@gmail.com>
X-Rspamd-Queue-Id: 098584BCB67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60280-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]

On Mon, May 04, 2026 at 07:12:19AM -0400, Maha Maryam Javaid wrote:
> Fix spelling mistake: substracted -> subtracted
> 
> Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
> ---
>  drivers/staging/media/meson/vdec/codec_h264.c   | 2 +-
>  drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
> index 89e0f8624e5b..a6074de15118 100644
> --- a/drivers/staging/media/meson/vdec/codec_h264.c
> +++ b/drivers/staging/media/meson/vdec/codec_h264.c
> @@ -16,7 +16,7 @@
>  #define SIZE_SEI	(8 * SZ_1K)
>  
>  /*
> - * Offset added by the firmware which must be substracted
> + * Offset added by the firmware which must be subtracted
>   * from the workspace phyaddr
>   */
>  #define WORKSPACE_BUF_OFFSET	0x1000000
> diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> index 76e9ca7191ab..ab4374e3b2ef 100644
> --- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
> +++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> @@ -12,7 +12,7 @@
>  #include "vdec_helpers.h"
>  
>  #define SIZE_WORKSPACE		SZ_128K
> -/* Offset substracted by the firmware from the workspace paddr */
> +/* Offset subtracted by the firmware from the workspace paddr */
>  #define WORKSPACE_OFFSET	(5 * SZ_1K)
>  
>  /* map firmware registers to known MPEG1/2 functions */
> -- 
> 2.34.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

