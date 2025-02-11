Return-Path: <linux-media+bounces-25974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BA1A30135
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 02:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEEB91889417
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 01:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BCE26BD99;
	Tue, 11 Feb 2025 01:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="KCknuNOu"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022133.outbound.protection.outlook.com [40.107.43.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEB026BD8E;
	Tue, 11 Feb 2025 01:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739239129; cv=fail; b=dy8/6emFDSVR6NJ/zWQXiSo1b/O52okax2xxM8RfWXmW859uM9IEahwqSXlhJO0lh2bAYtIOLG2wZ+GGWAvbYYauRbjkRKOt1mrjScKFdet/9sskEMohY1SoPgM+Ouw1N00SGGjq+gLsVoLVvJ5y/No8URihLvhXO7WRoI49nQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739239129; c=relaxed/simple;
	bh=SbD3NxPshJtCv12l07ISSLTT3xDHcRByjkmLTij8bJQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a4Lu5+hNomQZbi/8lD34mx3oNzfZ24w/adW0Erx2BfeaDNC1prs/ajs7bbxlby43QoWTbMo0xwOxJDsjUlF9/SOzlfu/FSXgfmfIb6UfLBRG7uvWhCh+xbIT0wtmqPhaFEaY6/wSeZLi6Jpr0Uoak/pm/mduozsrBrTqWVXggSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=KCknuNOu; arc=fail smtp.client-ip=40.107.43.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qooQBXd8Sr+2S7SwxFlyOebbwMNR2LH9aAoodf8IXqR/3gSlDG+rUsB4HEh3rwi+kCXC3nsSrJZ+zIZyk27++HVPbWqDW5B/heRdru08/2Um+ec7H8lY7yfwyBYyztFqCKMIxYx4LOavIr8xek3BCfNNI9PNxuFZJKXQFkTzDZmWa+9eIw/0ZU1yKBOQVhYAz9hww6rXYby8Ts+Qhn5wkN8476ZDZJG/ee5kce66XxmsYZM2CiSG9GXX1NyYp3wjzNlCOQGXpmSA47LnF1JhVvkRYsPzcLXmCitJw1QTRogF4+qV5D46a9p9MIszNVbx7wfoX+sXuZdj0sDvhU2kuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AUQkMd0SX1yqaBHihLqisT/2AFPCmKVQe86/vRJCrc=;
 b=aX7JXW9PkhCZK71LsWzkfO4J9BLuYbXG7tFLxHuWNqAs3waGl0QPxInGM3Ph4/BOvSNcwtwoDNiIa0FnqaIyrku3LfTTXXW6ndNW9nqMTamw58qO4AkwN/0vb2NCvaGHob0iGL/y+2gbc9xdzdPFz4FmOXqbuThotWCEwtbMEgHVezCiuf31swFh/T4M61Ku7c09J26yf/G4mtAuIqXa5wbcTvQSSyFxB3121NFN7cIXBakmxXvovZWxlfW98tGHM1GdbLsoKcmxvClr/Lz45SrY9t06CbesHxqku2pS47SV+WNg+dtM1Nwaf6h8xiUcODA5ltlnG01sm4CaOJ0e7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AUQkMd0SX1yqaBHihLqisT/2AFPCmKVQe86/vRJCrc=;
 b=KCknuNOu9nrKK0Oi4gvZ6BSXJMiRel/NuBqtGNPIcUN7Y5QvJcrZloML4LLJm8g4+4GTUt2ehMP1fAO9+ACaGK3y65m/WhO/zxsFrrjl+XW8A4rt8j7qLkIc5gCgaN8EMe56vYSAHx/vZZL3zSaxSV903RSZJKvPisbKQNq0He0=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE1P216MB1799.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.19; Tue, 11 Feb 2025 01:58:41 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 01:58:40 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH 2/8] media: v4l2-common: Add YUV24 format info
Thread-Topic: [PATCH 2/8] media: v4l2-common: Add YUV24 format info
Thread-Index: AQHbe5s5mAjyqHnWzUmyawfBRh6HrrNAkPEAgADISVA=
Date: Tue, 11 Feb 2025 01:58:40 +0000
Message-ID:
 <SL2P216MB1246676258EE59256D3CDD31FBFD2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
 <20250210090725.4580-3-nas.chung@chipsnmedia.com>
 <20250210140002.rhhxn3z4l3dbyege@basti-TUXEDO-Book-XA1510>
