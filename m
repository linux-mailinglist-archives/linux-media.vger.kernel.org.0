Return-Path: <linux-media+bounces-64500-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pxBLKiKUKWr6ZwMAu9opvQ
	(envelope-from <linux-media+bounces-64500-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:43:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 449CB66B9C3
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:43:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=O0RRVF7w;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64500-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64500-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EEC973108A91
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA40341660;
	Wed, 10 Jun 2026 16:35:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476F733A9D6
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 16:35:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781109355; cv=none; b=qoCLBW/3c2zR2DNZs/9jJSzsPyl8OIt0unwNJJrA7maMixIpMLrkImggUWOXbH3Zm2YscNg7oMuMDgxPUBwY35kdyC0ihY5eq7Fajt5u7kotTTCzfmV3WkiZEoDQgNFFI7CygVtsaW/nNnZ+db5k/YsHadRKdDhysYSn5PnT4Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781109355; c=relaxed/simple;
	bh=uQxgwEhkxvGh3wPUWl2uJvJ7E0TFEraUZkKD7n+myRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eduiYCUlgyetpPGzElAzfn+H4WUnnPeDvXz7RvDuYq+AjY1hYe07xkHQ2BpvJdMNA9ZHSe1/n7AkrrWCU/n2l9DZAjtWoruomgT2ZD2LAyMQSWctGbDfsE9WH1x+tqMlxXMxQzubxCZqPyeYYUorBXg/0jS6wVzXGuQk21/jW+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O0RRVF7w; arc=none smtp.client-ip=209.85.208.49
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69165354c87so5472457a12.3
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781109353; x=1781714153; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y7A0TGEQnK+KXtF3xm89dBL8qudMISx4jNxtMKf9lW4=;
        b=O0RRVF7wT6wAbggA/XArORIi0LnluVZgf3WeR+em5YRaFAtShqISRMxPqAfnZ1BjA9
         FwHiqbuDBQjwpGuaNfyJ48g+m1UNXEAL5ZX/i8PPuUXRl6v/ZG+/zaVh3dn7ohdfm3Dg
         fCo17YxqswEnY9GaL/ZrFV4qn4JXHrJNxhq3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781109353; x=1781714153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7A0TGEQnK+KXtF3xm89dBL8qudMISx4jNxtMKf9lW4=;
        b=jSW/fhfkrHiKEmj59B4O10UCzKlKhk8SiVc5TLvpjgsgfd1nTC3XDPnrGVyC0REwi3
         +hWXZwIAh4aLAftVanF9asi5vAkQwcZVVPp2dB+Le1v+F8iMb7jROiSs6gldKfI2LKql
         KJFzcuFZQUEsVjxWd79YXyd0pwUbNCNUyVCTKIMf/mx2stDg0XGe35mjSnaje3I7Ijgs
         WefYdJQuyD5iFPciY6qnjz75I+4huJ9zn1lPQz4vJYmm2zhpnboSaKuN9RT4qMX25yxF
         vHmwWr1739+xCxg4zd3/12UsbfgCk7xt3m+6+4TCbNmSF9Ghdf9IZhHl7YteAoPb8n1D
         ugPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ce7iP0ot5QzmDkA27B49vxvlo3+ayKeqqPJzqUnOrSWsAG1qtTmM7jarjBGxTxcisbi396YVNp1E1bA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNfMNOCDZoXdz5y948m7/ek+3q22fGjlfDrShdeWL0X8FSxeyX
	sDv/SJ2Lrpe3RTvj68rdi8DksDeiHrYou+bXsSm6GY1AyOfidC94T/Lipvn0UeNRwMx5N0nySoi
	iQhhkeO5b
X-Gm-Gg: Acq92OFI/QLqx/ASAOuz2GTgnVJQvILQepUo4BS/tP5urIr/+EX+0Z4pi6norbHr1S7
	c6vz0I1xhLOG3BV4gBmquTn9s3UK4YOLTVqoOc9v7IfNFXsydxwtiPcu/J9KL4DgfzGw5WOSmgM
	6IWM2Yucwyr5iPkQ70X18HmCn6ehFg2yqreQ5l5GXSips6qrPJ6a5Y2ul0YePkeeuni6qE/Lid1
	7kJ0ZNEb/TNwrrkqbzB3bM/rjDbzsvPdIBTOLjW7I785tWE9wc75PNhDO0y2fmOV6kE1dsJ2pjx
	Kj7u+dsyMOwTufswiS9SVQyO5WMlReuRpVF1BDlBK3LGqXxxzSxk/NDPYH+CEfaNj22P6FbiTXW
	islap/qz8aMV9beT/m5dUkWQ0vCOxi2s6YmW7Eiuzw7yci5hdJp/WxQYYEvbazeDoMq6gG4iP53
	iccujrjsKNfsvAH/WSetBQXOeLkXYmP6NJXcU+sInZ3oZAIFPDj1vvV+GgKXLssBJxnAz3eBS9P
	lziDiVSxA==
X-Received: by 2002:a17:907:d8b:b0:bee:a4b8:d595 with SMTP id a640c23a62f3a-bf370e62d45mr1293043166b.7.1781109352691;
        Wed, 10 Jun 2026 09:35:52 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfa4eed056esm150755466b.53.2026.06.10.09.35.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 09:35:50 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bf1cdcfd6deso861988866b.3
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 09:35:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+XK4Zpmzdza0b3dulsdR8+GxgCNzAgFRB4IVmi5l3rxibPc2Udv+l4DMG38yAEu51N6yUEX1U9y7Nf0Q==@vger.kernel.org
X-Received: by 2002:a17:907:6e89:b0:bee:d554:f33e with SMTP id
 a640c23a62f3a-bf372049799mr1328655266b.21.1781109348987; Wed, 10 Jun 2026
 09:35:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
 <20260610-media-ci-7-2-v1-2-3c61a482a44e@chromium.org> <aimQ3ln0y0jxMWT3@zed>
In-Reply-To: <aimQ3ln0y0jxMWT3@zed>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 10 Jun 2026 18:35:36 +0200
X-Gmail-Original-Message-ID: <CANiDSCs=90QH5V8RHFbZUvZMGEN4wz-D9ODHTWgdvyJ7ZS8haA@mail.gmail.com>
X-Gm-Features: AVVi8CdYYd6CA_Y98QxwQ_Ai036ikPBrgSJ3OI6Sn_3TQJnC_oiWjgLHr-W2w_Q
Message-ID: <CANiDSCs=90QH5V8RHFbZUvZMGEN4wz-D9ODHTWgdvyJ7ZS8haA@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: rzg2l-cru: Remove unused kerneldoc description
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Xiaolei Wang <xiaolei.wang@windriver.com>, Tarang Raval <tarang.raval@siliconsignals.io>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64500-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:dave.stevenson@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:xiaolei.wang@windriver.com,m:tarang.raval@siliconsignals.io,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:dan.scally@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab+huawei@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,huawei,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,chromium.org:dkim,chromium.org:email,chromium.org:from_mime,mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 449CB66B9C3

Hi Jacopo

On Wed, 10 Jun 2026 at 18:30, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Ricardo
>
> On Wed, Jun 10, 2026 at 04:20:07PM +0000, Ricardo Ribalda wrote:
> > The variable has been previously removed but not its kerneldoc.
> >
> > Also remove the leftover reference to state in the description of qlock.
> >
> > This patch fixes the following warning:
> >
> > Warning: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h:164
> > Excess struct member 'state' description in 'rzg2l_cru_dev'
>
> upsie
>
> indeed!
>
> >
> > Fixes: 85d8820d4869 ("media: rzg2l-cru: Remove the 'state' variable")
>
> My only question is if this qualifies for stable or not...
> Honestly, I would drop the Fixes tag here

Yeah, I am not even sure myself

On one hand, it might help other CIs down there have cleaner logs, it
is very low risk, and I doubt that it will have any conflicts.
On the other, what real user will benefit from this backport?

I wrote in the cover that this can be dropped. I'd let more clever
people decide :P

>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> > ---
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > index 5bf334e173d2..b426bc7898bf 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > @@ -116,11 +116,9 @@ struct rzg2l_cru_info {
> >   * @scratch_phys:    physical address of the scratch buffer
> >   *
> >   * @qlock:           protects @queue_buf, @buf_list, @sequence
> > - *                   @state
> >   * @queue_buf:               Keeps track of buffers given to HW slot
> >   * @buf_list:                list of queued buffers
> >   * @sequence:                V4L2 buffers sequence number
> > - * @state:           keeps track of operation state
> >   *
> >   * @format:          active V4L2 pixel format
> >   */
> >
> > --
> > 2.54.0.1099.g489fc7bff1-goog
> >



-- 
Ricardo Ribalda

