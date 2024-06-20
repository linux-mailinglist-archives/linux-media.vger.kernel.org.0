Return-Path: <linux-media+bounces-13867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 617D5911251
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 21:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC3D91F22420
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 19:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1201B9AD5;
	Thu, 20 Jun 2024 19:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="L45gmfK2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24CF3A1CD
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 19:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718912385; cv=none; b=Yslfmrj6j2yl2hqfP2hWtL5/PtroenO0kBjp6ZmB+JDmWbYFjCoyGiAQ4Tn4D6zlHRjQ9PWY2ymHUGEhtlmqvMfEawttcjJTq/BZWwwibZ7fPoK2IBVkoYXjm45rzalUFutRC7sKvJ/cJR3PJUhevpS6vLw0iQU91PK4MJDbVoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718912385; c=relaxed/simple;
	bh=yCG4889P6sBEqQekLOYYbsBVgi2xazE4U587EpbpMiw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rYXJVuVH9Oxn5as3XRd/T5Dsu7BFgm3w1dFYakmG1uI7EDlfJ+v4AA6+3+sc+heRX0TMwjRSrj8wgiKpqEr2N/ek/35VY9Se29K7AJTz1990dqamQrfdbAYmxsPLUZtjCvdOYnl5EiMwphLA+BW925cX1GlxgyqKV0hTsJZwu9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=L45gmfK2; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3d2299e6650so623115b6e.2
        for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 12:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1718912383; x=1719517183; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uVPLtuShufVqL2WCjpTc8rDVep4hA7cgotqlwBxgDE8=;
        b=L45gmfK2e9vUbjopiho2Rr+/HMykcLPtQmhz0X6kPvce8kwZkh+stuo4flUnxJkPzR
         eC7QnJlpoJ5izVbksOQhJ+uiZJOBVwkgNl8DyPkmTCfq0KVwsn3szzmWXwoCYvOA320P
         W2EVDo2t1BaeD05+snY6ODs+L8pcpOvNQWR62/Dv9qZy9jORGrsylW9H2xO3k7xajwWo
         xBy8GhBsFj9KlxLtcRotfBaq8ndscoV7kJL3GdqjilNoMUEYivHa90SjbUxAQaUjlpbH
         QgkAqkerxFEUG1jSw6yw1mvWlvdI7kR2hINfGONaEMtaMYriSBPB1K3+Tun5KGEyS/EZ
         N63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718912383; x=1719517183;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uVPLtuShufVqL2WCjpTc8rDVep4hA7cgotqlwBxgDE8=;
        b=gx/8wRZAr9ADEfkGyhPgNgHPoU5o2OvwdleNz1CueuuiWxYBgyozr+LRa37dtabSwY
         2SdrXtGxoemkGZIGLcE0HBDlY+9B8bcMCpzi+Pfj4S4qqz/QpNXH9y3T2o8dYtdiK5es
         9/sshShHPMFNl03tomP+gfOOQQNM9qBausIowDAAjml2u47Ufmxh5IOxPbOnsKX48ei3
         ZEZaThiwgrQA0RO0S5gVU7jNC5T/l3d0VZ6UxCzpIZV0K0EkXu/+e0n/WVUsNLfRwtXT
         MbpziB5KHuUrHVTAuyp6NcoR/SkS/IrvVtlpF2MIVatgfqzc7caFiu+je4I+rX6qdxPA
         UKtw==
X-Forwarded-Encrypted: i=1; AJvYcCXOtWsfBhyswGoln58NwfP2I9F7lECRhr7ISaQJRgF6wZXidRVLwk7+PF6JaaZoYthoNqsPOWZUh5NhWIAx7gtUD48E024daabm2oY=
X-Gm-Message-State: AOJu0YzoEZuIGKc9n05/0ebII/1YayElX6e0xLLUX+nqry/bOoJpd88g
	nH9pvuZV09Y726oWFBOG9VM9HWM8IpWhsRhFca9xpF+ymOqdE/n13Cl5Dxv8KUc=
