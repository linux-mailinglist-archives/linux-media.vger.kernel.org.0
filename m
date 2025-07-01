Return-Path: <linux-media+bounces-36476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA35DAF0630
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 00:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 913CA3BDC35
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 22:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A4030204C;
	Tue,  1 Jul 2025 22:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Pi6xihWI"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011013.outbound.protection.outlook.com [52.101.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4A81CA81;
	Tue,  1 Jul 2025 22:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751407598; cv=fail; b=jB2N4Lh+mTf5ugzfiznCZ23RMjcjl93uHJor0KFibxiT9OcSxNXy1Tr5ZlrTw8zavJBK/XM8S8ST3N3ysXM82JiRSXfDR4PRKB2g1zhy3jZkTixPnm4tsSKRAS8c2pKq/hV0+t5bO343O0LPnOkOb8HI7j4iIsMOckrMo0kzObk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751407598; c=relaxed/simple;
	bh=tY6izZKvrgOm6RnrqnCB110B7xQ35OKDo5sqHmop198=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=lNFe+3+Sei3NvNxSKzBlviJrWj2kXD4pwJqO3oc7oPwOi/oOKkdasngtjmnOSAOh1FkZzySdDryUnlc+vJGe7TUhwPYpLSaeMUOhV1s5XMuQmS3zGKGKtXlWbzH1zhNCEiTZSzyeCVjGyrJDmw60g1G0gpzdgsSkk/MAIoyjzRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Pi6xihWI; arc=fail smtp.client-ip=52.101.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yG+VPxCDXMNXijRqdNYI5l9AbKIT0m7OHZEeUtec7b8+dKekppFfb1VpsErTwSMI0RoUtN9Ukmno+BhrUQwvqGMzCnzNMB0pLx9NeI3GmYYoCh1tiSzG55Kk9tRU0d7gzz/1PsWyBR3NN2bIGGUbWEvF7q9dSw4j/sMMf5hMy38N811dvYmPg60nagvn+DOmlJwj8xi/5KNk6Duh7FpkAlzXJvsM2qhvYR+nyVrahevvTqSz2GyILDfLZbu9930fMnglfNMU03e6jon0XV4jWlflw8YAPmozl7ueQQb0n+01+CCofiYgQRqRgAAW33VufTxYEnjs5ymCbQqXx9G/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnqBFHimdd3JC8BnvV20h/d7eA0iBRnEOawIyqFcZAg=;
 b=wVbVZKS4jANQFBtvf7GznU+ziZzqFQb84wXNQaDNHFTsNC2bSATadaNIWpW09ViRJ6IaVnTH0rOBTbkVRPXa62hrfihvJTGZudhE7MDemM2vLGz6n5gwQzJee6fC11IjYIPXTH07ZKkTisqpX2ykH3gDUUZtRemFQLp7d5p7b+Q/XMxart1QAQ2nFqQEDgwu78M3ioMkYi5oeKwISNsjgmaJsvWzbcHoFjz/PZLYpyAOrHhz4VCmd2AGIDpDwXwMgHdfJqZOvn6pgDOEoEuBvDVytvl1k511YG4jvZ7M6PxUT3J8l4f5+H1FIE0TmBJTS1Xacb0HZZVHfizpGc7nuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnqBFHimdd3JC8BnvV20h/d7eA0iBRnEOawIyqFcZAg=;
 b=Pi6xihWI61Fp/ciqSgE/FLciWkdOuWu93gbzAChWz776pYLJHbCq4RpA3k4nLzz4Kn5gesU61MPadzopWH6YQzFpbJa5Q8hb1DKy4k+gRkS/pw2VVi24pH6k0o96rPugTpB2yj3XGdzqxaQioeAKeUf6Il5+1totw6E4FFZwK9VlrDfnYIQcng+H6TngFu7ESmQfR+DjAy8kxAeek09+veW/sbm8ftucZbOJZgBKlzW4FUeircVqtnqNCsH3wctXHc1GLkW+4JCpDHiYatqzilnRCsJDgV/nX45353yOxIfaJT1rqqEca3Hv86q2fBQSQMia5YD/r3BECEC5jC3fpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8843.eurprd04.prod.outlook.com (2603:10a6:20b:40a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 22:06:33 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 22:06:33 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/7] media: add imx93 mipi/controller csi support
