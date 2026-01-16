Return-Path: <linux-media+bounces-50916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B48D3382D
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 17:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C8F330907D8
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 16:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF90397AB5;
	Fri, 16 Jan 2026 16:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WMwqWeDU"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F1D394493;
	Fri, 16 Jan 2026 16:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580990; cv=fail; b=oAZI2z9lmuz4jjP262FR7mtQGIQMpOMXj6XV5vadAU80po9M+7UvIB+fUtHoyJr3ZcgmyUlQPxb+MHHOZ3/inKHxFENl6jOAaqAw0pCnfAWsOUWEGV5oQTuY3Mm2vLv6EHd4OIUDJshcTS4O1z+I9EZvv9zC6jZYxXTrUpshA68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580990; c=relaxed/simple;
	bh=ggarBXI8DTznTxxWLsJejWRICilIKfxfUK92ruvIhTQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=D0myt6OFV1V4/Bho8iycpfyhEhfp6n09yLtILZ6/LGP8lLC4MBWMDqkoZYfU/WaXYVm4UNJeBtwfOBWrwtLPN6N83w9fKmTgKtrielEDLeG5+d7FdKh2gySBbFDEpn2TYUcxQKhjzYVHJdbyIsZoBSdLGIecnzfGxHz9+Y9nhbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WMwqWeDU; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GG0+JB6t0x58bHEPa+c23j9oSqLyhrZHXY8ttfcdfefIbWckamXJ6t7r8ksekQMtaMUJKT+/i9Cz6KUruxGXemIojFVNFT2mEI6f0gX/BKDl5CSRGEbalYl0OBxAaIL1V3E7xyXowaswsIGDVLFW6KOE3KW8fWPEQWnq4KpMyFf2ZOmLwMS/bZ1dtOB+wZJNAApcoOS2KoOqI/WsVQXDDEIw75RBJbxwrplYRFo/LZMUD15Xbz18G4zElCKl47wLCTM4UA3Ym7aPl0r+SFY6i7zPEqBZtnmse7v2jybNwQp6IOlsCKKkMcG9H3iZLZR5owE1VETBNNll8HzFDC/LkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAfCTj2KyQyc1yseMNKmcAowJNNKLGToeK0n0d1F5Hs=;
 b=Wf07QF8FyKUJGCP8BioL/kg8CtAImgM0Jw6NltElvvyymW2HDx+p0puiJW3cVsrKeYsyk9ap6tWL3YQqFWA6CrLZdTex53lbIFU8GsEtBf4Zea8sgoBUrnYj+oZClYRBax0zWBwG/w2FMeOJBYqS3qqY1DWVhh1xjgcwrXFNpcIRSIViroymTo/fvstGaFEvotHIfSdlEEoIxnPlJovAI+7A2satd745DwAXN67bgTEsxz6Q73MKXPDh84u2aMFva1HtVxG2mz/ewGcsvx/T+jWLG1UW38D/MR0dlii0xI2BpInff1Q4pTcXDgk7S34Nhtf4N3oGcjnP6lseKRmYpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAfCTj2KyQyc1yseMNKmcAowJNNKLGToeK0n0d1F5Hs=;
 b=WMwqWeDU6tFD4LIkRqkUn35UyDzwFyPeOulJNc3gHwIowggWIk1bd1PTBZ33oC/H2fOUccQLR39ltHTaKoUul9c6NH8NgcTGlsOQgiZ2MdNItu28PmVkLW7taF7T/XR5ORaA5+TmJa3OdANqSEj+sr/7lOCeB1ZVigrSmH9scJX4olieQkbhwRv8HMIJ1HdTirhuAe0jfysT4Cf5yWgX2nvTS6zuHMSY0pYU3n4LZOTLFIte6DhGfNPyhWkfLKHV6b3mi3Mc9G9d9CptAqUEKX1cGCy6DmeQnIGaGyJm3wRCsmmgF/MAysO4mA9cYOjwT/szYt58P2CZ6gutxuY1JA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU4PR04MB11433.eurprd04.prod.outlook.com (2603:10a6:10:5d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 16:29:44 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 16:29:44 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 16 Jan 2026 11:29:21 -0500
Subject: [PATCH v4 3/4] media: nxp: use cleanup __free(fwnode_handle)
 simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-cam_cleanup-v4-3-29ce01640443@nxp.com>
References: <20260116-cam_cleanup-v4-0-29ce01640443@nxp.com>
In-Reply-To: <20260116-cam_cleanup-v4-0-29ce01640443@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768580970; l=5228;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ggarBXI8DTznTxxWLsJejWRICilIKfxfUK92ruvIhTQ=;
 b=h4DyLSO9bA4t8fIdIvuy6pNaQn2mXlCe5LGgBRG7vjyCPXrvyavK5V6DScSrXjWdNFSEhdpOg
 GFjF0++kubcDWTut+3UVvvz6T/3++hNOZ7FrRQVDM19xBnS1yq0ZIOD
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR05CA0127.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::12) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU4PR04MB11433:EE_
X-MS-Office365-Filtering-Correlation-Id: e1cbf23b-c2b5-4f5a-99e0-08de551c7540
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|366016|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cjNlWS82YmNyTGZ5SVk5L3dFMWg4R2hQeHRQRk92ZDdsMk4ySDdPSk9oSWZ4?=
 =?utf-8?B?MVI4NUpLRUx0anlBNW1zY3RNcFlQZkxKWmdtVEw5UHkwWTlsM1IyVlFMWDVC?=
 =?utf-8?B?VEhKbzVDMlJyd1VXdWFUK2w4L2pvMUJNdVY0dTFIWGE1bVd5ZSs0QVZoSGdN?=
 =?utf-8?B?Q3pVeWlIdHJpejZ2cUhwMkZ2WE1vZEFwM2hjUGMvcEhNYWkyZlRNSjdlSERl?=
 =?utf-8?B?UUh6QVhFR2ZNeGtodGFXZjJuNmpvUkpvcXVkcEhSdmpZWGUwWnd3d05yNms2?=
 =?utf-8?B?cEJLQ3lEb2hvaTBpbkVjUzN2S0ZHQ0k2MjJLN1Q2WmkzcVNrN1pwQWRwZTd2?=
 =?utf-8?B?VDJ6K1hFNVVHdDh1djYrTUtBUTk3S21SVWg2cXJ4bVY0V3NoajNHTE44VDhC?=
 =?utf-8?B?S0xTRzFKTzRuQWdIZElaNk5pTWdqakN2UjFVUHl1T0NMcStMaTJFbm15K1Iy?=
 =?utf-8?B?R2NMWlIwWExzaThaVitTd0djaDVyZ1BDMWZYb1ZJcmRRQU9wYWRBejROeHVN?=
 =?utf-8?B?UHg0UEt4eERxdE9uanQ0dVlIN3YrZ1FrbzBmMWRxS3NuV0JkTVZmWCtLcGp5?=
 =?utf-8?B?Ti9DU3o1Y05RRVVvOStZUVJUNGZMK1crdkNYeVdVQmhXUkRPT2Y0TlF3WTV0?=
 =?utf-8?B?NmpOaUNwMUc1bU4zbWxvME1UbkhsNUdhVzVxYm94SlFJdjhVbER3ZGtYSTBp?=
 =?utf-8?B?OXNhbXlMY280QVhoU0RDSVVIUlB1dDAwU3F1SmpJbU5CUVdmdW1saGNYK2Nu?=
 =?utf-8?B?OHdMc1owSC9BdDRDaDlLSVNVU1piZ0ptems4K3JKUWwrRU1oT0UwdzAxMUhH?=
 =?utf-8?B?a3N4cUNhdHhUd3M5ZFpwN2xUeGtPajdsV3o5bWdtVFRvdG5POWg3UXVZbFZ1?=
 =?utf-8?B?Z1JPcUFHSFAvakN1cjA4K2dMeU1QZ3pzbmYvWVdieWhSUTdaWHVnUXFGUkZr?=
 =?utf-8?B?aEZFWDBINi9VVkI2SVN2V1Y1WjRYTGFvbnNDdlZidjQrbzYrVzhQTWFHMG1X?=
 =?utf-8?B?MDh5WG1KYUJPU3Z3QjZTelFLYUFRaXdLaHFXQzBtdFI5MGNRK2ZhVThIaUZQ?=
 =?utf-8?B?Q2hwNUpvSmRJWXIxWTErQnF6alVYQkJGMzNnQXNETzFra3RUN1BFL2RFbmpr?=
 =?utf-8?B?dXd4a01TeW90cEk3UWxhVGdIUms0ZDYvSDk4OCtFMzFlYnBkcmZSMVhZaVJh?=
 =?utf-8?B?ZkRjVk1IbnBNNG02SjJNYmltdWI3S3VldVhXY0ZCM3JGTzY4dHV4OU93RVNX?=
 =?utf-8?B?MmtyWllRd0l4b242WnJzdlhYdU43a0hjbHRueW1YdG5iL2g1WEdNYUhoYkhB?=
 =?utf-8?B?Si9ZUjRxdHhndnRWdjdmZEFTZWF2YnUzcTNOWW5VQUZHL044YXI2WnZFYXZ4?=
 =?utf-8?B?bWloM0Z1bXJjMHFlRWdQSmxHRjdDM25wc1h2R1RpY1UzR1d6UzBMM2E5Z2ZS?=
 =?utf-8?B?TmdFZ1JrZXZTa0tFNVdxbGpSejBORXZzeklwdVdCSTI1MDAvZjcyL2lmcXhG?=
 =?utf-8?B?eTdOYlZpMnhuNTQxVS9MbnJZNVgyVW15RWUzOW9aNzlzNVAwVCtzczBqdG81?=
 =?utf-8?B?YnM5R0xCVXkxS3pZSXo0YUs5dTNQYThEWkExWCtVQm92eEJ1c1hJTVRLSURU?=
 =?utf-8?B?VW4xdlNZVi83V1Rod3NlS3U1L2ZRRElZUk4wWDVnZUdzT2NRYW9NTXZBZHd5?=
 =?utf-8?B?Y1ZSY1FGVFRRRTh2TzlvSGJ5VUhNSTRRSmYyeXVkOE1DNHVIOFBqMFdtcHV3?=
 =?utf-8?B?dGVVNHFZSnVMaytBVTN2bnVGK2htMVBnL2pWVlNCUVRlOTBrMklxQjA2SEFr?=
 =?utf-8?B?WWNuQ0lyd0M3WThuZGFTL2lxUUx6TDM5enFOc3g4SnFqZkZzRmlhb3hxUXNB?=
 =?utf-8?B?c2RBaHByTXpENnBQQ29yNDI4RXdJemdnUEdSbDltR1dOMTJxMGZQYkdwWEpq?=
 =?utf-8?B?d2lWL25OZTYvZkRyU1U2VFVWTVNXZjdoNUZPVk1KUjZsclZVSHdRWVdNVW1v?=
 =?utf-8?B?ZkV4WGwzTHppamRBMThJVWlKWk9lTUhoZkh6SUt1b05xLyt5a05kT21obGJL?=
 =?utf-8?B?TTAxZmZqS0lFMTcwYjNETHVaeERNSGNwVGM2UUNlVnNGSHlRV2JXYmhtc3Fp?=
 =?utf-8?B?ekZhV0pWaFRxenVHWC9qdFIvTjRlTkNsejlTeTN2RnZMKytKTUFqS0dqTFg5?=
 =?utf-8?B?YVE9PQ==?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(366016)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aUpXUmdpOTZlMS9LSzFxUW1tZEZZSG0yMng0OE9BeXUvUjJSVHlTSHl0Lzcx?=
 =?utf-8?B?U2tqOU9FQjhjdmloSFBPZUdqQXV6Q3d1MnA4YVFVUjNQSGxDUGxkc2VmUFgr?=
 =?utf-8?B?bVR0bk5wUUlHV2k1d2kvTUgweGE1MTRPbCtaOTdqdlFrNm1ySE1OK0tCSXhu?=
 =?utf-8?B?cTlFL1ZXVUhHZElBKyt2d0QvVGRWb2ZLWUp3ZHkwVXVIU2NGejIvRkg0Q3li?=
 =?utf-8?B?L2wzb1Fob0l0d3BjdEhHcGoxWlJ6YkdUWDJIWVBhUDQ3VGxpTCtIQjFDZytx?=
 =?utf-8?B?WWRNZmY2b3htQzVPcW9hTFhHU0R3U1BvWE9rNGhsUVRrYUNoUy9IQWU2ZmVy?=
 =?utf-8?B?T0paUGIxMlRCNmdLTlJMQ3hHWThtd3lrVndoMzZ2Mmh0QlQzL3hKMEVTaWlT?=
 =?utf-8?B?eVQvMTJFd2czVmJSczJYNi9xdDVSMkRtZm9TOTdqVU94a0ZyYk9LQkI5OW1T?=
 =?utf-8?B?M3VEek1SL1dsMHdSdytUbGxqa2lpZEhDRXNPMnlLNUVOOGxSY3M3ZFI1OUhK?=
 =?utf-8?B?R0wxeU42VmJJSGpodUtCUFI0Q1RkYjVSNUhZK2RLeTBPVjkzT0h4T2hqeXNo?=
 =?utf-8?B?MzhkWGR3QUoyRXltY3hrN2FhdldRR1lRZ2tuYzQvc0JSdnkwZVFEcy94cDFE?=
 =?utf-8?B?ZytWMlJMY2ZJVW02dzc4UEhsWHdaeGpOME1YcWVJRUpDdGU2UXMrQ1JFM25L?=
 =?utf-8?B?bnBIbHQrR2dXYUdRV2lVWE5BcWFMaDBvZ2VxZDRteG9hdW83MGg0SFp1ck1a?=
 =?utf-8?B?dUk0dWxXeFhjQVQwN1o5YXhjNlRiTTBPSjQxMjZqeEhmTWdUTWZKM254QTRW?=
 =?utf-8?B?ekEwQkVUYW4zdWMyZy94K0VNNFo4T05UTVhwc0hER2xlK1pxbnM4UWhVTG1Q?=
 =?utf-8?B?Y0ZIZGM1bXRGaExwR0F5NjEvVVdhaEQ3ZHkzdko4d3dRUExTaXdqeG5TT2Fh?=
 =?utf-8?B?M2FKVUZEUy9LTTk5OGdDdTdic1IzZmxmQW1JTFBjekhMWVgrZ2pIQVRBWWVs?=
 =?utf-8?B?WVJ1cWJQWUxMbkk4TFRuclE2OHVCNE01VW8vNCtLTnJwSjJtSmpPaGN4Z3NF?=
 =?utf-8?B?ckRDa2JtNEZEVUViblByN3V0cVpDQ1p0NzMxMDRyUG9vaEZ6Y0p5cUVmcWZo?=
 =?utf-8?B?K3hrbEg2VGxmSFFrdmxrUTd6VHNWeitoS2xBR3UrSmlramtxblIvcmlTZ1NF?=
 =?utf-8?B?MkJ3eDJEM0pESnR3SnVYM01KRzZpdGVQQ01KeTNzOE8wT2tpZzU0S014a3Ji?=
 =?utf-8?B?THZTZmRUbXpibnVwZ3duN2Rsc2l6eVZ1cnBGdW5UMS9IOE8xQURUdUh2L2pV?=
 =?utf-8?B?TjJDd1d0b2xTMjFvQjhUT3VMNDZnQU9NblduNjREQjJibnN2OFFBc0x5QzJw?=
 =?utf-8?B?M01DNTBCdHBQclRjckFQNWJ4QlpXeUI1VE1WcnFKRktFbitTZmptcTJTZ294?=
 =?utf-8?B?UzQrckVpMWdzRXhINURmVWE3S0dFT0t2blV4a2RLOU5jZlpqMlM2bitIbngr?=
 =?utf-8?B?MVVRREVZR25tL1hqZHFyR05tVS8wWmZJTlN6b3lkUk5KSjlpMWJRbU43QjVy?=
 =?utf-8?B?d2JKY2I2dzFhUy9WMHV0TmhqNWFNYXo3VmpkbG9TSFRWcWk3cVYyTGphYTlQ?=
 =?utf-8?B?dm1jb1JMc1RyOXpQSXh6Mis2V3Y0Ny9BclZMeGZYVEkvd3RVcTVuT3czWml3?=
 =?utf-8?B?VUVBLzhjMUZoeTJJRG9WUjA0TEpzN0JKZ25ESGtpeWtFZVluaHhGdFJLN0R3?=
 =?utf-8?B?Unk3ZHc5TE9vQ0pIcWQ3K244U2RXTm9vN0xyeXN3bEVHeVk1bVVwTXVKR3oz?=
 =?utf-8?B?bDIvWG1DNE1sR1A4Q1BURnJJL3gveHg3amJHQ05Hcm52dEx3STYwejRPQjNT?=
 =?utf-8?B?cE5ISU1PQ2U3UW1JM3lFUm1yYW9NVC9rbFZUN2Rmamk5KzNKUzljcDV4blpE?=
 =?utf-8?B?cFppcGpmbFp5NjFidFEvd2ZobW1VdHFrNG5YY2RQSFZrUDMxSWJUYytYR1Rx?=
 =?utf-8?B?OXZ5bnk5V0tSbml2aFVKakFYTmZkeWxWa25GaWtoYnk4bW9TbEJHMTc4S3VY?=
 =?utf-8?B?a1RpNVlXb1doSVg0cHU1Z0hsSktIQlhjS2ZjaDYwaVRBL0pKT1dXemdpaXdL?=
 =?utf-8?B?QVBwYTBubndEMkt1aE4zZXIxa0xHazU2ajhaWGoxb1dWT2g1NURpWmYrV3Ro?=
 =?utf-8?B?WmtwUDBwWVFqR3RBZEVaT0hSQ241STFZNkpFZ1Rrc0ZCVlpGalNTSzJxajlI?=
 =?utf-8?B?cE5GMVJRVXUzUGhPM0ZhK0hpdGZweDVHV3kyZEVGWFl1NlljM1l0cVBoNjl4?=
 =?utf-8?Q?3EJfvhEu4xfg28YO0E?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1cbf23b-c2b5-4f5a-99e0-08de551c7540
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:29:44.9077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SOSyA3N9KM+8Wi6Jf9t49OnzECK0yDp6eUvc5jAVs/HurpQgupSk3Wasisu5ekWo3VI8Lq+o9jYkIFJnHUElyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11433

