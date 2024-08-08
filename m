Return-Path: <linux-media+bounces-15984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAD794BABE
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 12:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 743FAB217AD
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 10:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDA018A6B3;
	Thu,  8 Aug 2024 10:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TnbCJxX4"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E36189BBE
	for <linux-media@vger.kernel.org>; Thu,  8 Aug 2024 10:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723112414; cv=none; b=lBcCzi7arraDduR+PL18yxUkloyPX/996Q8HxSzR7FNZhQS8IJw5abUK9zRWQr98L1U4DkFR7OWKNPYN4OGL6IRG7lKEj6Bu+5/aKdsbuw1f1Pu8qzKHPvqAyvbhM80zeC7xaywIXw/cXIKhWCa41241BLojTpRZjVsX4Y3yNUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723112414; c=relaxed/simple;
	bh=UhxD8im38+S9o2RE5MKHC1dJ4++2PGyTJMvp2PywTHg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=PFkF/ZtSvyUS4Ux0eMploh66F+PLCtkXqafAAK8JIzYLRFap0cWCCW/SXGb9ELGvI5V/gdp5JDVu0FeCj5AoC52QclkDIJEt39IbvEo0j3lYthPPMLvZCPRWNoIoDChyEr4I4LcOz5VkCmP+lnC2Q8vYgoqzX9m/HwETPws30N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TnbCJxX4; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240808102008epoutp028d1d957403d235aa374f80abdcb1202f~puZspASGO3131931319epoutp02y
	for <linux-media@vger.kernel.org>; Thu,  8 Aug 2024 10:20:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240808102008epoutp028d1d957403d235aa374f80abdcb1202f~puZspASGO3131931319epoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1723112408;
	bh=vSskDQ4p+O3Xzvm1qBN34l6sdSHV2WZ5K4DNo5E16Qs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=TnbCJxX4QxqQHlOZpsTQedkhdYibIifpbhK9qAdT7gOVdgi2u59xCQvqB9uFYtcty
	 gm9s6dBjNlF3y8aUy3uTF0sbCbzg6focFMtDzImaIDlwYTEi97heZn07Ly2q6C/U/L
	 ULJG1SWtJC2LTXj9zd3v6dkI+MzigQq+dy0NKO90=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20240808102008epcas5p3e49ca958ff362cd11c2ca01fd4261fa6~puZsMziXj1041910419epcas5p3d;
	Thu,  8 Aug 2024 10:20:08 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Wfjj21jm5z4x9Q2; Thu,  8 Aug
	2024 10:20:06 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	9E.D6.09640.6DB94B66; Thu,  8 Aug 2024 19:20:06 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20240808101124epcas5p3844c94d3106e6082bf7a91d3e37aef1f~puSEwsnmc0889308893epcas5p3V;
	Thu,  8 Aug 2024 10:11:24 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240808101124epsmtrp235da5eca8919dc9ef625a0fe276a3e56~puSEvyaxh1894718947epsmtrp2I;
	Thu,  8 Aug 2024 10:11:24 +0000 (GMT)
