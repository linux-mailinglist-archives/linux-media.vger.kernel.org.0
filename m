Return-Path: <linux-media+bounces-25696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 996BAA2974C
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 18:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 780493A9DBA
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 17:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761F120B813;
	Wed,  5 Feb 2025 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Dk5jGu6/"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654002066D8;
	Wed,  5 Feb 2025 17:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738775997; cv=fail; b=KqVpPPSmjuA9L4rwfvJIk7a/2/9Wd73etMLn19uFeT85NTC3kEBDeY9Q/JFdx37qfTZbmMXqoY1WRM513NT1aRVdh4LygVbsDImh9SZ0/9YeyiR7eZP5pss//5PfcPTkTyAPzvViQ4flGQwcuU69lvqeaLt2EpCUBzD9PSvsDas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738775997; c=relaxed/simple;
	bh=aF1Ou6+MrZnptvICKZ9OGWcAK/wpFxsiEloq6Xu2Xp0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tXj3xbi2w2Pi1NbUUA4YwxdvcSj4OaxeukfJkUuUq2ZxaiFT/PXwWfFtJ55EbctFL8Y56Bpe65fSWXZ92Bv66CZnw+WpqkGyI10NDdy2CagBxo8fxyOa9IMNTLUUoBZxv7I7w/vhFbIG9ENKLdMxqPGWqBQs+e6al60vAbIhB7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Dk5jGu6/; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGBq04CQ1IF3GqL+847v/uanDHd9bp0WMBy4jtdkoTHiovWGt3Oy2EgZM1/XFu2tQhCRATrF0eyWCn6i8YDGBie96cQ44gODUxBtxcLObStMj0+XFP5UxGEwmit1ZmZSBM46HWhHJEIIHlHAdqe9bleL7c7OzFau387r6vC8F/0r+UhYDvXVeKiesIlirowz54oUZEe1CpQRQG4MqszAzZR0BXxWyu2oWnK2Aq6lSmvHCq/YAbliLlnZXTYgJR48VlPOgpfJld3qjdKIEq0UbsRYs247gVeesT7UjGWduu3fs+hHMnYHfYFmkSAGoZQPV+egPplSdcBJCekm3ZZXtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sh1yzIlQRvhbGIhCdNq9+AE7O7EA/Thx+PJ/PBActGE=;
 b=cNJdPOxzt815cgA4+X1IhDt8eKjBWtvNzA2Hzq3DdwcPHmmxSp3pPMD4VXSLMxueg2Kp8KutO/x2WcQyYkcXtq6Kv42m0kGOqNlUK00sYTJF9PVu/VD1FMpTMXrZ9lU02oF58KDxcKkd3Uu8HT4f0iJri5blg28dcZF66grRJSm87TjZjkRRJhaP4i79RC8aiHgITnikD60wJUk38SiQ/zpHv9NBOG3dOlJW7SqjbrJpgFzwc7aDSWlGAJPq1c6d5cgVt3CFH/k1jRrLqXZNpNvd53XznkMnIIZFPBOtAKS2G256klWMbGBZ4umIvZkO4SWu4EMFXmRGx2AK0FW3OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh1yzIlQRvhbGIhCdNq9+AE7O7EA/Thx+PJ/PBActGE=;
 b=Dk5jGu6/AW1BgK4HiXt5OQ2CQrNAvmNj5+N8wkMX+w2gqj4PeuopIlNQNaSyu4s8dVGEr+RJxD/j+Od6KMXiHssdc+WpXAXGQvmQG/rb/FQjhJptSwtHi2pNcJziX1kvZLEgwjhq1kwNEQRaXOSqxmS3Xp8IeMkGRzXNnbRWDh/B/XPhAeVlFdekUCX9yvF4IO6/OVnpTgA95dUHKDpM0Jejf/UC7zKjVlo1dq45SjHHXQ14PKOGf9+4o2b1icFHp5TfAOh9krIFeBpk+Cw5c2fvJtzv0bFLf6i8ie0zhNXXEf+fLTUTHYLz9fKN0po4ZZA+y8wVmeUjxENJG6oFGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB8348.eurprd04.prod.outlook.com (2603:10a6:10:25c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 17:19:51 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 17:19:51 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 05 Feb 2025 12:18:20 -0500
Subject: [PATCH v2 11/14] arm64: dts: imx8: add capture controller for
 i.MX8's img subsystem
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-8qxp_camera-v2-11-731a3edf2744@nxp.com>
References: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
In-Reply-To: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Robby Cai <robby.cai@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738775920; l=17736;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=aF1Ou6+MrZnptvICKZ9OGWcAK/wpFxsiEloq6Xu2Xp0=;
 b=75Myrdb/K5rO8Nyogdr19wC0MwNhRTJcHDTSXAb91W7b0XpB4v1BAK9OhUcBm1NDbSN4NDMWm
 emgaG8lgEgDAzqBiwgNfibvlRGw9TKzNcVF84ulxpqgLi2Qwm7w8NPz
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba127bb-f59a-48b5-91be-08dd46094cfa
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?dWJyU1ZQZ2JOeXVJN1YvdWYxemMxV3lSK200ZVJGUTViWm5rZjR2azZ3VlFF?=
 =?utf-8?B?ZS9GbTZDK3VDNUtvS2lSU3ZWRGFnZ05tcmVveFlPNGV3ay9qTm1JQXdibGJX?=
 =?utf-8?B?NXpWc3E2cWtnSDVTL1pLdE5ZS1ZpZTNLdDhjZDBQWEtuR2E0UUVaY3lMVlpj?=
 =?utf-8?B?cnJtdFUrKzBpT1g0S0dUK1dONFRrZkNKTXljM0NBTlFQU3FqSWV2OVVKWmdH?=
 =?utf-8?B?eGo4VDlQbm5WczVqRjhrRkdSb3BYTkVqUGk0VTdoMFo1RS92eTNkTSsvUFNr?=
 =?utf-8?B?S2F1b2N2NFcyMzM0TnRsZjZmSDhKVGxHb3BJRmlJY1YzQzFTZk55ZmtpQ2h5?=
 =?utf-8?B?VEdDdzF4RE52eDFGdmg4dHR2MGxaK0dlMlh1dEpyeUlvWVVRbmdZUWQ1V3E1?=
 =?utf-8?B?bTdXNkRBaHFhZzV2bENvM3djUHk0dEhRVFNzblQrRTBHSUZtTEVjcnEyUVFN?=
 =?utf-8?B?N1dPRWxEMDVWZmNPMU5VR2hwUzVjM2xDeWR5eUFZNExyOWZCUUlycUozL3J2?=
 =?utf-8?B?UVlhWXcrZmRXWmJvV2FMcCtrbUROMXlYa29KeC9Eem5QQkJxYk1UNmxMdFVS?=
 =?utf-8?B?WDY1My9BTzUwMFdScjRhUkJPVGs1MXYxbGdoS3I3b25CZzhFb1VvaXhnU1pT?=
 =?utf-8?B?VXZlYkYzQjkybjlQZW51L3VjbGFnVllHaWMrZllUemZzNU92dlpiUTZnUE43?=
 =?utf-8?B?dnFnWUtpK2VDUnJrcXQwYm5sQ1ZyODJWdEZYcXBvUmhUYXcvTkxnaEp4a0RT?=
 =?utf-8?B?U05oSFNBNmZCYi82WVg4TkdPMFhtV3pkVWp2UGFad0RoNW9PbUx4MVoycHNq?=
 =?utf-8?B?bEFuRWExR0lYdk9XMzFraGthaHYrOWNOSWczKy9pRE5rdENEVjR3cnVLV1Fy?=
 =?utf-8?B?bWFGOGlVREJ5WmxDWTlPYWpYMDdqcXhKM2haZlRmeWdNQlQzNytvUUdPZXkw?=
 =?utf-8?B?N3EwTmkvVWJiUzZlT2ZCR09aMlZTVWVpVVNPeXc1aDBRTDd1Tm1uc0xBc1hZ?=
 =?utf-8?B?azFUOTJIMEdQamIrNmdVMWFnbVlUU0hNV1VOdmMwbHpkYkF1NWZUV0s3NG1n?=
 =?utf-8?B?bVZmZmw2MW9JY2xKR1E2Z29oZFd1T1UzSkhSQUJqcnU5Q3B6Q0x0UDhGQk1Y?=
 =?utf-8?B?OUxndHhrNzRiNUdHRUpWZEJEYWxqQWI5WlcrYTRUKzRyT21VUUE4a2lHZXlE?=
 =?utf-8?B?T05leXR1VldsaTROTk02MEt6cG13c1JNRTlwemR2bEw5c2gwR3NFQUt6TU1U?=
 =?utf-8?B?eXpkcWhIU3hhSFloeDQyN2ZjeUF6RWhOeFllM04wbTlVUzVpVkp6Z0JRTWZy?=
 =?utf-8?B?R0dnS050eHhzbnVKV2hzRHVGYTdFQzUyeHhjdkRxWXhHcVVwRThxRWovSXMx?=
 =?utf-8?B?TWdzZjFRL0R5UmFPYU5mV0ZMZ09QOXFYVzdMR1I1aXJMcnlmNlNibGZ0MWJt?=
 =?utf-8?B?MmhlbU1GanZDZkZVZDBId1pVNDZGakQ5RXVqYzhvMUlvM1VsQi9BNm5Eek1y?=
 =?utf-8?B?UXp6V1lkbnVlQjFjVk5INGZaVkZmTCsvWExTTFFkV3o0dmRCS2NnN09RM1VU?=
 =?utf-8?B?bDZMeFhnTE5KaERoV1pIUUxFd094OXpHN1hzSkI3YzlMeER4ZlY3SHFxRFlN?=
 =?utf-8?B?UUZnVGkvQy84Y2M1Vm9LaUJQbGF1OVptUGNaYjNXUXczWCtlUmZOSUVKQk9J?=
 =?utf-8?B?M0JIMS9JeTRPSDRXWWkxejRuZDNJNDYwekN3WVErWE9kekVEa25GZDBpTnhY?=
 =?utf-8?B?N0lrc1ZhWnR6U0FjcEVrS3hkZWxRa0dXZDN0blFjSnd5VVVlcTFObDRuYzZJ?=
 =?utf-8?B?UUVXNFd4SG5YTEF2akVrRXMyOHIzR0NiNUhST0tLZXNQUWtXLzBqVnFwZE1U?=
 =?utf-8?B?MnZDbUprOXRlN2xHL3Y2aktxNXNwZGRYZFdweVJzZ0dURWFVU21iTW5tMzZQ?=
 =?utf-8?B?akFaU0NKMUZ2a0JoTjFnblg0RmtWcEJUckFTUDNSc1pZMXF4WXZ3OTFQZ0Ra?=
 =?utf-8?B?UGYwSVFlSlJnPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZmZRWHpwMHRrd2dlVk5HNW5uS0c2SmkxOHNBVFkvZzJSRmRPTzR0ZWt6N1Nx?=
 =?utf-8?B?a1BaQ0o1VFdMTEpHeFdyVncwSjVDbEx3NEhrTWxoaHNKOHZ3UFFGSHI1SnhV?=
 =?utf-8?B?THI1ODBCTXkxOG4zRG1BSGJnTDdPU0o3N2xkNHIrajJDS2prVTR0TGFtM3lT?=
 =?utf-8?B?c1BkQ2hjQmlFNUM0bzk1bkd4eTB4RzBRTnpSVlVPQk9KRmk1MGtqKzZqV2VX?=
 =?utf-8?B?Skkxa0VwcVRxZXZOUis1bjlETVNHQ3E5cktpRDZ2OGtlRGFRODdqNktxMjA0?=
 =?utf-8?B?S3VweWZnS0VGN0ZjdmlNazU5enpOYW9YbXBJWnp6T2ZmK0E5NVZZbHNLUmpw?=
 =?utf-8?B?N0s4ZWh1WnI3enZUcStURTQ0WVZlZkVOMllJajdyaFB0RjBTWFFRV2dxQTZt?=
 =?utf-8?B?NHp5aGREc0dXL1RNNmlQZEN6Q05paS9KQlAxdGwwV2pjQ2I1UE5hTmRZS0Nn?=
 =?utf-8?B?UjdpM2duUWNUSVlxb3BOdG1pM0hPZ0tnc2dDUDlmUFBsSzVYb05DMm4yNGFS?=
 =?utf-8?B?dC9JbkVZcFFZaDhBVklrQ0dFUENIa2hGRTdBNWZlVnpndkt2RFc3MmV5ZUJ5?=
 =?utf-8?B?TU1yQWlQOW56Vzl5N0s5Qk5wNHJzODRMQ2VPdGZLTzNJbFpSNS95cDZsbmRh?=
 =?utf-8?B?M0JBTmt0ZHBUUnNTQnUzb1VMSDI3RzBjZEpaVzJ1VStQZ0U2YVBWWkhndkN5?=
 =?utf-8?B?YUVET2tCS296RUwvTUxsQjU5dHYzUHlqVG5XUGJkRmFMelJla2JScURIeU5X?=
 =?utf-8?B?VkFRamE0ZDFaRzlFR0h4ekpsQnlYS1kyVlFpS0hmMEp4blQvRGdtaXN3RE4x?=
 =?utf-8?B?K3VYK3RmaFpicXF3SG5icGhTV3dPc3JST1NWeWlldFZwUE1aL1NGMWlpZ2Vo?=
 =?utf-8?B?cmNkZXdrdHU2TG1SS0VGMVhRL3VWanE2bWJLNWw4SkNaTDVOYWN3VEpQS2Rt?=
 =?utf-8?B?QjNUM016VmFlbkEwRGNoc1BnV09rSmg1OG5CU2NlbnRrQUVwZHlBMVRhYWFZ?=
 =?utf-8?B?UFFMcTB6YWtCTjBIeWJrVTFpL0lNaFgwbUJNZTU5M1IwUFZxVVFZRkt4OHFX?=
 =?utf-8?B?Z3o0QU5GVjVpa3dDMnV4WkxOaTBPNGVyRExxYWtxeHNwdk4wcjhDNm5ieEM4?=
 =?utf-8?B?ZExmSStndG03VFA1T2c5WTBuSjE4T1pUSmdMSGZ1UnVLUk1VOXoxSnZKQkN5?=
 =?utf-8?B?a1BjVHZHdm1DSm9KbS9icU9lZmJTOWVoMlpKcEZOdEVkUGptRjlUS3lYMDdp?=
 =?utf-8?B?bUV4ZzRrQUdBT0pKYzVYSkljZlNWY2hQRHUxWmtmWitHbWp4MnRrMkNvZXlH?=
 =?utf-8?B?YXZwZENrZytFcmpXcEF3SXNhbjY5TEV2RU1VcjZoT0svVDZUdDRrckpXTG1w?=
 =?utf-8?B?eFhyT2dndi8vNG8zd1dBLzBnTmV4bzQ4UkdKSHBzaER4eURrdnR5dUIyeUtk?=
 =?utf-8?B?cGNaSDFSbjNibkZtQW5Yb3pYM244dnI1dzdJdnZhUm9JT2VhSzBDK2l0NG14?=
 =?utf-8?B?UUxYQ2R1VnpTSS9EZTJIM2NXRnlvV1dsdUlsNmdBdDRsWDVUMzhZTkdxajE5?=
 =?utf-8?B?NnROb2Z2TlAxRzd3c1FqUGtFTXl3cVNGZDNqYVBwR3VzTldwVVg5by9mS3o0?=
 =?utf-8?B?RVhiVnJLSmpWK3RZOE90SjRqa2IzeFdWcG9QMjJFdGJYL0xYMEZiVXFqN2Iw?=
 =?utf-8?B?U204N1NuaFE5R3JBUXJlWXBiKzdpZFh4cUwzc3lwTmV6dkp3eE05ZkMwUFl4?=
 =?utf-8?B?SUVUQk11RjVIai82blUxQ3VTK20zQ1ZlTlcyMzMrVEFpYTU5THpIT0QwY2J1?=
 =?utf-8?B?ZU1FM20vNWhhSzFvQldURngrSnBZeWtvWHFQMDZCakFybzZtaFdMNTUyRjU5?=
 =?utf-8?B?Y0FsTUVGTmhoaFdza2tVblZNQ1hTbXBZS05FTUZHTVN4dzkvdFBGSThsNGhr?=
 =?utf-8?B?RVlMS1N3aml0a0tOU1JLRnNqeWZjTEhpUTMxeHY2ZElEcnU4ZWJ2YlF0WDlC?=
 =?utf-8?B?US81V0R0eCtqa1JVbUg2QTRNcEJsZzdCVHBWT0hROWZWSFBvY2daejZqSVc0?=
 =?utf-8?B?dmpCTmtRWU9vZ1pJdDNXNHA0NnlqZ2VSRkE1NTlxaFhTbzFzR2kwV1JIZHRq?=
 =?utf-8?Q?3RqMvNdYTpBYPG9QEMfAaAKC6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba127bb-f59a-48b5-91be-08dd46094cfa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 17:19:51.7714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZ8NMes+uL+BbefqH4FIaDM+NsBa9UpwgBD7LSeVg+PkRcZgwtp6Ntl2ojc1UfC7QlHLnCKcK8VSE09z/F2iJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8348

Add CSI related nodes (i2c, irqsteer, csi, lpcg) for i.MX8 img subsystem.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2
- move scu reset under scu node
- add 8qm comaptible string for mipi csi2 and mipi csi phys.
---
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi    | 391 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi  |  53 +++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi         |   5 +
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi |  60 ++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi        |   5 +
 5 files changed, 514 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
index d39242c1b9f79..0ca7f7406c842 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
@@ -3,6 +3,14 @@
  * Copyright 2019-2021 NXP
  * Zhou Guoniu <guoniu.zhou@nxp.com>
  */
+
+img_axi_clk: clock-img-axi {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <400000000>;
+	clock-output-names = "img_axi_clk";
+};
+
 img_ipg_clk: clock-img-ipg {
 	compatible = "fixed-clock";
 	#clock-cells = <0>;
@@ -10,12 +18,285 @@ img_ipg_clk: clock-img-ipg {
 	clock-output-names = "img_ipg_clk";
 };
 
+img_pxl_clk: clock-img-pxl {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <600000000>;
+	clock-output-names = "img_pxl_clk";
+};
+
 img_subsys: bus@58000000 {
 	compatible = "simple-bus";
 	#address-cells = <1>;
 	#size-cells = <1>;
 	ranges = <0x58000000 0x0 0x58000000 0x1000000>;
 
+	isi: isi@58100000 {
+		reg = <0x58100000 0x90000>;
+		interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma1_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma2_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma3_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma4_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma5_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma6_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma7_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "per0",
+			      "per1",
+			      "per2",
+			      "per3",
+			      "per4",
+			      "per5",
+			      "per6",
+			      "per7";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_ISI_CH0>,
+				<&pd IMX_SC_R_ISI_CH1>,
+				<&pd IMX_SC_R_ISI_CH2>,
+				<&pd IMX_SC_R_ISI_CH3>,
+				<&pd IMX_SC_R_ISI_CH4>,
+				<&pd IMX_SC_R_ISI_CH5>,
+				<&pd IMX_SC_R_ISI_CH6>,
+				<&pd IMX_SC_R_ISI_CH7>;
+		status = "disabled";
+	};
+
+	irqsteer_csi0: irqsteer@58220000 {
+		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
+		reg = <0x58220000 0x1000>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&img_ipg_clk>;
+		clock-names = "ipg";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_CSI_0>;
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+		status = "disabled";
+	};
+
+	mipi_csi_0_phy: phy@58221000 {
+		compatible = "fsl,imx8qxp-mipi-cphy";
+		reg = <0x58221000 0x1000>;
+		#phy-cells = <0>;
+		power-domains = <&pd IMX_SC_R_CSI_0>;
+	};
+
+	gpio0_mipi_csi0: gpio@58222000 {
+		compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+		reg = <0x58222000 0x1000>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts = <0>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-parent = <&irqsteer_csi0>;
+		power-domains = <&pd IMX_SC_R_CSI_0>;
+	};
+
+	csi0_core_lpcg: clock-controller@58223018 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58223018 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_0 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi0_lpcg_core_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	csi0_esc_lpcg: clock-controller@5822301c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5822301c 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_0 IMX_SC_PM_CLK_MISC>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi0_lpcg_esc_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	i2c_mipi_csi0: i2c@58226000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x58226000 0x1000>;
+		interrupts = <8>;
+		clocks = <&clk IMX_SC_R_CSI_0_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&img_ipg_clk>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_CSI_0_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		interrupt-parent = <&irqsteer_csi0>;
+		power-domains = <&pd IMX_SC_R_CSI_0_I2C_0>;
+		status = "disabled";
+	};
+
+	mipi_csi_0: csi@58227000 {
+		compatible = "fsl,imx8qxp-mipi-csi2";
+		reg = <0x58227000 0x1000>;
+		clocks = <&csi0_core_lpcg IMX_LPCG_CLK_4>,
+			 <&csi0_esc_lpcg IMX_LPCG_CLK_4>,
+			 <&csi0_pxl_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "core", "esc", "ui";
+		assigned-clocks = <&csi0_core_lpcg IMX_LPCG_CLK_4>,
+				  <&csi0_esc_lpcg IMX_LPCG_CLK_4>;
+		assigned-clock-rates = <360000000>, <72000000>;
+		phys = <&mipi_csi_0_phy>;
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+		resets = <&scu_reset IMX_SC_R_CSI_0>;
+		status = "disabled";
+	};
+
+	irqsteer_csi1: irqsteer@58240000 {
+		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
+		reg = <0x58240000 0x1000>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupts = <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&img_ipg_clk>;
+		clock-names = "ipg";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_CSI_1>;
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+		status = "disabled";
+	};
+
+	mipi_csi_1_phy: phy@58241000 {
+		compatible ="fsl,imx8qxp-mipi-cphy";
+		reg = <0x58241000 0x1000>;
+		#phy-cells = <0>;
+		power-domains = <&pd IMX_SC_R_CSI_1>;
+		status = "disabled";
+	};
+
+	gpio0_mipi_csi1: gpio@58242000 {
+		compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+		reg = <0x58242000 0x1000>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts = <0>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-parent = <&irqsteer_csi1>;
+		power-domains = <&pd IMX_SC_R_CSI_1>;
+	};
+
+	csi1_core_lpcg: clock-controller@58243018 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58243018 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_1 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi1_lpcg_core_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	csi1_esc_lpcg: clock-controller@5824301c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5824301c 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_1 IMX_SC_PM_CLK_MISC>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi1_lpcg_esc_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	i2c_mipi_csi1: i2c@58246000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x58246000 0x1000>;
+		interrupts = <8>;
+		clocks = <&clk IMX_SC_R_CSI_1_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&img_ipg_clk>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_CSI_1_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		interrupt-parent = <&irqsteer_csi1>;
+		power-domains = <&pd IMX_SC_R_CSI_1_I2C_0>;
+		status = "disabled";
+	};
+
+	mipi_csi_1: csi@58247000 {
+		compatible = "fsl,imx8qxp-mipi-csi2";
+		reg = <0x58247000 0x1000>;
+		clocks = <&csi1_core_lpcg IMX_LPCG_CLK_4>,
+			 <&csi1_esc_lpcg IMX_LPCG_CLK_4>,
+			 <&csi1_pxl_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "core", "esc", "ui";
+		assigned-clocks = <&csi1_core_lpcg IMX_LPCG_CLK_4>,
+				  <&csi1_esc_lpcg IMX_LPCG_CLK_4>;
+		assigned-clock-rates = <360000000>, <72000000>;
+		phys = <&mipi_csi_1_phy>;
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+		resets = <&scu_reset IMX_SC_R_CSI_1>;
+		status = "disabled";
+	};
+
+	irqsteer_parallel: irqsteer@58260000 {
+		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
+		reg = <0x58260000 0x1000>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk_dummy>;
+		clock-names = "ipg";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_PI_0>;
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+		status = "disabled";
+	};
+
+	pi0_ipg_lpcg: clock-controller@58263004 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58263004 0x4>;
+		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "pi0_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	pi0_pxl_lpcg: clock-controller@58263018 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58263018 0x4>;
+		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pi0_lpcg_pxl_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	pi0_misc_lpcg: clock-controller@5826301c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5826301c 0x4>;
+		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_MISC0>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pi0_lpcg_misc_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	i2c0_parallel: i2c@58266000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x58266000 0x1000>;
+		interrupts = <8>;
+		clocks = <&clk IMX_SC_R_PI_0_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&img_ipg_clk>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_PI_0_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		interrupt-parent = <&irqsteer_parallel>;
+		power-domains = <&pd IMX_SC_R_PI_0_I2C_0>;
+		status = "disabled";
+	};
+
 	jpegdec: jpegdec@58400000 {
 		reg = <0x58400000 0x00050000>;
 		interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>;
@@ -40,6 +321,116 @@ jpegenc: jpegenc@58450000 {
 				<&pd IMX_SC_R_MJPEG_ENC_S0>;
 	};
 
+	pdma0_lpcg: clock-controller@58500000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58500000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma0_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	pdma1_lpcg: clock-controller@58510000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58510000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma1_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH1>;
+	};
+
+	pdma2_lpcg: clock-controller@58520000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58520000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma2_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH2>;
+	};
+
+	pdma3_lpcg: clock-controller@58530000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58530000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma3_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH3>;
+	};
+
+	pdma4_lpcg: clock-controller@58540000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58540000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma4_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH4>;
+	};
+
+	pdma5_lpcg: clock-controller@58550000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58550000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma5_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH5>;
+	};
+
+	pdma6_lpcg: clock-controller@58560000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58560000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma6_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH6>;
+	};
+
+	pdma7_lpcg: clock-controller@58570000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58570000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma7_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH7>;
+	};
+
+	csi0_pxl_lpcg: clock-controller@58580000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58580000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "csi0_lpcg_pxl_clk";
+		power-domains = <&pd IMX_SC_R_CSI_0>;
+	};
+
+	csi1_pxl_lpcg: clock-controller@58590000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58590000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "csi1_lpcg_pxl_clk";
+		power-domains = <&pd IMX_SC_R_CSI_1>;
+	};
+
+	hdmi_rx_pxl_link_lpcg: clock-controller@585a0000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x585a0000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "hdmi_rx_lpcg_pxl_link_clk";
+		power-domains = <&pd IMX_SC_R_HDMI_RX>;
+	};
+
 	img_jpeg_dec_lpcg: clock-controller@585d0000 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x585d0000 0x10000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
