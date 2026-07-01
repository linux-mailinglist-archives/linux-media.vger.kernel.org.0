Return-Path: <linux-media+bounces-66222-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UGB+C40TRWov6goAu9opvQ
	(envelope-from <linux-media+bounces-66222-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 15:18:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C426EDF9C
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 15:18:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b="KyHNh/q0";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66222-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66222-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D51D327A378
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 12:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9D348C8AD;
	Wed,  1 Jul 2026 12:36:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020100.outbound.protection.outlook.com [52.101.225.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1C048C3F7;
	Wed,  1 Jul 2026 12:36:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909410; cv=fail; b=BAziQwThdi3nHjQnIvtT0HGuT1ep7k+PGtF035ZJ51l5dU8x9pHgGfaxPb42pHGWdkaBiXdLEfxbXTF5d7VGaTucHwZo+15vu+1LYamwcUB+0xZqvDMl0BvL3jYJ0mgxH9cHVjKMJMoY4cdzEao8G5CyTzpoN/pZwyux3fO+ET0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909410; c=relaxed/simple;
	bh=LuY7p/VV1nrG0u2ZLTaCxEFzY4ojm2wLfCV6EB2xTFI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ulK+IXYZl2alqOaCaGCELxdeG7Lh4ApsxDtCuA9iWSGFogMdhOrTJdTxtSIfWEpY2+mkjUNm0QJKQLPxCBpBB8B09xIndxkscp90DUMluUVSmn+zzb9xsNRhU9yn8SkdKZBs5ZPSglOJBrwn6naeBF1+nGmHsXGjYKKtKYcMl7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=KyHNh/q0 reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVTW+A/jGkq+E5mHWYFdzW96fuoT86ep0iY89g/ZCOjhw11kz8xmeeMMA6XOTZdk5l0SncC5Z5Zt1+WpvF7AZhAoKk6cOLN+DL8uFtXOdv4llQPRTMcRQ5m5QmE++PXG4o4r13j0HCFPxmL6ZB8LVEBkOnueoySNfRSym+adR2ZWNH9Ej5l9e38HyMW0Chx+EYtRpKP9ueN9uNYEeSJOwEXpwJVfJVId3gRU/DHviXtuF6SKHdl4aPu/hYP3p8MkZJqhb07kWu8U5tZJh0zdXmiciepFurZ+HISK5VKxbWbkSYn33lZEfPcTPvdh+D4BjQVwF5QivODAjdc5Xl3SOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLsfNyXPaXXRFFK56+CO2v9qZSvpjftcm+qVXLvYJo0=;
 b=ObKf0PyghBqRO77grmyyLTaAo2pxdbYxs9UUCVk+jXTf3gg0gBk4R6KMiJ8Xm24AmDoVhq/FDPRpyDfCnHzmfnrD2Y+TUQ6HIpTtwwSMGoivSIaw6PNF8IzNcSsXyluKaUQNZOm+x9/TZQMWassRtsyTRuB6w2VWG6Lor+bL4/GjvqW/Zv2Xl2HW4GsHhuW/LcwM/9iW9hUdfXJ6MY70RawP8tFScydi3Ieesxg+uNMot7hK80ko+6ilBCuwtSRHJUuM8rodx9Su0/fzR3bbGs2xJDA2gjK6NUUWaGFaFjA6UcayqEeUmlUBUs0qqCj9B2Y5P2byl5/ao7cXJUP4UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLsfNyXPaXXRFFK56+CO2v9qZSvpjftcm+qVXLvYJo0=;
 b=KyHNh/q0ZUonTc1R6YjasYHsU/Ezw3wqgiIJUlmXIr/apCvbz5ZHmoyd5+pUfsy90zmR5dPO2NsO1Uq1CqaMu6T7YOJoW6k9ROzSjVSvh0UOEKkvA8tcebAhq226ewbDyDdzsUS2Vm9HStCzlk8SGqR3tBQpNVqd8kBWoK+cyFHChUkYFqvdiq3AMSH5qBHcg3VazuzEn01bfKZ7a09RhBwyx3CjuTpSIfd8rPEAmzN/MJBaLOd3sOU5JG2o2lEAXlbOKEcKESOWZxBBOYFTGPBDyZMHJlNBmOFWTaFOMNHiX8ie72QX3Dj4OMYbWm3jAIppJOFY11E7KDGJLREaxQ==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN3P287MB0815.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:176::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 12:36:43 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 12:36:43 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"luca.weiss@fairphone.com" <luca.weiss@fairphone.com>
CC: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Hans de
 Goede <johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Walter Werner Schneider
	<contact@schnwalter.eu>, Kate Hsuan <hpa@redhat.com>, Svyatoslav Ryhel
	<clamor95@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony
 IMX576 front camera support
Thread-Topic: [PATCH v2 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony
 IMX576 front camera support
Thread-Index: AQHc/+rpvZzMTRXyLkO/gzC6xhvmXLZVfMMAgAMvzLI=
Date: Wed, 1 Jul 2026 12:36:43 +0000
Message-ID:
 <PN0P287MB201945BA5173A17EA963C4D29AF62@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20260619125439.55311-1-himanshu.bhavani@siliconsignals.io>
 <20260619125439.55311-4-himanshu.bhavani@siliconsignals.io>
 <c0cc8b08-b468-4120-b79d-2ab9ef4d0aa5@oss.qualcomm.com>
In-Reply-To: <c0cc8b08-b468-4120-b79d-2ab9ef4d0aa5@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|PN3P287MB0815:EE_
x-ms-office365-filtering-correlation-id: 7efe3160-740d-4bee-af75-08ded76d6858
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|18002099003|22082099003|38070700021|56012099006|4143699003;
x-microsoft-antispam-message-info:
 C6WUqtIZ0V3J+HcIuxLYoi+0720yyD4kEMNqz3BtU7FSoNe/659VJB8AbuGcyHsQxGk9q2x595GfvFfacsOxCcutJJtR/X7hPgb9ZJdSXW8LaGI2olqJmgUk0wQXziYm2q+6tSpra957bobALsQhcPNYT3ymuU9E6MVSaCkw9mseprHuDFHQlkD6YVYyGnbhTi6fLVmTfn4macGNA4U8vYE6MyZtHXTta9r5/MQzF+kOwLpk4SftnedSeRRee3Y0ByAzVA49p2dOdDFMBJIAzw9G/HfYtkcVuANlgLvvuJ6IWOqbp0UK4r6mNzW0PC8TUBBOBPTsmzxqJUadhWHBrRilh7/du3ez+3QGgEH0r+tl51MoqaTK9HCdq80093irLlKi2XyoWt/CNYgYMgUPIOVE0pqErlHs5+e/LpXO3B4BVRxw41B79f2OyCPdp4f3lV4q5NpDyl79WapQamSSFmpCJrR/aCRG++lTxMgs4Iupkez/33Z+5RVhD42LsSbl/Q4Dwt4ySLnqiYfxMv7ZERr6eBKxr7DYU8xaD5nDtEC+TkkWCBY7QL5k93wqGmdIURVxOjat9p2q+uoxJsDuzASt+klY366gg36PYrpqaNesWo5N2IYQfXQ/FNAqCVyf09ufRHxlj0A29OTyKQ8XSh4cv8uPt8ZgNRZr6qO11rtp24gagn7iBHZ6Jd/fKs6xEl6l5pPkkA0Y2vS/bYkcAhqe8UX3vTdNqZrM470CW5Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(18002099003)(22082099003)(38070700021)(56012099006)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qzk33pn05EEpY3DUTdxFSL4FIVaFbQA/30Y3zD9farkMP718Iv09vp4gDI?=
 =?iso-8859-1?Q?i5iWsVTVhKUpKF4O+IGCWzqFrJKWJMxJC9+xGca8CJBOxjFFj7soRuW1Tg?=
 =?iso-8859-1?Q?uICQ6gu75dGjQTGRCe4UfQ1KwAq9/wIu9I92EAiWu5LTOOHvLUlwV1zkii?=
 =?iso-8859-1?Q?WdEUgBACA6RE4/p8WlKiHwae5AhWba4jDlTS9GVxtDo7+dTVKDbu84Z8Fx?=
 =?iso-8859-1?Q?5RNARRRbSNohKF10pchiz4Co/6m3HzBQPYb2xmS7mi0eZUT4uPBdWO1IOL?=
 =?iso-8859-1?Q?JXB4FlchOyl0/vWK9jL+uVOuXOzBKdsjJ+zvaDBDy8Q+eEdyZr3POf8/gq?=
 =?iso-8859-1?Q?iItXNGIdgR6Fjhj57lRc9Sbbo4YSRJosYO3Zhzaz70co4CId310XgpklZu?=
 =?iso-8859-1?Q?056uY3cyv6YxIF3PdXqaas65XXhDCnDEYqJgcYsw7HgFkQGqNvvGieiw6h?=
 =?iso-8859-1?Q?aitGiXeEJS4DQAa5LhHeHO5OjXceZIvJJYsbeEuD851n+itZavoOoXW8pg?=
 =?iso-8859-1?Q?qFIJSwGQ20vdOyuXMbhI2MOAZmkpQ0d1MFrDHqqTQd2szUTGZ7rzVhCqDm?=
 =?iso-8859-1?Q?sle7Y9aOqEM4evpQs4/aWDxfknmkPZUqTEA40IMC3VuESr6OmyClFtkrjS?=
 =?iso-8859-1?Q?cTpcyhTwYz5A9gWsoBsmC2lhhGUl0CYMtqO7n0wmVbjPwc13UWii1Ef4x3?=
 =?iso-8859-1?Q?Ff49muUBsuzw769llUNkDAiDbHlGnVdNJqPLUJsFqNf/8QjHTVvNQdqc/r?=
 =?iso-8859-1?Q?pZsgF1A3qkW2vhIq83EhYLqVWte2i84vIjgWapIZVA0wLXzkM5F8kGmd2K?=
 =?iso-8859-1?Q?j0lev8D2fqIHbLqb81YwHzpGyoIsq7xfzVFra1OHH1tEwYRvgpvYU/2QYj?=
 =?iso-8859-1?Q?5ep3BuCRY/a0tN+Fxn7qrRne7RI37vyq/sY+X83IxxsNVEO/rW9wnJJIUC?=
 =?iso-8859-1?Q?uo7aSQOEBoEu4+nKVyd8ihctzbuyuAGRKvVNZe2bJEZihGEmVVFCEvfzZc?=
 =?iso-8859-1?Q?IqVvniGDRZbZFHfNcMaMp9pBZtT868mVudFQWIr1lgJKaulX8CcKzwpMYF?=
 =?iso-8859-1?Q?lwHXtF+m04s2mBbuF+PeU4VPYQ+hQP4p4hZli2MQDnl6rB4C8bEdDDlZoq?=
 =?iso-8859-1?Q?9MZwmMeV1/xmZpAHKkqbPMXSAddvc4iHwLW9HPcjIXaZkcLOuJOIHhbq0R?=
 =?iso-8859-1?Q?p1YCEf/wzVgTwk64qOMMRa/vsCxWfsHfUnWTiNiZQ0VfMW5VtWS6SJXPsC?=
 =?iso-8859-1?Q?rzY5lsbbkf8PsbXbyiDMkqUPtIe/wSxQl6A7GCBrb8J/H/QM8iSJ4ID5pq?=
 =?iso-8859-1?Q?TxUEUnu2EexRbgedUobWS/gnzJN/vFQKqZDmb/pkAJG2f7AksnCwlt2Tiq?=
 =?iso-8859-1?Q?IGOu0+ivRYag3s84wbANcoELUJtErk1LIFqN6amwNm/HnQXsmoFLyCDVci?=
 =?iso-8859-1?Q?RlWmsmj+/hzOWb/EsywTHRV992Nmw9/PfYOZ5UCToBMs4d5nt0OLvNBsmM?=
 =?iso-8859-1?Q?HwCtdiLDhoVuwov8bIBCNBvH6Jn67xFNeveUV4XtXcCU2zW5+xtdlNDBpO?=
 =?iso-8859-1?Q?lmmakpz+DIiR+Y8wq91q6OzVli1cMj1rlmIBfuohEciWXZDmQlkKVAPPEC?=
 =?iso-8859-1?Q?yMd2KJC6GsCxDZSk8U1UyvUGTgujQPZ6tppoovpHKZNQBwu+7/PN7orGL2?=
 =?iso-8859-1?Q?rGBnbU4N4jXTv7HGAzOPJCp8NSKiefj+TUUQPjM/z7TKSDXqt6M+eKEEjC?=
 =?iso-8859-1?Q?Y6SrJS3nr2vJ6whrilHGL+eVsX8JRXLGzbU1OEe8nFoxeARsa+tuiGC/jl?=
 =?iso-8859-1?Q?mniXJMOh3LuTl1ZdAyjaZb2A2M/5dec=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efe3160-740d-4bee-af75-08ded76d6858
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 12:36:43.4822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W9h42+Zvaaw8pDGX0jVSmZ6vbsJcZMVY2KW5ClBFdKZEghP4dVgmX8fWQyRSaAzHPe//BHkuq0F+7+XR91JEjecLBDn0PDUiAkGyjJZSxuOKnGw7tGyWUF50ZBZJacWX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0815
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66222-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:sakari.ailus@linux.intel.com,m:luca.weiss@fairphone.com,m:hardevsinh.palaniya@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:mehdi.djait@linux.intel.com,m:elgin.perumbilly@siliconsignals.io,m:laurent.pinchart@ideasonboard.com,m:contact@schnwalter.eu,m:hpa@redhat.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,ideasonboard.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,siliconsignals.io:from_mime,siliconsignals.io:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,PN0P287MB2019.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4C426EDF9C

Hi Konrad,=0A=
 =0A=
>On 6/19/26 2:54 PM, Himanshu Bhavani wrote:=0A=
>> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>=0A=
>>=0A=
>> Add device tree support for the Sony IMX576 front camera=0A=
>> sensor and connect it to CAMSS via CSIPHY3.=0A=
>>=0A=
>> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.i=
o>=0A=
>> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
>> ---=0A=
>=0A=
>[...]=0A=
>=0A=
>>  &cci1_i2c0 {=0A=
>> -	/* Front cam (Sony IMX576) @ 0x10 */=0A=
>> +	camera@10 {=0A=
>> +		compatible =3D "sony,imx576";=0A=
>> +		reg =3D <0x10>;=0A=
>> +=0A=
>> +		vana-supply =3D <&vreg_l3p>;=0A=
>> +		vif-supply =3D <&vreg_l6p>;=0A=
>> +		vdig-supply =3D <&vreg_32m_cam_dvdd_1p05>;=0A=
>> +=0A=
>> +		clocks =3D <&camcc CAMCC_MCLK1_CLK>;=0A=
>> +		assigned-clocks =3D <&camcc CAMCC_MCLK1_CLK>;=0A=
>> +		assigned-clock-rates =3D <24000000>;=0A=
>> +=0A=
>> +		reset-gpios =3D <&tlmm 35 GPIO_ACTIVE_LOW>;=0A=
>> +		pinctrl-0 =3D <&cam_mclk1_default>;=0A=
>> +		pinctrl-names =3D "default";=0A=
>> +=0A=
>> +		orientation =3D <0>; /* Front facing */=0A=
>=0A=
>Please include the new define from:=0A=
>=0A=
>https://lore.kernel.org/all/20260628-kbingham-orientation-v3-0-4ed92968aff=
8@ideasonboard.com/=0A=
 =0A=
Sure, I'll include it in the next revision.=0A=
 =0A=
Best Regards,=0A=
Himanshu=

