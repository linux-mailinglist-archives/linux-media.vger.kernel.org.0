Return-Path: <linux-media+bounces-60546-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDsjIYQB+2kbVQMAu9opvQ
	(envelope-from <linux-media+bounces-60546-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:53:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9154D8229
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78CBD3073761
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 08:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882E63E92B7;
	Wed,  6 May 2026 08:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xsnpQzE+"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013041.outbound.protection.outlook.com [40.107.159.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7583254A3;
	Wed,  6 May 2026 08:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057515; cv=fail; b=HX6025YVMUWAbgIgoRJZwSiu589YxexBmBbe+d6W+xn3NnklMRruqxzi0HCBzZYxg9vthvmMmnAHGwgD9C6FNFgwGYWMHUELcxKgMdQWv5f/op2S47mpweb4BGXvn9Dxxh27OH8UMJznIswGQ3AqwnO67vSWdCxHg3jVX3uQQ+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057515; c=relaxed/simple;
	bh=5AbqFI1KcR29CpkfsN2mQT+0KkCA3hbqAFvX4GNnHAs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Tp31vf6yXWxtsVQQp6tmYL0itSu9qUzKLC9+fshh6k/r1ctFjwD8cMryz8fo7yLjwIWI4K3Cso7bMT/cQyFOfyM6EG3iouU61ZyxR3uuieFtMglF3X9L57qoKx51oFrHSZsg7ObMB7CeWlUNGSZBq0I6Y+SpStjy/XJnB4IzLRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xsnpQzE+; arc=fail smtp.client-ip=40.107.159.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDCyLIWibVQ9lSTQVjVL6/l6E9gpk/Cn+Sz+Sg/Nhvcy2wv/56IVGc8jNX+yTdbqFUpB2WQ7MQv3E4ST98E4pVNMiKMR2e7DyYsurtyrtgwdI6WyAX4TGIFJoypuYqYUAiCclTjGrR5FHrsGQf9/Ruu/HMCESWRPJDVpd7R8pkLn5Pw3WFAxi8F0em3Emr2oiqwlJ1AJH7PrKJgHZCVXJf7G+TpqlOjBVbbWOQrZK+Nqb5MhNmYicJw55nrwGAsbt2JRO/tuVYX748lvFpBIbIdSb17B9Hep25iYsxJk9v9DSs7PstGNS1e9KT7P9J2aQlRl5y42ILrzitIJ+hJ08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DwK61I/GON0A4CZsSBmEn4eZy/NxGufwQpV5amgeh8=;
 b=hgUZKAEGwh93fIkcBuWgqGri8yDixRzEhC4r9DvMWM1bqNF1iD4kWLtKiGW7S/GiIuYmtngZduLMsvhsYHqgJWXJR4PS2b7NosanaaKKRdksfUP/8RPnJerwsxoeeOT0Tet0/rqXAHSA0mLtEKyIBZsGmfVUT0Ny5tdCCyi8Sdbd9cXxSwFxF07F6wIt6ZzCCHitp9KVCaKkvHC5py1B6oiyZU+q7UFjBJ9DgdR/MNiZ/pw3RfKPqt08ZforsxYu+ZEXZKnfVxJuAASyy2Ye7caIGCYx1dhHnnVB/9G4SCFOjK5gTU4nXuEQldms/VAi2RIb3iKptOVbQA8swArvKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DwK61I/GON0A4CZsSBmEn4eZy/NxGufwQpV5amgeh8=;
 b=xsnpQzE+C4WWvdFILo23pgw9aAd6weAYixTOA+8+XFAkMGMSE4t0uuoI9KKVkE36SKYC3fIYiaN4Bm6cSxj83LadH5qQb2yh4qVCYtUAx2LvT8wok/hMibzEj8MEBB6IoCI8OfhX1/DNIFOdAiJsvB3YunKWO8wE9739aU8UvgJJNareUzL5W6MeFYx7IGINNTMEiz1HFSWWe1sjPKJTZ0ZZ/TjmS8zWxxPYsiRQb07OYj+lFDzlTGI1Im+bHcuY/VzWYdf66kBchdD/ynniGMC1oKcW4fMJarn7adYEeCKH+zdLk7mwEI0LOaqUQ6WMF7SenrzOQLqVC3Tw+8WNAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA1PR04MB10443.eurprd04.prod.outlook.com (2603:10a6:102:450::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 08:51:51 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 08:51:51 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 06 May 2026 16:54:00 +0800
Subject: [PATCH v3 1/7] media: synopsys: Fix out-of-bounds check in
 enum_mbus_code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-csi2_imx95-v3-1-953b6e1a80dd@oss.nxp.com>
References: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
In-Reply-To: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778057665; l=1062;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=5AbqFI1KcR29CpkfsN2mQT+0KkCA3hbqAFvX4GNnHAs=;
 b=MEe1VP8F6tuY3IsuFj7YgZ+URWt/XcIJ+AFkxj48weGN6A2w0W+yFO/caH8qBtzyB1XrA21WV
 pzpfM2nprNrDrYlM2w+BlNqXaJegzPxf+QVgNnSdtwztWfjoseCssPS
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR04CA0203.apcprd04.prod.outlook.com
 (2603:1096:4:187::22) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA1PR04MB10443:EE_
X-MS-Office365-Filtering-Correlation-Id: 76975aab-7bc9-448c-c19b-08deab4cb6e7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|376014|7416014|18002099003|56012099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 Y+W9siwZsTA/Y9sQ7FOKnlBjyF2W1ZcAjVdPGhMRGOJz11wt3z8UGFRHssnz4Gp6JUyyJQmw7EIMloH6foyZf2EWPYM7WbkT6v5ilW1DEu1Buflr/InB/wTjR/1Qo7aWr1HDKC74divTmammvdDlru9w9RX7JVo9LfyFbtz88TpXwhsn0akI5b93l7ClhusSWusoUkHHqLtCwy51hohPb+BzV1y4MFfwPtXE5ILguvVXPpAHxXW18zFVjrFfQF3JNxILyEgIBCKc+vinF8g1wUbxubf3Kslf6R53gQNqtF3ElijpV1NLloVrwpQ8lfSJ6u/QiGB9PfPHyWg/ZVION5cRqCDW+nzeT019X26N34IhBgTSJS+fhEMfTxFXZHl/TguU2MSOmWgMWSm/k6I9q1pV+WhHt2AN19lqcF/d25gCv7Yn+TQVZf7Fdg52u5SZDeq0LI+bZNHlBAzf3sj/OM2CeC1XkzOMc1UD8ob1s832RissdJPBCMay8+aeoDga0FFjaTZZXJ1/qJNY605SiCQTdipo5sPpIX9OcesLsrrWHhyxUWfHWSGdVsJhVev1E4Zy5RFntNYdfBIv8qWwBp1prKVNS/n7Nm8g1A5+sYtJJdJcXaauOzg8U7JRh4rjJ97GO2R5GuJirFNeN64bqWaO4ayoXyHd0HLh9cXyg/3XIFCfDbowmkRU461kOY19Va7i9WeuCnm0dC6qCA2S5vUKizEKIT4DIWXbXBnd1mcKZQVW8VULy922xTJflgu0VeJF706IX7QxUkhvYExpnA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(376014)(7416014)(18002099003)(56012099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eDJIejNxUDhhdGtmOFhnU1M1alI2TmRyYjFQaWkvRStIOWUvVmJ2NzFaUnl4?=
 =?utf-8?B?M0h0MElVNEtqd0dNMFhLZnM4NXV3cEhEYTJZZzZMYU1EK0xIZ3pEd3J5cGJs?=
 =?utf-8?B?dEpPMndHTDFxKzRyRHBWeEVrbUdWaERQdTdrYUppVVVma245TWpXdnVGeGtp?=
 =?utf-8?B?K05zTzhUaU1la21PR0hpeFBxV01nY25EMFhjTnJpRGVIRjdubWVSVEtGbGE2?=
 =?utf-8?B?TCtHaVp6MktOTDk0UHc4RFFFT0hrZzlGeTUwN25rcWxHOHVUUGFjZ2FSM1ha?=
 =?utf-8?B?NEdSVDZIL2RMc1ZiS1YrOGN3T2Q3VHRObUpGY1RNWW53YTFxRkQ2aUZXWkFn?=
 =?utf-8?B?aHZwTmpvOW9NUXpBWkFNS3BRdDhSQlo1bktyOSs5RGtBU1Z1Ri80L1luN3dR?=
 =?utf-8?B?NDNLaWFuOG9LN2JCVVRKK0pNaUJnRmlxY3V1MzJBN0w5UFZxLzdZRGVtYjA3?=
 =?utf-8?B?WlJ5Rk44QXRCcXRJMmV0aVNCYnBybjh1ODg1Z3hoNzZqRHZWSFBKckdTSnVn?=
 =?utf-8?B?ajlXaldheGNyMGVLOFUzUVBWZGsrVXdYQ01kOC9xaDI3U2R5cktTSUx3NVFp?=
 =?utf-8?B?MDd6OHEzbk96dTNxSDJnM3V4bUs1alozWVh3NXZ5NlRFOWlmNGgycEw2L2N1?=
 =?utf-8?B?RW9nWDBpY0RLY1BHWWV3VDhtSG5XdWJhT1Q2TEJjNkltR1BQRFlmRXY3RHYx?=
 =?utf-8?B?WmJTM280SlhiTkl0NUtOY3hsNS94RCtWZ3VaT2dPYzFHbEkvbzJkTWFMVlRV?=
 =?utf-8?B?WVNoYkt6REtOZ0V0MXl3NnZhM05mYUgrd0ZqL0lVaDczMk5UOGxhNi8zUWQ5?=
 =?utf-8?B?a0ptRjEvZ2tCcCswZFJidlpvVlUraThKbTE3bitSMEZLWGlzS0hSMWl6RXRG?=
 =?utf-8?B?RGxZdVRMSkFINnNsWnl6dVVja0JMdDNCMkRpczBwM0Q4WHlXNGRzQXg3ZjJh?=
 =?utf-8?B?MWVyUzY3Y2tmOG9pU0ZZaHpoK0VQMTVWMlNHSDk2YVIxSmpjSS9YR2ZZbDZQ?=
 =?utf-8?B?TmNxSTFMUkVjUEpYV1NJejAyalFyZ2tyK2ZxbGRxWkt5Tk5IdHdKOVFSdkR5?=
 =?utf-8?B?V2tvNzNVcmJIYkFORlFEUTRRZXV0V1kzY0VweU15MExvMzFQbXJpSmtYTVVD?=
 =?utf-8?B?Z3h0bnBLY2cvaGNvSmpPam5IbS8rSTllR2MycXhmMDk2N3YvSlZMd2JhcGt3?=
 =?utf-8?B?RWFWYzhkZjlSN3BYYVBkK3ZVNFU2NUpGQlpEd3o4aWswQWZObjFvNW0rcmNY?=
 =?utf-8?B?Mml4UmJHZ0VxZUptUjczb1hUdUNWbHNmSEd3RERxeU15aTlyamZ6MERRUFVK?=
 =?utf-8?B?d2d1VCtUSENOSkxWajBYYlNQaXRMaXIrV3BNT0d0VTJRM2MxbTRWbk54K09a?=
 =?utf-8?B?bHBwUDJaV0d2QWNJb0xBS29LazU0QzM3UU1IRjc4cHRFMXk5azJlSGI3NUti?=
 =?utf-8?B?RzF3d1dEbnNNditENTJ3Zjc5UTFYaTkzdHR5NVZScHkvL3ByalQ5L1JLLzVu?=
 =?utf-8?B?QkV1MTFqTFRDNGMrVkw4UEp2S21VZURweW9JNnozM0x5eDdTSnRZcWdJN1M4?=
 =?utf-8?B?YldPZ3hxM0ZvYnNQajJLZk9oZ3Q4WTV2WThEZWpTZlFEYkNjbDU0UG9tVnJr?=
 =?utf-8?B?ZXpGbkxjME1xbjBHZnhVSUMxVXN3QUhhalBUSmxrSjA0REF3a2NzWTlKOVJv?=
 =?utf-8?B?M0JPcWFxckZzSmdSdk5UNk1TVDQzVVBWK2RXdnhGUzEvRGdpTlk1RG9uSGdC?=
 =?utf-8?B?bm0zS1p6NU4zRnVlRlE3SFJ3MTZZS01PdUovTEM4NUtSQjQrOW53ckxISTRP?=
 =?utf-8?B?VEVGQ3Y0eDZkQVd1MVA4V2VNNitpb0kybXc0Y0k0ZCsyMFJrcnNVb083TTdj?=
 =?utf-8?B?SkpaZ0JRSlRTazJDVUpBV0ZLendVVm9zT0hFc1dNODFqWjNaN0dUQUtHVXBx?=
 =?utf-8?B?c3hrQi9nNDIwNCsvaTVxeThNb1N2bUN2a09YaVdMK1RidTZpMUdCeW9YZ2N3?=
 =?utf-8?B?UXNyendqQmF6V0trQ05pbEVzWk9kblptbjAxS2YzTHpOR0hrYVNDTTRrc0Yx?=
 =?utf-8?B?TkwyVXJ0YVUvZ0IwMHJSRkg0K1Ezb0FkclRsYkNCYjlDSzFSdzNRVVlkWHVy?=
 =?utf-8?B?SUNHWXNxM2ZtK3AyNW5GU0psWldvNWxlcnpxVU9uaHZML3pFMjVZaFA2eFZa?=
 =?utf-8?B?VXFnYm9mUGhCYXBJZXdFcDl4ZU1XaW5tTVluaEFwTUdxN2ZaV1UzaUpLcGdh?=
 =?utf-8?B?RGMzVk1rd2tmRzB0S012TjFWK2pBcjNkUEt0azFjdnlpY3JiUmxYSzNwQlBo?=
 =?utf-8?B?NGNWbEd5bE1XM2NuYjFaNk9JY0NNNDFVSk9YVExuMUV1S1g4UitFQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76975aab-7bc9-448c-c19b-08deab4cb6e7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:51:50.9412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+SmpKUqTwGtH7fLRMLtrW8mK+7jzApUmWALg+j1y+4CU1Jk3N23S1MIplbcLuDToGK42mQi6T0ClREYC60piQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10443
X-Rspamd-Queue-Id: 1B9154D8229
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60546-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

dw_mipi_csi2rx_enum_mbus_code() contains an off-by-one error in the
bounds check for code->index, allowing an access past the end of the
formats array.

Fixes: 355a11004066 ("media: synopsys: add driver for the designware mipi csi-2 receiver")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- New added in v2
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index ce17f986279e..02eb4a6cafad 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -430,7 +430,7 @@ dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
 
 		return 0;
 	case DW_MIPI_CSI2RX_PAD_SINK:
-		if (code->index > csi2->formats_num)
+		if (code->index >= csi2->formats_num)
 			return -EINVAL;
 
 		code->code = csi2->formats[code->index].code;

-- 
2.34.1


