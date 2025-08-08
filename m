Return-Path: <linux-media+bounces-39176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C6EB1F103
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCA155A533B
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4F228F518;
	Fri,  8 Aug 2025 22:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SL4sW/HY"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011050.outbound.protection.outlook.com [52.101.65.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2FE29A9E1;
	Fri,  8 Aug 2025 22:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692943; cv=fail; b=b4ncT2uiwJGrR5cpWJdalA6nDRrJIMdnf9CsMQzjxoaFRVKR7/MzTZdnWsg2HCxrAsvEd8czwrwnGQsZfzIIvWK5ZowwoF7K88p2Ycfz/RYw0xp75Z7K4zQKKdip71yhha/IBgCIEow6VEntxdsixrkYBuIlMap54UgQzpm+Tuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692943; c=relaxed/simple;
	bh=scLgI9NJmWCKuGK/fM0IyL9XAe+9z+/G/wSwGDCuDUY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DP88yEtMvabHo5DaefJb1GKhOyKjsxjzigt3UjcCP4Cw9OIAb0lfMs6y/iLxeiYebVkQJ3MneSUWr7atrEJRzu1KPWv16n9NfwdiyZKLyCU1ASyccS1AvCnGhtDXFWP5zDUO2R5U1CB6hQuPCc9b+XM5MX7OvsupheYXoLDkfRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SL4sW/HY; arc=fail smtp.client-ip=52.101.65.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mnd7feofevX10G12f7yRjeYsm0glDf7XeZvRSRpDkGWSe5s4s3fDKLXxaZTHNso+kzY1COHwUnj6i1v0jbPo5+t8yTU1wSE7uusur4tbHqkmrXyaHaBWIcCYHlDbH2MT8znDkeqHB1AzvEGU0jDpO9rkBpaUkMIZquvTBiseGu5BlhoxAvHNTYw5IlXCxhXtep/ihzr1QU3ncaxnYTgptJzPIvDyhoZazNkxdBwu78VtCUtFd5m71rcghdVfZuoo2W31aaIDvc3TIZ+awNwsh0me/WlpTpbqU6kyZ9zTwc7U9iK0Qky23slKZE+I/I5XCo4kv+PkQKVuJZRlj5FenQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/6KjlNmlGGV0G9VrPicNsdvfVwlAQZXIc55SI3g4u4=;
 b=ho+SNm6RNBUr5smHaISkDXCPDTyT3tDbAGT8m7P7MJsn9xQ9P2qCRh54hbcVDXBycBZOSgeyWCkGGDdPx1QHTOzpf/V/80A05V7O4hsFlnRpXtrp/XQ/IjcPZW7uk1WXt8LxrWXzZggK3/MLwWsnzc7AEj5lrTDmns+zXC3/VxMfGHOh+1SrbAxe6Dd6zk55Uzfj7KzUtdI+8nkxgZaIeXGween098lBRRVFF98xxEzWo07awu+DhSL+AD62CXkuvsrMXgjTDSWKkwfodggXgZxEPlybcxp+SBIqHO6Au/zBR/zPTBgiv2cXanbu80HMt/qvnVbieMG3+70tZ6DLZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/6KjlNmlGGV0G9VrPicNsdvfVwlAQZXIc55SI3g4u4=;
 b=SL4sW/HYYoRunL9qvviZTwy7dXZFcPkGVZh5ZE6nwP1BNjal6Et3YPxLbdqCLZ1XVIYWxGOiVircxMNRWsjmOX18yBhOqijjhpZj1YVsWbHpsxmkFaAyxyb72QeUdWzXnX7BeMqrAVFfJukbDU6u8WztFwpb19II/imWInPZcx/8qVf+DwzSA5H4+l3mUsVIE5W97PmrMg31flFJizKNUFtydbwxWtAc4WwfDbAJsNU6F0cEpPrhsZUN+MBCcRvbQyejUCpRnDYdaCzhYtvQuMmoRr5bKC+ZSlw3jDVHmnvGdeA9YRPIZit3b0CSyv5jjQhE27l2Q0QNmRBBgTMA9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB11346.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:42:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:42:19 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:27 -0400
Subject: [PATCH v2 24/32] media: synopsys: csi2: Add register prefix to
 register field definitions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-24-4b29fa6919a7@nxp.com>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
