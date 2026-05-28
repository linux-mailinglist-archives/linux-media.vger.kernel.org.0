Return-Path: <linux-media+bounces-62954-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBw/ElQjGGrkeAgAu9opvQ
	(envelope-from <linux-media+bounces-62954-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 13:13:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F224A5F11C7
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 13:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69ABB30498F4
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 11:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4243E0C42;
	Thu, 28 May 2026 11:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="JDZnBuVe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7763C6600
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 11:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779966792; cv=pass; b=r4gQ4pIGW8Oq48S20Zz0Dvu14XRfW+js8cq9LP1vF3wL0N95JZxofwLvMkMkIJBKnZJWGfKJO0HNxMBhWrK/8vYJioWqChhZbd7SvY0nqYyqR8TE4f2++7mYOhdheqYqb5+3IgMcvhSB2m+eCHaXv81IBkqMpVYMqxMFLAWmRPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779966792; c=relaxed/simple;
	bh=T1rjAMhdftTqDZ6chYx3CZe6fwuRzKIR5LOW2eZG7Yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d733XGLGbrbx6DtbkpMLaJCqnBHklAZqlgmTLE8vdOluI1kHyT/A/cN6Atb/envRpzm+5mSQnxrmJPrE7IJJq54aEWr3oza5A1mDxF5N1X/5AYVeSSR24JMD5HMNOTzV++2Dauead42mp4LWcX21BI1JgNQqb8vcP0q9lcKCJGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=JDZnBuVe; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7dc18e2498bso12284567b3.3
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 04:13:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779966790; cv=none;
        d=google.com; s=arc-20240605;
        b=PxjngKS8RijvGkLeAzV0gP7TeZ8PXYL2SIMzxienkj0WZtbTHKACtAnPkzoGfF9LPR
         fDaPEA5mxqFBv2ekLGhBSGfwHdKOByElXfJ7jfgrQyMcj7RoePha01vDs69JK9mtdwea
         wn0U2UMg7AQjqMHAFKJJ0dxE+kTswbCHt35mntZvuwSF2hng7/f/qR11FcksB24th3bx
         TlwbToPmQSNNNGQ2USr2y8aSAirEcgnHSJo0+Kek6BTZJLOVchcOF+qJhaqn2SCyJVbG
         ymWiC2bW+l7R4nhiPX0E9F6/wozNviBb6YrbXj7md/Rge1r+WMZd1HomuP9Gz5KJ3o1D
         RCLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7i0x0Mh+/8QbCHs8W0p2ZWAuuuE5/Iaw1kmz3sTCjVM=;
        fh=tk2Ul/AFqwbF2/MDqa67qs6nYoocOd7d6VmM6nnC7Qk=;
        b=eg3au1BNqVEEv50vTmMvzqm2Ukffq7li5FVEBqCFgkv4dfsmzWwhdFBD+WRGkko1Mu
         wE56ZeSlwyg0zDPDzUGvugA+YCEnp6QcDfEn+qfkirAnnEr+RL0FMbMkzI0nOJqPkSO9
         nTyckGzZQpbbEPvNKX0uyjl0udFuCslc1NwuHX4U7vshcjtxUthHW52XGDDGoHSRatkg
         3wokh+gonraFmE7nJNUMx0zDmdyaVraBVELbnJlzDB8awOSHaxf1chYipKfVQUVw9XGQ
         /R0Xak5Vfu8urrcNdLicF+0biCE7v+5xW53UeQeHgXy4H7j/4G0L1QNvjsWA+a909Epq
         SdFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1779966790; x=1780571590; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7i0x0Mh+/8QbCHs8W0p2ZWAuuuE5/Iaw1kmz3sTCjVM=;
        b=JDZnBuVeZHcGVR25QSkmhFSfJP+u8TUnCiEFc9spQD9TJWp6lXs4aP+FtnvHhRNFiu
         s9jYAagkIi6ShPeEyannvTGqoS6QjDakS5rmwZk6GYRoHUmBFe3BpRuHsstlzFsCcdkT
         cwzxI+hbu0DmdWXV/dgi4wfw80PWAvuTW2+Hnwjr70swisn/6ftmLvINoUEZ6ka/X76+
         Mg1r9dMfHRbtvBgcyVygsMBc8sf5Avvs9R82b5z0JmuiZUZqwBIfV5ewwE9BmwIy7f+s
         xeFwwzCnC+wxykoHVYWrglmQzJH2SYVZeK3FCLgCEHYj7W4nbd37cQUB0my3y1umlKrI
         9ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779966790; x=1780571590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7i0x0Mh+/8QbCHs8W0p2ZWAuuuE5/Iaw1kmz3sTCjVM=;
        b=DLwoq6pyeir841OCOfDww3DqHLyTXML6+Etvb5wxxkGPHmoIkmexzPgBCxpsDyv4qB
         bp5EyNaz4uRCs4SkUr/dVTi79hKikpVXCg0CyxhXC/llwgrajkrpizDg6LEOC6F8EcAt
         Ai4Y/e02wjhtTiljhCSSRfCZEo4q/UJ/iipAnXRG/nVUB7NiMSzNGy2Z3VNzge4cGfWd
         z//1ZulVlzM3/+nKVEeKkxYEIU3wVQilALVKLp6bmGJr8s+mJiLB4BXKQFPJ1I5ToK3d
         l7aWE077Hkq+KqmluiaZn5ZFEjtCTiCAuzdPZSGA2XdFI7Bu6hhhhDQh4Je3l2Drn7PN
         NElg==
X-Forwarded-Encrypted: i=1; AFNElJ/tvkqc6S+200IMifUXLqWtpwZlydNYLJZ6O3MKlRrSKRhGW2x1MG9PLoAIklrfxGOOslQAR4k+/pJbUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTKASlfXvPG3SjPHyftI1B75Xgm5uHMHDRn+5UcBZ9D2OXZitK
	NKRkIkYbvtV2qcBcuBj4hE86YmO1lDalaiGCmCBM3Y4I1xDvWzy/aPSlqIO98rPB4gfSe4R4ABg
	Yfdskq0BDIF9bbtnnwCfT4BMFsizDxFpzI00pMjwW+g==
X-Gm-Gg: Acq92OGDZbDKiRdphCLKOkky/kzvmxzAAa6yKaqiLbzvUIO4IIMZ1ojoqLatuMM1Y5m
	OeRltGIJEc1cCfZDwVmHSSGeVIf8atS8sy+Rqx3XCXKwVRgR8x4W8dGte6CdhYNwWF/l4xOYPHk
	oOQVftIXANutbdzVC3bWHsYP5WGlJqGu27t4j50xOcHp1E2Kf496RQ53RqJ8wdmOYxo5E8nZjSk
	gcuqw0CaxD5l8z/M/WMaUg15eleVEm2TLEBXbT3aiTex/czFx2Hq3KIWm3/e/esrKWblZ+Fcvyk
	VHzqoWjuE0J4hpzsWCAJIhFBehq1pN79CnmvAiLmT/6fg7dAqcGL7N5IQAqqBbtrHzbv4goY2wq
	oS8JvlYtgBN6uErM3fiqDmmYk7Iauvrx5ERwpJX76Dyd60w==
X-Received: by 2002:a05:690c:4447:b0:7dc:6d08:f66d with SMTP id
 00721157ae682-7dc6d090307mr22734527b3.43.1779966789832; Thu, 28 May 2026
 04:13:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org>
In-Reply-To: <20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 28 May 2026 12:12:54 +0100
X-Gm-Features: AVHnY4KowDmRsRgFHktSHjKbCUzQp1ZjpPkM0_xWGj4qaba0tEAdnvA-m95xscQ
Message-ID: <CAPY8ntD2AWW7xaSL=J9Esx0XoQQdVFUqhNt=dAi6f0jqsLx1tg@mail.gmail.com>
Subject: Re: [PATCH v2] media: bcm2835-unicam: Fix log status runtime access
To: Eugen Hristev <ehristev@kernel.org>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, Naushir Patuck <naush@raspberrypi.com>, 
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62954-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: F224A5F11C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Eugen

On Fri, 22 May 2026 at 16:29, Eugen Hristev <ehristev@kernel.org> wrote:
>
> When requesting log status, the block might be powered off, but registers
> are being read.
> Avoid reading the registers if the device is not resumed, thus also avoid
> powering up the device just for log status.
>
> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thanks.

> ---
> Changes in v2:
> - changed to use pm_runtime_get_if_active()
> - add corresponding put()
> - Link to v1: https://patch.msgid.link/20260521-bcmpipm-v1-1-3eba88d88045@kernel.org
>
> To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Florian Fainelli <florian.fainelli@broadcom.com>
> To: Ray Jui <rjui@broadcom.com>
> To: Scott Branden <sbranden@broadcom.com>
> To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> To: Sakari Ailus <sakari.ailus@linux.intel.com>
> To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Hans Verkuil <hverkuil@kernel.org>
> To: Naushir Patuck <naush@raspberrypi.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 8d28ba0b59a3..93815b8ab930 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2052,6 +2052,13 @@ static int unicam_log_status(struct file *file, void *fh)
>                  node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
>         dev_info(unicam->dev, "V4L2 format:         %08x\n",
>                  node->fmt.fmt.pix.pixelformat);
> +
> +       if (!pm_runtime_get_if_active(unicam->dev)) {
> +               dev_info(unicam->dev,
> +                        "Live data N/A due to device inactive\n");
> +               return 0;
> +       }
> +
>         reg = unicam_reg_read(unicam, UNICAM_IPIPE);
>         dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
>                  unicam_get_field(reg, UNICAM_PUM_MASK),
> @@ -2065,6 +2072,8 @@ static int unicam_log_status(struct file *file, void *fh)
>         dev_info(unicam->dev, "Write pointer:       %08x\n",
>                  unicam_reg_read(unicam, UNICAM_IBWP));
>
> +       pm_runtime_put(unicam->dev);
> +
>         return 0;
>  }
>
>
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260521-bcmpipm-6c578e73239c
>
> Best regards,
> --
> Eugen Hristev <ehristev@kernel.org>
>

