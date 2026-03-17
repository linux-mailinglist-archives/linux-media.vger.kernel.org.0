Return-Path: <linux-media+bounces-56109-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sExZNgqOuWnkJwIAu9opvQ
	(envelope-from <linux-media+bounces-56109-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:23:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7052AF771
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5562301F3B3
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 17:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E3E332AAC5;
	Tue, 17 Mar 2026 17:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="YYC6IIy/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228C62459DC
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 17:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768072; cv=pass; b=Lzw304IMJuRceCyBqvoCDXhr2FhNxswOG50LF15w2U/Kgykkab3al6B5PJCL0QRgcDeKjhedJ+6NWfYSBuyp6HrbrDon8k+30UO+Ej9pqXcM+sQf1423+JODQ/Qn6zf1VnvoGXVSfbvqyygEadDvc/2K2Hdv6+1fDr76ZISo0GE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768072; c=relaxed/simple;
	bh=RzxxQNK+7XeZZ1zzpRgBfb1zqJHEyjfghb6u/A7OCa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ou5dE/xkK8wnMl5qmkXzojuGNHrGYH1XhudR9ZS6btGzZOut1/W7JOafCivh5WB6IVUIGznkH89RjYvpxu8kXfU+4tgHtKs1qiDLt5xzEllv7H0p30HWKlQUJwzxdbI0/ZMipdmdRpSyS1HU4Ea0QogiZVGE1DBf57rQugaPA9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=YYC6IIy/; arc=pass smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-466f935a82fso3853224b6e.0
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:21:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773768070; cv=none;
        d=google.com; s=arc-20240605;
        b=Dih+y841YLvdWbFtKisnSWpOFtkTWVq+2MzASP/ntl47CAZb+NbKQtO6iygCuOvGnA
         3cE8gkRMgRNbwVxpx0hbapsWzGXxp+2uAkYhuwBV+1kuA98xx7I2IaSeETk/SPqdIeTd
         ETvRghwHUssZ2dJkw8iP4sl0eXmMNo16Sac950awthC/CpNvbtJzxpxye8e4WzcnLs+N
         wPSNf2woLLJV+XflHnkVlCBhXKx3FSNN+O93g178CaT1/moVpwqPQpsV/74qXmbvBjGI
         fHHd+0XqT7HchvCBNOvxOiMeB5kYHlOnuVCHeAwFgTm0k19sQv7x3/Hl9ksSbLpsSgtJ
         3V+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fgHqS6jMn0lq6YpOjwkuggYs/F1Fi4n4BxEBIots+EQ=;
        fh=SUHx3lxdVvcKTVR88pDt0PHq6iishJqJW0D71/wP8Fc=;
        b=I0KeIbMr/Pb2JEat1De3qm+iVwiTzxWnXC0X9KfNHHMK25M7muxFUT6GDFF/bVjxzu
         2DNr7mdKEEZlHxpwfhUdDLohV5+hh8PUASdzNsESVCroA9I+oHsA7vApQSlTdMsNOWY+
         50cRbuq1q7jOjVFHbdNZcggwMM907m+/1WIvC9GYDhH9xRPXqADugcOEbN/cCnv7AYE2
         oJs4cNs0oaDKV22/pIwEZe+MGtw5x4xSrr0fJ+xRbLaR0DnFSlEl6v3m2qHhlar5ZAxM
         1MZWVyR0K1j4zS0vNeRqsK5a+lMkSiAqgBSgaN9UiMwQq8XLxqizVlEJAyunkMjkSwtK
         Ckbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773768070; x=1774372870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgHqS6jMn0lq6YpOjwkuggYs/F1Fi4n4BxEBIots+EQ=;
        b=YYC6IIy/5RdGiKN5pO4qSEi5y9Qo+jVJu9W2CELhcmDgZfghi81Myv6+G7zipZwRzn
         WfB+1/sNIuC5MwblAiNyQrvB0Ue0ynB99EqEFwTyLWS3jKEZzwukOAd27p48BXK0p5wJ
         dkyqktIxL0g4+pWmjs/TbK2oDH6ZTTTr0R7uhFjx+iB43NbTL7sG2a7hpbWGo4etXhA1
         Of4wzIDuxfv6Z67+olI/+pi9LtLAq3koIxiBbCplc0c3YbNrzbCDGRRuhBY2SwfRipIe
         qqTXV+VbWQ27nBSYkX4oPEdUmAXhhzgV2NRssydKmPYd8K/XgnudSmZeuqqNxVG/Ajo7
         zrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768070; x=1774372870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fgHqS6jMn0lq6YpOjwkuggYs/F1Fi4n4BxEBIots+EQ=;
        b=hpK8lxW1P7WDieqh6mBezu91SkQlyh/9N3nYbhlvwQ7/+TmnFrXUYjkJCLxv/dDge1
         MrXdejXHTHmWb9aLe2e3IyqmCMduawwzIb+arhUkPi4/zQJ8IPm3XmYvgpwxG3aU/Bwz
         JwtH5mRbzDbCu/j2RRQuzcY84ttG2L7f4TsVUZFSxdZW+AR4Ac5oxiuUAL2Mkts1FVNw
         jFPXr1/NLH7DtEvw/Sril9WUjA9EXvYZXp/KwIYdFSMejqjFCEjqx+jTT2mjbXqMPcJZ
         sLRTfYcS8fPILM/EdqDRzFN+kW2Qvk3+sFgrd9EP0sNZXwGBk6IYSVVUPj8y7wPg645E
         zL+A==
X-Gm-Message-State: AOJu0Yy2tASOP3p8BIIpz9NXv7augzSJEsJJIkQm0USTl+ZfOx4+0k6S
	vfvTZOHBfrcXNs7qhwJTBi2QL1o0JbNKy6yZM3tXhDP6ixmp1PvOSmkF6JWxfjLmqE6Z0lhX992
	UN4WZUyp8NFNlGqpah2BmWZ/Jd22MUNJzUmRzConfLQ==
X-Gm-Gg: ATEYQzzQMjlZHQWGE88+yoDB7/0ss8GqOZqvb3GaaXxGpjsk9Hv42n/J2TgZ/KZ0hkS
	PSIn5a+t2z+O0eslZSLaUCd2Ns9yvPRlE4kj/KV6fxUi4uiYkp2EIKao5hSY729XRGX12jkNeNd
	9kbYVj6wogAIZIw4eGADlszooeA4ZkKR+aW+N0IWDTKqJD8dX0fNHQqLka4IGVWZsa98cHkRCrm
	GrxwhwoFkEulzFdPc373XVcgEJQRca2bNEAs9XvjiYJSvP5iWgzGHPbgVmqcFBK20qJ4n6PPqAD
	rLYOEDMP
X-Received: by 2002:a05:6808:158f:b0:45c:8fa8:7497 with SMTP id
 5614622812f47-467ba2cb667mr110428b6e.34.1773768069992; Tue, 17 Mar 2026
 10:21:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312213532.2907276-1-brad@nextdimension.cc>
 <7c653b8b-5d31-4667-9d86-cbaed7ee97f9@kernel.org> <08b7b5d6-4068-4349-924e-e551bbf6e672@kernel.org>
In-Reply-To: <08b7b5d6-4068-4349-924e-e551bbf6e672@kernel.org>
From: Bradford Love <brad@nextdimension.cc>
Date: Tue, 17 Mar 2026 12:20:59 -0500
X-Gm-Features: AaiRm53HEbadNhe6lr1f31K0CH66zgaJgdGX4JKsaiE4IVpeV2B5W0JMAUbQe1U
Message-ID: <CAA0YaJQUQGFz65xXRNwbt9EFZRLnuOBDafTF9GsyxLhe4=UJZg@mail.gmail.com>
Subject: Re: [PATCH 00/11] Assorted DVB and TV patches
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56109-lists,linux-media=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,nextdimension.cc:dkim]
X-Rspamd-Queue-Id: 3E7052AF771
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,

