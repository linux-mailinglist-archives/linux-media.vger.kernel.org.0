Return-Path: <linux-media+bounces-16777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB0095EF3C
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 12:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E02AE1C21C04
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 10:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5764514F10E;
	Mon, 26 Aug 2024 10:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="chMtjZL6"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896B4152160
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724669933; cv=none; b=MeJ3sfT9he5nk6JkU7slIp8QDD+dZBSddem7lU1Cln9AACG+E2FEujhxHxKyiiyHoqxfUPa2sVndeTTZTxWmrE2PI/7gCyHNqPnCfTTpsSmKosgT8Vb6jB/EsKicloBkmCdL6FiLSeaMWkyfVHUShfWOYbDBDe6ZQYuQA6ov5ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724669933; c=relaxed/simple;
	bh=c6SqeUiqOnv3ZhX9ztPolYCdFLhdyIMj6VIF7xDnzRE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=OdjFaegr7u9WfNvt0Wxyh/d6307PlwS2tHbuDH2C5gOhiayARhVi/26F3vzcb3c2eCVHFl5bPgi8r/YVmFEhmsbh/VOuo1G1zFpPed7kwpnyDUCtJjHi7nwFOe0uPDKAiFZ6baS7ONOIy4Rkapx4DbKRQ+U3jFxaKxi5zlOsbwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=chMtjZL6; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240826105843epoutp048c8d28ca1462448e4128f585f034fc99~vQihg7j0S0071600716epoutp04d
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 10:58:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240826105843epoutp048c8d28ca1462448e4128f585f034fc99~vQihg7j0S0071600716epoutp04d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724669923;
	bh=c6SqeUiqOnv3ZhX9ztPolYCdFLhdyIMj6VIF7xDnzRE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=chMtjZL6+a/ivctxZRkUq4042mDSTG/t06Eu8CzvGVrVtM14jrtYRsrLcUVOqrGTF
	 2TDHdRnAHTYNczkM8nX3bBEjQAhBZox34vybtTWp3PcGHYpu7ts7ubODcIroFZTPUL
	 YYDDOHDA+ELJmLHBjFDhLGgSSHCxEUE6pGW05guI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20240826105842epcas5p1ff15332249695555ca0e535f0f2aa5c5~vQigLuW_k0512605126epcas5p1D;
	Mon, 26 Aug 2024 10:58:42 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WsnjD0lKXz4x9Pt; Mon, 26 Aug
	2024 10:58:40 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	FD.5D.19863.FDF5CC66; Mon, 26 Aug 2024 19:58:39 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20240826090912epcas5p1101667af78ff996f11ac88abafb009f8~vPC56ya7k2792427924epcas5p1p;
	Mon, 26 Aug 2024 09:09:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240826090912epsmtrp1d45f2ef5d9f5e514d3c00cd40dd71a5e~vPC550YAS1657116571epsmtrp1k;
	Mon, 26 Aug 2024 09:09:12 +0000 (GMT)
