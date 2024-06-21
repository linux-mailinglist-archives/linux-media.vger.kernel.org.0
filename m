Return-Path: <linux-media+bounces-13877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F139117BD
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 02:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D46F1C225F6
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 00:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073691C2D;
	Fri, 21 Jun 2024 00:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="S6QDTZRA"
X-Original-To: linux-media@vger.kernel.org
Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-sl2kor01on2092.outbound.protection.outlook.com [40.107.129.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EB51C14;
	Fri, 21 Jun 2024 00:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.129.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718929870; cv=fail; b=klAHmrcNXEp9iRLm+dzHF6Tn+xniKD60VBXjER5gVmGCQRB9q3flIoIYOqMSCZ2SQYr2js1f8G8iF24gN1DezfUxQcgwa5ZCXNvQFXusUyVKjujHNSbTJbnRXcbNtVFYmzJAV8X6KTXgDA9k1+HdMhYM1VCntvPIzuty8cR8Hcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718929870; c=relaxed/simple;
	bh=42ONsGjAlteM4dKSN4zTmN60roEjQYzYBMZmXXOd09M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FlkOQRApv5b1cWJHNdXoMgKKvaOiKvmBVvrcUkPLy4dQynDZzIaLdI/tyA27s3iztZGTCkNNeA86GSVUthQZGxxlpK4HLq4S5AFoKDxuvYM0Sstc23B7tN99SMloDvqbliALfSrshmozKymIYN1yAQ4CivxUxJxJzUAM2Aq9in4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=S6QDTZRA; arc=fail smtp.client-ip=40.107.129.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWiKVEWDtSEIIeC47+jmNC/eFLATaGJOHu0RstNn4iu8CqqVMiBfIo+Z7aR2+oWFMo+TsZXGHv3kS6DE2+hyEY2GAW+K7/a9QPCtt48X6syUkN0qeLm9ce8ZIeb+qoBRo5PmiL3kdnF44f1Z4rkltNUPkPGbIUjLmhe7HTg6EapwmOFRW0IZ/zcijzkaQXAmwBMrdU6qDNK2iy295wYcuPrNPF3Yh5xodZG0DSK0KEWNZlpE7JBSC7sH1dZiAUfgIpdVOpPUs7PRcq0+MX/HUb5/fFmp8kOQSwXUHQKCX5NVaxb4HccaCu+OvRN3mZd9pCduA5V3ud3rI0KLpq75+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42ONsGjAlteM4dKSN4zTmN60roEjQYzYBMZmXXOd09M=;
 b=m7brgigO/hEO3fkzRotVJJsbJRrq3T1P4C4nk2JLfsB8y4Jlpcn4pKaCxH1DoggiQbuSK+StKS5FS9pY+Me1O7Mc1F26bjByRMcy8HCjJmdjnPImd6qnZ4Ezd2eMuq8mOahhGFNKqpIWNhHwzZGL5wy92oQZtLA7jl/cHX5eFv3Vrhr/aVVbxm5zHW0Z3HCRz3+4Y8SsCddYcTqXJaGcLmv5Wh+Wrz8hiqQ1X+8jg+yfouy79LSYV41rXN6Ul0rJMUsXr+z97La87964A21geE+4RaZcR6O4xXHcbNTbNAe01VPNUkch6optKfHf1/V21wfNC4HmpVtfNgScA7pU4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42ONsGjAlteM4dKSN4zTmN60roEjQYzYBMZmXXOd09M=;
 b=S6QDTZRAexUqpmbXsS+Exuv9MXbYF3GqCAerffNbgo8j3nLGa1y+uRBSDujL54osouo+k/TQTlqyiZBg18yDT0uJrpYM/pBi4Rute4Pu32ni9JYAyRN8rWW5zHXEuhhH6SbwGuvgOd8z0Rzz112ix5cyczdPD7zxJMpeQvmtBv4=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB1679.KORP216.PROD.OUTLOOK.COM (2603:1096:101:100::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.23; Fri, 21 Jun 2024 00:30:59 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 00:30:59 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Devarsh Thakkar
	<devarsht@ti.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>,
	"b-brnich@ti.com" <b-brnich@ti.com>, "Luthra, Jai" <j-luthra@ti.com>, Vibhore
	<vibhore@ti.com>, Dhruva Gole <d-gole@ti.com>, Aradhya <a-bhatia1@ti.com>,
	"Raghavendra, Vignesh" <vigneshr@ti.com>
Subject: RE: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support runtime
 suspend/resume
Thread-Topic: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support runtime
 suspend/resume
Thread-Index:
 AQHawKPhLOcR91s1hkK9DSaFUGSwxrHPD/CAgAC0SbCAAATQUIAAoAiAgABLagCAAAQsAIAANdIAgAB0nSA=
Date: Fri, 21 Jun 2024 00:30:59 +0000
Message-ID:
 <SE1P216MB13033A129DF3DF878ECD4F85EDC92@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
	 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
	 <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
	 <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <SE1P216MB130382374B76CD8BC9FFCFE5EDC82@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <881dcea1-a592-4506-083a-9d5f3c6a8781@ti.com>
	 <b2f7552d37075538e22640f7b42838d29d3f8b3e.camel@collabora.com>
	 <e901967f-59df-f4b0-de51-61e542c04161@ti.com>
 <07d56a690d5fed16082e73c5565b67777e31494a.camel@collabora.com>
In-Reply-To: <07d56a690d5fed16082e73c5565b67777e31494a.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SL2P216MB1679:EE_
x-ms-office365-filtering-correlation-id: 475c540d-e20a-4d17-c8da-08dc91896c4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|1800799021|376011|7416011|366013|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?MjdGMEp4RnBMV0FXYTBxOS9xU2tsSmNmRlJFOGI1N0RnYlpxWTlpRmJOSUVQ?=
 =?utf-8?B?WktiQ3ZFZlAzUDdITHY2Z3JqcVgwaW1XK0RPRVd3S0ZiNFV3QkRnWHVDTC84?=
 =?utf-8?B?SnAzMzltMk52MEhkZDZZNzZBU1BkT1B4MjkxUENvczgxQTZObjRUZVlXQVdN?=
 =?utf-8?B?L0lMdGtja0VZdllRbko0VFJicUsveiswc2hlUnZ5TWdwcnI3YmJsZVFoTm1J?=
 =?utf-8?B?QjVQNHVlZVM5Qkl6VWJPUlFoNlRjV244Ty9NZVZNWHVBY0RLWGRnNVRtNWgy?=
 =?utf-8?B?TzdqblNDVE9ZVW1QVE1BUFliSi9ldFRISS85elZLUUZZOUhLTWVCU0ZKVVBt?=
 =?utf-8?B?V3h0OStGaGpiNnA0K2pQS3EzeUZhZk04VTdScThPaThhWXV1SUFQbDRoWkVW?=
 =?utf-8?B?TjRIeEpDK2I3VHcvS0thMVNyU0J6ZndXbDdZQ21wSm8vMHZ2MFloVWdOVGRy?=
 =?utf-8?B?YVFCdkhLN3hDUmxrYmFtOWJXNzVma2YrOEQ5TVBxN2t1WG54MExHL2V6ZHlo?=
 =?utf-8?B?cCtRRUJvbURGYnVMRENML2hvZlltUjFGTGtKL0pqT0RBOXJrNkNLYXJ5aTNJ?=
 =?utf-8?B?aXRqU2k3c3RZNURtWitJME1Ua05KZ2NJaWdLc1plRWtwV1k0aTJtOExWWVNL?=
 =?utf-8?B?SkZkSVFxaElMUnpQSm1Vb2R4Y0Q0RG5PM0ZsVUE0MC9sMFVvaFVEK05JQTNQ?=
 =?utf-8?B?SU1uVW9ZbmZOQlZ3UTMxRUk4VGY5Ky9DeUVaZ2xtbVFtdW5OWU1rT1ZMblYv?=
 =?utf-8?B?N0x4SXpDR2FzUnkxc2h1cVdUMTQ3RnZSNjE0SCs5NU9WRmZ3TXVnZUk3Ujk2?=
 =?utf-8?B?dmo4U3dZdHFjN1JFaXd1amdZUUIxV1hxVVE4Ryt5S1c5VVBDUHA1OU5oMEV1?=
 =?utf-8?B?WXR4YkNUbVB6cG9maGRBUkZ5bDRremx0VkZidk44bXlrdEFaYzlodDFCcHor?=
 =?utf-8?B?U0xqb2NQZzlaRUZmSWNMTUprUmdzaFNIZHU4MksxUDgvTUFhVU12by92dytC?=
 =?utf-8?B?cWZvcUIwNzhwTVg5ZzVWT2hraW5yek9xcUpiaXlTano1eHQ3UkgyeGVuUVB2?=
 =?utf-8?B?V3U3ZGlOOVBId0gyNHFGNCtOUkFMdldtRXZCRDRPZHRaQ0ozR2RTMmFadUZG?=
 =?utf-8?B?V1oyWmRxZW5IUE9LcXNhRjRSQkhaTjIzdm5qM2U5Zmh6ODNXSWIvWnEzbGlC?=
 =?utf-8?B?d254alBDUlZlaVhuYlhsYnAvRll5WGF5UzA5Z3gvdzZYb2poOC80V2xuTjgz?=
 =?utf-8?B?R1dINTlRNmIvMEpRSm9iT1F1SlAyTSs0aytZZ0RWL3JFVEVZVUp0OE9KcG9Y?=
 =?utf-8?B?cEJGM1kxZlk0WTdQNktKV0Z3T2NLVG5kWmhtWlVJc21kTGs1bnNVaE1BWTRt?=
 =?utf-8?B?dnFvZmVuZFdkdklHakh3VmxtU1BGT2ZyVkZVcjFncmdRQnp0VHVWUTA3UHg0?=
 =?utf-8?B?OHFFNi9uWDA0SlE1ZDNmYzR1UjFtWE93MzFwZ1c2dExBLzE2aGNLVE9vbTBT?=
 =?utf-8?B?R3d3OERMK3Y4K1pobjV4Vmd2Z2x1RmdYUTJxeWpmQUYxOWcyQ1pialRGU3Fk?=
 =?utf-8?B?MVZQMDhzNnIycUpUMzg5YVJNaEJ4RzFkL09sSkNHRmloc2tiTHcrd2ExNGg4?=
 =?utf-8?B?RHJHQ0RpZmlyZkdzaEovRmlFMlgyc0FXL2tWN2VmdXBoSjZsS3lwbVBnTlhn?=
 =?utf-8?B?QzNsdzdONGNMOEJ1enhwTzlMbkFiZDNGUkdDbUFUdjZ2T0h0WTVwSjRMUDB1?=
 =?utf-8?Q?6BKpwfTQXUTvtxvejDikwb1w8a1YYh7kffnbudo?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(7416011)(366013)(38070700015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MER2aG81eElSV28xVWtRUUtTWlpObllwSXFOQ1U3ODUxTWZLb2VjUW9GTUxK?=
 =?utf-8?B?bHRQTVhKdG9jS2pUY3lSZWZMc1VJQkpCenJxa2lXaVdobVZVaVI3bWlYMEdw?=
 =?utf-8?B?Q0U1dzhva3lhVXVqVHlLQnEwdGFLaHI0VGlsYUt1MGxTbEVML2pJWkZGM0hk?=
 =?utf-8?B?OHJjcU1uTjIzWTU5TCtpa09ZaTRmcGU3cnl2L2FCTnlJT3RBVWRpd0tBczVq?=
 =?utf-8?B?YXBlOTVwYnVWaG43NXRtc1BvcW5PS1JDU2JiQ2xNMi9Uam1CSEE4TW1MMy9p?=
 =?utf-8?B?NWFLa1R1WkwrUXh4SHkzNTZkSFM4OG5wUURDNWV1dHdZNWhXMHBFRzArRC9s?=
 =?utf-8?B?VHhPeG5hdFJCUldNYWxwTGJSVFJpUGcvTE1tbTExZzF3K1M5b2NzZlJteFBM?=
 =?utf-8?B?UWtKVGpRNmJRdDh0aWZHdFFXNFVjRFB3R0RmREdiVmVWYm9aYzM4akF6d3BG?=
 =?utf-8?B?T0tsWlMyMWN4TEViUlBHMmpJTldVd3p3WDA4VkMvMFV3bnRVVjAwcncwYVJk?=
 =?utf-8?B?YnI4WVBydm9FcHpHTUZZOFZPQVE1UEpzMHlHWGZpVG0zNkRLeUtCblM5RWJP?=
 =?utf-8?B?emRkZWdQVFNrTFdLZVg2LzFoakpIa3hrVC8xYjN1RDVzVTlUNUJVS2V1dUgy?=
 =?utf-8?B?WjJYUXR2Y2tpclpBZU1nUS9wU3kxTGVMTXlRd3NFQkwvL1ZDcWJVQnFBeFpC?=
 =?utf-8?B?d05Ma2dmaWlZUGZBNnBqRGdhNGgyRE5YMXRSa1ZScjlWdTdGL3dIM3BWcjVt?=
 =?utf-8?B?VXVCS1owMVZicVRUdFhVK0pCeVBkNEtQVTRjSENFSDZ3akJORitPTU9NcTBO?=
 =?utf-8?B?Qm1vMTdrSVg2TWpLcHBoY284VjZObkdTNmJhR240MHpEcGFLQjRiZllzZDZz?=
 =?utf-8?B?QjFaUnNGUzRocktGSUxxSW1JMEJJR3M3UjNQbkR3VVRkZW1hbnV4QzBZaThR?=
 =?utf-8?B?ejEweERxT1JjeEdhQi91V1dTQkRZSmFOdVUwOGtSTDdKL00wcUVFZzVXTzlu?=
 =?utf-8?B?MTFxRW5ma0FDNi9ZSktib1J3V0txZ3dmQ2ZrQW9MeWdrQWtBUTFhdHQzS2Vi?=
 =?utf-8?B?aUsvaE80V01OTjhnTmlSazhxUUlXSXplelBUU1UxSHRzYWVseXVRa0VFTXpE?=
 =?utf-8?B?WVRvcDlmeVFTbTZlYnNwVzZZNUk5YTRxdjdPOEcwVldmU3ljV2o1Q3puckZy?=
 =?utf-8?B?WTRIUmJRLzE3clBPcFZtSVdueDlQZzlzUkc1WTNKSWN3aVlocjl4Y0x4VFVP?=
 =?utf-8?B?UTVDVGhmM0hsQTZFYkZxcHdQdUpzOG5XYVprakhnUWRxdFBwYUs5ZEVKdHdI?=
 =?utf-8?B?ek83akNlYkRUdDlieSs4aEpubXpvQ2o5RWsyZHlRNFgyOXpQVndzc2JDazVM?=
 =?utf-8?B?M1ZhamduUm8vL0hPOHo0c1ljcW1LZkhONDlDajBKY3pFTTM1NWJWYTR2WWxz?=
 =?utf-8?B?dERkdlM2ck0weFlRUy9KaWc5SXl5MEl6Y05FQ2x6V3lkQXN5bGdyRzhUWi9h?=
 =?utf-8?B?cmJVQmozLzVvZkZDbktNNmQvN0RpN1BnSlNTQlo3Z29PNXNjdDR5Y1ZNN28y?=
 =?utf-8?B?d1hNbTRGZmdYbmNIL3FSSjlNSDEvbXNrMnJkMldJVmZwVlo5UHdzelNxdUJE?=
 =?utf-8?B?YlcreWdwTnQwQ2NSWlhQcFJLeDAzMU9CdjJXcWVxNVlNcGJLdHF6aXhCcEtX?=
 =?utf-8?B?MFNwTGZYK0xPeE90SkJwMGxYQVNkWDJLRVpTdjgrVTgwQmwrcFVpZG5KQWhT?=
 =?utf-8?B?STRxVXlIVDk4em5LMkZIVllGOUNLK0lSWUZNQlBkSlVMUGlpOWp1anQ4dzY5?=
 =?utf-8?B?L1pKK3QvS2E2bXdsYStuWHBTRE5qU09VNVNuaGFVYnpyRGxZWHRlcUg2MXZC?=
 =?utf-8?B?Mk1Ga1lpUXgwQysvcnh2SGxaRW9oemNQeG15MUlOT2JZbnBuU3Y1YjRmaEhM?=
 =?utf-8?B?RlRHUTlNeC9oSTkvYUpnUEdPaGZYRTNnQ1FCYlNXSEFGYnVLVytNcDhSdWUx?=
 =?utf-8?B?eGxhenVWemZudlpYL2tJd3B4T0syVFpvc1hFRHJPak9LYkcyUmtCYXhkajJy?=
 =?utf-8?B?ME5LMWhNY2NYUmJTVGpiTGdRc1hVTFExK24ya0c0bi85TnNiUThXNTl5a0Rl?=
 =?utf-8?B?VDY0emJjYjU1M0RBZkIrQ20ySnRlcHBxVWJaM2hZR3hlNjlQZkRnYzNQekl1?=
 =?utf-8?B?NXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 475c540d-e20a-4d17-c8da-08dc91896c4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 00:30:59.3406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8qlyvQVpa3pOtnzImp6A03hh24OqFHYHrpaDbIHiD2ByXfA2ufNschnyvzN3nHwsPV7aT55XNPwziD2NGiPhSWNlBir61R6YKpmc1HZgmdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1679

SGkgTmljb2xhcyAvIERldmFyc2gNCg0KDQpUaGVyZSBhcmUgbG90cyBvZiBtYWlsIHRocmVhZCBp
biB0aGUgbG9vcCwgSSBoYXZlIGNvbmZ1c2lvbi4NCkknZCBsaWtlIHRvIG1ha2UgY2hlY2stdXAg
bGlzdCBmb3IgdGhlICJTdXBwb3J0IHJ1bnRpbWUgc3VzcGVuZC9yZXN1bWUiIHBhdGNoLg0KDQox
LiBQcm9maWxpbmcgcmVzdW1lIGxhdGVuY3kNCjIuIGFmdGVyIHRoYXQsIGFkanVzdGluZyB0aGUg
dGltZS4NCg0KVGhlIHBhdGNoIHNldCBpcyBva2F5IGV4Y2VwdCB0aGUgYWJvdmUgdGhpbmcuID8N
Cg0KVGhhbmtzLg0KSmFja3Nvbg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPg0K
PiBTZW50OiBGcmlkYXksIEp1bmUgMjEsIDIwMjQgMjozMyBBTQ0KPiBUbzogRGV2YXJzaCBUaGFr
a2FyIDxkZXZhcnNodEB0aS5jb20+OyBqYWNrc29uLmxlZQ0KPiA8amFja3Nvbi5sZWVAY2hpcHNu
bWVkaWEuY29tPjsgbWNoZWhhYkBrZXJuZWwub3JnOw0KPiBzZWJhc3RpYW4uZnJpY2tlQGNvbGxh
Ym9yYS5jb20NCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsNCj4gaHZlcmt1aWxAeHM0YWxsLm5sOyBOYXMgQ2h1bmcgPG5hcy5j
aHVuZ0BjaGlwc25tZWRpYS5jb20+OyBsYWZsZXkua2ltDQo+IDxsYWZsZXkua2ltQGNoaXBzbm1l
ZGlhLmNvbT47IGItYnJuaWNoQHRpLmNvbTsgTHV0aHJhLCBKYWkgPGotbHV0aHJhQHRpLmNvbT47
DQo+IFZpYmhvcmUgPHZpYmhvcmVAdGkuY29tPjsgRGhydXZhIEdvbGUgPGQtZ29sZUB0aS5jb20+
OyBBcmFkaHlhIDxhLQ0KPiBiaGF0aWExQHRpLmNvbT47IFJhZ2hhdmVuZHJhLCBWaWduZXNoIDx2
aWduZXNockB0aS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUkVTRU5EIFBBVENIIHY2IDIvNF0gbWVk
aWE6IGNoaXBzLW1lZGlhOiB3YXZlNTogU3VwcG9ydCBydW50aW1lDQo+IHN1c3BlbmQvcmVzdW1l
DQo+IA0KPiBMZSBqZXVkaSAyMCBqdWluIDIwMjQgw6AgMTk6NTAgKzA1MzAsIERldmFyc2ggVGhh
a2thciBhIMOpY3JpdMKgOg0KPiA+IEhpIE5pY29sYXMsDQo+ID4NCj4gPiBPbiAyMC8wNi8yNCAx
OTozNSwgTmljb2xhcyBEdWZyZXNuZSB3cm90ZToNCj4gPiA+IEhpIERldmFyc2gsDQo+ID4gPg0K
PiA+ID4gTGUgamV1ZGkgMjAganVpbiAyMDI0IMOgIDE1OjA1ICswNTMwLCBEZXZhcnNoIFRoYWtr
YXIgYSDDqWNyaXTCoDoNCj4gPiA+ID4gSW4gbXkgdmlldyB0aGUgZGVsYXllZCBzdXNwZW5kIGZ1
bmN0aW9uYWxpdHkgaXMgZ2VuZXJhbGx5IGhlbHBmdWwNCj4gPiA+ID4gZm9yIGRldmljZXMgd2hl
cmUgcmVzdW1lIGxhdGVuY2llcyBhcmUgaGlnaGVyIGZvciBlLmcuIHRoaXMgbGlnaHQNCj4gPiA+
ID4gc2Vuc29yIGRyaXZlciBbMl0gdXNlcyBpdCBiZWNhdXNlIGl0IHRha2VzIDI1MG1zIHRvIHN0
YWJpbGl6ZQ0KPiA+ID4gPiBhZnRlciByZXN1bXB0aW9uIGFuZCBJIGRvbid0IHNlZSB0aGlzIGJl
aW5nIHVzZWQgaW4gY29kZWMgZHJpdmVycw0KPiA+ID4gPiBnZW5lcmFsbHkgc2luY2UgdGhlcmUg
aXMgbm8gc3VjaCBsYXJnZSByZXN1bWUgbGF0ZW5jeS4gUGxlYXNlIGxldA0KPiA+ID4gPiBtZSBr
bm93IGlmIEkgYW0gbWlzc2luZyBzb21ldGhpbmcgb3IgdGhlcmUgaXMgYSBzdHJvbmcgcmVhc29u
IHRvIGhhdmUNCj4gZGVsYXllZCBzdXNwZW5kIGZvciB3YXZlNS4NCj4gPiA+DQo+ID4gPiBJdCBz
b3VuZHMgbGlrZSB5b3UgZGlkIHByb3BlciBzY2llbnRpZmljIHRlc3Rpbmcgb2YgdGhlIHN1c3Bl
bmQNCj4gPiA+IHJlc3VsdHMgY2FsbHMsIG1pbmQgc2hhcmluZyB0aGUgYWN0dWFsIGRhdGEgPw0K
PiA+DQo+ID4gTm9wZXMsIEkgZGlkIG5vdCBkbyB0aGF0IGJ1dCB5ZXMgSSBhZ3JlZSBpdCBpcyBn
b29kIHRvIHByb2ZpbGUgYW5kDQo+ID4gZXZhbHVhdGUgdGhlIHRyYWRlLW9mZiBidXQgSSBhbSBu
b3QgZXhwZWN0aW5nIDI1MG1zIGtpbmQgb2YgbGF0ZW5jeS4gSQ0KPiA+IHdvdWxkIHN1Z2dlc3Qg
SmFja3NvbiB0byBkbyB0aGUgcHJvZmlsaW5nIGZvciB0aGUgcmVzdW1lIGxhdGVuY2llcy4NCj4g
DQo+IEknZCBjbGVhcmx5IGxpa2UgdG8gc2VlIG51bWJlcnMgYmVmb3JlIHdlIHByb2NlZWQuDQo+
IA0KPiA+DQo+ID4gQnV0IHBlcmhhcHMgYSBzZXBhcmF0ZSBpc3N1ZSwgSSBkaWQgbm90aWNlIHRo
YXQgaW50ZW50aW9uIG9mIHRoZQ0KPiA+IHBhdGNoc2V0IHdhcyB0byBzdXNwZW5kIHdpdGhvdXQg
d2FpdGluZyBmb3IgdGhlIHRpbWVvdXQgaWYgdGhlcmUgaXMgbm8NCj4gPiBhcHBsaWNhdGlvbiBo
YXZpbmcgYSBoYW5kbGUgdG8gdGhlIHdhdmU1IGRldmljZSBidXQgZXZlbiBpZiBJIGNsb3NlDQo+
ID4gdGhlIGxhc3QgaW5zdGFuY2UgSSBzdGlsbCBzZWUgdGhlIElQIHN0YXlzIG9uIGZvciA1c2Vj
b25kcyBhcyBzZWVuIGluDQo+ID4gdGhpcyBsb2dzIFsxXSBhbmQgdGhpcyBwZXJoYXBzIGNvdWxk
IGJlIGJlY2F1c2UgZXh0cmEgcG0gY291bnRlciByZWZlcmVuY2VzDQo+IGJlaW5nIGhvbGQuDQo+
IA0KPiBOb3Qgc3VyZSB3aGVyZSB0aGlzIGNvbWVzIGZyb20sIEknbSBub3QgYXdhcmUgb2YgZHJp
dmVycyBkb2luZyB0aGF0IHdpdGggTTJNDQo+IGluc3RhbmNlcy4gT25seQ0KPiANCj4gPg0KPiA+
IFsyMDI0LTA2LTIwIDEyOjMyOjUwXSBGcmVlaW5nIHBpcGVsaW5lIC4uLg0KPiA+DQo+ID4gYW5k
IGFmdGVyIDUgc2Vjb25kcy4uDQo+ID4NCj4gPiBbMjAyNC0wNi0yMCAxMjozMjo1NV0gfCAgIDIw
NCAgICAgfCBBTTYyQVhfREVWX0NPREVDMCB8IERFVklDRV9TVEFURV9PTiB8DQo+ID4gWzIwMjQt
MDYtMjAgMTI6MzI6NTZdIHwgICAyMDQgICAgIHwgQU02MkFYX0RFVl9DT0RFQzAgfCBERVZJQ0Vf
U1RBVEVfT0ZGDQo+ID4NCj4gPiBbMV06IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2RldmFyc2h0
LzAwOTA3NWQ4NzA2MDAxZjQ0NzczM2VkODU5MTUyZDkwDQo+IA0KPiBBcHBhcnQgZnJvbSB0aGUg
NXMgYmVpbmcgdG9vIGxvbmcsIHRoYXQgaXMgZXhwZWN0ZWQuIElmIGl0IGZhaWxzIGFmdGVyIHRo
YXQsDQo+IHRoaXMgaXMgYSBidWcsIHdlIHdlIHNob3VsZCBob2xkIG9uIG1lcmdpbmcgdGhpcyB1
bnRpbCB0aGUgcHJvYmxlbSBoYXMgYmVlbg0KPiByZXNvbHZlZC4NCj4gDQo+IEltYWdpbmUgdGhh
dCB1c2Vyc3BhY2UgaXMgZ29pbmcgZ2FwbGVzcyBwbGF5YmFjaywgaWYgeW91IGhhdmUgYSBsZXRz
IHNheSAzMG1zDQo+IG9uIGZvcmNlZCBzdXNwZW5kIGN5Y2xlIGR1ZSB0byBjbG9zZS9vcGVuIG9m
IHRoZSBkZWNvZGVyIGluc3RhbmNlLCBpdCB3b24ndA0KPiBhY3R1YWxseSBlbmR1cCBnYXBsZXNz
LiBUaGUgZGVsYXkgd2lsbCBlbnN1cmUgdGhhdCB3ZSBvbmx5IHN1c3BlbmQgd2hlbg0KPiBuZWVk
ZWQuDQo+IA0KPiBUaGVyZSBpcyBvdGhlciBjaGFuZ2VzIEkgaGF2ZSBhc2tlZCBpbiB0aGlzIHNl
cmllcywgc2luY2Ugd2UgYWx3YXlzIGhhdmUgdGhlDQo+IGNhc2Ugd2hlcmUgdXNlcnNwYWNlIGp1
c3QgcGF1c2Ugb24gc3RyZWFtaW5nLCBhbmQgd2Ugd2FudCB0aGF0IHByb2xvbmdlZA0KPiBwYXVz
ZWQgbGVhZCB0byBzdXNwZW5kLiBIb3BlZnVsbHkgdGhpcyBoYXMgYmVlbiBzdHJvbmdseSB0ZXN0
ZWQgYW5kIGlzIG5vdA0KPiBqdXN0IGFkZGVkIGZvciAiY29tcGxldGVuZXNzIi4NCj4gDQo+IEl0
cyBpbXBvcnRhbnQgdG8gbm90ZSB0aGF0IGhhcyBhIHJldmlld2VyIG9ubHksIG15IHRpbWUgaXMg
bGltaXRlZCwgYW5kIEkNCj4gY29tcGxldGVseSByZWx5IG9uIHRoZSBhdXRob3IganVkZ21lbnQg
b2YgZGVsYXkgdHVuaW5nIGFuZCBhY3R1YWwgdGVzdGluZy4NCj4gDQo+IE5pY29sYXMNCj4gDQo+
ID4NCj4gPiBSZWdhcmRzDQo+ID4gRGV2YXJzaA0KDQo=

