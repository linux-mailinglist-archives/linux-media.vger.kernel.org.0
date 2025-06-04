Return-Path: <linux-media+bounces-34067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C763ACE0F2
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 17:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0461172CC4
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 15:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F924291170;
	Wed,  4 Jun 2025 15:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="HAAxldwK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-0063e101.pphosted.com (mx07-0063e101.pphosted.com [205.220.184.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A839D4AEE0;
	Wed,  4 Jun 2025 15:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749049727; cv=fail; b=Ny363emvTcARYJXIbbyunhhn0semNMJMYwHf0IgMyW4VfwFTcM1y6f/boyYUQul+n5Ii55Po3McmwxCC81yFb5tqjpOYmK/4dwkiOWTct3S3tQS6i5SEnK/ndUfrcbbVzCsRoPuSL6f3VQh3kmkgY3Zni2XRE64tufq2hYw5Tbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749049727; c=relaxed/simple;
	bh=wDmS8zCfczDwnjERiicp4h0gICrljGBeMBR7kToAxA4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Mb5lTwgYKZy/bQId2Rsf0OSWrLqmGGqaLQpP6HVBCAnQoT05LR9rMZgXVhwcI7TKInKFU3jUGbYapkyXnLJ22sh8VOjNAWUHJC15LKyYr6vGUUgI+wbYODfa7CQ31oOUREhsFDQU8zlxut2q0BLLrjiCIGFtvzp1ueBxGpNU13U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=HAAxldwK; arc=fail smtp.client-ip=205.220.184.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Received: from pps.filterd (m0247495.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554EZ1hM000874;
	Wed, 4 Jun 2025 15:38:54 +0100
Received: from ma0pr01cu009.outbound.protection.outlook.com (mail-southindiaazon11020077.outbound.protection.outlook.com [52.101.227.77])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 471g84ryrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 15:38:53 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqMFXqXHHI4WhBlCjKD3NSc1RneZLAcFqLCw6HLEESz4rjz+EdEyxY5lV5+Am/S+TZFjypU2syzF00ZSELixa+/3V994hDb0TBPKzKoMQnK3tcWgHcma0MuIiyfB43r127fguBiGqIIHbdUX1R8dsVmG9JDOZAo3oGvRz/xGvUziFjoY2XOekiEvXUOSZgmk/oXQMDLRftChuMN9NSKXZ69uMdwgiWEHKfsdspoiVImEdbLJAdpEXMY+OtSN07i1kN+PQEccPM+w39UZ4yRIhSJdfv1YWfpv+89Tibe5jObwYu70Gha/nCtQVazOyk8s0dJlU3ms1jv+y0+xtexF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moilq9Y05sizS9NAZ0VRHG1o7AM1VJ3f8pur4CW3ZMQ=;
 b=upQNWMyJt8ku+BAkGdCXISS1lgvHUMGvFrnXaG/YLCt6W9thgbw1REIW5Prc0oFlfbJvSgFMZ5+qIc9ASBCkOTjFs85wIG2uH0TN31Sl+opt5lQEVxJmiqgJ28EMp9MvnMLRbSNT2/HAHzg/1tzxODM4IMvETsfj0e19EK96n1K0pGehZ62UoxOn36fpWCmnJwBIda6J40pBeY93EWt1xqv8TkgeaCyvW0ywJvvwtVmBUW41lbt8+4WhGkDAhhYnhunx/Abl7mig08b4au5ZaPwXRU845hTt46oY3NRowbiRHMnGNCubXuMwcraf3Hz0gugT8RLBgt42H1J7g5B4iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moilq9Y05sizS9NAZ0VRHG1o7AM1VJ3f8pur4CW3ZMQ=;
 b=HAAxldwKntnDgZKa1TeMjCT4ofrG31NLfwXM2Os/Vz0xhP35XKIsJ3UvU/2T18tFphF9oEFPM02DuiFZj4NmNupOcrIKwh8kemb17HtnQOokEk1HVXgH8ceRyjxK7B92QTAhWsOGo8yPX19wqtD7LtMRVlr2IozxdYVBSIXuznc=
Received: from PN2PPF1CBE88495.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04:1::18c) by PN3PR01MB6854.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:94::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 14:38:48 +0000
Received: from PN2PPF1CBE88495.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9f58:e643:db9:bf05]) by PN2PPF1CBE88495.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9f58:e643:db9:bf05%5]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 14:38:48 +0000
From: James Cowgill <james.cowgill@blaize.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC: James Cowgill <james.cowgill@blaize.com>,
        "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] media: v4l2-ctrls: Fix H264 SEPARATE_COLOUR_PLANE check
