Return-Path: <linux-media+bounces-62061-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHCLMpXFC2qWMQUAu9opvQ
	(envelope-from <linux-media+bounces-62061-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:06:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4E757645A
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BA733046345
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 02:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA1C2BEC45;
	Tue, 19 May 2026 02:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="S7TC43bO"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010066.outbound.protection.outlook.com [52.101.84.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0292D3A6A;
	Tue, 19 May 2026 02:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156317; cv=fail; b=sziUYNiEhhIcjDh3Gu/j1txnogZrlZPU1w0ZJiJc5+MBaywNPI+BnlNbJc8W1jwahjhn+UOmdKT/yg9MUtwUmq47wpzsPCUhhWRp9ZdZeHlISMWVYqB+hcgFcdrbllA1HX3k502su3IXF9QVbdzIjuLqNiPvfMCJ+BCEcrx+ne0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156317; c=relaxed/simple;
	bh=KHgnzlejLTaZb6vU8ge+OOIIkFkxNcDnJUheiNAMoXk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oSpqXVxN1zUIUek3xFMJSe9Te9MNmbzR1ZdfjnTO9BifWFaBdbeUHsjwBB/0gBLt5AafyVylvOVxaO/wyZtEEukmKRsnLrX2qM6pJcVj8g1ZKxrsAL0JvtQuFNAPMga9WQrRazIVDj6+Oepj8YdxjbsNYTjkQXVKZOs716oEsSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=S7TC43bO; arc=fail smtp.client-ip=52.101.84.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3Cv7vzcACBmDUKaQPN8xQbU/+1NXHK36ubxLKDE6WqR/Rqli97R98TA22v0Np7uD/0W4ekT5eUPFmye828/e/pYbXPkzm1gHyJyfaCRlc37QxUkO8hC55TujYNnynEkLTfDikxR0P5RFyC6FfcCkx9J5HRU5kv7Fs7OjumKHPff5LGpFyCsyY7UnCaAAxtFVSvw1Zm03PYV0eueIB+E6KnKeuzyqd6G9KKdQ2TdgJ8lJCGIXQNj/tWVRg2DLNmKZrG/Soy8JIZ+i7euNbn54EMzkCK51l+U05RRnM3tDB0crceSlcCjHMiSeaTjoWEORrmvTwBQAL0OuEMhDyhv7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjHSpIMLghsWXLV6B6NMdfazwYqqDWRTqKPxpGHOYGY=;
 b=gA3Xi4b3TopHm1Q7hpNT3JtTx7c93DoZNsSfderGGhnLPQ8ELiD1hxuEEJmED6R82vlKWPcKxvhRU1eN5fiHGvMpHM7zc1Zqlt9aqJSpxdJKMdJI1AzPoBsozIpoTbhX3HgXWK1QcsIH+gRr3mWaL3mBd2e3HIaTgsYmIzXibVCH/5NCnR1ZtAMciWcr+B2kznH6lYtsCVNDBaylGSfprrpyVh0C0XMCIVFnTII725k5ANlmXBbhxKbph4AWOwKQt8V+9MGUYeAA/bk3p5CimhjaGIbb6DeHGEXxmxoet+Y5Gq0tIGH+7qCTE5xzu3uQcWIcO1qVhUYif7BO5OR+Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjHSpIMLghsWXLV6B6NMdfazwYqqDWRTqKPxpGHOYGY=;
 b=S7TC43bOer7bkO1m+/Il3EZqVncyIlpv82AAxk0k1XjhqadLqQg52qv/l1qap+u28yBsbbEvWu+UP88lsGgJd5n8cekIOtTbUl/ANeUYxiOK4XkylVspCH7soxHr55FsZE+BXG4PMfLiDo4BT7aut+4TKzwJNzWbFwlhOz/UhW8rrnWbSfoDpiorTWxTA18SLTQvg6k9/74Olycod3c48FpfL/U7nOJpZJW9Slp9GqtAZyANmcD4ml8v92qBhOGnCf2+x8dr5uwMZwdmL03NdcjLoTIjRtPoAA7C/soR6Qy73YuSJ76F+5DDcXFIAFZ6avKp2VJKLZ5pNX/CqhUnng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU7PR04MB11139.eurprd04.prod.outlook.com (2603:10a6:10:5b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 02:05:11 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 02:05:11 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 19 May 2026 10:07:38 +0800
Subject: [PATCH v4 1/6] media: synopsys: Fix IPI using hardcoded datatype
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-csi2_imx95-v4-1-84ea4bb78a88@oss.nxp.com>
References: <20260519-csi2_imx95-v4-0-84ea4bb78a88@oss.nxp.com>
In-Reply-To: <20260519-csi2_imx95-v4-0-84ea4bb78a88@oss.nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779156481; l=2490;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=KHgnzlejLTaZb6vU8ge+OOIIkFkxNcDnJUheiNAMoXk=;
 b=/Gcvhx5HfwTBlm5tdf4lLNEzas7rH5F4L1ePUMsuonZgnjDEsh2awKQqUgKXkNZ6/sYaRc4im
 DBDvO5WfeN+D9wgTEU2FdsZ4tMJmJOzWpGgpAsA7veM/cxDOpFJbyvL
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU7PR04MB11139:EE_
X-MS-Office365-Filtering-Correlation-Id: 84398eb4-b790-4f48-4e9f-08deb54b0f2b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|3023799003|11063799003|38350700014|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
 KSYZI80eiSzbTZ4dVxZUmhIUYeiicku409j/IIpYDNFYTQyqkHpHUC/ltD79cf6rt8gfXs/YLSqYM1k/MM1rl0enhe1RPNyy8y+QZQT6gFfSDRmLU9wPCu9Srb7nLMsuahWEa18BWGFH9oUQwVIt1FfrOguLEQPN/NgsYZkZngdfh8mOv+5gM4bnCA4b0Jn5WGai3344xoPUbZGM82R0/jtD/NcHeWsWGoRNybu9eeTvqB7wrek3fw/lSUhtDYgsFwsYmCm06+brOPrjOFXjXrMeX+22Xuz6eW5Ce4UI4NeivYiSnPOo9JMTJ5IHv4B1rgMtHZJhbtdTH4m4S8mVkSGzir3/FZeSH8tW0DzN0JU/ZcXUo1cejgezzcabjeAwXyAHdCPKLWtQ4Nxi7rOLKO3GDrYkeoeDZR3SQjrago39wFxKsoMpGFJbiYit4Xs/QwWNwh4e8D1cMqYarFd6r4StrkjR1GhO4yDgyAutxfRIg5jzbLCr3WhMwty5RurgKe/emNpANupc383dLUwkX23hp5dsd5bpcXn4RLsKadXY6jqgx9N80xlTFdXq4wuK68K616gN8ph42ZDxaXGAkuL4UMZfP3rmR/dCWVP6r91qvKj0dnLo9DUfkq3B3V1Wsnt9O1nrdKEEwWBift7rHacWSXB83a4sZ6MH5g/mxL3lTzIcDq7clsoaH9d1FQ5pLSdNoGiH7lLoi8SLvz40fwb5q+T6l9kT0wzk5uYW/X+auPEj2EkkzjW/7O0eOXbbS6EmbcvASrG01IOPdOkkKA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(3023799003)(11063799003)(38350700014)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VjRnbUFKRVVKRGlyU2ozeUdPL2RCdmRkNHNKYnNoMVFUSzE3cTZSTmI5OGRv?=
 =?utf-8?B?VURSdUwyUTdyRGtaMHlWdElXWXNoMFA4KzlJRHRLdWZzdnpsTFRzNVdoNVR3?=
 =?utf-8?B?TDdkazE5VjJaZklhWHFXY2FIdzV1WkVxNXFIOEVKdjlNVnFKVmhTbk0zQmRP?=
 =?utf-8?B?R1NVUU1tNkVRTVBHODlpWGdCTnFjSjZyeUM4U1k5UnQrcGNENUdmSjVZS2Rz?=
 =?utf-8?B?OC9nZ3VZdEtpTEdORzUyVmQzMUduZVZ0SG96c0YvNTRSN0RrdUZFUUZlODQy?=
 =?utf-8?B?aEdabVY0OFhVRHkrSjh4TUtRQVZ1alFOblVuSEdIVnduc3VLY2NyRjkrUlFS?=
 =?utf-8?B?Q0lRYlZmSzF3SDY0R0VaUE1Yb0oyN3Nkb3hSU1RUUzJhSG9RYUNRM1J0bkQx?=
 =?utf-8?B?UEJ3bC9YZWxicThCN3YvODMwdjVCTXdCUXkzblFKU0I0WjVqVVplc3MzcFdF?=
 =?utf-8?B?SEtpbERzSE9aOUlBdUE1aS8ySjNlM2lMTWVsdUxZL3RvWGxrbTZ0QjVIbjJK?=
 =?utf-8?B?YUQ0dEd0MUc3eHc1UjhkRGZOM0JmU1pDcW1lWmZaZG9GbWhTY2xLeFNia24y?=
 =?utf-8?B?b2RRc2hvZ2xqZ1YxZWUzRk9Jd2hwc3lyK1hpV3F0NGlXZCt1RmQwK2hWOUM1?=
 =?utf-8?B?bFIxMWVOaUcrZ2c0Z0VHb0hhdW00VVRZanVEMklEdVZMMHc1QytxbDA2NjMz?=
 =?utf-8?B?RFRyWGJsMG1BZlVKUHpPMGlXcWMrU200c0JUV0JvUDJNOG9BSG1mbUxVdWpo?=
 =?utf-8?B?anp4UWVidlRIVUs0ZXpKVVBkaVFNYnVTNDlyNkZHdzJqMGhMeWM5eDBiUDB5?=
 =?utf-8?B?N0Nzazkwa1dDSG1vaHFDSENwZEVPckV1VXZQRzhKeHFnMHNraXljYWtIYm96?=
 =?utf-8?B?Q25IQ1FOOXBpRGlrWFdSaW5pNTd6ckVLYnpZTkdoMHhlTlNTdDJiWnFBR1BW?=
 =?utf-8?B?TmE0bDAzS01tOUEzMUlMZ3dvK3hrVWwvTmhYZDJUTCtHc29wYVdPYlMrOWwx?=
 =?utf-8?B?UzNtYWRMRndPRm0vKzl2amhuK2oyNWtmbUJLOG8wamE2R1hzQ2tZQ3ppK05G?=
 =?utf-8?B?alR2UjdlViswSzZnYU5QdlR3R05acTFyc3ZPTkc2ZU02UmVYRmJiSzZuUk5p?=
 =?utf-8?B?TCt3Y0lpU2JHbGNKUU1DTDZCclBHanRIdDd3aUdTOVVDbkEvbWZlS1pZRW9T?=
 =?utf-8?B?SUd2aVFFYTlzdkNMWVJkeDZJRlRMZ1RhcUdBbCs2bFRtZWZEUWczcHU1Q1BF?=
 =?utf-8?B?ckJSTC9RYzFWd0JpNEtVRytvV1MwU0pXSUZkZGZEMGY4OC9KZ3ZLZTFuczg3?=
 =?utf-8?B?TU5ubmVZeVZVWG13dWlVbjVGQmFtVXk1cDczZGIwRE8xU0QvRXpHRGUzdVEr?=
 =?utf-8?B?dXNJS3grMVBFYXFXcFJaRmdkcHdxYk0ya1RXQ2hJV1hzNjZ1bllXWWxxdFU1?=
 =?utf-8?B?eGFtK1pOb2hRVUI4VUNWd2JXbmNoOWtmQ09oVGJUNDhBQkM1eGRJZFFiQ09O?=
 =?utf-8?B?SENxVkR2MHZGRDUwYktvNE0wRmhyeGFpWkJyVitSeDROYndXSHdjdUE4M0Jm?=
 =?utf-8?B?bStOOUI1UmkzeUJtN1ozc2hDSEUwTytUSWt1ZkJMOHRlYmoyVlRBbnVodEgv?=
 =?utf-8?B?Sk9yTXZLaitEbjdWTjh2Q213MHUzWDMxU2N0Y1F1QWN1bTZpd3p1K2lMdE5h?=
 =?utf-8?B?OU9TSitGZ0xNOVduK1dQaFVyQlFaRjhUNm9KTjRpdXBCWjkvZWJaZ2ZTaW9a?=
 =?utf-8?B?S2I0REdpbkpPQ2MzOEtnOURlcHU4SWI0ak81L3Zqd1Q3MFgzQlE5aWszczBJ?=
 =?utf-8?B?R0lneWJqMmZXZ1psc2lhZzNha3Y3ZXhRNFdxSDlnMUVTblBDeE5Ddldva0dz?=
 =?utf-8?B?V25TYk5IWDF0SUtIZWJvTytnSGRYYmZ5ZUs5SHRpN1I0TFZuRTBKT1lvTFo0?=
 =?utf-8?B?SFlaWFJoYlQ4b2tnZTF4em1hQmJBczAvUVh1QXIzNi91MmtLR2dZTTNrR0xX?=
 =?utf-8?B?QnhkSWVGb0E4UFFEdk1IQ1FzNFVqZ291akkyUDJZeFhwVER4UDFJc2dMRlF2?=
 =?utf-8?B?RTB2M25kTlQ0YUExOTRsMW5uNmpCdng0RVBZSTcyaGorSzBOUm5aZzhyK21U?=
 =?utf-8?B?cnVnRUg3Vm0yMVhsZE5DZitCV1ZYbjJyUW85cmQyWFoxY1o4THZ6b1pYRVZO?=
 =?utf-8?B?WnVoZTlLNlpHT1Nld1pnczJnVmxiTkE5Z2E3UVlLQ2liTmRTanhGdFZrbjdn?=
 =?utf-8?B?UWtSaXZSYU5yWHJId2pndE1QYngzaHZrNU95ZWpWQUZZam44ZjRsMkc4R25Z?=
 =?utf-8?B?Rlh0ME8vR0RYeFJ6d3cwcFdkZjVHaDhsUDMzbXBnWnQ0emIvREVidz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84398eb4-b790-4f48-4e9f-08deb54b0f2b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 02:05:11.6280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OuI0tPTNfDBJ9mpJrQj/NfFsCGCzpJhbLeA3hqWbouOwVlAvE++447tCa9bDX6C09PzOGbW5bd9/9OEkKxpv7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11139
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62061-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 8E4E757645A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The imx93_csi2rx_dphy_ipi_enable() function configures the IPI datatype
using csi2->formats->csi_dt, which is initialized during probe but never
updated in set_fmt(). This causes the IPI to always use the probe-time
default datatype, ignoring the actual media bus format negotiated at
runtime. When userspace requests a different format, the IPI hardware is
configured with the wrong datatype, resulting in incorrect image output.

Fix by updating csi2->formats in the set_fmt callback to reflect the
currently negotiated format, ensuring the IPI configuration matches the
runtime datatype.

Fixes: ec40b431f0ab ("media: synopsys: csi2rx: add i.MX93 support")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Fix formats array out-of-bounds read during enumeration
- Add NULL check for csi2->formats to handle unexpected format lookup failures

Changes in v2:
- New added in v2
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 02eb4a6cafad..0b80e84983f9 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -311,7 +311,7 @@ dw_mipi_csi2rx_find_format(struct dw_mipi_csi2rx_device *csi2, u32 mbus_code)
 	WARN_ON(csi2->formats_num == 0);
 
 	for (unsigned int i = 0; i < csi2->formats_num; i++) {
-		const struct dw_mipi_csi2rx_format *format = &csi2->formats[i];
+		const struct dw_mipi_csi2rx_format *format = &formats[i];
 
 		if (format->code == mbus_code)
 			return format;
@@ -433,7 +433,7 @@ dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index >= csi2->formats_num)
 			return -EINVAL;
 
-		code->code = csi2->formats[code->index].code;
+		code->code = formats[code->index].code;
 		return 0;
 	default:
 		return -EINVAL;
@@ -470,6 +470,17 @@ static int dw_mipi_csi2rx_set_fmt(struct v4l2_subdev *sd,
 
 	*src = *sink;
 
+	/* Store the CSIS format descriptor for active formats. */
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		csi2->formats = fmt ? :
+			dw_mipi_csi2rx_find_format(csi2, default_format.code);
+
+		if (!csi2->formats) {
+			dev_err(csi2->dev, "Failed to find valid format\n");
+			return -EINVAL;
+		}
+	}
+
 	return 0;
 }
 

-- 
2.34.1