In-Reply-To: <20250210140002.rhhxn3z4l3dbyege@basti-TUXEDO-Book-XA1510>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SE1P216MB1799:EE_
x-ms-office365-filtering-correlation-id: e70e1696-7549-479c-10e4-08dd4a3f9b77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?fj6o5/ZEn+IjsjVh2kNEpyL1dCZ2XR+KJ7LIwzAxZYfcGUQdZ4dPpLEQlyao?=
 =?us-ascii?Q?R8v/zKLy6oU4CF0Qx1jNfugR1JHzBoZsQXJcL+1blxS3RUoHowN74tVvPfF1?=
 =?us-ascii?Q?p02ZWqyNTW52zbQtDLNPirwAWRhdCjhmNO0Mia6+cJiytTATZyCEuHwAKVtd?=
 =?us-ascii?Q?XKIqLdDEwFKJz0BNUO418pQwLlBcRcUuoH0ucA3jDX6kF8gmzIsikMlX/tqo?=
 =?us-ascii?Q?lOoneelXqCmMg9eQo+1Qnd3cqDpC89liQWrrvQquD+T8ASAXwDLumjIv9GsZ?=
 =?us-ascii?Q?KoD7OVCnxGhwkOTPVi6JFqkkOqbtJtM0uJBGhQLln8pSXzr9nGFfGVTPWkq9?=
 =?us-ascii?Q?1RIvPXanB4he+av1rHaaBYNmhJZ7EXewIL7qMfSyYn4z7zez2b9m6x2gGdFM?=
 =?us-ascii?Q?9Ms+hvu4wVvSt/LVZ3Jr/B7PfAtGnWiZIU5OlcZg9VFo4761Egfv4eE50WYC?=
 =?us-ascii?Q?KIdh0ryRv/LqGLyq3UpyOB+TMu1Lv8aa3D+1NvM4begBCir+1xO2zygIUg6Q?=
 =?us-ascii?Q?NuY+H5Z52I0PtFlptTLVsWFIHoo/7EIJPpbv4DfePkP259RZIArHfIvyqNxA?=
 =?us-ascii?Q?GZ2zmufgU0aDHwn34T2xYeCIWN0UnKjqxYpwPNRk3VH04ezb0LdkDgj7ha3Z?=
 =?us-ascii?Q?IjuX9xWgXsRD4CIrzzaz03psV/LVhNypl5kifTQLrsRBT0KgEyMHiLzhvs4V?=
 =?us-ascii?Q?12KozIdpXnbVZWJGuCSA2dXos+ch4g03YCkgg1DCwgEYl/eqXZrD1j5pWNsX?=
 =?us-ascii?Q?cwcIw52Tk0gLZtCQgHc0oEt+mx1nvapECBByAvkPvD2SmWzQnRKo2kNM0wlb?=
 =?us-ascii?Q?ZWUElO7MUv6O8D4RXgTDVEbZbMhd7YyCY7nf+YpP8hanDOd8wcczOjY9H/VR?=
 =?us-ascii?Q?SeQSmUQBLyo7dbjTkd6uMtVcyHpx1N/XfgmWZ6E+jghvnj4C67c5rskAHYKu?=
 =?us-ascii?Q?ptRGMPgNuVu7I4gM0pqvwov042jL9EEgUh3r1/q9DF2FA7IQL17lpnWm1hmD?=
 =?us-ascii?Q?Nz0EuMFws0iRtBaHskud4+3Ek8d9lwoHzOxF00b2ELLWomK8SKfF9xD7d4bl?=
 =?us-ascii?Q?XOzJDM46k1pA/axq0RDvrriFuw+12YPPti9tO8bpR1QrHsHRdqG+HvuuxLQH?=
 =?us-ascii?Q?+jy2+8ArkSLVEF5HRanuEUqmhGfdpzXMxFDWOUm329rwVvGy36L+UdRMAG9j?=
 =?us-ascii?Q?jQEaBaKE45a0uBLkMwnNtAMrnXAKNqLD3Bv6GuSzweFvck3sNrYTk49QGAfS?=
 =?us-ascii?Q?W9dalMaKKTrFGCL6Y+BrtbPWv9R2SDkQJyGXzNNe2IAQjO3eZjAcwbNohbGR?=
 =?us-ascii?Q?hiMrZ6Ua+VJyp+zNZyBWIqGzM0h9haCPbH6XapskL4BkqcSUocQfOMD5zg3I?=
 =?us-ascii?Q?Kqai+WBTTJFhvLwTlycYoLh4ATK3lWR+l6Ag8TXzA4mA9W1wACqGtJpTRK/6?=
 =?us-ascii?Q?JwudeoYZlWdZnvfoCfAKlviHxZ32N65/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?EsSVkf/nbGkQpH0GybIxrLiaD+Cq2WOCizA9x/VQSwckfHOsVO3p4yYMBsAF?=
 =?us-ascii?Q?jdgKbNGBum0lX7cFv8N/k2ecTJm2ENyKFQDRudY2Y4cypZKOfKnFAB5xXMrZ?=
 =?us-ascii?Q?WR0gp5TjWUIXdmVVwR3uxEwwYW5KHnoN4LkCG3mq/jgLh8rOoy8ZLD1rqjoM?=
 =?us-ascii?Q?xVZcfCBc/YJALdi+0aTQxHA9DWnuJ//d57MP97YNyBIQFZNJo8/rmrh4EQAV?=
 =?us-ascii?Q?SGBsbAtaby/EDexjzQr9wSzpFQ+LcBaRzUHbHE1PTK+PYPiNY9EhynI4EYE4?=
 =?us-ascii?Q?HAT+tllinr3nBtdoDySKtI+7C69vFlEbUOv4pJ7JBvIXsLpLRH8SxwbQcezK?=
 =?us-ascii?Q?dozQB5A2eerjQgC25Jn5/HzQNJNdyVDeABUKpz0KwW1tKNbzixb9Np4mqjjk?=
 =?us-ascii?Q?VxHGcgytWwD1wXOah79zsJuIp8lBultiuDw7yxQsSspoHhgNIIIB+Mc1eLAB?=
 =?us-ascii?Q?aijnMPj7uXuLO5PYD7akpNtbNtfTifdkOUoWZ6GOIYLdQg1Pw3ahJasUpquM?=
 =?us-ascii?Q?W9thN1rVFWD7/u/mBHRsOhBtIxGP1+WreoXlnnfvtvNiK7IYmTVE7F3Zaxu4?=
 =?us-ascii?Q?jlujRMgDbmVmrBikWbQPgFl0nj/f98Eu5oN2qdQgScT1ocBL4Gn2FJm9MVRZ?=
 =?us-ascii?Q?FC4fuN66mMM4lLLSVmPIOf73HPk1stp7QITEKtIuPiJ0xWtAYJmWZ5Ja4UG2?=
 =?us-ascii?Q?fOkqgeHYUebRQvI7FEOeMEjulqfZwXE1M9OagvjlO9EddcK1ObY1PZ0u+Fag?=
 =?us-ascii?Q?3K/cUC/bYtcgjll/fAI+WJ/SgEVeLzfsShY88vY+CD9wrU5mq755BQOrzOL8?=
 =?us-ascii?Q?pPQA1eEkEeNpPcUEPr0RRwuN8k/QIfXVg1efNYtNRpYiuYPaaDRsmrrVWIA2?=
 =?us-ascii?Q?X6rguqrFa8lw6NcYDNR3I3LLgZJp+FtNb+rygjrBArCwGUb1cIDVyFuWEY/h?=
 =?us-ascii?Q?w1DasladUnYtj29cIRG0MiF5dYgMZz6QfAS4hhLzge0tkoTfYyI6S+ydRn05?=
 =?us-ascii?Q?zz0wztLEPcFryllF19BLIwW+uZHbRiIErLR3Y5YcPDvus0tYimCdIwIjIU3j?=
 =?us-ascii?Q?+hwBwy3EcUUbza7ht7kpNug+i28skI/jbeEbZL4yAvUvPL17NGk5rLsxhrYP?=
 =?us-ascii?Q?Zlc8zY1uPvFf3f1K7jlu2TzwwNloJJGMUapc3bcdzBgFN+Doba0D71vh1Hz2?=
 =?us-ascii?Q?A6WzW0Otv0ABcX+WIkgCCeS4SVbk8rfXH2w/BhenxQu3gg5nAJKcpQBjuuqj?=
 =?us-ascii?Q?z+BJhRhSWBoIr4jPLjiGuf7lrJrvtmUdEkoeeXAM1iHXSMdhLIvY7D+V0WxV?=
 =?us-ascii?Q?zpCdbfluJ1QVx+taFi9/H/3QBRXC6DUcoUBAp1ONcYP9iDUkarfWRl9u1PxC?=
 =?us-ascii?Q?MjjNPMjPPMrFSPfpPZmUK8O9w89O8MN5CoavvsXCC4kSs3QOQu3knLzpFgS7?=
 =?us-ascii?Q?A2+Cw/YDhSiK5qOuhZbpqbhga3DQL5umewdd9wyZQ81BeR7OXPw0HqZ5grxI?=
 =?us-ascii?Q?z0fj0o8FZp/z8g8tL4Tl9574RseQ/uYj8syjr32hOV078JSvL9ZofynNkqmZ?=
 =?us-ascii?Q?RfwZ8+T2W7l7GOOgV2vn9BX8XhTTe8DXKzHhWEmR?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e70e1696-7549-479c-10e4-08dd4a3f9b77
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 01:58:40.7843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CM5zSYM3IQfxNSFg2N4NIawJqGLCMHWMka17sQxwhFuRJNSZtvTIKXgsjTJO9eMFehiU3ei3omTMdhqKIEm13SBwyi7yYpkxlM4T4pAOBYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1799