X-AuditID: b6c32a49-aabb8700000025a8-9b-66b49bd60620
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	EC.AD.08456.CC994B66; Thu,  8 Aug 2024 19:11:24 +0900 (KST)
Received: from FDSFTE308 (unknown [107.122.81.79]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240808101122epsmtip21b71e60b704d0fb651bc30a58e0767fc~puSCuDPC_2278622786epsmtip2Q;
	Thu,  8 Aug 2024 10:11:22 +0000 (GMT)
From: "Aakarsh Jain" <aakarsh.jain@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Cc: <m.szyprowski@samsung.com>, <hverkuil-cisco@xs4all.nl>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<gost.dev@samsung.com>, <aswani.reddy@samsung.com>,
	<pankaj.dubey@samsung.com>
In-Reply-To: <4230387d-0413-4da8-b55a-ac708af05e34@linaro.org>
Subject: RE: [PATCH V3] dt-bindings: media: s5p-mfc: Remove s5p-mfc.txt
 binding
Date: Thu, 8 Aug 2024 15:41:21 +0530
Message-ID: <04fb01dae97b$52f88980$f8e99c80$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQINSNkawEI3KcSuc3/gK7NSY7HThgItsEw+AxAn8TKxjnWJkA==
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCJsWRmVeSWpSXmKPExsWy7bCmlu612VvSDHY/Ybc4tHkru8WaveeY
	LOYfOcdqcfPATiaLizPvslj0vXjIbLH3NVB20+NrrBaXd81hs+jZsJXVYsb5fUwWa4/cZbdY
	tPULu0Xr3iPsDnwem1Z1snncubaHzWPzknqPvi2rGD0+b5LzOPX1M3sAW1S2TUZqYkpqkUJq
	XnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QtUoKZYk5pUChgMTiYiV9
	O5ui/NKSVIWM/OISW6XUgpScApMCveLE3OLSvHS9vNQSK0MDAyNToMKE7Iyf+y4zFnTxVFxe
	uZepgXE2VxcjJ4eEgInE+vkdjCC2kMBuRokNOxK7GLmA7E+MEgvX7mCGcL4xSjzdsJMdpuPN
	0kksEIm9jBIn7x5ig3CeM0r8uDAfbBabgL7E/VM9rCAJEYGjjBIPtjwEm8Us0Mkk8e3eZCaQ
	Kk4BO4kzvfPA5goLBEr8uz8JrJtFQEXiauNNVhCbV8BSonX2RChbUOLkzCcsIDazgLzE9rdz
	mCFuUpD4+XQZWI2IgJPE4jXnGCFqxCWO/uwBWywhcIFDYvqEVhaIBheJ9+saoR4Slnh1fAuU
	LSXx+d1eNgg7WeLxopdQC3Ik1u+ZAtVrL3HgyhwgmwNogabE+l36EGFZiamn1jFB7OWT6P39
	hAkiziuxYx6MrSYx584PVghbRuLw6qWMExiVZiF5bRaS12YheWEWwrYFjCyrGCVTC4pz01OL
	TQsM81LL4VGenJ+7iRGcnLU8dzDeffBB7xAjEwfjIUYJDmYlEd7m8E1pQrwpiZVVqUX58UWl
	OanFhxhNgeE9kVlKNDkfmB/ySuINTSwNTMzMzEwsjc0MlcR5X7fOTRESSE8sSc1OTS1ILYLp
	Y+LglGpgMvvT8X35sXvtuXd8jon9WnTwxNXK+e5Bf/y7185W+bvl84vXMuuUp0V8jqixD5D+
	8XXq9Fm+f+puxhe/1kve8Zl1Hcdvsbr6hX9Trvy+9nRP111xPa/D6VwMZR/PfD11QaP/tGMW
	9xyZqfw5hzpC/rHurHw9P0Ds0OGtrNJ/YgKO/n8mJ3qSW9/VrVXsc+Te7IMTZboi/t7RWFfd
	MOd9cLPeM7FElaNryj76rGBO6V2044xqYE87jweD9m1mG7GaTsWDd+Zl5TEs2+mqPTdj34R1
	QhxHGoo3fE0QZIy8oZofMn9J1PUtikv+TOo4mDHpQtiZG9yV5gYitXJ3CmQm6ln85r8ryCbM
	ZDxJ0KeeTYmlOCPRUIu5qDgRALk1ThZXBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsWy7bCSvO6ZmVvSDKbdl7M4tHkru8WaveeY
	LOYfOcdqcfPATiaLizPvslj0vXjIbLH3NVB20+NrrBaXd81hs+jZsJXVYsb5fUwWa4/cZbdY
	tPULu0Xr3iPsDnwem1Z1snncubaHzWPzknqPvi2rGD0+b5LzOPX1M3sAWxSXTUpqTmZZapG+
	XQJXxs99lxkLungqLq/cy9TAOJuri5GTQ0LAROLN0kksXYxcHEICuxklpu69ywaRkJH433aM
	HcIWllj57zmYLSTwlFFi4+RIEJtNQF/i/qkeVpBmEYGTjBL9Z1rAHGaBiUwSq7/MYIUYe5BR
	YnLjX7B2TgE7iTO988BsYQF/ifUXfzCB2CwCKhJXG2+ygti8ApYSrbMnQtmCEidnPmEBsZkF
	tCWe3nwKZctLbH87hxniPAWJn0+XgdWLCDhJLF5zjhGiRlzi6M8e5gmMwrOQjJqFZNQsJKNm
	IWlZwMiyilEytaA4Nz232LDAKC+1XK84Mbe4NC9dLzk/dxMjOEK1tHYw7ln1Qe8QIxMH4yFG
	CQ5mJRHe5vBNaUK8KYmVValF+fFFpTmpxYcYpTlYlMR5v73uTRESSE8sSc1OTS1ILYLJMnFw
	SjUwcRidPZgcsEPYzWeP4dov1me36hvKPpSp+ZRq6esb+srecea8Vbts+w2//96cflR46/eP
	8cYNB1iTN7yMyEnqnVuw/vKS5zNaH4XFqF/rfBp7csI0oc8RvrpnWatXFupyH1/Y83hGYJH1
	p3kycyeEFrx0z7e6ap/22Sco6uatWT9uOby//TzKKfPJ3lS2fxqfz61xajmf5jDZYvfDoEVn
	lt5OO7i3eXFJijJPrPHJCqZ//RESF9pPcmfEtVt9UdlWai9v9GLhzuOz3TJ31HU+3Ky9zSLi
	sP2KiTXPb32dqT/pboXRezOriLytO/ctEBRz7N7xgyU+o8x3weqshz7T7h078N+/UNHjpyzP
	lKCNUUosxRmJhlrMRcWJAB+g/Ik/AwAA
X-CMS-MailID: 20240808101124epcas5p3844c94d3106e6082bf7a91d3e37aef1f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240808083027epcas5p153e64139a5e71448b1ea3f04af1df2bd
References: <CGME20240808083027epcas5p153e64139a5e71448b1ea3f04af1df2bd@epcas5p1.samsung.com>
	<20240808081815.88711-1-aakarsh.jain@samsung.com>
	<4230387d-0413-4da8-b55a-ac708af05e34@linaro.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: 08 August 2024 15:27
> To: Aakarsh Jain <aakarsh.jain@samsung.com>; linux-arm-
> kernel@lists.infradead.org; linux-media@vger.kernel.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org
> Cc: m.szyprowski@samsung.com; hverkuil-cisco@xs4all.nl;
> robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> conor+dt@kernel.org; linux-samsung-soc@vger.kernel.org;
> gost.dev@samsung.com; aswani.reddy@samsung.com;
> pankaj.dubey@samsung.com
> Subject: Re: [PATCH V3] dt-bindings: media: s5p-mfc: Remove s5p-mfc.txt
> binding
> 
> On 08/08/2024 10:18, Aakarsh Jain wrote:
> > s5p-mfc bindings to json-schema is already merged with this commit
> > 538af6e5856b ("dt-bindings: media: s5p-mfc:
> > convert bindings to json-schema"). Remove s5p-mfc.txt file.
> >
> > Fixes: 538af6e5856b ("dt-bindings: media: s5p-mfc: convert bindings to
> > json-schema")
> > Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
> > changelog:
> > v1->v2
> > Add Fixes tag suggested by Krzysztof
> > v2->v3
> > Aligned Fixes tag in oneline and corrected commit message
> > Link:
> > https://patchwork.kernel.org/project/linux-media/patch/20240213045733.
> > 63876-1-aakarsh.jain@samsung.com/
> 
> Something got corrupted in your changelog.
> 
I just realized that it would go as part of commit message.
Do you want me to respin this patch or you will take care while applying?

Thanks
> 
> Best regards,
> Krzysztof