In-Reply-To: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=3789;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=scLgI9NJmWCKuGK/fM0IyL9XAe+9z+/G/wSwGDCuDUY=;
 b=sM5CJgd0KJrY5FLU7PRv06R3uCiSGbFK1xmPI7AIktlLOLr1zEJmSPBN634pQ0LtG7eKM5UJA
 FY+VKS6r4/8BkVErQ7OmVbwP8yA8yqYKeR8gI+04CWGJY+5Yr3JTbh0
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:510:339::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB11346:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c5932a-c472-4e2b-0344-08ddd6ccd4ca
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?eURpMHN2dHM2Vmp2cjYxdDhUZW9CNlRMZkdHRGxCTzh4cXhMMFYzeitUYURK?=
 =?utf-8?B?V3QybmVkNDdGWnI5ZjZuRlY5UGUvd1RJMjMzdU1kSG54ZFlwcWFueUIvTHdM?=
 =?utf-8?B?ZU9EeHQyS2d3aGhpNjFaZFN1ajFsU1E5REJZMU5XcFFYQXd5NXkyeTZHZ29Q?=
 =?utf-8?B?VzdNTzBNNGtkd0ZxSjZ2UXR2YmNLcDdOZVQ3WXVpZmd6WE1TQk80eVBScVRT?=
 =?utf-8?B?VDZNN0RRNjNFWUl0TWRkMm40VGZsTzVRQ21OTWIrNWtHbE1hangwQnRtdm1I?=
 =?utf-8?B?d3hEZXNRcTVFcGtyUXdYSmkxVjgzRkdpNXoyc2hEQ01WKys5ZVlRR0xQOGpo?=
 =?utf-8?B?emk3NnUzQm5JYjJUeks0bEJXcHU3V041NzUvZXh2U3FIZk5hZmFrenJ1Q1No?=
 =?utf-8?B?Mmo3U2ExeGlNWEZRdHFzNGNvSTRzUHdLRUxLMzU3c0E2ODk1VXFvbVRwK0tB?=
 =?utf-8?B?U3F4OFVzalMweHFMTFFDM2paQld6UHRNcm1lelUrRTFvQzUwTXM1djZ1STNo?=
 =?utf-8?B?NHpOa0dDSjNrdVozT2JmaGdSUTNnZDRqRjN1MWRFVzlQWCtZR2I5UUlYc08w?=
 =?utf-8?B?Z09sYVU3YmJyRW92cmZZVHh5UHJmbEZVcmVhcGxlejlxb2pKSmUzaHl5dGxC?=
 =?utf-8?B?c2Fad1Z4c2dLK3NlbFovcDV4Z1hNaGlVVFBxY1RBS2Z0aFlVbW93dEhwSVRw?=
 =?utf-8?B?c0lhcUh1elUzU3d4bENZTUg1S1cxOFlsRC83MkJsMDlPZHNLNmFwNkExc3BI?=
 =?utf-8?B?OVNRWExLaWYyU2taZkl0TFloVEIvaG1QTTJ6UkduVm1QTndOTjR1V2V3bjl4?=
 =?utf-8?B?eVBYZGVra1hOTm02L1JEV255c0plNDZ0b2dFajAyeWJ6a2ZaMWplb0NFcEtm?=
 =?utf-8?B?QjlESEk2cDFRTHVFQ0R2aE1kNnF4dDMyYXZNM0RVc2sxUVp4cTI0VGhjSEtp?=
 =?utf-8?B?L3NjcDFSWU0xWUF0Q3VwR1ZyRWxYVW1yTENZN2YyenFEbS9zMXNLcXIzN3k5?=
 =?utf-8?B?MHVRUktMVStpMVBSUExxNEVqWi9odHIwQXN6MkF6Y2FjaURFaGM5VG9ZQWt2?=
 =?utf-8?B?OHdPYlpmVVNXb0JRc21xdTB0SUUyREJMaCtKY08rMWVwaUVHLzBBV3lhRjU2?=
 =?utf-8?B?N2Y4RXphMEpTeTJjc2JzWHBFeTNBUEprN3FnRFAyTjduVGFDeExFU1lMT0NT?=
 =?utf-8?B?RFh2NWJpZkwzeVRrbldzSzFYMmE3MUFhQUNEV2hTOXAxMVh4ZWxmbWR2dkl5?=
 =?utf-8?B?NTJVRDRncnZyd29uMmNhWDdvY1JhN0RXTUFSTjNyNi9GZkh5ZjBsQWFPekRG?=
 =?utf-8?B?czR3V2NiNDhYeEhKbDV3ZFlPVFMybFRtWUdBTHMwdGdMQ0NCYkx3LzRXa0Z6?=
 =?utf-8?B?d0J6Zlg5SjJYWGlCSDE0NFhld1daUkRpOGorMXpHRy9YSkpZRFJPazArNjFE?=
 =?utf-8?B?TmpzSG1CdW9KRzNDZHh5VXRsa0hBVFUwRmNtekhackphRmhNWEpRTms0eERm?=
 =?utf-8?B?R2JKNTlGZVlVZEFuQmRtOWNmdG1CUk5VWFFrejdtbjhBNXc3ZVlIcnhrUVgr?=
 =?utf-8?B?T3NnUytUbDBuTlBlbVJiWXJGQ2JDYnhMUm1ER3FnM1Q3UnA0YTJ3LzVZTUJz?=
 =?utf-8?B?ZW95ZE9UNkVGZTJPcXo0NkFxbFM3K24xQnFvSWNDb053NS9pTzBHTTh1bFIr?=
 =?utf-8?B?M0tQMFphTWpqR2RVSEZiUjI5cDEyRUxUY3RQSk5LSVBKVitQMnRuWkI4Q3lO?=
 =?utf-8?B?dEEvbTdTd3Y5VTRBT2cvZEF3d0xBS1MrVWVQU2VaeloxYUdUV2tHeEVFdjUv?=
 =?utf-8?B?cmNZL3A1MVBSMkIwSUlyMFQ5QmlGRjR0eTVvN0kzL3hodVNPL0xrcVZ0RG43?=
 =?utf-8?B?dDRySUFaQU1TYXBaYW5YcThhVXNoRFYrOTVRWG1UMHYvNVNBakxvdHBLYjdE?=
 =?utf-8?B?bmM1ZGVtdHFsOExTN3RxN0c3ZjlYWGVlbWNnTC9tZTlsMFNEaUJSYmJFVG12?=
 =?utf-8?Q?+JKK8jJIurWC1H2Ztaj4RhgwwU8p+Y=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?a0JJUUh0Wi9kUlc0RDMxTzgvNTlOR3Vud2hJbldhLzZkMWIzbVpneWpvcXJw?=
 =?utf-8?B?SHRRSHpNNVIvOFNlMWkybVhlRkxWUUcxVTJOSlBPU3hLdmphbEdkTCtmdERq?=
 =?utf-8?B?MzkvcGFKZ2JmWGQ4bHVwdnlMSGtqRGxzL2xneWYvNm5sM0Q5RGN4MHdIdml5?=
 =?utf-8?B?cjdIb2J2QWlTbzNrRnpIRTVKUUZMeDllR2RYZ2EvY2U0QUZVY3llV284VUlv?=
 =?utf-8?B?M2hZcEJQU0VRd3RLV3ZIWWh3VUpMcHRYR2RxbndVN1ByUXBwbU5nbHRXOEdv?=
 =?utf-8?B?b1k0MVQ2TnFZTWx3UHU1SWVPVHN0RjkxTWttUXRzcVVGcTBuQWszaXJxdFZQ?=
 =?utf-8?B?eXJjMkkyRTRGOXZPL2c4TUthT0ROMUlxVVFRZ2JWMjhnQ3lFSG5lUldkNU9J?=
 =?utf-8?B?Lyt6aSthcm0vbWZkL3hNQWExVGRjNndPKzZJdG5HNEU5RG94RkhOOHZuRlJE?=
 =?utf-8?B?UU16bDdBTllTamhxMGROU3Ivc0FOS1EvOW1JWVBaUTFlV3VZbHcraGI0QzE5?=
 =?utf-8?B?b3NPa1BxN25uVjV3VTJTTkcyaFA1Z0NoUzNZbUpZbHlJdjNTQ0k0cGxoSDdw?=
 =?utf-8?B?M2E4b2lCakEyTzVwL2ZUUTM1NmdjV1pNajlvQzVSeCtqNEtxeWlabzlpZnh0?=
 =?utf-8?B?dVpldFNXR2NzSHZxS1dnOEovMnkvL0ZGVlQyN2ZVK1lnZVU5NmRtZWhrQmQr?=
 =?utf-8?B?SlhGUWMyKzNET3NRbGp6TWJDeGRYdjJVbWVDUmlSV3R1b2NCdGdEV0dMMjYr?=
 =?utf-8?B?czJzUDdKUWNLU2RzcEN2eTJOMWs5S2ZLcTZYT2dmVWwzUFR2M2piOVJLOGhr?=
 =?utf-8?B?b3F0SE85TXBHcUhESGJweHdYTHV3c1J5N29yb3pSdndOb1IyZU9GMWI0L1Qy?=
 =?utf-8?B?bTVJZ2F2b1FBWm1ZcmZyZmtOclBsb1U2SnovNVlFNUtpYlFZdUJvaFZhM3JE?=
 =?utf-8?B?TmlnQy9ERW51KzFGdzBuTUdpN3RjYXE3QkdnVUszZmdsMVZxSXRNUnBnY1Nq?=
 =?utf-8?B?YjR0YldWQ1NTT1RMNVdZRHV1K0ViTWx3V1lRUHlQcWdEZ2NjVDdSbTNQbkpR?=
 =?utf-8?B?M3lkM2ZDMjQ1eFQxSnpkcjBxRkhyYWZlMGVkekFwaHo1NmZHNUNKZ1Q0RFpl?=
 =?utf-8?B?WG02NkRLeHU4V3lOWSswKzVtcUwyUWxBWmgyNWNwc1FRNDhuL3ZFVk10R3JB?=
 =?utf-8?B?cHVyZkdWcjNvTjlYbERudFZ4QkhPVW03U3crUGo2NFJ1aWtCYkl6V0xYVkhR?=
 =?utf-8?B?NWhHaFBvcVBETjNSWU5Zbi96bklpT0Qzamk0Y3ZjU3k5QlV1eExYV01yZzVz?=
 =?utf-8?B?aWpqU24vT1FVM3hUZzBxNlpkdERyTWlXRk04WGtMcGFZbWdhYzc5SG1xa1RV?=
 =?utf-8?B?My9FTm1TcFBCbmhxNnhWSGpDamFRWEdKRDZJWkhmUkNvOTNPV2h2YlFUOEIz?=
 =?utf-8?B?ZGk2VlpKTExPUGZwYTI3enc0bndWRzlLdXpMZHVCMnJmSGxQNVpmcGVhMWpJ?=
 =?utf-8?B?bUZCWlZvbUdXekxqUEhSTndOU29vbHByQlJpRVFISCt5UVd0M1NueFNBdzhI?=
 =?utf-8?B?WWZSalBxd2ZUem0rY05YckVxTGQwdFNGcU1zb2QzczZqY0d5U1FtakRXL0x2?=
 =?utf-8?B?bEh6VDNmVjdkdURPdHlQK1c2MkJrMmNub2xxRGJNamJLOEY5Z1ZtajQ3UThu?=
 =?utf-8?B?VnRhN1QyY0JUMERaQ3phdU14MXMzM3lsTU1DVUpmTGVIWWdQVVA5NXZ1eUk3?=
 =?utf-8?B?b3U0Z2xsUzFSOVdpTDl6QmhTL3pOWHdENlpBVzFJMnMzMDVPaUZSUmtib2xT?=
 =?utf-8?B?Z3dadms4UHR1b2VWY2RCL3BEVW1sKzYvdklRcGpVR3BQeE9mRGZsOGpPbm9S?=
 =?utf-8?B?dWNTUjZRL1krdjVtZzQvS2dKcmsxZWFpNVJDYWttUlZNNUVOOHRkSXNmZXlF?=
 =?utf-8?B?dnRlZTJRTlBCSngzN0U5WFhlL1Q3S3pwRE5OdUd2bzNiN0tRa1Fxbzllcm1r?=
 =?utf-8?B?WmFvNmxLdXRHYzRic08xQ1paakthZ09kQkJOZmtPY1NBNndpbXo3TGdKRWcz?=
 =?utf-8?B?WVdWS2p0K09OSFVUWEZEWVcwbG4xbm45QjNzdnVmSUt6UTRDYVBwc1hDMjZr?=
 =?utf-8?Q?JBlTHizqwE5ZhSSkhAN2VBxBj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c5932a-c472-4e2b-0344-08ddd6ccd4ca
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:42:18.9577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ar6BemMPo/hpusPnO7ONb/g+FbMiqa4mU1XV6erY4a+RZGINxdS5ESv995GPDuMnHa4Z57yD8Z86X04Yk9w13A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11346

