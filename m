Return-Path: <linux-media+bounces-40658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA6AB305AB
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFA15AE5DED
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CAE313520;
	Thu, 21 Aug 2025 20:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Zf+WGjya"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011050.outbound.protection.outlook.com [40.107.130.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17362E9ED0;
	Thu, 21 Aug 2025 20:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807379; cv=fail; b=lzP/kopzsvd+Z/SXfw02xbkhjN4VbqujHF5oYd5vFIidXnc9m47oGqA+GrO6RLNEaJTZRH53h/hTThjIyel2PMWryPtts2U2VzxbqBKt/LcnQAyzottvL+o8cdR0uQFzcziWRo4giRuuLIc1IK5CVUk48P6Z5Y/yh6VvGJlmYmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807379; c=relaxed/simple;
	bh=Fmig6UFR5T6LwkMsKHH1h1Ci1nR5Kq8Nzznokeotcg4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=M3+Uug2Zz00R3KlqeH5W6UnWczakC/PcRiI/BF4+hJYBCLEYEhdepaCsBcSXJKgn6J+A+JnF2NjaEaIzcRlOx1Q9nDSvSQ0NGaWL99DPgj7XJWu4mT05Ft6mcWgrqJD79XZXOJdqZfD4ijKvFjuZKn5/AwCkEZ7I0ng9HFfA19Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Zf+WGjya; arc=fail smtp.client-ip=40.107.130.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIqchdrlSGBm8a79rB6Ge2XVz1K0VdY0Y9grKWMiFLpNHAI/MOIlQnBoeb+onQEUk2k6g35KEdFCQEHFjgeoLrgi/eTyQJizEhCtmjAOmMlCFTMQFcEh0gETnaNfpzfwvcVzFQCrLHtcxBYVdtKWZWV1V1hEHuKzkQGKHIjgMqUpPq1QhuIENCOMQnUQTvBsRssFzPXsmy6juj+yh//3caQEHXdA/JHgMMTMg8wphmhR8d+qrfTXrXYl5l6mKqGqLh2b8msn1+wRzJWXJHqiGq46td0GedVm3scoZkAMJWyS3lJcq4UAzC3jpngHu7B8qvSZje5fFSL1VRnyyqCl1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6DUzJksOmZDw1eCTR2/1iQdFMBTUrjcEDfpbH9VMXg=;
 b=i8690oBCI4/3JqYkb5jKuQieTyiqQyqrLo7JUY4pJhH3NjAIwd58OkdldyazTU+L7RRFLGEWhrfHyFfniU7yjyyRI3BAwP4sDbOj2b22DZ2kXDHPl32G7/66bOg9DGV19wyJoLOy3gybwI6OaMLcAmLLFE1hebDFcIADIe6ur3AmDazFiHqxW8R95DyNkaF2iyreAbGgNF6llfCG6VPBDMtR8aLSPnnIFUq3mIXRi0zZXlyc3TkZQmLFTIjHO6dPhWjB32/thfOnMbpTLOR7f0ScZPlY25B7RoaShCrEqGlANL5NZXAgMjo7OUFs8QsmdNMBPOOvTYsAVTcsCJCKOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6DUzJksOmZDw1eCTR2/1iQdFMBTUrjcEDfpbH9VMXg=;
 b=Zf+WGjyaixgDyiY5pNbN1tFjP4exyglEcvEQfT3WNq7BMZG/prdo/EqaeQyLks9z4jrg9UNN8McaIYRXYorWuCnuWb//EJonDXATMKGCpiHoIoF+wOScSzxZSqUPoFoMLUCrDaEbS/xGUs8aHSN+Wh7JxPa2en82nzarf7t6Lm29kGsFOY8Z3kVm2Yz97nES5e/ciG9yZFhaxPf17h1AizvfIOXcYLCRvglG1Bm38pZiaiCkvJnmfwQB520lBguA4ZyyfiKkxt+1unKYvmFehs0oPCgMfHm5jDGeLOsI2J46mw0T4ruLp1UmSQTyXEtsN4eUTddt0GxArFjy/FBhWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI1PR04MB7181.eurprd04.prod.outlook.com (2603:10a6:800:12a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 20:16:15 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:16:15 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:36 -0400
