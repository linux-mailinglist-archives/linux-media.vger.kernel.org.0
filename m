Return-Path: <linux-media+bounces-41403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 685F1B3DC82
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 10:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99309189D16D
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 08:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F832FB609;
	Mon,  1 Sep 2025 08:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="cFJcDKoi"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020137.outbound.protection.outlook.com [52.101.156.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98B12F6196;
	Mon,  1 Sep 2025 08:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756715665; cv=fail; b=tujuhFDYWhepL+NBiK5Kw4xMzmyiwFniYJvtHam4dTtTVRaJ3z4y1vdqu11P6w9eSjfS45pcm7KCxLaBz86BTwkQhojNedHG/PIwdmBMJ2ZPXQPt0oACGAlMwWiUHWc7Gy6AJzeHKCniu1r1V+NvhMSJ4+gg5pqciduQ673QCV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756715665; c=relaxed/simple;
	bh=dulOxHe2w7ovzcq2S1WI+ZwDEC/Erw8B1GfLmzFPgpg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kkcxNEqvOZgQyFgSVNjqY/BPG21cUSAD7mcH9SKg0v8VCojtsm7Xx+ivD8NuqIac/RS8smHwOrdOXP198FjzZbgxE30jjPwe1LWWWprucE6ePuR3gdKxMzsIpBSPFuAA2U7U937324h8bhG1j//agY05Vbprjx9aPpOSE+w3vWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=cFJcDKoi; arc=fail smtp.client-ip=52.101.156.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksW4cDELhDIZz9kx+sKxozFQFOevdWxG4wTlbbgTdcqjptD2AcNeg2hDNhrRhD7fVZzfU5Gd+GHDkf00ELORp4pB1yHjVEsjJ4fei04EkvvG3/qK5kyCQ7icI2h5b79rTpoeLdL5m521XwQFEzsMANy/RyHfLo8wrdwL4jHC2sxGHxeyCDR19yodeknluF4fUsqScu9nhlp1iGNuxAelsW0ccs0SPHapGGw9Z74pA76ok2EAUnahR8p6LgAMCJnFeJmSoRXUKfE4JjbUZv0kdDSIYf6BHBaa+U/7CRuvQ80Y9n140P+2s9q8PiGYlRduwvYelM+LkkgncbX0F54OOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwFRtUnOhqywO3/vBknpXdK7B6+5D+8nwvGUAy7t2o0=;
 b=gd3M9LckwTvZ6xI/t3RneSL2tQfRVm/+4V77JOlKEBnaPqtMMGCfccd0gzxnE6DGtwSK92mBzjrCWG6df0O/b8gpgia3cQhDQ3pR88YJkh5Vj15wK6UVwVJs2UHPj+EiGdR2dshwMzcw6G9rqOoV7pcpw6Euhk/uHBrKN2drt2BX+ywkGwPss9STkXiXyM4hpSajarIeJAxRGtKhNPqkeH6otRcKJq0TotXr6A4lEiaeLX9DkJtYzJO4vGuupHPqVpxAS4NMZ2gSunWPNxr3hQwZlnKGuKhBiz0m+rYItwE/8JZQ/HJ/Ru67MjXjmr+l9fWsc49YGHFFxWBmbhRTZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwFRtUnOhqywO3/vBknpXdK7B6+5D+8nwvGUAy7t2o0=;
 b=cFJcDKoiYTUiAdDP5HydqpFYWra3o4bbGO8ErrrFrAoGVQcXzreL2Jo5kvQyPEq+kZt2U9PHBAliACit7REa3KnQEo7DKYbsbOgCMvTTzD/LWPpXKztE8mMlnaYii4SF1WDIDDYGEQ5B0CI80tuobLROUVqru4bG5IhtQU7LMAs=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE2P216MB3022.KORP216.PROD.OUTLOOK.COM (2603:1096:101:291::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14; Mon, 1 Sep 2025 08:34:18 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9094.015; Mon, 1 Sep 2025
 08:34:18 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>, Ming
 Qian <ming.qian@oss.nxp.com>
Subject: RE: [PATCH v3 5/9] media: chips-media: wave6: Add Wave6 core driver
Thread-Topic: [PATCH v3 5/9] media: chips-media: wave6: Add Wave6 core driver
Thread-Index: AQHcGMGLAlBi1HFXmEW+0N6L/krteLR5qaIAgARV7SA=
Date: Mon, 1 Sep 2025 08:34:17 +0000
Message-ID:
 <SL2P216MB1246E6FBFF73D2EDE1834F06FB07A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250829084649.359-1-nas.chung@chipsnmedia.com>
 <20250829084649.359-6-nas.chung@chipsnmedia.com>
 <19196605-50fb-440f-9666-7502de9ddfd5@kernel.org>
In-Reply-To: <19196605-50fb-440f-9666-7502de9ddfd5@kernel.org>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SE2P216MB3022:EE_
x-ms-office365-filtering-correlation-id: 5a14af23-14ec-4bb9-f51c-08dde9325751
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?fuFuVB8QdqmrDDpPxa0RQW1wB2YiftuIDrVAGpRd0uRmzpiAkHA6JpXcaIfu?=
 =?us-ascii?Q?1AedG6mB2N/pEaBztfzcNwBN0ZtWl2TPh4MpqCbwPjPjyErkRqLVE718nAFN?=
 =?us-ascii?Q?Y2nUS9Hog5lJqbXmaRjiIFbZFFItSxeagHL8X4ItMSmcVyT/IqEws1rbxkNp?=
 =?us-ascii?Q?thely8T2rOqomSbuH+zGk5ckifemqSPJ3DU6nSGl66QIlQEuqmLFRnpNT1II?=
 =?us-ascii?Q?9OoDPWW+PFQD64zx06UpwKjdGqXE7UtzrbxPLLSA7jh27N897abxIjRIpru5?=
 =?us-ascii?Q?YhmnDbmFtBJXC3+lbaHQHAwZMEQzj4BZASDtY8pLjakEfDUnfWRG5nNIGn1i?=
 =?us-ascii?Q?GH7BafEXy0YAjJe2lJ6zAfLy601MXNfE8aVOkiKZuNxDvKb2GW9lnFeHolZ6?=
 =?us-ascii?Q?jtMQ/rnICdLFBzgOoVCDA0nHIai9xvs25FALgzn1z6ZhASerR7KPV/VUAjLc?=
 =?us-ascii?Q?CHZtaq+gZfzSogYeqhdhqc2xed7JBji6Has7Z1VrzVU+i0p8WrVAhMwCdwrL?=
 =?us-ascii?Q?GD6lGjKfKl2eyMbsQBhglmwWc0c2R/34wQQuYkMWB5UnDYUX4+h/KKt9RodA?=
 =?us-ascii?Q?6gPFXY4mzpt9SW1UK1QIxtDamFdwBr73jbIhGeXOZpBoxkFYjHBy+/JzKtsR?=
 =?us-ascii?Q?tgarKIxv5UkrEbPs5dDbAt7kuooFBGmPZePFgeAD+NI569yst0DcBaaCZZBb?=
 =?us-ascii?Q?7DPd+BUQcIR/kxrhHIo66vCOBRdAFPPoxc4PKNQKzYB/XbDp1s5/9XLUtjtw?=
 =?us-ascii?Q?xyF5Zz8Gvof0INoceTjKxERWqvHPsEE2MCUPkjSBr9N6YO9euit0n9mWjkDL?=
 =?us-ascii?Q?VqBfqqgM6EfQeYHhG2be2Cp7c+DHKHT2hsruWXvifAYVATFpkz8x40rIQkYY?=
 =?us-ascii?Q?TAFN2F8tn/w3MGXyxnR7sr4+kNAWtxmW90Wu8KtaI7sFJCRz6uAkKyCcp0dw?=
 =?us-ascii?Q?4R4cYUIDcE0KBm2tCgcWMBiD9MQCW8sr98LjEFJgPc6rZIQHtouN+cKOTtfV?=
 =?us-ascii?Q?nscsHzron4rPlPBtE/HBcrXfxrcMpTg2GIJYUIrllyslLY0fQeiRS9Br5Wy/?=
 =?us-ascii?Q?AMzAegdzldLYMvytfQOTMUv/Y5KLavGtb2HAgk1sqorZW3SuQP7PdoFL+Bt6?=
 =?us-ascii?Q?0DZrh8vqhk5QT5fzc2Y+exVpBZDLsGf1KZAIYI3lkbujthl1pJ6wVyVq2QmX?=
 =?us-ascii?Q?MlJt55NP2HoJNmTB9XPvYuM7LMpnZP5LjHy0GLQDBRivAn+iWjeb8J/FFayE?=
 =?us-ascii?Q?WZuReHJ2BO8L2spCRdL/DyEz/2C8xH0Yq6Iw2WSjPFbakZVb1pEbO6IMAyY/?=
 =?us-ascii?Q?neMGC9GuvDzbJ3aWErcwSc9IWH78+iKEYiTgvvz5wSWCn1xvXbVDEi2+tjSD?=
 =?us-ascii?Q?V3rRNtB+Btf9sO0I6gZdEOWkatiIdCrTKr3+vqlxUKMLIH6at6MVbk4+71iL?=
 =?us-ascii?Q?IWpdyWzeUQo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1EgM7eb5gZ8IUUmskMsBlxZL/DDNI/XDYLtAzStpTz/sGSK2PLWQIgivg4AW?=
 =?us-ascii?Q?pUpeV0ZjSqa9vh4Yzly986o80bKWuoSLHvyOOU7vCdVoSoc6eeLmzupV8eoR?=
 =?us-ascii?Q?p3PDa4OSmG0zjBcR9NFVUtiG80vtAJwhQeGdru6qSQHllS2D5OfVhOVMDPFL?=
 =?us-ascii?Q?Qe86Q9RMnWxs/5a7iL74VZeJe5T5Yxp/363WurexNv0997FXAEz6jAKya2s9?=
 =?us-ascii?Q?gCxOSigutdh2SBG/ajEXSonydFHgIwNagOzaXS/esJ+Yt4mw4BAD2RTjb1CG?=
 =?us-ascii?Q?cMRY1KNsMVttKseNDOCcqXXuFHXU+esvVtEa0ZObpOyrLEuOkxxXX0Jv7I3x?=
 =?us-ascii?Q?qPlGaoo2cUik9afKFTksEZYKM58vVgEwqiN2JNTO4qM0bbwLBGQGK6thJTnQ?=
 =?us-ascii?Q?UHxZD1l1Eaj2B2RRb+UysFlSjzTskafqo4QwWFvP/EuKZaAqsKOJijMvhFGV?=
 =?us-ascii?Q?1qaKy1/U+FKhQnN+nDjfUIF7JfCL+LwxbuffVUty5lAnYcaTUmEGWmoHGesW?=
 =?us-ascii?Q?4/4AaligFbo4FVwA4KfXs1errmK/RIswuXvuaTspvXr3oFf0YbSc8NpMY+CP?=
 =?us-ascii?Q?k5kqK9rumHFuib29daNUZ8R7Az0UMVV5am4dTGzukVPMcMCw19vtkWyQkSA+?=
 =?us-ascii?Q?MOx5J9Qm5uhAGBGWfzfQLRJ6DzFpGDj1+KfvxFYAzOMLuYt66Jmg+2SeJdBu?=
 =?us-ascii?Q?VW25EKc+qdZ/ovPKWhZmFpbXaZ4wLQ1lZD0fmEcdAIsI6ophqTsGIqJlYt8d?=
 =?us-ascii?Q?j0gNLXn9bFgBSclsNYVkzeeJ8wNXIN8FNg5NQdXS72RsuYFeVYh13PngglGs?=
 =?us-ascii?Q?XpcqDkU/f80xC3YAf6brVjk78vT20yVvD4Y7bE3Mb/O+Pf2mCNS8G+nHv9D+?=
 =?us-ascii?Q?Xf3gi+GmB2+Xoj60k1QTVGd0lV0Zje6Oo98A1Riz2teSkqBxDLqY9NWwUOcV?=
 =?us-ascii?Q?ZRbKg/sxDKk7ahIKX+HZzfSdpPCIGUi2kzinvT6xWmQQu2/MD/+QzpZ9QMJ8?=
 =?us-ascii?Q?NNVj8uVs4yZo6lJe16G2HiuKcx8LIf1MLFAx2p3FtG20C4KiJrIHD6VnCPL5?=
 =?us-ascii?Q?H/yooEBroz0gqWbxoca+DPtAVKmbmzdtzatsU32ZNIYAWWj1jc1Z6HE3kAdl?=
 =?us-ascii?Q?ejL/f7UUUxe3e6SJUQJBCeaEChGyeCoPW+1MhPByA28JyWeT9FDW4SAZngtL?=
 =?us-ascii?Q?PHv9F5arxaNugVF8yno4sYTyLI+CslnSJ0QKO1BmNez2CTkiQn0aGoJfWIAb?=
 =?us-ascii?Q?arQhhoxTP9TjGOvfWSIJHQgeEj9OMAwBAErDKUyGNYmjOLH+chgQ2oGdPk0E?=
 =?us-ascii?Q?f4E4EmdjfYxFmNPCLtYNwwiwbVd5mYjZudALmlb+p0FWe0ZAMqB1VwKTSvqu?=
 =?us-ascii?Q?CNOSrlQiNQOIfrU0Dk3evhEYfrWpLP6Fgn1HtqViJ1IIYZir3Vh0TVi3XiQY?=
 =?us-ascii?Q?zuQUULrRIIqCoUWxg5qZSyyOjbfoxgGyvszqb50aWYMMLpdvm1CBpMQc9nH5?=
 =?us-ascii?Q?qtoHG4yAgBHpsVT/GqruyR/xnZ50g/yTqb8h/98rJJFzqWJupEtX4Cg5dWbk?=
 =?us-ascii?Q?Vc+nuWiLUdEXaFN37sKwZ7sF1ut2ZYXkm2L072sR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a14af23-14ec-4bb9-f51c-08dde9325751
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 08:34:17.8246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WLGwdiArGnZHRVHVI5ywX5pZL4hJDWl+cRKf3CQIDLdMbQN1jd/yCMb06ptfEbYrTFoSgXQO3GpNDYAKKaxUPmaD4S/1GezS5kwHd8epM+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB3022

Hi, Krzysztof.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Friday, August 29, 2025 11:03 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
>hverkuil@xs4all.nl; robh@kernel.org; krzk+dt@kernel.org;
>conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de
>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>lafley.kim <lafley.kim@chipsnmedia.com>; Ming Qian <ming.qian@oss.nxp.com>
>Subject: Re: [PATCH v3 5/9] media: chips-media: wave6: Add Wave6 core
>driver
>
>On 29/08/2025 10:46, Nas Chung wrote:
>> This adds the core driver for the Chips&Media Wave6 video codec IP.
>
>Please do not use "This commit/patch/change", but imperative mood. See
>longer explanation here:
>https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submit=
t
>ing-patches.rst#L94

Understood, I'll fix the commit message in v4.
Thanks for sharing it.

>
>>
>> The core region provides the encoding and decoding capabilities of
>> the VPU and depends on the control region for firmware and shared
>> resource management.
>>
>
>
>...
>
>> +
>> +static int wave6_vpu_core_probe(struct platform_device *pdev)
>> +{
>> +	struct vpu_core_device *core;
>> +	const struct wave6_vpu_core_resource *res;
>> +	int ret;
>> +	int irq;
>> +
>> +	res =3D device_get_match_data(&pdev->dev);
>> +	if (!res) {
>> +		dev_err(&pdev->dev, "missing resource\n");
>
>This is almost impossible condition. Not worth printing errors.

I'll remove it in v4.

>
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "dma_set_mask_and_coherent failed: %d\n",
>ret);
>> +		return ret;
>> +	}
>> +
>> +	core =3D devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
>> +	if (!core)
>> +		return -ENOMEM;
>> +
>> +	ret =3D devm_mutex_init(&pdev->dev, &core->dev_lock);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D devm_mutex_init(&pdev->dev, &core->hw_lock);
>> +	if (ret)
>> +		return ret;
>> +
>> +	init_completion(&core->irq_done);
>> +	dev_set_drvdata(&pdev->dev, core);
>> +	core->dev =3D &pdev->dev;
>> +	core->res =3D res;
>> +
>> +	if (pdev->dev.parent->driver && pdev->dev.parent->driver->name &&
>> +	    !strcmp(pdev->dev.parent->driver->name,
>WAVE6_VPU_PLATFORM_DRIVER_NAME))
>> +		core->vpu =3D dev_get_drvdata(pdev->dev.parent);
>> +
>> +	core->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(core->reg_base))
>> +		return PTR_ERR(core->reg_base);
>> +
>> +	ret =3D devm_clk_bulk_get_all(&pdev->dev, &core->clks);
>> +	if (ret < 0) {
>> +		dev_warn(&pdev->dev, "unable to get clocks: %d\n", ret);
>
>You should handle deferred probe instead.

Okay, I'll address this in v4 using dev_err_probe().

>
>> +		ret =3D 0;
>> +	}
>> +	core->num_clks =3D ret;
>> +
>> +	ret =3D v4l2_device_register(&pdev->dev, &core->v4l2_dev);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "v4l2_device_register fail: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret =3D wave6_vpu_init_m2m_dev(core);
>> +	if (ret)
>> +		goto err_v4l2_unregister;
>> +
>> +	irq =3D platform_get_irq(pdev, 0);
>> +	if (irq < 0) {
>> +		dev_err(&pdev->dev, "failed to get irq resource\n");
>
>Syntax is: dev_err_probe
>
>> +		ret =3D -ENXIO;
>
>Don't override error codes.

Understood, I'll clean up this part in v4 based on your feedback.

Thanks,
Nas.

>
>> +		goto err_m2m_dev_release;
>> +	}
>> +
>> +	ret =3D kfifo_alloc(&core->irq_status, 16 * sizeof(int), GFP_KERNEL);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "failed to allocate fifo\n");
>> +		goto err_m2m_dev_release;
>> +	}
>> +
>> +	ret =3D devm_request_threaded_irq(&pdev->dev, irq,
>> +					wave6_vpu_core_irq,
>> +					wave6_vpu_core_irq_thread,
>> +					0, "vpu_irq", core);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "fail to register interrupt
>handler: %d\n", ret);
>> +		goto err_kfifo_free;
>> +	}
>> +
>> +	core->temp_vbuf.size =3D ALIGN(W6_TEMPBUF_SIZE, 4096);
>> +	ret =3D wave6_vdi_alloc_dma(core->dev, &core->temp_vbuf);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "alloc temp of size %zu failed\n",
>> +			core->temp_vbuf.size);
>> +		goto err_kfifo_free;
>> +	}
>> +
>> +	core->debugfs =3D debugfs_lookup(WAVE6_VPU_DEBUGFS_DIR, NULL);
>> +	if (IS_ERR_OR_NULL(core->debugfs))
>> +		core->debugfs =3D debugfs_create_dir(WAVE6_VPU_DEBUGFS_DIR,
>NULL);
>> +
>> +	pm_runtime_enable(&pdev->dev);
>> +
>> +	if (core->res->codec_types & WAVE6_IS_DEC) {
>> +		ret =3D wave6_vpu_dec_register_device(core);
>> +		if (ret) {
>> +			dev_err(&pdev->dev, "wave6_vpu_dec_register_device
>fail: %d\n", ret);
>> +			goto err_temp_vbuf_free;
>> +		}
>> +	}
>> +	if (core->res->codec_types & WAVE6_IS_ENC) {
>> +		ret =3D wave6_vpu_enc_register_device(core);
>> +		if (ret) {
>> +			dev_err(&pdev->dev, "wave6_vpu_enc_register_device
>fail: %d\n", ret);
>> +			goto err_dec_unreg;
>> +		}
>> +	}
>Best regards,
>Krzysztof

