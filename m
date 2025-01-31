Return-Path: <linux-media+bounces-25502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A84A3A244BE
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 22:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EBB3188416D
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 21:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F501F4E5D;
	Fri, 31 Jan 2025 21:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HP+uanGl"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011007.outbound.protection.outlook.com [52.101.70.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39361F4E4C;
	Fri, 31 Jan 2025 21:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359269; cv=fail; b=u2KyJWjPLzX9s9OtptT33YWqIlSUHWnEenRrVpTv6kNhK8z5EE/h4hBeqE137Ne6Uhd66OivnQs0TJEfN8qNhof3oy+PzMvWrWLS4vz+Xmc7WGBS/CgMTBEIk2lz4MOyn6kPWL+0b2iq0CAbpkH6HpTXiCHqls/UfPiOwT/RxKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359269; c=relaxed/simple;
	bh=noz4pIlNf1mez14RLgu5rJEysQlETRbqvH4Qt0s7Has=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nzpTFvkI1yD3nKJIzYHr1zmB7n4MvGJMKenX9n4yH9bVxcwszPjKCPGr2uON8rnJw9dSxGpuC8YmtB06mM7sSyU1shrNibhumT+yKyWR9c6ojUXPg2DgDrrV/IgOaw6/G0TNZN89hoP8IXo/bIA09mAd3PEtODkgwL289aWIoew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HP+uanGl; arc=fail smtp.client-ip=52.101.70.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcqID03unl45d2vINEQnOyBQvcZ8FE7flOBfyRgZhLmebexe+B4fa00cOY96tbVas5wFeHYPoFwBXGWi69HVzmrU1KeFHSk/gsYhE3j7yEAxRXdPo2JonSZbIHBSwyPFtu2HDwto6sRKR1ylIiH/JLtyQgn9C7SL76UfyD/HYaKm/+l6PN+9hTtZVz4FGEKh6z8gqk58lDD8NEn5GXfY3JqIWbXbMILlTOtE61TYSOCFrWleu08BqrIu0TQu9ZGh2RoeGIa3mI7bIUAcFKZaspmU1KSS/nypBgFzYJRt2UekeYF186wrAF0jKJei+2rqtclNNL7eKwKH3AarqjLaAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGklPLs4ngtTFBU3SRLFmS2+Ps/QfmN7nqU5P72CeQM=;
 b=LZLWjOlD0HIljam317cqthv2LqWDzQIK3oJAGyW4SkyP35kkWaWhjhP2nHhiKXJUvkmXFV9XWAZJ+CtLq7B5scPItxdWoLxRHPQlYBSAuhbFzu6+P/gOu+CKzlDuQp5Hbu8/fmYoixnwq0i/7VqIM4yu2qx4yz0JrGC/UbCGByXYzCimMVb9puLI31vXHLcMPdGorIc0c4b4K6FliIYYnzCGC5KIKYSs1alHL4T5rSEZouqNqwf6MG4QJbLUtfTWn17QaHO5Gp8yvhTg2lvumwwIfOtVRt8ewf9v/Er51BeMTWQU3cK2ZkiFixVZB7mtk/LpYJwmGjYfgoI23Ha13g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGklPLs4ngtTFBU3SRLFmS2+Ps/QfmN7nqU5P72CeQM=;
 b=HP+uanGlxu0lqVHKmu7DUsjw4jHB4VW9k1EYJouz/ksgmhrfxBbWFS7bO1iFZTc0cyH6vrV8eFjffuDGTcPXf9qyjjRNUqA1hpAwprLNokXyyh1s4v5XGKMCZGPb1m+WYdpyM4q43ZpOLi0H0Jd2qTt5+LaKbLsYzkFxRiV3QCl4UszNG8/SC1sf2pkM+kRPhvSw/KJlzcUc3gIm4AZ9vyoPZpcLcCdfY/7k5qS2+9MYe7iLd6VSa0gEQWdd7sfHD4RQpna3gxOBTVjKtO2QFbvAseJozysg/1lzN9ukW2oyprNO+7ygP8BHHk8HvELKCUGXtvGU6ZowEQ/1SK7gkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10980.eurprd04.prod.outlook.com (2603:10a6:800:274::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Fri, 31 Jan
 2025 21:34:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 21:34:23 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 31 Jan 2025 16:33:49 -0500
Subject: [PATCH 04/14] reset: imx: Add SCU reset driver for i.MX8QXP and
 i.MX8QM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-8qxp_camera-v1-4-319402ab606a@nxp.com>
References: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
In-Reply-To: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738359234; l=4573;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=noz4pIlNf1mez14RLgu5rJEysQlETRbqvH4Qt0s7Has=;
 b=fpFhJrRGhJWtTPKyj4D6mSi5BlMnEJa1oviePOTVUb3oWXz4NHXTRDZLGBZfFrfvQ8u5ptN/N
 QlaoGtEpk2XCBxbT8SSj21ePcB0ymQHdzaFeiK3/WRhGPObSyBRApp5
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10980:EE_
X-MS-Office365-Filtering-Correlation-Id: 626718d9-a3d6-46ef-4577-08dd423f0792
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MjNEQm4wek1WVXNBd3BLVElrRFpIc1lCaENZV3FPWElFTGxuUncrM1pLTUxQ?=
 =?utf-8?B?TlJUWmR0YW1KT3pRQVdzNk4rcGNaQm1jTURMaXlmYXVrMHFTYjVVaTN1QW5D?=
 =?utf-8?B?SGdiT0NWTkpwMXd2a3ZWM09EYjZLR0Y2bE52RDRjaHZmakFHc0hKRmJCOGhM?=
 =?utf-8?B?Uk1STkVsR25lY1FIUU1FYVNCQlFMQklUbkhXODNLaFZpWkJ2Q0pacDRxaEUy?=
 =?utf-8?B?L2ZuSHBtN1dpVUF3NGc5MWVVYjlEUVVncjIwbmNQTFlJWVI0M1g2anoxZk9S?=
 =?utf-8?B?YjBDWTUxZHlsUXhQT0JFUWNzZW5XUVdoR2NaUEwyU25lTlRYV3M4YTk3RmVG?=
 =?utf-8?B?WjB5TnNZcjE5QThvT2hBcW9heXYyeUF4RWJ1M0w1QldRQUVRdk9TUjRuQkpE?=
 =?utf-8?B?Y2VTTnF1WVNVWHpxQzQ1RFBrM1NCTlY2Z3p4a09SZVNmbDNGeVh4WTdxNVoz?=
 =?utf-8?B?RE9xd2lKd3N0NXlxWHV0MFlhcGRIMlZ3dnRKVUtQT3lybFU4ZFZUQ2tmU2FM?=
 =?utf-8?B?cTYxZnhqOHg5cW1HS2JSTWtMeGQ5NlhGQ2VQdEMvRUhkUGVBZkdhUldvM2Qv?=
 =?utf-8?B?VlYvQ2p5L1RESDIrTjRmYkJYZVlaVlA3ZjFWWmhBYVJDbjRsYm9JeFN0VThy?=
 =?utf-8?B?ZjNqSmU3UWdBNUlaQzZnTzQrVnRmdFVHbHJKa1hKWDZTOG1VcjdzSVJYS1M0?=
 =?utf-8?B?a1IxOXIyb3ExTmxxS1JtQWVOR25mTEJnbVhEOHo5dG0rOHZIWXR5Ti84ZjFY?=
 =?utf-8?B?dTc2QWtGRkxMaU9hNmlQZSs2U2RvUEdlU3c4ZnZQTHNzdUhIL3k3MDhWUlE4?=
 =?utf-8?B?S0VaRDI1MkdMdUJXSHE1enJxSmJ0MWRTd1JZYktlZVhsVWFWVDcvb3VHUWp4?=
 =?utf-8?B?VWg2bnF0Q3drVU9zVWV1aXljWXZqQzA4akF2WnhZVzlxVDNGWWFkcDJGRlda?=
 =?utf-8?B?Z0twcm02dnpmRDVHMHhqUldzc0FLQTY5bnFUS0pSWGVheTRaWDFZcTFHOVdW?=
 =?utf-8?B?a0ZrSFdGNHJqYmVydGsrYUl2K05mZHdFM0xyZ3RwbWM1RzVvaTZpVWNBbnpW?=
 =?utf-8?B?MzRGemRMZ25PSTIxUjU4eHFSYTBzNXl2M256U2hvMnB4TlFxeTNzdVU1cHh1?=
 =?utf-8?B?bmdNYUxaOU1iRXRCZTRwb3dQN0lYM3FQRllNSmQ0TTFHODNjQzhKVXZQMUlR?=
 =?utf-8?B?cEhCMDE1YzJkM2YrbVBqcjhKNElrRG54dFFHOU0yYXNHbS9SdVVScjZCSno4?=
 =?utf-8?B?VzlGMlNaZlpuaDBXVUI2allnaU40eEFudStYUWE0ZDArZzhhMjA1cE9xZVcx?=
 =?utf-8?B?NU5JZlN5TkdlZXlQUldacDYzTnJQTlkwN244cXVtaWovZGMrcHNoN1AwamV6?=
 =?utf-8?B?bURHWnJ2WFBZVUhPMFZYQjBYREY4clZGaWp5dWFCTFIrd2xYVHpWZUJVRk9o?=
 =?utf-8?B?U2ZIRUJpbko3ckZ4TkZNRExYRkFKbHErUWk2K3JNRXQ4RE1yMEYwQlE3Zytl?=
 =?utf-8?B?NnRBR1d1WnovaDNVMWZaWm5BWWpmZWFQT05GWE9HZ3pXbys3dmh5V2RWanN2?=
 =?utf-8?B?cXI4bDFJSlY1eWlpUEsrRHpiRDc2WW9DMFJ2K2N4bUM0R2tmMEFpcWxRZDc5?=
 =?utf-8?B?aEdNaHltVytNbzFaaHdvQ1E1SEdEREw3cnF1TlkwSit3SkJzYm12MXB1c1Ji?=
 =?utf-8?B?ZE9oVGl0Qnk4RTR5aDdkbk1EbC9OZzdXYnRLNlhGSDJYTjl5Rk1NS0hXOEZK?=
 =?utf-8?B?OEZGTlZPUkgxcDE2SVhsZG5tdzM1WkxaSzI4dktPZWtVTlprMFFXL0ZhaGQw?=
 =?utf-8?B?c3FQQXo2WU16TWlqUWtsY1pVLzFNTDZTTXVKVE9qWVpwcDFIcnJ3RWxmNU9B?=
 =?utf-8?B?TTBhblBTODVrVVFDV3l4Y0dFUERDN0VSTTB5VHcyT0huTXdneWFZc1NOTEQ2?=
 =?utf-8?B?UXM0K0NzVkJyajh5UG9HUEducEZFMHozK2VJV2FKMUZqSzFPaTFUcytKdEJL?=
 =?utf-8?B?M0tTUGJYOWtRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OTJlN1lSaEJ5RjUwMzhoc2RlM2dvUlArTDNXOXhtbUs0ZDZXd0lrallHTGdW?=
 =?utf-8?B?WiswdmIxUUZ3WFFHeHJZL1pUKzViL1BLcnZyRGVmdnFoT2lrT1hvUnh3bytO?=
 =?utf-8?B?cDMyWnBZNE1NK3NMbHprWDRaaHBtR2VQSCtBMEFDRlJDcUJhOHFZNEQvNVUz?=
 =?utf-8?B?Z3kyejAvbExJN2ZicDZ5Q1hHeXVjRGhyNXhyOGZpMG02VklIZkdlMisyL3JM?=
 =?utf-8?B?cHZJYkRCcmczcG9QR09BS3NBLytvWFhDUXhPU01EM3g2Q21kTGRTc0FFRTBF?=
 =?utf-8?B?MlRJeUhuVmRPNDVxYXB6OHRwQ3FDUXVRaUdrWExUTTBEdCtBci9yUTh4YS84?=
 =?utf-8?B?dTNDbUprVTNKSmE2WUNzcDRvYmlyb1JCWVpzN1B4Q1d6RHQycWgvRDhPNUJx?=
 =?utf-8?B?alVyNmxubHovSnBmeWlqK2pVR1lBRzArSHY1ZWpsZEhLNFZsUHRlVGFvem1x?=
 =?utf-8?B?cnNoTDl0MG1pM29rUTNHY2tzTlpJazQrWitCcTBLRkplUTlTUFk3d2RHU0kr?=
 =?utf-8?B?Vkh3RVJPM05TckJ1VVBkU1BkeWlGNnRZWm1FSWJtNjFZVGdlOUhpRVdOcUlH?=
 =?utf-8?B?dktQUlE2bDJkcGVTSHljeGZzcDIxc05LYm1IYmY1bUpHaEpwL1h2TjdDTHlP?=
 =?utf-8?B?eHFqU21ITjdVRkpuTE9rU3dHenRhMGYzVy9UYmVHaDlCSkNZa3lJOU5ranpU?=
 =?utf-8?B?UnA2NzlmZVUrN0Fnay9XQUxRelVPQng4YmRhQlY4MWlVTEpBaEFRbFZDbnFu?=
 =?utf-8?B?cTh4N0FDL2J2N3c3SHAwQ3ZiVTJaMFJ0NVFyRHpBSWF3ejN4V0xla2JOUjRO?=
 =?utf-8?B?eTU3dU9nTUhveERTNFcxazFHcGRUbklscmFOTjIyajUyOUNwQkEwNEUwVysz?=
 =?utf-8?B?Y0toa3k0djUzNXdaVTRERi9xMFlhR0MwcUZ4RmhmK0t3cjFZb05mUmE1VHUr?=
 =?utf-8?B?QXNzWE1IaU5zdzhUSEN4d0pBaU04QmVHUmduSjExbzFMZ0wwVGlZblVVVWkr?=
 =?utf-8?B?MEtzRHJsbEpFRWp5R3hXbXNpeloyOVB5R01WVS85NWNDYnJoZGw5dXYvTDVa?=
 =?utf-8?B?WWZwQUlYemduQXNMeDhHZUNOazIxbmRsdCtucnhzTzJldmlLSURXbUhpdUM4?=
 =?utf-8?B?eEtDR2FZbFc2TWJNY3NKQUtHOWM0Rm04Um95aXZ1Wlo1RjkzdThtWVFhV0gz?=
 =?utf-8?B?cFBNWU9ncWVkRWVLcy9XN0R6R2gyalI0eW56alorTzQ5UFJCenhPMmZHR3BF?=
 =?utf-8?B?a3ZHM1I5Qzk2YnpKb2ZKN0hZbHZhUlJpRXczZHY4M3hIQUQybVVoVVIxUWEr?=
 =?utf-8?B?dkY1Q1JVTGdkTXNSVE9xQnJCdUQyZHM4R3ZpeE1FdThaaGlSQTNyRHIxNksw?=
 =?utf-8?B?SStoNnZUcERPZnJvaGhUMmVCcFAvY3RUZURaby8rZ0xQK0hPNEFJR01ubkR2?=
 =?utf-8?B?QWdLNjIwalgxN1krVFlDbmJNUmVaaXBOczR6S05PWTkzdENEaGM0M2xxV2Rq?=
 =?utf-8?B?eUNKNWRuQWdrbjdIMU9EUE9pd3FwUkxRWUFWTVcrQk1zWEpSL0RUNGFDSDlp?=
 =?utf-8?B?Vm5YVUkrMUkwVGJOVm5SSjB3U3poVkxNY1p1YXNjUHRPcmR2bkNlaGlSVlli?=
 =?utf-8?B?blpBOWdqeWlMQnVZMllNMDJaMUxSNm1TTHlyQlVOaCtaWHJaUEhIMlI1aGti?=
 =?utf-8?B?eWc2eVJ3c1A2UVBWb0kyVGJnZ2RnbDJKcmkwMXpRNE5SY1V2NW50cDMwajRy?=
 =?utf-8?B?cGxhdnpxU3RrWklieTg5M3NBNFowRFkzQ0Q2cGE4ZDBUZlhnZWRuVWZ5WWty?=
 =?utf-8?B?WUNMWHpvdDh5R0pEWnVOZHk2YS9xbnRoengvT1ZHb1JUeWF2NmlHYXdmZzdM?=
 =?utf-8?B?anpPWit3RFRrcGxPT1NBakdQUG10Zkl4V2Qrdktzd3Z6dTBlTU90bGJFYU1t?=
 =?utf-8?B?Y1dpb0RTeXBkTUx3NW5QbWxucXpIYTNSS3luUEQ1dGcrd2kxS3BtVjZ2K3hq?=
 =?utf-8?B?V1BrZkh1SjdmNlE3cXZYbDJjZlkwMGo2TlpBK1gzaVVGb0dQMGNSeEJ3anV6?=
 =?utf-8?B?T3dObzZqd3VtZWd1M1BJaW9FN1lBYlZURjlOYTdpaTRPZnF0bjM4ejZINE1x?=
 =?utf-8?Q?QgbY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 626718d9-a3d6-46ef-4577-08dd423f0792
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:34:23.4927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4reuE85Nyp5HvJ61hHGoIgjXuCCnon51uwcAnEF16rFPaw6qtIWrkAjTPxqHPp/QOPVRWFXG+0zzfyM9M+RFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10980

Add System Controller Firmware(SCU) reset driver for i.MX8QM and i.MX8QXP.
SCU Manage resets for peripherals such as MIPI CSI. Currently, support two
reset sources: IMX_SC_R_CSI_0 and IMX_SC_R_CSI_1.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/reset/Kconfig         |   7 +++
 drivers/reset/Makefile        |   1 +
 drivers/reset/reset-imx-scu.c | 101 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 109 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 5b3abb6db2489..99f6f9784e686 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -96,6 +96,13 @@ config RESET_HSDK
 	help
 	  This enables the reset controller driver for HSDK board.
 
+config RESET_IMX_SCU
+	tristate "i.MX8Q Reset Driver"
+	depends on IMX_SCU && HAVE_ARM_SMCCC
+	depends on (ARM64 && ARCH_MXC) || COMPILE_TEST
+	help
+          This enables the reset controller driver for i.MX8QM/i.MX8QXP
+
 config RESET_IMX7
 	tristate "i.MX7/8 Reset Driver"
 	depends on HAS_IOMEM
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 677c4d1e26320..31f9904d13f9c 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
 obj-$(CONFIG_RESET_EYEQ) += reset-eyeq.o
 obj-$(CONFIG_RESET_GPIO) += reset-gpio.o
 obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
+obj-$(CONFIG_RESET_IMX_SCU) += reset-imx-scu.o
 obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
 obj-$(CONFIG_RESET_IMX8MP_AUDIOMIX) += reset-imx8mp-audiomix.o
 obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
diff --git a/drivers/reset/reset-imx-scu.c b/drivers/reset/reset-imx-scu.c
new file mode 100644
index 0000000000000..d3074eaad4c99
--- /dev/null
+++ b/drivers/reset/reset-imx-scu.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ * Frank Li <Frank.Li@nxp.com>
+ */
+#include <linux/firmware/imx/svc/misc.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+struct imx_scu_reset {
+	struct reset_controller_dev rc;
+	struct imx_sc_ipc *ipc_handle;
+};
+
+static struct imx_scu_reset *to_imx_scu(struct reset_controller_dev *rc)
+{
+	return container_of(rc, struct imx_scu_reset, rc);
+}
+
+struct imx_scu_id_map {
+	u32 resource_id;
+	u32 command_id;
+};
+
+static const struct imx_scu_id_map imx_scu_id_map[] = {
+	{ IMX_SC_R_CSI_0, IMX_SC_C_MIPI_RESET },
+	{ IMX_SC_R_CSI_1, IMX_SC_C_MIPI_RESET },
+};
+
+static int imx_scu_reset_assert(struct reset_controller_dev *rc, unsigned long id)
+{
+	struct imx_scu_reset *priv = to_imx_scu(rc);
+
+	return imx_sc_misc_set_control(priv->ipc_handle, imx_scu_id_map[id].resource_id,
+				       imx_scu_id_map[id].command_id, true);
+}
+
+static const struct reset_control_ops imx_scu_reset_ops = {
+	.assert = imx_scu_reset_assert,
+};
+
+static int imx_scu_xlate(struct reset_controller_dev *rc, const struct of_phandle_args *reset_spec)
+{
+	int i;
+
+	for (i = 0; i < rc->nr_resets; i++)
+		if (reset_spec->args[0] == imx_scu_id_map[i].resource_id)
+			return i;
+
+	return -EINVAL;
+}
+
+static int imx_scu_reset_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct imx_scu_reset *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, &priv->rc);
+
+	ret = imx_scu_get_handle(&priv->ipc_handle);
+	if (ret)
+		return dev_err_probe(dev, ret, "sc_misc_MIPI get ipc handle failed!\n");
+
+	priv->rc.ops = &imx_scu_reset_ops;
+	priv->rc.owner = THIS_MODULE;
+	priv->rc.of_node = dev->of_node;
+	priv->rc.of_reset_n_cells = 1;
+	priv->rc.of_xlate = imx_scu_xlate;
+	priv->rc.nr_resets = ARRAY_SIZE(imx_scu_id_map);
+
+	return devm_reset_controller_register(dev, &priv->rc);
+}
+
+static const struct of_device_id imx_scu_reset_ids[] = {
+	{ .compatible = "fsl,imx-scu-reset", },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, imx_scu_reset_ids);
+
+static struct platform_driver imx_scu_reset_driver = {
+	.probe          = imx_scu_reset_probe,
+	.driver = {
+		.name = "scu-reset",
+		.of_match_table = imx_scu_reset_ids,
+	},
+};
+module_platform_driver(imx_scu_reset_driver);
+
+MODULE_AUTHOR("Frank Li <Frank.Li@nxp.com>");
+MODULE_DESCRIPTION("i.MX scu reset driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


