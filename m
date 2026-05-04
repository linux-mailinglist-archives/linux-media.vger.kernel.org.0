Return-Path: <linux-media+bounces-60258-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDC5AjRY+GnTtAIAu9opvQ
	(envelope-from <linux-media+bounces-60258-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 10:26:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4384BA296
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 10:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A166B3014C50
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 08:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CA23314C4;
	Mon,  4 May 2026 08:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="foVmCKOb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAD6332EB1
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 08:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777883151; cv=none; b=chG82LWZo9bG6XbKIG7FY0f0rspF3MIHAXXqVC2OVKrTeQMc8bBAp6pwsl+CBEf8g+Z/jwuRQroqOZx8dgS28xLTdEAG0HXaXO4/oae6NqXDuDa/E3cUGtLIGKUUuQ8d0QMVgEOclLOI7YHphpsDC/pLQa0dbn8vZa1Zv/Ev1EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777883151; c=relaxed/simple;
	bh=G0HlUpP+L59SM/PgS9XrkbbqRt4wRveUjJziSIIppL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UtZoNlu6Tq2syQXyqVK7yPgYLDF3bWVglLqRVtBctPKjFzcop6q5SDqkpbyQb/jrU0Rb3V13Wom3Hl9yQdxNNNCB4ziNqeTrVpU6i3fDjQVObtX5uw+EQdgUNvzV3XqTWp9d+dPy6xwrhsafeUUPxUEOLIWH0a+x2QgcgqTKAKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=foVmCKOb; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67c9616b4feso489473a12.1
        for <linux-media@vger.kernel.org>; Mon, 04 May 2026 01:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777883144; x=1778487944; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9R8zXqHCtcGHTYvHcfHWaBjDK5mDDl8ovVVHVrbBYhw=;
        b=foVmCKObcKLZeyoZEq3WGlFNPTnzkdRRGZkDiXi3U97qO5ZcJjJeOXpK/bAfipWQc2
         yiobeiMY/5nhbCEjV6RkOuHYJO8Z1Sl0ewnwBNMSOJoQjTiUFh1y9ifNTYN0dajBSfwQ
         CGxy3HcFuYQ+EpWoPRXX5WrnahOwLH06ILtEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777883144; x=1778487944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9R8zXqHCtcGHTYvHcfHWaBjDK5mDDl8ovVVHVrbBYhw=;
        b=Axq6+xN44y/1UcxZyj4+t1f9cY1zJaT7SJnng6QguhJeD95529hR7wvmRQ+JxEqC11
         QkbDJ+hU+M8CWYHaRsvBP6uQYSx3MpF+oAJRoamY0p5Uvz9aNohbKZzZsmuPIJTcFdv6
         bQPGe+og2hs6MxIz746ssBY1ALEZuJ3EzKi6M1U47kI5J/gyLPQD5+q1FX1uWrHhm5p6
         7iB4mE8H+p6Bq/qkXQqnueepF2+P0T+3EbPA861NQZaXLU7M0tP2JNX/0y7JrmrkoieO
         FLVxncExaqRPxFaKD1QaUHUxtse74c2Mysxd0lk5xVUIqgSzmgQ1MqBykV4AkXKjG7zO
         BdrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nomcbBTiuAMrhrywKKM+svYnCiqQNJkpPOcOEdCrwTP8f5wC4kRcR8PV6JpNFJUdxliiaMGVP821z8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLawnSvltGvJnDfno+ksXDzqpVVhUf6GtWJfdIG/oStmlkKppB
	2wSRTd7O4umrVDbjKfLPGUHyZdhmT+oCJ4HoYCI0plONQpAKqK1kuAl3rs/zh9U6x/dYrFhICvv
	ESZdczbAO
X-Gm-Gg: AeBDieuZ2H1DRa3QyvjtX4O0L5Su9OYByYPzRRyZGHWbnSCqpdFc+wypZgYHvjE+ewJ
	vF20lHgpY0fdU01QE+LA8A7XBf/dLVBHpu+7nkSWPGx/1WzJsIbBm8hcYuxE3vlUbME3fWtBUfz
	PlXLR6nPzxjMzdeVm98fsMf9DjdnlFx4+gIeqePCb5zsLVfwGn4vaStNGwGUxANbXh8ia68D4xB
	p9eTscuE/J9SlsUkrD5drd07cicmNprNKMHNVHrDYHagPmw6RejtVHnPc496hOO3nxKOmRU3LIn
	EK1KM5A6QY+4/jl4l0tj4KbUbE+T6uUVCDsiT5oPGP799hu0cGvk1GZI1pOnKN/f2Fuhe6XdZ+Q
	EaO9fXa17OXHHylsBSd53ekEPpebIWgpHui1Wje7VFbh4lHI9VQ4LkH0coPUvP75xVAU26s2LiT
	ebLf9JY+2AFTHYl01GYJO4cE3Tz+8LzWPySxQckeKwDHgEad2R9G/MD4dD5OyeztU7ZK4lScFtZ
	h1HUTuzog==
X-Received: by 2002:a05:6402:5486:b0:674:c412:6f8a with SMTP id 4fb4d7f45d1cf-67c1b2a4be9mr3233289a12.26.1777883143828;
        Mon, 04 May 2026 01:25:43 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b88473402sm3032871a12.29.2026.05.04.01.25.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 01:25:43 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67c2d57a5ceso2077735a12.3
        for <linux-media@vger.kernel.org>; Mon, 04 May 2026 01:25:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8b2Oz19FJGFgomlZ4y2F38Z8XI1fltd4StoeCksNsrIhjW+WVcnHc1HjrSaKEwN8y12chTcuRI6L9tTg==@vger.kernel.org
X-Received: by 2002:a17:907:d87:b0:bc1:a5cd:9a67 with SMTP id
 a640c23a62f3a-bc1a5cdb3efmr195866666b.34.1777883140796; Mon, 04 May 2026
 01:25:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
 <20260501-smatch-7-1-v2-5-a2fcfb2531ac@chromium.org> <afhXQOcJn11-UGCq@kekkonen.localdomain>
In-Reply-To: <afhXQOcJn11-UGCq@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 4 May 2026 10:25:27 +0200
X-Gmail-Original-Message-ID: <CANiDSCtmjKu2rcDCyCtZrnv4obvY5T49NUwDS7OTRRpn6NUEdQ@mail.gmail.com>
X-Gm-Features: AVHnY4ILmFd1TWdg3HI0oqY9t2ArMATGJOzQAzGapqrP0BhJPZ6QfuhOAXwot78
Message-ID: <CANiDSCtmjKu2rcDCyCtZrnv4obvY5T49NUwDS7OTRRpn6NUEdQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] media: staging: ipu3-imgu: Add range check for imgu_css_cfg_acc_stripe
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Nas Chung <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Keke Li <keke.li@amlogic.com>, 
	Yong Zhi <yong.zhi@intel.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 7C4384BA296
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60258-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,chromium.org:dkim,chromium.org:email,intel.com:email]

