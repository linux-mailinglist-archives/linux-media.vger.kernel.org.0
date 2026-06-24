Return-Path: <linux-media+bounces-65594-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2TB8EORBPGoclwgAu9opvQ
	(envelope-from <linux-media+bounces-65594-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:45:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 997956C13FD
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:45:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=vzk2WIoh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65594-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65594-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 546A130F9776
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 20:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905F13E4500;
	Wed, 24 Jun 2026 20:39:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6D63E3DA7;
	Wed, 24 Jun 2026 20:39:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782333577; cv=fail; b=uJnQLItkFQnRVzs9Ni3VPlyIOD+n/JTfAVxXJG4jsRq/qp7oHVy7m6UgyUw/dYbVJ9JQWw8FySGucHmRuDkUO9EZdwku2X6DqBfO3x4Z2R+n8udTs55xFxd1z0qbNvF5YlRP+/nm2NWYdesW7TUia1Df82fMQwssZvNqlmUK1QY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782333577; c=relaxed/simple;
	bh=Xg5f2J+9LPQpU1nZLhy6E4sP7mkBcsU32tSzHNz5eRE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UyuKGn0nQO3CMidnfxahFgJ8NohhSmlG2J9NdqiS2wPe12N9nYoWAOsgudvwMoIkSS2OYXBDWNQxwRU+uSfBr8K5TYIAUBvEHoCn92l14xIGJl2zeTnTg+IH4esTbhpTk33iglO3Z1bqmCqh7J1QxjdWCGpjhiFU/boVd3HYqGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vzk2WIoh; arc=fail smtp.client-ip=52.101.65.26
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HH3oh5WbUJhNv7g63+XfkrDxUbj5E7KDG56VjWbfNgKx2aMbEqBhCE+mbbool88mBuklEuC1LRRoqU0MBbSUR0K4ipQoemg8A6VbGIl2I5gt0RFgXloLqRjmGPW/4PhysbHS85FN/vszNeELYXQ8tuTZJgx3/EMK09JwmBmAk9hTMh0T9nVlcbbdo7ZhfS79YR3CyZDRT6jnE27L2gMVIshF2iu09lFVEDUcBqAqptWE8hO+I5tmhyHafuthsVks2UkWy9vmSpFw6hi9JYhROs/pWID3yRySgZns7I3+War1RtGINUbPQkyCEKOEmXawb+hF7n1PhQ9Ut5zhudSJbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDwzPUT9iKk2xgkMmpP76scnfC5B7H7pptXEebRJJdg=;
 b=OFz0rH8u5kRKgR8zuyfdIR88soqAx7NkixXD+mneFhSPFREzyaE2Sv1wojw+yNK+lU+RLIqAwOx+bWL4KGEj/QeG5qYV26Og5/JiVwJ/p4m5Uggcvdi3Ji8RHHGd5z5ZrSt9q1ros/3Y/HkLtmb9upfi3iVF8kXIIqVe4fHwI0jxnDGJp35KieUc7UGX4Lc6Az9UecwA6XlA7P6Cflq3L4CdgW5vTnFaEtbMJU4BEA4V9ufV1DQJRL8nBYfAOc2AS5nAPZGWOks3+Qheja9lLkc+IDaUdfQK8ahiuN00gA1gKP4RmRsi6B3q5jIhPMFgR5IC2m2DUdCiWZUmO4WxZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDwzPUT9iKk2xgkMmpP76scnfC5B7H7pptXEebRJJdg=;
 b=vzk2WIohcINUjvycGQd4hhjkOu0d6zx0viD9K4r9FqpxbBy8sfqHX3O6EN2vldm9pyYVX7URrm8TspqixsatgykqpiKyLnvvDGVt5RVTwB5yLcc5DFm97k+Y9jnJGrDA6TBOvfBo2LggaEkktBSdVQAXzhzQuFdxXtz6MnpR9zloh0+9wlBcvpKrPh50mgDNnM9wSPncnGAMCy70oMSijwadaD3JjqQhfL8w4GYs3SjuOmGqWxRKq2UWayO8SPVUfimlbN81/EYg2zKcwoSLAQ6KukmaXNEP6hx/4p2zL/uGUqZzXX1H8+lBoF/14Mtoi+zHbNfuPPtI7C+Z5OmZ2g==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11335.eurprd04.prod.outlook.com (2603:10a6:102:4f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 20:39:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 20:39:19 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 24 Jun 2026 16:37:55 -0400
Subject: [PATCH v6 8/9] arm64: dts: imx8: add camera parallel interface
 (CPI) node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-imx8qxp_pcam-v6-8-4b3f45920d2f@nxp.com>
References: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
In-Reply-To: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782333513; l=2302;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=M6Hyu0yk5InLv9LaRTVzrCHY5ZLLG97R+UhIlA+eqhQ=;
 b=5NkXquY2ba2/EsxdD8+eF73VbZPBUQsq8oXk9zEkcOA9MxtnfaftbMKUw0/bvD8IDPPljxHd7
 U5loMjW5fg8DqRfLbpMzX8ZUsKD4gKFUhJHXp5G0gz/neqSe/zVfaDd
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR22CA0022.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11335:EE_
X-MS-Office365-Filtering-Correlation-Id: dfaf59ed-54ae-4e5a-cff8-08ded230aa3f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|11063799006|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
 92N5fgJfUNICff2AmiRFKR66Bx4Ip6PKFEvhnkF60T67EuBydPkzvxhsM+fTDRfsoq2KZ4h0WHT2hl+Vp4clGuQm4XC+I4JHdTNNG6Mer5KG4u8X9T5UI/kz1UYLnwH0N+pwr4JIpRFEPZLTbEyllBdpA8EY9+b58WiHAyVyu+35Uerqvr0eh+AvFv0b+LAVQ6BwqLNXyU7OPc12lFfE4DjmaiuzzmpgC68syR2MCqAn+QGurDTzYBzGaW/vYRqrIUTWpM0VxQifUlOr/Gkep1BJ38bpydE0ntF7HLvmRgq7IAY/wo+ezOVltFCM+EZtNgjPNS7YDgUwfKpq1OKoqtyINJrpMtOTLYpCrobaCE5V+ZYIiWzYllftx+YadBOu2vdKVmjhqhRkfLZdoG68oOdRU5uIVqpocDptldu2Qc6EERIgWQ9pWnGWaibwxZazWWSZgYMRRp4Z1vLrFDP8FojtkvyiDT3B9JLb1De5J5Q0oHyM88bTEYRZ4GZ/+SRqi/B6xhAMH17bVtMjT9L6Jdl3U3D+PZScB2LbAz2349h8pLCAIGskGExR+NYiNNgRdv7z6TXvCPgeuWdmlq0xPXoGFcT+ZRuKt8OmJ3EAMLwYUzasN8ozIBMFivBX/+qv154w3/wjDRygz9b3qCIpCrOhIkJWQxUUAqJcad/20tWiTAexcXFt6Poz8Ym/b3Nf9NMAN49aAfBqvUbctbu9LA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(11063799006)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ampCMlI4WjVRdTExV09kcnM0YUF5aGQvS04rR2R5VmM1YmdzcEJaeC9ZUlVG?=
 =?utf-8?B?ZGhwZVZrNVF4bnk0TXJ6VnAyZHFldCtWV3doRVBwN09sN3VwUUJzSGxvZVNv?=
 =?utf-8?B?UUJQWFdkQzNwRkhTdjhUbmhOVjg0Qkg0SXdNYnZYYWhNYllXK000YzdhbjFW?=
 =?utf-8?B?VHM1Qk9EdFpUZXkrUkFOQ3BqSWZObFk4ZkRuMmpvUHZ3WFNjSVVic2RCamlH?=
 =?utf-8?B?NjhKSnZ3aHZDVENVS3B5RWdiNWVnK3lINUoyenl2b0RkS2VlbXN1eWlzbnpX?=
 =?utf-8?B?QnNZdm9ONmlRdThwb20xdEJxTDN2R3BaNzZlNVFFZWZiNlRQSE5DTk5wckxV?=
 =?utf-8?B?WGc3bzNZTzBuaXhZTDNGMW96N3dhVzZXdUtObTh1SkNPZGg1ckJVY290WS9V?=
 =?utf-8?B?VExoVmthNmNMV2gvUXIxbW1EUUtFbXhRM25KOXArYmgvZXB1TVRzUGVQUVJN?=
 =?utf-8?B?emxMRmVBKzJwZWVicWhkeDJORjhFSWorT0hubGliRG1NSXNiLzFNaFJTK3pm?=
 =?utf-8?B?QmVoemJFM1l5a0hMelVqcCtzODN5WTlQeU03eHlKZHJtTXZhcXdLZlZpTkJq?=
 =?utf-8?B?aDYyT1kwdVgzUTBYODZiQ2tESWFKMmNyOVBWR3FEZnBocDJ4bWZSdmJJZTZX?=
 =?utf-8?B?OXA5b0l0RzFFNGFmSW9oZncyd21UQmltUHFFQUMrUk83V0ZmSC9iZlVKeEpC?=
 =?utf-8?B?MnJyVkViNkxkdnhSZ29ESmViMk9MNGNyVWV0SXRvM2NuRTFFMGpnRHhDWisy?=
 =?utf-8?B?WHpsQktTVGtQaC9uZHdSTktpa0swWmRiMUI4OGNzOEFXeEdqa3g1bzMrelBm?=
 =?utf-8?B?MFdEY3pKL2N6Ymh6UmVDYWFOYUFxdHh3c1psenVsT3llVWVYbWhVbnJKVGxF?=
 =?utf-8?B?OTBla0IzQXpjYThXNXJSRG9vRzdSSTNueloxZEtBNCs2RU9lT0prQWVqcGE4?=
 =?utf-8?B?d3kyOTVkZEVHdGpZWFJibVMxWUVtbU1HYzU0Y2J2M2E3aTE5aE54ek9oajky?=
 =?utf-8?B?OUErSTNzYmhJSDhxR0FxMmtJVkg1eURVWFBVdjRnMTlWMlR3ZFFKRGdQL2gx?=
 =?utf-8?B?dXQ4TzNHOTVFZzlyMTFXT2hrNURIWkw5WXQwSHBOMnl3TjJ3QXpxTm5mQWpE?=
 =?utf-8?B?U3EzNEFoSEQyc0xkTnVzc2hCUm12encwL0J1T1IybG50ZzZxYVg0MG5lbi9T?=
 =?utf-8?B?UHlFODYrUXZhRFRzRDNQTmd4UDZoc3Rvc08zSnVJd0FZMkFsdVRRc1FOWHB0?=
 =?utf-8?B?bWNTOUFBUTVrS2FCSWc5YjNPbEJsek5aSGFZVnA2UElYZ3lPMkticExpaTV5?=
 =?utf-8?B?czNTZ0lPWHcxWElrOVordldFNWwwZ21OV3ZxQUtEdU4vem16N2RrbUFSdUh6?=
 =?utf-8?B?dnF5WDdubzFKaFA2Y1ZVSGxQQmZ3VEtPaURpajRtRnZidGsvNnNtWW02RDdp?=
 =?utf-8?B?TGdNWEtDOStaQlFBRUVpMUFiZmN2VWw4aFhHcmxmN01JckkzaVBJempkYlZU?=
 =?utf-8?B?ZkV6M2haVU9iM1poOEJpVlluY3gxTk5PS09ldStVdXNFOG1ZS0ZwcWhZdFRL?=
 =?utf-8?B?NDFkTlpibnl4ZkJOUWppNWxFMEdrdDREbWozaDBsZm9yUU5BYkpwaDhQamxp?=
 =?utf-8?B?ZWlkL0cvaXdqY2hlWitNakdTcGUwTlA3cmo0ZmFZSTRIK3VzUDh6WVhyRUpW?=
 =?utf-8?B?Y283djN4R0cwQy9wd254bDlncWtpdDFIRTlLdGZWNzhmUjRIaTEyWnlKYTVl?=
 =?utf-8?B?dko0UEkwNTJSME43SGRvcUw2Vi9mMGkzVTdVd1F4bEd4dDdiZ1VxMldwUE41?=
 =?utf-8?B?emc4SjNLWWt0V290YlBBT2JRbTUxcjRCL2w2TEM2K2ZnOGkvQXNkNks4T3FE?=
 =?utf-8?B?eXlmMWMweTg1WXVJY0ZtZ1hQT1owdHl3eURCUHFNZlJkaTYxdXptVFVmVGdV?=
 =?utf-8?B?V0JybnRtb1pGaG5iSlVFYnBxb0tka3VzTURjRlQ4RjIxUjZPUWxqYnVEYkdT?=
 =?utf-8?B?anZDWklKVkNwZ1oyWFNRb2hyWDM2akJnUTBuTGhhQ3p1UEwzejg1YTBkc1I2?=
 =?utf-8?B?c1NBb3FZd0QrNVp2aElOdHVnbDRWVE9ScDhHdmVsRXdNS0F1TkpGTkdrb0E3?=
 =?utf-8?B?amt2RFBueWtjaU9oenlGVFlhVFN4c1pjQkNIYmdrdVlzNytFVnBMSUtYcTlm?=
 =?utf-8?B?N3RFRHcvcGdwczh0QkNsMkpoNEI5R1MvQkVYV1JjL1UzWWhNWGZHWE1iRXZB?=
 =?utf-8?B?UFZRc2NFWGgwYlg1bVVtMkNLd1lucWJ6RUVyR3R4YXorM2g0MnZ6Y0lVb1E4?=
 =?utf-8?B?eG1yQk5jWlVOamZFNW82L1hqRjFlbjZXdXBndWJJWWtZUDFGWVVNUzN5NEpw?=
 =?utf-8?Q?1J2dS9j9xKEutIdIWQ/aWUrK2vkdSywlaKUll?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfaf59ed-54ae-4e5a-cff8-08ded230aa3f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:39:19.1070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2y5yYIRtfztw412lzBgt/Y5Gq+sA2A3VynqOyEPjD/XaVbrGk1T9dxS4E9u2tLys/ER+lZosUpUktSmLcksKKAnlVcKnRDJs7Tkt8rjpH3ssQ5iqChuYRIHa1Idia8IY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11335
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65594-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:from_mime,vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,nxp.com:mid,nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 997956C13FD

From: Frank Li <Frank.Li@nxp.com>

Add camera parallel interface (CPI) node.

Reviewed-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v6
- add Guoniu Zhou's review by

changes in v4
- none

changes in v3
- replace csi with cpi.

changes in v2
- update compatible string to match binding's change
---
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi    | 13 +++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi | 27 +++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
index a72b2f1c4a1b2..b504f99f6acdb 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
@@ -222,6 +222,19 @@ irqsteer_parallel: irqsteer@58260000 {
 		status = "disabled";
 	};
 
+	parallel_cpi: cpi@58261000 {
+		compatible = "fsl,imx8qxp-pcif";
+		reg = <0x58261000 0x1000>;
+		clocks = <&pi0_pxl_lpcg IMX_LPCG_CLK_0>,
+			 <&pi0_ipg_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "pixel", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-parents = <&clk IMX_SC_R_PI_0_PLL IMX_SC_PM_CLK_PLL>;
+		assigned-clock-rates = <160000000>;
+		power-domains = <&pd IMX_SC_R_PI_0>;
+		status = "disabled";
+	};
+
 	pi0_ipg_lpcg: clock-controller@58263004 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x58263004 0x4>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
index 232cf25dadfcd..5aae15540d6cb 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
@@ -62,6 +62,14 @@ isi_in_2: endpoint {
 				remote-endpoint = <&mipi_csi0_out>;
 			};
 		};
+
+		port@4 {
+			reg = <4>;
+
+			isi_in_4: endpoint {
+				remote-endpoint = <&parallel_cpi_out>;
+			};
+		};
 	};
 };
 
@@ -95,3 +103,22 @@ &jpegenc {
 &mipi_csi_1 {
 	status = "disabled";
 };
+
+&parallel_cpi {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+		};
+
+		port@1 {
+			reg = <1>;
+
+			parallel_cpi_out: endpoint {
+				remote-endpoint = <&isi_in_4>;
+			};
+		};
+	};
+};

-- 
2.43.0