Add register prefix to register field definitions to improve readability.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 30 ++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index 5c41b9570dcb97f58018bbaba1dc67a3c120a60b..df19b960d33681452af49dad5e6bbb94daa63489 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -146,16 +146,16 @@ dw_csi2_reg_err((csi2), #__name))
 readl((csi2)->base + ((csi2)->regs->__name & ~DW_REG_EXIST)) : \
 dw_csi2_reg_err(csi2, #__name))
 
-#define PHY_STOPSTATEDATA_BIT	4
-#define PHY_STOPSTATEDATA(n)	BIT(PHY_STOPSTATEDATA_BIT + (n))
-#define PHY_RXCLKACTIVEHS	BIT(8)
-#define PHY_RXULPSCLKNOT	BIT(9)
-#define PHY_STOPSTATECLK	BIT(10)
+#define PHY_STATE_STOPSTATEDATA_BIT	4
+#define PHY_STATE_STOPSTATEDATA(n)	BIT(PHY_STATE_STOPSTATEDATA_BIT + (n))
+#define PHY_STATE_RXCLKACTIVEHS	BIT(8)
+#define PHY_STATE_RXULPSCLKNOT	BIT(9)
+#define PHY_STATE_STOPSTATECLK	BIT(10)
 
-#define PHY_TESTCLR		BIT(0)
-#define PHY_TESTCLK		BIT(1)
+#define DPHY_TEST_CTRL0_TEST_CLR		BIT(0)
+#define DPHY_TEST_CTRL0_TEST_CLKEN	BIT(1)
 
-#define PHY_TESTEN		BIT(16)
+#define DPHY_TEST_CTRL1_TEST_EN		BIT(16)
 
 #define sd_to_dev sd_to_dw_mipi_csi2_dev
 
@@ -235,20 +235,20 @@ static int dw_mipi_csi2_phy_write(struct dw_mipi_tstif *tstif,
 	struct dw_mipi_csi2_dev *csi2 = container_of(tstif, struct dw_mipi_csi2_dev, tstif);
 
 	/* Clear PHY test interface */
-	dw_writel(csi2, PHY_TESTCLR, phy_tst_ctrl0);
+	dw_writel(csi2, DPHY_TEST_CTRL0_TEST_CLR, phy_tst_ctrl0);
 	dw_writel(csi2, 0x0, phy_tst_ctrl1);
 	dw_writel(csi2, 0x0, phy_tst_ctrl0);
 
 	/* Raise test interface strobe signal */
-	dw_writel(csi2, PHY_TESTCLK, phy_tst_ctrl0);
+	dw_writel(csi2, DPHY_TEST_CTRL0_TEST_CLKEN, phy_tst_ctrl0);
 
 	/* Configure address write on falling edge and lower strobe signal */
-	dw_writel(csi2, PHY_TESTEN | test_code, phy_tst_ctrl1);
+	dw_writel(csi2, DPHY_TEST_CTRL1_TEST_EN | test_code, phy_tst_ctrl1);
 	dw_writel(csi2, 0x0, phy_tst_ctrl0);
 
 	/* Configure data write on rising edge and raise strobe signal */
 	dw_writel(csi2, test_data, phy_tst_ctrl1);
-	dw_writel(csi2, PHY_TESTCLK, phy_tst_ctrl0);
+	dw_writel(csi2, DPHY_TEST_CTRL0_TEST_CLKEN, phy_tst_ctrl0);
 
 	/* Clear strobe signal */
 	dw_writel(csi2, 0x0, phy_tst_ctrl0);
@@ -271,7 +271,7 @@ static int __maybe_unused csi2_dphy_wait_ulp(struct dw_mipi_csi2_dev *csi2)
 	int ret;
 
 	/* wait for ULP on clock lane */
-	ret = read_poll_timeout(dw_readl, reg, !(reg & PHY_RXULPSCLKNOT),
+	ret = read_poll_timeout(dw_readl, reg, !(reg & PHY_STATE_RXULPSCLKNOT),
 				0, 500000, 0, csi2, phy_state);
 	if (ret) {
 		v4l2_err(&csi2->sd, "ULP timeout, phy_state = 0x%08x\n", reg);
@@ -294,7 +294,7 @@ static void csi2_dphy_wait_stopstate(struct dw_mipi_csi2_dev *csi2, unsigned int
 	u32 mask, reg;
 	int ret;
 
-	mask = PHY_STOPSTATECLK | (((1 << lanes) - 1) << PHY_STOPSTATEDATA_BIT);
+	mask = PHY_STATE_STOPSTATECLK | (((1 << lanes) - 1) << PHY_STATE_STOPSTATEDATA_BIT);
 
 	ret = read_poll_timeout(dw_readl, reg, (reg & mask) == mask, 0, 500000, 0, csi2, phy_state);
 	if (ret) {
@@ -309,7 +309,7 @@ static int csi2_dphy_wait_clock_lane(struct dw_mipi_csi2_dev *csi2)
 	u32 reg;
 	int ret;
 
-	ret = read_poll_timeout(dw_readl, reg, (reg & PHY_RXCLKACTIVEHS),
+	ret = read_poll_timeout(dw_readl, reg, (reg & PHY_STATE_RXCLKACTIVEHS),
 				0, 500000, 0, csi2, phy_state);
 	if (ret) {
 		v4l2_err(&csi2->sd, "clock lane timeout, phy_state = 0x%08x\n",

-- 
2.34.1


