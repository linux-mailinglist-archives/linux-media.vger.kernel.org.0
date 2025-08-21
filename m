Return-Path: <linux-media+bounces-40676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E51B305F0
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 183F3AE6CBA
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D973629A1;
	Thu, 21 Aug 2025 20:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LPw9cJwc"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013038.outbound.protection.outlook.com [40.107.159.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF0036299E;
	Thu, 21 Aug 2025 20:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807493; cv=fail; b=XSE7KjVU50++An3DlDPXjPPAc2lKHEs+znIKQkN+VaSROfTnmWXMIObn6y2IlDxtyLJSXcWBUDA2FwfO4voeW/66oBlIfqBU2Q1zT72mIInCXXfQnrjiikRJ+weFV9qXCl5Glx9yUW07AIAue25QRvovaousnnYsDIruaU+7Su8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807493; c=relaxed/simple;
	bh=2JAIHEFQrhd+21GtT7n9tRcQtHZ9YpnHDYFZxXwVZAc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Bt1FltIXSt+zDqQ0HM5mfrCi0Wb14n0dW+f40yVP5bEfrhYrppGeaLwu3UgamBScSBtuozT4V4o6CGFj4GUtdFyHj68F58+IvjT0eF3pc/1VBvfr322fzX4Eep+dh4F1dX0A2KToN96fStGpcqiy6ifNOs2ZXneku40Ec7J3ubk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LPw9cJwc; arc=fail smtp.client-ip=40.107.159.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnkGb581cNuvcYnnc+CIUQzc4pG842Fn/XIJjdtLbKfEV4n0YTAbEcCZ5qeNiQj078b0beO2CamaixZ7fzvc33WZ3x6q5TYZDvDTpIO3+nz/sX3+nPZ7F9TSesZa8rbNE0ByPhfBztkYT/Je63Jw0CJHzTx+NomsHzIBAkWzLyomJlv8XxgZ/PlHB69oxGJF+YNgqbdHwT4yQ9+vGmrSC35aQ21gQMeKOpPyPUHRblDizbyFIce+gHGW6SMO674/ZFn/hLZn/3xJIpJSQ35ujJo6SGBzkPNKinhT6RkpPZbWQjump4ykRDWH7c+/oFg3ptKkIeO2ZLTih+tpe1HaFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0PYI+idMCHYg37nxV/zzR03ZfHCPNM+JrWWe6uPtTc=;
 b=VfXUvLnPLIZJUn5tLn50GZsQha8xwSsDrTKBBCXyAdxldAITeBQG7dvaPgiYStuKgBskmaYjrvNk2BnsWra/VRU+oIqadmHAtQn946T1Z3OG3CyDkkNUbQ7KDzsgTuX3My6kxgZ8VEours9pPIym1nXUQKcWyJmF8VBidKmE0L5bpO6bjq7sfT+GoJL5ge9s0GQLAH3jZh6WGjqRkMHq7Z5/nw1e9zADxEW57ULZ6lCAlFzG0VPPK1hVJ+DlwNirMCm4nPYUaiG20adRPWRAzwY4ULM0xM0sM52NPvaGoXfrAh9P1x7n+6+nVkvTpa/VPicXjeGoWMCzNVmhdWIE3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0PYI+idMCHYg37nxV/zzR03ZfHCPNM+JrWWe6uPtTc=;
 b=LPw9cJwcJ+f7tnrI9yzSKJFji/Y+GAyl086f6LyxIEHFc9oxxV0wJPJs9VOwjWrBqtk0jJGZX8sPBVfcWWXV2ZGlhFQjHDTRNZl6sFN9ys26H059x3dqlZz5PK2KTpscsckSMsbL1HtCQtG2wxdW4QSSO85TwXY6/N1oJdl/Ex07bk8t3PJUz8mxnuhJMkc1PWkuP8G3gj/1QN9+nUkDDTotarPskPlqPuGd+3bXBFMYaZaoITW5LGqueuH2pJlMAtU6XF9W+7rmxIjt9WMMFc4aNleNPNG3HZmHp5BbC+Ix8UgOAPNds1YKTe2d8f9gaEBuwo4SYpCJnqfOyHQ2vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 20:18:08 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:18:08 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:54 -0400
