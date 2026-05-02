Return-Path: <linux-media+bounces-60173-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM9bBTyu9WnqNwIAu9opvQ
	(envelope-from <linux-media+bounces-60173-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 09:56:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8534B154A
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 09:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D5453004DA3
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2026 07:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5D62F6586;
	Sat,  2 May 2026 07:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KLW2QzGB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3751F91D6
	for <linux-media@vger.kernel.org>; Sat,  2 May 2026 07:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777708598; cv=none; b=oKOGAFAsDP1LS9Ist9al9qPgc8+JO13X/Kc0XxK4wth3SbghaUrUOrWt7MnOGKfGC/+C0HwzbnrzHJQaLxC0wg+6eaw95IO0qoon+mqEmPGPMWgsQpgJZAYQz9zwUw9B2xUxWQWJjcFVTDvLxcBsyilfOWg9X/ORov5BCJwRMrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777708598; c=relaxed/simple;
	bh=dJhRFO0sNwBpX6Zfbh5W+9NU4SEl0aFCDsJ/1X8239Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJbuxMFn9R4LGj2a06LustEWyrdlmVVNLawISImK5cU2wKn4R7ZdNQTMqi7594c1O/yRnkFjhS3qcwUnh+HG53R5w+Rk7pAtKw26qihsXEFq52jBl0eTQlS/r8AUycMFN6XHewbXOpIJThqza6bMb/wy5hUnYVvFmxxPr9mUct8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KLW2QzGB; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ba7a1cc0380so424691366b.2
        for <linux-media@vger.kernel.org>; Sat, 02 May 2026 00:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777708595; x=1778313395; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yYbYReA77LGHmC7qNGAH0FMT9lWcS8+NBZbc8XS+URY=;
        b=KLW2QzGBuQYjW8i7RdtQ6JSPiurADIA8ZqRnAn9sQWM2LbcHj0TlOd93p/5x65EXvx
         neR6V8YbZR8zfnIfoVHYBGFqs2FKaz26rbmUPU3yRE+9nyoYOEdJQdacNEA31wCLuksE
         m/WZl5UTiQTon9nu6AhYxMuimydy+Iztw/x1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777708595; x=1778313395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYbYReA77LGHmC7qNGAH0FMT9lWcS8+NBZbc8XS+URY=;
        b=gmVwFifq3UuaVWOmne9awYSSRst3z/+b/SZE/8vkBUrkdfmWx2djHFc4ApRgbDHtc2
         qER/PhZjQ80qdnDs4jCkYJdrqynzNyyBZN/KaoHGP23vWBr9taBdIgc2/2zZ4E54pBGC
         OL+3Pzay2WAMFf7S0E3ZVLGntLu5WlCUp8XiTSGlRntIIZZ44CM/qB5qdOn0OHARFDfw
         8OAgs5U2HoPIb2FcdHOMFkQgeuqimRzFA+j/GMq6fNAni8sDrLO+YlAvzzSraoeGr0oI
         LKssJhw14EsSM0HnsS20WtvDAfyPv0lOOw2qBeq6e+n7qdEwceuzo8h+IfayBeqwooBF
         G4tw==
X-Forwarded-Encrypted: i=1; AFNElJ90pBP/wyJCYUwMKrE0Do2gfvlR22ymNdT12DkwsfygBxXrKi3APuaroXMobv5GZme6atg96/H0ncKnnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyXkuq0FfaRzQTuNbnWl7xZ/SrRWd/DMKpbYs2knkYbfyPwptk
	6MbdAMKQo24KnaBRGiqN3b4LbqyYVYVcwAypKdY70MIKDZWeBckotn8j/N5mvMiDVopXqEOMgwE
	5Qy6/d9Ai
X-Gm-Gg: AeBDievzzGp1WfclM6n8sjy4343opn5spVR2pNggz1y89cZG/s0o9sz3uSlJTp/11nz
	gJe/Fhqt4faOYAzlOiF29um4ULe3JbEk/uP42hyHlOSTazPptThDcSAUEgdWvZrHDkDsO925PXQ
	nOLhVTbD3KBb36t+tjxLTuFVnOSZ3Mm5KwUJuJ8W3QA3/KPLXgfXNNvXpQc0daB05W30LPmR9hQ
	5F1CClSbhvIymqsFq/RdX70mknz7RKrNYrrLKd+OTl72S1/z1uXucKvOK/DIex9zKIPVefS7GHQ
	lyIRwxR4Yb6LPDunHmfbFtoer2x7jLRM6vSAzk/lkHifdHQVqi+aHe/JaVi1wOR+1loZw3IeXHv
	pSujJdcJ0qwqOiuJz4RAiiL3uf7vNUv2yZeQ3IKIN4NQm446RwVri4iIYVh+ZbcYMr+8HSkLCrP
	SnO+mZ4wo+BiDbMppvKynGGHRV03j9FE7/rALXJUXjOMxQqgaUvUYFUZcHBpbwqcc2+mQ2V3Y=
X-Received: by 2002:a17:907:874b:b0:bbe:7709:5a8b with SMTP id a640c23a62f3a-bbffcb7ab99mr101394566b.42.1777708595147;
        Sat, 02 May 2026 00:56:35 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6df5c492sm180251666b.61.2026.05.02.00.56.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 00:56:32 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b9c3a9fe80fso378034766b.3
        for <linux-media@vger.kernel.org>; Sat, 02 May 2026 00:56:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8P/1klzaRugHvAUQvmSQwyqgk5I83EMAV3Ec8iJbz/tDxBh2SYwPYH60q0SQGn7lVskeQe59zfHuxwAw==@vger.kernel.org
X-Received: by 2002:a17:906:9f87:b0:bac:39f1:220e with SMTP id
 a640c23a62f3a-bbffc57c1c1mr87403766b.37.1777708591185; Sat, 02 May 2026
 00:56:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
 <20260501-smatch-7-1-v2-2-a2fcfb2531ac@chromium.org> <20260501201906.GA488660@killaraus.ideasonboard.com>
In-Reply-To: <20260501201906.GA488660@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 2 May 2026 09:56:19 +0200
X-Gmail-Original-Message-ID: <CANiDSCtf9ThohCR8XT7LNQUsbYeTdB=gGkmnXKc1cPjxUsVHdA@mail.gmail.com>
X-Gm-Features: AVHnY4JUgNnRVAJTA9Gn-Ci274fEJRaLMJcO_S9jFpe5SlS-M9HCUtA97BJPkUE
Message-ID: <CANiDSCtf9ThohCR8XT7LNQUsbYeTdB=gGkmnXKc1cPjxUsVHdA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] media: i2c: mt9p031: Rewrite a bitwise mask
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: DB8534B154A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60173-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,ideasonboard.com:email,chromium.org:dkim,chromium.org:email]

