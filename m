Return-Path: <linux-media+bounces-15866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 618089499F2
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 23:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91E3E1C22157
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 21:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F00165F1F;
	Tue,  6 Aug 2024 21:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.dufresne@collabora.com header.b="kMK3/MuP"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364F86FC3;
	Tue,  6 Aug 2024 21:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979121; cv=pass; b=s+YXrpfVmiY8OzgFdJ7KH4ICiRJQlAnI/M6gXmYO4Xr64KJZxyZbvCNfr8D/2XstFuno8tiAh2MsCa2aHTS6PJgmJhfQlOD/gQRNbxz6KU/wInqkmOM4jpan3vLoiNDOACVvxM1/LXuPb6pWRE4E/+793oUXVyAK2X5sc9yD9ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979121; c=relaxed/simple;
	bh=1utvhZHP0c6T8Ir5t589WiTudCfRoOIw0DiDKTzIf38=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SsU4lvulrtIHhAywxnoHvVPLb/AnC+qv3/0fNWMs/u6lT/NTwoj7Z2yrcQ1m8mN4h8XdySdX4Z+W8bg0wYPEHk3LqnJPzo5/r712d1jxycW6Niej3BG73pwgYLdpU5777IszoSbUp9DsgPS/wuPQDB8r91SaoGgAs/ulibpcLdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.dufresne@collabora.com header.b=kMK3/MuP; arc=pass smtp.client-ip=136.143.188.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: dmitry.osipenko@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1722979084; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kJU6zPIfWUudt7/XRn7/TOg0fe55t5arfi7vARhhCP6MF7RvWzD84vIuKeFmkA4eAYNit+LKpF5uxMWaJWlWpakk4so/16te7AXgQtvctebweUfTIlNTUOcpYDiF5VuEQQ9nzwTtt6zeeNcSk3j6DGsUKoYqb3spEVlpVesO3xI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722979084; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1utvhZHP0c6T8Ir5t589WiTudCfRoOIw0DiDKTzIf38=; 
	b=Vln/VZMrK75Lw8wGQ5yGeEQeZHvszyvBo7X9MMrDL8jwFcbPu7J011BtX6p3Dun79CqbpQ8hruVt5NL5Gk3SyvgrDbejSpAgMPWJiZMHK5mPXLuDJoBSxPcHwSOVplKb6jg3Zz+VjRiGC0OXJG3uYuxIJomdtO7Tcj2Y4yVcw6E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.dufresne@collabora.com;
	dmarc=pass header.from=<nicolas.dufresne@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722979084;
	s=zohomail; d=collabora.com; i=nicolas.dufresne@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=1utvhZHP0c6T8Ir5t589WiTudCfRoOIw0DiDKTzIf38=;
	b=kMK3/MuPZXiddxJtOppeyg/qVO1KC8I7lLYcf667P+mF/nJCBXAQnGFbYsENftWv
	Q2rfbB9P682e+5c2KG8Y+oDq8rdQmRnR7DfUuwUZG3gWtrhurdNuimzYoz5HqML9NhA
	neornCWQdp7AypaXPGfyLMjOJtxjIAsvnSOeZvSI=
Received: by mx.zohomail.com with SMTPS id 172297908214914.577164447111386;
	Tue, 6 Aug 2024 14:18:02 -0700 (PDT)
Message-ID: <3c388a51fef3d2c284fe7648ffd7215e097980a9.camel@collabora.com>
Subject: Re: [PATCH v4 0/4] Add Synopsys DesignWare HDMI RX Controller
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Tim Surber <me@timsurber.de>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Shreeya Patel
 <shreeya.patel@collabora.com>,  heiko@sntech.de, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org,  conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org,  p.zabel@pengutronix.de,
 jose.abreu@synopsys.com, nelson.costa@synopsys.com, 
 shawn.wen@rock-chips.com, hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Date: Tue, 06 Aug 2024 17:17:58 -0400
