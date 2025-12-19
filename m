Return-Path: <linux-media+bounces-49126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B18E0CCE300
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 02:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A3F4302D289
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 01:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C40B4503B;
	Fri, 19 Dec 2025 01:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X58CrnvS"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011009.outbound.protection.outlook.com [40.107.130.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED0715B971;
	Fri, 19 Dec 2025 01:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766108993; cv=fail; b=HpYHBXbcx1bJMiZ0oBp3brWiOHIVnmBTTHr3W5EXuy85IX1Ip2uLHYYCPVWw0m90nx+h/TLDesdNOOXQxLFrdSHMgq9LT01R/vbdKA603d4rYNmOngor+QSc0SoFuKGj+Yw6jYvvs0wtcgzPG90S5Vvs1NADs8d96zjlsZVq8Uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766108993; c=relaxed/simple;
	bh=vviRW/1SlQbDoz4Srl4f8sqxc1GU0k7SaC+uSjyvFqQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=tSrX5BCPRMl7n6rmrBPpZot95xa5dkDy6wHB4t5axJEETgVzs2t/wzL3uOHtRefWE7HDLI0EI39mPMu8exkxAj1RegbkjKKoD06pREDy/osSDQ7MH3dYWn9TtSbioDugPGv9Wg1YHFwi9b64nWg7BNW7pbA+D4hPU4XvWMAn+uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X58CrnvS; arc=fail smtp.client-ip=40.107.130.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ehv7uobjUiYimFV/IE5hh54yCOQjVf6H9T0LrJnfnlIsNIuA43Ph/xSB2ENFuPND7ah2MoSfRQSdSfyHj4fz+0GF8E7RvCsHHbdD/CS/OP35s4ivQGRa/yuFooCL3dic167C9StDFYaXuM9SS2EWWyf/aE2AR1En2E+WS+GeXsTwL5yAoBArWOaiAiWF/UvMop2/y6HqJKmAJjLgkIiGhE87Dn5pmz+FyQzOqL5OgpjvBdcooDxv1xF3doMo4W5ri5iGWoK5vt+2WwmCCmKsGADoa7e3N1TOA0DPZj9IeDTuG+trLp+bTj42L8IPBp4xXZIAuNZjSJaWNlhlBEhIug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wa/WyF9xohz8zrISfqAGeX7pbWMDKANdLTxrVqmhkNU=;
 b=ZI7zFMRCL5gAt4iqmJUXLE+rIW1Gv/T8XNL0Vc7gSJRGiCHeNcQWQEOKbr1ADxbNbtBWp221NR37HnoKnad48IMX3yf8Y2UGHQp9KNQaCXiQl1nIG4p8LO2OfceYp/5Dq4jYG58Col2rFpd7MyE+p7opbpFTOu8RystRulBgrvbBsTRf+A/WcWY01MJe1VbainsgLJOoGsPi4mzmYFUfEzXXPF2PTgnlFA+jh6jZgl1FGzto967vHaDCIqA/Bf2BVyQYlZq2PfccF6C4D56OPzUENnXSGiZDk8F+gz0ZSfM3Fc7+zRLNPKZ+/BWhmuq3Fft5C5GwqdsPv97kBk16/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wa/WyF9xohz8zrISfqAGeX7pbWMDKANdLTxrVqmhkNU=;
 b=X58CrnvSJOyPJa2w3Zo02qR5Y1N3d7T52NdjWbjb2CNjl2Hr+9rle6OmHfmilj7PyAuQpbZb23cCNEaHinLFEWEZUlQeJDHGsuRffmhk2D+MXmzVvp0VeBBKw+K4XHOYW16G2ShUBP32Fqrcvd2XaKBYA5rJz4WdTGfZCds/X7QNWJzVwypy/OCkZOVY/WEgY3oiBwuZZhRPIScdlGX+z7hJm2AczuodBr74Kka63aMR+r8xNd4vID5zxb55A5Bsxq97Zcz02OerYmE0K4xMx+++UNjlQ7ymd1EIq/A/IS8f2/bYFC42qd5zbLTxVAyw91djIBIXJBKf5wRBylki/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU0PR04MB9495.eurprd04.prod.outlook.com (2603:10a6:10:32f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 01:49:47 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 01:49:47 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v3 0/2] media: nxp: Add CSI Pixel Formatter support
