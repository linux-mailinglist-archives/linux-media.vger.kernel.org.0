Return-Path: <linux-media+bounces-25604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 50590A26542
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 22:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D81D7A269D
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 21:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513D620FA98;
	Mon,  3 Feb 2025 21:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lN0NurEP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9164414;
	Mon,  3 Feb 2025 21:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738616770; cv=none; b=M1xXb3UrWRwYNcFNY6RfdHGbt0V5ArkCbf9UvPlsjFo4+g+5RZbqld3yGWYfKZuYJZxW17b6t+8tDBV4OjknSutIMwfVjZBs5UxYVTLkIDYE+5Ti5TK20dnP97YocXyU5MOyR0pQJlqZqHccQaWlAuEkCW7yd2hk856PR9qNniw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738616770; c=relaxed/simple;
	bh=cBsOd6wcSiVV2e1fytZZdNGIp2DUe5yMg3BzjkT0Yr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=demNlWLLsvopTpcm3Qgv0YjpWAJX0+QRg//3wjZaMGa1+A5QDdMIkixFgK9wpgMerR/IS9eKgO3dDCl4AArhW7HhSb6ESP8xzytd1v6oiZibNS8o1+l1PGmA2uHfPcx+tbchrr3VwJ+LocChdu65GwfeM1RFUwGVwZetH/ZLplA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lN0NurEP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE25C4CEEC;
	Mon,  3 Feb 2025 21:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738616770;
	bh=cBsOd6wcSiVV2e1fytZZdNGIp2DUe5yMg3BzjkT0Yr4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lN0NurEP59jw3KFihk3UbtTdOqxRtqK5UFsYGY46T/FDOIUUOGEXuY5wOgZrFnfyC
	 Yop1IGJDUrXUuZnuQxWXBF4Ifxr+rq9ms58p7eR2x5lW7B/iKbbxc+OrpSpFmgBLIm
	 b4JwC4pIQ1La+mgOAMowI85qTQxRlZZZo4lZb6+2d37uIZzmF8JCzQxaeMz77O0UWU
	 n8Hms12AU1JnJvdBRI7G7USTCO5Y76axkwKwNKI2sklF42+2nos7xR2M5DbaIgn6p9
	 m6NV+ESbC7j/m6FqLnkt0oc4P8WNGg/XAPoRIiBrgpRuPNdk9zHUwCLaeEoIYENAjI
	 n/bxcXfFKO1oA==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso5570701a12.3;
        Mon, 03 Feb 2025 13:06:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUP67IpQRGhixHtym1uhNFP0kau58+UuIJ//vcZJe1aUHM0Ad/J2zeNx821YgfJW4JipMFsa+DDakQH@vger.kernel.org, AJvYcCUi6tildTRSFeqZw3M0fyLFsoO6TfjxHOC/DTFM5M7x/ljLupB8dXYmjU099JgYqnuBB3NSBzcu@vger.kernel.org, AJvYcCUqKq5DjHfVZoW82Nqbz6RmhqeJwfVHgrA5olg/LZ3J0qsvlKdBzX+7MhGE5bSDrL9eZDtRaS/F2XKW@vger.kernel.org, AJvYcCW/d5KCicNgnUq/e5bskUdTKg1zHgwKxve9uhkr+IJcpBGsfNcoifDhRL/aJ09+fEIqcYO5kThE16FL4bE=@vger.kernel.org, AJvYcCXDbppXb9yZlR3bCHJI2JVIz+rRoCyblkvO9Q6t5OwvLhCh6ZR1Wvz63cbKVgY7g1f8YnsAyXKnnoOtrU95V8GR6AU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJqfHSudn4nmhVaQgJoO6n0A78Fmn67cTatMQbf5QJYA9i7uVv
	OzpMjpJDogsoBVMi4vbB1irK1PLgkUM5qim1EqS5TW+tVlcop9FxBE6GVex32rB1LWGB9NBbODy
	np3oDli5bjGOQSwedBNb7xTxThg==
X-Google-Smtp-Source: AGHT+IHeWZHdJjC4YN+OOJHAB8++nTLMgl7MUL+pvf+VvcXzFyBuc+YptThIQgLhGlBcwS62U/h/TbXO0dgmymUExPY=
X-Received: by 2002:a05:6402:274a:b0:5d1:2535:84d7 with SMTP id
 4fb4d7f45d1cf-5dc5effb1c0mr22570412a12.29.1738616768432; Mon, 03 Feb 2025
 13:06:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201093126.7322-1-biju.das.jz@bp.renesas.com>
 <CAL_Jsq+dn5wyEKbvAT8M2V=nM-vV_eHiRtwO_0h6EiJ=8OkHSw@mail.gmail.com> <TY3PR01MB11346E1FA592E731E0D32E96686F52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346E1FA592E731E0D32E96686F52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 3 Feb 2025 15:05:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLo4uSGYMcLXN=0iSUMHdW8RaGCY+o8ThQHq3_eUTV9wQ@mail.gmail.com>
X-Gm-Features: AWEUYZnrMYgeFmznny2afQJcB_ErB5ngAuWrI9ehgUSHGdkfF9dpCy3oKUhDEGQ
Message-ID: <CAL_JsqLo4uSGYMcLXN=0iSUMHdW8RaGCY+o8ThQHq3_eUTV9wQ@mail.gmail.com>
Subject: Re: [PATCH v2] of: base: Add of_get_available_child_by_name()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 11:17=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Rob,
>
> +Cc relevant subsystems.
>
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: 03 February 2025 16:53
> > Subject: Re: [PATCH v2] of: base: Add of_get_available_child_by_name()
> >
> > On Sat, Feb 1, 2025 at 3:31=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas=
.com> wrote:
> > >
> > > There are lot of drivers using of_get_child_by_name() followed by
> > > of_device_is_available() to find the available child node by name for
> > > a given parent. Provide a helper for these users to simplify the code=
.
> > >
> > > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > > ---
> > > v1->v2:
> > >  * Updated commit description.
> > >  * Updated kerneldoc comment block
> > >  * Avoided code duplication by using of_get_child_by_name().
> > >
> > > Note:
> > > grep showed the below files will be the users for this new API.
> > > I will be updating these drivers once this patch is in mainline.
> >
> > No need to wait. Please convert all the net ones and send this patch wi=
th them.
>
> Thanks for the feedback.
>
> Subsequently, I have send the patches. However, Andrew[1]/Krystoff[2]
> mentioned me to wait till this patch appear in -rc ,
>
> Can it be fast tracked to 6.14-rcX?? Otherwise, it needs to wait till 6.1=
5-rc1
> and other patches will then appear on 6.16-rc1.

Most maintainer trees are based on rc1. So are you sure everyone is
going to be fine with a rc2 dependency? Generally, new APIs don't go
in without a user.

That being said, if this was 10s of different trees I'd reconsider,
but since most of the callers are in net, I'm less willing to apply
"not a fix" to fixes.

> [1] https://lore.kernel.org/all/96fbccd3-fd79-4b2f-8f41-bd0e3fdb2c69@lunn=
.ch/
>
> [2] https://lore.kernel.org/all/7fe9dad9-85e2-4cf0-98bc-cca20ff62df5@kern=
el.org/

It's not like they are saying to do the opposite of what I said. If
the dependency is not part of your series, then it needs to be in rc1.

Rob