Hi, Sebastian!

>-----Original Message-----
>From: Sebastian Fricke <sebastian.fricke@collabora.com>
>Sent: Monday, February 10, 2025 11:00 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@xs4all.nl; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org; linux-media@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-imx@nxp.co=
m;
>linux-arm-kernel@lists.infradead.org; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH 2/8] media: v4l2-common: Add YUV24 format info
>
>Hey Nas,
>
>On 10.02.2025 18:07, Nas Chung wrote:
>>The YUV24 format is missing an entry in the v4l2_format_info().
>>The YUV24 format is the packed YUV 4:4:4 formats with 8 bits
>>per component.
>>
>
>That means that 0376a51fbe5e1 was incomplete, I think you should add a
>fixes tag to this commit, to highlight that you basically complete the
>previous commit.

I agree. I will add the fixes tag in v2.

Thanks.
Nas.

>
>Regards,
>Sebastian
>
>>Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>>---
>> drivers/media/v4l2-core/v4l2-common.c | 1 +
>> 1 file changed, 1 insertion(+)
>>
>>diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-
>core/v4l2-common.c
>>index 0a2f4f0d0a07..de3636f1cdf1 100644
>>--- a/drivers/media/v4l2-core/v4l2-common.c
>>+++ b/drivers/media/v4l2-core/v4l2-common.c
>>@@ -269,6 +269,7 @@ const struct v4l2_format_info *v4l2_format_info(u32
>format)
>> 		{ .format =3D V4L2_PIX_FMT_Y212,    .pixel_enc =3D
>V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0=
, 0,
>0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
>> 		{ .format =3D V4L2_PIX_FMT_Y216,    .pixel_enc =3D
>V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0=
, 0,
>0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
>> 		{ .format =3D V4L2_PIX_FMT_YUV48_12, .pixel_enc =3D
>V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6, 0=
, 0,
>0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>>+		{ .format =3D V4L2_PIX_FMT_YUV24,   .pixel_enc =3D
>V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 3, 0=
, 0,
>0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>> 		{ .format =3D V4L2_PIX_FMT_MT2110T, .pixel_enc =3D
>V4L2_PIXEL_ENC_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 5, 1=
0, 0,
>0 }, .bpp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
>> 		  .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0, 0 }},
>> 		{ .format =3D V4L2_PIX_FMT_MT2110R, .pixel_enc =3D
>V4L2_PIXEL_ENC_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 5, 1=
0, 0,
>0 }, .bpp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
>>--
>>2.31.1
>>

