Return-Path: <linux-media+bounces-41570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E09AEB400A5
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 14:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E59D916902E
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6E82F8BC0;
	Tue,  2 Sep 2025 12:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ekd3L/fc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E71F1E5B7C;
	Tue,  2 Sep 2025 12:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756816124; cv=none; b=lGTn++OrzSUBf79bSJR8N7QCudXJHijx23OdrDsytPtZeX5W2neRFo9lAktQ1cFSE5y2+KhQH/qBFs4UGiCJGanRal7Rs4hr1+/MnFcEctyRkID3y7D6+6ZmQE3KARkpfGePJE6es+xdGng3MIUQzmowf+WlHtBfJn7a9KyahyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756816124; c=relaxed/simple;
	bh=SfU1BmkFn+/uikC+Ti2+q5KjRSs4erXTxBfEJyRqQBU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=KMRBuAuKAqzno9C5JB401j44NoCtzdmSERNXEzbmS3IVyCMacWjm7LEmH47+Mo1tNu9nKJTHsCBQsISGnU2ajzNTNuROUqDG372jAdzhuqtQlLwLCK1+dylM3M016of/3l6yj5NlgmMq8YIGtNlocsNeMzMiQ5RZ+DPi/+HJGpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ekd3L/fc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from thinkpad.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19761C77;
	Tue,  2 Sep 2025 14:27:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756816052;
	bh=SfU1BmkFn+/uikC+Ti2+q5KjRSs4erXTxBfEJyRqQBU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ekd3L/fcwqGdOgNIo1NDy8RQ5jXMDUURTxhOT6dRqGJyWAZYYHYyNEiYpKlA7ocMu
	 tLdfone79FcAzKJAS5yKc0nOBMeuCW+x8qdiYqNn3cedCzK5nOaGNhWNCmhLE538OY
	 LlD/k9j31WKrarI8sIiqSO62z0B21NvJo3Zyn75M=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250819024413.GJ5862@pendragon.ideasonboard.com>
References: <20250814113701.165644-1-isaac.scott@ideasonboard.com> <aJ77VTtZy96JJCHE@valkosipuli.retiisi.eu> <20250815103205.GJ6201@pendragon.ideasonboard.com> <aJ8ZJFSn5Wxhj2Aj@valkosipuli.retiisi.eu> <20250815113633.GM6201@pendragon.ideasonboard.com> <aJ8pKs_6YpAiPjlq@valkosipuli.retiisi.eu> <20250819024413.GJ5862@pendragon.ideasonboard.com>
Subject: Re: [PATCH] imx-mipi-csis: Get the number of active lanes from mbus_config
From: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: linux-media@vger.kernel.org, rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>
Date: Tue, 02 Sep 2025 13:28:37 +0100
Message-ID: <175681611736.1349241.9877873145029586025@isaac-ThinkPad-T16-Gen-2>
User-Agent: alot/0.10

Hi All,

Quoting Laurent Pinchart (2025-08-19 03:44:13)
<snip>
> > > > > That would need to parse the endpoint every time we start streami=
ng, it
> > > > > doesn't sound ideal.
> > > >=20
> > > > Perhaps not, but does that matter in practice? Parsing the endpoint=
 is,
> > > > after all, fairly trivial. The advantage would be simplifying drive=
rs.
> > >=20
> > > It's trivial from a code point of view, but it's not a cheap operatio=
n.
> > > I'd like to avoid making starting streaming more expensive.
> >=20
> > How cheap is "not cheap"? I'd be surprised if parsing an endpoint took =
more
> > time than e.g. an I=C2=B2C register write. Of course it depends on the =
CPU...
>=20
> Still, it's not cheap, and I think it can easily be avoided.
>=20
> > > > Alternatively we could think of caching this information somewhere =
but I
> > > > don't think it's worth it.
> > >=20
> > > Drivers likely need to parse endpoints for other reasons. I'd cache t=
he
> > > value in drivers, like done today, and pass it to a get_active_lanes
> > > helper.
> >=20
> > Then drivers presumably would also validate this against the endpoint
> > configuration, wouldn't they? That's extra code in every CSI-2 receiver
> > driver.
>=20
> Why so ? The number of connected lanes can be passed to the helper
> function, which can use it to validate the number of lanes reported by
> the source subdev.
>=20

Apologies if I'm interpreting this wrong, but it seems that the main
thing I'm reading is that this is not the correct place to implement
this, and it should be implemented at a higher level (e.g. in v4l2) that
lets all MIPI CSI reciever drivers use it?

I have noticed that similar functionality has been implemented as part
of __v4l2_get_link_freq_pad. Are you suggesting that I take a similar
approach and resubmit as a new series?

> > > > > > The function could take struct media_pad pointer as an argument=
, or struct
> > > > > > v4l2_subdev pointer and the pad number.
> > > > > >=20
> > > > > > I wonder if any other parameters could change dynamically but I=
 can't think
> > > > > > of that now, so perhaps just the number of lanes is what the fu=
nction
> > > > > > should indeed return.
> > > > > >=20
> > > > > > > +
> > > > > > > +   return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > >  static int mipi_csis_s_stream(struct v4l2_subdev *sd, int en=
able)
> > > > > > >  {
> > > > > > >     struct mipi_csis_device *csis =3D sd_to_mipi_csis_device(=
sd);
> > > > > > > @@ -965,6 +1002,10 @@ static int mipi_csis_s_stream(struct v4=
l2_subdev *sd, int enable)
> > > > > > >     format =3D v4l2_subdev_state_get_format(state, CSIS_PAD_S=
INK);
> > > > > > >     csis_fmt =3D find_csis_format(format->code);
> > > > > > > =20
> > > > > > > +   ret =3D mipi_csis_get_active_lanes(sd);
> > > > > > > +   if (ret < 0)
> > > > > > > +           dev_dbg(csis->dev, "Failed to get active lanes: %=
d", ret);
> > > > > > > +
> > > > > > >     ret =3D mipi_csis_calculate_params(csis, csis_fmt);
> > > > > > >     if (ret < 0)
> > > > > > >             goto err_unlock;
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

Thank you very much for the help!

Best wishes,

Isaac