Use cleanup __free(fwnode_handle) simplify code. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- Rollback to v1 version to align guide at cleanup.h.
- Ref similar link

    Link: https://lore.kernel.org/r/20240904044825.1048256-1-dmitry.torokhov@gmail.com
    Link: https://patch.msgid.link/20251208020750.4727-3-krzysztof.kozlowski@oss.qualcomm.com

452e0adff2618 Input: iqs7222 - use cleanup facility for fwnodes
52776177d8b7e Input: iqs626a - use cleanup facility for fwnodes
9a540b67a9c26 Input: iqs269a - use cleanup facility for fwnodes
cc3b18f9fedec i3c: master: Fix confusing cleanup.h syntax

change in v2.
- move variable define to top.
- remove dev_err_probe() change
---
 drivers/media/platform/nxp/imx-mipi-csis.c    | 25 ++++++++-----------------
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 25 ++++++++-----------------
 2 files changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index ce93d868746f002c22e2f86b1e0aa84ec1a76061..9a43fd1eb0bcee7ac0c47f28ad89012de45a70d9 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -12,6 +12,7 @@
  *
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -1349,27 +1350,26 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
 	struct v4l2_async_connection *asd;
-	struct fwnode_handle *ep;
 	unsigned int i;
 	int ret;
 
 	v4l2_async_subdev_nf_init(&csis->notifier, &csis->sd);
 
