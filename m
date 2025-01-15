Return-Path: <linux-media+bounces-24813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EA7A12BFF
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 20:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD0CD16303D
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 19:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA901D6DB9;
	Wed, 15 Jan 2025 19:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PLSIDgef"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EF8191F75
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 19:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736970681; cv=none; b=VkkFvjPke2BmKnLbwSby6VnVLEU+1agM94pRHJSwkVEEx4qHkRnV1D942fr1BZ55HWVzArhRKoEEvt3DlodaUsSTfmop3lQ3xEKHhVP51S/a0C3aXfuswqnZ0cOYNXrYisvouBIKjHUdqVKic/qkfs5mb1JEnAWZVUhNOnrrKjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736970681; c=relaxed/simple;
	bh=eApaEBs2l62buMdnrk/5QAHQKp7CzPNrtDWea9f/TvY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CeX2xnAC8nwEh+b6Nkm324JjkEegFZH/gmEkq28OlBf1BqeUEEw+Eajf0uwQ6ASS7AS4J9h8MJJGRKc3evAt9OQ73nxt5qduYrD2V2g3Qsu0EddiFkHI884EJhs1kEFHwnJZtF2hUWeOXiAuU2tczQ1W9P4r4Eya6taNwvxNVbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PLSIDgef; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736970677;
	bh=eApaEBs2l62buMdnrk/5QAHQKp7CzPNrtDWea9f/TvY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=PLSIDgefKouOijFL22hFtZOiFFEmJ3IVpsmdlrjrsGOkQ20p7womdbr+pokK9oNSB
	 dwbShcCxJW0b4Dlbsz1GD4m8dDZezE2G78xCf1w6pOKpbaH1D57fhZEosRpfa7x9y5
	 UrD7GdFUR6PuyZ1EMinLkM9cu6FliyDC5syYKqo7RhWqEB0l3ix9ou4xlCqSVcsDDq
	 eNxyBXbLW3Qp6QR/2d2HP3ep3AF2l+jmGkiDxt8FN4DscGnGzTiewn4/QOgMylzMlC
	 7axxu1wXb1B/ZyctYhtNEnkTyKeHr0hwKp1j03kvsl6EmGNkwC7fThKWBGMbgDVER/
	 l3cYogTTfXT+A==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A100217E0EAB;
	Wed, 15 Jan 2025 20:51:15 +0100 (CET)
Message-ID: <a6e7a9a0426df1902965262328d1da8e9339b952.camel@collabora.com>
Subject: Re: Hantro H1 Encoding Upstreaming
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Daniel Almeida <dwlsalmeida@gmail.com>, Adam Ford <aford173@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, andrzejtp2010@gmail.com, Frank Li
 <frank.li@nxp.com>, ming.qian@oss.nxp.com,  linux-media
 <linux-media@vger.kernel.org>, linux-imx@nxmp.com, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Gustavo Padovan <gus@collabora.com>
Date: Wed, 15 Jan 2025 14:51:14 -0500
In-Reply-To: <Z4fOScVgLqYEU4Hw@collins>
References: 
	<CAOMZO5D0QvYvr940giHPGwLpunQOpku7e5K_5hHyYYCwZQry2g@mail.gmail.com>
	 <CAOMZO5BJt6qzETzMeO47N5Gu8136tppuXKnqv4ypk6HyLR99vA@mail.gmail.com>
	 <F5E2D925-668C-4D4D-87C9-8F22126443FD@gmail.com>
	 <CAHCN7x+hUJoKRO8U8dgafFip31AKJRqfQw1kOw7YhvZ6xXqNnA@mail.gmail.com>
	 <A3476357-8D8D-4B82-8CAB-58370BECF575@gmail.com>
	 <a393b3324c60c2c13994d34ca90faf4eb604ae43.camel@collabora.com>
	 <Z4fOScVgLqYEU4Hw@collins>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le mercredi 15 janvier 2025 à 16:03 +0100, Paul Kocialkowski a écrit :
> We could have some common per-codec bitstream generation v4l2 code with either
> a cpu buffer access backend or a driver-specific implementation for writing the
> bits. I already have a base for this in my cedrus h264 encoder work:
> https://github.com/bootlin/linux/blob/cedrus/h264-encoding/drivers/staging/media/sunxi/cedrus/cedrus_enc_h264.c#L722

There is a lot of code in there that you can throw directly into v4l2-h264, this
is exactly what that library is meant for. It had never meant to be limited to
generating intermediate reference lists for decoders, or to be decoder specific.
Note that golomb coding can further be generalized.

I do agree at least for now that letting the driver write headers have more
advantages. It allows notably to turn off the knobs that would not otherwise be
supported. The modification would of course be reference at s_ctrl time,
assuming you reuse existing sps/pps and other similar compound controls. As we
didn't have encoder in mind when we created these compound controls, its
possible that we'll have to add an extended one to fill the gaps, which has
always been the plan.

Nicolas

