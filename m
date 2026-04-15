Return-Path: <linux-media+bounces-58837-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMncDAnJ32nVYwAAu9opvQ
	(envelope-from <linux-media+bounces-58837-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 19:21:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F839406BF5
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 19:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2596132F5BA0
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E625D3E51F7;
	Wed, 15 Apr 2026 16:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2CO8yjU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7943E3D93
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 16:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776272179; cv=pass; b=Wn62bAoN+BlCJJcWzwpaquGu/8aBycjDqVYOw9PJDfKBjoVAs8rAXaDjP+c/0aGO05/Be0DwzxBOngq2/XZ68oUVh716cO9SAvHoqTzoZ3cHUgRYHoPmhU+GbGQaGnyreh4pynPpcbzZO8w4VqKEC1bR2E+VwOM2eTMZdt/B/Zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776272179; c=relaxed/simple;
	bh=5epuAobbYmsxoedp3xAwQFuZrWLlYCQPKXraMn3SjRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rbw7vDfln75hBVTIuL6SkWxRegHM9uHIc9CJ5uS2VN7zL/M5TaqSDjiluqaeartNZ8cOzAt7DnBjbGo6fCuOuTz8VO4R7y/v/yqYIBLfepVT6nv83FkSdp0qVVfGdF0QWCrPG7s3I38HzTwx/7dwYcIEWtExdErIJTppkjMKYR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2CO8yjU; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6501c9903edso7864477d50.1
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 09:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776272177; cv=none;
        d=google.com; s=arc-20240605;
        b=UjxQ8w6IWcWtLa2Yu8GmkPyowrrI9uoaNFHjL3FGLyapCtfwo+7JQ6/f9Rou+oxf+K
         pby6b72Y+c0sq2ImhcX+2Bc5ERpvdtk9DG5tF+j2xM1x6H/+kp8gLR6AK/Lf/M2phg22
         sOM3/+PPkp1ZNiSeawBWXQaNlYZSIE+qpPwTMDy50zVdJnRuo7foZBkNa0GrBW6bKwOL
         o/45d2D943gOXjp3f4BrRZKg5VvzRH2oGX/DJxpnVuwSZydtmtSGI5RDC2r+BnK7a12g
         OgxY1JaHq1/EBJSefsaf+M4tCl2hxZiGr47dpZbSpec6bZjE8n+Gu8bdbWtDRoNFjOGi
         PTUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DxfxzTbLJENYe0fpAejm84GGliDjSkVvHXvgo3kQKiw=;
        fh=BjK6ST/Jdgyfn44JWQfxXVPkUxaz4T7t3yDFOV5M4oE=;
        b=O+hAc8AyARJYj1t4q7gqdS121CKliEp5G0ewtMiajMGQ04hurgBQaXg7SUMHmTEsSg
         FXN7/MjLrmGkmaKN833FO4SfFEMApidmhAyi0Hpnz6JrBGuUDE4uSxVr+RylflO0TJTS
         iOzFCP9vXv9iU4jL9xTEu9K+E2sm5TIU0PV7sFbO/KSJ35bi1S3aQFyO9M3nhyO/vsTC
         v0ExjwVWbRsfnoi5sc7/EvZGwJeA2UG8DO7log19+mxzR2IJOZAeADrLfycA+POZbNAe
         I/uu6EOowqOUYKZ58yeEHbvQqrjJ/uHiqZ+nWGM3y/QWybX17oZNm03XEHH+BrzNgCyg
         AmyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776272177; x=1776876977; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DxfxzTbLJENYe0fpAejm84GGliDjSkVvHXvgo3kQKiw=;
        b=L2CO8yjUI0M9naLEKslWmmJBPwCOz84N7R44enYFAg4aaymGVs3R2iWZwhl6HuNNzN
         bDJG3LXmj0sQ7AMmeZVgM7DU+rvWyL48LvN2QC3UiqqbDgZv3p6jW1A99GGyCSfg3T5/
         t3VCdIgBgiKwpXjcTx8lvvHV1SUfQUhoHGWvt28dKy5KICpzDNr3w32fNisIXgnkxZyx
         vOm9CE6AhCMkmA+zkBzYo/X9uyjMPLGv4tJkzPFapHWlbnn1N43KxiwGZaAJyhRtRJ+r
         yg2ArFl20sKu7ACqJmBk/BgsItiBinreqUuKnCG9D54O4Nzv5zuxi1vA8CDWsaH7nYKl
         9y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776272177; x=1776876977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxfxzTbLJENYe0fpAejm84GGliDjSkVvHXvgo3kQKiw=;
        b=WnUn2Zk9PnJq50VLux+NDDCk4Nb7S1MCF41bS13H9BHAkVIq5vhS2gO4m/v03XxXh3
         qOYpW8JoMTmnzV88jTqnRkyySiKoGV+hmTPkxV5NQ00lPQPamaFdHkqU/SJpAeGEpPEL
         wyqkXOw6w3SHxRuRzH7rr1nl2UfJiuOC5tCKfswjwa1RZKfc8gjDoR6gNhC/tzLh5lN4
         BOiaoxnrcbjj0wSDfhWu4WOlS4JeFOjxAQH8AgzygDaPlbJ/dW9wv6B6rpIQyhua8GT5
         1rtal27tINW8ce8jCIDm7zdSNbjNSxfvXZLiN64OXnkDqPtcHc6FidhBCGHZzX6x7k9a
         q5pw==
X-Forwarded-Encrypted: i=1; AFNElJ+aZaWyvC6myguKp2GD9oc4HG3+n7jwpzSXtWbWUun7wBGuuI1JeBVFp7fAF6ypRZpMeCtBEesdjkug6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/92a117FubYyj+1uzHta+uGc3JdiSeqCHZR0gEXtgZJAUk7SP
	33e7A8xxDKyAIAETroYuGB1Gzp2qSHs/3I8WZTU94dngca2lgswbabrjFEha2I+6HjIep4KjZP6
	7ewxr4P7sKXov7w2kHjs6FE8NzdhRA9A=
X-Gm-Gg: AeBDievwRV3b7FUy0+TdPjmdDPAcdUSMDB8pZTge4rftFiqNQC62rLqRPZt05b6NVZK
	SN8j9brIKaAaEWRGZRz0jYXhr49GQrTB8tc+uOSfxo5Uys2dMXhVP16zNQkQxxvfSd0VyrvlLzD
	dafapbrlGwm/RC6/p32m9+3gm7FsenH4u6zKsypCpD8WQRBwbtEHeeH+fnvgBR55nv9YaaK0gra
	joAiTat9de24IYr4730PQQeKglksFcL4L2sp6ORFizUsX45AQdAhPcGQoIYw7PkunFv1yctxnmA
	nrbmwLnkM5XcXCHmuT0=
X-Received: by 2002:a05:690e:d47:b0:650:3bbc:5375 with SMTP id
 956f58d0204a3-65198a6a25fmr20140207d50.17.1776272177023; Wed, 15 Apr 2026
 09:56:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415154537.3451732-1-lgs201920130244@gmail.com> <75275f6e-8314-4dd6-a54e-95320c2224e2@linuxfoundation.org>
In-Reply-To: <75275f6e-8314-4dd6-a54e-95320c2224e2@linuxfoundation.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 16 Apr 2026 00:56:05 +0800
X-Gm-Features: AQROBzDWvsozjNU7eDjvF9U_L-zmhpO2iMCzmTSGiAlkEe91aq-uxJImLxVv6s8
Message-ID: <CANUHTR9j8-wHB8rE1zGLaUw4ZyNh2Mq3njFerBoUcVPWAh7w6A@mail.gmail.com>
Subject: Re: [PATCH] media: vimc: fix reference leak on failed device registration
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58837-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 8F839406BF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Shuah,

Thanks for reviewing.

On Thu, 16 Apr 2026 at 00:01, Shuah Khan <skhan@linuxfoundation.org> wrote:
>

>
> Can you share your manual review?
>
> Can other static analysis tools for example scripts/coccinelle support
> your findings?
>
> >
> > Fixes: 4babf057c143f ("media: vimc: allocate vimc_device dynamically")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >   drivers/media/test-drivers/vimc/vimc-core.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
> > index 15167e127461..fee0c7a09c4f 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-core.c
> > +++ b/drivers/media/test-drivers/vimc/vimc-core.c
> > @@ -421,6 +421,7 @@ static int __init vimc_init(void)
> >       if (ret) {
> >               dev_err(&vimc_pdev.dev,
> >                       "platform device registration failed (err=%d)\n", ret);
> > +             platform_device_put(&vimc_pdev);
>
> Where does platform_device_get() happen when platform_device_register() fails?
>
> thanks,
> -- Shuah

My manual review was based on the platform_device_register() call
chain and its documented lifetime rules.

The relevant code path is:

ret = platform_device_register(&vimc_pdev);
if (ret) {
dev_err(&vimc_pdev.dev,
"platform device registration failed (err=%d)\n", ret);
return ret;
}

and

int platform_device_register(struct platform_device *pdev)
{
device_initialize(&pdev->dev);
setup_pdev_dma_masks(pdev);
return platform_device_add(pdev);
}

If platform_device_add() fails, platform_device_register() returns an
error, but the reference initialized by device_initialize() is still
owned by the caller. The API documentation for platform_device_register()
also explicitly says:

"Never directly free @pdev after calling this function, even if it
returned an error! Always use platform_device_put() to give up the
reference initialised in this function instead."

So there is no matching platform_device_get() on the failure path.
The reference comes from device_initialize(), and platform_device_put()
is needed to drop that initial reference when registration fails.

That was also how I manually confirmed the issue after the tool report:
I checked the platform_device_register() / platform_device_add()
implementation and verified that the vimc failure path returns directly
without calling platform_device_put().

I found this issue using a tool I recently developed. The scan was run
on kernel version v7.0-1262-g4fa12523f7bc.

Thanks,
Guangshuo