In-Reply-To: <06838f40-881c-4301-826b-e29a4277e663@timsurber.de>
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
	 <6f5c4ebb-84ab-4b65-9817-ac5f6158911f@timsurber.de>
	 <929d2f50-6b0e-4d1e-a6d3-482d615bd06a@collabora.com>
	 <06838f40-881c-4301-826b-e29a4277e663@timsurber.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

SGkgVGltLAoKTGUgbWFyZGkgMDYgYW/Du3QgMjAyNCDDoCAyMjozNyArMDIwMCwgVGltIFN1cmJl
ciBhIMOpY3JpdMKgOgo+ICMjI3NvdXJjZSBzZXQgdG8gNGs2MGZwcyMjIyMKPiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPiB2NGwyLWN0bCAtLXZlcmJvc2UgLWQgL2Rldi92aWRlbzEgCj4g
LS1zZXQtZm10LXZpZGVvPXdpZHRoPTM4NDAsaGVpZ2h0PTIxNjAscGl4ZWxmb3JtYXQ9J05WMTIn
IAo+IC0tc3RyZWFtLW1tYXA9NCAtLXN0cmVhbS1za2lwPTMgLS1zdHJlYW0tY291bnQ9MTAwIC0t
c3RyZWFtLXBvbGwKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBWSURJT0NfUVVFUllD
QVA6IG9rCj4gVklESU9DX0dfRk1UOiBvawo+IFZJRElPQ19TX0ZNVDogb2sKPiBGb3JtYXQgVmlk
ZW8gQ2FwdHVyZSBNdWx0aXBsYW5hcjoKPiDCoMKgwqDCoCBXaWR0aC9IZWlnaHTCoMKgwqDCoMKg
IDogMzg0MC8yMTYwCj4gwqDCoMKgwqAgUGl4ZWwgRm9ybWF0wqDCoMKgwqDCoCA6ICdOVjEyJyAo
WS9VViA0OjI6MCkKPiDCoMKgwqDCoCBGaWVsZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6IE5v
bmUKPiDCoMKgwqDCoCBOdW1iZXIgb2YgcGxhbmVzwqAgOiAxCj4gwqDCoMKgwqAgRmxhZ3PCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgOgo+IMKgwqDCoMKgIENvbG9yc3BhY2XCoMKgwqDCoMKgwqDC
oCA6IHNSR0IKPiDCoMKgwqDCoCBUcmFuc2ZlciBGdW5jdGlvbiA6IERlZmF1bHQKPiDCoMKgwqDC
oCBZQ2JDci9IU1YgRW5jb2Rpbmc6IERlZmF1bHQKPiDCoMKgwqDCoCBRdWFudGl6YXRpb27CoMKg
wqDCoMKgIDogRGVmYXVsdAo+IMKgwqDCoMKgIFBsYW5lIDDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6
Cj4gwqDCoMKgwqDCoMKgwqAgQnl0ZXMgcGVyIExpbmUgOiAzODQwCj4gwqDCoMKgwqDCoMKgwqAg
U2l6ZSBJbWFnZcKgwqDCoMKgIDogODI5NDQwMAoKWW91IGhhdmUgaGlnaGxpZ2h0ZWQgYSBidWcg
aGVyZS4gTlYxMiBoYXMgMiBwbGFuZXMsIGJ1dCB0aGUgc2l6ZSBpbWFnZSBvbmx5CmFsbG93IGZv
ciB0aGUgbHVtYSB0byBiZSBzdG9yZWQuCgogICBTaXplIEltYWdlOiAzODQwICogMjE2MCAqIDMg
LyAyID0gMTI0NDE2MDAgYnl0ZXMuCgpMZXRzIGF0IGxlYXN0IGdldCB0aGF0IGZpeGVkLCBhbmQg
Y2hlY2sgYWdhaW4uCgpOaWNvbGFzCg==


