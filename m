Return-Path: <linux-media+bounces-39606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F906B22B5B
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 17:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 915BB3ACA88
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 15:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1702F4A07;
	Tue, 12 Aug 2025 15:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v4s0yHvZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7520528000D;
	Tue, 12 Aug 2025 15:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755010960; cv=none; b=dei+FrN2RRddKm7MzhzNXW6V4jvCK0yes+FqOQj8Er9tMx4luIQ4uRWjCY0ZqtrU03zpewHPDlCps3BrFXtuY0w59Yb7X25pS/eLbDsAW0kH4FTZ12jk/diTZCTGeVUquDT4H3dAep212EbirSWU9vMKSNa2DHsPTvbWjC1L6xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755010960; c=relaxed/simple;
	bh=wR0BxUp4dy33m59/4v222C9B6JZd9Ir0fQjUINH+5+c=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=SMFv4GV/lcMdtozfrxzjD3v72A9g/uO3TWa7QA8oU4hQ3GAMs0XLGeFzygExlADj8CfAgoXsemtUl0S9eA1raYv/mC00ALj8dzVp8CVGe4/awSngVxKTGjR0pXCJKPrt8Tn+V7c6e5lJJaxJSucg/uIidskwYdI9bC1qnu7DajQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v4s0yHvZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:7c24:e2bc:68da:c990])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6B4F64A4;
	Tue, 12 Aug 2025 17:01:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755010903;
	bh=wR0BxUp4dy33m59/4v222C9B6JZd9Ir0fQjUINH+5+c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=v4s0yHvZaZ/6VupsHQsCY3EgCCkGo9R/3YHqllY2jygzLaf0K8PIkymJitkGk9jaj
	 Rl12W765kA/4eJ20Rz2rC7kdUYX3/Xa58+xjsfIBEPzMKd2l3hdzPQX321ewN3H26k
	 6FEmlVdW+jb8tvvbaTc3wdJMJhBaUpzu7khXaGkY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250812103243.GK30054@pendragon.ideasonboard.com>
References: <175308758352.3134829.9472501038683860006@localhost> <175326599663.2811177.16620980968274114885@localhost> <m3h5z2vw12.fsf@t19.piap.pl> <175344176070.2811177.10693943493658922992@localhost> <m3qzxyug1s.fsf@t19.piap.pl> <m3cy9futcj.fsf@t19.piap.pl> <m34iumujcs.fsf@t19.piap.pl> <m3zfcet41n.fsf@t19.piap.pl> <m3a545t789.fsf@t19.piap.pl> <20250812103243.GK30054@pendragon.ideasonboard.com>
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption: resolved
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>, Paul Elder <paul.elder@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ondrej Jirman <megi@xff.cz>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Krzysztof =?utf-8?q?Ha=C5=82asa?= <khalasa@piap.pl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 12 Aug 2025 17:02:33 +0200
Message-ID: <175501095338.74722.11604545949710100799@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602

Hi Krzysztof, hi Laurent,

Quoting Laurent Pinchart (2025-08-12 12:32:43)
> Hi Krzysztof,
>=20
> On Tue, Aug 12, 2025 at 07:54:46AM +0200, Krzysztof Ha=C5=82asa wrote:
> > Hi Stefan et al,
> >=20
> > BTW I've added Lucas Stach and Shawn Guo to "Cc" list.
> >=20
> > The problem is the CPU core power supply voltage :-)
>=20
> Ah, the dreadful overdrive mode.
>=20
> > - while the reference manual specifies the max ISP and MEDIA clocks at
> >   500 MHz, the datasheets show this requires the "overdrive" mode =3D
> >   increased CPU power supply voltage. In "normal" mode the ISPs are
> >   limited to 400 MHz (there are other limits, too).
> >=20
> > - I've tried lowering the clock rate after booting the systems (with
> >   a CCM register write), but it didn't fix the problem. I guess some
> >   reset logic is affected here, and the (lower) clock rate must be set
> >   right from the start, in the DT.
>=20
> That's interesting. I wouldn't have expected that.
>=20
> > - anyway, lowering the frequencies of ISP and MEDIA root clocks fixes
> >   the ISP2 MI corruption. I'm currently investigating PMIC settings
> >   (both my Compulab and SolidRun modules use PCA9450C PMICs), so perhaps
> >   I'll be able to use the higher 500 MHz clocks. It doesn't matter much,
> >   though.
> >=20
> > - the question is if we should lower the clocks in the main imx8mp.dtsi
> >   DT file, or the overdrive mode should stay there, and the changes
> >   should be made to the individual board files, or maybe the U-Boot
> >   configs (PMIC output voltages) should be changed etc.
>=20
> I think it would make sense to lower the default clock frequencies, and
> provide an overlay to enable overdrive mode.
>=20
> It's also interesting that the issue only affected the second ISP, as
> the first one should also be limited to 400 MHz in normal mode.

I support that. As a side note, there is already imx8mp-nominal.dtsi
which is only used by one board. That dtsi also uses the
fsl,operating-mode property which enables additional clock checks. So I
ask myself if the default imx8mp.dtsi should specify overdrive mode, or
if we should add a imx8mp-overdrive.dtsi (then we should possibly rename
them to imx8mp-mode-xxx.dtsi so that they sit side by side) to make it
easier to create overlays for both cases.=20

Best regards,
Stefan

>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