Hi Laurent

On Fri, 1 May 2026 at 22:19, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, May 01, 2026 at 11:32:47AM +0000, Ricardo Ribalda wrote:
> > The current code makes smatch a bit uncomfortable:
> > drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'
> >
> > Probably because smatch is not clever enough (yet). Do a simple rewrite
> > to make sure that smatch understands what we are doing here.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/i2c/mt9p031.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> > index ea5d43d925ff..5c9dff030b4d 100644
> > --- a/drivers/media/i2c/mt9p031.c
> > +++ b/drivers/media/i2c/mt9p031.c
> > @@ -795,7 +795,7 @@ static int mt9p031_s_ctrl(struct v4l2_ctrl *ctrl)
> >                       ctrl->val &= ~1;
> >                       data = (1 << 6) | (ctrl->val >> 1);
> >               } else {
> > -                     ctrl->val &= ~7;
> > +                     ctrl->val -= ctrl->val % 8;
> >                       data = ((ctrl->val - 64) << 5) | (1 << 6) | 32;
>
> I'd still like to keep the ~7 (and, while at it, making the register
> computation easier to read). I previously proposed
>
>                         ctrl->val &= ~7;
>                         data = (ctrl->val - 64) >> 3;
>                         data = (data << 8) | (1 << 6) | 32;
>
> which didn't quite appease smatch. We could use an explicit mask:
>
>                         ctrl->val &= ~7;
>                         data = ((ctrl->val - 64) >> 3) & 0xff;

Why 0xff and not 0x7f?

If I understand it correctly the max is 1024 and (1024-64) >> 3 is < 127.


Anyway... following the mask idea what about:

ctrl->val &= ~7;
data = (((ctrl->val - 64) & 0x3ff) << 5) | (3 << 5);

?


>                         data = (data << 8) | (1 << 6) | 32;
>
> >               }
> >
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

