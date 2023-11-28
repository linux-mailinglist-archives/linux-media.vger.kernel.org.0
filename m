Return-Path: <linux-media+bounces-1307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEB47FCF4D
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 07:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFEC21C20CF8
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 06:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FB463DE;
	Wed, 29 Nov 2023 06:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="A5ZrghXp"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BCCD170B
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 22:40:45 -0800 (PST)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20231129064043epoutp0230933ff7ab086cb4e1ac29b1c1d5b28f~cBM5szwQ80465404654epoutp02z
	for <linux-media@vger.kernel.org>; Wed, 29 Nov 2023 06:40:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20231129064043epoutp0230933ff7ab086cb4e1ac29b1c1d5b28f~cBM5szwQ80465404654epoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1701240043;
	bh=QT80ABfKOaLje3F85OKrmKtMSJbzSbx1fuPt9p4WfE4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=A5ZrghXpyPvTQ6SVXuYynacjuH8+uDg3jxtrHzoWbhr9vrBvT6eiT6xkOCbliQyw2
	 U8UeT1X5Rd68lryd+hKFAgLefu8yLbS5RQlbxN1c5/f4M/UzNWjEA+NvhmcBtDGlXE
	 7uo+Xdct7IQfQHPCcmXiVYCHZJiWoaQ5KIZoAoPo=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20231129064043epcas5p28000276dad4ee238a8f98aef82e1cb58~cBM5Rq5_-3188331883epcas5p2f;
	Wed, 29 Nov 2023 06:40:43 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.177]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Sg8pd4xJDz4x9Pt; Wed, 29 Nov
	2023 06:40:41 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	59.D0.10009.9ECD6656; Wed, 29 Nov 2023 15:40:41 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20231128103157epcas5p46a8113988067721e720ecdf955b21d50~bwtf9ZPIP1279812798epcas5p4u;
	Tue, 28 Nov 2023 10:31:57 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231128103157epsmtrp26fb71d9d8e134b06e5c1abc6c2dece99~bwtf8Q_Jf2706527065epsmtrp2C;
	Tue, 28 Nov 2023 10:31:57 +0000 (GMT)
