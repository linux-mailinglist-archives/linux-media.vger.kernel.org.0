Return-Path: <linux-media+bounces-13481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 433A990BA74
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 21:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC2651F21AE4
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 19:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B40E198A39;
	Mon, 17 Jun 2024 19:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Tbujqd+d"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ABC16CD14;
	Mon, 17 Jun 2024 19:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718650936; cv=none; b=R3m1a8+XBEJ7VWv9ZCv8yn7a5UM/BK/8dCPlmXggOlRaAvxY1mgBPul0KWWAbSeisd664wY80wACBrVgVhbQfyVCIQJ/wwZ3N9C+06CQj7J3Cj+F8swDTG6yxv3tY1t1J26rJ02ZnnYW9EeokhxiRytiaD3VXa8c7JGyj8d9Pe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718650936; c=relaxed/simple;
	bh=l5lIlh24w/7FwO/6OIqNCbRFzX0ceZn2KO7/Zmyd8ug=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m8ErTqJbkj4c8el8lFGjiNEAogMIWg52Q++YerWNi2KeLVoIh6E2y1cHb5y9E+DrQw/TDaV2U9sPmDwEacyGayH1hgHLySqp7p82cs3meD/P3O0WWiXR5obvGVHsPKlYWGFjoBeCqdXr8lyC1uXa2S/vDqteb7fw8H98Ju7bYSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Tbujqd+d; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718650932;
	bh=l5lIlh24w/7FwO/6OIqNCbRFzX0ceZn2KO7/Zmyd8ug=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Tbujqd+d46Gq8FvOkcgagCQtfYodA49/eOrhDP+tU72lZVY3/EyCC8v0iU4IEl70P
	 1UQ8cgmRVuWZ2Hrp3Zy5/z7PiEIliCWrpvdPDZi8ZMozcquKAKGfI/v+0RZZcq+Fx5
	 ftEG4CnRYO6dNTXDB2+HeaNjeer/m7giujB4OyTHwWg1WO2NLBk5K0WuykL31bHGuQ
	 FaaUy/v0Xq8xMFtLyLE5jB/eRwmE3GhF4St9+vPVta8FdRPMRdSgjN7ziZ8AUZmT7H
	 275qt4CkmuYb45aW9b44MtA0PnQmyRct5rGK3tmIEyAQwvyHJxLr5ZLOP/R58Cs1Vf
	 8QarUl26tyKqA==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3496F3780F7F;
	Mon, 17 Jun 2024 19:02:08 +0000 (UTC)
Message-ID: <7e4236cd59d1af009e23aabbd2c96735cbb379b3.camel@collabora.com>
Subject: Re: [PATCH v6,04/24] v4l: add documentation for restricted memory
 flag
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomasz Figa <tfiga@chromium.org>, Yunfei Dong
 <yunfei.dong@mediatek.com>,  Jeffrey Kardatzke <jkardatzke@google.com>,
 =?ISO-8859-1?Q?N=EDcolas?= "F . R . A . Prado" <nfraprado@collabora.com>, 
 Nathan Hebert <nhebert@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Marek Szyprowski <m.szyprowski@samsung.com>, Chen-Yu
 Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,  Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
 <daniel@ffwll.ch>,  Steve Cho <stevecho@chromium.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Brian Starkey <Brian.Starkey@arm.com>, John
 Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthias
 Brugger <matthias.bgg@gmail.com>,  linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Mon, 17 Jun 2024 15:02:05 -0400
In-Reply-To: <20240612202507.GT28989@pendragon.ideasonboard.com>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
	 <20240516122102.16379-5-yunfei.dong@mediatek.com>
	 <20240522111622.GA31185@pendragon.ideasonboard.com>
	 <bhgv5djcjc4yt75pyug2yirrymeucjyslthnvq6k2kpp7axfph@jzo5wpcbgwun>
	 <33d38919f3f94b6e1848aaee20cf52ac9c1df606.camel@collabora.com>
	 <20240612202507.GT28989@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mercredi 12 juin 2024 =C3=A0 23:25 +0300, Laurent Pinchart a =C3=A9crit=
=C2=A0:
> On Wed, Jun 12, 2024 at 03:43:58PM -0400, Nicolas Dufresne wrote:
> > Le mercredi 12 juin 2024 =C3=A0 13:37 +0900, Tomasz Figa a =C3=A9crit=
=C2=A0:
> > > > Why is this flag needed ? Given that the usage model requires the V=
4L2
> > > > device to be a dma buf importer, why would userspace set the
> > > > V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM flag and pass a non-restricted
> > > > buffer to the device ?
> > >=20
> > > Given that the flag is specified at REQBUF / CREATE_BUFS time, it's
> > > actually useful to tell the driver the queue is operating in restrict=
ed
> > > (aka secure) mode.
> > >=20
> > > I suppose we could handle that at the time of a first QBUF, but that
> > > would make the driver initialization and validation quite a bit of pa=
in.
> > > So I'd say that the design being proposed here makes things simpler a=
nd
> > > more clear, even if it doesn't add any extra functionality.
> >=20
> > There is few more reasons I notice in previous series (haven't read the=
 latest):
> >=20
> > - The driver needs to communicate through the OPTEE rather then SCP and=
 some
> > communication are needed just to figure-out things like supported profi=
le/level
> > resolutions etc.
> > - The driver needs to allocate auxiliary buffers in secure heap too, al=
location
> > at runtime are not the best
>=20
> Will the same driver support both modes on the same system ?

I believe so, yes.

>=20
> > Note that the discussion around this flag already took place in the ver=
y first
> > iteration of the serie, it was originally using a CID and that was a pr=
oposed
> > replacement from Hans.
>=20


