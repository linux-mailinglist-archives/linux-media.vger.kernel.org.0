Return-Path: <linux-media+bounces-32604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F60AB8A50
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 17:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58DC91889BCB
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 15:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6AD20E6F9;
	Thu, 15 May 2025 15:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="bkAFMqMH";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="gsNWknRE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642251A0B08;
	Thu, 15 May 2025 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747321777; cv=none; b=aOAk+vTsYFq1Muit3WiTaDnDktFFf4ZGMvl2F2Yf9KDlpztCyMoMA/T00aLpo13CJju4Ws4qIE6+WZszNLiQf5Run0KRzyQY3zIbk05b0U9fiMWJK286zi3SWIzcaPczr17MZi3CN5rL2Kf8P8EIrf9ZgUqGxO7K3x41wGeJgIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747321777; c=relaxed/simple;
	bh=w44A4dLjrd4Yidtbmwllfd+kSKFs/nM/K7Ucl6ZDugA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S4AiFx7DgfFcg3mn/vQE1R68jH6WjyUjClLaow5EHnwh8FmavngPcbGJzol2lMgkR54G1m+wzQF+CiNgE5ikjGk0zTbNd4ZxV/TAp7B5c/t1zw1/Ye8JLqBiOAlj8feTt+QFSWcQxy+6fviqLh7Slwdh4rc51TPukMkY1Pl7hvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=bkAFMqMH; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=gsNWknRE reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747321774; x=1778857774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OKO1o7AXgboNWVrjuNu0zS6tMTQ0M3cqjX6LCKpPtBs=;
  b=bkAFMqMHT1cttXb40o5NdJsLUXvOCO8vHvoSkcWaAVc2Wn9aFPIOkCy0
   NfN1kiMtuj9o77lYULu+Ithw0Jd/o32pUILVrvHzWXBds9Ymh9Jm7v1CH
   No9+tfOzs6AEcwEISAKf5ZENIlihacO5yfzR/WUn0BQC2aUCBpDQo9/Bd
   dUW4/kq4G/rHb2NfmWWq/gGTZfoiZotyfKtEm9jDUextO10H/LCQxWqtd
   ioa8anWwew8qUzKBmRQqxeM+P+/B0+4sH04hwXm2yBMDQ1B6J1H5wIY8C
   t9jYfJifDshn5onAZFh9i+ssmok0E8WZb4h9HJzlZCQjIRNNc2FC6v9iI
   g==;
X-CSE-ConnectionGUID: 6W4+I+s4QBeJAKSgWpMqVA==
X-CSE-MsgGUID: OborI3dyS9yfad95ooZ86Q==
X-IronPort-AV: E=Sophos;i="6.15,291,1739833200"; 
   d="scan'208";a="44103160"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 May 2025 17:09:30 +0200
X-CheckPoint: {682603A9-32-BF62DDF1-CB8BF55F}
X-MAIL-CPID: F957553CC4C182DE8056D3848055452E_1
X-Control-Analysis: str=0001.0A006377.682603AC.003A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E0F2169B79;
	Thu, 15 May 2025 17:09:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747321765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKO1o7AXgboNWVrjuNu0zS6tMTQ0M3cqjX6LCKpPtBs=;
	b=gsNWknREq/+YpiCH7AfQW36IRqv/5SjPHth37HoJcFvYvI10tDQMO8NIuLhx80nZHG+XoC
	VTVwcCbauyVxlQ6uGKXVmFTPpvR0yI56JBzxb2wRoa4PaSYX4yNn9ffvUrR9j1mARRa4Rt
	rNkswIyAHY9syxarsQ3n7LfYSEoWApbcM/NRLaBp1eUXe62ouj5T89P5b2hHaqTErpne3k
	GaPdC20+aSeGbs2VS1emFa/FoupHBNwkafpnPoYlYUN0KpG9M5HTz2EboVFMU8wk2tFgMk
	rw5KlLwTYyoSutqTCGDq9E4HVlqtdGqGR4cl6NXfnt+MVD3g0aBqXUshJ2vcvg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] media: dt-bindings: sony,
 imx219: Allow props from video-interface-devices
Date: Thu, 15 May 2025 17:09:24 +0200
Message-ID: <2247039.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <174732159526.2108882.8905658469049267620@selene>
References:
 <20250515142945.1348722-1-alexander.stein@ew.tq-group.com>
 <174732159526.2108882.8905658469049267620@selene>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Donnerstag, 15. Mai 2025, 17:06:35 CEST schrieb Jai Luthra:
> Quoting Alexander Stein (2025-05-15 16:29:42)
> > Allow properties from video-interface-devices. The change is identical =
to
> > commit b6339ecfd0865 ("media: dt-bindings: sony,imx290: Allow props from
> > video-interface-devices")
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
>=20
> Are there any driver changes coming for the new properties?

No. This is a standard property and is already handled in v4l2_fwnode_devic=
e_parse(),
same as orientation.

Best regards,
Alexander

> > ---
> >  Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx219.ya=
ml b/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
> > index 8b23e5fc6a24f..38c3759bcd9f5 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
> > @@ -16,6 +16,9 @@ description: |-
> >    Image data is sent through MIPI CSI-2, which is configured as either=
 2 or
> >    4 data lanes.
> > =20
> > +allOf:
> > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > +
> >  properties:
> >    compatible:
> >      const: sony,imx219
> > @@ -79,7 +82,7 @@ required:
> >    - VDDL-supply
> >    - port
> > =20
> > -additionalProperties: false
> > +unevaluatedProperties: false
> > =20
> >  examples:
> >    - |
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



