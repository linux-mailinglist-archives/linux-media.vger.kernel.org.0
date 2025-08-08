Return-Path: <linux-media+bounces-39155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7084BB1F0C1
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8B9E7AAF2A
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3F928C2D8;
	Fri,  8 Aug 2025 22:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GjDuTDjj"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011011.outbound.protection.outlook.com [52.101.70.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E2B28C2BE;
	Fri,  8 Aug 2025 22:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692821; cv=fail; b=WuvcS0HFE6K3f+Ql9veYrt76ejb10bOIMCvoPgeDVjjQdUk5VzrN0GovZnTd45F9+w4E9BsRQD32Kvpb3v7bXzH1IPgugXaai8U4j3E/7Ymr75W1Gt3hpW5VLz9UKopFNIuQswjRL6eEk9dC70spQWqvwS65RnjjsKHuPjx17bU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692821; c=relaxed/simple;
	bh=HQAAjQ5jBggNPZtk7Y16wN+XhAo+axKHE2thVqJzqUo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XRqG5jR3tZPm/Bw1bdxcBdNLs4G+PWqwBNufOg01S5RouloeWVRvI0noMAVVKs0y3YqjRnmt6stnAoD+FrI4ivgOVG02eaxL7qPjc7lyTv4inuXljVTCvmRiTcp/BkXXlv9d035l7kL6i9qjvKVevKL6x0JyD7gPtvGxs/rjdUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GjDuTDjj; arc=fail smtp.client-ip=52.101.70.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HgsZVG8znejWvi78+/+4Y4zJh0ldnbEYfa7C2V+LK9WPz4U5PqV1OC0/kd2AIwyfXOu5qN87qXPLOb+gRTYLShtUwOKclNU2IzUrxZj9OngzX9cR/7GkpWwHwK5r8XXx/Em+8/gaN8sFDilwK9GrsDR7JDiDHqrSuv3Lg0+cUAA4aTTyeTkRs1HRxGLX2NLakkHQ6SmYy2b2WzFsRWZphuTrpBOvnTiySNLn09G6AghV+nqtdh/JpyJE/VlrB8/g8M+WKOQKrTSX1qzxNexeGEin8UzPI/0wGAEyoDlsbJ4Kc0Ocyf8cXNdmc8mUPUigU1BlXmSCH3BNJEC/k1eC1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awieITjWq1u9DpuxRgM7Uh6BWHAU3kTWtmU1L8jBhn4=;
 b=QB07F1tx4oW0KtZtaK7gtzh5ygtncL43TyrQnr4g2BFlI3NE1jAEFUW0TTtmD3hHznrzM4z7FQfTBMbi4uAviCVvq5p0ej9VPfii0FR/saB+PBBtg5ZDpWJAzeviBZFYjPhIgIR1UvQE7NkIOznQJGtIawatan4oPCQFlCMaJ+eJQoUEsawjkrWYHYq15J/G5uQAOwYuLWtc35qGKop641lit95oyW0aRtWsA113nE7AK5mW7C6HZCzsK68pXHH+7zkC2+5kyaGfITnXcdcGOkpxxkijJ0HekPCqd0onzyCbBwC4UJr0Uj5yKG52jIYbvyYCeMButgC82G7/le50tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awieITjWq1u9DpuxRgM7Uh6BWHAU3kTWtmU1L8jBhn4=;
 b=GjDuTDjjSvZdGgDNvcw6cHBWXUgurG4fzi8Mi9O0BAfZwcVa3uA/KbMNNJWnXCsdZuzf5D2g6J5jmTnJgiy+8o3K5jjChrHKFi5UH3L0viyl40dzIclR2ndJjKV/jNOFmz8tdWXCHbF/K6YNvEcKXlUhGcTQ9y7bcmbSo7S+cqDHwOmfhgqGXxPeKOu2qQrJM0MzXSSgHcEvJpI+X0bWWmCEwzvl+kuo572hzezf2k2PWm2t3F+ne304jirWda4y8Rt25i8Tv9kONbmR3xJ+eSFTbbLR5ASEUcAoakxmAtfmjTSd8jhVnINRijYvcDB0URO3krJiMISn/6oIDDSABw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:40:16 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:40:16 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:06 -0400