-	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
-					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	struct fwnode_handle *ep __free(fwnode_handle) =
+		fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
+						FWNODE_GRAPH_ENDPOINT_NEXT);
 	if (!ep)
 		return -ENOTCONN;
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
-		goto err_parse;
+		return ret;
 
 	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
 		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
 			dev_err(csis->dev,
 				"data lanes reordering is not supported");
-			ret = -EINVAL;
-			goto err_parse;
+			return -EINVAL;
 		}
 	}
 
@@ -1381,12 +1381,8 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 
 	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
 					      struct v4l2_async_connection);
-	if (IS_ERR(asd)) {
-		ret = PTR_ERR(asd);
-		goto err_parse;
-	}
-
-	fwnode_handle_put(ep);
+	if (IS_ERR(asd))
+		return PTR_ERR(asd);
 
 	csis->notifier.ops = &mipi_csis_notify_ops;
 
@@ -1395,11 +1391,6 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 		return ret;
 
 	return v4l2_async_register_subdev(&csis->sd);
-
-err_parse:
-	fwnode_handle_put(ep);
-
-	return ret;
 }
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 83da050a1dcbad1d41c94de0e352dcafe3f25e62..9d946b68cf59d9f4fb3413fc90219efd380d9d95 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
@@ -717,27 +718,26 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
 	struct v4l2_async_connection *asd;