Subject: [PATCH v3 19/31] media: synopsys: csi2: Add phy interface support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-19-c9286fbb34b9@nxp.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807362; l=5413;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=2JAIHEFQrhd+21GtT7n9tRcQtHZ9YpnHDYFZxXwVZAc=;
 b=czBQLnYLkn1pQIq+paXOPm48Ugr77D6bDcdlzjfJpLI/yWzThp8PZPydVayqeNKucJcJ8Vst0
 mK16YSWmM+kCPT+uRMRSJ5RV2tDmcKWRSUxrArdsvtkkF2xTcdQAs9b
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ecd1766-8612-4b04-d685-08dde0efd7cf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Zmt6Q2JaS2JvYjhFRWxXK1IwZm1VZXp6L0JQbFNaSWtKT3hlbmRwM0hhcDc4?=
 =?utf-8?B?QUkzZmx1RnlPeUJRL1JEa1JDWVgrUWhoVjFqaStzZ1I1THVYeHVzOFFSM29H?=
 =?utf-8?B?bW1oM0pHR3k4WUVkN0p3SXlSazRTeExTQ1dSalN4eUppV0FGbXNaVUs5VDQx?=
 =?utf-8?B?dzhrZGlUdVJmZzlmWXZjWEhNQXV6NVFuL0ZKQmM3UVlEVHU4UTF3NEpzSEhD?=
 =?utf-8?B?SjBTbTdxRzk3aEZ6b0V3NWxreGdpcGhzQTMveTRlYitBTkZsWktxSkhjenU1?=
 =?utf-8?B?RUUwdFphUU9reHgxQVRkQTB3VmxERkE4OUY3U2VXZ2pxbDZ1MlFkdi9YMUpn?=
 =?utf-8?B?OTEzWE9pMGR6SHRNSG1SSEFsWWF6QTZrQ2NhSXdDZFpNQmsxczhFN2p5V3Nu?=
 =?utf-8?B?UUFhZ3ZUcDVpbVErMnl2V1NYSjRjSkN0L285aUdVbCtHdXEvRXlmN0tuc2pV?=
 =?utf-8?B?OGhRWWV2bGNlVTNYOFhkRjJrZDNWWXh6Si8rNmN1enU2c1cyRXo0QjdZK1Zy?=
 =?utf-8?B?TE5rVHJCYjhlbml1L1lCSGJmVGlEc3psTkxuM3N4RkpWQTlWNlBwQ2tnTDU5?=
 =?utf-8?B?NUlXb1hzTzNhdUFTc0VIMXFkSWovQjVhaWNOK2VYRVRUYjZ4MGU3T1lGbWV6?=
 =?utf-8?B?ZXI2SjFwc3dPem9CVkVHUmpNODBuYlh2VWtzM3QyOWRyUldMNXYvcnFnWE8r?=
 =?utf-8?B?djI5cHU3MzdIeVJJdmNWdWFOV0lKU3I1bWlvRDZacEV1ZVplb1Y1cWVSclJj?=
 =?utf-8?B?ZUlwV0JpdVE1Uks4RDVFaWg2YUZEdWVGYlB2Rk1uejQwRE5FdlV4eVhOV080?=
 =?utf-8?B?R2gxa3g4OE43N0MvL1M3Qlh6VFRhRWJUYy90Q0JKYktrU2V1ZW1TUDE1YTk0?=
 =?utf-8?B?M21CdTBnMys0aWgvV2ZxZWxiYWdlUjBvM2pRNTI5MlNCVkhtUDBCWUl0YlNY?=
 =?utf-8?B?cHhBOCs1Yk53UHM0K05yc0F3bUliZHZ4VnVBa3dwRUtmY21VNUNRWW9vS1FF?=
 =?utf-8?B?VWY1Q0lZeE5zb21OZVdSSjR5SDFJSlpVK3RsWVo2L0R6SjdIcVZRQUVFNTR2?=
 =?utf-8?B?TE9IaVBCSVpraGZiaU45eitsRU9FVldMSTJocGFjWjlPQlZ6VVVQZ3VoN1da?=
 =?utf-8?B?cGJCd2cyQXJpTVVJa0d2bndxWDJzUTU4aXJvTlprSEtOa2o4Q3FxdzVTMGIy?=
 =?utf-8?B?UmowZ09jTW5jaHdCSTM2bVIzVVJDZ2MyWXFpS2pOa1pmck9HaVkwY3ZFSzNx?=
 =?utf-8?B?UGhiV3ZzYy9QbmVKdS9sMlUxbnlDM3hwaUhSWHFRdkJsanBoY3llczdrWS8w?=
 =?utf-8?B?TWVUUXdQNktINzFmWGtod3owM2F4OC8xbnc1Z2tBS0Z3b093R0FrM1FjSEN1?=
 =?utf-8?B?N1VPdElIZm5GSHluTDNiUHhna3FEMVFjU2VVRFIvTEpJVzA0Z3pWemN1R1RG?=
 =?utf-8?B?ZjBLTUJuZk1iVWlRcjd4R0lJdU1YVUFEVVpIRm5INXRzc1FWQ2ZlWDc4VENP?=
 =?utf-8?B?MW8vTCsyWGZWTmNPQ1B3V2xEbmV1M2k2UTV2QWY4UjNoMGhWOTZNbVJ5WUk1?=
 =?utf-8?B?aWI0SVhhcHhVTmxKem5iNFRWa0ZJWUlhSFRqaVF4cVQxcXhIK3REMmlQYXp4?=
 =?utf-8?B?SHMxL0gzSHNJWDhXTW1mYUhidVFwTWlYU3BhK0hqcVFUQ2w1aW1xYzJrR0JD?=
 =?utf-8?B?Vm10WHZMakZGUzNacW13SE95SzAxRklJRHdZUElHb1puVHZHWFZDY1lyVjhT?=
 =?utf-8?B?WkhUbWdFS0pQZ3liankrQ2xMUFhOSUJBSXh0by9ld2ljZ1RBVDNoNTlFZzJp?=
 =?utf-8?B?ZG55WE5vb0RLSVhndkdYb2lsVFJaYm41MTdBOUExa1NLTFEzUk5NY016RURv?=
 =?utf-8?B?TFpIVFNpUllGZlljc2FHTUpCL2lEZmhnNGgvbVdNTzd6cnIzb2lHZFpkUUtv?=
 =?utf-8?B?aml2MjA5dlRhMDloTDEvaGcxTUFocDIxZjRrd3plc3NVSVlBK1JGTG93Kzdq?=
 =?utf-8?Q?T1KGKr7p0UHqN3DEBEYBcsi8g3JKRg=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eFZMOTFVMHVYeXRwSTNxVzBzdDVGdDhKQ1Zxd3o4Slk5VE5YbFdmV3dGKzNj?=
 =?utf-8?B?WkVRekJmSXFhZFJvbzJBaU1WZ1ZLbTN1VGZyamhOTE1iTEJna0I4ajlYVUtE?=
 =?utf-8?B?M3Z5WlI0dUlyelhFUy9sZkNXdm1Xek9qcUlvd24rVy9yTnRpazJqSWNKb0NK?=
 =?utf-8?B?WTBrUFoxM1JvTXpKYUI4NktQb25xQkRZTjFJNVRla0NtTXo0Sk9UaVdjNjll?=
 =?utf-8?B?Zm9ka1F1MTViUVlqcW9YYVhJUVduby9JdHI1OEtQRHB3Mkx6VDJpM2p2TkUy?=
 =?utf-8?B?YUFMaENwOXNFTW5vVm13azVrOGU2d05tMlRlOHJrTk9kSm5id3EvZnExV2FC?=
 =?utf-8?B?eU5lVEEwNzN1dTY5T1JSTm1CRzVERjBYQmlpYkpwcUh3dlFFOHdnNThMbHYy?=
 =?utf-8?B?RHZTVG5aMkdQMW9DR1JyWmo5QWJtN3RyU2p5YXp5bVVOVWNlaHM3U1JvNVpT?=
 =?utf-8?B?YTFCdDdXN2ZmcVBIZnRIQnVaT0lacXRrYmcwSVZiVEV2TFFVOXZnMzZLUyt2?=
 =?utf-8?B?OG9uRjlEeUdBMTNVZTdOdzJuY0I5ZG94dU9NQ1RldUk0U0tiRWJuVkZqT1o1?=
 =?utf-8?B?UHFYazN1eWxEdThpWG83dzJBK3RWUU8yWG54SXU3YjFvQ2NZWnA3OG1QY0xl?=
 =?utf-8?B?SmNvM2ZoUUpzYUgxS08vVlpzQSttcGhtelQ2T3FuaHBOSVAwQlZvdXVQSktx?=
 =?utf-8?B?dHQxOWJZRmIwWW9EMVB5MFlkWUowVWlnWFZvN2tMU09nL2lKOHJmNkNSSWJG?=
 =?utf-8?B?OTlrcVVDRm04NEV6NXFkUTZQWWg1cXF0TTZVL004RjdNMXpKa3lzM2xHR0Zo?=
 =?utf-8?B?U3hoNzI3cGZ1NFExWFV1Qml2THp4bW93cVhjTXgyeVFUaTBaektsTFBFWEpU?=
 =?utf-8?B?b3drS3VEQzBDdWtRSnNoWVRTbkdHV1gxNmFiQ1dIUEphQmVEQUlyeDAxOTA3?=
 =?utf-8?B?N2FGY2tTOWVQUlJZai82ZU8xamRuMGQvdW03N1lPWDZwSnBnMzFjVzlwa2g2?=
 =?utf-8?B?WHEyWnArdXBvMThBdjlrT1NTYVFhS0xoTnZWK0JsYWxORDVjNzNjTGJVa2ZU?=
 =?utf-8?B?eW5zdmxyV3dtL3BkNzkvek5CSWdWLzZnNXM2Q1l4Tm55cUtZYTBTUVllNmNh?=
 =?utf-8?B?UUZBZG14UXcyajRJVm0rSnlZc1MrVFdQNWg1dndhZHNPaWpUN2ZnZHBQaUFE?=
 =?utf-8?B?bWpTclJKbUFDZGZVMUdRWngxQ1FDSWg4S3ZIakNBbGNIUzN4OTViOTFYQVpV?=
 =?utf-8?B?U2NybC9pTjU1MFJYUWx6bnR2OVdjS01EK2JjdkhMQ0hMQ0dmZ3RWU2YybFdu?=
 =?utf-8?B?SlNkd0wyZGhEQmQyQ3J6T3ZMYWd2QkxQbDVOSjl2WElCTVlQeHBOMHRvVDdo?=
 =?utf-8?B?UHhKY1JFOXR1S05VV0NxRWVEYm1FQWl6ZzlHZFhoUkQwaWtCTTF2T0V6ZmRj?=
 =?utf-8?B?V1pMUEZ2N3JyWVNhOS9ERGRKZXdhSGxYUnFYOERrM0V3Y1dONmlLQkIwcm9N?=
 =?utf-8?B?TFQxZU51eEM3czdlejNGcDhqZFRMR1VHeGlDRkhZYU5GWVIrd0FHN3J2ZDNL?=
 =?utf-8?B?clhHNEthQkIydTU4OTYyalZNNWpxbkdPY3diY2ZzMTNOaUJ6d0U2dm5kR0dt?=
 =?utf-8?B?bjVYTFFpQUFEaUNZWktEYnBvYnU1aVlDWFF2MUlTYnpJUXlnUnFVUHZidjA1?=
 =?utf-8?B?cURXVFJvMTNnL3JnZVJMTjhvT040TTdKdlRwZjZTZTlaTkdRbFdlYmpnTmRj?=
 =?utf-8?B?SjFNaVlSTlFWSHdIWkVEb09QN1M4NXBsMFpkaFhWT3lUckxwSFJnREYwU2Mx?=
 =?utf-8?B?L3VKaGtBTkwyRWFMVExvdGJRK3l2ZnJ6dHpGeEs3N3EwWjZERkc4ODVUaEZN?=
 =?utf-8?B?RUhTNTBXbjRBSURwU2d2Q0ZTc2dBQ1djM0pOclJvb2cwbkFuNk84UWVtY0VO?=
 =?utf-8?B?Z0ZmcTBFWTJrSCtiQXlWeDZPYW1FZDN3NTFiSWowbXpTL2JWUmpESkg3VEta?=
 =?utf-8?B?TlZSd01rVmEwN0g0bGw2MU5pcWZrR2VTTFR2MFJNeXlyRlZ2Mm52SUE1VUNV?=
 =?utf-8?B?TFlINXJlY1NodlJrcmFKQVlGYUovMVJFZElrOUNiekxLV3ZTNXVFUnZEM0Zn?=
 =?utf-8?Q?cKDo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecd1766-8612-4b04-d685-08dde0efd7cf
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:18:08.1197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVjgNg/DfojFzAivPCP7zPT/pXxOpD9WEXDv8XOYHD+YXNsuOrLf747GjN0ri8Rum9Tx5cUemHCUFOa0rUq+Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

Add standard phy interface support.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 91 +++++++++++++++++++++++++++--
 include/media/dw-mipi-csi2.h                |  4 ++
 2 files changed, 90 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index 922b59670383db7c920625f8a149009fa4dc5f22..27d802b3c3937473c8e08defa661b55b0655f758 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -14,6 +14,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <media/dw-mipi-csi2.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -268,7 +269,63 @@ static int csi2_get_active_lanes(struct dw_mipi_csi2_dev *csi2, unsigned int *la
 	return 0;
 }
 
-static int csi2_start(struct dw_mipi_csi2_dev *csi2)
+static int dw_csi2_get_dphy_configuration(struct dw_mipi_csi2_dev *csi2,
+					  union phy_configure_opts *opts,
+					  int bpp)
+{
+	struct phy_configure_opts_mipi_dphy *cfg = &opts->mipi_dphy;
+	struct v4l2_subdev *source = csi2->src_sd;
+	s64 link_freq;
+
+	link_freq = v4l2_get_link_freq(source->ctrl_handler,
+				       bpp,
+				       csi2->data_lanes * 2);
+	if (link_freq < 0) {
+		dev_err(csi2->dev, "Unable to obtain link frequency: %d\n",
+			(int)link_freq);
+		return link_freq;
+	}
+
+	memset(cfg, 0x0, sizeof(*cfg));
+	cfg->hs_clk_rate = link_freq * 2;
+	cfg->lanes = csi2->data_lanes;
+
+	return 0;
+}
+
+static int dw_mipi_csi2_phy_prep(struct dw_mipi_csi2_dev *csi2, int bpp)
+{
+	union phy_configure_opts opts;
+	int ret;
+
+	ret = dw_csi2_get_dphy_configuration(csi2, &opts, bpp);
+	if (ret)
+		return ret;
+
+	ret = phy_init(csi2->phy);
+	if (ret)
+		return ret;
+
+	ret = phy_reset(csi2->phy);
+	if (ret)
+		goto exit;
+
+	ret = phy_set_mode(csi2->phy, PHY_MODE_MIPI_DPHY);
+	if (ret)
+		goto exit;
+
+	ret = phy_configure(csi2->phy, &opts);
+	if (ret)
+		goto exit;
+
+	return 0;
+
+exit:
+	phy_exit(csi2->phy);
+	return ret;
+}
+
+static int csi2_start(struct dw_mipi_csi2_dev *csi2, int bpp)
 {
 	unsigned int lanes;
 	int ret;
@@ -277,6 +334,10 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2)
 	if (ret)
 		return ret;
 
