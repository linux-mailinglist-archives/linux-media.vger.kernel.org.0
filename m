Return-Path: <linux-media+bounces-39183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E69B1F117
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13C423B5B9C
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADF02BE057;
	Fri,  8 Aug 2025 22:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eHBeOpiE"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013018.outbound.protection.outlook.com [40.107.159.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366602BE02A;
	Fri,  8 Aug 2025 22:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692984; cv=fail; b=phNNNwJSU0CkggWa3gdGwxE9AjXMxgQMei6t+oW8DQgfPUo5f/G0agCH8KDXpTlgdJCKHi0WIE7vW2ed3qTgRTrw/pywrfxkbGiOJwY5jGEl3C09Zy3wDIDgHq/fK70FKYLGQjXq4YKFA7E+HIFFD9WpuDnRitS30zjKQdYL9sE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692984; c=relaxed/simple;
	bh=ejizcwANiU3CyL/B294fsFca60Ykxx5qgiNFp1OC7Iw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hfOQlNk/+nPO9v4E2o1kPyEcvMQmNCJnvn1jigEWH5psrXhcPGBUy4zLZ2CoQPn5MnMUGGfhXofilJlakpQPlN0iVRT/yMQxj96M6AbXduCrML7IhEl3JrMjDUf8oL8yiIEQc3rJFKpd+ZS+LPpPX+Gp9BGIzs8H8bPOqJDDtBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eHBeOpiE; arc=fail smtp.client-ip=40.107.159.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVMOzVOeqq4+Z2t118Y5lQXlfyyy2FLuQpezUxHSvVtGjX5aN5B85chkOKIAJRq+hSUcV4QHQ/lrqH32UJGHUIMoxJVEFfTos3oh/aO0sZBtPKfmCXCph5BZWpT425He8POwecEYDAZSeNn14v9wLztQ46vPMOwkaokfRxeLY1oey4Nquk/8psfDXiqq3lHnWPAcOZYXxpaSfKp0UfO0IGizcDG60sT729I9ibKdoUfml3wZ/5j6tX07NjbyZ6Fi/53kzCJiFx4iIWwVZrjeApUfadFhJCzoB011YIHoEwl0PYvwgeCPzm3uQcnWUwMNtHfXDbHIrYILMpB7EGQa7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7eONJvi/F9wP8r92racUCkYKaMX+OJa6S+JUnZ/a+8=;
 b=dy9t1uZM+wO3V9aTfZnaT3g7fiLi58VY5PA/42boqLbKpkMFa1COrhBswU1+4ItFNWMombSFVUYDM4QDzxPugyunHfO4Be4qNaQtszcHabOKwCiLQwrAY9bT1YnzIeAku477TI6yOfHGCvAkG8dYynUjQ2ADWTmCmbZPXgr3UPUTgA42WUH1S79WYhxccMTjLrgEmkGu2GAmYHuATo0Z3YYwNLysBp0dpog2UB2CRXr/B7Z66ehj0M5lITADkSON1VFYmhLEWZQM23JeKFrI58mryQ+InJMb5i2Sw6BueiCFqmiMGCJ4KzXXEdv60PlnEY8xdmygVETGy/M7OaWssQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7eONJvi/F9wP8r92racUCkYKaMX+OJa6S+JUnZ/a+8=;
 b=eHBeOpiEP7ddTGXlxwPFEnB/ZTHZe15m6CQeVNjJLQsgNFmyahO59xdB5ji6XKelx+vj/DYW5DrkX0OwrLVebK9O/8bMxHbxsIGnZK7ujgWCNbwDwE5h+UJWk+Y3LvAvfd75vtkkReJWCGfXdI13fGAtCUW81f0xBW02noMUen28V+UIrK9qKTDPSLaRRX9/DTx4qTpd5Zp1jK7Jb7mHDFesyzs1wL0c9LP0CbsJBExH3WmmtEHz0lYCgeBATtvxGslxzAKukFgvUK2EOy3jRybYBZ31i6izzj8qqUrzU0JZ1pBmG55e6bPUAebF0hMSJ+/gQMli7/qiOQDDC7NktA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB11346.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:42:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:42:59 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:34 -0400
