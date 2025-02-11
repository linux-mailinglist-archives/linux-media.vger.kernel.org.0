Return-Path: <linux-media+bounces-26004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B2BA30DF9
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 15:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E8117A1CA1
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 14:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125E024CEE9;
	Tue, 11 Feb 2025 14:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="elxMORDJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6379426BD8C;
	Tue, 11 Feb 2025 14:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739283353; cv=none; b=A2kWxpBP/fUsIodxCK56aNIp7zwv41lYG5dVdM2G6QL/Kf/F3/6s842Uiup2reICHQrRQJ9Q59uLsH9xFDlE74Sbf9WGNkXgGvpX//aO6D996WKv3f9CX40rtZUXmdqpJwu/j2DM5JZxTxc391n4mhjrUWcXSo7bPr8PadoPpxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739283353; c=relaxed/simple;
	bh=vx9O+Mrp8ZloMp2I15OcH0wVcE+zETLe7jg2gBDpR9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7YFZ//kvD2OPs/uLeSNjq6nhpioxEFwxV+sIvfkALzfefM2CHQx5D6WbwLrV3f6b1Ya+35840JsDAwN2DDiUNKODD3pCc9VqG7fblGRLZ93TuwxtM526gJQTwcp3h9JB1osPCh7bAdTT/yPDHSOZSXkRB7BLPJZWRQeBIZj/FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=elxMORDJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0399C4CEF1;
	Tue, 11 Feb 2025 14:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739283352;
	bh=vx9O+Mrp8ZloMp2I15OcH0wVcE+zETLe7jg2gBDpR9A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=elxMORDJUV8rUqcrN5d49N87tB20qF4TvYX84FcuXqUyh5QTvfJISjRiSPJ7HHyb2
	 W7nXAVGccRuEtebe05KpJvf9OELTmirtNiDH0sAY0V94+cmDgG9ZNXnWifsZeWp2OI
	 qnyzTP6VfvBYixZEdkJuCqSiFqwA8bEhxyfAIlQ0zPk5aP1nYqOx3eg24GdDc8upd1
	 4PJTog+EixbWJrn9vKlOp7TRqnHKhR38T7L6vEYVjPwRq5iMA6QuceZol/LhHPWSO2
	 jysT/TrwAmdVM1ZD9nTiS4+CVK/eX+dgjKRXw4l7hbFS2Jl5gM7kYwEI0XhNK1pgae
	 EAaZpkBtSEmTA==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5de6ff9643fso4786256a12.3;
        Tue, 11 Feb 2025 06:15:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6i93oag61b6iyhKOx299Ebn0M2GzC72+dT+ahn6dV14f4NIXtGXIJbUGmpZFQB3Y/2b35xCrWktOK3w==@vger.kernel.org, AJvYcCUIfhmbC9fWDqfF14DUh8F+IsujBTV+fjGSskwMdBPwqgaqMAo+3630dWlJn3QytplnnMlbGlsHoQ==@vger.kernel.org, AJvYcCWKjOtLR65qPv5aQtvUa/kXatSuSbmtH7LxN+C9DcQR2HDXGDWkQJ/wAkb2+BYoj5YMizZ5RG2t@vger.kernel.org, AJvYcCX/T6MSlAMIfXNVEWsLley4OPsqC74oRWZp8mgtm00Dx8Lvcd4NidlK7sLphJzPYSb0mzFwPtsmXI6vxYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKet6QcfHyPnNti0gFeQB/dZec40zCasdjLT5psICtOuqblgG+
	E9JEZKQ6Q/1FXCo9aPqHaYhXjHG2fnKJhhVAI0CbBu/qd1dJCD5Q8rMUwzHxQ6Av/aIkB+xjDij
	9DKAYhoHRyEQwkGYEHS17z8EKKg==
X-Google-Smtp-Source: AGHT+IHPFlcafWu/f2YnWtzzBAOBWGi0vS7ZnISM2tmE/GF1io4B2QAdby840SxKz+heJdQoEdMUNxhzBsIItPSAUqc=
X-Received: by 2002:a05:6402:5309:b0:5de:8332:a8e1 with SMTP id
 4fb4d7f45d1cf-5de8332aa41mr8365317a12.18.1739283351015; Tue, 11 Feb 2025
 06:15:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com> <Z6XDKi_V0BZSdCeL@pengutronix.de>
 <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com> <20250207153722.GA24886@pendragon.ideasonboard.com>
In-Reply-To: <20250207153722.GA24886@pendragon.ideasonboard.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 11 Feb 2025 08:15:39 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+oqmci-11TB83Hx3Ry44+OKNjQyu14i-zKdNNypE30nw@mail.gmail.com>
X-Gm-Features: AWEUYZkSbwhPLFd56_bI60NKIKiBbzc0CMtVVNwvbhNcNt3Mir5GAD_MPqTcdC8
Message-ID: <CAL_Jsq+oqmci-11TB83Hx3Ry44+OKNjQyu14i-zKdNNypE30nw@mail.gmail.com>
Subject: Re: [PATCH 1/9] of: Add warpper function of_find_node_by_name_balanced()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "zhangzekun (A)" <zhangzekun11@huawei.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	saravanak@google.com, justin.chen@broadcom.com, florian.fainelli@broadcom.com, 
	andrew+netdev@lunn.ch, kuba@kernel.org, kory.maincent@bootlin.com, 
	jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, olteanv@gmail.com, 
	davem@davemloft.net, taras.chornyi@plvision.eu, edumazet@google.com, 
	pabeni@redhat.com, sudeep.holla@arm.com, cristian.marussi@arm.com, 
	arm-scmi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-media@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, chenjun102@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 9:37=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Zekun,