index 2bbdacb1313f9..946055ec25424 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
@@ -3,6 +3,31 @@
  * Copyright 2021 NXP
  */
 
+&isi {
+	compatible = "fsl,imx8qm-isi";
+
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
+		};
+
+		port@2 {
+			reg = <2>;
+		};
+
+		port@3 {
+			reg = <3>;
+		};
+	};
+};
+
 &jpegdec {
 	compatible = "nxp,imx8qm-jpgdec", "nxp,imx8qxp-jpgdec";
 };
@@ -10,3 +35,31 @@ &jpegdec {
 &jpegenc {
 	compatible = "nxp,imx8qm-jpgenc", "nxp,imx8qxp-jpgenc";
 };
+
+&mipi_csi_0 {
+	compatible = "fsl,imx8qm-mipi-csi2", "fsl,imx8qxp-mipi-csi2";
+};
+
+&mipi_csi_0_phy {
+	compatible = "fsl,imx8qm-mipi-cphy", "fsl,imx8qxp-mipi-cphy";
+};
+
+&mipi_csi_1 {
+	compatible = "fsl,imx8qm-mipi-csi2", "fsl,imx8qxp-mipi-csi2";
+};
+
+&mipi_csi_1_phy {
+	compatible = "fsl,imx8qm-mipi-cphy", "fsl,imx8qxp-mipi-cphy";
+};
+
+&pi0_ipg_lpcg {
+	status = "disabled";
+};
+
+&pi0_misc_lpcg {
+	status = "disabled";
+};
+
+&pi0_pxl_lpcg {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 6fa31bc9ece8f..c6a17a0d739c5 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -333,6 +333,11 @@ iomuxc: pinctrl {
 			compatible = "fsl,imx8qm-iomuxc";
 		};
 
+		scu_reset: reset-controller {
+			compatible = "fsl,imx-scu-reset";
+			#reset-cells = <1>;
+		};
+
 		rtc: rtc {
 			compatible = "fsl,imx8qxp-sc-rtc";
 		};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
index 3a087317591d8..4c15e4569a51a 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
@@ -4,6 +4,62 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
+&csi1_pxl_lpcg {
+	status = "disabled";
+};
+
+&csi1_core_lpcg {
+	status = "disabled";
+};
+
+&csi1_esc_lpcg {
+	status = "disabled";
+};
+
+&gpio0_mipi_csi1 {
+	status = "disabled";
+};
+
+&i2c_mipi_csi1 {
+	status = "disabled";
+};
+
+&irqsteer_csi1 {
+	status = "disabled";
+};
+
+&isi {
+	compatible = "fsl,imx8qxp-isi";
+	interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>, <&pdma4_lpcg IMX_LPCG_CLK_0>,
+		 <&pdma5_lpcg IMX_LPCG_CLK_0>, <&pdma6_lpcg IMX_LPCG_CLK_0>,
+		 <&pdma7_lpcg IMX_LPCG_CLK_0>;
+	clock-names = "per0", "per4", "per5", "per6", "per7";
+	power-domains = <&pd IMX_SC_R_ISI_CH0>, <&pd IMX_SC_R_ISI_CH4>, <&pd IMX_SC_R_ISI_CH5>,
+			<&pd IMX_SC_R_ISI_CH6>, <&pd IMX_SC_R_ISI_CH7>;
+
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
+		};
+
+		port@2 {
+			reg = <2>;
+		};
+	};
+};
+
 &jpegdec {
 	compatible = "nxp,imx8qxp-jpgdec";
 };
@@ -11,3 +67,7 @@ &jpegdec {
 &jpegenc {
 	compatible = "nxp,imx8qxp-jpgenc";
 };
+
+&mipi_csi_1 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 05138326f0a57..c078d92f76c0e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -241,6 +241,11 @@ scu_key: keys {
 			status = "disabled";
 		};
 
+		scu_reset: reset-controller {
+			compatible = "fsl,imx-scu-reset";
+			#reset-cells = <1>;
+		};
+
 		rtc: rtc {
 			compatible = "fsl,imx8qxp-sc-rtc";
 		};

-- 
2.34.1