Subject: [PATCH v2 31/32] media: synopsys: csi2: Remove source pad
 connected check at dw_csi2_enable_streams()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-31-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=2239;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ejizcwANiU3CyL/B294fsFca60Ykxx5qgiNFp1OC7Iw=;
 b=WhHLwA3iZ3il8K+vPpsTtqchvkkZ1qBvYU004N5iu8nT3aiyXc1mzi3w/p1Z4J1qM+9ouTe4V
 /zS9FAijt3YD6AwalGKKtzQVInHhKbQ+1bUa/UetBnY9PbhoOOv6LU7
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
X-MS-Office365-Filtering-Correlation-Id: 0c626544-2bcf-4ed0-0449-08ddd6cced0a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?YzJOMVo2YklRSWNOT1d4bU9oRVlyZWR0bm5QbG1LNlRmQVVPMEtKYWtIa3l2?=
 =?utf-8?B?enZ3TVZjMU1SRExlQjl5NmlaRkhlYVBDSlA5VVdTMEtwdWNNeDVnb1hjUnpQ?=
 =?utf-8?B?b04rVitTY3NTOFBCK0pybFhRK2g2b0hOZUNQa09MNjVLN1kyUi84WnRUd2JE?=
 =?utf-8?B?QmpzdUJlcWRSdHFwY3FDMVBkaTlJcG5BNTUwWHFJcVc0Z09iOHJUZkNjN2ZY?=
 =?utf-8?B?aUVMenRZTXlGR09KSzU2SlFSem9sOFFkcm1KMkxCbER4NHkyR1o0dzF6eG02?=
 =?utf-8?B?RncwWWdLZThGenYwNk1weVNZVG8vNC9OalVKS1IwQjNxc3BMa2kwNklOT3dl?=
 =?utf-8?B?aFNnWlJlYXFETnQ2ZmNaeVJTS3FWVnUvcXVLOXdTd0NsYytGdlhLRzd5SEY3?=
 =?utf-8?B?QzIvTFVKZmUrR1JLVHJlZUI0M2orKy9ETWJWU2g2RmVvbldvUVhVc1dPNENn?=
 =?utf-8?B?UkhiVjJkNGVvL1Q2eFUvZFVJSWFxeWdEd2VOWXlqMGxReEZkbnovVlBqMVJi?=
 =?utf-8?B?ZTNaQ3NNWm9vZVF1SklzbDdCQ1R4d1E4RTBoWEZMcEl1ZnpEMUNKd3B5MmdG?=
 =?utf-8?B?ZHRFUEV5QXBjaGs4RHhjTUVHY01sMzQwazkveGs5K3RoR1UzSThJTHk0bUxN?=
 =?utf-8?B?ZkI4TytUM1JuUHluNndpZjExb3lvY0ZuaHlaRjlZTXBrR1RDNjJEcWw5dTlF?=
 =?utf-8?B?bmVObUx3bEhrNmg0N2VacmtIcklZcCtLWllIRnJVTUdLNkpZN2ZLTzZ6MmVs?=
 =?utf-8?B?VWtad29Na096S2hhVGFxOW1MR0dCZ3Yxc3p0bGxoVnhGbm1vb3FvTStUM2JX?=
 =?utf-8?B?bjlnWlV2cW1vdnNWKzNkMW9LWklFU1N3M0doZUZ3RjBkMXZFd3lnUlgxRVFF?=
 =?utf-8?B?ZHZjOWtoRE96THVyZndKenJNNmlFVDZScHROcTI4c2xyamNKWkRCVzNDTzJB?=
 =?utf-8?B?cWJMZHJKMjlGeis0RzNYRjErZUdSSy8rYzJ2OEI3a2JKN093RldtZkludldv?=
 =?utf-8?B?ZmZGbkQ4NDNBdlFpL2xiUTdlazhkOGQ1NWJmbXl0UUUzV2lyUWkzNXQycm9W?=
 =?utf-8?B?SlFmVVA2WWdienFOVTRNYkpzc1F4eElaU0pqS1FxNUNCdy9va1hyQVkvRlRO?=
 =?utf-8?B?VXN4TVM5MFdPUGlvSXBZVkl3dmhCVlBQdk5XZDJMSS8yWU9SNkxQUmdkVXhQ?=
 =?utf-8?B?TWNIRFNrOThncDFUbVdXd0xGcTZYaDNlM1dhRHBRTFloYUQxVlg4ZWMyei9j?=
 =?utf-8?B?d1dla2FZcE1hZHM3SFBtNGJ5NWJtQTM4cDdBUlhaZHZ4YlZwaTZEZ09xVkV1?=
 =?utf-8?B?QkpEc2xtbWY4MCtPQm9nM0lGSVJFTDZUV0VkRnNVQlc3R29yNkh0cFNockh5?=
 =?utf-8?B?dW1HOXUzL05xSmRoTllGbnJ1NndTcEdGdnNUSWZLV1FaTDlzTXFIbGtONzUr?=
 =?utf-8?B?L0prOU5kRkRCTjRLTCs3V2VYSk9LemlRQmxpMGVvM0pCRklTcU0zak5lQmhQ?=
 =?utf-8?B?OGxoaVZxa0hoT2oyd1ZqSGlSK3d0Um8zNnZvRXlBL3VnZU13SnFQRXRDUFZa?=
 =?utf-8?B?VUsyVFNYTFBnV3F6MURqWXFRakFsa3M5SVBXUGVZY3FPMmtQd0tsb1llayt4?=
 =?utf-8?B?YUdtMkZsTGxrQWlhQXA5eFpGaWQvY3puVzlqb0tjRmd2ZEFhZU9ML3poYzdl?=
 =?utf-8?B?WnM1YnhkY1RQN3VjbUE4K1EraGRVYVM3K3lNTUp3VjFyVFZ5anFLZW90djIr?=
 =?utf-8?B?d09RUVZwWENvRDgvOHBrS1FUUDdBb1BVMlp2ZWdWQzVzKzg3RS9YNm9LRGhH?=
 =?utf-8?B?b2VDa1gzUFdlMnIralN3WmxjZWdvQjI1OVFvaFhpQ1pVdlhNL1pIZHFxZFhL?=
 =?utf-8?B?a3F0L1JBdkd2dEhvWGZrTVdGeWdMVzNWQlpxOFFaRVJ0VXI4ZkphU3ZrdHpP?=
 =?utf-8?B?RVh3ZjY5N3R1MFhBcFF0a1dWT3lIdnZ3bEg3RU1VN2xHQ0JHSzFKTEFKYnNR?=
 =?utf-8?Q?zDNXDMEQwZlZGx2GjVa0EjpeP9Qi8k=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ejR0TTVaRVoyZDZaZHQzZ2U3R3VoMGlCUUYwQU1yOVVaR25TT1JFd3d1Qmlq?=
 =?utf-8?B?SHpxVHR3dlhqSGlMM2hBQm81bXN2ZEZncFc4dmJpcUo0ZS9Nc3lmWm16cUFh?=
 =?utf-8?B?UUNrWXNUWk5PQ0d4QjZUc1dra1YyY1NVSm9BOFd2RjBmMDdKYVVNcURkeHFT?=
 =?utf-8?B?OWRnSEg3UHdSdXlHSGg0L2NybS9Cam5NaHBKTjJSY0xnTG4xUzgrNEJMSWN1?=
 =?utf-8?B?L0czV0tPTzJESmM3Q3JQd1hobjRHSlREQjhwYmNERmgxYlpDcmJ2bUY4L3Ni?=
 =?utf-8?B?U1FzcGllaWFkc2ZVOFppb25TeXpLQktGR3JUYld3T3BWWHZWYUxuZFoxbUlO?=
 =?utf-8?B?a25YN0lzL1FITXhBMWZoMXBYeVdNRFc5aFIvWE1HcDM2aUE2a3NoOG4xVEM5?=
 =?utf-8?B?T3pPSnpYNTlYNTduaU8zdkFwK1ZMWFJVS0JxcnVNWGx4WndaTm90NWwyWXJv?=
 =?utf-8?B?N1JRdjR3MWhsT29Vd0ZSK1ladGxUU1JqWVcwVnNxM0l3cUtpUFJ1VGhBTmVt?=
 =?utf-8?B?MVkrTFFuTHM0YVEzVFR2SXE5SFBOVWtoWkJEZnEzMzNyaWt5RkhGNUhMc2hU?=
 =?utf-8?B?MXA2SG1yV1lyZGg4T2RTdzFDUDNVVmVmVzFNTWViTm4zWUtFMFM2R1hTZ2o0?=
 =?utf-8?B?aDJKaVFNc3RNYlhRb3d1UkhwYjU3dG1kTWJ5dm1SZWlTU2dRQmNwUllUUEJj?=
 =?utf-8?B?QVZKbmFnYm1VbnVwZG9xVzg0U0pQSFl2L3ZPMHNqZENIeUVJWWVnWkM2Z2VX?=
 =?utf-8?B?ZHZmQm8yM0J2Z2RRMFJaQk9Ud3ZuUWlZL2QyT2ZjOXNoZm1oU3dkelB1MWRL?=
 =?utf-8?B?Zk0yUGtDT1Z4Uk8rWFloL1RqaFZ3U3FkeEloWVg2MmxWTDZ3bVVOU0o5QkZW?=
 =?utf-8?B?ZFVZRVVuV3AzYlFlQmhlMW1zaTlZdm1vZHozWnpxR25pV2dzSUh1MG13QXB0?=
 =?utf-8?B?cGp3ckQrUDYzQjBZZWxmSm5yd0N1TVNubENTQVRIRGc2anVoTUZVSkpic0lW?=
 =?utf-8?B?MWlPNks4d1hFaURIT0Q0TVhlT0l3OEdvbEtDbjFzankxVnRUL1ZKNDRIeWdn?=
 =?utf-8?B?RzlyZEk3T24rckpPREp3THd6WWVYeFRVZWdsa1M2Tmh5OEF0a0hGcmJNSHdY?=
 =?utf-8?B?SjhDV1RIK1VFQ3BzLzROOHJDdS9VMGlZMEpuNDZ5bENmMjZKQWVoMzVaaGdo?=
 =?utf-8?B?L2FNWnJZSWFvbURFMjNwOE9CaExuKytQUVdRV25VcFJZN2crb1dveFYwZXUz?=
 =?utf-8?B?V2l1TldhM1BQRjM3U09pd012V1hVUHRyeFFpc09XZ2N4Nk5vUis5eVFvQlIr?=
 =?utf-8?B?Vi84T1o4aHNObjVjU1ZoKzBOWCtTUHRGMUVDQ0JIdDd2WnVUZU9WOWRKVG9W?=
 =?utf-8?B?S2o0NWRmMVp3UnlrN0xoTlBKc1V3S1FRK2N1QWw2RTBZL3FSZ2xxTjBRTmtm?=
 =?utf-8?B?dFk1ZzcxS3Z3ek0vTXFJQVVUeGw4YXRMbFJWOWJlQjJTdDk0UUUvcHhYS0hw?=
 =?utf-8?B?cVQ1TVFOeHpJOTRTK1VhUFh0N1JDVVdDQUFrNDg5alV1U21ISlZYeXN1cWdh?=
 =?utf-8?B?WWFLNmpTOE9jWFJBT21WbjVPd21JYitRYlVGY2E1b05ITFdsejRTQzhVRkpy?=
 =?utf-8?B?d2poV3RVYUNubnVtYTZaOGxNd1ZOZ2hMR1AyL1VwdUhXYkFNRmRUaDlDMG0x?=
 =?utf-8?B?ZUkrYUh1Nkc3TEx2dmxTRStrbVpJY3NjOWRqQUgwaHlKYmVDK3ZBdXZOVFcv?=
 =?utf-8?B?c1ZReGZrT1g5bDZxaS9nUUJWNmhZWXE5MWl4WGJML1F0eDBKMWE3NTl1b0Jl?=
 =?utf-8?B?VjB3WDNuS1MwWWRVTU8zNFAxZVJjNWxZaHA0WEJSbkdtNzI1a0U3ZFRXdG9G?=
 =?utf-8?B?NHliTUR5dHZIb2t4QVVJQ1lFZy9wV0xFeHhHWGEvd1pzU2tTM1Z2akVJQVgw?=
 =?utf-8?B?WEJXNUltcDZLUi9OUzdYR3NLbTBVQTdmMjFFMzdZQ2o0UmpTaVp2TlVaWUtS?=
 =?utf-8?B?OHVKTjRScGtmMzlaM2k1Nm5NbjFkTWhpZ2ZYWE5CL1FnMGErcFZUb3dORng1?=
 =?utf-8?B?d0ZlcVFQK0w4dWVHOWRGWEprQ0ZZM2Ivdk1uY2Z4ZXNrTDBGOTRidmc3ajZG?=
 =?utf-8?Q?q3AnGMs7d66qYEEaaNVmGsH6n?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c626544-2bcf-4ed0-0449-08ddd6cced0a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:42:59.7097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VM+dO5IBIHKF8rQQlwY9TAQnuVjyul5i/L8182ANu8phEf9M5SiGa26NKXfC9aE5YbrDD6CjQ6QlASXitXP4Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11346