Thread-Topic: [PATCH] media: v4l2-ctrls: Fix H264 SEPARATE_COLOUR_PLANE check
Thread-Index: AQHb1V5icDj128sCiU+oNBnI7Of2nw==
Date: Wed, 4 Jun 2025 14:38:48 +0000
Message-ID: <20250604143552.2955475-1-james.cowgill@blaize.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN2PPF1CBE88495:EE_|PN3PR01MB6854:EE_
x-ms-office365-filtering-correlation-id: 8690903a-489f-47e2-377f-08dda3758485
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?6N7kdNp3G6pC0v74qpexGAgnIQBfBputHkvuYRcd+VCm8aK12v4XfSSu4e?=
 =?iso-8859-1?Q?z5AG0TNYNpL5K54GvCT4ggBj8Hn2rkozcqyEqWPyG4ERQhqpg8jNEdpOUA?=
 =?iso-8859-1?Q?JtQoF1Dtco8ektwXuzG0vLSO38zzrLtraHQmSAi8xrILnFx4hxXQd9hXTn?=
 =?iso-8859-1?Q?PA2hPRkVoqAXqTEK3yPa7e9ehpa1PCchZFIDTsGPYOgDFaalfUcG/Wboqo?=
 =?iso-8859-1?Q?hekOuzY9dcJQsFdlqeinYHiSXY6G46qZ7wuDU5+LK5scKhkKJDFKmv+ZQp?=
 =?iso-8859-1?Q?cMqCr5UG0uwbSgYIdcARbwn+Mtr+/KsPupdxy8EZklr3ivaB/S79G+zhEt?=
 =?iso-8859-1?Q?2QCA8jAN8gZ1VuS13LcLkoysm0WyhbZ6t9+pZODCzVW0q4PE13F3NxGcPi?=
 =?iso-8859-1?Q?kn2dfQI0Zk76sX4XvSXPLajZh6oG6PoXLv2xipFxExxTA0nEOhbkdRdRJO?=
 =?iso-8859-1?Q?awYx6I9rf/StTYxrWUTG6RohHJPkH6tg9EhMAiT0uWhoFbsGpQvlFwTRmS?=
 =?iso-8859-1?Q?HJM5UFvjNrS89nsDx+K8V5mG3ThBdZeA8Oj6MmbumwUW+X6lffbF+832TS?=
 =?iso-8859-1?Q?qgRqMN0WZRa2LxHN3vxwJu+zgTFmjs7Cpe1zKSpWD7hqOvcGp5GwQeVbWD?=
 =?iso-8859-1?Q?IDIx0Bn99PkgcFK8FzMC9nZBFsPwAQuOIyJNDycnmZ53WigMpYTDAzTLd8?=
 =?iso-8859-1?Q?mthlpODK08Qkn9YdoG2KcTHhLrHmIXqKa8PTA3QLc4fIfCZmideEIhZ2IY?=
 =?iso-8859-1?Q?9IfOsLbnRmRqVQ3A/xKXAqEsn81BfTVAasxwQdtuMnsvRVdQ9DWJ97zhuS?=
 =?iso-8859-1?Q?B+y7XEecujBPukhAiXK3IRn/whC16Sw7oLnfTRkgrbH0M79T0GrlA68Vys?=
 =?iso-8859-1?Q?KNypBm0ESAWtd6BpKsGijPwU1ALUqb7BrWT6tryqfADvTH0wfBp3fl9NyQ?=
 =?iso-8859-1?Q?fY/fhjnVRKB+FGW5b/xsUWKJKtHCNc3vpZtXgCL+WSC1eiKFmm/Nx8mizh?=
 =?iso-8859-1?Q?nmP21CNjqAsDtoRkUyLFePoFKVxTmSMAHzqhflkaVWbl1L8Vi+dzp4ukt4?=
 =?iso-8859-1?Q?m2ODwsMqv2zXNtA4kV7aUKk0HdaXiGUWgr+aeyw6Ed2xek82tB6uYKb80f?=
 =?iso-8859-1?Q?L4JMGW+gOn2cwElMEepUZ7XO+Qg1VbmMQo+fILysFanA9agLBUf/+fvdkI?=
 =?iso-8859-1?Q?dU8Xl3bkdKfyR1Ny1RvYLjqwIg2rP63C1LkHSPYszxx48XVLhJpRzbAjIw?=
 =?iso-8859-1?Q?hIrKyT+GOGFTI3zIiremNiM+TyoS538P9RzLMG/gghxH37JC8QufkNZZh/?=
 =?iso-8859-1?Q?QJjYTDDIfLCukVSk3L+a1IvWnKL4c4wmYwb+Jv7PxcymqUm5qpHwnGPzti?=
 =?iso-8859-1?Q?7JprCoEqOFrR2D2cw1ydL8m+rCmN18LUe1C6r96H/3aL9spts1P30FgT32?=
 =?iso-8859-1?Q?WIDYrpumcgEAdprtGbAl+/M1tjbAcRL5xwJLRRcvBw8PK77+SaPMHEeWUD?=
 =?iso-8859-1?Q?Wn+e+lpRrgQoaJPXv3d22ypMnRD8yzBw0i3/iQ87Ib07w4s8Potjl0Zraz?=
 =?iso-8859-1?Q?qFPfWpk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PPF1CBE88495.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Od5D8okchfUl3yGSiOn0A6RXNtUyheFE7Ts/4fYC1TMhwtMNz/BeHtgHJq?=
 =?iso-8859-1?Q?AUo/XV9TIKj2ryl/72CaqohoLujGonVIx3N7nRu9Li3uJm0mnQKv+Qn8Jo?=
 =?iso-8859-1?Q?n2YhhfdiiwncD05NJM9+rcQ/ev0MMqXP2eQyfq3p/vcnH/bf6U+2G89QLE?=
 =?iso-8859-1?Q?NoKpBoCPClrckoWwdLWIAtW2SEx0SPH09TZSBRunV1Dgh9ltFuImAgdZZf?=
 =?iso-8859-1?Q?1tqLLl7SSxjdDdrjS+x/Iu7/4Rmth7bSE2GIK9xLtF4WYHrtt+lG8WfL/R?=
 =?iso-8859-1?Q?JO1GHqRscIuSME7cDdtHEf4QIa4OJdY/vPSNcXHwoJfEtUzBHZMzMIS2MS?=
 =?iso-8859-1?Q?ILqW4fAYWk0hIk0p1xGJzPzhwvgg5sTz+ZJ+Cj6RcoII5AIVWADBpuEb7U?=
 =?iso-8859-1?Q?ZSafYtHuqPb5gwHarYEyFjeAR51GCYz1eqezCA22YNTADifPy2rNvcyyKZ?=
 =?iso-8859-1?Q?ZfqrfJ93Jc1s4BX5A/cYsq4GeB2Y71sp6fz3s20gjbX4KEYhWqxYuI++jv?=
 =?iso-8859-1?Q?FK3sVUR0q0Ye++YNb6sRL1jXGHpqWzi0pX4SuXrxZy0KQpVDlp9qO++fRN?=
 =?iso-8859-1?Q?LnO8Q7ohXwiWslsZo5KJBzqDXNkjrwYaRUkqaXvhnq3aNSz1EgO3MvSiAq?=
 =?iso-8859-1?Q?pGu63WJv+8NkApOJTt6EIbTwzS1yqOTvO3mSo7CMzOI3ACMNeS6N4Bnoob?=
 =?iso-8859-1?Q?JaKlNkgPmu6OzJkHzDlzMA0hUFJTmGdeZWtqvaBUlzK2lJXF1DoM895w3v?=
 =?iso-8859-1?Q?RFJtQoQPo+74oKHLbEV1yRiDJHwEoJTWOlcB11OG8UmWPCU8EbytdF9vGD?=
 =?iso-8859-1?Q?qb3YiQISJJ1nNz4VTL6phnVtT+W3AVsj5ie9DkgzeRjTIcA9rHe5BvuKms?=
 =?iso-8859-1?Q?wVpTQ97fjpF5K2ccY6yOht6D+M9qsUoqEf31zoFn6IiLE0BBNRoxnSB+SG?=
 =?iso-8859-1?Q?U5gKdmznXLxrt6+A8wIs5G1lRfwazdrzz28FMmw6IZmurUt72kIy6VsD2F?=
 =?iso-8859-1?Q?E+GVjB+dJI2BPL20hYxn+H/YVEz95h5YZcr7L1NpEaLrY0RrCUrSgWihf6?=
 =?iso-8859-1?Q?bHzF65/6sfi4KsVInwKpVQkfvvGZBNV9x7Zd+GdXEOZ8a6Xge/w3eNXJN8?=
 =?iso-8859-1?Q?ax7Me4GSiGnRZXKmxPsoJPLKat/zdYs4fuAT4lZTLmU3+G8SboQexm226T?=
 =?iso-8859-1?Q?yIbfEUi6zQV5lWiTJxwXK5JOmT0ys0Jwy8ZAG1dB9l2A8JPXATduR2pWEn?=
 =?iso-8859-1?Q?mJw4yWFEtaFB4jujydIGRCr7B4mRBqYGHEBsFFevm5zOFs80XI/oKnyPcD?=
 =?iso-8859-1?Q?hF3frmmQvciDlTLziBT13aVy2Ey3SdXO+bQFOF6DGaF2R6Rdg1Bc2CY74n?=
 =?iso-8859-1?Q?XDRyMhIQhTmnTfzWqPwGbweNhJYo1wJH0z0tMq5N05mZEoy2wgh1xkde2d?=
 =?iso-8859-1?Q?BuO9ZWrzjA/wkc5gMlDy8u9rBSDs6XAc/neJCQQ4dL4uF4mkp/1uwvbeNz?=
 =?iso-8859-1?Q?jtXWIhi4WPKp6SWf+/UgaRP78PccHB8Cmny1sNvt5S5m9E9MafzfpG4x9i?=
 =?iso-8859-1?Q?Bs01o9OUDad4LlDvXLpA3vOxG9+nVp9jNy+scPa/j04xUjFqhETGHTmTta?=
 =?iso-8859-1?Q?Ke7FDX7UuSxjbEM7WL4PYLE0H4fbukXfbC?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN2PPF1CBE88495.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8690903a-489f-47e2-377f-08dda3758485
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 14:38:48.6042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ScVeOGTTFaLXoUp3T6vJkw2/CUFILyl1ukuyyotrnvW/fgS671a7yXBB/dzJJ85ZjufrrLJEsCjNzI/9tku5i8ehj69jsKi4xVPtpafOo0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6854
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDExMCBTYWx0ZWRfXwY8AW8jtrXRU Us82S773SHKnLgvOU6Kgmv6g4Q6CfvgGOIxXWmmks5KEXEwGRX6fj+znvl5m0NPQy/fxuq+oubh QpDtgqMI484/Q1YGXuUthOAfu+SH8Qfst0rBwvvKideYHTpGcaJuPhQQoZeFC+UkAsodGC8fsUo
 jNr8fz8S5AWlCih5lPlDHxitNOlBDowIbJhX0tPkRLvYXcPhAB5VrWnEpdvSRopxrpBzrrWFRKo WqGq13dkKDzpbuBRcx4DfmxLSWpLJ4v3eA5pdGKQP7zpawXwwn0AIfkXCp4iL48Z1TDfa+tNOv5 6Uvaj1eD1buyX+e56xPqGapQiSRnz01GMEKfImgqupw97GBypUU4+5YCvrpyirih3ooNRP6A7ru
 ByJ8YDGo5dJD4KVXwmRH9MTvK9wqQjHl6tY0WmBgnwquaKCuk3NEVE34tEJCbBpipeX3sdtz
