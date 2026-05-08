Return-Path: <linux-media+bounces-60886-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDdSLqVS/WmKagAAu9opvQ
	(envelope-from <linux-media+bounces-60886-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 05:04:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4EC4F0F9A
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 05:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46B5B3025D0A
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 03:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774032D249B;
	Fri,  8 May 2026 03:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="T62DRpsB"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013022.outbound.protection.outlook.com [52.101.72.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39257248896;
	Fri,  8 May 2026 03:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778209412; cv=fail; b=IFILqnqo6pXJ5p2k5dvQ4WiL7v+jEwoEa/8qww2cTIXpCS615/vInO+dSC0OgjKfppxlCY7e3xgmGKPXGbHzGlzcZZDyA3j5MjnmRp0IFI6G57ic9p8I1JZ4PkPiAipUFmv5KhFUIB6ayLY7CmEykfYMWz7ipJl1wvb9TSskZSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778209412; c=relaxed/simple;
	bh=//sc38b14fp7pRVEmIs7Gtm3hb2eHlDTKdtyOFJrG10=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tqwsvNUDCLkoxCIUMGV+7QgiNxZxpf7UHe7JeZ5yhUS+DrlXEcvzSXSNNez/PSWJ8NngEb82/Q1co8WrhpkyBcz/QcYWJG1R0CkujjshBOCO7OFMH4h0NoruI55sXPQSlbaxt3+U+9u3jKx3nkFxlO+LoJEkOEOoTkocqIb3VbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=T62DRpsB; arc=fail smtp.client-ip=52.101.72.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9k2hnhSdJ6XnxeBhmmByJkOiTXCxvN1u0GIT8GJrIVPbFLJtfEPwG0+jQsUdl3py3Wg+V6wohcMNIQG06rF1dv+Nqt8C/w5xBFp2frFbee8lBw8hauMs7+pz2hAxfQbNn3aPoiNCMZvfxM/WlJbCEGgI8p/ftpu1R+ftWA4uFWB24gBO/yHlIbue/4OZSLQNuxE8jBDvX+k8J6pn2xNyPQv6VFOk+cx1gDXF7UDsDf6uAZ5bMHlvNojf6kKzXCsZB5pmp9bcffMws6U86USsq5fKCSWhaaBhd1ieIbEpzr0ebkBqDsYEoBAI+Zi2FOsBw6VaiqwO3loWL1oldpRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAr5W5R/1GXeQKVgBodL+nFgzVCpZpaEtUu5swFL6GI=;
 b=Pq/8mUmZfuGmqlXfNOZxBzePJFe58FfcY2ilzVpWC/aFcnWpI+Lviqsds8bZn5sWHO0R+RMX7lgSInc5OUNgd2tSAgSmZEvN6mBqukQp02VFD4XsqdZNNJ9inhS+XmYAwTmU+aoE6veVkwLzu1Xkb5cQTy00QdmOtYLxYftvmoHxH16PbCvQjetPsh1Khdhby0vFeRx3QfkDXZX5j5mqspAgpJ9uxDUCSswECUkKxAkmPz1GfqSCEHN17qyWHzPVZu19yepWoBIaW/VLSK2ialSm3rnBtfhgp3YnLwtfPTqGxcwYWAWe2V6VBBP2L66ERUflV4VCvpEVpWm8qtf8FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAr5W5R/1GXeQKVgBodL+nFgzVCpZpaEtUu5swFL6GI=;
 b=T62DRpsBj2whJznO8aBZogrM23FByX2NhW3FRivEVWoYrlCm46Y07f2QbM9ngnNm8Vq2+iqhlxdQDHtqesu6/HPt94MYQptkhg0nKgRmaDThvre4nhs1ZLYTXapLck6NwXL3K1JWwEWRYlQ28b+Zr87gVVA9g5L0ZmfgUe/z8S2Bed6A6IOImdsrWJRyfvPI31UKOwCQSmGuOkfEbZtORchvhiIVKUQ+xjQOgvuohG4Sv5Q+LkHs2SuCOHQFTIlgUf4oLe3LhegM6qGHQsbBKmGxD0sH5lcBTZ/ZLsgR+uTm8IkNne+yRRG58EX6V9Ny6qDN2DhNjadkkzzWnLQO1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS8PR04MB8006.eurprd04.prod.outlook.com (2603:10a6:20b:288::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 03:03:18 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 03:03:18 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 08 May 2026 11:05:40 +0800
Subject: [PATCH v4 1/2] media: nxp: imx8-isi: Add virtual channel support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-isi_vc-v4-1-feee39c63939@oss.nxp.com>
References: <20260508-isi_vc-v4-0-feee39c63939@oss.nxp.com>
In-Reply-To: <20260508-isi_vc-v4-0-feee39c63939@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778209560; l=8137;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=XnUiAkhsMRTwy10inZeHsQyXt4g1/CdWfgG0Mybr99g=;
 b=7p1zKJVvaxAGZrzYalFY02njtaaeIm1k5+xr9Mu+CqQb58cfD+eks0/+qBmGAOJavGkwWj5VF
 zd7bcT0O4aICWel+tdoTl9nGG2WoYQaCd2Q1Ok7jNtd8lIosQ0De5kQ
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To DU2PR04MB9081.eurprd04.prod.outlook.com
 (2603:10a6:10:2f0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AS8PR04MB8006:EE_
X-MS-Office365-Filtering-Correlation-Id: c1bae798-8983-482a-0cba-08deacae5a97
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|18002099003|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 1aQE8JClI+thH4v+ufEiyIU+IV5RCaUxhnDXHckB6JezCe5E+ZMOc2/szhhBAEELvQje8HiGUnOs7SviXs1ET+5Ql3ogPQ+1O3ONBTJnuQcxHn1SilqjM4rNU6FWdA0WpJPuZYeSyetaPPfZX2I9/uyAVSuzaHOcofeqD6RwPfZVPyFDJf5ROrWZ1qyze8PpIdDXa+sgLEdvQXKOiQhe9/rMa5R7i6OxyZnqm2BND+iYIkzp5xJhKPkcLToG3an4bPgzyrGHcSQgyanJkCfeD4em2x97V/EUuHOrr+HEaOMYswkuFouQ+alyzoUYXf1boJMwMCDlSf25Lpqsppp6yAsJsZJDHxZZLZk5rzWESMyFpoiOnDOISt3Rh0jwz3hcqLPSkC+pWaPFifwQFQgn4ATrka7k00KMGLkhhnZvKTU+zdFZ/9v0RJO88/6DXPHtGG3p0+pQWyhB2Ooccx7/K0klYkkLqiFaCX2XGftzeEQvrfy20gvRGrcbdhMLQmh7YyckcRmr4Vx2vP9fjS4iSHez5Dg73az2jyTWIU+neJORWjIGzl5vT8KfIphTAvsU3wCIr+mj+ymvVb3YRpYZT7m5ijCEeUwyaDRoypfUgp110p+rlyccv3HWcknW7XpwqnVFTJxfVu+YP27qinqaD0QshDmiIWOADoVTquJiS51+oE2wwsE5hKKIRHC46/g/iMPf3++CreyR8RxlpnD1RaOnTMT5uzjXLGQvo89Pv6yzGlKQAF2g4wg8CpvgPWBJ
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(18002099003)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TjgxaS9XdVBscXlsaldnNlBpUmVtVTYrbXE3RGxoeUpIVUZSWkJDdjdaNTlk?=
 =?utf-8?B?Mlg5R2NWWE1XTEhPZjVDOHZvdm1oY2kxTW4ydTBZK1B4QkJlZlZKdUYrV3A2?=
 =?utf-8?B?WEQ2Sy9kOGFSU1ZTa2c0cFdwYXhNSmhSS0tFdTBqZEJweTRzT2dXMEhwZjVm?=
 =?utf-8?B?em5EVVhOUUVHSG1lSEcxcTZtTE56SzExLy9nUjc3RmZFSzZManVjQzBqL1hM?=
 =?utf-8?B?ZnNrSWFkcXl5UmVWOVNwMzJPTldRL3JkZDhqZTQwOG5UY2VQeCsrWml5MC96?=
 =?utf-8?B?c3dBN1RBM0QyWDM2VVhlYTFxbXdUWm1GMmhQTmVoaGZDVkVUYXFwQ2tTdmR5?=
 =?utf-8?B?aXN5aTlrOUNWSzJ4VC9zbHg1Rzd4VGhabjhpN3dFNm43bnRCMG9BeFZCZWo5?=
 =?utf-8?B?UHhCQnNGNGFCOHRkNjdGaXVlK21mMVR3amhPWHdTMzVqZGNuMWdFZ1JJZGNY?=
 =?utf-8?B?ck1pQ25zQWUxRWtSMWg4cW9FYU5FK29hNFZwYm9OczU0aFJzRHpVWkxJN1VU?=
 =?utf-8?B?OHZFMDBodmppZ3ZZMFlnV2FNaVVwRG8rUUZoSmJLcHpYc01qN0pHNnd4cE5w?=
 =?utf-8?B?ZVF2NE55YUVuSFZPR1FNYzB6NCt4Q0VxcldZd0pBbm1kSG5nMkJjQ29DZUI1?=
 =?utf-8?B?aDZxL1Nld0F1R2FENXpmdDhkYmM2Wk1JM0VabkpIWUtWckw2elMvd0pkVmcz?=
 =?utf-8?B?a0FmdVJkWHYwazltUFJsNHp4NVRmZmh6TTgvUzZHSVJSdTdIQVdQSXp3VC9G?=
 =?utf-8?B?TWN0aUpRNTJscCt5R0VhUTZESXRMRnhYSGZRS0VXYnJtY3NUNXl1VHNYa3V3?=
 =?utf-8?B?YXhrZmI2c1V1aVdZck9OR3BCUjZ5RmhIWm5JMTV3ZFJTNlZhbnE4NWVVV3BJ?=
 =?utf-8?B?YThVbmF2d3FqbW9VNitGRzRiRjkwbGhVZ1EwakNIbHNiUFFKalQ3dGhVdWZL?=
 =?utf-8?B?cEFmbVdkQmJzZHNseG0yN2dsRWdqaHgxcEhsUHN4b2RlcWNoVnA5UzhRekJr?=
 =?utf-8?B?NFMxVXRYdHlGV2tjVEV0TlhqalJGRkE4Y1RGb0lNSFRPcjBxU2psa2RwbkU3?=
 =?utf-8?B?bGJjNFZVZGc5UHNmZGRYVCtTVHFkUitKMVIxaWpUNEt6dVIwTnVVMUlxT1Q5?=
 =?utf-8?B?SHplWXA2ZnZ0VGxSQXI1Ynd6SGk4ZW9Yd2lsbkV4OGlJUG9VV0J2ZGdab2xD?=
 =?utf-8?B?OFpEN2lrMGJmZTRqdDRObjBtVzZzSVVHSVdmUHhOYVFIRGEyN0oyT0J5ZFZW?=
 =?utf-8?B?SFVicjRqNnVYemI5cUZJVHU2Tm1ycEwybHgzQUh2Z002Vm0vRXFBMzZKVUt5?=
 =?utf-8?B?V2hveElFdHIrRXpFZHNSemdTSDMrOFEwMGYrZDJ5cng0bkpPT0o1QmVYSXlX?=
 =?utf-8?B?MytWVmdmTnVnMmc5YVAxMnJHbCtlellGVEF2aU5ZQjdMTVk4Y3dubEtRU1JW?=
 =?utf-8?B?QzVpS3lXY1Ftd0hNTWlQRXBLZGQxLzVPMFRFSzFsV1ZxV0I3b0NVSTBHR1FR?=
 =?utf-8?B?TkEwMjI3cTk1TVFNQnZjT3A0OHhYUzNEMEZqUFRQa3JRbno0ZGIxZ2paRXlY?=
 =?utf-8?B?YkloaFIwNmZBM1gvaXhIV01mVUZUcFlqRHNjekFOd0M4ei9XMUtvdjRXSjZL?=
 =?utf-8?B?S1VLL2dUSXNPQmo2ejBsK0NFbkgreG9SNllQOUxqVWpSRG9zUlppb1UvSExZ?=
 =?utf-8?B?eGVtdElYdytlMytlTm02S0JpWmI2OGZEZXRkZi81R1RzbVRCSGpvcUNRNVd2?=
 =?utf-8?B?QlFQSDVLdXQvTzhPTlYzcnRyWjVrVUdKU0RVZytXZGcxTlVSaWZYcTJhYVhM?=
 =?utf-8?B?QVFDRmx4ZkllTGhtelZqalU5STZMRllpRjM3TnNiTWxWQk5mQS9pV1NYdmY4?=
 =?utf-8?B?eFM4RXVsV0REYXVzdXVkUUhicDFtWTY4N3BodHFGb3E2UjBUYThmb3JnSGpF?=
 =?utf-8?B?bHdISjlUM1JzMmk3Vk1MeFNJVmNiSXl4K1drMWNQdEVnNkd4enA2MnhwNTJM?=
 =?utf-8?B?MkpPb0VYT2RBRHhPWGt6SlVRMitOczlLWWZjbzRGSW01dDM0ZkdRVkNZeXpD?=
 =?utf-8?B?OE5mTDBESDlrR3VrUEdXMGpndEdnWjdnTDBZb1JCT0gyQmYxaDNyVHlOcDhL?=
 =?utf-8?B?VnpzU0I1N3hCT0p5WGVydDNOZGN1RGlHMHNwTGRIcGJNa0lXVjNmMUZaTFRj?=
 =?utf-8?B?MjVEd01zaUcvWG1naVY1dkFxcG1jSVJHMkFrREZmRDgrcG1ybXByeThPV0h1?=
 =?utf-8?B?QmFGMC85WG9ITytIQ0czeXJ6T01lY25WbGE3MTVjRmJhMGQxeUZxaWFZUTJW?=
 =?utf-8?B?VWxXVHdvZGt2anY1VldiN0NmNVhkNnljVmtNT0twNVYxeldLTjZvQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1bae798-8983-482a-0cba-08deacae5a97
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 03:03:18.0392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPJ9XpRD1iiYB97Vc/lcUmHRIs5Jgitsd4q8/Hyy2A97LXbo7TwnLPGTGCsa902aKkm5XRJZOZsrall7sa+R+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8006
X-Rspamd-Queue-Id: 1D4EC4F0F9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60886-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The ISI supports different numbers of virtual channels depending on the
platform. i.MX95 supports 8 virtual channels, and i.MX8QXP/QM support 4
virtual channels. They are used in multiple camera use cases, such as
surround view. Other platforms (such as i.MX8/MN/MP/ULP/91/93) don't
support virtual channels, and the VC_ID bits are marked as read-only.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v4:
- Fix VC boundary check: use num_vc (virtual channels count) instead of
  num_channels (ISI pipelines count)
- Set VC to 0 when frame descriptor has no entries
- Move platform-specific comments to block style to fix line length warnings

Changes in v3:
- Add num_vc field to platform data to indicate VC support
- Clear VC_ID_1 bit after reading CHNL_CTRL for proper VC switching
- Set VC_ID_1 only on platforms with num_vc > 4
- Improve mxc_isi_get_vc() error handling
- Add back CHNL_CTRL_BLANK_PXL and document platform-specific register fields
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  3 ++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  4 ++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 14 ++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 59 ++++++++++++++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    | 12 +++--
 5 files changed, 88 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 4bf8570e1b9e..837ac7046cf2 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -318,6 +318,7 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
 	.model			= MXC_ISI_IMX95,
 	.num_ports		= 4,
 	.num_channels		= 8,
+	.num_vc			= 8,
 	.reg_offset		= 0x10000,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
@@ -329,6 +330,7 @@ static const struct mxc_isi_plat_data mxc_imx8qm_data = {
 	.model			= MXC_ISI_IMX8QM,
 	.num_ports		= 5,
 	.num_channels		= 8,
+	.num_vc			= 4,
 	.reg_offset		= 0x10000,
 	.ier_reg		= &mxc_imx8_isi_ier_qm,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
@@ -340,6 +342,7 @@ static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
 	.model			= MXC_ISI_IMX8QXP,
 	.num_ports		= 5,
 	.num_channels		= 6,
+	.num_vc			= 4,
 	.reg_offset		= 0x10000,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 14d63ec36416..195c28dbd151 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -169,6 +169,7 @@ struct mxc_isi_plat_data {
 	enum model model;
 	unsigned int num_ports;
 	unsigned int num_channels;
+	unsigned int num_vc;		/* Number of VCs, 0 = no VC support */
 	unsigned int reg_offset;
 	const struct mxc_isi_ier_reg  *ier_reg;
 	const struct mxc_isi_set_thd *set_thd;
@@ -257,6 +258,9 @@ struct mxc_isi_pipe {
 	u8				acquired_res;
 	u8				chained_res;
 	bool				chained;
+
+	/* Virtual channel ID for the ISI channel */
+	u8				vc;
 };
 
 struct mxc_isi_m2m {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index 0187d4ab97e8..ecd0c2ef28b6 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -308,6 +308,11 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 	mutex_lock(&pipe->lock);
 
 	val = mxc_isi_read(pipe, CHNL_CTRL);
+
+	/* Clear the VC_ID_1 bit on platforms supporting more than 4 VCs. */
+	if (pipe->isi->pdata->num_vc > 4)
+		val &= ~CHNL_CTRL_VC_ID_1_MASK;
+
 	val &= ~(CHNL_CTRL_CHNL_BYPASS | CHNL_CTRL_CHAIN_BUF_MASK |
 		 CHNL_CTRL_SRC_TYPE_MASK | CHNL_CTRL_MIPI_VC_ID_MASK |
 		 CHNL_CTRL_SRC_INPUT_MASK);
@@ -338,7 +343,14 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 	} else {
 		val |= CHNL_CTRL_SRC_TYPE(CHNL_CTRL_SRC_TYPE_DEVICE);
 		val |= CHNL_CTRL_SRC_INPUT(input);
-		val |= CHNL_CTRL_MIPI_VC_ID(0); /* FIXME: For CSI-2 only */
+		val |= CHNL_CTRL_MIPI_VC_ID(pipe->vc); /* FIXME: For CSI-2 only */
+
+		/*
+		 * On platforms with more than 4 VCs (i.MX95), the VC ID is
+		 * split across VC_ID_0 (bits 7:6) and VC_ID_1 (bit 16).
+		 */
+		if (pipe->isi->pdata->num_vc > 4)
+			val |= CHNL_CTRL_VC_ID_1(pipe->vc >> 2);
 	}
 
 	mxc_isi_write(pipe, CHNL_CTRL, val);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index a41c51dd9ce0..e6da254a9ef0 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -232,6 +232,61 @@ static inline struct mxc_isi_pipe *to_isi_pipe(struct v4l2_subdev *sd)
 	return container_of(sd, struct mxc_isi_pipe, sd);
 }
 
+static int mxc_isi_get_vc(struct mxc_isi_pipe *pipe)
+{
+	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
+	struct device *dev = pipe->isi->dev;
+	struct v4l2_mbus_frame_desc fd = { };
+	unsigned int source_pad = xbar->num_sinks + pipe->id;
+	unsigned int max_vc;
+	unsigned int i;
+	int ret;
+
+	ret = v4l2_subdev_call(&xbar->sd, pad, get_frame_desc,
+			       source_pad, &fd);
+	if (ret == -ENOIOCTLCMD) {
+		/*
+		 * If remote subdev doesn't implement get_frame_desc.
+		 * Assume virtual channel 0.
+		 */
+		pipe->vc = 0;
+		return 0;
+	}
+	if (ret < 0) {
+		dev_err(dev, "Failed to get source frame desc from pad %u\n",
+			source_pad);
+		return ret;
+	}
+
+	if (!fd.num_entries) {
+		pipe->vc = 0;
+		return 0;
+	}
+
+	/* Find stream 0 in the frame descriptor */
+	for (i = 0; i < fd.num_entries; i++) {
+		if (fd.entry[i].stream == 0)
+			break;
+	}
+
+	if (i == fd.num_entries) {
+		dev_err(dev, "Failed to find stream from source frame desc\n");
+		return -EINVAL;
+	}
+
+	max_vc = pipe->isi->pdata->num_vc ? : 1;
+
+	/* Check virtual channel range */
+	if (fd.entry[i].bus.csi2.vc >= max_vc) {
+		dev_err(dev, "Virtual channel %u exceeds maximum %u\n",
+			fd.entry[i].bus.csi2.vc, max_vc - 1);
+		return -EINVAL;
+	}
+
+	pipe->vc = fd.entry[i].bus.csi2.vc;
+	return 0;
+}
+
 int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
 {
 	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
@@ -280,6 +335,10 @@ int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
 
 	v4l2_subdev_unlock_state(state);
 
+	ret = mxc_isi_get_vc(pipe);
+	if (ret)
+		return ret;
+
 	/* Configure the ISI channel. */
 	mxc_isi_channel_config(pipe, input, &in_size, &scale, &crop,
 			       sink_info->encoding, src_info->encoding);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index 1b65eccdf0da..e795f4daf3ff 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -6,6 +6,7 @@
 #ifndef __IMX8_ISI_REGS_H__
 #define __IMX8_ISI_REGS_H__
 
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 
 /* ISI Registers Define  */
@@ -19,9 +20,14 @@
 #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
 #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
 #define CHNL_CTRL_SW_RST					BIT(24)
-#define CHNL_CTRL_BLANK_PXL(n)					((n) << 16)
-#define CHNL_CTRL_BLANK_PXL_MASK				GENMASK(23, 16)
-#define CHNL_CTRL_MIPI_VC_ID(n)					((n) << 6)
+/*
+ * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
+ * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX95 only
+ */
+#define CHNL_CTRL_BLANK_PXL(n)					FIELD_PREP(GENMASK(23, 16), (n))
+#define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))
+#define CHNL_CTRL_VC_ID_1_MASK					BIT(16)
+#define CHNL_CTRL_MIPI_VC_ID(n)					FIELD_PREP(GENMASK(7, 6), (n))
 #define CHNL_CTRL_MIPI_VC_ID_MASK				GENMASK(7, 6)
 #define CHNL_CTRL_SRC_TYPE(n)					((n) << 4)
 #define CHNL_CTRL_SRC_TYPE_MASK					BIT(4)

-- 
2.34.1