Date: Tue, 01 Jul 2025 18:06:05 -0400
Message-Id: <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM5bZGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMwMzXUvT+OTEXN0kc5NkA0uTxBTDtCQloOKCotS0zAqwQdGxtbUAdKE
 gHlgAAAA=
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
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>, Luis Oliveira <lolivei@synopsys.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Jindong Yue <jindong.yue@nxp.com>, 
 Robby Cai <robby.cai@nxp.com>, Eugen Hristev <eugen.hristev@linaro.org>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751407588; l=2496;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=tY6izZKvrgOm6RnrqnCB110B7xQ35OKDo5sqHmop198=;
 b=VoJFF5Bt2LV6TFye22oqb62Ip8Hz6bhB7zZa2l2yHH7O/tTCqtgq2BJA8uVJnNkrPf3ABdjoq
 eNfPj5DuHIKDJfTyltia2DRD3yq14aAjbjbVo0gL/jQK+7veF9+NWyZ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AM9P250CA0027.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fb542db-bc2f-4888-95f3-08ddb8eb8a3c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?QVlhTGdsb29QZUMvaHA4V1lhNGtTenNTdEYvb1RHMkFVODBzaG02bGRrakRY?=
 =?utf-8?B?cmNLa1lNY3RxdUJqTnZpcDREWmRkREFvKyt3UHEvNHhvN0dPNWlqNHFWdWpI?=
 =?utf-8?B?M0JsUHVZNVFROEQrL21CWGtSMnNPdHhSZWF0eHQ0ZURCbWlEcTR3L1Bza21D?=
 =?utf-8?B?bm02Nk1BNklMdmM2VHA5WEw2TW5iUHQ2VFE1Qm1rZDFtOE96SEpBdUdESHhD?=
 =?utf-8?B?UnVxdVRqU0NiWVAzdTFqWHlTa05IemI4ZG9vQk5nV1JVVFpCTkpPNEowZW9j?=
 =?utf-8?B?Nmg4SnNRM0ZxT1VubCs5Mi9vVzNxdU81eFIyb1FrTG1RUWU3YTh0WWloN1Mr?=
 =?utf-8?B?TTdiMnRveXFiRzRQQmlGeWFqcEREdUgzNkpOd0UxZFN3WXp2SWVzZVZIT3JR?=
 =?utf-8?B?SXdmdDk5Si9LcUVqdUZIeVljbXpJM3J6cGY3ZnhiVHJFbk01RDkvTmxvaWZn?=
 =?utf-8?B?SW9QczlBMEw1YXhBM3ZETEJ0RTFXd0JleVlYU1I2TGh0cWh5dnl2R3lOM0wx?=
 =?utf-8?B?b2ZKZXJPMjBXMTFVbEpqVHhVd3pjeUFmZHNaRmFNV0lQNEdUSnRPeE9DU3Y2?=
 =?utf-8?B?YlN4dG1EcjVLdFlsaTl6aFFXUm9hZXFYMUEzdDBiRHhHMkcwOUFHaDQxWFUw?=
 =?utf-8?B?Nkk2NGJZNGZyN1VDd3plSDUzRFBOVHNjOUprY0kxOWRPSnVpcUhPajdkSW9t?=
 =?utf-8?B?NlNhWUVncDVXYy8rcUJYNEYxb1V3di9JRDJrZGpvdWRsNkFsdTlqY0VlSGlp?=
 =?utf-8?B?dzZKZ1RLMnNYYUJXL1pwVFlYRm5QcXkxdUFPUGxpeWdkeUNtbk95ZTF0cXZR?=
 =?utf-8?B?NjM0cTMxWnJ1T3FTTEtXVjZ2VVEwckVwb0srcGVTMnFaUkFlVEJnYVFscUFM?=
 =?utf-8?B?R0FaTXRZTmlSbThhV3A0K05VMkRoOVlRUmZMYklreXZwQ2NXd3M2VmU4ZVE4?=
 =?utf-8?B?S3A4RVJPV2hnYTVVS2pkZzNNZmR0RjZmWS9Ibk84ajhQb1hiaUFXSXdUdkg0?=
 =?utf-8?B?Nk5IQnBKZTRqQXFlVHowYjhqWE1pdytWRHRsUjI2TDlDRUdDS3NLS1VJK1dV?=
 =?utf-8?B?T3FoT3lPRDBnRTZ5NlRGcVpPdHQ4OHFsTVl2MUtHdzhPMVdSQ1A3RTV2V0Nz?=
 =?utf-8?B?cG82Sm5vYVY5THFWMUduZ0xnQzNTbmRTNHVnbGpBVGpUZXJLUkZodENQR0pU?=
 =?utf-8?B?UHFmenNiZjV0NTJ4cC9PS1ZCVkZNOStENjNTc0tDT2xneFZjOWRTV3VESm5k?=
 =?utf-8?B?a0tBZ3J1Q25QMVRqeUREME11QmxDSUhzTVNSL3lCQ2ZmdWdZRi9FUi8rSEdP?=
 =?utf-8?B?bEw2M0lpQnZRY2ZRQWFDamhqSVhHOTZRUml0Q2NLdmhkUWhFZjBNeXVBSnRt?=
 =?utf-8?B?cnJJY0FlSVlHZkFmbkxnR2Jnd21jUmlEL2p2VUI5MEdITVZZY0lvZUtuNzBz?=
 =?utf-8?B?NmpqVm93ZlQvRGlMZ2svZWRncXZhWGhzSUVJNEcwVXV2YkF3b3dndUJzbk1Z?=
 =?utf-8?B?a3FGV3JOelNuQTZvOVU5STFacnB0aVI1ME9aWko4NWtubnRCeE9KME8wS2ls?=
 =?utf-8?B?OVZ2eW9BZlkwQ0pBQ213d1RjUURkQkZ4WGJoOVkxa0RCd0IwVU5INFRmR0lI?=
 =?utf-8?B?bFA4MlFLZytaUnVUeW5UYUMrcXFyTER5VzlkU0MrbFRJMVFMRFZOU1dVNkYy?=
 =?utf-8?B?c0xOYWJoZmtaVVVMdVZhK08zcHRXK0lGYk9qYjM3TmlYMUJpek1LOFM3NGJV?=
 =?utf-8?B?Q1MxUnRxSUxJcFIxaUxMd05wTkNpYVRneUIxYTRRZ3FNRUMzVWhnUTAxTTlo?=
 =?utf-8?B?c3lRMXdXdGNjYU9EQ1ZWWWoyYUJuc2JKbmx1NDNPMmZRRTZZSFc0Snc4a1BT?=
 =?utf-8?B?akhnMnBURWpXZWExNGpHNUhYQ2xJaUtWUWkyZlpFR080UEZXbDVOVGUwY3Iw?=
 =?utf-8?B?OVRhdlBLYWFpUjdPL0k3M0lPZlE3MFVvalZYTDdUNWlYTVFNUFZaZnJpd3hO?=
 =?utf-8?Q?qWrMA1eW2Q7y4TxIGxA7xThIkx+M7I=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SWVXUnYvaHNtaU5scHBZcVZwQTczMFdLa2FsblowN2hkdVNoZWRwRW5nZzZx?=
 =?utf-8?B?UWR6Q0J1Z2lnNjJuaEZmL2RUdDZTNDMraGYvK0dkcTQySFBZeHRZQi9yY01D?=
 =?utf-8?B?UERTWlM0Z1dOUG5mSVB1a3QveGxTcnBoZmtsdEY3WFByMkhlOENIcG5iQ1V6?=
 =?utf-8?B?c0lEblJvSVdYZ0ZvVTFsUnJwajNraTBBa2Rqb1FCY3BhV09oQnVSZHpyQlor?=
 =?utf-8?B?dlhDb3VTMytwcHFZbmJhK3FHOEZSWEFzR2xuUlJSK1pqTThNY04yb1RWYXhu?=
 =?utf-8?B?YVo3bTVwNGYvLzFuRXI1TGVxUGlYRTU3bDFZT21wUXV4cEFLNVk1MENFWFZ0?=
 =?utf-8?B?L0VnK3RDVkl6UTR0L3pDNnBaVE9pUVZpSmdhaWFRUWlSVm4vOVFQVzhqMEQy?=
 =?utf-8?B?WWo0ZGFxUDc1VmlNUlF0dHdUZjBkb2JtWUtEcmU0aFU3VThnWFBvNEpkLzdI?=
 =?utf-8?B?ejdIQlhxU3diMUlLTEI3M2NGZ1o0YThYSG9CWmNkK3ZoNC9VTXM3ZWZFVjIz?=
 =?utf-8?B?dzVmOWhOMTQrZEMvajdqZGtnVVo2NzZnc1VxdGNJdlZMTFJHWlhrTU1lYnBq?=
 =?utf-8?B?cnhORjg5QjhRUThEcndXZVlNTnMxazJ1UjFIRFJBUmY4OE5UYU5CQ0YwMU14?=
 =?utf-8?B?eUV2UjhKaGtjL3U1Ym82K0FGMy9SS1dBNGVnbjhoNVVWWjAxcmRhbUtWNnBt?=
 =?utf-8?B?L3l5bmxzLzFTa3FwcHpUeXRibDhaaHBqL0dFOHRUM2pPK1NpSkdnSHdGd3k2?=
 =?utf-8?B?cnFpUW03MlBhb2hVeUxINVc1KzI2eVFXNHZXdlM4YzNYNmRIVG1zN1lZL2J5?=
 =?utf-8?B?MHJhc2ZsOGlISlhIT3AxWmxpV3hiZk1YVis1emQ0NjVkZzJrVnhhVU02SFkz?=
 =?utf-8?B?WkJOaFZSWm9KRFpkdFk0WU9nY2IyMHBnRlNJdXhuVlduL0w1aGdQMmhha2pY?=
 =?utf-8?B?eU0rVDBFRFZWVkltTDMrenZkdCtldlpyMlFSSE10UmFxZEhmWE04RHJsWEhj?=
 =?utf-8?B?eU5icE1kRURxV1RvU2RPR2VnOXVaUVhaMnNlMjdoM0V4U241VHVqUXF4aEgv?=
 =?utf-8?B?WW40WTFONG1rYlNJSGpud2VsZlg3NjRzMU5Vb3RudFU4L1A3V0hlcHBRWTg0?=
 =?utf-8?B?M0ZlWTVsL0llWVM2UUxtYkhqL2o2TFEvMUJKOHQ5djNZSmVBeXdTUE14RGVn?=
 =?utf-8?B?S0FaYy9sYUlFMDNBTVg5Q1VEQjc2TWFkRUVkRDV5cTlqSllnZm9YU2dyM1d4?=
 =?utf-8?B?bmxUa2NscTJhaW1Zb3RGeW1DTFdiQ29BSDM2ZEEwQ1l5dlNSUSs0RFNXL1gy?=
 =?utf-8?B?OVN0V2ZZR0IvNHlWa0ZZV3NNSXcvQm85MlJsblN5Um1PdUlERmdHMjBMVmVY?=
 =?utf-8?B?MzV3aWtKVXVWZjhlL0c1SHhoSlVuS0NaU1dNc1RzSE1kVnN3Kzl1RjlYNDVn?=
 =?utf-8?B?R2RlcGhrYVIvamJYK1ViQ2N6eUtTek9IUzE5Y1Fxa1JLNFNQZ0NJQlVrdi8w?=
 =?utf-8?B?TG1sMU1PS1lQMGIzRC9CR3RIMEw0bTVRTUpHaEVJK3diM1hpUFN1TFRoU21P?=
 =?utf-8?B?N203Z0N3eHhsOU5TbGNuUEh6Szc4TVh3czNzZGR2bGpYVFYvU1FadWNsbTI5?=
 =?utf-8?B?YWEvcTJrUzY2dHZUa2tGdnJkU1F0WklVTHB1U3dHdldCVkc0eEVqS3JGMmVY?=
 =?utf-8?B?aFRZbG54NjhtdklaSktOWTlCaXJPaVYvZ1BFQmJnRXJicGpnSUFxMytqQWFW?=
 =?utf-8?B?Q2U5OHlPMkN3Qndqa2tnNFM3QWIzSSs3cHhNMGpNL1JQUkVvZVRmRmE5WTlF?=
 =?utf-8?B?cEFuaUJqV1daZElKQmkvWlllS1pab0lzcFpaZkJsNy9iNG1tVXZRaDJHTEI0?=
 =?utf-8?B?d0owTnpIY00zM3hxMjU0QlhiRk51QXFnenFienhyblBjd1ZSTFE3VzJhd21y?=
 =?utf-8?B?b2VqbFZ1Nm9JOXZlaEhzWWhGOUkwZUdHeFFnR2M2WXVwQVNCdmlxQ21hVkY5?=
 =?utf-8?B?ZnhNNWZ3OGY1cHlsYUpHN00zTjdRWmNvWkFOSEVwT2lsOVIxWEZ4SytwUHQ5?=
 =?utf-8?B?cGQ0czJrcHVOakVQNXZLWlBiM1RvMWY1NHVSK0hZUTUwQURDL1NHUnZNVmhH?=
 =?utf-8?Q?PDjhwHCOfsBbsqfCgRJIHKu+V?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb542db-bc2f-4888-95f3-08ddb8eb8a3c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 22:06:33.4706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zq6bL5JpntOWXIYk62WxQE+8Z1VxcxEr2YwOIMoHeiTFMaydse3lTaxS1mLWV2WuzH4TyyYZvJNu1f8JSLsa/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8843

