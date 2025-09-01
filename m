Return-Path: <linux-media+bounces-41392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B745FB3D9EB
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 08:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F820189AA67
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 06:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C86264FB5;
	Mon,  1 Sep 2025 06:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dINOoypB"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013021.outbound.protection.outlook.com [40.107.159.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A80263C75;
	Mon,  1 Sep 2025 06:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756707977; cv=fail; b=nyT1oLCyxuJ+fvQiJ1g0tC51in5CxWi0fdgpXc5/VDNOJVEgqnyiYuaXd/yzIJEi+kZAh5uO6js4+690mSkx846eCRC13rXWmRA3u6hcvhxwtS6x1lK5ZTKSicVVWiJEA6Zf2yHKEZejyvcNH60szxpGmR5jXvdvkUebPNq2qtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756707977; c=relaxed/simple;
	bh=Ag1sPLelcYnWzBZdsKbQ0WjA3PlOnGbW7Zj32b1hAMA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=l3MsrOLZAG2xbpywy+bHveA9DKGJ8cQZrMe4KxZHCDzU1MRgFw5A9VkEcQlmxlCA6odzn8TX37OIrJaKxxdjgUe0DHAuAcLOlsiE6eq+0JZhGy/9CtCXb1V2yP3cWF8CaFMI8Gt2/8Ww+I4bWxaueGMkhCxGeFVeXSzdc1o6edk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dINOoypB; arc=fail smtp.client-ip=40.107.159.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itwSc13lL82s4g01FRY//eNhzWM1NQ8s/HBqFEcaeUZyZMU8LLXpBujN0IyDj7LhxL/tVZD4Cg4TVeOP2gIz/TNuGMqiEECuN/Qrza1UwzKXgPUaEIL2z3boXdWwOR6yyLpwXxfxxLTFbGAllTynmRmUqG6TRlI96Z8jzjfuPVlY2tvSFHhWj1ZK0Y911c3dpTXzlD0Rz2YFPVUtkYffteVxj52Jt/pktioXZ3jVo0A75ymsvOAMK14V/U53J2zAVRYoOW/vfmFUe/6qUEk7TDIMdbTpAOcJEk0pqRMQHoVChgqmymzi2ed6XW6QwBzKL4HNr98ZLNJVnbdUz6+mCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrV43YVpug2qoLlBpnd5P8XCLKayNbe6sk52nDkNtF4=;
 b=SoaLwBaKqxrwPsGtjbb07fNS74mkdEk+iwBoPyHBKb1c/ZnoJ6tzXYBlatddNj9Uz/ReE09LETBdDwiU57kqomq7N0Gpb0SXM/5IuwhIfy1kkrTHvMKXJfu0udjjeq3nsAsztT3QwXoXosB3ULBIRXi9szLlZ1mSy9aDZeagQlqg2Qro3FH8Ul/hRiqEckJP54NB+XO2KFkJn1S00JaM24IWPw7y370WyR0xKjE71O16v6VD1UU3mtz3S28GBKLkNVhfBsaaODUSHW+fnMwqvNPLCYrY/3t3Neq13k9+WUa8lRWL+f1Gc71PbGlyIaOxPKsFfNBcc6p3oBxcGm3+ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrV43YVpug2qoLlBpnd5P8XCLKayNbe6sk52nDkNtF4=;
 b=dINOoypBpp6CT5woLVX19dPIEfLd+C4LOHDou/jGjKaiqE4gWZwtjwD2zpwwLZiiJRuugbROHzyQTQujXc+jcHBYLx/tNmyrDwSBnytFQgy773LqwESu9ZIa7H1iS3eK+cHAxTgKLkq7l1B7jKU4q1Hfznv0mZ9Taz44LZEJW/X6NqFxPy/bCjN+6IiPPoVV+wcSU9ev3L+aEvi1mP40Y9ihr+3pXomzI2Wkm/w+AAgKzywxuUQ5kOtg4Pp2yuOdKdZuDvmOsDtW3am0CKOW9lx1vCoAifdc5DLMnGYQG7fThGSmsZ3bl21ht1dOIe8LKS1HvIWxQQ6XhknTyT32tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
 by AM8PR04MB8018.eurprd04.prod.outlook.com (2603:10a6:20b:236::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Mon, 1 Sep
 2025 06:26:12 +0000
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::473a:e4c3:5682:7765]) by DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::473a:e4c3:5682:7765%2]) with mapi id 15.20.9073.010; Mon, 1 Sep 2025
 06:26:12 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Mon, 01 Sep 2025 14:25:32 +0800
