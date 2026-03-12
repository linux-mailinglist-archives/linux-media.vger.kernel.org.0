Return-Path: <linux-media+bounces-55466-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOrhAmJZsmnHLwAAu9opvQ
	(envelope-from <linux-media+bounces-55466-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 07:12:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC8A26D821
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 07:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EB8D304C0B5
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 06:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD80E386C22;
	Thu, 12 Mar 2026 06:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EgsyEQQR"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012039.outbound.protection.outlook.com [52.101.66.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987E52D9EC2;
	Thu, 12 Mar 2026 06:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773295960; cv=fail; b=sP/gj8QIGDxbThzsASOYGvcd2vlbu+UbRNezOe3ONEXhCJ5JDUUHWHfRD6mC+zF8tWQjkLMcC8z2lP8bHtMiBzw0rIy3aYNeMxet8zn+r6fkLm1ru9737v0k2KNiTxdnY8hdcZlCEbL3ckxndAN1Ubl1M3ld3GDJDOp0BIp7xKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773295960; c=relaxed/simple;
	bh=U7Lt+3fVTzlVrk6b5MWMcrmG7rlE4wLTTp6SjuXOvp0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DJmatnKEwuEWORjpk3WWlD+R/vEic1cBRYPWF1o+qXCP4VC/NGP04klj8gb2ZsKwiAnnlQ3mxSGEQ0gNdHaU5JewlHE1GqRFm4SqHwESi9jkHtw6tQjoW9t17ZsmBfzNUjQFlyhe4uG8zsC7CtD6jSMOEoO5UDqn2QqHIcKl49c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EgsyEQQR; arc=fail smtp.client-ip=52.101.66.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbS6kOfzr/B4odoZOLPcO+gHD6U/nBSjjpYYrEputn/HW98BAMO7143bq0rX/3pSREHond/Ohvbd1zZK1WvWZ6TIW9uRBFl8YtH49VOtUFmV+lzkUTKFawlqczampskoU4q04/UHV7Bb7cbW8SzzFg/kT1uYpACfCy9XJMshD+b0L5SxHbJ+4Sb83QC8P+jbTlGBYlPzcz5qCcno98eCWPkR2ExYxwXDDV/QnqnwUc30hTvqMtyFCqcBV05ghyCiLxBiWy1RPl8ohSonqu6HaMZz9I/BFMCxJOzWOOD9imKYUF3fVxVFyES2ucJw1115Ov4HX1fp/uuSiLYHbo7X4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7Lt+3fVTzlVrk6b5MWMcrmG7rlE4wLTTp6SjuXOvp0=;
 b=WjL90TzQGnM7FPwTwM4XdbFvtC3vo558BrIbtdckzP8i5o5voFwoT7gdGQWSJnEIaW3W74sTLkLtYe5MeRD2raX/F6FSZ9OucF4LgnFv0GmCgyTj90y5PhA6PcV9KSEcaVk2dbGNaCgGPEMZy/vCk2NW8R4XDWozOXxDvnY7tBZFc/zSlZuDCbMrLt35606EcV55N7CeEVw0Ph9ctAHyx++II76G0M/28aSGfyAfgFNMkTSLxPLJZhfuF/lv4mCEhv3Kh+kDd3jIMs0qIa8IDlCpK/Xno7IDr0AWE36rhvhKZPHdQxtGD1fI3wDFMxiJC4urb8SDtDdH4yVl6lgdaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7Lt+3fVTzlVrk6b5MWMcrmG7rlE4wLTTp6SjuXOvp0=;
 b=EgsyEQQRTz6Pcq4DRd2OOw4mLjv5lGyG32Sav5t+XnS/V+mkBl04B4IPsyGc8piwygFPN2vMYX1ag16jgSDu8Kf+MnPtSn7iNVhlFcVr6HB4/GM/S/vVjxjlzjzTxdzRbsIWqcheGpuyZLxW+RjRr8wgW4u0WtpTNbrh3eZzttVzEk7A0MA+RXAgcClq1qVOoMDhun9SudzMQ8KK07D69g+3D0Zyg9CrJWnIrwisAQnD33AMr/fpEzZ4DSX61kHYKrJfpA4pMKe+fIlPwuo5+EC8A1wbFT1w15bZbpY+v17ZmsOwBEx+StkXnaEJ+ZSv1fTPHXdwfd3bBKuS+mWO2g==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM8PR04MB7475.eurprd04.prod.outlook.com (2603:10a6:20b:1d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 06:12:26 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9678.016; Thu, 12 Mar 2026
 06:12:34 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, Vladimir Zapolskiy
	<vz@mleia.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "G.N. Zhou"
	<guoniu.zhou@nxp.com>
Subject: RE: [PATCH v5 4/4] media: i2c: ds90ub953: use guard() to simplify
 code
Thread-Topic: [PATCH v5 4/4] media: i2c: ds90ub953: use guard() to simplify
 code
Thread-Index: AQHcsec3LkEdqSgqB0Wf0rh7HaU+QQ==
Date: Thu, 12 Mar 2026 06:12:34 +0000
Message-ID:
 <AS8PR04MB90809F2B10DF1DD5A661E4E9FA44A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260228-ds90ub953-v5-0-056cf07cc8f1@nxp.com>
 <20260228-ds90ub953-v5-4-056cf07cc8f1@nxp.com>
 <c28d81c5-ba11-4a88-a57c-9d4da74c4006@ideasonboard.com>
In-Reply-To: <c28d81c5-ba11-4a88-a57c-9d4da74c4006@ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|AM8PR04MB7475:EE_
x-ms-office365-filtering-correlation-id: f736b4f3-d386-48b8-5acb-08de7ffe5a50
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 mzzNPdHkDORfytgW2MEZjJ5CAmKHVk2pAP7zBTFj7URQgD85LPErRQtK+CaBvl6zjAJBYO0o8dVVzzRRZWUaZ5qsMN58LjM3aRj3Y8/WTinueqvGBw0X126UBUnANUTkruPHRMSoypUPGM02GVABLYYGw93yOs32KiwbkAmSuonQ2BLzma8X5Lk5K9kRpN66Pqd8nY7U5B2VzciuQ+m6F5RTIdFI6ea5LmPwkxM+k9uM15XyYtPdqkBnhDF+YJht20acwhMbfdYBZs2yRPi4RHQBHahx1LjJ7hr6zU+/T/ARrlDOxXrKm4jeO47iWmTTMPfLIosuGhTt07YVN9svd6NATMmPhSERcIr2jDjh5MrL5fu+8H4wnr/fcLNyFZxwH6FAJeNCt+5KpaRM4d0FpjA7brcByDE0cwdmYsiHsoHlQ50i6otWy1d2TpWXFvHm5HV0Sy7MdR2iXayKYyE9DufXw9uRW6h+aJPUSK6RA/U0ANKJEQxBG/041ARH0IZ/mzBZnMow4YvxN38Tbfi+glZKnC5CBLb5BpSCsk0Cf78TOr64SCeviSpisbevIkWYI0jUFH5+n8MV4f1tRUfXqqFJcfv6d0UHrIQuTRZrPzGNaNSIS2VzynYX3of1hCsTGoYoiPTT7Rn6CY3G8nPuuhX15cAdaNHJAGkZJ7BCQRGybY+1ohJ4qWXeBp3HiLzXT/42VzQ1mXPr5+XIAo4/9m/bCp+lumk6rXRYHYUGoQ8bkzRyEztKDoy8WADci5gFaKKM5YDzUc020sLJ/hFJEvkaSHj1E6gy58aXd2eD8Ls=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aFhYT2JqNy9HYk44SUtTV3IwZmZxZWFMSG5GcWpSaVVCQWx6SHkzbGhUSndG?=
 =?utf-8?B?eCtyVnJ4ZnBWOEFiRVhIY3Y2K1VheVVjanVBRnMwNTFPSVZiLytYdVFhdUF2?=
 =?utf-8?B?bFd4NHNEM05GQlNmaWNKK0Z0MGE1aHRQN3d5ZlhUN0xqbDN5NFNiZEJSOHBF?=
 =?utf-8?B?TFF5aG9XM0FXYS9xYjg5VkNOK3NmY3RaM3RTbUVnV0Rac2Z0VExIMlRkbVBU?=
 =?utf-8?B?azBLejFuZDVoRldPQkdieHRVNTZ4TEcreXZXb0FmdDkrUXozVFVneXgvZnB0?=
 =?utf-8?B?T0xVN2h2dVRKUTUxUTFPQVNiLytLZzZMS094Lzh0a1RzWDE2ZGRFb2hGUkpk?=
 =?utf-8?B?dHRWYmp2d3FJWjZwWEQ5bWdwNll4Mks3azNMU20ySmIwQVYrUmpMMktjYlll?=
 =?utf-8?B?VFh3WTlZRkY0L1BjTVZMb3VCOUpNbXlnN3JPMzVNTTA3b3JwZDFleFYwcktk?=
 =?utf-8?B?cGo1Mng1L2R4Q2dkZGxyT0czK29SLy9aTGxMUmg3YXhDTEc3Sy9admhHM3l2?=
 =?utf-8?B?QlprNzBQRGl5OC82Y3d1MS9jcEhlb09GUGpFYlkzRi9vL0hQQm10QlZDSFdZ?=
 =?utf-8?B?UFRiTWkwNHJ2ZGZZL2tLRDBvTTBWaTlhVkxnMmFYQ0o3OWRzQWxQdzFVWFp3?=
 =?utf-8?B?ZWlUQUxvK2RmSFNZV3M0TldCOVFuMzArdHBDN0g3M3lZVDdOWEtRRVpBbU8z?=
 =?utf-8?B?UjdGS3hJM0Q0dEFSWjVOS2s4UUVwTzBuOEN2OHZMQnlVaHdNamF0VDJGOXpl?=
 =?utf-8?B?Q2oxK01qUUtuR3E0QkRoTHJzSEN6ZHMxcExkZlJFM0NoQllJSVZQaTNCN0Jr?=
 =?utf-8?B?SytKRGV1RUFXZGdLbitBUTlINkZLZytjZlVLSk44cEo1SE5FTTFYQSttQ1du?=
 =?utf-8?B?QUF6NkFyaGtHU2xvK1RVSUQ3YTYyZGg3TEw2cEZsZGR4YVhkcHhZcnFacUNj?=
 =?utf-8?B?bXJKaXdOb2VUSHNhWUJJaVJBUDZWUnVUSmpIcWVsRDNOQnBSa0lybktvQXFr?=
 =?utf-8?B?dWM0b1ZOeXlCU1pmZnFta0NwK3V2VHFNQ1VjOUt1ZzhBb0k4Z3RXQlpGMURM?=
 =?utf-8?B?YmhjNHZQcGFvNm5JM0l2WTQ4T0I2cEtFc090R2YxdS80YmRmY1FiVVUzM3Nz?=
 =?utf-8?B?N05URDVOaUNDdzA4YlVhK3p2ODJyeEJFWjlpY0wydFc0a0tHOGdWZkVocFRU?=
 =?utf-8?B?UXFIKzJFbXFSeHRRVVV6cHc4d1czd3hJYllSY1VBdkllUDFWWk41NCt2TDUz?=
 =?utf-8?B?MmJyTzRkeEY2bFNGa0Jud1VEYkZ1OHdHUnpqSllKTktKZzVRczRuOG5ac1Fa?=
 =?utf-8?B?Rk1LeGg0OGVHcmlQNWQvZTA4NjVZL1VXcWhWNXQzN2dLMnNOdTV2emlKb05X?=
 =?utf-8?B?Z0NlbkZjKzNJbHQ0WExUaUVLb0ljVXVlRHRlUnhwd3U2T0VjUzhTbmhNRi9V?=
 =?utf-8?B?bEREenVsZDl4V1MyZ3o5UEZncHM5Z0JkV2NMVkZYbm05clh3OW9Sdmk5RGh6?=
 =?utf-8?B?dUVCSmNHQU5zU1cwVnBwSlhzcDlHb3pzYU13NnM5UmZiLytuQmdhdkNwbVQz?=
 =?utf-8?B?QU9VRmp0Y2JBOGJWaW4yNC9adWwyRjB2b1lFTldEbUZNMzNYUmVZdEIxQlZJ?=
 =?utf-8?B?TW0zRXE5VE43aGFvSmI0M1JnTERTejlNeXpHeTlQc2lOK3QrbDJSSEJlRmZP?=
 =?utf-8?B?UHJmTW8zcXlBZjNRZk43ZHdpV2lSUEpWUkp3Y0pQQ3JxVC9HcHltaWtxMTFO?=
 =?utf-8?B?cjlaNG5wc1ZGcTdrcFZyVWtvT1FmQ3NZVkJvczVsMTc4eUwxYTVDZnRXeWND?=
 =?utf-8?B?RFhTd3JreGN1bUFNVzJkQjhLME9sWnIveGlFWTN0bFNUd3UrdkZlMkpKdFFw?=
 =?utf-8?B?Q3pIVVpRR1pPMC84RnNMb09nZnRKL0RJR1pwcC9OVmxpTmRaeWVUakhYUmkx?=
 =?utf-8?B?SmVRbXlRbE1QWFI2S1p4elJQSnNLNHJkamN6bVZxcENhNVQwNjhkMHI4MUVm?=
 =?utf-8?B?YXVCZGx2QTBtWXBCMlp6WTV6OWduMFNwcDRVZDZxTldUNjh6ZVRVRkFYQ0w5?=
 =?utf-8?B?N1dORC9DeHlFRHpndUVJaGVIVlVrd1JsekQrYUpPV0thYmtTU2JGcWdaeTl3?=
 =?utf-8?B?eXRPU3YvREF3SzZzRkcvOUJ5U1ExckdKOWk2eUdNZENXRzZ5K0phWm42aEFu?=
 =?utf-8?B?R2V6SG9tSEdPQlJPU0FyMUVvVlRSclU3THdQZzdDdXBkSHZBd3I0RU5aZi9L?=
 =?utf-8?B?OHFzMzhLczgzNVc2M1BreTZHeEpTK2lBcmtuTTBNTS9vbjFYYlpwRmZ0NnRz?=
 =?utf-8?B?YkRRMjdvdXhCbUVmeitCWVArbm54MERQZ243cXJUS2I5cFh2ZXJuZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f736b4f3-d386-48b8-5acb-08de7ffe5a50
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 06:12:34.6289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G1a5V9o6th2SF99JqNYvcNsR2URukHcD0CX09mHAo13BDlqjtUlfecJipWEFyNYiXD2cV0EpoC9Td3oXnoHqlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7475
X-Spamd-Result: default: False [3.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55466-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[AS8PR04MB9080.eurprd04.prod.outlook.com:mid,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email,NXP1.onmicrosoft.com:dkim,mleia.com:email]
X-Rspamd-Queue-Id: 9BC8A26D821
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgVG9taSwNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNv
bmJvYXJkLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBNYXJjaCAxMSwgMjAyNiA0OjQ1IFBNDQo+
IFRvOiBHLk4uIFpob3UgKE9TUykgPGd1b25pdS56aG91QG9zcy5ueHAuY29tPjsgTWF1cm8gQ2Fy
dmFsaG8gQ2hlaGFiDQo+IDxtY2hlaGFiQGtlcm5lbC5vcmc+OyBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6aytkdEBrZXJuZWwub3JnPjsg
Q29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsgRnJhbmsgTGkNCj4gPGZyYW5rLmxp
QG54cC5jb20+OyBWbGFkaW1pciBaYXBvbHNraXkgPHZ6QG1sZWlhLmNvbT4NCj4gQ2M6IGxpbnV4
LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2OyBHLk4uIFpo
b3UNCj4gPGd1b25pdS56aG91QG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgNC80
XSBtZWRpYTogaTJjOiBkczkwdWI5NTM6IHVzZSBndWFyZCgpIHRvIHNpbXBsaWZ5IGNvZGUNCj4g
DQo+IEhpLA0KPiANCj4gT24gMjgvMDIvMjAyNiAwODoxOCwgR3Vvbml1IFpob3Ugd3JvdGU6DQo+
ID4gRnJvbTogR3Vvbml1IFpob3UgPGd1b25pdS56aG91QG54cC5jb20+DQo+ID4NCj4gPiBVc2Ug
Z3VhcmQoKSB0byBzaW1wbGlmeSBtdXRleCBsb2NraW5nLiBObyBmdW5jdGlvbmFsIGNoYW5nZS4N
Cj4gDQo+IFRoYXQncyBub3Qgc3RyaWN0bHkgdHJ1ZSwgYXMgdGhlIHVubG9jayB3aWxsIGhhcHBl
biBsYXRlciB3aXRoIHRoaXMgcGF0Y2guIFN0aWxsLCB0aGlzDQo+IGNsZWFudXAgbWFrZXMgc2Vu
c2UuDQo+IA0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29t
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b25pdSBaaG91IDxndW9uaXUuemhvdUBueHAuY29tPg0K
PiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21lZGlhL2kyYy9kczkwdWI5NTMuYyB8IDM0ICsrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWVkaWEvaTJjL2RzOTB1Yjk1My5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL2kyYy9kczkwdWI5NTMu
YyBpbmRleA0KPiA+DQo+IGE4NWM2YTliNjQwNzA0OTFkYjE2MWNhMTU4NjE3OWRiYTljNjljYjAu
LjNhNDU5Njg3YWVmY2UwNWFjMDI1YTUxDQo+IDdjOGQ0DQo+ID4gY2M2ZDc2Y2Q3MjkzIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL2RzOTB1Yjk1My5jDQo+ID4gKysrIGIvZHJp
dmVycy9tZWRpYS9pMmMvZHM5MHViOTUzLmMNCj4gPiBAQCAtMTEzLDIwICsxMTMsMTggQEAgc3Rh
dGljIGludCB1Yjk1M19yZWFkKHN0cnVjdCB1Yjk1M19kYXRhICpwcml2LCB1OA0KPiByZWcsIHU4
ICp2YWwsIGludCAqZXJyKQ0KPiA+ICAJaWYgKGVyciAmJiAqZXJyKQ0KPiA+ICAJCXJldHVybiAq
ZXJyOw0KPiA+DQo+ID4gLQltdXRleF9sb2NrKCZwcml2LT5yZWdfbG9jayk7DQo+ID4gKwlndWFy
ZChtdXRleCkoJnByaXYtPnJlZ19sb2NrKTsNCj4gPg0KPiA+ICAJcmV0ID0gcmVnbWFwX3JlYWQo
cHJpdi0+cmVnbWFwLCByZWcsICZ2KTsNCj4gPiAgCWlmIChyZXQpIHsNCj4gPiAgCQlkZXZfZXJy
KCZwcml2LT5jbGllbnQtPmRldiwgIkNhbm5vdCByZWFkIHJlZ2lzdGVyDQo+IDB4JTAyeDogJWRc
biIsDQo+ID4gIAkJCXJlZywgcmV0KTsNCj4gPiAtCQlnb3RvIG91dF91bmxvY2s7DQo+ID4gKwkJ
Z290byBlcnI7DQo+ID4gIAl9DQo+ID4NCj4gPiAgCSp2YWwgPSB2Ow0KPiA+DQo+ID4gLW91dF91
bmxvY2s6DQo+ID4gLQltdXRleF91bmxvY2soJnByaXYtPnJlZ19sb2NrKTsNCj4gPiAtDQo+ID4g
K2VycjoNCj4gDQo+IEkgdGhpbmsgdGhlIGxhYmVsIHNob3VsZCBiZSBqdXN0ICJvdXQiLCBhcyB0
aGlzIGlzIG5vdCBhbiBlcnJvciBwYXRoIChldmVuIGlmIHdlDQo+IGp1bXAgdG8gdGhlIGxhYmVs
IHdoZW4gaGFuZGxpbmcgYW4gZXJyb3IpLiBTaW1pbGFyIGNvbW1lbnQgdG8gdGhlIGJlbG93DQo+
IGNhc2VzLg0KPiANCg0KQWdyZWUsIHdpbGwgdXBkYXRlIGluIG5leHQgdmVyc2lvbi4NCg0KPiA+
ICAJaWYgKHJldCAmJiBlcnIpDQo+ID4gIAkJKmVyciA9IHJldDsNCj4gPg0KPiA+IEBAIC0xNDAs
MTUgKzEzOCwxMyBAQCBzdGF0aWMgaW50IHViOTUzX3dyaXRlKHN0cnVjdCB1Yjk1M19kYXRhICpw
cml2LCB1OA0KPiByZWcsIHU4IHZhbCwgaW50ICplcnIpDQo+ID4gIAlpZiAoZXJyICYmICplcnIp
DQo+ID4gIAkJcmV0dXJuICplcnI7DQo+ID4NCj4gPiAtCW11dGV4X2xvY2soJnByaXYtPnJlZ19s
b2NrKTsNCj4gPiArCWd1YXJkKG11dGV4KSgmcHJpdi0+cmVnX2xvY2spOw0KPiA+DQo+ID4gIAly
ZXQgPSByZWdtYXBfd3JpdGUocHJpdi0+cmVnbWFwLCByZWcsIHZhbCk7DQo+ID4gIAlpZiAocmV0
KQ0KPiA+ICAJCWRldl9lcnIoJnByaXYtPmNsaWVudC0+ZGV2LA0KPiA+ICAJCQkiQ2Fubm90IHdy
aXRlIHJlZ2lzdGVyIDB4JTAyeDogJWRcbiIsIHJlZywgcmV0KTsNCj4gPg0KPiA+IC0JbXV0ZXhf
dW5sb2NrKCZwcml2LT5yZWdfbG9jayk7DQo+ID4gLQ0KPiA+ICAJaWYgKHJldCAmJiBlcnIpDQo+
ID4gIAkJKmVyciA9IHJldDsNCj4gPg0KPiA+IEBAIC0xODUsMTggKzE4MSwxOCBAQCBzdGF0aWMg
aW50IHViOTUzX3JlYWRfaW5kKHN0cnVjdCB1Yjk1M19kYXRhDQo+ICpwcml2LCB1OCBibG9jaywg
dTggcmVnLCB1OCAqdmFsLA0KPiA+ICAJaWYgKGVyciAmJiAqZXJyKQ0KPiA+ICAJCXJldHVybiAq
ZXJyOw0KPiA+DQo+ID4gLQltdXRleF9sb2NrKCZwcml2LT5yZWdfbG9jayk7DQo+ID4gKwlndWFy
ZChtdXRleCkoJnByaXYtPnJlZ19sb2NrKTsNCj4gPg0KPiA+ICAJcmV0ID0gdWI5NTNfc2VsZWN0
X2luZF9yZWdfYmxvY2socHJpdiwgYmxvY2spOw0KPiA+ICAJaWYgKHJldCkNCj4gPiAtCQlnb3Rv
IG91dF91bmxvY2s7DQo+ID4gKwkJZ290byBlcnI7DQo+ID4NCj4gPiAgCXJldCA9IHJlZ21hcF93
cml0ZShwcml2LT5yZWdtYXAsIFVCOTUzX1JFR19JTkRfQUNDX0FERFIsIHJlZyk7DQo+ID4gIAlp
ZiAocmV0KSB7DQo+ID4gIAkJZGV2X2VycigmcHJpdi0+Y2xpZW50LT5kZXYsDQo+ID4gIAkJCSJX
cml0ZSB0byBJTkRfQUNDX0FERFIgZmFpbGVkIHdoZW4NCj4gcmVhZGluZyAldToweCUwMng6ICVk
XG4iLA0KPiA+ICAJCQlibG9jaywgcmVnLCByZXQpOw0KPiA+IC0JCWdvdG8gb3V0X3VubG9jazsN
Cj4gPiArCQlnb3RvIGVycjsNCj4gPiAgCX0NCj4gPg0KPiA+ICAJcmV0ID0gcmVnbWFwX3JlYWQo
cHJpdi0+cmVnbWFwLCBVQjk1M19SRUdfSU5EX0FDQ19EQVRBLCAmdik7DQo+IEBADQo+ID4gLTIw
NCwxNCArMjAwLDEyIEBAIHN0YXRpYyBpbnQgdWI5NTNfcmVhZF9pbmQoc3RydWN0IHViOTUzX2Rh
dGEgKnByaXYsIHU4DQo+IGJsb2NrLCB1OCByZWcsIHU4ICp2YWwsDQo+ID4gIAkJZGV2X2Vycigm
cHJpdi0+Y2xpZW50LT5kZXYsDQo+ID4gIAkJCSJXcml0ZSB0byBJTkRfQUNDX0RBVEEgZmFpbGVk
IHdoZW4NCj4gcmVhZGluZyAldToweCUwMng6ICVkXG4iLA0KPiA+ICAJCQlibG9jaywgcmVnLCBy
ZXQpOw0KPiA+IC0JCWdvdG8gb3V0X3VubG9jazsNCj4gPiArCQlnb3RvIGVycjsNCj4gPiAgCX0N
Cj4gPg0KPiA+ICAJKnZhbCA9IHY7DQo+ID4NCj4gPiAtb3V0X3VubG9jazoNCj4gPiAtCW11dGV4
X3VubG9jaygmcHJpdi0+cmVnX2xvY2spOw0KPiA+IC0NCj4gPiArZXJyOg0KPiA+ICAJaWYgKHJl
dCAmJiBlcnIpDQo+ID4gIAkJKmVyciA9IHJldDsNCj4gPg0KPiA+IEBAIC0yMjcsMTggKzIyMSwx
OCBAQCBzdGF0aWMgaW50IHViOTUzX3dyaXRlX2luZChzdHJ1Y3QgdWI5NTNfZGF0YQ0KPiAqcHJp
diwgdTggYmxvY2ssIHU4IHJlZywgdTggdmFsLA0KPiA+ICAJaWYgKGVyciAmJiAqZXJyKQ0KPiA+
ICAJCXJldHVybiAqZXJyOw0KPiA+DQo+ID4gLQltdXRleF9sb2NrKCZwcml2LT5yZWdfbG9jayk7
DQo+ID4gKwlndWFyZChtdXRleCkoJnByaXYtPnJlZ19sb2NrKTsNCj4gPg0KPiA+ICAJcmV0ID0g
dWI5NTNfc2VsZWN0X2luZF9yZWdfYmxvY2socHJpdiwgYmxvY2spOw0KPiA+ICAJaWYgKHJldCkN
Cj4gPiAtCQlnb3RvIG91dF91bmxvY2s7DQo+ID4gKwkJZ290byBlcnI7DQo+ID4NCj4gPiAgCXJl
dCA9IHJlZ21hcF93cml0ZShwcml2LT5yZWdtYXAsIFVCOTUzX1JFR19JTkRfQUNDX0FERFIsIHJl
Zyk7DQo+ID4gIAlpZiAocmV0KSB7DQo+ID4gIAkJZGV2X2VycigmcHJpdi0+Y2xpZW50LT5kZXYs
DQo+ID4gIAkJCSJXcml0ZSB0byBJTkRfQUNDX0FERFIgZmFpbGVkIHdoZW4NCj4gd3JpdGluZyAl
dToweCUwMng6ICVkXG4iLA0KPiA+ICAJCQlibG9jaywgcmVnLCByZXQpOw0KPiA+IC0JCWdvdG8g
b3V0X3VubG9jazsNCj4gPiArCQlnb3RvIGVycjsNCj4gPiAgCX0NCj4gPg0KPiA+ICAJcmV0ID0g
cmVnbWFwX3dyaXRlKHByaXYtPnJlZ21hcCwgVUI5NTNfUkVHX0lORF9BQ0NfREFUQSwgdmFsKTsN
Cj4gQEANCj4gPiAtMjQ4LDkgKzI0Miw3IEBAIHN0YXRpYyBpbnQgdWI5NTNfd3JpdGVfaW5kKHN0
cnVjdCB1Yjk1M19kYXRhICpwcml2LCB1OA0KPiBibG9jaywgdTggcmVnLCB1OCB2YWwsDQo+ID4g
IAkJCWJsb2NrLCByZWcsIHJldCk7DQo+ID4gIAl9DQo+ID4NCj4gPiAtb3V0X3VubG9jazoNCj4g
PiAtCW11dGV4X3VubG9jaygmcHJpdi0+cmVnX2xvY2spOw0KPiA+IC0NCj4gPiArZXJyOg0KPiA+
ICAJaWYgKHJldCAmJiBlcnIpDQo+ID4gIAkJKmVyciA9IHJldDsNCj4gPg0KPiA+DQoNCg==