Subject: [PATCH v2 03/32] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_bpp()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-3-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=6923;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=HQAAjQ5jBggNPZtk7Y16wN+XhAo+axKHE2thVqJzqUo=;
 b=SuIx8ko1i8J81rz+GV2wrHnL7ZFtC9x+hAmOW+NMav2aKMD2rStX+jPTBiRmO/bhfCZUQun8G
 yO8WQLHfxDdDvgGkR+soeuDXuQTNp4DJkKtK3jHvgmydCeGntMoZfGX
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10528:EE_
X-MS-Office365-Filtering-Correlation-Id: 1013ba9e-49de-40b2-0753-08ddd6cc8b9b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?T3RMc1lYY2hBbDlFNXc5M1pkTnBMUHpkVk81V2VDdGJlMFpjY2tLTEZ3Q24v?=
 =?utf-8?B?UUVsSS9TN3dTMm9UL25pMTBBcVY1cXFLMnovZ2s0d1d0MmtkYmFmM1dlcFFH?=
 =?utf-8?B?Y2gvL25LQWVlY3dHY3N1citwUCszbUVPaWNYNzZFMWV4UEZjOGozQ2dXVXpy?=
 =?utf-8?B?K1RwMnpxZGRkcS84RmZnMW5mc0JNdjEzNXMwd3Jsb1pjM0tTOHE1NGpJbVJV?=
 =?utf-8?B?VTQ4OHNvc1AzemFneWtiUWxaajhXOU5zc0grazNiSFlxaHJIdk9OK1ZmaFlM?=
 =?utf-8?B?T3pkWG1zS2k2dTBVWG81cmJOME5ESThWbFZSbnpkdUltbUxtb0VsWGZPWCtR?=
 =?utf-8?B?MlI1RXZGaGFJRWlISzhNU3hidHJmVGM0VkZDR0w0bGZQS1dGZ0NWVDB3U2Zh?=
 =?utf-8?B?S1ZKWHVvdFYwS2M0WXc4NGcxUVZ4c2pnQ1d0Qm93VkRrR0xybkNxUXVKMFJl?=
 =?utf-8?B?a3FVTjBZQUZsUzdqUFAwWEFCSE0za212eGV0cHNHanJNZTNlU1J6WitZS3ZI?=
 =?utf-8?B?R2VsV3cyNC96b3BtdFJ0RHk5SElNRlFSbzZPejJ0TEZERlN6c3lobDEycG1r?=
 =?utf-8?B?cG44a3RKY1dyVkFnSWtDY2YrSndzWFpSWUhENXRpSU5rQTB6RVA5WDk0OXN0?=
 =?utf-8?B?WXRFc1drRDZZQTFlRFlJODQwZy9jZk9IeGRMMzhGVmlJckV5STZuSXpvNVJH?=
 =?utf-8?B?c012dFR1cENDaDNCOWl0R3U1SnU2alhMUi9aeU9oY1E5VnVyUWF1RjlRNVc4?=
 =?utf-8?B?Z2VTS2hkaVYxM2FRUFY5WUx2RHBEcEk3WWMrcjhSaktJYmYvQjRvS3BSdXAy?=
 =?utf-8?B?SGQxa3JqVGFzWGxObGl3M3c1MDk3RnV5RzJGdVZOaE8zRmZDNEpGaGtQY3Rw?=
 =?utf-8?B?eDB4c1NiMXZUS3pRL3N1c2dkUUUvYUczSGlFNzBJQ004bGFKVnZnUVNKT2py?=
 =?utf-8?B?MFhodzB4ckswNmVqT01iTEtVTkNpanVwMzl6djdBZFZuRDVrWWxEcm0yckp0?=
 =?utf-8?B?aWtBTDdYazIxdDBDUnRWZ3pMc2ZlY1ZtbDZTTmliVFp5YmtoV1J1QmtaRkJh?=
 =?utf-8?B?eklPajhmaG5qUlJSM0FmL1FpR0xIUmt3SExiTHdqUmRjeC9QMUUzRHhNdlk4?=
 =?utf-8?B?SnhvMmtHV3h0YUpLSUNqK1hGMGdzdlpCdklnTlpkMjkrdmlvTVFKajRYckF4?=
 =?utf-8?B?L0dOL1pDS3U5ZTlyRVBJT3M5b1BySlUrbzVlWUJPdXlKeG5KcjZpUzNyZmJm?=
 =?utf-8?B?b1JYNXFpV0FweTFwZ2Q0WEVua2loL2NuUHh1K2xseFpTRDZjVkFoYVNNQWE0?=
 =?utf-8?B?cUVQNjZkenlqRTdadm9CcEdHdVh3b3RlUXRHR0JCbHdqZ0hQUDdNbWxsbjZy?=
 =?utf-8?B?dTF1bEZPa1g0cFlvRDdYZXhaU1R2ZnVNdU10OVoxbFNWWVVqQzRxekQ1eXMx?=
 =?utf-8?B?dzFUZndNekt6RUR0NWV2aVZpRmhHYjFCOHlBNHlLakhJelF3SyttNnI5cEhV?=
 =?utf-8?B?eXhiNGxGMkdXSC9CaitxNmdKeDY2cksxNXF0N2YzdVdYV1A1azRvYzNRRGRM?=
 =?utf-8?B?N3hlRXk2M2Uvb2lJK1lJU1ROalYva0VIdkdYODd4WTB6QjJld3QyTXMvNFM3?=
 =?utf-8?B?akZJTWt2T3dyWVptZUliZGtPUnFmdnJ1aGgzNk5ISHpzWWc4dTJXS1V6b01y?=
 =?utf-8?B?Zk1saTVLM1BpM3FtWnp5U1lCMDNTTU96VklEN1hZTGZjc0x0UVZpTGhzYm9l?=
 =?utf-8?B?c0RyQkhIVWlhSnNmaDh1bFBTQ0NoRmV5eXBBcU9CWHRhTnJiMzFsR0tRc3RX?=
 =?utf-8?B?VmlVYXdoeTlkeWpJQytnM2JVUlhwOVdKRE5lUmsrc2lXam5ZTndPYzljWVJZ?=
 =?utf-8?B?Zm9wU2pwU2FOSkVMYTVSUW9iMjRNK0VBYkxVbE9RZ3pzazF5OEo5eUwrbFBW?=
 =?utf-8?B?V1JRYll1UTdaNU4yK0dyNjFlOHV5dnBPQmpVb0w0OUJwTkExMTE0dnhSSEN1?=
 =?utf-8?Q?NGH0X71Zg1QvkcmkuRXWuiuI+Z3D8s=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MlhjRkRsWi8wUWtvZ2JJQjZLeVJkMHphTjI5R1BrZ3VudjNid210OWRrZnhK?=
 =?utf-8?B?ZDZteTlPbjc5MmpwYzJNQ1gxc3hhT3JPdmtXSWdscTZCVUlucGhOQWJNZ0F1?=
 =?utf-8?B?TElJeTJTZnp3eW95b01ZMTFSYVlKb0JJd29hQm9IT044dUNFMGgrbWZIdlh2?=
 =?utf-8?B?VTVidXdRY1dsZWQyRm1NSWdSTnJmeWkzaVpFNW9WNzFQUkoyRktnakV4bWFN?=
 =?utf-8?B?dWJRSFE1V1FtWG1kN0pYb0xRM0VBamY1b3duVWRvZFdBN0JPR1JHUXNTSUxS?=
 =?utf-8?B?Slc3cDVCRTIvOGFTRGIzNTJaK09kQ21XcHdmQjVGdGgrUmdiWG9tMjFjMmNR?=
 =?utf-8?B?YjJXcU5FNWRSdTJ5K0RCSVpFTlpFYTRseVNKblNHYy9MdStaczZJWkRqQ3d1?=
 =?utf-8?B?bitoT0Y1aVRMeFBPekZqWVJ4b0p1WFQ5UlpLeFpQUHJrR2R5TmFVUTU5MWcy?=
 =?utf-8?B?MjRMeXh5Umc5amlYbTdJNmxSalpienpSa0V5UzdWMUNtdDlVaXV3ZXcxYkhu?=
 =?utf-8?B?RFdTcEg2UEtMVjl2eUI4ZjFJcW5ZWGpBMkcyM0c0WHo3QVpJd3hBaXBQMU5u?=
 =?utf-8?B?bzRnODBjRkxuVmtZWTU0aEdtaDJzbGE2K1FZb3RCd0UvQ2ZiWDEvV2ZXQ0xB?=
 =?utf-8?B?eVBHN1YvLzIrVHFMeGJWVlFacU1uUSt3TUJUQjFvZ0dQaE83eGZ6c1gybWg0?=
 =?utf-8?B?MUlMbmNyVmNuZjczNmliUkVzaThBOE5jakgxWHBlb2tsckdBQ1IraUtuU1Bj?=
 =?utf-8?B?WXpxN0xCS3BLOGN1UExZcUJ5ZTdSbWlyc05LZ2pBTkV2WWx1T0VnVVdjZjkr?=
 =?utf-8?B?bjB0K3VabmJsdDI2YnljZUJnYjc3ZWUyQ2VYY3RSRjdDM2NJNkl5MGRGdjBZ?=
 =?utf-8?B?OG5nZFpMQTdzb2wzQjRpK2FjOS83Rk1id0lXSUEwZVVoYnZSQjJQYXhVSDY1?=
 =?utf-8?B?dmptS0YyT0Exb1pTS0s2R2E2WjhCN0FSSFZ4TDdpT1FvZnVjYkhyN2RCU3VB?=
 =?utf-8?B?dS9BNERoU21VZllsS1hNbnhmL0t5dVZvUUtlTUpVSDVESUh6RXJZR0U2ZUov?=
 =?utf-8?B?QmNCT1lFUUFXQ3E2cml5Um9CaVNDNXp1czd1SmQxRjJBN1pTRGFKOUNyMGdY?=
 =?utf-8?B?eG9QRUtCd293NkpFeU9LSFhXcXZFMjZWMHhLa09Sblh6bytxeW8xRUZXSWhm?=
 =?utf-8?B?b3ZNTGh0N2JVbzlSRDNtcWVZdjJZOU4xMDRndE1MakpERjc1UitpVHU5RzZa?=
 =?utf-8?B?MGFaRFYycmRCQVk5SE1sVXJkMUx1OGxkRTQxRzMxdmZlM0U2allMckluWXND?=
 =?utf-8?B?RExxVlZyY1RXOEYyS2tVem5uWldyVjZvc09zSFpkMnlDTHY0ZWV4Z05KcFdy?=
 =?utf-8?B?dGZYKzd1WkdIQkVhOTRvd3NQbE9JczFHQmpPdHp5M1lldTkzN201NXdSdU9B?=
 =?utf-8?B?ajcybDUwSFpUN1FiTDFuVWQ5REc3aW9tbWRiUUphUXB0bzYzcWNsay9ZTjM5?=
 =?utf-8?B?VGRQQXdXRDh6MStLZXFFaHdzREFQZFBWUUJvR1ZtRjlKME5UcUEyTU1vSHc3?=
 =?utf-8?B?ODd5T0RMOXIvajQ4emtVa1JnR0c3K1NQM3Q0SGFqTXhkVnJLRDFob3JWZzN2?=
 =?utf-8?B?L3V5UFlRRmd1Wmp1bzRDZlhnVU5WNnBtZzNoeVRuRzZhQ29tMHgrQm4vNzBK?=
 =?utf-8?B?WTFTdWU4SHdoWFVzdi96ckgxTTBheHJxOVlqcXVBenNpTFBLNjJwS3ZMWDF4?=
 =?utf-8?B?bkhHeHFpOUpXTTJWdnphVkErbXl2bXFhNlZtNE1mM0dkeUxmdStHNzdRczJy?=
 =?utf-8?B?ZDhoSXlJU3BVLzNTZ2FjL1pvdFNjVDQzL3N3NDBOZnJIMUpsNVZ3ZnNQRVll?=
 =?utf-8?B?bGRPcGZqZVlRUXdQRENYWC90Znk1czhLRG9IQURSdC92eFBqNGxaTkR3NUlH?=
 =?utf-8?B?cGd2bEkwV1R5N2N4M05QWEN4dWpJb3lUUW9hNW9Mc0lQQTlGYkNXSkJBWTdM?=
 =?utf-8?B?OWRaU2ZNeGlmUmFTODArWWZJZkhFWm5xa0VPMENpbzZqNjQwOW55djRGRExo?=
 =?utf-8?B?bnBMMzBHcDBINEJTdElOM2Y1cWoxOUxjZThYOWdxa2pXYUNXK2o5RGkwVnpq?=
 =?utf-8?Q?0qu2SVR9bUXTwXWy6cbsq6d6N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1013ba9e-49de-40b2-0753-08ddd6cc8b9b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:40:16.2629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofB23JCBIzLK3FXGmiZtqAWU3ZdwTZ2KpiiZxNhsiUvi3qaiy4dtfz5O9YtrR8XtEbPsT6u0Vw6Q5W5ZUjDWdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528