Hi Sakari

Thanks for the review

On Mon, 4 May 2026 at 10:22, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> On Fri, May 01, 2026 at 11:32:50AM +0000, Ricardo Ribalda wrote:
> > If the driver's stripe information is invalid it can result in an integer
> > overflow. Add a range check with a WARN_ON to expose this kind of
> > error.
>
> This would be an underflow, not overflow. There's also no longer a
> WARN_ON() here.
>
> I presume this might not be the only such issue in the driver.

I have updated the commit message in my local tree. Will repost in a
couple of days to allow more comments.

Regards!

>
> >
> > This patch fixes the following smatch error:
> > drivers/staging/media/ipu3/ipu3-css-params.c:1792 imgu_css_cfg_acc_stripe() warn: 'acc->stripe.bds_out_stripes[0]->width - 2 * f' 4294967168 can't fit into 65535 'acc->stripe.bds_out_stripes[1]->offset'
> >
> > Cc: stable@vger.kernel.org
> > Fixes: e11110a5b744 ("media: staging/intel-ipu3: css: Compute and program ccs")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/staging/media/ipu3/ipu3-css-params.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
> > index 2c48d57a3180..92cce31e35c5 100644
> > --- a/drivers/staging/media/ipu3/ipu3-css-params.c
> > +++ b/drivers/staging/media/ipu3/ipu3-css-params.c
> > @@ -1770,6 +1770,8 @@ static int imgu_css_cfg_acc_stripe(struct imgu_css *css, unsigned int pipe,
> >               acc->stripe.bds_out_stripes[0].width =
> >                       ALIGN(css_pipe->rect[IPU3_CSS_RECT_BDS].width, f);
> >       } else {
> > +             u32 offset;
> > +
> >               /* Image processing is divided into two stripes */
> >               acc->stripe.bds_out_stripes[0].width =
> >                       acc->stripe.bds_out_stripes[1].width =
> > @@ -1788,8 +1790,10 @@ static int imgu_css_cfg_acc_stripe(struct imgu_css *css, unsigned int pipe,
> >                       acc->stripe.bds_out_stripes[1].width += f;
> >               }
> >               /* Overlap between stripes is IPU3_UAPI_ISP_VEC_ELEMS * 4 */
> > -             acc->stripe.bds_out_stripes[1].offset =
> > -                     acc->stripe.bds_out_stripes[0].width - 2 * f;
> > +             offset = acc->stripe.bds_out_stripes[0].width - 2 * f;
> > +             if (offset > 65535)
> > +                     return -EINVAL;
> > +             acc->stripe.bds_out_stripes[1].offset = offset;
> >       }
> >
> >       acc->stripe.effective_stripes[0].height =
> >
>
> --
> Regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda

