Return-Path: <linux-media+bounces-65136-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id enmbDIn6Mmru8AUAu9opvQ
	(envelope-from <linux-media+bounces-65136-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 21:50:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9974D69C390
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 21:50:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=cxtAs4Ez;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65136-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65136-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1886F31351F1
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 19:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37B238BF69;
	Wed, 17 Jun 2026 19:50:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF3D2E7364;
	Wed, 17 Jun 2026 19:50:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781725829; cv=fail; b=m8a8+OgHhGmSpyHDFnm8d/7ZCQMERVWRAK+LqbQgYPiSFG7d6IvR3lGAv4pdTty9O6nmttWqgRO5Dxw82EHyv+qxZe7qZ+nsRJthrnHs8yavUgGBhE63skKrxlIhulhjGOLK+KG0obP7mneTGPaGD75KDcarSN8MjRFrVtAlZjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781725829; c=relaxed/simple;
	bh=Xbx1oB+qfCuVik5UaeBf9UbNQfcEUdfddpHYOh4aD/o=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=VgS0aivnjwWp3gi1ySRn46oe8r4g56bQly63lwrWF+aoBkckK6fCeLNbyMMCLLNyoOJYBHgUzOGqtUdXf47EondMAbJb0cjyKFpeG/mSUdk3I7iiB5wRz3zJcnjxEiSQUfoFacr3Tdg4g8t4PLyiWV13LCephyarN/FrWGT2v40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cxtAs4Ez; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozLf3UMrVa+78gNf61+KJdJkOlw6snvV9GgqGbzYflQ4v7sPOf2tuHAXc1b8xe32dzJC/xbu1X8pZ4+xM9cno8H7OD17ISfe/TI18ANo7y10a653BfRT+Zt2E6yAKlyEP2fk+Td5Zqc6hgJDlk2H0DjwZ1F+Byy+lXxg7emP/L/krbsOVRYo4Rza94marQ3JMMrz6U2RsiugO0IvE8maCLJltZSeHGb3JmMKOUZqO4qX8CTurtLIDePyS+aS1jz7zO5uMd1rJWkN1rQQDA6NuBUiXQdA8AuIVAj6LWfHQfsmcJK/QFXaNzvnOHLLfRQDx2HQNqxP3PszDJcWeZmLSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evDPMBCUU3drjBS43cnz5S5W8AJ7WPADGoxyy5XRafM=;
 b=MktmwnJ2F4IMe9uJqQ+s+1NVr0G6+cr75At2W11J2Cy5vwjTPp1ZliMwnk3miZu8xIUSTg9Q2t2sT11mrYl6aC4S62mTU/NrU9yrwtvHdO4AJY8R6kDXq61lhc9xyUlQKOKEKKaFd+GQboElC32GbpW/Bd58eqDIucaIWDyibuDR22rKh/nhX/n2ddQF8uiiCpJkobAfY1gqSEJRzwtUTFJ4HCMKOBg3RInD2VncDg7RFh2cs2/K9oF7/dIysv/Ti5G4X4hlScArdyFkl0pyF5QJrVjMii6IgjOuL4uId0OoBnTWoMOKYGHXFLXdp0wS8x4FQ3Xg+tl2cw+N+rqirg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evDPMBCUU3drjBS43cnz5S5W8AJ7WPADGoxyy5XRafM=;
 b=cxtAs4EzoiDnAeHQR4UvrKeGGlB9Uqq5ugpTZOzn77v5m/CDPzAFF5PGyZ717QyLaO13x7CZAaoA7BDxi8oe1GmkZymmOKfUdQqfzYS7pN0CzWn48eXRskNBazc2OEU2/aQjnBAdWJTeASv5LGPZJKWVr5ERoVCDCnWMy8opHX5+hzlIKiIz3SbLIhSJPh+VEZJepkzM2yW8vxbyTkRcfziwLj35kCk4SEcEV3hsE0gENNlDCGt5xXJTzmbMCxaNEPF+0fZvCK+A9jipMZU4kX5ml8Ytxd8nfuZOhTFloeDVqaZiSU1thqF6vnKQp3Xh54wOcOF0NAPN+gbFHlZECw==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8227.eurprd04.prod.outlook.com (2603:10a6:20b:3b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 19:50:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 19:50:22 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH v5 0/8] media: add new API simple 1to1 subdev register and
 add imx parallel camera support
Date: Wed, 17 Jun 2026 15:50:10 -0400
Message-Id: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHL6MmoC/13MywrCMBCF4VeRrI0kM0mduvI9RKQmE82iF1spl
 dJ3N4qgZnkOfP8sBu4jD2K3mkXPYxxi26Rh1yvhrlVzYRl92gIUWFVAIWM90W3qTp2raunJakB
 Cgw5FIl3PIU7v3OGY9jUO97Z/vOujfr2fEKr/0KilkuycR/JlCUrvm6nbuLYWr8wIX7pVmFFIV
 BOdmWxQRcgo/lLKKCbqyCKyUdbn1PxQKDNqEjU+uMqwh0DbL12W5QkbbPnSVwEAAA==
X-Change-ID: 20250626-imx8qxp_pcam-d851238343c3
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
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alice Yuan <alice.yuan@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, 
 Zhipeng Wang <zhipeng.wang_1@nxp.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781725817; l=5589;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Xbx1oB+qfCuVik5UaeBf9UbNQfcEUdfddpHYOh4aD/o=;
 b=heixdVJmZkGwvXzK5cpd5VUxF3KXKEkKgDmoWSkQx/WMb6T+MX55BO/Mb1RdU2W76LMNFc3wY
 jVmBGDJmIX4DCnoSOvT+kPPP4bKEctwym42WlM8DS7DepwXGAwtH+4h
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN7PR18CA0022.namprd18.prod.outlook.com
 (2603:10b6:806:f3::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce73566-37a9-43ce-8e76-08decca9aaf9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|18002099003|3023799007|11063799006|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
 hfzI3ntP+C23M/Iz4Bx5muAhQw9V5IUoMne3TzRAUUUm4o1EyHHbmuGGBZXqmUdF50F2RbEXZOlyrHqQukA+QxIxAe8eZZuhM8LoRm8FJwb/MDPkLjzVtrZYiN8s67rzvcg3Ik5qF7vvoT9xapr8DtSWMlufT1VhlPJf+bZno7K/gaZ4BMJ5Nr5LZEC6TsiE4evl5eUENhqCtI5+EW7vcywawg9YxtSkPWrVCaznPAKAYyNTIX8T7By599qQSDVIxKCXnfRcOfHZzGDtbQGwgOja0XxzGen6trdZs2qoxWb6YoDlx6EH7ZN7844kG889NcNS+G+VDx3RBcpM2J53vb7WPXIQBi9vW9QMrxLoH4BkrBk+brnb2D/ezogCpid19eRdS7pQs5exPn3iLhuaAqsyvTcoF5IXSk2VnJLRBVk/aNSR1pecQNgPNGK2LYtIiwSXEWEsqPuBfVE0ln0EbIjf3kuuhkPFCWE86ASJExQXvborZ+ofYxgN9Q4lu/N/854g/1E1jU9upgnPLHTXzE3M6mHu1ric7CD9D4V5w05SV6SBu/Wg9hs2o0It3gdxCo6jjqYMVmNGmjr74iFWstWEuB2j0Ic3zwgjBkO9LgZk44trSqPFPYTzQ8XZEAMfQqRfEjVqntVpcwqol0ofWYUJD9G9yPSTDc8i1IMWOjll5LxgjJ3Rgf53CEwcdmhkidvSyz1hY7EDJzduDeZPYLBgyc6N9T8hMv0C6BJcn59ZfMNnR75ey/SSnNotJb2w
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(18002099003)(3023799007)(11063799006)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aGdiWHhSRGw0ankwVWpVNUdzVXdWN3dzalJDbmpBSFhodlZkc09ITGhMdWtk?=
 =?utf-8?B?aTFacEVEOXFaSnZqUStTL1JBZHVqNUxTNEU2MlNXRUVSb09sY2NtRlMvVFox?=
 =?utf-8?B?eDdlUktqS0RpUXV4T0RzbUo0RFIrV3NvaU5zY3R4bGJmMldSM0ZuN3VMMlU3?=
 =?utf-8?B?YzVROG9oOURWTjlpRXVhYmZTK3ZVemt0MktHUnlub3MyQ1c4Q3hwZmNiS0dF?=
 =?utf-8?B?QUJYZWQrbUlZTk1wT1AvUkRYRTFBY3NXUWMxaDMvWUNGczQyUlk5OUp1NmI3?=
 =?utf-8?B?b0UxazN4aXVxOWxZQmF1TGZKbFpJWHE2c0R4djNGbVVibEtQVnNOZUR3VkFm?=
 =?utf-8?B?KzBnTXJwN2pGRCtENndYRmVScVNsaXc4SEMzVjZRcjlySUdMNDhCRnNMazBK?=
 =?utf-8?B?RFg4MXZ3eTZmOHRIZFE5a2F2T09ydzR0dFg3RWVPV21ZOWxTZ2hZNXpicXJL?=
 =?utf-8?B?aTRPcVpGSUN6MjRGUmZ2T3Nid3BPNjQ0Mkkva1dIL2orYnBmTTZmL21yQktq?=
 =?utf-8?B?NU1Ibi9OVHhVdjM0VTMxbzNqUzArUWJrSWFQUzgzbWcvdW4rRFFXV29FVEc5?=
 =?utf-8?B?N250NlhzVnJkdHNobHJ0dXJ2akRXVEI3Y1BGajNoSU9lTWE2WUUzTEVwNHRS?=
 =?utf-8?B?Ull0VlozTVEzV0lQU00wbXVvZHUramF0V2FJTTVnRVk3TGlYYkFlQnRGN1VF?=
 =?utf-8?B?SWVIbVlRNHJUSTBSdmpxZlhreEEzcC9MVTMrcGRnN2FpbzhCcDZnbUk4R3k1?=
 =?utf-8?B?Z3J1VHB5cWdiU2cySXZDRGVIRldoMnVXcEtWclFQVVFHSnV0UGNPVzBtTVNr?=
 =?utf-8?B?OGZENWRteTZISUNUWHlCZ3I1U0dRMEhFRTlLZmVvZkhMN1lsdmpLeTBpVXN4?=
 =?utf-8?B?YmxYR1JGOXZiZkZVckJocGh6MHM4c2JISHhHdldvU2p4K2dGcjgrMFk2N1pI?=
 =?utf-8?B?T0xqdmo4OG9iVWhPLy8xemljZnp6QTE4TjhON094elBBZ2dMWjZ6MnBwMW1O?=
 =?utf-8?B?bUVtRVBmMUdRWXFFdWdzWUtjQTlkTXFZTkxyMitLbzVrcXpFcEc0NlhjR3kz?=
 =?utf-8?B?Z1dDSEFUL3RIbjl0Q1FyUi9HN2Y2UVEwRzhRbHoyNzltK3BjMmk2M0U3ZlJk?=
 =?utf-8?B?Uk9BcWxpZGcxR1hick5XaVh6NXdyYlVqcHQxdDFoc2ZWRUhXcHczUFVhN1BP?=
 =?utf-8?B?RWV3K1dtODdkM2JJQXlqUEVmcUFXV1YzWlhoT0lBV3p0Q0hydFVrRkthNmNZ?=
 =?utf-8?B?UE9vUS9BbEVHQ0luakR6MmFSNHQwMm9Vdzc4RWpoeXFUdjFvUHNDT3BNaVhY?=
 =?utf-8?B?d3ppWnh1QmJ6bFFoanhsTzF3a2xkVUw3R21TbUdkLzg2LzB5Uk5WS0N0VUNW?=
 =?utf-8?B?ZDk1QUxSaXlDQnptZ20xK1BvaTFIdWIzWkk1d0h0VEFVbE1PSFU5amQ2N3RN?=
 =?utf-8?B?RWlJUFdVeFRXY3UxWTVaUDdtVE5nWVpYNmdTQ2ZqV3FQUVI0MWROVGZWN3NL?=
 =?utf-8?B?eFhGRWF3SStKRWg5WEx3eE9YcC90Y2doaTBsVUJ2Z3lnZ1N0MkhBbmtMcnRZ?=
 =?utf-8?B?NnNwTWZkVUVpL1Z4Wk1rUFJrTUUrOFRKRXpaR1FrTDlXZHVqYzB0a3IrWmhL?=
 =?utf-8?B?RkZaTXlsQmdIcW0xUWJPL2xiWU5ic0toZkVOZ0x3TGs4R1RWUEZzVTNGSUVy?=
 =?utf-8?B?T2dyWHRyNjVSSUdwMlFJMndNb1BRTXg0T0R5MmV1ZjhpWE5qMHphdDVITFdx?=
 =?utf-8?B?ZVdzeXRjdFQ2NVkyS3hhZFY4eStKMkdnc2hOeEExUncwWTJIOCtXcWU4Y3VJ?=
 =?utf-8?B?TTlFVDFWSnE4QitXZzA5UlVBSCtpMGlsNGdsc0lEcnM5aFpuSHZEenlHb2sv?=
 =?utf-8?B?enFUTXRHQ3p6cW1kRzdjeUVVN1c2WDR1ZXRWUDNwTGN2U01Qc1RLeXRCQXpq?=
 =?utf-8?B?d2NxUDZKeVg4WER4c1lWUEVVbC9hUnZEYW5JOEJaUGJTaXVrUmxSNU1UR3Ri?=
 =?utf-8?B?NENKZTJoSE9aSVEwemR3VGYzbFhUU0J2VDBza2RHS1NwRUlRRGdDM0YyYU5B?=
 =?utf-8?B?YnZFdXRKekVWcnRzanF2MjVFWnFWbW1BdmZtTVgrRG5BR0lLNHptRjVyV25v?=
 =?utf-8?B?cytqR3g4eU1iT0VBRjBHaXFqNXk1SDJIbTFrZXowVGtwRy9jQ1BiTHZHUFFK?=
 =?utf-8?B?UTV6N1N6THpaTS8zbk0vYnEvUDVqYVV1S0RxZjIwMWRSZUNxczh5MFBSTll0?=
 =?utf-8?B?S1FJaS9SSjE3Q1NuTHRQd1A5M0Z2N3p6S0sybUJESVYzSTZXeFRSZXJEUlFx?=
 =?utf-8?B?OGJiMkhkYXp3VnlwUysrd2hBOXdtM3RTbWltQWNqZnJud2JvMHl2OHg1ZFJZ?=
 =?utf-8?Q?nQ9XYzdOH9zqgjMmYZRiZP3cuOb65KRl0aK5S?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce73566-37a9-43ce-8e76-08decca9aaf9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 19:50:22.5595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARQixUAmRN1SfgI89w+HHA9hT1C2dqHdHLBHPZT/tQLpgmm+4ABJsiEJFdn4d/gRLonDAWv6sl9JxDuIo8stDmiTn5BleXeLKxxjYq7l2PVc8D71+cvDDfkjZg1jF7k8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8227
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:alice.yuan@nxp.com,m:robert.chiras@nxp.com,m:zhipeng.wang_1@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65136-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9974D69C390

This patches base on previous' thread "media: imx8qxp: add parallel camera
support".

Add new API media_async_register_subdev_1to1() to simple 1to1 subdev
register.

Many V4L2 subdev drivers implement the same registration and media pad
setup logic for simple pipelines consisting of a single sink pad and a
single source pad. As a result, the same boilerplate code is duplicated
across multiple drivers.

Introduce a common helper library for 1-to-1 subdevs to encapsulate the
registration, media entity initialization, and cleanup paths. Drivers
can embed a struct v4l2_subdev_1to1 instance and use the provided helper
APIs instead of open-coding the setup sequence.

This reduces code duplication and simplifies the implementation of
simple bridge and converter drivers.

    In 1TO1 subdev driver:

    struct your_device {
            v4l2_subdev_1to1 sd_1to1; // instead of v4l2_subdev sd;
            ...
    }
    ...
    your_device_probe()
    {
            v4l2_subdev_init(&sd_1to1->sd, &dw_mipi_csi2rx_ops);
            ...
            return media_async_register_subdev_1to1(sd_1to1);
    }

    ...
    your_device_remove()
    {
            media_async_subdev_1to1_cleanup();
    }

This API help reduce over line duplcated code in synopsys/dw-mipi-csi2rx.c.
And use this API at imx8's parallel CPI driver, which over 90% code now
hardware related.

And also benefit on going pix format patch
https://lore.kernel.org/imx/20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com/

It will also reduce missed media_entity_cleanup() problem at some error path
https://lore.kernel.org/linux-media/20260614202835.11977-15-birenpandya@gmail.com/

Previous do partial simpilfy at
https://lore.kernel.org/imx/aaisdJSsFE5-PLx1@lizhi-Precision-Tower-5810/

To: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
To: Martin Kepplinger-Novakovic <martink@posteo.de>
To: Rui Miguel Silva <rmfrfs@gmail.com>
To: Purism Kernel Team <kernel@puri.sm>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v5:
- Add media_async_register_subdev_1to1() to simple code.
- Link to v4: https://lore.kernel.org/r/20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com

Changes in v4:
- remove imx93 driver support since have not camera sensor module to do test now.
  Add it later
- Add new patch
  media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
- See each patche's change log for detail.
- Link to v3: https://lore.kernel.org/r/20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com

Changes in v3:
- replace CSI with CPI.
- detail change see each patch's change logs
- Link to v2: https://lore.kernel.org/r/20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com

Changes in v2:
- remove patch media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
  because pcif controller convert 2x8 to 1x16 to match isi's input
- rename comaptible string to fsl,imx8qxp-pcif
- See each patches's change log for detail
- Link to v1: https://lore.kernel.org/r/20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com

---
Alice Yuan (2):
      dt-bindings: media: add i.MX parallel CPI support
      media: nxp: add V4L2 subdev driver for camera parallel interface (CPI)

Frank Li (6):
      media: v4l2-fwnode: Extract common helper __v4l2_async_register_subdev_fwnode()
      media: v4l2-fwnode: Add common helper library for 1-to-1 subdev registration
      media: synopsys: Use v4l2_subdev_get_frame_desc_passthrough()
      media: synopsys: Use V4L2 1-to-1 subdev helpers
      arm64: dts: imx8: add camera parallel interface (CPI) node
      arm64: dts: imx8qxp-mek: add parallel ov5640 camera support

 .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 126 +++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  13 +
 .../boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso |  83 +++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  27 +
 drivers/media/platform/nxp/Kconfig                 |  12 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx-parallel-cpi.c      | 614 +++++++++++++++++++++
 drivers/media/platform/synopsys/Kconfig            |   1 +
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 194 +------
 drivers/media/v4l2-core/Kconfig                    |   3 +
 drivers/media/v4l2-core/Makefile                   |   1 +
 drivers/media/v4l2-core/v4l2-1to1.c                | 117 ++++
 drivers/media/v4l2-core/v4l2-fwnode.c              |  17 +-
 include/media/v4l2-async.h                         |   6 +
 include/media/v4l2-device-1to1.h                   |  72 +++
 17 files changed, 1123 insertions(+), 169 deletions(-)
---
base-commit: 7193e493653c9c91b4be159cd919924ec6ad2392
change-id: 20250626-imx8qxp_pcam-d851238343c3

Best regards,
--  
Frank Li <Frank.Li@nxp.com>