Thank you for grabbing these patches. I will generate a new au0828
patch and get that v2 sent out. I noticed the media: subject issue too
late for the first couple series I mailed in, but will add from now
on.

Regards,

Bradford


On Tue, Mar 17, 2026 at 8:14=E2=80=AFAM Hans Verkuil <hverkuil+cisco@kernel=
.org> wrote:
>
> On 17/03/2026 10:52, Hans Verkuil wrote:
> > Hi Brad,
> >
> > Thank you for this cleanup series!
> >
> > I'll take them all, except for the "au0828: Fix green screen in analog"=
 patch,
> > which needs a v2. So no need to post a v2 of the whole series, just pos=
t a v2
> > of that au0828 patch.
>
> BTW, for future reference, please prefix media patches with "media: " in =
the Subject
> line. I added it manually for these patches.
>
> Regards,
>
>         Hans
>
> >
> > Regards,
> >
> >       Hans
> >
> > On 12/03/2026 22:35, Bradford Love wrote:
> >> Hello,
> >>
> >> Attached here is a series of accumlated fixes from integrations
> >> and deployments.
> >>
> >> The first five patches are related to fixing issues with a
> >> variety of analog video formats.
> >>
> >> The si2168 i2c timeout patch is something that has been found
> >> to be critical on a variety of ARM platforms and Nvidia SOC.
> >> Something in these platforms has USB i2c not consistently responding
> >> within the embedded deadline in the driver.
> >>
> >> There are two firmware fixes. With Hauppauge hardware fw 4.0-11 si2168
> >> devices definitely lose warm state and cannot function after sleep.
> >> The saa7164 REV2 firmware had an incorrect filename and has been fixed=
.
> >>
> >> Last up is adding some new Hauppauge USB id's and removing an invalid
> >> analog input from the Hauppauge DVB DualHD.
> >>
> >> Addressing checkpatch warnings:
> >> - 0001 palN is not misspelled
> >> - 0003 adding dprintk like driver already does
> >>
> >>
> >>
> >> Regards,
> >>
> >> Bradford
> >>
> >>
> >>
> >> Bradford Love (11):
> >>   si2157: Analog format fixes
> >>   cx25840: Fix NTSC-J, PAL-N, and SECAM standards
> >>   xc5000: Add rf strength function
> >>   cx231xx: Fix AGC levels for NTSC-M
> >>   au0828: Fix green screen in analog
> >>   si2168: Fix i2c command timeout on embedded platforms
> >>   si2168: fw 4.0-11 loses warm state during sleep
> >>   saa7164: Fix REV2 firmware filename
> >>   au0828: Add new Hauppauge HVR1265 and ImpactVCB-e
> >>   em28xx: Add a variety of DualHD usb id
> >>   em28xx: remove tuner type from Hauppauge DVB DualHD
> >>
> >>  drivers/media/dvb-frontends/au8522_decoder.c |  1 +
> >>  drivers/media/dvb-frontends/si2168.c         |  8 ++--
> >>  drivers/media/i2c/cx25840/cx25840-core.c     | 29 +++++++++++-
> >>  drivers/media/pci/saa7164/saa7164-fw.c       |  4 +-
> >>  drivers/media/tuners/si2157.c                | 15 ++++--
> >>  drivers/media/tuners/xc5000.c                | 13 ++++-
> >>  drivers/media/usb/au0828/au0828-cards.c      | 50 +++++++++++++++++++=
+
> >>  drivers/media/usb/au0828/au0828-cards.h      |  2 +
> >>  drivers/media/usb/au0828/au0828-dvb.c        |  1 +
> >>  drivers/media/usb/au0828/au0828-input.c      |  1 +
> >>  drivers/media/usb/au0828/au0828-video.c      | 30 +++++++++++-
> >>  drivers/media/usb/cx231xx/cx231xx-avcore.c   |  7 ++-
> >>  drivers/media/usb/em28xx/em28xx-cards.c      | 19 +++++---
> >>  13 files changed, 156 insertions(+), 24 deletions(-)
> >>
> >
> >
>

