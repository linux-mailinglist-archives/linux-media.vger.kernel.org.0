Return-Path: <linux-media+bounces-65541-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qw/nLu7EO2qWcggAu9opvQ
	(envelope-from <linux-media+bounces-65541-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 13:52:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C2A6BDD97
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 13:52:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IEdr0QeT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65541-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65541-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EEE13024464
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 11:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07CF276028;
	Wed, 24 Jun 2026 11:50:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A762DECBF
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 11:50:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301840; cv=none; b=RzG3Wv+UW8qVVP/H40+Tl72nNXkGYDL78pX+If5qfH5VbpbILFC/O+lVr4vhPUWYP7LHJnIYMHeXtcCkfXySDQGJb4GJUNE12+TWAAjLkwL1sn6DvwSu/b1zkISrJxmFmF8Q0WkedHcLAUxCyDlkOf4w7g4PtArkZYCiaKL4Mqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301840; c=relaxed/simple;
	bh=H9kzeArIrdtsSKoAfhoyLovvflrT2KaPvrL2Ox7o/8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9iJxBt3Dy+TSGXJZ9TkBP1CfSEOLTANjY/om/QULWW1D+jW/tIj5tHV1RDCgilN7ymvxxicfqjPdefkQpUvcG83rLWphL8D+hqHlayd+dWhYl8L859Gwn4St+KSxSAMSEIE3DxOrtQP2jYobWdIkFWdtuKmXx11rIKY+LZo1bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEdr0QeT; arc=none smtp.client-ip=209.85.208.46
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-691c5776f35so1560950a12.3
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 04:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782301837; x=1782906637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eZbMotHgAD6jel0fNJNyUErzOCiB1TTJiURnxn+giCc=;
        b=IEdr0QeTvyLbkzuWalrvMRmYqQ1cpzB0/5C/JR40me6SP1HEMGeydjHVVHeyhCxqQA
         vhSb4nQGZmt00ZeLHC6/jI9UsDQh6sXpOwsc0dfOTnFEwPvCLwsfduJlIsF5odzbC01I
         njIJH/Dll8GuMBtPMtDLm9EAuIlqqY2oEuAVpvStLtkd7XX0yVRdbsOWDYG5ApjSTrvk
         xgNanypcSXPRlEgF9E5dmiaWiZy79ZlnEwEVK79itWSEaUpCuLEshM9sUJgDT3qeP9Qh
         NWdOaMRAIhLfsPwy3hV56eQPmZ0IgVA5srhEYSesI7GlbmTzxDo2jACdKEKP7sSpIL0+
         +sqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782301837; x=1782906637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZbMotHgAD6jel0fNJNyUErzOCiB1TTJiURnxn+giCc=;
        b=K0NQiXaPQ2iIsowN8ntlmukSz7WwGal73L54R+uOVU0c+iwKvNnbIoM8TYSQ3Z2bCg
         1H5P0b7QyQNqkrOIHmZSwtaQgEn7BnPMAUNANgy8aqG5rOe3SgLTyp9/CP7MhpDPn/sD
         i//MVI7B5vRiXHijbwEvdiidWVe++Dh2yUYtQzS2hf5maZiaMtU4I0W7gTXAxg+VnVOS
         Fh5eAzr5XY5BRgA0puBFAFdnHFYdOdo8wYeE7PRJ7W6mLe6CMbAZcb9BZ/lZo/0GAGQ7
         a1Wil+ywE4MsnvE9q4tFiL0t+DplYlPvRrOKqg6GfIhxKb0YTqSONMlQosJprB7CmNNH
         hzXA==
X-Forwarded-Encrypted: i=1; AFNElJ+rerF3Hnk2qmnSfNNA01GoqD0fbjTbDA+GwryoI5FbwwO4WUTCx+APyevLrnb2vfQiSRXlo3cXH33SOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ7gyV1U7LrxZBf+fJvzonwZgmIXfkwYDSFa34e0ds1RcOMsWP
	lqCNg1s/2CShMrQMDo/us/HnPR1C8l7qjn46cHdOobzHDWXhqpilzxyk
X-Gm-Gg: AfdE7cl9Vhu6h29mTnJ4xEsM9Bw0rB7aigDF2xUk8+7ITyEBm6V5oHxK240zfIf1hmd
	n2D95zMa9gb9sKCmjy+RIrk5YkC4dVxv30URWDXpygJ3LLkogcLTkkJ4D+quqB8jttgPCm/3gVy
	lD4Gdp+6vq5MmiA+UF8GD0/70/mSzRDijmeD3z9k9V6fXjmPgmEZGnaSzjsqQWh0a9CMcsFRvHk
	waJbcLlWxP8o2614kpgdVA5+f/8cbGhpmfg2RA9SdcNyLd/WQvKoez9gM6Z+bcjs2goiKyNYJ6o
	txmqxleqtFS3VpFK85M18C1N/YFeaFEK4X5g9Ir3BjW8fwJOUgn+XLtmJBZVNOx19aw3osI1TnY
	ypH9w5a70a7lCShViZvwqVAYbXPRuUFaHxqTWBvB/ahoAj1oOMHyoOqOM0PcUwcYMAqy416KsV5
	k6jMObnv6/
X-Received: by 2002:a17:907:9719:b0:c0d:8c04:92d0 with SMTP id a640c23a62f3a-c119f6127cdmr148307466b.49.1782301836889;
        Wed, 24 Jun 2026 04:50:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c6161f195sm656749866b.63.2026.06.24.04.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 04:50:36 -0700 (PDT)
Date: Wed, 24 Jun 2026 14:50:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Dawei Feng <dawei.feng@seu.edu.cn>
Cc: mripard@kernel.org, paulk@sys-base.io, mchehab@kernel.org,
	gregkh@linuxfoundation.org, wens@kernel.org,
	jernej.skrabec@gmail.com, samuel@sholland.org, hverkuil@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn,
	zilin@seu.edu.cn, stable@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: fix memory leak in cedrus_init_ctrls()
Message-ID: <ajvEiDkI_CcXUz4_@stanley.mountain>
References: <20260624085920.578446-1-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624085920.578446-1-dawei.feng@seu.edu.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65541-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:dawei.feng@seu.edu.cn,m:mripard@kernel.org,m:paulk@sys-base.io,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:zilin@seu.edu.cn,m:stable@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,sys-base.io,linuxfoundation.org,gmail.com,sholland.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,seu.edu.cn];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,seu.edu.cn:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75C2A6BDD97

On Wed, Jun 24, 2026 at 04:59:20PM +0800, Dawei Feng wrote:
> In cedrus_init_ctrls(), the V4L2 control handler is initialized before
> allocating memory for ctx->ctrls. If this allocation fails, the function
> returns -ENOMEM without freeing the previously allocated handler
> resources, leading to a memory leak.
> 
> Fix this by calling v4l2_ctrl_handler_free() on the ctx->ctrls allocation
> failure path.
> 
> The bug was first flagged by an experimental analysis tool we are
> developing for kernel memory-management bugs while analyzing
> v6.13-rc1. The tool is still under development and is not yet publicly
> available. Manual inspection confirms that the bug is still
> present in v7.1.1.
> 
> An x86_64 allyesconfig build showed no new warnings. As we do not have an
> Allwinner SoC or board with a Cedrus VPU available to test with, no
> runtime testing was able to be performed.
> 
> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
> ---

Looks good.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter


