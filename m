Return-Path: <linux-media+bounces-56341-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCreCoYLvGkArgIAu9opvQ
	(envelope-from <linux-media+bounces-56341-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 15:43:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4A62CD12C
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 15:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 605AD30EBD72
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 14:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFEB3D6683;
	Thu, 19 Mar 2026 14:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQX9q88N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F25C35DA67
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 14:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931311; cv=none; b=KNsolWbYk17m+ZFi+x7CDxZwiXETk3vYNcf4c3pjUjHWdtjyI11e4xWHREJNVSsRn5Gqx8fWxJIed9+H/kbi6jt/b7O0/mxGasjOXSd4SCbpffi9eiVpCA/vMfgRthGGyS33HFOgo5a8lqJgiw9FIhshgiylAb8RKfDd3qSx7J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931311; c=relaxed/simple;
	bh=7JJItK1EbpqtAuuT5E/BuYdP/SbDJl/r9WsVMqXZYOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VVvJZaw1HjNZ1isVCY5YrNXkZWwOdiDS8QSvm7B2hfe+HifPyfY72FH8WnJs+ceLZlo5hmI6E91zJ0kWbvRaA8zXdxPxWSIFDJki132OT1oZerUZ4TDsgEqMByOFwNqR1oQcQVT8+ZMm/JxBBgS/4IGNcunVFS9KaHYVUGWjtfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQX9q88N; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b0586d5bb8so5691985ad.3
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 07:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773931309; x=1774536109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=szX8KuRPyf5Ig4UEEtTihMfJ0qSCJ5cmhiHMpFHTxGo=;
        b=aQX9q88NPUl4ouivM/INg9iCESFJy7VKp+Uyg2skc8pPSixJAr1QFfhmpIJ2iiKWJQ
         RBd62tOxqscDtQIvwpoCoKjeX/tV87/fi++nu0j5FtRj/e8ee9BIjCypCLmCdEVsWlMy
         Yu1rKpWMA4BGhpJpID5A6eFIxeOnPV82tPj4ZJncQ9i0NvOcTRCbac8K9EKwypTJupra
         s0OdGId4qy9cYV4S2OS9iN/ukDNXy7YzUa9OvlJidOE5ibGs/odtD9YnwF0PlMrD8cEL
         kJ75l1xs4Z2YFfenSf7oreIe875Bt2gZM5gZgJn3kAT+h7/ICNcDGW9kBn+AMtHffnw7
         egfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773931309; x=1774536109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szX8KuRPyf5Ig4UEEtTihMfJ0qSCJ5cmhiHMpFHTxGo=;
        b=njkiaNsqwC5banG3U5/a+ki1rJutjruZOcbk079K0Cr+eo3i7Z+fxmeOI/C2yyn3TZ
         AEOtGEqBCjjFjTVriJRRDhDYHRSmkc8yDBaQxLWhxOH6mNPT0UDMH5mzAUwVnyiraEKS
         k5NuV3JWmx6iBWSq8M/wlGoHHoJEY0+sx08e+CipLtHjGVqDg/TTAIqqcV6JpEo5qnUm
         TrpZqiVM+pBA+EH8t+0F5Ydnu3KvEyGBSkSCSvIiGu026ooMgVBIJAfAgzeIDuPV2bWQ
         VZTHpwLYsk9Y2H3S6XLDC+Qkzqi4fkOk8cy5VvF04CgGsDWY32e3qdKN3vSZvm5Zv1qU
         +ykA==
X-Gm-Message-State: AOJu0YzBoTGklQn2RAjlCNsQ6W3IWWCQdrUDo3WrAJc0MCpjiYCDD9Ef
	yR/l+zPQNL8TuaadALSe0Wrigq/kPv02reu7W1igJ6aZOtG/QOH5XIJ6
X-Gm-Gg: ATEYQzw6CInvz/i23nNaBnJ/4jtosTcSovDKcIeWeJCzUHA0W0v+xaaqejSBspIGZ/s
	pzcuVbnI3oVECmOAylR97WNStR094kPJ88pG++xh/xLGb2oSZT/VmC5HjUo0ThWyf2+mDrGCf4p
	fLkzISjPF4MI+bh22tBiZXdeIPXWwPUjyQxw/H+GyhI27ygucIazmCd6sbsUpDy32+et4UoJddz
	iUxSKoPB1a1bSI64k5/RzibO5eHUuarQWphirvHxVilgMlEAFbDL/9wo0/W80rt9t2GBGe408xB
	kVOorkxvneo08dS/VdlhVU4/30fUMf58CaeYXi+WuZ/zCgxOCl33fHWxmAXnAkw6brYTG5HPRNC
	iHJOjfkLkDiIW5OaVx+W3qhmlWwnM2syPJP3wmAVFHfx9Xiq5hQ9FQcpV9nAHoMF7nc9Y5fh9gA
	yiYFVR6RmSjptshw80Gr780j85q9/CiyY=
X-Received: by 2002:a17:903:230c:b0:2b0:4d7d:fbc8 with SMTP id d9443c01a7336-2b06e21bceamr77097275ad.0.1773931309274;
        Thu, 19 Mar 2026 07:41:49 -0700 (PDT)
Received: from [192.168.0.106] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e605108sm79415155ad.60.2026.03.19.07.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 07:41:48 -0700 (PDT)
Message-ID: <a5887e4c-6333-4a3f-9ad4-5ba106c0ef30@gmail.com>
Date: Thu, 19 Mar 2026 20:11:44 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: cx25821-alsa: replace BUG_ON() with WARN_ON()
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260314-media-v1-1-fc6235c57d04@gmail.com>
Content-Language: en-US
From: Atharv Dubey <atharvd440@gmail.com>
In-Reply-To: <20260314-media-v1-1-fc6235c57d04@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56341-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atharvd440@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7C4A62CD12C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A Gentle Reminder for reviewing the patch.

Thanks,
Atharv

On 3/14/26 02:02, Atharv Dubey wrote:
> media: cx25821-alsa: replace BUG_ON() with WARN_ON()
>
> Avoid crashing the kernel for a recoverable condition
> by replacing BUG_ON() with WARN_ON().
>
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
> ---
>   drivers/media/pci/cx25821/cx25821-alsa.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/pci/cx25821/cx25821-alsa.c b/drivers/media/pci/cx25821/cx25821-alsa.c
> index 3f73391f9098..4fdc59aaed8e 100644
> --- a/drivers/media/pci/cx25821/cx25821-alsa.c
> +++ b/drivers/media/pci/cx25821/cx25821-alsa.c
> @@ -397,7 +397,7 @@ static int dsp_buffer_free(struct cx25821_audio_dev *chip)
>   {
>   	struct cx25821_riscmem *risc = &chip->buf->risc;
>   
> -	BUG_ON(!chip->dma_size);
> +	WARN_ON(!chip->dma_size);
>   
>   	dprintk(2, "Freeing buffer\n");
>   	cx25821_alsa_dma_unmap(chip);
> @@ -509,8 +509,8 @@ static int snd_cx25821_hw_params(struct snd_pcm_substream *substream,
>   	chip->num_periods = params_periods(hw_params);
>   	chip->dma_size = chip->period_size * params_periods(hw_params);
>   
> -	BUG_ON(!chip->dma_size);
> -	BUG_ON(chip->num_periods & (chip->num_periods - 1));
> +	WARN_ON(!chip->dma_size);
> +	WARN_ON(chip->num_periods & (chip->num_periods - 1));
>   
>   	buf = kzalloc_obj(*buf);
>   	if (NULL == buf)
>
> ---
> base-commit: 0257f64bdac7fdca30fa3cae0df8b9ecbec7733a
> change-id: 20260314-media-52caee1b1f7f
>
> Best regards,

