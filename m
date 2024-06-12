Return-Path: <linux-media+bounces-13097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A93905C37
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 21:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DC121F22949
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 19:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8537483CD7;
	Wed, 12 Jun 2024 19:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JIGHAZj2"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7104182860;
	Wed, 12 Jun 2024 19:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718221449; cv=none; b=DSDBoWjlayuag59VSmH5pxhJSn6VgsThd1xZ6Z2fKuZqvoPWkvsp3N7dC1FMdGAMn/Xi60/o0VgNDgRf1QeqmxKxg4igtEaylfHEZc1RQFnsv04tjaEAMKtqOZRD+l/Y3JuDjBE1uqqc91thcKRuS9TY0eCL6leWpB9FQr44yVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718221449; c=relaxed/simple;
	bh=O+FtYBDXnbweDOL4R19ZV1/NNhwH5Y4Lp4FSBLIU0eI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cFoSL3irj/1Tq2/ZMAtZ3esUuDG6aOz03+JneSVOQ1nzCrqdQDaLaodMeqG7P4uOxFKSn8leIadyZrcO1JlkHpO9DjS1D9p1VnWeIljsZsgJObFvlgLtYM9qsTW3gJZR043/f+LoXmmrvhxcAhsV95URtTwuVBRpeY9S1sVSZa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JIGHAZj2; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718221445;
	bh=O+FtYBDXnbweDOL4R19ZV1/NNhwH5Y4Lp4FSBLIU0eI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=JIGHAZj2aQD8Hf9VwrqLKLytT4dBeSTIJBFXagatR7vdFUsPH/EF9pjdUJUUfrXbt
	 wqAbkemqdxjfLNrKrzo2anATw1gMq5x59nVVJM9ZY5FRIKfpQmAXV0kpPctLDPLTP1
	 XtlIewrROieob8JRnMLmwbglgi0JhIjgfuSeA4C3IH9vFvQu+dGxgkrMiTFxO6jMKS
	 3krRYoi7ipn9fU8f3IkM/GnM/O5BSMPNNWdzVIUveQXL0SplP78uVA+B8WtPoNv4jt
	 m10m9kBwO+tBXqGEaAsWX9nmoPup8osFQUJsYEIa0xMafS+8UQx1Q3V9YAZ/mJaaWr
	 0CZWeoEVqskVQ==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B9AEA378065F;
	Wed, 12 Jun 2024 19:44:01 +0000 (UTC)
Message-ID: <33d38919f3f94b6e1848aaee20cf52ac9c1df606.camel@collabora.com>
Subject: Re: [PATCH v6,04/24] v4l: add documentation for restricted memory
 flag
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Tomasz Figa <tfiga@chromium.org>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Jeffrey Kardatzke
 <jkardatzke@google.com>, =?ISO-8859-1?Q?N=EDcolas?= "F . R . A . Prado"
 <nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
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
Date: Wed, 12 Jun 2024 15:43:58 -0400
In-Reply-To: <bhgv5djcjc4yt75pyug2yirrymeucjyslthnvq6k2kpp7axfph@jzo5wpcbgwun>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
	 <20240516122102.16379-5-yunfei.dong@mediatek.com>
	 <20240522111622.GA31185@pendragon.ideasonboard.com>
	 <bhgv5djcjc4yt75pyug2yirrymeucjyslthnvq6k2kpp7axfph@jzo5wpcbgwun>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le mercredi 12 juin 2024 =C3=A0 13:37 +0900, Tomasz Figa a =C3=A9crit=C2=A0=
:
> > Why is this flag needed ? Given that the usage model requires the V4L2
> > device to be a dma buf importer, why would userspace set the
> > V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM flag and pass a non-restricted
> > buffer to the device ?
>=20
> Given that the flag is specified at REQBUF / CREATE_BUFS time, it's
> actually useful to tell the driver the queue is operating in restricted
> (aka secure) mode.
>=20
> I suppose we could handle that at the time of a first QBUF, but that
> would make the driver initialization and validation quite a bit of pain.
> So I'd say that the design being proposed here makes things simpler and
> more clear, even if it doesn't add any extra functionality.

There is few more reasons I notice in previous series (haven't read the lat=
est):

- The driver needs to communicate through the OPTEE rather then SCP and som=
e
communication are needed just to figure-out things like supported profile/l=
evel
resolutions etc.
- The driver needs to allocate auxiliary buffers in secure heap too, alloca=
tion
at runtime are not the best

Note that the discussion around this flag already took place in the very fi=
rst
iteration of the serie, it was originally using a CID and that was a propos=
ed
replacement from Hans.

regards,
Nicolas

