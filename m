Return-Path: <linux-media+bounces-55465-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMjdIiRWsmlvLwAAu9opvQ
	(envelope-from <linux-media+bounces-55465-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 06:59:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED6626D757
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 06:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4E5F3038F24
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 05:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C1A31F9BC;
	Thu, 12 Mar 2026 05:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="o0ddbsU2"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86432773EE;
	Thu, 12 Mar 2026 05:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773295136; cv=fail; b=cG2htvsGmfuc080AaynTcGJqjThvcPcZ9rlIOkT41Pa10ftpLXOG5fQfEIKJG4EE76n1BvVNYpjnyJkawzZJIkRP6rw/gPaX48pqaOViUPvCaSrpvew2O/94jPt1UUEV3rmk+q8VCCn9XdjPQYOqqHM6SmrKXqcky7aI+ksVgCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773295136; c=relaxed/simple;
	bh=XU2zJCWAqa4UU8ZUUZuiwETOd5B5UF6C3gomqbkzhm8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hp8bVfHIOIzm6fxxkhuFFV2mu0SElWFyv2XAVld4I3YoboRXGpJ1Dndc4HC/mByKPzD2nMs5092WD+UDGfKcUwLc/2YZ9lFzBzFsoXtGBrNQLi8hkx6FgMEPmkrNVWVk0fqjjIfc6g7Gx8XUINO6MjKpbceMxfJlMRWC0psG1eU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=o0ddbsU2; arc=fail smtp.client-ip=52.101.69.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjQrVqpVQI6P0icUbJkWQjI5NvQA4vFXg7B0GE3QYKcQO8tfOW4ExYyJlbs5oMlBFh9MtpSqJFQGSh2BPmsy8jwa8kq7UksSuOw5U9pKTqkqroe+xAAgPtuSVMDTViWkCdkeggIoSUeuOHkmdB+rHM4nhbDILgfNH8v1qRb1irZba29X65iSV1Nz22RBT/9qiapFJZoHpQLqmnlT4DgXOek4YLQd8DQbCu5GcfgD0ecKAh0IozkycEyWFIIHswL94RXl2Gm2FpFeVji0sJk4r62xjJ1XKUR9z8bLg8sWbaRh45htgpC4v+5MEkccLuZymCldyFZPxxbgSXEv+5Umtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XU2zJCWAqa4UU8ZUUZuiwETOd5B5UF6C3gomqbkzhm8=;
 b=eRnr7guBHf5rDIWetJIp3yVPUuVO43GIZ3F4znfyUGLaEyyW0HqaZzqvgcdC/8W1rWu9mPZ5/zTdYODVTMft1HZrf2ooLkroKT3uOnZH/xikxOnInpHOD12xAN8WeucMaSImtZVe7FU1RqeCblhGPMJ6R3W+ObpLCVX/D83JEGtkUrkR3RqXju1/Mq4gg58a0B5+9S9TOEFnaxmmvMOpJBzMQyYVJ5tn0LerHg0///WnSiUdyH7j6oGMMvYR0oQiek0S7pONmEmDqgQL+slBHLD4P5hQfy+xHNyvs5yIds4RYzErXUcMX0Uv4g3y6tMKna0TMqMkwvU9L0gZ343dvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XU2zJCWAqa4UU8ZUUZuiwETOd5B5UF6C3gomqbkzhm8=;
 b=o0ddbsU2QtILkvA7KvIndHtpzu/fxX7G8VkJgKIX2MLtv4VlFzeucCSgtvzaFCKBY8FyQtf4Aj76+oCEPeHCvVHcEmVWqQbcQn1htvH/oM6Tl/+a0q8CKHfno2IrwPnh/LF9gbzo1trfBX4J9nIXbtopnFy5ZK4dXsRyIcALqhc8mEyKqYpCv5qD1FedLB5MSl7R/OunowCMpHPI+SKR6FsMyi6B+L9AT1o8Vwn8XLZ/1QGpk7w4zsTCA/e8/vi/yCNVlH64m1lvYoO86RDwzAt1MZvyni1XMYtfP1f2ig5CBGSR8UewN3VDPi6OYzRGgepARYy7pCQifgMLISHgvA==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVUPR04MB12194.eurprd04.prod.outlook.com (2603:10a6:150:33f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 05:58:45 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9678.016; Thu, 12 Mar 2026
 05:58:48 +0000
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
Subject: RE: [PATCH v5 1/4] dt-bindings: media: ti,ds90ub953: Add new range
 for remote GPIO data
Thread-Topic: [PATCH v5 1/4] dt-bindings: media: ti,ds90ub953: Add new range
 for remote GPIO data
Thread-Index: AQHcseVLQTLOGaKSh0KaFBaUbRWTpQ==
Date: Thu, 12 Mar 2026 05:58:48 +0000
Message-ID:
 <AS8PR04MB9080424C54F7DB6446386BFEFA44A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260228-ds90ub953-v5-0-056cf07cc8f1@nxp.com>
 <20260228-ds90ub953-v5-1-056cf07cc8f1@nxp.com>
 <d63bff5a-1a37-4162-8b75-bf62787a0782@ideasonboard.com>
In-Reply-To: <d63bff5a-1a37-4162-8b75-bf62787a0782@ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|GVUPR04MB12194:EE_
x-ms-office365-filtering-correlation-id: e168a036-98cf-4cb4-ce5c-08de7ffc6db2
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 2zVGu/Q8jK0eRSiLKKceCZIPMB6qE2AUmHg3N11n4YtV3oZmh8GG7mRibyp+Pc5PkvB2fH/usA1mSmX6os0yLo2QbbTODJ2QsfFgSl5hrenzZF5TjEE3NtFdw2j+a1Kw/e2MyFJfcF1t3yARg3B06a0PNDBLX3FTdjKtDV+QF+s+iHeilCksKoLIZQZgCHkeOZvvSHaeq4iYqoHTLg+kPqssTyAWX3dLgVqTyUQ2rtL5r98wZUUKA/j0R1jkhGSvtZ/It1wcUEVKlFy3V3Fdtriv3uODrfzIPT/Ocz4Erc91KG7wUXm1fJR1xiDj46RYZHz82ef5VsM6i5Ybxqx/R608HyxlRXCG7VldMWKVaLCYsVm6ftc726u8ewXd98h20604sERyuq6pWQEvWz5FFrvmDyNUhAbUm8qJyzJ4+4wqOL1qP3OKquR/5XcUZTWSeul00zY3Uxr5BgBV8misqUuIL6znyBN90KH28f3bEP4HL5i5F56WvW+DVqr1kvdyg8JLZfn6oLfKg8s6s1Lkr3FKo/BEX83sv2puJ2bpdAJLPwddSzpM6cg4rwy5nVsBnueU4goHgdi6wwsm5eZj82sYV4vqs/J+JV4KX49Y8ih4cFQxUuJAB7RknMA9iOyK90C0vffHxzih1MCNr0JYmEKWTC0Flu4oPozbCB859gusRxKgFfig3Wp2OMhvDsEu39uuGg0VAznk62BIyAr1x9cP4KgMmvBNPY+QEiLnxDEvWOIg+miARVNwVx6PusBJySxXIM17LkXRmokGkklTQ8VOBS+5aO9N/aTxX0eVe0A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NGxLRGVZQkZFSUpIOWZkMFJPbDJ5bFpjeFlJblVGck5ZTHpBaUpYRVVaVnY3?=
 =?utf-8?B?VlY5cW03Ymh5STB4Tjd5L09tL0pPYzNEL2t3MmdLMENIa05yT0FURndnNGdO?=
 =?utf-8?B?VHBJZStGNXpWWE9MWlZVNUs2M0oxc3ROcFI5YW5FSlNyWFZ4Vk92UWJuc3Y3?=
 =?utf-8?B?QlJFM1o2Z1E5T3d2OWlnaTU5dEhtaURxdXRlakpKUzhtTDM1ODRXTituNVAz?=
 =?utf-8?B?SDBGSHk3Ky9uNkQ0U1NEQTVFbzNyanVHSmlLazBrSklIdjJWMFNnWE1iTnh3?=
 =?utf-8?B?VEtTeUZmUnJ3RXVxeHlWbVBiTkhXR01WVTArVWRnU3pCMVNNMVI4eGFBQlda?=
 =?utf-8?B?Q1NIQjBGdnlDVGZoWkhKWmlLWnc4Rm5pd3VDL083clYyNTBFVUNydjhNK256?=
 =?utf-8?B?UEpqQUwxbGpETHhHMktIR0dBQnYzT0tKMWhOUDBMTWRZaVZ0bEZnSWViZzEw?=
 =?utf-8?B?RHliU0JubUNrS0dibWZ4M0U0cnRhMDR3OU5ISDVaNE50T2svbG5Kd1dDNXBo?=
 =?utf-8?B?eHpkUlRIQmQyTVZ1QXhNN0hsQ1hObGkxMjIyQm9sRVNBeTZ5SGtYTDkrbVJE?=
 =?utf-8?B?aDRPSVhLSTRTNUovNE5oNkFkWE40T0V6ajlkSHdkTmNCZEtHWnZNbTRKV2Vi?=
 =?utf-8?B?Zlp0Z1VNOVByQ0J4TEErTVRwWUtJdGdYN3R4Q1FhSTUwN0w3NHl6MHZ0UnFt?=
 =?utf-8?B?eEprNVVqdFZpZW1wT05jK2hkOE91T1JubXdTeFVwQ3JpRFJDRm5xZ0cwYTR6?=
 =?utf-8?B?VHFvR1Z0a1d2Ry8xUmpBY3pNS0NnYmhwMzJia1lkWkJCdVZldmZGeUxURUhM?=
 =?utf-8?B?SzY1VmkxcjIrbTlhTkdNcW9rMlhYVXFEakdFUmtYbGZYRzRLeFdlcnhlbVdF?=
 =?utf-8?B?RDhsNWFnZnNaVWVkbUNMazhIdURoUjVzNUFnVGFxeHlMVzRyTHlZaFN6NXFq?=
 =?utf-8?B?UFNNb0sxNjVNcTVvYkxvUzFTbEpzb011ZnBKWmJ5QVQycW1JT1VqQWNQblJR?=
 =?utf-8?B?bVRBTWxOUmk4eHUraTZRMzN6R2pYaTY1L2tobmk3cWhLTXlBWjFJUmQ0Q0J0?=
 =?utf-8?B?TjJUZWw4d0lDbjlLaC81SHUvTkNwaVVCaGZiZWtMb0N2eUcxUTVXTFNlQnRS?=
 =?utf-8?B?M1VCRyt6L2gvcm9BRVhnY1YxZUNkUjZabU9weDFybG0veFZlMGloSGN1MUhJ?=
 =?utf-8?B?TGJSZlVQcEZuMnhwdUQwOUhubXA1NlBwMW5wWnZna2NOTXFTdHJKSW9QVGI4?=
 =?utf-8?B?Z1NQZGExU0htQzFOakpuZ3VxbHlPZmpvcW1GSSt2Zi9NSnNjSGU1dXh0b3Ro?=
 =?utf-8?B?RVY0cDZnOTQwK29VSVQvYlpOVE80d1RybmtlYkYrY1AwUzBacjRqcWtXd3RD?=
 =?utf-8?B?TlQ2SmRlM3U0MUV4NGlTUWhvT2lQenFmNzVlcHJGNmI0NFFjQUtJNGlkYzUw?=
 =?utf-8?B?S0dpUDc5WmtMTXFTTDJkUDl3UU4xQmJsLzY5TWg5Sko0UEZRTkM3Rnc1K2pr?=
 =?utf-8?B?bGd4WisxZm9uQ09ManZ5VUhlbS8wOGE5VlpQenBYeS9CWCtLRmZHN1FMQ2Y5?=
 =?utf-8?B?WFV4NkQydEJkd2g5dkJPTmcyRjN0MDY5RFR3cFZUbWYzekF1Mld1aUNDSlpI?=
 =?utf-8?B?T1dkY3ZMYWphZDFwVXloMzB0ZU5Ya2pKT1ZKUGtuTWt4amlpMlJZREh1aHV4?=
 =?utf-8?B?bnBQY3hFLzRyZzZhMEc4OERTRUxLbXE4U3ZweUFxSEs0Yjd3L3N4SVd3RXBn?=
 =?utf-8?B?TXRNL3lIYzk5YUtObTZHYWVraTg4NUtNclNQWGQ2cGVGbHY5emdBRkFqSDNY?=
 =?utf-8?B?WjFLSGFwUDNMR0VRZWhOUTA0RU4rcVZ1SGxRQVVWY0FGT2NBbU5FcldkNUdT?=
 =?utf-8?B?VlZvaDczT0U2M1FZamV2RkppeGp5UG5GK3ZUSExOd08wS3ZSclQyRGNxOXpB?=
 =?utf-8?B?ajBETFFSODFiZmNTeisxRm0zQUVSeEdndVdzMkM5cmd2SkZJSGZOZnRteFRW?=
 =?utf-8?B?V0xzSTNOZ1RVei9Zc1R3NXZ4MjNrWUNrUk1ZK0hUcXFrQnAzSVZNeVRIWnYx?=
 =?utf-8?B?bXJqeWFCRmNBY3JuUEVjQlpld040b1FvaFBmZlhKNUZmTmk0MitVaU40YkNP?=
 =?utf-8?B?QkVEaTdQSzZZZnpkcEdWWkVMOHgxK3BFbzF0c3djRGthMTFpRkpDeUZOUHdu?=
 =?utf-8?B?SmQ2V3pTOUtONmIzTGtnNUdrSDVNT2ZUMUVLeTRQS0VWcitCWVROZ1FSQTJ2?=
 =?utf-8?B?WDdRejZSYlV1UlB1UkpxRXg5aEVuMk93K3JoYy9WeDlmRGZ3MTJIcTYwZ0p1?=
 =?utf-8?B?WC9mQ01ISlhKSFdZUGV3SkdLbm5ka0t0c3NYSzUyN0NNU2xIYVFXZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e168a036-98cf-4cb4-ce5c-08de7ffc6db2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 05:58:48.2002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkLxIL4mlJ821OXS9DiR7zJ1IKi8w3VD2hkTXNzUFCHv87e4YDM/y7Vl/WXuJMOklsCPofJS31UgjQW5n+92jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12194
X-Spamd-Result: default: False [3.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55465-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0ED6626D757
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgVG9taQ0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkBpZGVhc29u
Ym9hcmQuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDExLCAyMDI2IDQ6MzcgUE0NCj4g
VG86IEcuTi4gWmhvdSAoT1NTKSA8Z3Vvbml1Lnpob3VAb3NzLm54cC5jb20+OyBNYXVybyBDYXJ2
YWxobyBDaGVoYWINCj4gPG1jaGVoYWJAa2VybmVsLm9yZz47IFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnprK2R0QGtlcm5lbC5vcmc+OyBD
b25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBGcmFuayBMaQ0KPiA8ZnJhbmsubGlA
bnhwLmNvbT47IFZsYWRpbWlyIFphcG9sc2tpeSA8dnpAbWxlaWEuY29tPg0KPiBDYzogbGludXgt
bWVkaWFAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgt
DQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7IEcuTi4gWmhv
dQ0KPiA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAxLzRd
IGR0LWJpbmRpbmdzOiBtZWRpYTogdGksZHM5MHViOTUzOiBBZGQgbmV3IHJhbmdlDQo+IGZvciBy
ZW1vdGUgR1BJTyBkYXRhDQo+IA0KPiBKbywNCj4gDQo+IE9uIDI4LzAyLzIwMjYgMDg6MTgsIEd1
b25pdSBaaG91IHdyb3RlOg0KPiA+IEZyb206IEd1b25pdSBaaG91IDxndW9uaXUuemhvdUBueHAu
Y29tPg0KPiA+DQo+ID4gVGhlIERTOTBVQjk1MyBzdXBwb3J0cyBmb3VyIHBpbnMsIEdQSU8wIHRo
cm91Z2ggR1BJTzMuIFdoZW4gZW5hYmxlZCBhcw0KPiA+IGFuIG91dHB1dCwgaXQgY2FuIGJlIHBy
b2dyYW1lZCB0byBvdXRwdXQgbG9jYWwgZGF0YSBvciByZW1vdGUgZGF0YQ0KPiA+IGNvbWluZyBm
cm9tIHRoZSByZW1vdGUgY29tcGF0aWJsZSBkZXNlcmlhbGl6ZXIuDQo+ID4NCj4gPiBNYWtlIGEg
ZGlmZmVyZW50IEdQSU8gcmFuZ2UgZm9yIHJlbW90ZSBvbmVzLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogR3Vvbml1IFpob3UgPGd1b25pdS56aG91QG54cC5jb20+DQo+ID4gLS0tDQo+ID4gQ2hh
bmdlcyBpbiB2NToNCj4gPiAtIEltcHJvdmUgdGhlIGRlc2NyaXB0aW9uIGZvciAiI2dwaW8tY2Vs
bHMiIGFzIGNvbW1lbnRlZCBieSBDb25vci4NCj4gPg0KPiA+IENoYW5nZXMgaW4gdjQ6DQo+ID4g
LSBVc2UgZm9sZGVyIGJsb2NrIGluc3RlYWQgb2YgbGl0ZXJhbCBibG9jayBmb3IgI2dwaW8tY2Vs
bCBwcm9wZXJ0eSBkZXNjcmlwdGlvbi4NCj4gPg0KPiA+IENoYW5nZXMgaW4gdjM6DQo+ID4gLSBN
YWtlIEdQSU8gcmFuZ2UgZnJvbSAwLTMgdG8gMC03IHRvIHN1cHBvcnQgR1BJTyBkYXRhIGZyb20g
cmVtb3RlDQo+ID4gICBjb21wYXRpYmxlIGRlc2VyaWFsaXplciBzdWdnZXN0ZWQgYnkgUm9iIGlu
c3RlYWQgb2YgYWRkaW5nIHRoaXJkDQo+ID4gICBjZWxsIGZvciBHUElPIGNvbnRyb2xsZXIuDQo+
ID4NCj4gPiBDaGFuZ2VzIGluIHYyOg0KPiA+IC0gUmVtb3ZlIG5ldyBwcm9wZXJ0eSB0aSxncGlv
LWRhdGENCj4gPiAtIEFkZCB0aGlyZCBjZWxsIGZvciBHUElPIGNvbnRyb2xsZXIgdG8gc2VsZWN0
IEdQSU8gb3V0cHV0IHNvdXJjZS4NCj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lZGlhL2kyYy90aSxkczkwdWI5NTMueWFtbCB8IDgNCj4gPiArKysrKyst
LQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lZGlhL2kyYy90aSxkczkwdWI5NTMueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy90aSxkczkwdWI5NTMueWFtbA0KPiA+IGluZGV4DQo+
ID4NCj4gMmUxMjliZjU3M2I3OWUwY2E4ZjI1YjRlYzVmYzZlYTc2YzUwYWJkNy4uMTQzZDU0NmVj
YjQ4MmQyZWI3OGExMTNiDQo+IDFhNTcNCj4gPiBhZmNiZmY5Y2NhMDEgMTAwNjQ0DQo+ID4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy90aSxkczkwdWI5
NTMueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9pMmMvdGksZHM5MHViOTUzLnlhbWwNCj4gPiBAQCAtMjAsOSArMjAsMTMgQEAgcHJvcGVydGll
czoNCj4gPg0KPiA+ICAgICcjZ3Bpby1jZWxscyc6DQo+ID4gICAgICBjb25zdDogMg0KPiA+IC0g
ICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogPg0KPiA+ICAgICAgICBGaXJz
dCBjZWxsIGlzIHRoZSBHUElPIHBpbiBudW1iZXIsIHNlY29uZCBjZWxsIGlzIHRoZSBmbGFncy4g
VGhlIEdQSU8gcGluDQo+ID4gLSAgICAgIG51bWJlciBtdXN0IGJlIGluIHJhbmdlIG9mIFswLCAz
XS4NCj4gPiArICAgICAgbnVtYmVyIG11c3QgYmUgaW4gcmFuZ2Ugb2YgWzAsIDNdIHdoZW4gZW5h
YmxlZCBhcyBhbiBpbnB1dC4NCj4gPiArDQo+ID4gKyAgICAgIElmIGVuYWJsZWQgYXMgYW4gb3V0
cHV0LCB0aGUgR1BJTyBwaW4gbnVtYmVyIG11c3QgYmUgaW4gcmFuZ2Ugb2YgWzAsIDddLg0KPiA+
ICsgICAgICBbMCwgM10gYXJlIGZvciBsb2NhbCBHUElPIGRhdGEgYW5kIFs0LCA3XSBmb3IgR1BJ
TyBkYXRhIGNvbWluZyBmcm9tDQo+ID4gKyAgICAgIHJlbW90ZSBjb21wYXRpYmxlIGRlc2VyaWFs
aXplci4NCj4gSSBzZWUgdGhlcmUgaGFzIGJlZW4gc29tZSBkaXNjdXNzaW9ucyBhYm91dCB0aGlz
IGluIHRoZSBlYXJsaWVyIHZlcnNpb25zLiBJIGd1ZXNzDQo+IHRoaXMgd29ya3MsIGJ1dCBmZWVs
cyBhIGJpdCBoYWNreSwgbWFrZXMgdGhlIGRyaXZlciBhIGJpdCBvZGQsIGFuZCBhc3N1bWVzIHRo
YXQNCj4gbm8gY29uc3VtZXIgZXZlciB1c2VzIHRoZSBzYW1lIGdwaW8gZnJvbSB0aGUNCj4gMC0z
IHJhbmdlIGFuZCA0LTcgcmFuZ2UuDQo+IA0KPiBEaWQgeW91IHRyeSB0aGUgYXBwcm9hY2ggd2hl
cmUgYSBuZXcgZmxhZyB3b3VsZCBiZSB1c2VkIHRvIGluZGljYXRlIHRoZQ0KPiByZW1vdGUgZ3Bp
byBmdW5jdGlvbmFsaXR5PyBBbnkgcHJvYmxlbXMgdGhlcmU/IEknbSBub3Qgc3VyZSB3aGF0J3Mg
dGhlIHBvbGljeQ0KPiBmb3IgYWRkaW5nIGN1c3RvbSBncGlvIGZsYWdzLCB0aG91Z2guDQoNCk5v
LCBidXQgSSBjb3VsZCB0cnkuDQoNCj4gDQo+ICBUb21pDQoNCg==