X-Google-Smtp-Source: AGHT+IEaK9J7/frv8gK0LaWNtaMRBnzNtHqmvVCsYQHf1z13p7M8pNmPXqLPyAWQ+uIHjvEuKMCEXg==
X-Received: by 2002:a05:6870:d60a:b0:258:38d5:6518 with SMTP id 586e51a60fabf-25c948e3e2amr6593718fac.4.1718912382995;
        Thu, 20 Jun 2024 12:39:42 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:6d4e::580])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bce933e28sm3775885a.120.2024.06.20.12.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 12:39:42 -0700 (PDT)
Message-ID: <0d5f4addd82729cdae08740c80b48f01ab9681c4.camel@ndufresne.ca>
Subject: Re: [PATCH 0/4] Support MediaTek MT8188 Media Data Path 3 (MDP3)
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, amergnat@baylibre.com, 
 moudy.ho@mediatek.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org,  p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com
Date: Thu, 20 Jun 2024 15:39:41 -0400
In-Reply-To: <d31f18cae640095ca0704185f8238184c13cf93b.camel@ndufresne.ca>
References: 
	<20240322092845.381313-1-angelogioacchino.delregno@collabora.com>
	 <4e1a8383-fdcb-45b9-b3d8-7019ed8c07bb@collabora.com>
	 <d31f18cae640095ca0704185f8238184c13cf93b.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 20 juin 2024 =C3=A0 15:37 -0400, Nicolas Dufresne a =C3=A9crit=C2=
=A0:
> Le mercredi 19 juin 2024 =C3=A0 11:23 +0200, AngeloGioacchino Del Regno a=
 =C3=A9crit=C2=A0:
> > Il 22/03/24 10:28, AngeloGioacchino Del Regno ha scritto:
> > > This series adds code to support for the MDP3 block found in the
> > > MediaTek MT8188 SoC, including the necessary bits for mtk-mutex
> > > and platform data for the MDP3 driver.
> > >=20
> > > This is mostly compatible with MT8195, with a few differences
> > > "here and there", with the former having less instances of some
> > > of the MDP3 IPs compared to the latter.
> > >=20
> >=20
> > Gentle ping for this series getting stale.
> >=20
> > The soc bindings and commits are already upstream (v6.10).
> >=20
> > The commits that would go through the media tree [3/4], [4/4] still app=
ly
> > cleanly as they are.
> >=20
> > Should I resend this, or ... ?
>=20
> If 1 and 2 is merged already, a rebase and resend makes a lot of sense.

Ignore this, I see Sebastian did it for you and sent a PR already.

Nicolas

>=20
> Nicolas
>=20
> >=20
> > Cheers,
> > Angelo
> >=20
> > >=20
> > > AngeloGioacchino Del Regno (4):
> > >    dt-bindings: soc: mediatek: Add support for MT8188 VPPSYS
> > >    soc: mediatek: mtk-mutex: Add support for MT8188 VPPSYS
> > >    dt-bindings: media: mediatek: mdp3: Add support for MT8188 RDMA
> > >    media: platform: mtk-mdp3: Add support for MT8188 MDP3 components
> > >=20
> > >   .../bindings/media/mediatek,mdp3-rdma.yaml    |   1 +
> > >   .../bindings/soc/mediatek/mediatek,mutex.yaml |   1 +
> > >   .../platform/mediatek/mdp3/mdp_cfg_data.c     | 280 +++++++++++++++=
+++
> > >   .../platform/mediatek/mdp3/mtk-img-ipi.h      |   1 +
> > >   .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     |   1 +
> > >   .../platform/mediatek/mdp3/mtk-mdp3-core.c    |   3 +
> > >   drivers/soc/mediatek/mtk-mutex.c              |  41 +++
> > >   7 files changed, 328 insertions(+)
> >=20
> >=20
>=20


