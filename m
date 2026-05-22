Return-Path: <linux-media+bounces-62574-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJLRIwMoEGpQUQYAu9opvQ
	(envelope-from <linux-media+bounces-62574-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 11:55:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6305B180F
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 11:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0019630356D3
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 09:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C933B8BBF;
	Fri, 22 May 2026 09:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="YSqR0ePx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB693C4B76
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 09:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443666; cv=pass; b=NzcAsDC6zH0DS9GoRX3bA00LSQWzhODPxiSQW9+j3cHwg1Fwa2muToEFlYv+tlisZkouDyJrpuIF4zU08wtiuWwXgFOqBf09rhBGeYhZkyqrVhx3o4YfYwXylTZdqkBo988AV2zUTDC94LA9G6/AJdaY1dmlhKkFgNYmgbluDS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443666; c=relaxed/simple;
	bh=3xOwdtN1qI8o6ZcvCJ3wU4dZQeum4/yktVIQjpWNU5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=llON2SavMfO2Xn2bXmMG9beMVJ0/kVM+guFChPUiADT/gBrIxRKyTkPziYjg7CGhGQoX5H3OpDL3dSW2P0kJ52eaQ0sVJ0j72JPi6YSTUC3RF1IXr54LR91kdAO/pmKTfaLhuw9LNePPitsWW3d1TZ7T8NaTV9ivu5A4jswzOAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=YSqR0ePx; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7cfd0d8eb09so39590597b3.1
        for <linux-media@vger.kernel.org>; Fri, 22 May 2026 02:54:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779443662; cv=none;
        d=google.com; s=arc-20240605;
        b=JGO7NWsrQ1JyD7OQ817s2gUtxAeYnaRNdp+a7hPMz/7zPsWy+8AcyQjjgpZaMmPCsA
         1FV60Ym2QCCXRbCnqvVqBnpw2ANQ0H9V4+2B+qbpTgAVxSMmbn3g/ufI6PWFb6X+fcV3
         o4JIGw3OQbc4V+3GQOOR+aGo68NxItu57HHIzWwiwkun5yjOOVuIPQ07zqKWnNmVSX1u
         0/cow/PTSDhcRsrWxXXcO403dXfe2BoyhzCq+76GiOm5rntuZw6OwcfQ8+mBq1eEgrIY
         K8XQ9TnOsLBYNExPr3Rs6BZec2q2cuXJ5t/FzFJFjKJ0GvZjdT6lq2UtQtSt7hCSttNi
         089Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mi6kVw9TNgWnpRQSSJ+L7fzHt7ZuNcqqXqhrYRZWQ1k=;
        fh=wqRAV5N/1tpYvoGRUf0CoICjb7Bww8YCsK2nJ4znnY4=;
        b=OYNr2VZmPUOhOzCVeUSIb/jko1p3E9lWPtWPBd3eiuooWoRMNo/9Ooj2Cjw0BERAev
         NGX59KaGLftPXLfgY9QXFPHXDGINzqpom3bmJXMi6Es7pEEaYQFM91fRqixIYgkLdwMF
         pv8GY6JBQsMd3MxVYh1UBo8os/7wXVKq1y4nofKxrmeAMC/p40pOJVwtduVjvpnRMszb
         a953sjSkYOqbn/PfyR+x8RPLK+Q+ezHpfMlhdnKZElXKlLcCaDWtQqhokOKt64aeaSOU
         M660841W+nqfcCgXMMofTB5XPheTt/HgmxQNPO2XsDak3Sn8huLEkvOrXI8zbOPZ0crK
         PPpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1779443662; x=1780048462; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mi6kVw9TNgWnpRQSSJ+L7fzHt7ZuNcqqXqhrYRZWQ1k=;
        b=YSqR0ePxfbAO0z5VdwcUjptoRNnUJTPxp0RG6FmFR/hmLRDJ3J4ZMduKWWU2wbJS3B
         T9KzVfQiIOf37JUKlvkkelGk2SBVc/u4TKwU43mB7zO2IzxC4AiSiVzGveNIAFG+f8C0
         LlEXrlbY9eCZCYO5diM1lp7ctwNjKBLTzd7v4we83tum36NIIJsmXSLiUdbvL14IYmxA
         9ByrU/VdnlBdOc+LfR0UuhMwLIycfWsJkCsQtwd8mG6Sl0d+gYJ/MAwavnxL4iaMCX3t
         8dLbZvmWt/ig3buI7PIqzmIpgLG9COYW+9R0kjkDytlIP8etKHxWJQxC9iNHMmq5GSJm
         pHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443662; x=1780048462;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mi6kVw9TNgWnpRQSSJ+L7fzHt7ZuNcqqXqhrYRZWQ1k=;
        b=ZiJe2Q5JRZA5PFX+FNqcs6Cg8wo3DKP8h8RWwYaGXAcfG2ZS6boYT85SjlQ64nuf4g
         vx084lBx41s+M9ZRl76R9bFrkmnl1+iO497ZIoijo0wbuBKY14b5AnczdYwMLbRF8bi8
         EQXAuF0FYHHVu3c4psgF0KrKKqhtPEDnmrYHtFj6x7TE6bzSmbfEhSJhHDE+/oQqFc3g
         FjlKts+vgiJg38PA9m/xj5R8Ehk0dCYwJ+cXPMDOSZ9JfrrRpDIWEH0HyF3wHDSkIGko
         Mh49mnMqTEDcsh4rm8ZujjeUbUB9kdsbZJomhGUXJEnJx/0E0X/6qmx1bc1Jai+IktcG
         ZiIg==
X-Forwarded-Encrypted: i=1; AFNElJ9eB0/OX7KLQdckYbsi+rVbpSMVAo7yxU6SC0sH1w/XDuT2uGfxLqEh0wuerPaqe6AAPEfECG6T6hADDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeZx/56lBA4C0blBIexIH/sAs9JqqzCTjuqM71EDnnAmuaaLMh
	yG9RDdhpLPPjAQksQsCHrz2wBml9yw6oEQXU3e4ZUEyZIBUTfiKyplN0iVFmYa/RkDmSGasaCwb
	EoD2UwsrfJJbPBEciESU3kAf6I0wc81qfz7YN9Kc5IdDEOvTJuogt
X-Gm-Gg: Acq92OHa8dJLWUdhZ1PT+/UzTXanGT5m4Q3TG72RPYq0ujORj9vYEhxN1Tswm3IPL49
	BLqoArKjJc7oKqpTh/r67yclHA5w3+53EdLsv2tUJj2rlFk9ZUTfg4zjCKtXIuby+au0+dsMEow
	YfwTs0mMvnmE6QTacxTZVNpN6ZMQcqkfiwx12NJIudBkdYgaYBINzBVDce9zIovBX9PXu2O33yS
	rHw+SM80/ZDga4PzNvFwZuIRnQ9ujK/zUroZYBhhC/b2k1ktVKjrNbAUItyv5ojCwsIs9/Wf38/
	qBJn/ncPxnjxGdJVKC8ln1a9sq5Oe9gCUERljvLYLzACdAAkWiVOjtTbVFpWfImRUnQVaSgvWHu
	EtRAXxqKCOMz4ycVt0dAjrLgh
X-Received: by 2002:a05:690c:9a03:b0:7a3:7ad3:3e9e with SMTP id
 00721157ae682-7d33a256b12mr31850237b3.32.1779443662625; Fri, 22 May 2026
 02:54:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-bcmpi-v1-1-41d80125a7b9@kernel.org>
In-Reply-To: <20260520-bcmpi-v1-1-41d80125a7b9@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 22 May 2026 10:54:06 +0100
X-Gm-Features: AVHnY4KKPon9FWyuFvK3ZbijayCqq7lC9C5WtFxe_sZLfK6KsifxomhuLYVzDk0
Message-ID: <CAPY8ntArnXxJChoCPB2Nfi5tiBdwrzCctyCNckzVxPYTpBvn9g@mail.gmail.com>
Subject: Re: [PATCH] media: bcm2835-unicam: Fix pipeline wrong validation for
 unpacked formats
To: Eugen Hristev <ehristev@kernel.org>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@redhat.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62574-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DB6305B180F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Eugen

Thanks for the patch.

On Wed, 20 May 2026 at 16:37, 'Eugen Hristev' via kernel-list
<kernel-list@raspberrypi.com> wrote:
>
> The commit
> 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
> introduced a check to see whether the format requested is the same as the
> fourcc in the format list.
>
> However, this breaks the case when userspace requested an unpacked fourcc,
> e.g. RG10.
>
> Unicam can work with or without unpacking pixels, e.g. pRAA or RG10, depending
> on what userspace requests.
> In the unpacking case, a dedicated register is being set.
>
> If the userspace requests pRAA, this works, because the check validates the
> pipeline:
>
> v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=pRAA \
>  --stream-mmap --stream-count=1 --stream-to=frame.raw
>
> but, with
> v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=RG10 \
> --stream-mmap --stream-count=1 --stream-to=frame.raw
>
> unicam complains at validation level:
>
> image: format mismatch: 0x300f <=> RG10 little-endian (0x30314752)
>
> This should work, because MEDIA_BUS_FMT_SRGGB10_1X10 can be packed into either
> RG10 or pRAA depending on the packing register.
>
> To fix this, modified the condition check to also allow in the case when
> requested format (fmt->pixelformat) is equal to fmtinfo->unpacked_fourcc.
>
> Fixes: 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 8d28ba0b59a3..cc7627e9a51a 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2158,7 +2158,8 @@ static int unicam_video_link_validate(struct media_link *link)
>                  * In order to allow the applications using the old behaviour to
>                  * run, let's accept the old combination, but warn about it.
>                  */
> -               if (fmtinfo->fourcc != fmt->pixelformat) {
> +               if (fmt->pixelformat != fmtinfo->fourcc &&
> +                   fmt->pixelformat != fmtinfo->unpacked_fourcc) {
>                         if ((fmt->pixelformat == V4L2_PIX_FMT_BGR24 &&
>                              format->code == MEDIA_BUS_FMT_BGR888_1X24) ||
>                             (fmt->pixelformat == V4L2_PIX_FMT_RGB24 &&
>
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260520-bcmpi-2c4850314e21
>
> Best regards,
> --
> Eugen Hristev <ehristev@kernel.org>
>