Add helper function media_bus_fmt_to_csi2_bpp() to get media bus fmt's bpp
to reduce codes such as

	static const struct imx7_csi_pixfmt pixel_formats[] = {
        {
                .fourcc = V4L2_PIX_FMT_UYVY,
                .codes  = IMX_BUS_FMTS(
                        MEDIA_BUS_FMT_UYVY8_2X8,
                        MEDIA_BUS_FMT_UYVY8_1X16
                ),
                .yuv    = true,
                .bpp    = 16,
        },
	....

.bpp can be removed from pixel_formats with this helper function.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 176 ++++++++++++++++++++++++++++++++++
 include/media/mipi-csi2.h             |   2 +
 2 files changed, 178 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index a9bd3ca0f281d557cb80de5e1200c82b5282a70e..3a48b6a55c6e322696b910dd519def4f0b4a58fb 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -43,6 +43,7 @@
 #include <linux/uaccess.h>
 #include <asm/io.h>
 #include <asm/div64.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
@@ -699,3 +700,178 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
+
+int media_bus_fmt_to_csi2_bpp(int bus_fmt)
+{
+	switch (bus_fmt) {
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_Y8_1X8:
+	case MEDIA_BUS_FMT_UV8_1X8:
+	case MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8:
+	case MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8:
+	case MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8:
+	case MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8:
+	case MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8:
+	case MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8:
+	case MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8:
+	case MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8:
+	case MEDIA_BUS_FMT_META_8:
+	case MEDIA_BUS_FMT_JPEG_1X8:
+		return 8;
+
+	case MEDIA_BUS_FMT_Y10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_META_10:
+		return 10;
+
+	case MEDIA_BUS_FMT_RGB444_1X12:
+	case MEDIA_BUS_FMT_Y12_1X12:
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+	case MEDIA_BUS_FMT_META_12:
+		return 12;
+
+	case MEDIA_BUS_FMT_Y14_1X14:
+	case MEDIA_BUS_FMT_SBGGR14_1X14:
+	case MEDIA_BUS_FMT_SGBRG14_1X14:
+	case MEDIA_BUS_FMT_SGRBG14_1X14:
+	case MEDIA_BUS_FMT_SRGGB14_1X14:
+	case MEDIA_BUS_FMT_META_14:
+		return 14;
+
+	case MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE:
+	case MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE:
+	case MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE:
+	case MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE:
+	case MEDIA_BUS_FMT_RGB565_1X16:
+	case MEDIA_BUS_FMT_BGR565_2X8_BE:
+	case MEDIA_BUS_FMT_BGR565_2X8_LE:
+	case MEDIA_BUS_FMT_RGB565_2X8_BE:
+	case MEDIA_BUS_FMT_RGB565_2X8_LE:
+
+	case MEDIA_BUS_FMT_UYVY8_2X8:
+	case MEDIA_BUS_FMT_VYUY8_2X8:
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_YVYU8_2X8:
+	case MEDIA_BUS_FMT_Y10_2X8_PADHI_LE:
+	case MEDIA_BUS_FMT_Y16_1X16:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_VYUY8_1X16:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_YVYU8_1X16:
+	case MEDIA_BUS_FMT_YDYUYDYV8_1X16:
+
+	case MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE:
+	case MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE:
+	case MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_BE:
+	case MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_LE:
+	case MEDIA_BUS_FMT_SBGGR16_1X16:
+	case MEDIA_BUS_FMT_SGBRG16_1X16:
+	case MEDIA_BUS_FMT_SRGGB16_1X16:
+	case MEDIA_BUS_FMT_META_16:
+		return 16;
+
+	case MEDIA_BUS_FMT_RGB666_1X18:
+	case MEDIA_BUS_FMT_RGB666_2X9_BE:
+	case MEDIA_BUS_FMT_BGR666_1X18:
+		return 18;
+
+	case MEDIA_BUS_FMT_UYVY10_2X10:
+	case MEDIA_BUS_FMT_VYUY10_2X10:
+	case MEDIA_BUS_FMT_YUYV10_2X10:
+	case MEDIA_BUS_FMT_YVYU10_2X10:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+	case MEDIA_BUS_FMT_VYUY10_1X20:
+	case MEDIA_BUS_FMT_YUYV10_1X20:
+	case MEDIA_BUS_FMT_YVYU10_1X20:
+	case MEDIA_BUS_FMT_META_20:
+		return 20;
+
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+		return 21;
+
+	case MEDIA_BUS_FMT_RBG888_1X24:
+	case MEDIA_BUS_FMT_BGR888_3X8:
+	case MEDIA_BUS_FMT_GBR888_1X24:
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB888_2X12_BE:
+	case MEDIA_BUS_FMT_RGB888_2X12_LE:
+	case MEDIA_BUS_FMT_RGB888_3X8:
+	case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
+	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
+	case MEDIA_BUS_FMT_BGR666_1X24_CPADHI:
+	case MEDIA_BUS_FMT_RGB565_1X24_CPADHI:
+	case MEDIA_BUS_FMT_UYVY12_2X12:
+	case MEDIA_BUS_FMT_VYUY12_2X12:
+	case MEDIA_BUS_FMT_YUYV12_2X12:
+	case MEDIA_BUS_FMT_YVYU12_2X12:
+	case MEDIA_BUS_FMT_VUY8_1X24:
+	case MEDIA_BUS_FMT_YUV8_1X24:
+	case MEDIA_BUS_FMT_UYVY12_1X24:
+	case MEDIA_BUS_FMT_VYUY12_1X24:
+	case MEDIA_BUS_FMT_YUYV12_1X24:
+	case MEDIA_BUS_FMT_YVYU12_1X24:
+	case MEDIA_BUS_FMT_META_24:
+		return 24;
+
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+		return 28;
+
+	case MEDIA_BUS_FMT_RGB666_1X30_CPADLO:
+	case MEDIA_BUS_FMT_RGB888_1X30_CPADLO:
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+		return 30;
+
+	case MEDIA_BUS_FMT_ARGB8888_1X32:
+	case MEDIA_BUS_FMT_RGB888_1X32_PADHI:
+	case MEDIA_BUS_FMT_AYUV8_1X32:
+	case MEDIA_BUS_FMT_AHSV8888_1X32:
+		return 32;
+
+	case MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG:
+	case MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA:
+		return 35;
+
+	case MEDIA_BUS_FMT_RGB666_1X36_CPADLO:
+	case MEDIA_BUS_FMT_RGB888_1X36_CPADLO:
+	case MEDIA_BUS_FMT_RGB121212_1X36:
+	case MEDIA_BUS_FMT_YUV12_1X36:
+		return 36;
+
+	case MEDIA_BUS_FMT_UYVY8_1_5X8:
+	case MEDIA_BUS_FMT_VYUY8_1_5X8:
+	case MEDIA_BUS_FMT_YUYV8_1_5X8:
+	case MEDIA_BUS_FMT_YVYU8_1_5X8:
+		return 40;
+
+	case MEDIA_BUS_FMT_RGB161616_1X48:
+	case MEDIA_BUS_FMT_YUV16_1X48:
+		return 48;
+
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+		return 120;
+
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+		return 150;
+
+	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
+		return 180;
+
+	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
+		return 240;
+
+	};
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_bpp);
diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
index 40fc0264250d779ab5dfa7d2fe16e6f1382c07d4..c5b4e8e1ca93803568b1eee85f7f99c3a45a0b6e 100644
--- a/include/media/mipi-csi2.h
+++ b/include/media/mipi-csi2.h
@@ -44,4 +44,6 @@
 #define MIPI_CSI2_DT_RAW20		0x2f
 #define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
 
+int media_bus_fmt_to_csi2_bpp(int bus_fmt);
+
 #endif /* _MEDIA_MIPI_CSI2_H */

-- 
2.34.1


