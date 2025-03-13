Return-Path: <linux-media+bounces-28117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5C7A5ED3E
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 08:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E5301791A2
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 07:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A601325FA29;
	Thu, 13 Mar 2025 07:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MetFFPVn"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE9C1DEFE7;
	Thu, 13 Mar 2025 07:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741852007; cv=none; b=RQPHib9+CQmNJxnGMWWRhmXDZrBzmejnquJ+EJbqH1H58bYu+tZoZNDkJfl9+CWPQjRt1pfU7QoDRH+s2wfRI0lybTuAxhRHWEXADnAy7ag3l0MRgfeVPQdn1thaJMDNh5p2TV3JyQRJUoswE2YsPq36mJRdRWHgjFIhlHzj6C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741852007; c=relaxed/simple;
	bh=NLbx9CE9um5e8ZDX049W9Xu5o5hK1fC/rGBjNeq0Izk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SnV48w8vAHJsczdPRj6zKTlZvP/N/Sab1noobRZYwvQn3hn56hVU/4uXJyZ/SDi9cyFQBBEwJcNCwkLfQvarfi6eGpLVxm0vBqJH7EJasGALaT8WlWl3P2ncvHALwj27tb2PzuZEfKhzpyFY+NwvaQUbpHbg3HLk0U1sa2xRF84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MetFFPVn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741852002;
	bh=NLbx9CE9um5e8ZDX049W9Xu5o5hK1fC/rGBjNeq0Izk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=MetFFPVnzzVr6xvvb3mlAKcDR+PYPtdikx/pzSHCq6JPVsbiuw7xRtOM1wyNbmAYX
	 G0klwcaU4t5oA9UPxpu2e8owgxNK7hlnF3L19X23W/OCaZ40Q2jNWaKOFE9ISSOILS
	 iPqZOmM65iY4/0LsMYUet94MN4ezE6j5+uStLAxmFnaJzMqFXl20E8N/XhSP3jKeF1
	 9xuetda7hgotoUko15iPpqKPu6SMVi8D6ByNCdzKdbi9Eq1MpSXUSrHoL7FogFgsg4
	 obVyfdgve7JwQncxTbOtyxz+uS7G4xSb5GRJhdltf02KtzZa03odc/4om4zqqLMyQ4
	 O+kYBzUKzrEMA==
Received: from apertis-1.home (2a01cb0892F2D600c8f85Cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6677D17E0CA6;
	Thu, 13 Mar 2025 08:46:42 +0100 (CET)
Message-ID: <64b82675410733368fa420d29b31921bba4e224d.camel@collabora.com>
Subject: Re: [PATCH 5/5] media/i2c: max96717: allow user to override
 operation mode from DT
From: Julien Massot <julien.massot@collabora.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org, 	linux-media@vger.kernel.org
Date: Thu, 13 Mar 2025 08:46:41 +0100
In-Reply-To: <twfyc6qllxcssrw7ydfinby56azxadw6zjcinzukncoxnunixu@swknfqwn2qez>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
	 <20250207112958.2571600-6-laurentiu.palcu@oss.nxp.com>
	 <3c46bbb64e6e9c7b836c3ca82d678e550d1b2ddf.camel@collabora.com>
	 <twfyc6qllxcssrw7ydfinby56azxadw6zjcinzukncoxnunixu@swknfqwn2qez>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Laurentiu,

> > > @@ -1101,6 +1110,9 @@ static int max96717_parse_dt(struct max96717_pr=
iv *priv)
> > > =C2=A0
> > > =C2=A0	priv->mipi_csi2 =3D vep.bus.mipi_csi2;
> > > =C2=A0
> > > +	if (fwnode_property_present(dev_fwnode(dev), "maxim,cfg-mode-overri=
de"))
> > > +		priv->mode_override =3D true;
> > > +
> > 	source_fwnode =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
> > 							MAX96717_PAD_SOURCE, 0, 0);
> > 	if (fwnode_property_present(source_fwnode, "maxim,tunnel-mode")) {
> > 		priv->mode_override =3D true;
> > 		priv->mode =3D GMSL2_MODE_TUNNEL;
> > 	}
>=20
> So, I don't think the boolean 'maxim,tunnel-mode' would work well when
> the pin configuration is 'tunnel' and the user wants to switch to
> 'pixel'. Maybe, replace the boolean 'maxim,cfg-mode-override' property
> with an optional enum property 'maxim,cfg-mode'? Does that sound better?

Yes, please see my comment on patch 3/5

Regards,
--
Julien

