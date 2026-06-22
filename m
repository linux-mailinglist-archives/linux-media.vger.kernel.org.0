Return-Path: <linux-media+bounces-65344-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h4esMgj+OGpVlAcAu9opvQ
	(envelope-from <linux-media+bounces-65344-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 11:19:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1386AE21A
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 11:19:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=RoLguuZN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65344-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65344-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A674E3007285
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 09:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CCD39B49D;
	Mon, 22 Jun 2026 09:18:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021091.outbound.protection.outlook.com [40.107.51.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D65397E64;
	Mon, 22 Jun 2026 09:18:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782119928; cv=fail; b=DA8flDFvr9jyepxcGtg5iuKNa7izkDheVbJCQhhYM4FGo2QXHwKCSK3Wuu7bAKjQTzc47d05uPwZHkdb+xVM28oTeOKabErVNmWr9RUDkuU5v+iaEF967RQJDvgaJLrhaAW/ljLETGsLTDymI0IPmouuLgLnqOrjwVZ2Clg0PJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782119928; c=relaxed/simple;
	bh=PcpYa72zbk0lPqvQQbkX45BJxkyDzYgp2vxzqHRgZnI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UR1E4WeHfOYvNlrOtDzfs5a/EHfZ23HzTf753ElTw0jUwDx46SjGPWiJjDfxGxwpwSp/DxpP9Al5ylsa2az/AAmNCZHuF5wDrfEeJH3hRvIC/69VhFa0bfHP7J4QxIrZoagKq6jBDVJmahWlpGMYCLRCCBZcbj7OsH/FNzwkMdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=RoLguuZN reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.51.91
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TALZLl90pBvinlxwQ7cTr3K+ePX2fR00ftaUQQStemtTjlwB1zOd7rtKoCKB/2XhjxPJaZ7BCkG2L46KBIVZawHHHt2fRixGVkKm5Ncy54tqlB4IObUQbfG15o7u6hzVqbr6BS2IysEFRhQwGYOOdMA2ib8v97dLj9qN+gUE2niGS8lWiPABN654u+gdmdJJmZMrTt+YHHIbGFcigqFEr4VHFJvWxwbtRn0rMrqO96ht2QeyuNK8r5W+sR7fjodAnoqPZA8C0uBxbJcTUUQVyhQ8egwPUQP4+DNOmqubk6bZZbyo2zhnQ92i1M/+EuDjtV1c2a9IJ056bqqA+0l6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcpYa72zbk0lPqvQQbkX45BJxkyDzYgp2vxzqHRgZnI=;
 b=VoiKgtI4WfU+f9Gj3iY6OvORs7IAsE8CqEi+U9F16rmNc2YvMC0AgXXzw5desmDLbPRUsY5FgSI2Odi21SnXwVKu/uuHBf3X9aSR0lsWNxA3OJ3HrBoj5PUX7e8xfQ6eK1u/AGtr+D3js8B0pEjKAr9nci+g9G4FkdUKfeUpssLquBMB8P1i3kGIURPQmZsuWGXm+y4kaLWQPuknW1ajacaTCy5b3sii6wWZQZ+iBiS7oQXgax28NtbL74ictzMvMwZPmeZL2uosk2ZGt4dzwbmHDf5B4N8ZPn0iFtxVigLbb5hgqRGslkYC1+sDprF5z+Z0MjNiqHH37iMlotE7tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcpYa72zbk0lPqvQQbkX45BJxkyDzYgp2vxzqHRgZnI=;
 b=RoLguuZNqTNn+riAbr8yOMv2YBHArRNgTlN5zGKKZY+BQE921vW5ny+z38sm99Z0Ukaq4qZ5fdS1chxca/KB7eKA6GdTds+Tuo8DCKkq+owHjKXMuMjx9JFfvTSBpicmr8X8VHxC3FnCPTxWvnMNweHvgpn2LnUgWb9ia8LfVzdQEeowlxzTeI2ydQ0rESqpW/v1qMezr+E6IjqLPM6r/abPxXrKFSdBHxdT2uzVpZi5vGqRIx9GH+1YExpX+DhUcbmQ/BeO/MyzW6dcI881Y/eFNsizEWfyBLNZ/4HE6GOkp7FHQKs0swxWVOILoIVQtN+LN8V6LZyFSqQeGZS1cg==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN3P287MB1108.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:173::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.14; Mon, 22 Jun
 2026 09:18:40 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 09:18:40 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"luca.weiss@fairphone.com" <luca.weiss@fairphone.com>, Hardevsinh Palaniya
	<hardevsinh.palaniya@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Walter Werner Schneider
	<contact@schnwalter.eu>, Kate Hsuan <hpa@redhat.com>, Svyatoslav Ryhel
	<clamor95@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] media: i2c: add imx576 image sensor driver
Thread-Topic: [PATCH v2 2/3] media: i2c: add imx576 image sensor driver
Thread-Index: AQHc/+rjlKGWpG0n2UqPle5J3Ir6S7ZHcVeAgAKoCP2AADMSAIAAAwww
Date: Mon, 22 Jun 2026 09:18:40 +0000
Message-ID:
 <PN0P287MB201958C9169499B93C50ABC49AEF2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20260619125439.55311-1-himanshu.bhavani@siliconsignals.io>
 <20260619125439.55311-3-himanshu.bhavani@siliconsignals.io>
 <20260620132749.GE3552167@killaraus.ideasonboard.com>
 <PN0P287MB20199A3EF8F3183176AC1E559AEF2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
 <20260622090432.GL3552167@killaraus.ideasonboard.com>
In-Reply-To: <20260622090432.GL3552167@killaraus.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|PN3P287MB1108:EE_
x-ms-office365-filtering-correlation-id: 5788b443-d5ec-46f3-1f27-08ded03f3f97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|38070700021|22082099003|18002099003|56012099006|4143699003;
x-microsoft-antispam-message-info:
 M3fCbT3DADFU10BDrNTlEKF62r1QYA93FU7JSgdR1G2pSZXQRugldpVCPTc4ekQw+Bghne3S48m8xHDELvQWoEULW/EFDwd2X0PEENT0vNQryY8qb6PZoGtnCrV9cA8jqT6OyeVve+ypmkQydJwIPjwXaVBfMAHpWptSxNb+wCnFlg5mMhsRpc2OSnHf7NxFB0sIrpEJchxO5kpy9lQF7NZY9gLaRYvDXqgFBCX3VSAVMQiLj/0SsQdO9cQJwfRLqifx3NYbfmzDfS+lExlF5agPNI0fnovAGuWTr99Rcc7qAzlBd5Or1SHO5pTrKA4u9TGnNI09c7HXp718MnmFAvFZNjuTb+15+0+vzapaN3qYxsTm8+g5djcKYEPzLBk/Tv2KMrv9GZoLQVmrT8nddzUikwAIyJzgeuP3d5DZfCpGV9pVFDJJP+ToW1H1FDxS3FJ1XqN0GUwiIa/y9QCvn8T7x++YXUqmkXq32O30G1AErsLg5sF+43nRIeutNI8MZDFCJbtsUaGlAsywh9Gx0Jb8h5HqykKpebBfSxBOppl+17snEHTdGaamlvUjy9PxC7/ZQ1hOZQGGeF2bRuOgXQxlg9ekGoGcQ36UnqUM4yHO56rUzLx/QuUcfDSpt2VdF2DLCPDyznkh6LA88q96cHl4UO9FWXDoCSIZEuG7R5fsfXksBGwSWMKYR1UvqleWlTW6zBW/+zcSFGKBqDfupoPq8LFPKmTyoiyQBdDi2gQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(38070700021)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jM6pNN4UE3kjV/UUfWN5RjFQZSIun5sOHRSboZaznInIA4N2bXYX0SwOcp?=
 =?iso-8859-1?Q?GX0A+5xqdbrdkSsKY+KXi3CqKeuO7fQU0ZTBlQ4QIaCNa5y+7hEcL4XgGv?=
 =?iso-8859-1?Q?Y+U45BSmDX5fUR7Xya3Bl9QBQqBmQKNGasOnMzS56P4FuJpyxipfGEtzKg?=
 =?iso-8859-1?Q?HV+SJpxuxiFDu/wjI1BYM1PGNDUvucLRWZlCpHz3aYudmyOeeAPU8we0L3?=
 =?iso-8859-1?Q?BH5RQreskDGdTEVrl3MH9F79sQYQwsXJXdOEUOtB4yYaJHyu2MMjfMunc7?=
 =?iso-8859-1?Q?qpoqon7kJbXEr5qcVm8b1l3crACqKUUA7Up8II9DQ8b+fVcicXxN+3shXb?=
 =?iso-8859-1?Q?nuPfwZhBz5xy5OF0NysbacJjISYxE4uKcnokzP65bF33y+K2GU9IgKi4yY?=
 =?iso-8859-1?Q?gkM1XK6UdIdvETCBf4M0IcCabtxQDxc+mbzWsSgT0IsyIXGZri9t4oDs7B?=
 =?iso-8859-1?Q?zJYoyBEZjq0lcpC9KKhJXxXEGi+V7rB+2NZ9koB9On89QM00QubQVP2RBd?=
 =?iso-8859-1?Q?8/haPXr56inrr0xJi/8pMn46cFOEK52Wm/3U5Wqu8VqIXzbb2//JHBSU1l?=
 =?iso-8859-1?Q?NJoPZZVCnrWLxgJWDrIFIpgifjH64t6fCbAO1eoIq+eEWi6sX0zqrumzgu?=
 =?iso-8859-1?Q?3LJj4D+OwrjymJcNeqR6Oc7DdcCpXh170B8LaxbErwCcIBmSPWByhP3PTg?=
 =?iso-8859-1?Q?CQTCZXfOwHmxuGrd4B72ilGbalg4B/fN9UHu0ZHN3GXu6xnVqKooCaF9TW?=
 =?iso-8859-1?Q?KPFcvatNCLmIqPL78uwUjEKvzqThFWClivF1nN0w3ApuaeQzaP95YOVEEP?=
 =?iso-8859-1?Q?ot9xsnU0XYqmrqjBHQW323Z4vaii+m2zBYi0WSlvZgreX7EjdF08LMDPCF?=
 =?iso-8859-1?Q?44cb08QBsTuGJGUGqeZg1izUaL4+35tO7xG34HC2cft7olP5N0eh1AOGld?=
 =?iso-8859-1?Q?rpCZa5USpkjRYor/U/DoHbVKVlCL1eE1lNbbiSAdvxC+5vOGG7DJgc112M?=
 =?iso-8859-1?Q?y0iXao3opmcnB0kpI526URldA6ARo5Uj/k+WKCSmuN3vaLi8gbVCacZ7CM?=
 =?iso-8859-1?Q?zOSj49Je4ZTvhTANgjbNx+mdMj+/sLdfWVxoiwhD62GdG5DSQ8PabbUQZF?=
 =?iso-8859-1?Q?wjwzympnZasfPelFliYnXC9dOZddUPLo/b+sAwP0uWY25FzN9UdtwQarxe?=
 =?iso-8859-1?Q?n0fzmAkFMNMMCe6+RYEyFLheLJkenqFeKJL1l/+bE3r2wkf8JJ4Rf7YMZJ?=
 =?iso-8859-1?Q?OvqrKwXbYCBUoubXIjNZr0lfz/pySu54/dysXZFgCFHpbQRf12C68TUYW/?=
 =?iso-8859-1?Q?zDF7ywNIAypASamacsTkcxZ8bVgyx64HmT9PZ+/orhb9GE81I8k0LcZKUL?=
 =?iso-8859-1?Q?OSF5mWx0+HWm2E/OIO2Dp2lnPrMpTOPzT3IfWW/ogQfvC0+memOvMa51Md?=
 =?iso-8859-1?Q?7/RELYHk+4g6XXJ0TJ6tFgXnDYLmMK9OoUTzg4zyZCmGx9/ShS1JHvn8O0?=
 =?iso-8859-1?Q?IYOxIua1o6ycgLDZwuO3qdNavnqOkeIIT9qtZPeFCyhYfZS8ISIVRru//w?=
 =?iso-8859-1?Q?susR2RAMdrSEYpyVosJVXlpxmgPyJg0RF8NNs5KWkiO+iMT12WMIEDcALE?=
 =?iso-8859-1?Q?dh2QRceMZyz+KjF5axJtB1DyJl9EppmzLpveEb8jd61QXwFDStInQnhEZf?=
 =?iso-8859-1?Q?ilVPAlOBIr1gUm4t4xuTYwAZ5ZMLpj+KrjJdU+336VPo0Mg5eLT/kemv/3?=
 =?iso-8859-1?Q?DmpKRnP4vBNmD4j/Z8IJfUVAFdfX7mUuGWn1stE95EksQv6dPhgTADI27Q?=
 =?iso-8859-1?Q?Gd/UOWYQXDq7HrGxTVwH+DZIB5HDMiw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5788b443-d5ec-46f3-1f27-08ded03f3f97
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 09:18:40.1481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OO3NPDT/pp5pywgfUBC3WX22ykz+wwQhH4EctJmuBOUPFd7g5fK/Ry6iLpuzQ4qUM/flIdBGfDF20gxcRMYVXACnOpFoM6z/ZOfTwtBaOoyi3E+dqs2+8VcfqyZrqF/d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	TAGGED_FROM(0.00)[bounces-65344-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,fairphone.com,siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:luca.weiss@fairphone.com,m:hardevsinh.palaniya@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:elgin.perumbilly@siliconsignals.io,m:contact@schnwalter.eu,m:hpa@redhat.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:from_mime,vger.kernel.org:from_smtp,PN0P287MB2019.INDP287.PROD.OUTLOOK.COM:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB1386AE21A

>On Mon, Jun 22, 2026 at 06:02:24AM +0000, Himanshu Bhavani wrote:=0A=
>> > On Fri, Jun 19, 2026 at 06:24:32PM +0530, Himanshu Bhavani wrote:=0A=
>> >> Add a v4l2 subdevice driver for the Sony imx576 sensor.=0A=
>> >>=0A=
>> >> The Sony IMX576 image sensor with an active=0A=
>> >> array size of 5760 x 4312=0A=
>> >>=0A=
>> >> The following features are supported:=0A=
>> >> - Manual exposure an gain control support=0A=
>> >> - vblank/hblank control support=0A=
>> >> - Supported resolution: 2880 x 2156 30fps (SRGGB10)=0A=
>> >=0A=
>> >You've been asked in v1 to make this driver dynamically compute=0A=
>> >registers instead of hardcoding modes. Please do so in v3. Nack on v2.=
=0A=
>>=0A=
>> As I mentioned earlier, I don't have the full datasheet yet, so I=0A=
>> can't implement this now.=0A=
>=0A=
>You have been given a link to the datasheet in a private reply.=0A=
=0A=
Sorry, I missed that e-mail, Just checked.=0A=
=0A=
However, the datasheet is the same that I have, but still I will check the =
reference's as suggested by Dave.=0A=
=0A=
Thanks & BR,=0A=
Himanshu Bhavani=0A=