-	struct fwnode_handle *ep;
 	unsigned int i;
 	int ret;
 
 	v4l2_async_subdev_nf_init(&state->notifier, &state->sd);
 
-	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
-					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	struct fwnode_handle *ep __free(fwnode_handle) =
+		fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
+						FWNODE_GRAPH_ENDPOINT_NEXT);
 	if (!ep)
 		return -ENOTCONN;
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
-		goto err_parse;
+		return ret;
 
 	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
 		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
 			dev_err(state->dev,
 				"data lanes reordering is not supported");
-			ret = -EINVAL;
-			goto err_parse;
+			return -EINVAL;
 		}
 	}
 
@@ -749,12 +749,8 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 
 	asd = v4l2_async_nf_add_fwnode_remote(&state->notifier, ep,
 					      struct v4l2_async_connection);
-	if (IS_ERR(asd)) {
-		ret = PTR_ERR(asd);
-		goto err_parse;
-	}
-
-	fwnode_handle_put(ep);
+	if (IS_ERR(asd))
+		return PTR_ERR(asd);
 
 	state->notifier.ops = &imx8mq_mipi_csi_notify_ops;
 
@@ -763,11 +759,6 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 		return ret;
 
 	return v4l2_async_register_subdev(&state->sd);
-
-err_parse:
-	fwnode_handle_put(ep);
-
-	return ret;
 }
 
 /* -----------------------------------------------------------------------------

-- 
2.34.1