X-AuditID: b6c32a50-c73ff70000004d97-7f-66cc5fdfb4ff
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	5B.24.08964.8364CC66; Mon, 26 Aug 2024 18:09:12 +0900 (KST)
Received: from FDSFTE308 (unknown [107.122.81.79]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240826090909epsmtip22b423bfe569ea458ca1f1062b1e5915b~vPC3XO3961523215232epsmtip2A;
	Mon, 26 Aug 2024 09:09:09 +0000 (GMT)
From: "Aakarsh Jain" <aakarsh.jain@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Cc: <m.szyprowski@samsung.com>, <andrzej.hajda@intel.com>,
	<mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
	<gost.dev@samsung.com>, <aswani.reddy@samsung.com>,
	<pankaj.dubey@samsung.com>
In-Reply-To: <8c7127c5-e8f8-4ba2-b39a-0c9ada871977@linaro.org>
Subject: RE: [PATCH v4] dt-bindings: media: s5p-mfc: Remove s5p-mfc.txt
 binding
Date: Mon, 26 Aug 2024 14:39:08 +0530
Message-ID: <0cca01daf797$9e636f50$db2a4df0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQE0FXDwiVRvvrO6AZU3uaZQQZSEWALLDn/8AsWn1bSzWn1F4A==
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKJsWRmVeSWpSXmKPExsWy7bCmhu79+DNpBn1fbSzuL/7MYnFo81Z2
	i5sHdjJZXJx5l8Wi78VDZou9r4Fimx5fY7W4vGsOm0XPhq2sFjPO72OyWHvkLrvFsk1/mCwW
	bf3C7sDrsXjPSyaPTas62TzuXNvD5rF5Sb1H35ZVjB6fN8l5nPr6mT2APSrbJiM1MSW1SCE1
	Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoWiWFssScUqBQQGJxsZK+
	nU1RfmlJqkJGfnGJrVJqQUpOgUmBXnFibnFpXrpeXmqJlaGBgZEpUGFCdkbfr6OsBV08FTu+
	7mNpYHzG1cXIySEhYCJx68YJ1i5GLg4hgT2MEtdO3maCcD4xSlw8NYEdpEpI4BujxP0tOjAd
	U/ceg+rYyyhxprMBynnOKNHQcJIZpIpNQF/i/qkesISIwHJGiTWXLzKDOMwCvUwSb7cfYgKp
	4hSwk7hz6gtYh7BAoMT8FzfB9rEIqEo8u32bFcTmFbCUuH5nKzuELShxcuYTFhCbWUBbYtnC
	18wQNylI/Hy6DKxeRMBJYt35NWwQNeISR3/2gC2WELjAIfH833dWiAYXiTUfdkI1C0u8Or6F
	HcKWknjZ3wZlJ0s8XvQSqiZHYv2eKSwQtr3EgStzgGwOoAWaEut36UOEZSWmnlrHBLGXT6L3
	9xMmiDivxI55MLaaxJw7P6BOkJE4vHop4wRGpVlIXpuF5LVZSF6YhbBtASPLKkap1ILi3PTU
	ZNMCQ9281HJ4nCfn525iBKdnrYAdjKs3/NU7xMjEwXiIUYKDWUmEV+7yyTQh3pTEyqrUovz4
	otKc1OJDjKbAAJ/ILCWanA/MEHkl8YYmlgYmZmZmJpbGZoZK4ryvW+emCAmkJ5akZqemFqQW
	wfQxcXBKNTA5My/+U+py676k2vUlJxke7tviXfXdcf6tU2eFnas8c867tz37+OJoXbVwSlLa
	pwlq6jlLjP75/he1njDz+ZmVW07wJJ8y/jz9VMLKoumSLqHngz0PB9lyb+h48iZ5mv+vf6f7
	P67ffewW71qjl4Xhv3te3bcyz/gYPGmnIIPQiydMZ/qvz+XolTSpl/dO387fbHFqSdv31RfK
	pefu7PCsy753zims2X6u85kji+e5bhU955V0yPlab1P7vsvtC/g4PWvidAM8tkyxfND7Mfz9
	y0KeW8t7Zb7krFaK4ytc4r2r+dbPw/v/TCr7sNbr1DPf4iShfPXA1J5L6VsTmmrP1577uMr/
	RYpJqvL0Pa9XK7EUZyQaajEXFScCAOc7PJhYBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsWy7bCSvK6F25k0g/WvJCzuL/7MYnFo81Z2
	i5sHdjJZXJx5l8Wi78VDZou9r4Fimx5fY7W4vGsOm0XPhq2sFjPO72OyWHvkLrvFsk1/mCwW
	bf3C7sDrsXjPSyaPTas62TzuXNvD5rF5Sb1H35ZVjB6fN8l5nPr6mT2APYrLJiU1J7MstUjf
	LoErY8HO+UwFb7gqvixYy9rAOJOzi5GTQ0LARGLq3mOsXYxcHEICuxkl9vyYywSRkJH433aM
	HcIWllj57zk7RNFTRolHkxrAitgE9CXun+oB6xYRWMkocaHtJJjDLDCVSeJn+w5miJaDjBJX
	9j0Em8UpYCdx59QXZhBbWMBf4ufNflYQm0VAVeLZ7dtgNq+ApcT1O1vZIWxBiZMzn7CA2MwC
	2hJPbz6Fs5ctfM0McZ+CxM+ny8B6RQScJNadX8MGUSMucfRnD/MERuFZSEbNQjJqFpJRs5C0
	LGBkWcUomVpQnJueW2xYYJiXWq5XnJhbXJqXrpecn7uJERyjWpo7GLev+qB3iJGJg/EQowQH
	s5IIr9zlk2lCvCmJlVWpRfnxRaU5qcWHGKU5WJTEecVf9KYICaQnlqRmp6YWpBbBZJk4OKUa
	mA78uffqdp9Ia+iGC7szHMw26DPmsb9qOXP/7NOiD/wnjHIOz/216U3m7Mkbd29mPRx/0C6J
	a7vit/iHs0tZ98RMv528O8lt0s5TUwuN6y7wmAefehQobRFxcv+jlTYXmJMeX+kxvlTQ/PON
	66eL5243XA+uutkjeNv7kt6s7jVGL1fpn9g3ba/Ujxqh9W2qDw4d+p9b8cflmuJRruk5lta8
	Byxvll/PqN33YUvjV3HeNp++z5xHXvZsz9Oc5rtS/opayROLdeG5UXkm1be2Jb1aJW5wqabc
	yD7HWbdalM3xxbo6Xe7thtyH13S0NL0415lx9ZqVQ5WmfGWl4v3PWwzvPfi+OkkxyalM4ej5
	oh9KLMUZiYZazEXFiQCjuGMSQAMAAA==
X-CMS-MailID: 20240826090912epcas5p1101667af78ff996f11ac88abafb009f8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240808135645epcas5p37c6bf0c6ad8efbe43e8451874900c111
References: <CGME20240808135645epcas5p37c6bf0c6ad8efbe43e8451874900c111@epcas5p3.samsung.com>
	<20240808134432.50073-1-aakarsh.jain@samsung.com>
	<8c7127c5-e8f8-4ba2-b39a-0c9ada871977@linaro.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: 08 August 2024 20:52
> To: Aakarsh Jain <aakarsh.jain=40samsung.com>; linux-arm-
> kernel=40lists.infradead.org; linux-media=40vger.kernel.org; linux-
> kernel=40vger.kernel.org
> Cc: m.szyprowski=40samsung.com; andrzej.hajda=40intel.com;
> mchehab=40kernel.org; hverkuil-cisco=40xs4all.nl;
> krzysztof.kozlowski+dt=40linaro.org; linux-samsung-soc=40vger.kernel.org;
> gost.dev=40samsung.com; aswani.reddy=40samsung.com;
> pankaj.dubey=40samsung.com
> Subject: Re: =5BPATCH v4=5D dt-bindings: media: s5p-mfc: Remove s5p-mfc.t=
xt
> binding
>=20
Hi Krzysztof,
> On 08/08/2024 15:44, Aakarsh Jain wrote:
> > s5p-mfc bindings to json-schema is already merged with this commit
> > 538af6e5856b (=22dt-bindings: media: s5p-mfc:
> > convert bindings to json-schema=22). Remove s5p-mfc.txt file.
> >
> > Fixes: 538af6e5856b (=22dt-bindings: media: s5p-mfc: convert bindings t=
o
> > json-schema=22)
> > Signed-off-by: Aakarsh Jain <aakarsh.jain=40samsung.com>
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
>=20
Thanks for your review.
I don=E2=80=99t=20see=20this=20patch=20in=20linux-next.=20Please=20let=20me=
=20know=20if=20any=20other=20changes=20required.=0D=0AYou=20will=20pick=20u=
p=20this=20patch=20via=20your=20tree=20or=20this=20will=20go=20via=20Rob's=
=20or=20Media=20tree?=0D=0ABetter=20you=20only=20pick.=0D=0A=0D=0A>=20Best=
=20regards,=0D=0A>=20Krzysztof=0D=0A=0D=0A=0D=0A

