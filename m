Return-Path: <linux-media+bounces-59063-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9BuxHepB42nUDwEAu9opvQ
	(envelope-from <linux-media+bounces-59063-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 10:33:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B683C4206DA
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 10:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5E8A302BDD3
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 08:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCD419A2A3;
	Sat, 18 Apr 2026 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="IKZXo53P"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7BE13A86C
	for <linux-media@vger.kernel.org>; Sat, 18 Apr 2026 08:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776501201; cv=pass; b=t0ujCRkJa5D7n6uxHDQca7i2X03VCbiFnyQbRnlHulLJZBD2LrW/9AtDCMjWCpFmfTpI+MuRoutWsKYJmrtniV8LPoYIg7rx00wCqXzTOMDiIzX/QmcgygbG6nApYMIo0xqsRKYlunQNyOhTWS81lzkMjf7WHQi02DaM5SELWUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776501201; c=relaxed/simple;
	bh=zV7a9PfN6K7ciYlTewPe9J3QAaM9+cFRxRAQBNb3URE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BF5B9U0L4sgVgyAFQhI6bdzVtlA+XkGs9giKQB2zy8ZSliIz8eapjAjh/oKnxKXrZL1uKGEaqqKRFe4LI1XEq7KWgCn9YF157U1h/CrAPLBloVbGG5PK132PCtMEJ6bK4/MEtdKN/kwGc5a/mCdSGwA4/vGlfIz5uxdeiwr2jl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=IKZXo53P; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fyQ4Y43LhzyRd;
	Sat, 18 Apr 2026 11:33:17 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776501197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Gz9hBZGZo59mMBTBk0HvC0M7es+lAdIoQLDSc2h2G4=;
	b=IKZXo53P0B+QNGsUhaoU54cquYyHB47BwL8AA5AW6pD+X0jj2vhRb6um1JBFgcMBW4L83V
	Us9Ie3ZVhjxNxx1amvepa3WDOhtD5bu4d3pmrQkRr19c2bKgkGeKXttW3r0aXhO190CehY
	7iHDamXWdDhL5cwb4mLIpx3Q8jHAjE4=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776501197;
	b=ZL4S0Dp7rg1UhD5GtV3e0fpCgqP9V9pGdwKFWdgWiKAIXkGZ7KVOWaK53sYtJZFePfLZwd
	tncP45NRnmhhPHL9E2wQpMACu7O1vh687y3vgB7ApEkF4KoHiv4p+4hp4g/A7nUxjD7roq
	3RpiBSw7FLlb4jVzPMUCrnMHnH8ZHk0=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776501197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Gz9hBZGZo59mMBTBk0HvC0M7es+lAdIoQLDSc2h2G4=;
	b=VmVoVipZ7yH7gdi+SaYeSYOQG3rz0uvIzcXAUQE9y1ZH6JL9UxjE7oiBZQjui97qrajfcW
	nYmzWdlkc8R1ptdCY3petdx2+0b1rTPWpt/WuYPvDf3ozbpDRh4mFCKTJPX6dAY0KiTCUF
	0l50gtIyTJJkvzIcCwtQa22i5n+kti8=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 39B86634C4E;
	Sat, 18 Apr 2026 11:33:17 +0300 (EEST)
Date: Sat, 18 Apr 2026 11:33:16 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: hansg@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: fix indentation in atomisp_cmd.c
Message-ID: <aeNBzDprsW5QiXZ4@valkosipuli.retiisi.eu>
References: <20260301211142.3479-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301211142.3479-1-rayfraytech@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59063-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[iki.fi:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,valkosipuli.retiisi.eu:mid,iki.fi:dkim]
X-Rspamd-Queue-Id: B683C4206DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Oskar,

Thanks for the patch.

On Sun, Mar 01, 2026 at 10:11:42PM +0100, Oskar Ray-Frayssinet wrote:
> Fix incorrect spaces at the start of lines in function
> parameter lists, replacing them with proper tab indentation.
> 
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 5bc1541b1e40..9d22ec27ea76 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -1888,8 +1888,8 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
>   * Function to check the zoom region whether is effective
>   */
>  static bool atomisp_check_zoom_region(
> -    struct atomisp_sub_device *asd,
> -    struct ia_css_dz_config *dz_config)
> +	struct atomisp_sub_device *asd,
> +	struct ia_css_dz_config *dz_config)

There's more room for improvement here. Same for the rest.

>  {
>  	struct atomisp_resolution  config;
>  	bool flag = false;
> @@ -1923,8 +1923,8 @@ static bool atomisp_check_zoom_region(
>  }
>  
>  void atomisp_apply_css_parameters(
> -    struct atomisp_sub_device *asd,
> -    struct atomisp_css_params *css_param)
> +	struct atomisp_sub_device *asd,
> +	struct atomisp_css_params *css_param)
>  {
>  	if (css_param->update_flag.wb_config)
>  		asd->params.config.wb_config = &css_param->wb_config;
> @@ -3897,9 +3897,9 @@ enum mipi_port_id atomisp_port_to_mipi_port(struct atomisp_device *isp,
>  }
>  
>  static inline int atomisp_set_sensor_mipi_to_isp(
> -    struct atomisp_sub_device *asd,
> -    enum atomisp_input_stream_id stream_id,
> -    struct camera_mipi_info *mipi_info)
> +	struct atomisp_sub_device *asd,
> +	enum atomisp_input_stream_id stream_id,
> +	struct camera_mipi_info *mipi_info)
>  {
>  	struct v4l2_control ctrl;
>  	struct atomisp_device *isp = asd->isp;

-- 
Regards,

Sakari Ailus