Date: Fri, 19 Dec 2025 09:50:56 +0800
Message-Id: <20251219-csi_formatter-v3-0-8680d6d87091@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAICvRGkC/13MQQ6CMBCF4auQWVvTGaCAK+9hjIEySBdS0pIGQ
 7i7BRcalu8l/7eAZ2fYwyVZwHEw3tghjvSUgO7r4cnCtHEDScoRKRfam0dn3aueJnaCVUtViqr
 VrCA2o+POzLt3u8fdGz9Z9975gNv7lUimBymgkIKbihGzoskqvg7zeNb2BZsT6K/F4thSbBWhK
 uuulITy167r+gFT/tjc5AAAAA==
X-Change-ID: 20251125-csi_formatter-e6d29316dce6
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766109067; l=5802;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=vviRW/1SlQbDoz4Srl4f8sqxc1GU0k7SaC+uSjyvFqQ=;
 b=8o9TLz/fw8kjzWCJWTFCBSkX+xVYRV1reHXVWdLYuPT4MG9h3RDx/ugZ4styMEbV77k7mLeo2
 d01Slc1qjzIAgLEP7LYVheNsyyVWJ3xOWS4+CuKBBbdSMeb+oxtW0ie
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU0PR04MB9495:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c993432-cd53-40d9-b6c2-08de3ea0e3fd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|19092799006|7416014|1800799024|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZTZBMmlweitubnZ2K2E0Q0xuc2FsVTlmZWtFY29Sbks1bjFscXFYeW0wb21P?=
 =?utf-8?B?aWZEYzNIVWhyTi9ISTg2akZzcXlwemI1SHNJazVkQXVJbVBLb1VGb01XN1o3?=
 =?utf-8?B?WjdlTmd5THo3YXBaa2Jpb1REa1pLRXNVMFNEQ2hHcjB3VXFhaVRmVThRdGov?=
 =?utf-8?B?SnhZeTBScHp6NW4rRFZvNWd0eVMzZFN6djgxVFg4NW1hRXJMN1NQcVE5b0Ew?=
 =?utf-8?B?eE1NRmtIUTJvNkc5eDF4dW1CMkQ3NVhwTVBZZ0RlOXk1UDFUbFhudVA5YVR5?=
 =?utf-8?B?ditGbGprcW83SFovck9NSkRGZE1lRmtVaWorUXpWWHlEWlFEcWM1STNKUUl6?=
 =?utf-8?B?eXFyRmcxVEZvZG0vSkllZy9JNlVIdTljbWFQMXNUcER1S2w0RDlJUFlXSGVk?=
 =?utf-8?B?Tkhoa1pwRWQwQjM3dEtHbHU2aGVCa3ovS0pERzREY1dFb1hIZDUwN2ZIVldv?=
 =?utf-8?B?RElxZGlhck5RSVFRazFncGlhUmxTMFdwV3g5cGVsek1Bd0NWb3dWTnJxWU9N?=
 =?utf-8?B?dlQwVEVZK1BxWVZGME4xNC9FUjBRcW8zVFBsQldhT1JvMEhMSUg2b1ZSWWZk?=
 =?utf-8?B?QnlNU3dFdDhJdXMyZXoyUFNVdnI2b0NoQmtUTGNmV1h1QnF1KysyTHZSZlhN?=
 =?utf-8?B?Yi9MM1pObFB5RTZpeVBGYW1BbER2ZjFLeW5lWUQ5Mmh0SHlsZ214U0crUkxV?=
 =?utf-8?B?cmJHcVBFcTA5YzhtTmc2eHloVUl3MThSNU45QTlhYW51enEvTS9zcnc1SVR2?=
 =?utf-8?B?cEZpTEtnMGZkc0dtM3FsaXFlYTRJWTdJTnd1bUprSUEweTI1WE94LzZQcWR4?=
 =?utf-8?B?eUlJTXlnWjFmd3ZGdHRRenBnSEZ2U1pyc29vOTJKODI2b0k5VkNtNFV0emQ1?=
 =?utf-8?B?MXlBRlloR0NaYkh6aDJmTG55aHF3NEU2RVRVZFhGTUVrWmJkY0syLyt3QkJj?=
 =?utf-8?B?UzRJUndldnlDdUVEVE15N3ZoSTVjSlhGSWJ3ZjlsTktnaGJsZ0Y4SFBlZVRD?=
 =?utf-8?B?RGdvcndFaXZXN0xaZEg1dFhab1hoTkFiclRpc0lrY2x2NjZBbjRuNThGdW1Z?=
 =?utf-8?B?TGEyemtLeExIdmN2K0R2U0lCUnVuVVBMNzUvK2JMWkRRTmtBcFBRUEl4TmV0?=
 =?utf-8?B?eDhWYlZlZ3Z4NUFqVEF2Qk1tZ0NmTG1DanZlcXlCUTBkZ3hkZDVtWVhQbzh6?=
 =?utf-8?B?QnFaL0FSNlJpMFBBWnVjUjlvbDlJRUlwdXFiM2J4d0k4TDBRanFyeHFma09P?=
 =?utf-8?B?em93TVFNREJDdzAzMEIveFZxL25ickpCckFNMG9wYmtiSDQ0Wm5UR0s2UmZR?=
 =?utf-8?B?WmxzWWZ4VUtUSXovaDkya3RTeGVhQzRNWHJUL05HZ1g3eHJVY1c2azJteFNa?=
 =?utf-8?B?am5yc2hGNDVvNWV6US9JUFhWT0dOWUR0NlhRdG13N3B3K1E4TTA3djBqbnhK?=
 =?utf-8?B?NTFsTUFrWUliZTBsKzU0QStJa05QdWowdG9lMDNQeTd4Q245T1ZsRUlnbUZR?=
 =?utf-8?B?YldMdFpWR1JmOXRpYkc1UWFkVE5udEpNVG5CZDZVRmlnQlB5RThhSHh3Zldo?=
 =?utf-8?B?L0x5M290bWtEaU1vVnZJOUZSSThBdklrRU1zVHB2TVg4QmpEL2hoN2twb0p1?=
 =?utf-8?B?NWVoUzQvRnJ4UWJJOXZkQ3cvcjZFenNXb0pvdnZTU3VmZGFBMnpBcnJOWHpX?=
 =?utf-8?B?MUVaZnRaemxtcU5ZUjBMcm9JZWxzanl4NEw5VlBnbnJWei9VUTY1QUtocXMz?=
 =?utf-8?B?aG1HSEZYaEs5Wnl2RmFobTdaMFJ0R3o1Si95Q3AxODIyTU1aVkRzWHd4ak5U?=
 =?utf-8?B?aEFvM2N1VmxpMVdmam5vQVk2SXlMV0drdStvQXJKZTZzZ2tIY2toVU1XVVBn?=
 =?utf-8?B?NElxMnVlbVk0SEhMTlFtMHFrb25JNlpsU3RnVTVNSExHRmZOV3J0aFdmRDJY?=
 =?utf-8?B?RXZzeG1OQUtYQ0MvRGFlOFdKOXJtckNlNzdSZjlEUTJ3TE5wV2RNb1M0NDcx?=
 =?utf-8?B?d1E3elNlZXNRQlEwK1FJdXhyRmNCbmRKNVRhQm9UcExyNlBleWRNVkdobU1o?=
 =?utf-8?B?OTNkd1lkNUdVYThmc0xwY0RBcUpOYkJEQ1htT1NPMzZ2NE1BL3FWaDhIaHc1?=
 =?utf-8?Q?0qzk=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(7416014)(1800799024)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Kyt6eldpdWw3ZTF3MzRmRnNIWGQ3bENRb3gxYVdsUHo5Zkg4MytodmJzdlhU?=
 =?utf-8?B?T2lrWWpJNzRmL3dxeVBkcE9SRXFKOUVIZElJU05GNTNvTzRFYU04dTlmTk5L?=
 =?utf-8?B?QWJkMGttZ3ZOdkswYk1wcjhjaG9ZdGRTU1gzRWxQSVU2SzRPc3dGZ3lQQkts?=
 =?utf-8?B?Mk9wZHEvcnBHa1RjYlplWVlaUVJNb3ZzY2creUVCMm9qRVp6MUVnaUszaUtL?=
 =?utf-8?B?THZXUnpyTFJQeEZzdEkwZU90eVdBd0M1N0YxS2JkM0tXWHlhazZmTlkrUVdQ?=
 =?utf-8?B?RW1SRm0wYVRtYUp3SnZ3a1kzMG5wNDQxSE93cGxpalcrT3NXZk0rOW9COFEy?=
 =?utf-8?B?eDlGdkxWSTRQeUt6dHJXZ2ZBYXpIanVOR1ZPRTF2L0syN0N2L0hCSWJYUjI2?=
 =?utf-8?B?ZHJEZkZNUnlpdHVoMXFoald3VjBaV0xRY3dJS0RUb08xWVQ0a2grcEdBbmwy?=
 =?utf-8?B?alZsVjB5N2JaYXlPTy93a3dJcCsvUVpLeERVcDRVczh2WDdFbHY0bnZjMU4y?=
 =?utf-8?B?bnZ5clRZWDdDa1VDSDJ3a1ZheHJaVHdyd1pVZ3ZnVCs5eHRCOEJEOVNTWWZw?=
 =?utf-8?B?MTNXM2dOSDZtNHBCYVR1T0k2eU5HNm1YSWZXZExKTCtvMUczRGFHSENhaDNB?=
 =?utf-8?B?UGJFUmw1Vkh6b01QSGVtVmpWRGNMQlA5VjJxSDdmUkhDTDAwRzMvSi80SHQx?=
 =?utf-8?B?elFWNGdtU0l5UEZSa3dyV29LdWhBbVJrRHIwZ0NFbzA3S2gzNjE2K1I0RGZM?=
 =?utf-8?B?b1BTTHRrMEk1dGxlRWk5WW90aEdsMHF6T3pWZGE4aENON3VOU1QwcHlRTkli?=
 =?utf-8?B?YWtoWm5qbkVMUVRkTDVUamJEcnhLdERWQXdjRGk1M3JxR2hxU1pYSklqazE1?=
 =?utf-8?B?bXdVY3I1Y1duMmtpYzZ2ZkhRazVGb2g1K2x0Z2JUcXlXcmtQTmNxN09ZZmVN?=
 =?utf-8?B?V3FaK2dRb1pmNkRiREFTd245YlJkcUN2eEN1WXF2SCtLTzJiRUY4eHF5aVZp?=
 =?utf-8?B?bXR6VmZKSG41Z2VTZ2JtL3BuTUYvMFFha0FGdkZUSnBidlUzRFFQOGJHZU93?=
 =?utf-8?B?cGhYWExmM3lkVks1d3I1a1N6Ri9CR0I2Y2lETkFrVjRrc1lDdFVzUE1sVTFo?=
 =?utf-8?B?MVdWT1VENjJUOG4xQVhKd2NyaTRSa0orL1VJZWZKVDc4Tk1UTFc2WVRZV1Iy?=
 =?utf-8?B?MGxybS9KYTBkaStlVW9abFo0dkhadjFRZmJsQ2szMXZJUGQ5QmpIUHlzYVRU?=
 =?utf-8?B?SXFRRHhlZkY0dmc1bFNZL2JOeW1NTzZjOHNTdGNROGRjbzBGNlM0cXBvN2t2?=
 =?utf-8?B?dkQ4N241L281RzFVSlFaN1pCZDNDMm1FaEIxSkdWeFhKS0NBYjVjcHd4bU9r?=
 =?utf-8?B?LzhaVmRudE1NaTQ2M0xpWVZ0RGFkSzFYUE1BWWZ6a3dCOEdKSU85TXNRMFFp?=
 =?utf-8?B?SnlSWDJJV3FSbVJGVHhsMEtlM202N0ZTd04zNlhlYmtEVWJ2SXpkTytmc0xy?=
 =?utf-8?B?WnU4ZkFLNU9yUDVqWkNOWWZNdzduM0h5UmZWSCt6YXhYTEZpQlV2SHRBUVZN?=
 =?utf-8?B?c3lSZGJGMWZHV3ZQOTEzbHQwNEtJc1ZESFM3KzhXdUVoenBwK1pTRDA5dnFl?=
 =?utf-8?B?Y3BsNUZEV2U4VXl1REd1SVJUYW5DMi83SmJyWTczNHdycC9teC9Qd2svZ3pq?=
 =?utf-8?B?eGt5RDVIUjJiTk00aldoTnpzcnRKbnNQWHFUczNNNUJ2aGFvV1hqNEtyZWtp?=
 =?utf-8?B?ZHBRWjZkOFBCOVprdVMxRlEyRkNkUG5mNnZhcWZXZHZFS1V5Qi83c2FaVFo1?=
 =?utf-8?B?NTIxMldaYkNRV01JVitIVHd4b2VDd0l0bXFHbWU5eHFKdlg1SXVzU3JlMzJU?=
 =?utf-8?B?QnZoWkpmeTZvanQ4MHZhdmRkZHZjRDBzckgwL05hQVNFdDd2MTBKRWxSK1la?=
 =?utf-8?B?ZzFCNkMzZVpOc2V1SG9BdTVkUHF6Qk9ON1Y0anhlcWFMczdGd2RkWkVDdVM5?=
 =?utf-8?B?OVE0WXRDalNsaHpSQ1owT2tyOWZFck9wajE1TnVYZFE1MDd4eFpOaWpCaGRv?=
 =?utf-8?B?ZTJSdkxBRDQyUFgzK3BSMENEeTlIZkF1b3A0dGlPOTlzNlZmeGl6SGVBS0pN?=
 =?utf-8?Q?9NB+y0x03f9uj+svdDhyu5UKV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c993432-cd53-40d9-b6c2-08de3ea0e3fd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 01:49:47.5982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6it+hFHP1apXUYeptv68cQTlR8nJyaS2v4w7CMi6xAuxB97SFdWTrXnM70/sQRG0CCWx5ra/b84tYXfhe+nCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9495