>
> On Fri, Feb 07, 2025 at 07:28:23PM +0800, zhangzekun (A) wrote:
> > =E5=9C=A8 2025/2/7 16:24, Oleksij Rempel =E5=86=99=E9=81=93:
> > > On Fri, Feb 07, 2025 at 09:31:09AM +0800, Zhang Zekun wrote:
> > >> There are many drivers use of_find_node_by_name() with a not-NULL
> > >> device_node pointer, and a number of callers would require a call to
> > >> of_node_get() before using it. There are also some drivers who forge=
t
> > >> to call of_node_get() which would cause a ref count leak[1]. So, Add=
 a
> > >> wraper function for of_find_node_by_name(), drivers may use this fun=
ction
> > >> to call of_find_node_by_name() with the refcount already balanced.
> > >>
> > >> [1] https://lore.kernel.org/all/20241024015909.58654-1-zhangzekun11@=
huawei.com/
> > >
> > > Hi Zhang Zekun,
> > >
> > > thank you for working on this issue!
> > >
> > > First of all, let's take a step back and analyze the initial problem.
> > > Everything following is only my opinion...
> > >
> > > The main issue I see is that the current API - of_find_node_by_name -
> > > modifies the refcount of its input by calling of_node_put(from) as pa=
rt
> > > of its search. Typically, a "find" function is expected to treat its
> > > input as read-only. That is, when you pass an object into such a
> > > function, you expect its reference count to remain unchanged unless
> > > ownership is explicitly transferred. In this case, lowering the refco=
unt
> > > on the input node is counterintuitive and already lead to unexpected
> > > behavior and subtle bugs.
> > >
> > > To address this, the workaround introduces a wrapper function,
> > > of_find_node_by_name_balanced, which first increments the input=E2=80=
=99s
> > > refcount (via of_node_get()) before calling the original function. Wh=
ile
> > > this "balances" the refcount change, the naming remains problematic f=
rom
> > > my perspective. The "_balanced" suffix isn=E2=80=99t part of our comm=
on naming
> > > conventions (traditions? :)). Most drivers expect that a function
> > > starting with "find" will not alter the reference count of its input.
> > > The term "balanced" doesn=E2=80=99t clearly convey that the input's r=
efcount is
> > > being explicitly managed - it instead obscures the underlying behavio=
r,
> > > leaving many developers confused about what guarantees the API provid=
es.
> > >
> > > In my view, a more natural solution would be to redesign the API so t=
hat
> > > it doesn=E2=80=99t modify the input object=E2=80=99s refcount at all.=
 Instead, it should
> > > solely increase the refcount of the returned node (if found) for safe
> > > asynchronous usage. This approach would align with established
> > > conventions where "find" implies no side effects on inputs or output,
> > > and a "get" indicates that the output comes with an extra reference. =
For
> > > example, a function named of_get_node_by_name would clearly signal th=
at
> > > only the returned node is subject to a refcount increase while leavin=
g
> > > the input intact.
> > >
> > > Thus, while the current workaround "balances" the reference count, it
> > > doesn't address the underlying design flaw. The naming still suggests=
 a
> > > "find" function that should leave the input untouched, which isn=E2=
=80=99t the
> > > case here. A redesign of the API - with both the behavior and naming
> > > aligned to common expectations - would be a clearer and more robust
> > > solution.
> > >
> > > Nevertheless, it is only my POV, and the final decision rests with th=
e
> > > OpenFirmware framework maintainers.
> > >
> > > Best Regards,
> > > Oleksij
> >
> > Hi, Oleksij,
> >
> > Thanks for your review. I think redesign the API would be a fundamental
> > way to fix this issue, but it would cause impact for current users who
> > knows the exact functionality of of_find_node_by_name(), which need to
> > put the "from" before calling it (I can't make the assumption that all
> > of drivers calling of_find_node_by_name() with a not-NULL "from"
> > pointer, but not calling of_node_get() before is misuse). The basic ide=
a
> > for adding a new function is try not to impact current users. For users
> > who are confused about the "_balanced" suffix,the comments of
> > of_find_node_by_name() explains why this interface exists.
>
> I think we all agree that of_find_node_by_name() is miused, and that it
> shows the API isn't optimal. What we have different opinions on is how
> to make the API less error-prone. I think adding a new
> of_find_node_by_name_balanced() function works around the issue and
> doesn't improve the situation much, I would argue it makes things even
> more confusing.
>
> We have only 20 calls to of_find_node_by_name() with a non-NULL first
> argument in v6.14-rc1:
>
> arch/powerpc/platforms/chrp/pci.c:      rtas =3D of_find_node_by_name (ro=
ot, "rtas");
>
> The 'root' variable here is the result of a call to
> 'of_find_node_by_path("/")', so I think we could pass a null pointer
> instead to simplify things.