Subject: [PATCH v3 01/31] dt-bindings: media: add DW MIPI CSI-2 Host
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-1-c9286fbb34b9@nxp.com>
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
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>, 
 Luis Oliveira <lolivei@synopsys.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807361; l=5433;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=DWX1jA2//m1GBlkbCXbsa8qsz145e9p/CEF0IT01wd0=;
 b=cEpZs49PVIrO447k7Z0DoMFfiBdHpg3kvShub+LrJe0tSP/WP7Yj8hSwVXxPuvbMQtKooHTAt
 3Fra+WYzDfTDqyUS7LWfSgnDrK9Ws3m7vTPbtX2HIV1vRXr/RxoKhsd
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
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI1PR04MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f11747f-2474-4a37-81fa-08dde0ef947c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?N2UzUktza0s0S3hyWlBtYW1UVzY1d2ducjlhamRNVTFnMmRQeHZWa0xwL2tM?=
 =?utf-8?B?R2JzNm5JdlRzVDRIOEoybTlFVkM1VkdtT0VFRXFQWkZkVDJVUnpzaFFiWm9R?=
 =?utf-8?B?aE9ZUE9pZ3g3Sk02WlpoVnhVNEtXR3UvTkpTb2tRakh4cmNJczB5TmdOMHFj?=
 =?utf-8?B?T3lyS2I0a0hRWjN1QlZWdWNIL3Jrd0dzbjFycit2TnBqcnZja1NNTDA4WFQx?=
 =?utf-8?B?V1VGcWdtVWt6WitRYjhUamlKMjYyS0t0dnBXZDdMcCtXRUdGUXZZM3o0UGs3?=
 =?utf-8?B?cmlJRHdFSlRTVzlRSTZZcEdnVFcweVh4Q1lYNlBZNXJRNGc3SU5rQ2toRm5J?=
 =?utf-8?B?TTUvT3c1cEY1dmMzUVN2dkFaVVQ3Z3MrSWNyWEJIZTdzYUdEK1E4U01ndk1W?=
 =?utf-8?B?Zy9mQnFVT3pCZHFaelovdy9WaW1Md1JIeEZKcjBxWmQ0S1cydEtrWHZJRm42?=
 =?utf-8?B?WUV0eVhQeW1scmxRYXRvRzE1WmF6VFB5V0J0S0xVU3BJZG9BM1YwZGtYZEh3?=
 =?utf-8?B?ZzNvSDNwWDJqeWxmRzdkQlJGMjlNZ3VCdkJXVUx1ZlpXaWV0ZXZ1Yy9qa0lX?=
 =?utf-8?B?VGIreUdFMHlrTUtCaVRCbm5IaDVsZDVEMTd2d25OQTFaU3E4RWY1UG4rNWhl?=
 =?utf-8?B?UnNyQVFuVkFCTk5WK3RMenRvd3Q0VHdrREh4Nm5NclRHZ1RTc21WU0Y1UjQ3?=
 =?utf-8?B?eUd5WnM4MWdXcmQ5L3E2ZFBjS21BSzVMT0dqdjhwTUtnTnpKVmtzYS8yNHd6?=
 =?utf-8?B?MmtuSGN5ZHAyK2ljUjU4bDRTMzREdnJ6WnZ5TjJuZnkweHpSWVhlbDg3MTBp?=
 =?utf-8?B?NWsrRUEzcy90cXVpNVZpc25VZ05mTnhlb0ZMMnlIcHduakNTS1ZSSmVGbGFm?=
 =?utf-8?B?NGJEait5eXlHazc4Y2w4SmkvU3VTNU5KWHpYTG5MOUZtM21jbUVOM0VuTk5I?=
 =?utf-8?B?bC9XeXRGOHMwRVJVaCtxNGVEM0F0LzFkelhEc3VUdVRPanJZU0wyZXF3L1J1?=
 =?utf-8?B?cTJ1azllUlJpSE43TjFLNFRDNW5Kb3J3ZjhyT201ZDdYTGFMSngvM3duVlRC?=
 =?utf-8?B?Z3pGQnhNTDQvaHdtZ3k1REFKUVpTeTRqWVNYZWVTVFdLWFZndjIzZGxzY2lS?=
 =?utf-8?B?SWoyQkJYVDFHV3V0OGNxTS9sbUhQVk41NDJJbG9NSmlkTFNPc1pBSENnakxE?=
 =?utf-8?B?cVFvK3liTE1WS3cvRWY2QjlHYys4cE9walZrellDY0E3OEtiQmFGYmpZZ2hm?=
 =?utf-8?B?dHZxMDdMMFM1M0lKOFUxY0V3US9EWEcxNjczS09GMC9iNE5tSnFhNklWOTA4?=
 =?utf-8?B?dUZaNlhVWWJqZTFFRjJtTkk4UFRrZDdvMGovSW1uSjQxRngycXZtVFFuRE5n?=
 =?utf-8?B?WVJLQ3orNjFSaUZqWWhGRzV0NE1hK05Bb29oNG0zMlVHVU9qampSbXlSVFd1?=
 =?utf-8?B?dzVubmtmdmhlajRGSm56NVVIZ2huUFZKR25ZbFI1SG1BVXJWUGxOMUsycFIv?=
 =?utf-8?B?VWJsMm4xNytqY1JCaG1qMnAwcXJXZUhpRzRkMjJvUUxkRmxIZVpjMHZEMUZ2?=
 =?utf-8?B?ZGxKRnk1R012dktBTWR1RmdOL0hkSEozM09nU2VTR0h3b2w5SnZlYnNUWlJt?=
 =?utf-8?B?TDJzajN6MnhIbTlaS2U3dnVLdkN1VldLemFNT290Uzh5TXZqZ1dBUVlkdk5N?=
 =?utf-8?B?R0VXUUM2ZEFRTDFqb2Uwb09yTUNacjZzd3ZiSjl5ODVoNVNjTjBIZDVLYTVZ?=
 =?utf-8?B?cWlMbDhxd3M3Z3hHdUYxR2JsR1ZzeTFWMGlkS1VqWGs4TDFabXJzRkpiRFZ3?=
 =?utf-8?B?cFZEQkgwVVJkTWNwaDFkWGtkMXBDOHRKNytHdXlWeWFxTk9jSmVCb0dMUjNh?=
 =?utf-8?B?Z09vS0tPQ3JGelVyMnJlUnNwaVF4bjc3YmlvZ3RoRm9PMk1KS3BiMFYza1Bh?=
 =?utf-8?Q?64NWPf5DSFlnNhQG3t+oVQaMiNxEqvWG?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TC9uQ1RJZk4zWDFWczVMRkYwUzdud3ZhY21RbXd3alArNDUwRG1CQ0xZWDZE?=
 =?utf-8?B?bTBjdHV6QWNzaVo3MUsrUTdWbXFVSDQ0WGxMUFZ5R3pIb0F1RlVORmszSmVO?=
 =?utf-8?B?K0lReXlkR2tyWFJuZ3UvWGc3Z0dmZGpiWUZSdG9UTmE1cGxpVGVGM3VvalRp?=
 =?utf-8?B?OG1RNnRiQ0VNTzZRZkRQamp4TEtueTVSdm1JNFZoTytjOEloamJpbzFKakEr?=
 =?utf-8?B?ZGl2WjNBVUlHaGMxSFhWUys0TDRPZkZBQ2ZaZDltSmZ0UlNLS2lGYUFjQWZi?=
 =?utf-8?B?NzZNMTIvVTY2M0ZQcmMvQkhmK3I5VitJRFdGNTFXanlNVWxDSmNVVEZ1SmlT?=
 =?utf-8?B?ZjE4RGR1Yk96R0gzRmVveDgwYllGNm5UWHVJdkZVaDlQOE9CclJpdVlBTjJC?=
 =?utf-8?B?aTkvczh5czdGWDk3THJWMmdvYTNYeTd0Z205eWRESldMVHM1dFFrZzFZc0Ry?=
 =?utf-8?B?R2JKZllqeThKWEFiOHFwRFJ4a29RTTJHR2xlWFhTZFBMSXZaSk83bjRJY2RY?=
 =?utf-8?B?VkdkQ0FOT2VNMHhPaDRRelNOTC8xbW1USlIvam1rZlJWc2xyV3NHajlWQ2sz?=
 =?utf-8?B?RHpGRVVoRWg5U29rWUVoeWZrNnVLdjlBMS9uTUtVS2x1bmQ2Z01neWE1Tmsw?=
 =?utf-8?B?Y2VDdnhSUXFET0x3TUtNb2tSN0N6OVZaVzNWWDB4N1gySkgxQWd6T0tkb3Rv?=
 =?utf-8?B?YXVlK3RHUDJFUEhzSkxIaXhXNWhIc09jK2FsWXFwVnBLNlBYQzlTRHZhU0RZ?=
 =?utf-8?B?Rzh0NDRZcWd1U2hnUCtUbWxmZlZ5L2Y2OVFiTll3a2VGUWkzSkpFU05jTGtv?=
 =?utf-8?B?MHBNMnUzblRML2tlMTVoTW5uYXQ2ZDJwM0Q3Y3k3OVh6K1RwSU81M2xhOVZr?=
 =?utf-8?B?SUNMZVBEVUVUR2ZKYnVsU0VSREU1NEJja0dJQklxZGVnbjdET1N5MkVxdGZn?=
 =?utf-8?B?WG1zRHBIdjZZTUNwWXFlVEVUaGNEZFFJSFlLUC93THo3NW00cjdaUTNoUno4?=
 =?utf-8?B?ZzdvYnM4QnBnaG9OaGtRam5RTCtneWg3VEI4ZE1Ddy8zZW9MNjRhSU9xZ1hO?=
 =?utf-8?B?U1NMeEhiZTVCRW1wUkJaWEU3UXhLUUFJSEJzQURYOTVGa0loNGludTF2U0dp?=
 =?utf-8?B?cGsva1ZPZlMvVDNvWWswaWJIL3ZwVVdpb0hOOURtUmFaYlJBV095ZEhXYStL?=
 =?utf-8?B?ZTh6Q0hrUDU5c0R5NmExN1ZLYkIrVzRpUTF0MG5CK3diZkVOQ2x0TEdJN01V?=
 =?utf-8?B?UlJhek9UckxlS1ptbndtbTBjK1dVVXBSWE1jZ1FCUXd6QjVSMERQT2V6Z0JI?=
 =?utf-8?B?djMvaEhBRDRUOWdBNC93MHVqNVhZdmsxWDIzbGh1eGFoTFl3ZXg5LzF1N3ZJ?=
 =?utf-8?B?UUtLeXhlMG5IV2pKZ2JEM3ErcTNkZ21tTks4ODk2SXZRMTdKeVByZ0ZpSEZ1?=
 =?utf-8?B?WWpPdjZCNlB3cG1GSFU0R3l2T09FQ0dpTFl3YlFMRGRBUUhXZ1doSWM1aW0y?=
 =?utf-8?B?YitPMFhPWG03cVpoWThjVkdsS0paK3gzU2NNV0tLZldxTXpoaVJhYzhaUC9F?=
 =?utf-8?B?ODVYbEtzMjQvREFNYlQ2anZvOGtjRWtYcWpMcjZRS0hEMnZTb3pSTEo5ZXdL?=
 =?utf-8?B?bEFRS2h5am1lNndjVzllK0ZQWFlNS2toZ3JScEQ5VzNsVWN0QmdBQUFleHRm?=
 =?utf-8?B?OU01OXpkRDY0YnR3TWJVdmxiMHpXYWdHbHg4d3lHTFJ2a3pwY1kwQy9zR1FC?=
 =?utf-8?B?QmNVRUFOaytJVHNJbmhDQjJBMXA1TDF3ekpTdGdLa3REd2h5c2VrSGdkeTlG?=
 =?utf-8?B?b0cwc2F3d0hQQVRGcmhJbmxMdDhxTE92eUdwWkRIYWlyYlA2bFRLRWw4QVpY?=
 =?utf-8?B?UE9vOTRVT1B2TVRjNmVwT0kyVVRwK3NuL01nVytrTm1naEZlUDVVcnFxdklP?=
 =?utf-8?B?cW82SndjS2xDNlVNRnVSNi9xVGkzeUZzRXVFOTFWbXUxY3F5V3hNTzIvd2ZY?=
 =?utf-8?B?aGMyQWN0dFFwVml0cGxRVXdEV0Q4UFVYK1VxUUtJckhYdlQyR09QVHN2UTF5?=
 =?utf-8?B?NEJ4VTJhSm40VjdWTGNEVHZadGNaTm5iY2UxbW5tOW9sRE9CSDBRaisvSWdi?=
 =?utf-8?Q?VJRUmEDgnNsmX1sF9bvSCN1Tp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f11747f-2474-4a37-81fa-08dde0ef947c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:16:15.1191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XgzO93Ten1mtydg/pznXeuu8YSH5gcKhZQU8Zptj5JOH9BRKh7jCESoDBfBQBqeYgELHh3fWVirFO1k/YTQTSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7181