Add camera support for imx93. MIPI CSI2 use Sysnosys designware MIPI CSI2
controller.
  binding doc: dt-bindings: media: add DW MIPI CSI-2 Host support
  drivers: media: nxp: add designware MIPI CSI2 controller driver

i.MX93 provide DWC CSI2 DPHY wrapper layer, which module as standard phy
driver. The controller register lay in imx-blk-ctrl.
  binding doc: dt-bindings: soc: imx-blk-ctrl: add MIPI CSI2 dphy support
  phy: freescale: add imx93 MIPI CSI2 DPHY support

Dts part:
  common part: dts: arm64: imx93: add camera related nodes
  board level depend on AP1302 sensor driver, which have not upstreamed yet.
Leave here just converince for reviewer to do test. Please skip review below
2 patches
  [NOT MERGE]media: i2c: add AP1302 driver from community
  [NOT MERGE]arm64: dts: imx93-11x11-evk: add camera related nodes

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Eugen Hristev (1):
      dt-bindings: media: add DW MIPI CSI-2 Host support

Frank Li (4):
      dt-bindings: soc: imx-blk-ctrl: add MIPI CSI2 dphy support
      pmdomain: imx93-blk-ctrl: populate child devices
      phy: freescale: add imx93 MIPI CSI2 DPHY support
      [NOT MERGE] arm64: dts: imx93-11x11-evk: add camera related nodes