Subject: [PATCH v5 4/4] arm64: dts: imx8ulp: Add CSI and ISI Nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-csi2_imx8ulp-v5-4-67964d1471f3@nxp.com>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
In-Reply-To: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756707946; l=3033;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=Ag1sPLelcYnWzBZdsKbQ0WjA3PlOnGbW7Zj32b1hAMA=;
 b=EVJ4LLOiIBti/T1OdHhW5lz2bSR9x1wWCdt600ZvVGDfbleTmalHmHhSxiGjjmNKVTQWzuB0Y
 pCVd5B2h9qOBIlVtfnbErAE5HVLGKm5G5WjAamJgIW7CD8av1o5zmUZ
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To DU2PR04MB9081.eurprd04.prod.outlook.com
 (2603:10a6:10:2f0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9081:EE_|AM8PR04MB8018:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e40324-bcf6-42fd-fc4e-08dde9207201
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ejlUd3Y3a1hVckpFRlcvaVl1VDBydnByOFFpa3hZZkZqZEplWW9lZzlEZ2Rn?=
 =?utf-8?B?WUdlLzNUVjFiMldPdVZINUorVUdMMHd1a3ZQM2dCbmxEOGo4TDdCWHdmMUw0?=
 =?utf-8?B?Q2pEZFR3cGt5cFU0dUF0dzZ1OXRYZjd3U3gwM3ozUkJMMzUzQytueGcrbE1t?=
 =?utf-8?B?UVFyQkFYTkpaMlNoZFYwemgrYnhuMVVjejg5TXRiT0p2WWNTbzNMUXBMeitv?=
 =?utf-8?B?OC9pVk5YQVVSK3ZwYWZaQnpuYkVOUVNOVFBPUWxUMlVBN29tSm5iNlZyU1hF?=
 =?utf-8?B?NlpCSmZMTEk5c3p0MkN0bk85Q1R5STZHaUZ3eDVtZ2h3UlFrbzFZeE9ER2kw?=
 =?utf-8?B?MHpFL0lZNTQ4WDNOd3FtTThRUy85UXNnM3ovaThSRzZDdC9SZURHU2NhanZo?=
 =?utf-8?B?aGVSK1hCbTNuVXE3cDVXZFI2ejVpTHhhRlpPZm9mOVFveWxNTmdUQ1h4MnhW?=
 =?utf-8?B?dkYvdkFqYVhubUN1OXVYWHBSOGhzbGVmbmJnL043dndNRDNiQmRpOUROdnFz?=
 =?utf-8?B?ZjJ3b3Z4L25aVFRzdGQ1RGhnOVZ5TUN6MVkraU8yR0lENFU3NVl2STFyelFk?=
 =?utf-8?B?SnQya0JEUENueVJQS0VuRVhuRHkzRWczWmhzdUFZT0NYOGNTcGEwTThDR2FI?=
 =?utf-8?B?cTg1SnByaWQwYzMvVE9TbklQWkh4aXJXTDR0a2toWFNSQytjdlczckVySnB5?=
 =?utf-8?B?Q2FhWThtNkQ2bitweXJ6TVFzV1hoL2hLNG5VdnRvYVRyZVM3TW1VKyswRW52?=
 =?utf-8?B?TEg3TmtzK1RGNlQ4V0VQemxoRWZTZXdRQUVpVDZZdnRISHRlNDBSL041K0Ra?=
 =?utf-8?B?eDZlZ3dZR01iU1JhM1BGRnd4eEIxOENyVUMzQ0tNNlh5bllKTUFjU2ZYZUxP?=
 =?utf-8?B?TVdMenFrZUE3VU11V1M3Uks5K3dNSlRKeXFtR05zL2Y5Z3FNSncyNXRkc2t3?=
 =?utf-8?B?WVY5cDdIRnhnOVFXcVczK0FQOStCUk90TTFNdWhBZG0vM1VtcjAzOUg4TUs2?=
 =?utf-8?B?Y1lNaGV3bjF4OHBjMnJINVY3dklXSEpkWEkwc1lNZ0FSWng5bTdDc2ZDazBZ?=
 =?utf-8?B?Z05FNXJvMnk3dXRTbmk5T285VFphUzdZaS9wcU1kY014YTFPWW5sQWtTdlhH?=
 =?utf-8?B?SjE2Z091dWN1My9pWEdjeHF4b0Y3My9yM1FmSE5HcU1ybmtRTEM2djFQU3Fy?=
 =?utf-8?B?Q1ZkVTIvMEdwUDdsRG9uTm5RYVB4R3VrNnJOalpEdDBhSlQ5bElIYy9OS1Ux?=
 =?utf-8?B?Mk1tbEczNHRmTmlLMEduSC80QjJrVEdhTllFMzBuNFN6cmhWS0JRQlRUNXVM?=
 =?utf-8?B?QitLcWs3SEFKVzhaS3BpZkYwektzQytzMDVoZUYrRTFTcHJ5QU85TW56dkJI?=
 =?utf-8?B?cjJhS1J4VlNwbVpXTFVHY21ncHh0QzBUblNCQ0pjWHdtbDRoMTY5QUJCYUZt?=
 =?utf-8?B?MGEwTEh2Rk1La05xTkIrczNuTTBIYldqZUxYSVgvWHBidGtLWFFzUzNqanlX?=
 =?utf-8?B?c0o1WnphclNiSVYzTEsxK0VCdHR6THVGK2x6d1czVmkrVXpnRmxOYVhQZE5J?=
 =?utf-8?B?RmsySEd1VWRVMVFmYW1SaUFpS1dvYXZ1Y2VPSTNHK3hrek9hYUNnTjkvemtl?=
 =?utf-8?B?aWViVlJHTEFXR1MrR2lhMm95TEJ3QlJnK3JDbmZ5SDg1THdKZXJLUGFET3FY?=
 =?utf-8?B?YkR1ZE0xblFXU0xabTRoaWRMUEtZU0ZJQVIwbEJJMy9aeFBkNWM3N0VoNVY0?=
 =?utf-8?B?WlFaQWNkL2x2ZnI0NHNxaHRjT3ovQlRXbHJ0cWdvdmJrMmFOdzR0ZmUwYytr?=
 =?utf-8?B?S3hBMURKbzNBd3ZvbkJKY1VTVlJYazZRemhQdTJUTk5DUmJHN3RaSzNwd1hO?=
 =?utf-8?B?OTBKTWdzTW1XL0poV2dWN05xalRVVzliaHB5ZklQc3RsUWVyY0FwdFRNUlpV?=
 =?utf-8?B?RHYxU28vK2F0aWdLSW11SVo1Yk5KV0svRmFoOFc0eWY5dUlDTmp3MjZwcUdv?=
 =?utf-8?Q?hnuc7MBiaD/2J7ElrczKRCWt1cBAj0=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9081.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VlhGZnpqNVl4a2dlZ3laZUc0NEVTS2RsS3Q3d2VVWUgvNUVocmVUTS9aR0o3?=
 =?utf-8?B?Q0NLaUdCSnhFV2lLTWdSWWhwWGxpK1EwSDE3YWtpLzF5NndoMDhxTmJFRmt1?=
 =?utf-8?B?T282S2VrQlZEenJsdFFTeXVZWU1HSnoxeHZnVzZNRkZ6SmZteWkzbUNnZmdV?=
 =?utf-8?B?NGNqRFB4VmFoVnU4VnJEY1lkZlIweXRTQ1hmQ05SR0tWYzcxT0dVNUJJVnNt?=
 =?utf-8?B?SnpsaVBIbDVLM243SlE0ZE51OVc4eGl3K25QYUJMSzN5amFLY3ZmQm1vQzEw?=
 =?utf-8?B?YVBISlJJNlBKYjVLcDV1NzYyM0xCV1AzeW9CekNtdnBrNmZPdVo1dkNzcTlF?=
 =?utf-8?B?MFBheGNtRjIzc1g0bjNTd2ZpcWgxUC9kcVUzdUVSV2diWVpQbGZGdW5ncWx2?=
 =?utf-8?B?ZTQwdTVRaitwZkc2WUMrcmwyc1FzUERCUnhuKzc2Z09ON2NJY0VVV00yRGRx?=
 =?utf-8?B?WnRLR1pEak9KYVIrWE5RVFBvSkk1QUxEaUlTWkVoWTBLd0JkV1NFVWpQTkwx?=
 =?utf-8?B?NmZrTEJ2VENPcExsbWZkY2ZWMUkrRVZUdkl4dUJSVTYwV2JqUjRLa25DeUp4?=
 =?utf-8?B?aFBPL3NDYzV6ZjNXSHorNTRSblc2YVloNFB4akZTSHMxWVhDNzBvWXFmbmVu?=
 =?utf-8?B?VUJGcW9IUVYxdHA1SWZDTWR6RjJiUEU1RWVqUm00TGR1Q3JoTEIwcHRCNzl1?=
 =?utf-8?B?cU00VkFoUXZLdk9adThvQ0xWbUd0RGU5TU1hZ3hjNjErUG9aYUJCbGZSS2t3?=
 =?utf-8?B?b2ZtTzNPcE0zTUhCbUNpWFozV2RBejc3S3FFbVlCT2JIclFlMEVLblljRmpD?=
 =?utf-8?B?Z0hTU3luWE5qbWFQa0NlakpXanlWK1UxZEN2eWg1eDRoUDZPZ3FrbmgraE9i?=
 =?utf-8?B?STQvVXhjbXZCN2Z1V0FzVnJBVlRDS2RnWnVEMkFueDRuWERLZEZLUStuWFc4?=
 =?utf-8?B?WWdKYS9ud3lvWGllU1pLbUdVK0FvSkg2Y205Y2QvWkp0UXZmc0lHTVhsbGRJ?=
 =?utf-8?B?ZktjWDFQa012QjdYUGVFdVRJMjZlVVhWVzNKWXgxbDdOQmFKM3dlQmtQRHR0?=
 =?utf-8?B?S2hRVVlOYkxabHJmNnVtN2NOK3R5dmQ3OVIzdWFYZitvOGkrd0FxNW9VZlhO?=
 =?utf-8?B?OEo0a2s3Z08zWURuM1RISXJTN3JaUFRhMnJjMVRlOE83bFdJQTI1ajRpeXds?=
 =?utf-8?B?RnNVMUd0NXlhckNSZ21iazBJTVJBck13QzVEWmptU3dpVjV3UlhIeHhlNGdR?=
 =?utf-8?B?SVVzOGlnVzRZazQ4NkJOd0dXc2lBRjI5YUtXQi9wck41bVVxZFhaM1dYMGVF?=
 =?utf-8?B?MFEzQUxLclVGSmplMENPL2RVQ0x3TlhFVUZOdk5qMlI1UkFOMWtzaWJLeTNS?=
 =?utf-8?B?RmYzYkkvUjB4NWJZajdyMElQeW93eGRmeEs5N2ZvMHhBSjNqblBxcFVhd2Q0?=
 =?utf-8?B?YVpncE5nK3VsSzNvMVNuL3prQXh3ZDIvY3hhTEdHZzE1OEM1b0VPMVp1a2JK?=
 =?utf-8?B?cXJ3V01La3BxaFdiMGpvR21odkFOeENld05wZnJ1SlJTcmxrNmd1bU9FdGVN?=
 =?utf-8?B?dmptNE1YcWFWWDlVRHYzTmptdW9YOTQrblc4SWp0dStkYWNKMXRTSUdIaUxT?=
 =?utf-8?B?OUtKUjVxSm5Hb0l6ZzdHWnE4VmhMS3ZxRGI3QXUxUmkvY0dKZGwxaHJCbHRx?=
 =?utf-8?B?WStiNW1nbWtSRGZOYVF2bzNEVHVObWJ6bUMybHBTRE9jVXhvdjBYZFVaR2Va?=
 =?utf-8?B?c2swb0ZJVFY2Wi9RMER3M1VvTkJyNVhVc0hBVTlTUHVkUzRieURQN0pnU2Jt?=
 =?utf-8?B?L2t3NExJSWRQb29nZ2FyL2xsbGhjd1hMWDZrT0VSdTZZSEFuMnZEZ0RnWjJ0?=
 =?utf-8?B?MWhkUys4Q3c5cXdmeDZPQ1BDMSt0NnMxZFpYcUVTZkpzWVQzM0ZDUXVnY1lz?=
 =?utf-8?B?WGx1ZEh6MGZkZkE4RjdnWkJpdGRQODBVcnNKVXBWamEyRi9ab1lwNlR0L3hy?=
 =?utf-8?B?UU02VGFMUFJ5bVVtd2d2ckNnSmd0T1FZRjl6OGFkUE9ydVlqZG91NlFia2lo?=
 =?utf-8?B?MFlMUjlYMTdoMnZzMzBZdTdJQmxoTHo5UXFIZ0hqOGsrQWkycXZBZ0hVRE5N?=
 =?utf-8?Q?gqC4LEwXZKF5lGyh77VQNETM8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e40324-bcf6-42fd-fc4e-08dde9207201
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 06:26:12.4685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E86o01lp0DTWrl2WfFe+VaWFfsra7bpPjmVk2y8hpuSdlQSpOCVbor42FnSi+/lR6tGfSVsG1bW9lMcdNSqMHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8018

The CSI-2 in the i.MX8ULP is almost identical to the version present
in the i.MX8QXP/QM and is routed to the ISI. Add both the ISI and CSI
nodes and mark them as disabled by default since capture is dependent
on an attached camera.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 67 ++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4950c37e72e04f6bfb5995dc19178..7981f7dc62f5dfb2dff051e2d91bde6a2498ac13 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/imx8ulp-power.h>
+#include <dt-bindings/reset/imx8ulp-pcc-reset.h>
 #include <dt-bindings/thermal/thermal.h>
 
 #include "imx8ulp-pinfunc.h"
@@ -842,6 +843,72 @@ spdif: spdif@2dab0000 {
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};
+
+			isi: isi@2dac0000 {
+				compatible = "fsl,imx8ulp-isi";
+				reg = <0x2dac0000 0x10000>;
+				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pcc5 IMX8ULP_CLK_ISI>,
+					 <&cgc2 IMX8ULP_CLK_LPAV_AXI_DIV>;
+				clock-names = "axi", "apb";
+				power-domains = <&scmi_devpd IMX8ULP_PD_ISI>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						isi_in: endpoint {
+							remote-endpoint = <&mipi_csi_out>;
+						};
+					};
+				};
+			};
+
+			mipi_csi: csi@2daf0000 {
+				compatible = "fsl,imx8ulp-mipi-csi2", "fsl,imx8qxp-mipi-csi2";
+				reg = <0x2daf0000 0x10000>,
+				      <0x2dad0000 0x10000>;
+				clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				clock-names = "core", "esc", "ui", "pclk";
+				assigned-clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				assigned-clock-parents = <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV1>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV2>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD0_DIV1>;
+				assigned-clock-rates = <200000000>,
+						       <80000000>,
+						       <100000000>,
+						       <79200000>;
+				power-domains = <&scmi_devpd IMX8ULP_PD_MIPI_CSI>;
+				resets = <&pcc5 PCC5_CSI_SWRST>,
+					 <&pcc5 PCC5_CSI_REGS_SWRST>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mipi_csi_out: endpoint {
+							remote-endpoint = <&isi_in>;
+						};
+					};
+				};
+			};
 		};
 
 		gpiod: gpio@2e200000 {

-- 
2.34.1