I think this could just be 'of_find_node_by_path("/rtas")' which does
occur elsewhere.

> arch/powerpc/platforms/powermac/pic.c:          slave =3D of_find_node_by=
_name(master, "mac-io");
>
> Here I believe of_find_node_by_name() is called to find a *child* node
> of 'master'. of_find_node_by_name() is the wrong function for that.

Yes, I think that's always a child of the PCI bus.

>
> arch/sparc/kernel/leon_kernel.c:        np =3D of_find_node_by_name(rootn=
p, "GAISLER_IRQMP");
> arch/sparc/kernel/leon_kernel.c:                np =3D of_find_node_by_na=
me(rootnp, "01_00d");
> arch/sparc/kernel/leon_kernel.c:        np =3D of_find_node_by_name(nnp, =
"GAISLER_GPTIMER");
> arch/sparc/kernel/leon_kernel.c:                np =3D of_find_node_by_na=
me(nnp, "01_011");
>
> Here too the code seems to be looking for child nodes only (but I
> couldn't find a DT example or binding in-tree, so I'm not entirely
> sure).

Sparc doesn't use OF_DYNAMIC, so who cares... But there are some Sparc
DT dumps here:

https://git.kernel.org/pub/scm/linux/kernel/git/davem/prtconfs.git/

>
> drivers/clk/ti/clk.c:   return of_find_node_by_name(from, tmp);
>
> Usage here seems correct, the reference-count decrement is intended.
>
> drivers/media/i2c/max9286.c:    i2c_mux =3D of_find_node_by_name(dev->of_=
node, "i2c-mux");
> drivers/media/platform/qcom/venus/core.c:       enp =3D of_find_node_by_n=
ame(dev->of_node, node_name);
> drivers/net/dsa/bcm_sf2.c:      ports =3D of_find_node_by_name(dn, "ports=
");
> drivers/net/dsa/hirschmann/hellcreek_ptp.c:     leds =3D of_find_node_by_=
name(hellcreek->dev->of_node, "leds");
> drivers/net/ethernet/broadcom/asp2/bcmasp.c:    ports_node =3D of_find_no=
de_by_name(dev->of_node, "ethernet-ports");
> drivers/net/ethernet/marvell/prestera/prestera_main.c:  ports =3D of_find=
_node_by_name(sw->np, "ports");
> drivers/net/pse-pd/tps23881.c:  channels_node =3D of_find_node_by_name(pr=
iv->np, "channels");
> drivers/regulator/scmi-regulator.c:     np =3D of_find_node_by_name(handl=
e->dev->of_node, "regulators");
> drivers/regulator/tps6594-regulator.c:          np =3D of_find_node_by_na=
me(tps->dev->of_node, multi_regs[multi].supply_name);
>
> Incorrect usage, as far as I understand all those drivers are looking
> for child nodes only.
>
> drivers/of/unittest.c:          found =3D of_find_node_by_name(nd->overla=
y, "test-unittest16");
> drivers/of/unittest.c:          found =3D of_find_node_by_name(nd->overla=
y, "test-unittest17");
> drivers/of/unittest.c:          found =3D of_find_node_by_name(nd->overla=
y, "test-unittest18");
> drivers/of/unittest.c:          found =3D of_find_node_by_name(nd->overla=
y, "test-unittest19");
>
> Here too I think only child nodes are meant to be considered.
>
> of_find_node_by_name() is very much misused as most callers want to find
> child nodes, while of_find_node_by_name() will walk the whole DT from a
> given starting point.

Agreed. In general, it's preferred to look for nodes by compatible
rather than node name with child nodes being an exception.

> I think the right fix here is to
>
> - Replace of_find_node_by_name(root, ...) with
>   of_find_node_by_name(NULL, ...) in arch/powerpc/platforms/chrp/pci.c
>   (if my understanding of the code is correct).
>
> - Replace of_find_node_by_name() with of_get_child_by_name() in callers
>   that need to search immediate children only (I expected that to be the
>   majority of the above call sites).

+1

> - If there are other callers that need to find indirect children,
>   introduce a new of_get_child_by_name_recursive() function.
>
> At that point, the only remaining caller of of_find_node_by_name()
> (beside its usage in the for_each_node_by_name() macro) will be
> drivers/clk/ti/clk.c, which uses the function correctly.
>
> I'm tempted to then rename of_find_node_by_name() to
> __of_find_node_by_name() to indicate it's an internal function not meant
> to be called except in special cases. It could all be renamed to
> __of_find_next_node_by_name() to make its behaviour clearer.

+1

There's a number of functions which I classify as "don't add new
users" which I keep meaning to document. It's generally older stuff
still using them. Anything returning pointers to raw DT data are
problematic for dynamic DT. Hence all the patches removing
of_find_property/of_get_property calls.

Rob