From: Eugen Hristev <eugen.hristev@linaro.org>

Add bindings for Synopsys DesignWare MIPI CSI-2 host, which used at i.MX93
and i.MX95 platform.

Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v3
- drop remote-endpoint: true
- drop clock-lanes

Change in v2
- remove Eugen Hristev <eugen.hristev@microchip.com> from mantainer.
- update ugen Hristev's s-o-b tag to align original author's email address
- remove single snps,dw-mipi-csi2-v150 compatible string
- move additionalProperties after required
---
 .../bindings/media/snps,dw-mipi-csi2-v150.yaml     | 151 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 152 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d950daa4ee9cfd504ef84b83271b2a1b710ffd6b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/snps,dw-mipi-csi2-v150.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare CSI-2 Host controller (csi2host)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  CSI2HOST is used to receive image coming from an MIPI CSI-2 compatible
+  camera. It will convert the incoming CSI-2 stream into a dedicated
+  interface called the Synopsys IDI (Image Data Interface).
+  This interface is a 32-bit SoC internal only, and can be assimilated
+  with a CSI-2 interface.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,imx93-mipi-csi2
+      - const: snps,dw-mipi-csi2-v150
+
+  reg:
+    items:
+      - description: MIPI CSI-2 core register
+
+  reg-names:
+    items:
+      - const: core
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: per
+      - const: pixel
+
+  phys:
+    maxItems: 1
+    description: MIPI D-PHY
+
+  phy-names:
+    items:
+      - const: rx
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port node, single endpoint describing the input port.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+            description: Endpoint connected to input device
+
+            properties:
+              bus-type:
+                const: 4
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+                items:
+                  maximum: 4
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Output port node, single endpoint describing the output port.
+
+        properties:
+          endpoint:
+            unevaluatedProperties: false
+            $ref: video-interfaces.yaml#
+            description: Endpoint connected to output device
+
+            properties:
+              bus-type:
+                const: 4
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    csi@3000 {
+        compatible = "fsl,imx93-mipi-csi2", "snps,dw-mipi-csi2-v150";
+        reg = <0x03000 0x1000>;
+        reg-names = "core";
+        phys = <&mipi_dphy_rx 0>;
+        phy-names = "rx";
+        resets = <&dw_rst 1>;
+        interrupts = <2>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    bus-type = <4>; /* MIPI CSI2 D-PHY */
+                    remote-endpoint = <&camera_1>;
+                    data-lanes = <1 2>;
+                    clock-lanes = <0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&idi_receiver>;
+                    bus-type = <4>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 9d9d2be7be8037dfa96f1c9edd24a0cf997b9393..ecb7bc7cc8ad797f43173075ca8973804bf335f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15334,6 +15334,7 @@ F:	Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+F:	Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
 F:	drivers/media/platform/nxp/imx-mipi-csis.c
 F:	drivers/media/platform/nxp/imx-parallel-csi.c
 F:	drivers/media/platform/nxp/imx7-media-csi.c

-- 
2.34.1


