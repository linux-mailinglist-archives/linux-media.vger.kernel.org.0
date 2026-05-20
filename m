Return-Path: <linux-media+bounces-62311-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM0xBV/LDWqq3QUAu9opvQ
	(envelope-from <linux-media+bounces-62311-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:55:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9258C59042D
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BD6DB303306F
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E543E95B8;
	Wed, 20 May 2026 14:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="SB7hSCQD"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DC93DC4D7
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 14:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288648; cv=pass; b=IGaW9cDkCZO7N6ItblHLoWIwi0YdA8RdpwbVUNhrtuEdR/1QL9uc1tkUw5dq7+ecg9pvdHEc5IroXiq17QKxfqd90pi1c5qjzvOkALYsqZU/oSzVF6HEt50YQSJm7SvQXlYnDOzO3bGEicewf4nwK1q0t9VLp7payxZnFRUwOi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288648; c=relaxed/simple;
	bh=KtyTM2IpfxTgORhQ3IWjefHMhQMTjM+XYFwdTMGN3Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bp7Wz4BzuS7PwOvMZINq5WpYEte1gy/CpcNCr9RdsvZB2sP4r8u+QumWmoywCtdcyZoJhMaDPnkP+B95rkmzffvReyfw2jUTgaU0L0cvFUt69OzQQFyp5QNkl6bZ/DB6hXuJCugtA92c+2n1P82v4M2evqjQB/dKFZN1Ma8ZXcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=SB7hSCQD; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4gLDx50jR1z49Q53;
	Wed, 20 May 2026 17:50:33 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1779288633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WDme+ovEo7mVSlS6elBAPpULvLghlwQZaO5Bz5D00iU=;
	b=SB7hSCQD0CFdXB/5GZlFhNAtDnmGD0kFu9NkUapcKWyHWh5LzdS/Ua9OngR+jLwPCgHwnP
	7jKWACVdTYckgkGmmuY9t4tyX6Xfqh43/346FteYQhht75V4ZSoneHnGTSPfo9GGO2ndJ3
	nM8LzIsC290JFil8EjuvtOWdzDJCPECCeKjk7rSAgFeSpFj4LR9lPsDFK3hAjnHSdoxhYL
	OC+AoYI8bxzZK075dObOQ8a9f9Duq0up0+/I1RG0zgJNpc4b499R9JsD66lkZLgGdeBI1L
	4oXhd2lMpaK2aTXe6Hi0bY8XQ8MWeWSlKghHwj7eqp2om5zCUW/QUlZj9krykg==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1779288633;
	b=DwGOcFuUJk5F1wHZi+hK5dzV63NTSmbIKftQc9jWOXj0Fg2dmpCewZTJX2nJPa/QRwDeCN
	/oHZfZnA1I6zwRhSONPC2CZrv/hzyWl99nJLMKcHlXI1sT4Ddfhowv7ssDMT/efZlEpBbE
	2i53c6mh/kcmbfkNljI8eFnJ3aTYGrGnKqmnAr9x59CCmktLYmdiLnZAsWL7B6bDp+6s3O
	tjIhbue4byNtYP7NEE76wFGPuNqG+rfujGIVKPfnTQUlK0zAka0iMbW/Jn1jjh83xvLQ7f
	PneHD1dfDOenKHRv35LJ2Wwa7JBtytMPt3nxcqj6PF0GjBUiuzr12xC6zVXAMg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1779288633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WDme+ovEo7mVSlS6elBAPpULvLghlwQZaO5Bz5D00iU=;
	b=mYZR690eSDWtDXgeGMC90YFjcNW1aSkjhNAec+bqkoH4HNpvqNonzwbowLNKleBOUZyYbx
	5NqoNDZYx+0a571y7JRgP/BMsMZrjg9+baMBXVhjEPNqj10dWPXyA3+U88bGOZ63J+xH+O
	lSRDRPIOaNeKLjZbNkynPHR2MAJ54EMnyeovtedho8t4on6CGwYStxogRBqwbKy5QwUeVJ
	sEqQ4BrzTl/Uyuo8l6HJSp6fYudixbHkCkOHQnKMLl7ayXLpvMqAsZ4d9aZiztIe8LOD6q
	av0fdssFN4egW2XAsHGFAsJwRsWEIQCgBXVdj8AshL68/l3QI4Krwo1+1wIGgw==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 81679634C50;
	Wed, 20 May 2026 17:50:27 +0300 (EEST)
Date: Wed, 20 May 2026 17:50:27 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Denis Yasyuchenya <d.s.yasyuchenya@gmail.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH] media: ov02c10: Add support for 26 MHz external clock
Message-ID: <ag3KMwGMw82SejLE@valkosipuli.retiisi.eu>
References: <CAKP_te-WT+HTEyhSvQ3snEOaTp5B1OUL18JjuzO238=_fTOuXQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKP_te-WT+HTEyhSvQ3snEOaTp5B1OUL18JjuzO238=_fTOuXQ@mail.gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_NA(0.00)[iki.fi];
	TAGGED_FROM(0.00)[bounces-62311-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,iki.fi:dkim]
X-Rspamd-Queue-Id: 9258C59042D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Denis,

On Thu, Jan 29, 2026 at 10:19:52PM +0300, Denis Yasyuchenya wrote:
> Some platforms (e.g. Samsung Galaxy Book with Intel IPU6) provide a 26 MHz
> external clock for the OV02C10 sensor, while the driver currently only
> accepts 19.2 MHz. This causes probe to fail with "external clock 26000000
> is not supported".
> 
> Add support for 26 MHz by introducing OV02C10_MCLK_26MHZ and accepting
> both 19.2 MHz and 26 MHz in ov02c10_probe().
> 
> Tested on Samsung Galaxy Book with OV02C10 sensor and 26 MHz clock.
> 
> Signed-off-by: Denis Yasyuchenya <ceo@znn.by>
> 
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -17,7 +17,8 @@
>  #include <media/v4l2-fwnode.h>
> 
>  #define OV02C10_LINK_FREQ_400MHZ 400000000ULL
> -#define OV02C10_MCLK 19200000
> +#define OV02C10_MCLK_19_2MHZ 19200000
> +#define OV02C10_MCLK_26MHZ   26000000
>  #define OV02C10_RGB_DEPTH 10
> 
>  #define OV02C10_REG_CHIP_ID CCI_REG16(0x300a)
> @@ -568,8 +569,10 @@ static int ov02c10_probe(struct i2c_client *client)
>   if (IS_ERR(ov02c10->img_clk))
>   return dev_err_probe(ov02c10->dev, PTR_ERR(ov02c10->img_clk),
>       "failed to get imaging clock\n");
> 
>   freq = clk_get_rate(ov02c10->img_clk);
> - if (freq != OV02C10_MCLK)
> + if (freq != OV02C10_MCLK_19_2MHZ && freq != OV02C10_MCLK_26MHZ)

While this is enough to make the sensor work, possibly, changes will be
needed to the PLL configuration to maintain the expected pixel rate and
link frequency, as well as to ensure conforming to the sensor's PLL limit
frequencies.

Are you sure about the clock frequency?

>   return dev_err_probe(ov02c10->dev, -EINVAL,
>       "external clock %lu is not supported",
>       freq);
> 

-- 
Regards,

Sakari Ailus

