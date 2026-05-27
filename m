Return-Path: <linux-media+bounces-62861-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDf5Nce2Fmo6pwcAu9opvQ
	(envelope-from <linux-media+bounces-62861-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 11:17:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 585425E1AC7
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 11:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 607D0302A4DA
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 09:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE49F3E6DDC;
	Wed, 27 May 2026 09:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="RX1xznAb"
X-Original-To: linux-media@vger.kernel.org
Received: from outbound.soverin.net (outbound.soverin.net [185.233.34.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CBD3E7151;
	Wed, 27 May 2026 09:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779873203; cv=none; b=LOizTUV/tsdZntyS2HxscSLHewB/5CCck4Fhq//kXetglU/CIkTIxiSpxQM1vZys92iru1fpSP4RUvxcwyMk3Lpi/Zcsr77IplWE8faS6LBupnI0VQsWq0tiwl2IKHXvj1qYo153smcj+UmjvVywSPwcDyRFTRldgrja4Ue6U6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779873203; c=relaxed/simple;
	bh=MdfCAFoUBjK43tuM8ptdLXguK4v3FM8uYeH5PUsCbQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I28RSugWbW+wnFicRKtuRCT3L6NaIsTML0J1YY3CW73fTdNUP5fAwN3Jvo8vLLhWKEDwJyLursaeDOMmYUMO55GAK9IblDqDm4SD2CKtcBRnbmED827Kl/WtIlJhRlgNKPn84MTwtIT4fHYSP8hbTbZxFcQjI7f287rhZ8v6jT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=RX1xznAb; arc=none smtp.client-ip=185.233.34.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 4gQP6b68gpz1NNH;
	Wed, 27 May 2026 09:13:11 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4gQP6Z617bz2xLS;
	Wed, 27 May 2026 09:13:10 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=RX1xznAb;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1779873191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=etfwjiPIcnyIi3OTeXprjKmDih1/Qt0l4v+9NlSouZ0=;
	b=RX1xznAbimCP0LGxs4wx6uOEiugUNoFgEHJJIbZFQ/27gOBk3yxsLhSRXpxO5COoB0h08m
	eMaMthvFMLYuN3nIb+s2piMWLaaY0A1GKV0Ede2M/Be8RHei+U6G4zvNBwazHpgE1fU5n4
	SsJ5cR8F76S7NRN6elZfkWyZAIV+Le5Aj6AwXylVKOLcuurONysjMQtIQbSXka19HuMlhY
	BShxElkY84Rgnd5lNsP3yWcNZc6ncejPO1YL1P08pPwVa4B0YX2xMdk3E2wOixzXaBlnBi
	UbFUnaJ6s2b2ghJnwVMXvpzjEYOl2a1SCACex/X22LB64bA7kdKxEMJCXCmNyg==
X-CM-Envelope: MS4xfHpRFkbO+JcS4iICG734fMU6AHzEPVOAMQtzc8vO/acBDXCdaM4gGjuaP1QcEnnn+N0qhI7bPFS2vxLItIQ/YREg1/BocdGuOppa+eA8/3UQG50rsuoK 3mcpKln45Xyl2vlnqysVIntZhZfIdV/nMvqpXLrDF+ZFj3C3RiTKoH8urK7xWKDJcNvUp1Hs4bbShpi3pmp2yChyRu72Ny+xulCjOBkuaEACvAD6EZco0613 nkODkRn0c+TDakZ8PtjS5aKB5+vdTI9vN+Hhe8uWquXnlnhoqGBNkfDNZ1QmpkgrB8EyJtPfQkuFq+RBjysoFwqEg37Rvhal7jcvWrQ/5MsVftul3vIsZphw N70lak5ALSYz8xNwWT1m8hP12l/Rk2cSl8d0WPsANQO6NzckJXkJGK9wthDn7RW2+9uLXnacHwlRxz6iylPEzgAvR/pDMWnDyBGskQZqtAY++Rtc+PM=
X-Soverin-Id: 019e68b5-9458-7bd9-b8c6-f0959a4a33e1
Message-ID: <59a90896-5e23-4afc-b437-a71bfc57a55d@jjverkuil.nl>
Date: Wed, 27 May 2026 11:12:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] staging: media: imx: fix parenthesis ending checks
To: Mark Adamenko <marusik.adamenko@gmail.com>, linux-staging@lists.linux.dev
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260310002643.27465-1-marusik.adamenko@gmail.com>
Content-Language: en-US
From: Hans Verkuil <hans@jjverkuil.nl>
In-Reply-To: <20260310002643.27465-1-marusik.adamenko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[jjverkuil.nl,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[jjverkuil.nl:s=soverin1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,pengutronix.de,linuxfoundation.org,lists.linux.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[jjverkuil.nl:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62861-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hans@jjverkuil.nl,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,jjverkuil.nl:mid,jjverkuil.nl:dkim]
X-Rspamd-Queue-Id: 585425E1AC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mark,

On 3/10/26 1:26 AM, Mark Adamenko wrote:
> Remove 4 checks for ending with a parenthesis by removing unnecessary
> line breaks, and forward declare a variable for a function call that
> would otherwise remain over 80 columns.

Sorry, but I'm rejecting this patch: it just swaps one 'problem' 
(parenthesis ending check) with another problem: long lines.

In the end the current version is just more readable, so I'm just 
dropping this patch.

Rejected-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> 
> Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
> ---
> v3: fix commit message
> ---
> ---
>   drivers/staging/media/imx/imx-ic-prpencvf.c | 16 ++++++----------
>   1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
> index 77360bfe081a..2339b59af7b0 100644
> --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
> @@ -315,8 +315,7 @@ static void prp_setup_vb2_buf(struct prp_priv *priv, dma_addr_t *phys)
>   		buf = imx_media_capture_device_next_buf(vdev);
>   		if (buf) {
>   			priv->active_vb2_buf[i] = buf;
> -			phys[i] = vb2_dma_contig_plane_dma_addr(
> -				&buf->vbuf.vb2_buf, 0);
> +			phys[i] = vb2_dma_contig_plane_dma_addr(&buf->vbuf.vb2_buf, 0);
>   		} else {
>   			priv->active_vb2_buf[i] = NULL;
>   			phys[i] = priv->underrun_buf.phys;
> @@ -704,11 +703,9 @@ static int prp_start(struct prp_priv *priv)
>   	}
>   
>   	if (ipu_rot_mode_is_irt(priv->rot_mode))
> -		priv->eof_irq = ipu_idmac_channel_irq(
> -			ic_priv->ipu, priv->rot_out_ch, IPU_IRQ_EOF);
> +		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu, priv->rot_out_ch, IPU_IRQ_EOF);
>   	else
> -		priv->eof_irq = ipu_idmac_channel_irq(
> -			ic_priv->ipu, priv->out_ch, IPU_IRQ_EOF);
> +		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu, priv->out_ch, IPU_IRQ_EOF);
>   
>   	ret = devm_request_irq(ic_priv->ipu_dev, priv->eof_irq,
>   			       prp_eof_interrupt, 0,
> @@ -750,7 +747,7 @@ static int prp_start(struct prp_priv *priv)
>   static void prp_stop(struct prp_priv *priv)
>   {
>   	struct imx_ic_priv *ic_priv = priv->ic_priv;
> -	unsigned long flags;
> +	unsigned long flags, timeout_in_jiffies;
>   	int ret;
>   
>   	/* mark next EOF interrupt as the last before stream off */
> @@ -761,9 +758,8 @@ static void prp_stop(struct prp_priv *priv)
>   	/*
>   	 * and then wait for interrupt handler to mark completion.
>   	 */
> -	ret = wait_for_completion_timeout(
> -		&priv->last_eof_comp,
> -		msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
> +	timeout_in_jiffies = msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT);
> +	ret = wait_for_completion_timeout(&priv->last_eof_comp, timeout_in_jiffies);
>   	if (ret == 0)
>   		v4l2_warn(&ic_priv->sd, "wait last EOF timeout\n");
>   