CSI Pixel Formatter is a module found on i.MX95. It could unpack the
pixels received by the formatter and reformat them to meet the pixel
link format requirement.

This patch series adds a new V4L2 driver for CSI Pixel Formatter.

v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for device /dev/v4l-subdev9:

Driver Info:
	Driver version   : 6.18.0
	Capabilities     : 0x00000002
		Streams Support
	Client Capabilities: 0x0000000000000003
streams interval-uses-which
Required ioctls:
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev9 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device routing ioctls:
	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev9: 47, Succeeded: 47, Failed: 0, Warnings: 0

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v3:
- Rename nxp,imx9-csi-formatter.yaml to fsl,imx9-csi-formatter.yaml.
- Drop clock-names property.
- Drop macro IMX95_PD_CAMERA definition and use a constant directly.
  [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT bindings
- Remove the assignment driver.owner = THIS_MODULE.
- Assign struct fwnode_handle *ep __free(fwnode_handle) when definition.
- Update yaml file name for csi formatter in MAINTAINERS.
  [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver
- Link to v2: https://lore.kernel.org/r/20251217-csi_formatter-v2-0-62168af80210@nxp.com

Changes in v2:
- Delete "|" for description key. 
- Add empty line between child node and property.
- Delete labels for endpoint of child nodes.
  [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT bindings

- Update commit message.
- Use the value defined by bellow macros directly since they are used only once.
  #define CSI_FORMATTER_DEF_MBUS_CODE	MEDIA_BUS_FMT_UYVY8_1X16
  #define CSI_FORMATTER_DEF_PIX_WIDTH	1920U
  #define CSI_FORMATTER_DEF_PIX_HEIGHT	1080U
  #define CSI_FORMATTER_MAX_PIX_WIDTH	0xffff
  #define CSI_FORMATTER_MAX_PIX_HEIGHT	0xffff
- Use macro pm_ptr() to fix build warning when CONFIG_PM is disabled. 
- Finish route loop by break statement, instead of goto.
- Return dev_err_probe() when meet errors in probe() function instead of dev_err().
- Remove MODULE_ALIAS().
- Refine .enable(.dsable)_stream callback implementation, include bellow changes:
  Add stream checking.
  Fix potential pm runtime count unbalance issue.
  Add stop stream error handling when enabling remote subdev stream.
- Use __free(fwnode_handle) to drop reference to a device node automatically.
  [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver

- Link to v1: https://lore.kernel.org/r/20251203-csi_formatter-v1-0-eb9e1147b49e@nxp.com

---
Guoniu Zhou (2):
      media: dt-bindings: Add CSI Pixel Formatter DT bindings
      media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver

 .../bindings/media/fsl,imx9-csi-formatter.yaml     |  87 ++
 MAINTAINERS                                        |   8 +
 drivers/media/platform/nxp/Kconfig                 |  14 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx9-csi-formatter.c    | 880 +++++++++++++++++++++
 5 files changed, 990 insertions(+)
---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20251125-csi_formatter-e6d29316dce6

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