X-AuditID: b6c32a4a-ff1ff70000002719-88-6566dce90e69
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F1.59.08755.C91C5656; Tue, 28 Nov 2023 19:31:56 +0900 (KST)
Received: from FDSFTE308 (unknown [107.122.81.79]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20231128103153epsmtip29adf4fc5cef15cfe1d4d50ff05a7e44a~bwtcrmXJ01570715707epsmtip2O;
	Tue, 28 Nov 2023 10:31:53 +0000 (GMT)
From: "Aakarsh Jain" <aakarsh.jain@samsung.com>
To: "'Hans Verkuil'" <hverkuil-cisco@xs4all.nl>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Cc: <m.szyprowski@samsung.com>, <andrzej.hajda@intel.com>,
	<mchehab@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<dillon.minfei@gmail.com>, <david.plowman@raspberrypi.com>,
	<mark.rutland@arm.com>, <robh+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <andi@etezian.org>,
	<gost.dev@samsung.com>, <alim.akhtar@samsung.com>,
	<aswani.reddy@samsung.com>, <pankaj.dubey@samsung.com>,
	<ajaykumar.rs@samsung.com>, <linux-fsd@tesla.com>, "'Smitha T Murthy'"
	<smithatmurthy@gmail.com>
In-Reply-To: <2ecdfff5-501a-452f-af90-0806f463a51c@xs4all.nl>
Subject: RE: [Patch v4 09/11] media: s5p-mfc: Load firmware for each run in
 MFCv12.
Date: Tue, 28 Nov 2023 16:01:52 +0530
Message-ID: <0fe601da21e6$1cb6aee0$56240ca0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLm4twfZx4yvmLB3iF6RxvUJv+HzQGgpOOWAUC8sUkCb5CW0a5La1+A
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA02TezBcVxzHe+69+5BGe4PUqb5kQzvSwa5lHSlJQ2JuVESZTkeaGbbrFrV2
	d/buatLpTKShHYLQ0TYxSMQjop7rHdR6NY16RFKkhsp6VDETggqJie66tP77/B7f3znfc+bH
	xy1SeDb8KIWGViukcgF3F1Hb7vCO48zIZ7Tw1yI7pJ9vJdDDnFouyludxtBY3hKB2qpqeKik
	uRdDN27rOehqRy8H1bWOE+gPfQOG+q+MEij1bwOOdBODHGSY/Rjdv5XFRckVNRx0ue9nDJV2
	jPJQwVA/hgp16xi6XrPMQwnNHTwUfz6f8741VZJTAqih/EWcasgc5VF5TTMYpStO5FIjg01c
	qir/HJXQ+ZSgUquLAfX862wetaR7k+r6Z4kXuPtUtGckLQ2n1ba0QqYMj1JEeAk+CA71CXWT
	CEWOIg/kLrBVSGNoL8FR/0BH3yi50bfANlYq1xpTgVKGETgf8lQrtRraNlLJaLwEtCpcrnJV
	OTHSGEariHBS0JqDIqHQxc3YGBYdOTtVC1QFr5zRTw1gceCeRRIw40PSFS4UJBJJYBffgmwE
	sKPhJsYGiwB2Vnbz2GAFwNnkx9i25NLiJM4WmgHMzn+wJZkGcHiyhDB1cUlnONaVzDEVrMh6
	AHMNPZtynLxIwKxvXExsRnrBgcY8YGJL8iO4fn8FNzFB2sNncelcE5uTHnDjwiMOy3vgnSuT
	BDvnXViYO4ezV7KFa1OFmz1WpC9M3egFbI817FxL3rwqJBvNoOFuktEQ3xgchSnt0azWEs7e
	ruaxbAOXHjVzWZbBieszW/PlsLwpg2D5MNT/nkWYxuCkAyy/5cym34Dfd5VtWXwJpjyb3Hot
	c1ifs81vw6yRVQ7Lr8P2nwpAGhBk7nCWucNZ5g4Hmf+fdg0QxeBVWsXERNCMm8pFQX/x34/L
	lDE6sLkXB/zqgeHhglMbwPigDUA+LrAyd3osoy3Mw6Vnv6TVylC1Vk4zbcDN+NzpuM1emdK4
	WApNqMjVQ+gqkUhcPcQSkcDafC4hO9yCjJBq6GiaVtHqbR3GN7OJw2LP7jGMRaWJu+FJ9/0d
	dht+g9cC9gX92DL1iQeWkGjjQ0B/yamhpyO2Nz7/9nQ90WJvd2hg7kSZR1jeRO1KUFzZ8XNr
	La8lwQr9h5UL673hJ737rQefuPvbiXYLeb3paTq532BYWnyQvc+0+OWEOgfw1mWs9CbOfR7p
	TecvdzgEhrgGmBsuXgiOZQ7PV2vHmlvbzvTVzIas5iacCHkyfkT86b6h38SWd1Splf3i8taM
	ihZvHRg+X/Ug4PifRYL+RXLvvf0Zx9xB0cHuXyRe48xffd9pNT3zvqVE3lfDd6lg8em6UOqH
	0pLltBdzXhBb9oRdPfbe2JF4GS4xFKx4NrUECQgmUio6gKsZ6b8ZCgXkoAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOIsWRmVeSWpSXmKPExsWy7bCSvO6cg6mpBvM+WFsceH+QxeLBvG1s
	Fot/PGeyuL/4M4vFoc1b2S3W7D3HZLH8+AFWi/lHzrFabD/4iMXi5oGdTBYXZ95lseh78ZDZ
	YtPja6wWD1+FW1zeNYfNomfDVlaLGef3MVmsPXKX3WLp9YtMFss2/WGyWLT1C7tF694j7BYt
	jUtYHcQ91sxbw+hxfcknZo+ds+6yeyze85LJY9OqTjaPO9f2sHlsXlLv0Xr0F4tH35ZVjB7/
	muaye3zeJOdx6utn9gCeKC6blNSczLLUIn27BK6M/u9PGQuui1ZsaTvO1MDYItTFyMkhIWAi
	0f/pCXMXIxeHkMBuRolbxw8xQiRkJP63HWOHsIUlVv57zg5R9JRR4tHX12BFbAL6EvdP9bCC
	JEQE9jBKHN29BqyKWWAui8S/I7NZIFo+A81tecIK0sIpYCtxdfdisHZhgWCJxbv3MIPYLAKq
	Er8bJrKB2LwClhL/m9+xQtiCEidnPmEBsZkFtCWe3nwKZy9b+JoZ4j4FiZ9Pl4HViwi4SfT9
	P8cIUSMucfRnD/MERuFZSEbNQjJqFpJRs5C0LGBkWcUomVpQnJueW2xYYJiXWq5XnJhbXJqX
	rpecn7uJEZw2tDR3MG5f9UHvECMTB+MhRgkOZiURXr2PyalCvCmJlVWpRfnxRaU5qcWHGKU5
	WJTEecVf9KYICaQnlqRmp6YWpBbBZJk4OKUamBzVuM78miCgytrS4v239Z18eozsnW0vzqZa
	W3+xYjI2cPzR/eFo9ulJntNF7MounRa+eoljiz6zToheuQBbXWb3LukdXlwb+ewYC/b+6fC9
	+2mzuWtdW3WV8LLrD+ceeWHwctJkgx387RYausblBsrvZbjk8oKWiJ4VV/W0/St9e92305zC
	4e3KP4pepoW12/0VzQmay3rMfl/502q+ZUWvVZbU1QQ23F8vbpt7N2Peir9OOd8yQhfGvFxW
	uT+ldXHssp+v8hsmH/zL97a78Mfpt++0tZn+zxdXcdRZeKl15/l7b5qb5F3P7fPfnJYXLxN4
	85FO3bQz7c9eJhXGX5791y/uwbHwFgvWfTcXKLEUZyQaajEXFScCAO8jLtyKAwAA
X-CMS-MailID: 20231128103157epcas5p46a8113988067721e720ecdf955b21d50
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231025102300epcas5p2c266a078b70614dc948b0e47cd5cf788
References: <20231025102216.50480-1-aakarsh.jain@samsung.com>
	<CGME20231025102300epcas5p2c266a078b70614dc948b0e47cd5cf788@epcas5p2.samsung.com>
	<20231025102216.50480-10-aakarsh.jain@samsung.com>
	<2ecdfff5-501a-452f-af90-0806f463a51c@xs4all.nl>

Hi Hans,

> -----Original Message-----
> From: Hans Verkuil <hverkuil-cisco=40xs4all.nl>
> Sent: 22 November 2023 21:14
> To: Aakarsh Jain <aakarsh.jain=40samsung.com>; linux-arm-
> kernel=40lists.infradead.org; linux-media=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; devicetree=40vger.kernel.org
> Cc: m.szyprowski=40samsung.com; andrzej.hajda=40intel.com;
> mchehab=40kernel.org; krzysztof.kozlowski+dt=40linaro.org;
> dillon.minfei=40gmail.com; david.plowman=40raspberrypi.com;
> mark.rutland=40arm.com; robh+dt=40kernel.org; conor+dt=40kernel.org; linu=
x-
> samsung-soc=40vger.kernel.org; andi=40etezian.org; gost.dev=40samsung.com=
;
> alim.akhtar=40samsung.com; aswani.reddy=40samsung.com;
> pankaj.dubey=40samsung.com; ajaykumar.rs=40samsung.com; linux-
> fsd=40tesla.com; Smitha T Murthy <smithatmurthy=40gmail.com>
> Subject: Re: =5BPatch v4 09/11=5D media: s5p-mfc: Load firmware for each =
run in
> MFCv12.
>=20
> On 25/10/2023 12:22, Aakarsh Jain wrote:
> > In MFCv12, some section of firmware gets updated at each MFC run.
> > Hence we need to reload original firmware for each run at the start.
>=20
> Huh? This is very weird. This definitely deserves a comment in the actual
> code rather than just the commit log.
>=20
> Do you know what is going on? What part is updated? Are you sure it isn't=
 a
> driver bug somehow?
>=20
> Regards,
>=20
> 	Hans
>=20
During SYS_INIT command sent to MFC sequentially, firmware is not able to i=
nitialize the hardware due to incorrect firmware transfer and in current sc=
enario the firmware is not loaded again in the Reserved memory area.
In this case RET_SYS_INIT response from hardware is failing. So we need to =
load firmware every time we open the device node.
I will add comment in the code why this change is needed.

Thanks for the review.
> >
> > Cc: linux-fsd=40tesla.com
> > Signed-off-by: Smitha T Murthy <smithatmurthy=40gmail.com>
> > Signed-off-by: Aakarsh Jain <aakarsh.jain=40samsung.com>
> > ---
> >  drivers/media/platform/samsung/s5p-mfc/s5p_mfc_ctrl.c =7C 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_ctrl.c
> > b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_ctrl.c
> > index b49159142c53..057088b9d327 100644
> > --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_ctrl.c
> > +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_ctrl.c
> > =40=40 -51,8 +51,9 =40=40 int s5p_mfc_load_firmware(struct s5p_mfc_dev
> *dev)
> >  	 * into kernel. */
> >  	mfc_debug_enter();
> >
> > -	if (dev->fw_get_done)
> > -		return 0;
> > +	if (=21IS_MFCV12(dev))
> > +		if (dev->fw_get_done)
> > +			return 0;
> >
> >  	for (i =3D MFC_FW_MAX_VERSIONS - 1; i >=3D 0; i--) =7B
> >  		if (=21dev->variant->fw_name=5Bi=5D)