X-Proofpoint-ORIG-GUID: LtaVn95dK6J7lhP2pHtiZYah8D-qRHmC
X-Proofpoint-GUID: LtaVn95dK6J7lhP2pHtiZYah8D-qRHmC
X-Authority-Analysis: v=2.4 cv=F8dXdrhN c=1 sm=1 tr=0 ts=68405a7e cx=c_pps a=wumSa4maZRB894EJd4BJhA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6IFa9wvqVegA:10 a=-5LYVjoNHPMA:10 a=SrsycIMJAAAA:8 a=cq-ErjrRQvP8vrIkj8YA:9 a=wPNLvfGTeEIA:10 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Reason: orgsafe

The `separate_colour_plane_flag` element is only present in the SPS if
`chroma_format_idc =3D=3D 3`, so the corresponding flag should be disabled
whenever that is not the case and not just on profiles where
`chroma_format_idc` is not present.

Fixes: b32e48503df0 ("media: controls: Validate H264 stateless controls")
Signed-off-by: James Cowgill <james.cowgill@blaize.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2=
-core/v4l2-ctrls-core.c
index 90d25329661e..b45809a82f9a 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -968,12 +968,12 @@ static int std_validate_compound(const struct v4l2_ct=
rl *ctrl, u32 idx,
=20
 			p_h264_sps->flags &=3D
 				~V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS;
-
-			if (p_h264_sps->chroma_format_idc < 3)
-				p_h264_sps->flags &=3D
-					~V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE;
 		}
=20
+		if (p_h264_sps->chroma_format_idc < 3)
+			p_h264_sps->flags &=3D
+				~V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE;
+
 		if (p_h264_sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY)
 			p_h264_sps->flags &=3D
 				~V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD;
--=20
2.49.0


