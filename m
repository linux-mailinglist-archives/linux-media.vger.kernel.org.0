Return-Path: <linux-media+bounces-34715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 266DAAD85A6
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 10:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ABDB3BABED
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 08:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B3D26B775;
	Fri, 13 Jun 2025 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org header.b="AzUBi9sG"
X-Original-To: linux-media@vger.kernel.org
Received: from mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E43424DCE8;
	Fri, 13 Jun 2025 08:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.182.54.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749803362; cv=none; b=U+3yHEU02af4OAshBiIoMjZy5WtIQVw0+rRUQfu3BtjkH8ScHqz4aGOaj3I5WM5Adi2KQY56piFDxqMKoMmE8CxCc6cs8QrWmbcqcGlD1Z+0TFIWLQc5TCQCJG8Qhoud9mroF55P36b8hovaVPC0eptDmdaXnSxwqfGfICFplAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749803362; c=relaxed/simple;
	bh=mbo21/O/tb+/v1cHO9/jX/KjlrdVyhKn6PjeqyCcfGY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fc308+5oV4Z56quyWvmkaHPrqaIpwHw+O5Ci4f+OYTgfPEp0e6JbyKr7xAkVMwnS9os44qGrRzFaU6KiPk6TrLqbQhqh0E1ELBi/MLvf+7Ss88wffI92/BIFE8UEz6FbRoScnEoVi1AkOcYylT1bywwlHwTjr5y6BD9FAVlx240=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mailoo.org; spf=pass smtp.mailfrom=mailoo.org; dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org header.b=AzUBi9sG; arc=none smtp.client-ip=213.182.54.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mailoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailoo.org
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
	t=1749803334; bh=mbo21/O/tb+/v1cHO9/jX/KjlrdVyhKn6PjeqyCcfGY=;
	h=X-EA-Auth:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=AzUBi9sGRf2H4KcZLOmBBlZtMNo/gvj7zlnMFIAP7GqSlf/OUySwxuVPdyaaZew19
	 ycFJKS9+fXLUpo1yEFGJbDWef5pEhc/WuaHz3oSpOYQTrviFBPKcEj0wZAysyUFsXJ
	 oLagW6VB35s9MGd6f4Vh7pgJbIP7hWKl7fT1VyvI=
Received: by b221-3.in.mailobj.net [192.168.90.23] with ESMTP
	via ip-22.mailoo.org [213.182.54.22]
	Fri, 13 Jun 2025 10:28:51 +0200 (CEST)
X-EA-Auth: gnpnY6dGPIUhlFepldG3MbudFjlJfBvJ+4/XssfeHzUAH4jMqgFSn86AyJqPLY6G6rEo55/+3CnCP/nDWDn3/Rig0Zmo28q94HrA2FMoWEA=
Message-ID: <67022a6de185740fa482183f29d574298048d54f.camel@mailoo.org>
Subject: Re: [PATCH v4 2/4] media: qcom: camss: Add support for MSM8939
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy	
 <vladimir.zapolskiy@linaro.org>, Robert Foss <rfoss@kernel.org>, Todor
 Tomov	 <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley	 <conor+dt@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio	 <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 =?ISO-8859-1?Q?Andr=E9?= Apitzsch
	 <git@apitzsch.eu>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Date: Fri, 13 Jun 2025 10:28:47 +0200
In-Reply-To: <03f54bb4-ddbb-4be8-9f9b-8328fdb98443@linaro.org>
References: <20250602-camss-8x39-vbif-v4-0-32c277d8f9bf@mailoo.org>
	 <20250602-camss-8x39-vbif-v4-2-32c277d8f9bf@mailoo.org>
	 <877a72fa-cdae-4a66-9991-5ea86ef76aac@linaro.org>
	 <e73d676ba1901437d471a2a633e94a07b19a3e05.camel@mailoo.org>
	 <03f54bb4-ddbb-4be8-9f9b-8328fdb98443@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42app2) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 13 juin 2025 =C3=A0 09:06 +0100, Bryan O'Donoghue a =C3=A9crit=
=C2=A0:
> On 07/06/2025 22:43, Vincent Knecht wrote:
> > Le vendredi 06 juin 2025 =C3=A0 13:59 +0300, Vladimir Zapolskiy a =C3=
=A9crit=C2=A0:
> > > Hello Vincent.
> > >=20
> > > On 6/2/25 20:27, Vincent Knecht via B4 Relay wrote:
> > > > From: Vincent Knecht <vincent.knecht@mailoo.org>
> > > >=20
> > > > The camera subsystem for the MSM8939 is the same as MSM8916 except =
with
> > > > 3 CSID instead of 2, and some higher clock rates.
> > > >=20
> > > > As a quirk, this SoC needs writing values to 2 VFE VBIF registers
> > > > (see downstream msm8939-camera.dtsi vbif-{regs,settings} properties=
).
> > > > This fixes black stripes across sensor and garbage in CSID TPG outp=
uts.
> > > >=20
> > > > Add support for the MSM8939 camera subsystem.
> > > >=20
> > > > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > > Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> > >=20
> > > There was a preceding and partially reviewed changeset published on
> > > linux-media [1] before v1 of the MSM8939 platform support in CAMSS,
> > > due to a merge conflict this platform changeset should be rebased IMH=
O.
> > >=20
> > > [1] https://lore.kernel.org/all/20250513142353.2572563-4-vladimir.zap=
olskiy@linaro.org/
> > >=20
> > > --
> > > Best wishes,
> > > Vladimir
> >=20
> > Thank you, I'll look into it
> >=20
> >=20
>=20
> I think I will take 8939, plus any of the other now 3 SoCs waiting to be=
=20
> merged with RBs.
>=20
> Bindings consistent with the last 10 years can go ahead. Its not=20
> reasonable or in the interests of the community and developers to gate=
=20
> any further.
>=20
> ---
> bod

Hi Bryan,

I've locally made the requested changes for bindings
(ordering, vdda voltage, style, clock-lanes removal),
just not gotten around to rebase on Vladimir series.

So I can still send a new version with just these changes today.