+	ret = dw_mipi_csi2_phy_prep(csi2, bpp);
+	if (ret)
+		goto err_phy_prep;
+
 	/* setup the gasket */
 	if (csi2->config && csi2->config->gasket_init)
 		csi2->config->gasket_init(csi2);
@@ -285,15 +346,20 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2)
 	if (csi2->config && csi2->config->dphy_init) {
 		ret = csi2->config->dphy_init(csi2);
 		if (ret)
-			goto err_disable_clk;
+			goto err_dphy_init;
 	}
 
 	ret = csi2_get_active_lanes(csi2, &lanes);
 	if (ret)
-		goto err_disable_clk;
+		goto err_active_lanes;
 
 	/* Step 4 */
 	csi2_set_lanes(csi2, lanes);
+
+	ret = phy_power_on(csi2->phy);
+	if (ret)
+		goto err_phy_power_on;
+
 	csi2_enable(csi2, true);
 
 	/* Step 5 */
@@ -322,13 +388,21 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2)
 	v4l2_subdev_call(csi2->src_sd, video, post_streamoff);
 err_assert_reset:
 	csi2_enable(csi2, false);
-err_disable_clk:
+err_phy_power_on:
+	phy_power_off(csi2->phy);
+err_active_lanes:
+err_dphy_init:
+	phy_exit(csi2->phy);
+err_phy_prep:
 	pm_runtime_put(csi2->dev);
 	return ret;
 }
 
 static void csi2_stop(struct dw_mipi_csi2_dev *csi2)
 {
+	phy_power_off(csi2->phy);
+	phy_exit(csi2->phy);
+
 	/* stop upstream */
 	v4l2_subdev_call(csi2->src_sd, video, s_stream, 0);
 	v4l2_subdev_call(csi2->src_sd, video, post_streamoff);
@@ -364,7 +438,7 @@ static int dw_csi2_enable_streams(struct v4l2_subdev *sd,
 	if (csi2->stream_count)
 		return 0;
 
-	ret = csi2_start(csi2);
+	ret = csi2_start(csi2, media_bus_fmt_to_csi2_bpp(csi2->format_mbus.code));
 	if (ret)
 		return ret;
 
@@ -682,6 +756,13 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 	if (csi2->num_clks < 0)
 		return dev_err_probe(&pdev->dev, csi2->num_clks, "Failed to get clocks\n");
 
+	if (config->has_phy) {
+		csi2->phy = devm_phy_get(&pdev->dev, "rx");
+		if (IS_ERR(csi2->phy))
+			return dev_err_probe(&pdev->dev, PTR_ERR(csi2->phy),
+					     "Failed to get DPHY Rx\n");
+	}
+
 	devm_pm_runtime_enable(&pdev->dev);
 
 	return csi2_async_register(csi2);
diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
index 3d70c1f4f38e7d663f9b043d8903ce57d630d1b1..14a80c09fd273c334f91ea70d955dcf92b6646ce 100644
--- a/include/media/dw-mipi-csi2.h
+++ b/include/media/dw-mipi-csi2.h
@@ -3,6 +3,7 @@
 #ifndef __DW_MIPI_CSI2_COMMON_
 #define __DW_MIPI_CSI2_COMMON_
 
+#include <linux/phy/phy.h>
 #include <linux/pm_runtime.h>
 
 #include <media/v4l2-common.h>
@@ -25,6 +26,7 @@ struct dw_mipi_csi2_config {
 	int (*dphy_init)(struct dw_mipi_csi2_dev *dev);
 	u32	num_pads;	/* Max 64 pad now */
 	u32	sink_pad_mask;
+	bool	has_phy: 1;
 };
 
 struct dw_mipi_tstif {
@@ -56,6 +58,8 @@ struct dw_mipi_csi2_dev {
 	struct clk_bulk_data		*clks;
 	int				num_clks;
 
+	struct phy			*phy;
+
 	struct v4l2_subdev		*remote;
 	unsigned int			remote_pad;
 	unsigned short			data_lanes;

-- 
2.34.1