link_setup() callback is not called if remote linked subdev use flag
MEDIA_LNK_FL_ENABLED.

Driver needn't track if source pad is connected since framework already do
that. So remove these check and related variable.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 21 +++------------------
 include/media/dw-mipi-csi2.h                |  1 -
 2 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index 48ae455a77b2365b6df8a79a366b37c7f1dfe590..01c590a953f3f89ebb56bc42e820b09a8afbf5b9 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -710,18 +710,12 @@ static int dw_csi2_enable_streams(struct v4l2_subdev *sd,
 				  u64 streams_mask)
 {
 	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
-	int i, ret = 0;
+	int ret = 0;
 
 	guard(mutex)(&csi2->lock);
 
-	if (!csi2->src_sd)
-		return -EPIPE;
 
-	for (i = 0; i < csi2->num_sink_pads; i++) {
-		if (csi2->sink_linked[i])
-			break;
-	}
-	if (i >= csi2->num_sink_pads)
+	if (!csi2->src_sd)
 		return -EPIPE;
 
 	if (csi2->stream_count)
@@ -773,16 +767,7 @@ static int csi2_link_setup(struct media_entity *entity,
 
 	guard(mutex)(&csi2->lock);
 
-	if (local->flags & MEDIA_PAD_FL_SOURCE) {
-		if (flags & MEDIA_LNK_FL_ENABLED) {
-			if (csi2->sink_linked[local->index - 1])
-				return -EBUSY;
-
-			csi2->sink_linked[local->index - 1] = true;
-		} else {
-			csi2->sink_linked[local->index - 1] = false;
-		}
-	} else {
+	if (local->flags & MEDIA_PAD_FL_SINK) {
 		if (flags & MEDIA_LNK_FL_ENABLED) {
 			if (csi2->src_sd)
 				return -EBUSY;
diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
index d1afd8c6d95457c28d7e1de6935908437372572d..977a9e27cc50ad6ecfb47ebf8d42f115bc51c1ae 100644
--- a/include/media/dw-mipi-csi2.h
+++ b/include/media/dw-mipi-csi2.h
@@ -75,7 +75,6 @@ struct dw_mipi_csi2_dev {
 
 	int				stream_count;
 	struct v4l2_subdev		*src_sd;
-	bool				sink_linked[DW_MAX_PAD_NUM];
 	const struct dw_mipi_csi2_config *config;
 
 	struct dw_csi2_event		*event;

-- 
2.34.1