Guoniu.zhou (2):
      media: nxp: add DesignWare MIPI CSI2 controller driver
      [NOT MERGE]media: i2c: add AP1302 driver from community

 .../bindings/media/snps,dw-mipi-csi2-v150.yaml     |  161 ++
 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml |   28 +
 MAINTAINERS                                        |    2 +
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |  139 +
 drivers/media/i2c/Kconfig                          |   13 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ap1302.c                         | 2920 ++++++++++++++++++++
 drivers/media/platform/nxp/Kconfig                 |   11 +
 drivers/media/platform/nxp/Makefile                |    1 +
 drivers/media/platform/nxp/dwc-mipi-csi2.c         | 1675 +++++++++++
 drivers/phy/freescale/Kconfig                      |   10 +
 drivers/phy/freescale/Makefile                     |    1 +
 drivers/phy/freescale/phy-fsl-imx93-dphy-rx.c      |  306 ++
 drivers/pmdomain/imx/imx93-blk-ctrl.c              |    3 +-
 14 files changed, 5270 insertions(+), 1 deletion(-)
---
base-commit: 778df2ca2914864b0876d8c9d7383a5f4293f43c
change-id: 20250606-95_cam-b74c094ad1fb

Best regards,
---
Frank Li <Frank.Li@nxp.com>


