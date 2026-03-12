Return-Path: <linux-media+bounces-55461-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEbSHtMusmmzJQAAu9opvQ
	(envelope-from <linux-media+bounces-55461-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 04:11:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A6826CAA8
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 04:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 761D03028EA9
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 03:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A1E38644E;
	Thu, 12 Mar 2026 03:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wlngJgWD"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013022.outbound.protection.outlook.com [40.107.162.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD9E387370;
	Thu, 12 Mar 2026 03:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773285048; cv=fail; b=pbGC833J0/XGzEi1/AiDC27fT15gtDi8PD4gIY1xFGxUiehgMoIuGhAhyEFrrhNWqINFQLHYbqz/F8VtkDc3ZGC+WslT9xu3QM5ojuOUttgpZplEL9QY4l7u+/1uaZIaGjO/jSPYV3PsXc0/x4ctyHjTcqZAlT4yBsiQ2/j3UjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773285048; c=relaxed/simple;
	bh=3iLYAOnvTXXbdZEOErhJAcIF1if6DLx+aha8Ih34YX0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KZ9M6FI89okhUKZvlqvYXJ96O2l1i+tVRFoc9ssLKMuZyBPDgYxDMjlhR7bh3d+tOcq1eCYeCS/dEeVL3OuoT98HnqpUzviSkACC8SeRIt/3LFJFF4bZGNDDTngkTQB+BRu/Huk2c7WQdf67vKFAK3zIzuFk4+d0NZSnmCebPOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wlngJgWD; arc=fail smtp.client-ip=40.107.162.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SykmdbQ6yLf773f8KbLh5ZQc0qJniq4tpfL7fiSbqLMDHqFFNh4OgL5eXLg/U3ddTCUcUBgnEHJt2IhRybA6Kw6EgDIboxl9Nj0qPHF/gjBnlE4UmP+6vZFuTfUfpu8P+9WOaluJkLv6vgitprgwFjweJSeBD2qYUyJ6qq3Fyp6v/smroTqE8V59GRXNmsbLdx5ar0mH3KGanJ9Zfttf20YPSLLtgbVSM+nJGuc0vAJs+CqV2iyl03g7bPhzP7Z/Y5ErkQbZCbB4ePAW6ye+5Y2TgHCyKqzbqZ591ECiv0uDeEz5RXeff6PdTp7vtpWBn+MnDO7ecVsOdgAT1yRsog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKSGqPdE6DJn1Eo4LG+6WKmItdHO7UN/qIcVU1uhho4=;
 b=jDUDhCzeF1CilmtLq/ZM0bkQQUYKUCjJnC6SNPgvyyJeY7PrDaW709NZ6VPj23/7O3TbIGwj+wzDTgMVBLO9cyhXERB7lhgV2Y2QZdhK6wl6dE9QnNy9h7o/rCY2SgysChqMNnFVF7UttZ5fzaxCstO/HtoA0siD5wTvWCpZbjPkZ1r9xFCEWBRSOR8ssHkRsBCe+LBvCB5ykr0Im8aCUShTtd+WXWSU0SUG8+9GSaoeEn29PoOPt7d1dTnF3HreMMuAHU3woIyMwZbfxUjuQWUy4vuZMwmVl+EsLU8tPxAI7uzxJ62IVYkp4St0A66GsLhUVvoge8oo0I6pYPA7Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKSGqPdE6DJn1Eo4LG+6WKmItdHO7UN/qIcVU1uhho4=;
 b=wlngJgWD4X/SuIlgfA2ZQmuOIthxJz4KS7kYcyPjdmQi5muWh3EO9PIds03FhVKcRMaPje5UAJelJAAoeJkL4rpuHpkLuBWEIMCx9t6/JWHIomvEgIYzuvm7wT+SkNwEXeg4yzZpNKd84eIcF73bVR5d09fXgEyamDFB36CDX15sUAMBbkRhwYEnQTnw3cqgQRv+jmQYKAE+5gbaHMeoYWoRhxqqSMkrHPQjuCOdkvQYt7Jw4cr1Sa+ctjcTRjFSvZ0k4j2aBQ90P0wcXof8LlCmAbxTVGf4OHdl5dDdiqKcEzE5Fpju8zxkG2HBurb3v5asV9YNWzIKjlRzk4lB6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by FRZPR04MB12395.eurprd04.prod.outlook.com (2603:10a6:d10:1cc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 03:10:42 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9678.016; Thu, 12 Mar 2026
 03:10:42 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 12 Mar 2026 11:12:34 +0800
Subject: [PATCH v2 1/2] media: nxp: imx8-isi: Reduce minimum queued buffers
 from 2 to 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-isi_min_buffers-v2-1-d5ea1c79ad81@nxp.com>
References: <20260312-isi_min_buffers-v2-0-d5ea1c79ad81@nxp.com>
In-Reply-To: <20260312-isi_min_buffers-v2-0-d5ea1c79ad81@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexi Birlinger <alexi.birlinger@nxp.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773285164; l=1751;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=xvfzel5V/k8gZqxrq7uLcg5//0SXpMUowgySfIB84AM=;
 b=z4ZtB1iuJ2GHpYQgMZ+4CZTa15a4ow0qo+40sV6k2eAvWs8yBqc4PDKe+FOaMrGhW4QURcVTB
 fdW98GY+QX9CgfrOKa+JgcmPEp765CK0YSBOYrf/CM1FbDHknhqFumX
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0231.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::7) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|FRZPR04MB12395:EE_
X-MS-Office365-Filtering-Correlation-Id: 617b969e-d8a0-43e7-5c5c-08de7fe4f1e6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 JlnA6Cee1dR3JnSTxsjGfF7mTwmEXZ6OSZgs38OZVNmSs1l4sWLHO6xA5BOTMww5wcicpptnU8VNn4RPk/cBk50I6VbsrWi5TNjz2gKgjgK0gMr0dasGe5s4PCvIGvEc42Ulb/ueV7YMCUR/WHO2mxwNzHmJcJC9mr1u1zmwOxwLXkAe3jWsfbA+ncwx8uT9IkBf/KxFcuJD9SuSkxcd+7FbbrKlCLK0z7cMCzJQAuim/pem8x1Aj1aEE5z1l4O4zLbP2ikSbLdENsDkzqIN4Qu7xziV0jui/OtURrfBJArWXhhXZ4CQadHmp4SVnHQgzc6h4vCZ6kDtK5sLTCsSOap392VwZFiWIL73zEsx22eVcHXA7HqatOZq+TKz0JJuikfutJu2lP4IKHUZRjvaZUsApw1B7DicJs4sxrMRdw5wMUNkWfMxW+3MxEpOTSZVSw8MjMk5cH4R3tJGB01Scfn3TMcLvyzC5eTyv2HpvF1VA0gTP318VVXl5uRMfH36a7bTUVEZYUzHb9MWaHELYYfEzuB6hucOJQk2Fk0Fzm9huOAfnm/ToqE8si570Nrbob/qKUs5Lx6S0PNdpdwpIFXyp+Jl6Gx5P6w3DTXJT4xIsJMS5ZLHhEpVXif5HHyPj1nsM+rVtdU7AEBv9a43y6HrH5tZGUYSe6bT5Kl0b68oUM0qUV4BAGEq00g8G/quFACYh5cmDHY3ZLcsR+LlX/DVWts8I1JSAVKIAEK60Vl2uNzFZaBwI48+m7SU25Tb
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NldYaG1EV0h0ZDRhVGo5bDNoc1lNYXlBWDVSZ0tOVHdQeUc0WUxMT1BvNkM1?=
 =?utf-8?B?R2psdW5SM1BIOVFSdDhqZmVzSzNBMWE5clQ3dFE1QnJrMHRRbnQ2Y3pkZWZL?=
 =?utf-8?B?Mzl5QmdYeXRPaDRlemNyTmhvVW9ybFJnd3JsUmp6ZXJsZnd2cHhESCszcVVV?=
 =?utf-8?B?T0NVQnJUVCt1Z1d6NnIyNlBiREx0TTRXM1RKZjFmY0tqTk8zM2dUVGFXNjhW?=
 =?utf-8?B?ZXhTMWVOeDhxRm1hQ2dOQUU3OTZnVmgwZjFzc0Fvb3dSYjEySmNFcDVpWDFY?=
 =?utf-8?B?cXhGUHJpcFpRQTE3b21tbFY5UngreVhVT2pyVUF3UXRuZzdxYU55akhHeUQ0?=
 =?utf-8?B?ekFBdjFzSVZwU1dGbjJpRWFGVndJZjgxVXdBdUNZd1hCTnJPMURJV0hFRWVq?=
 =?utf-8?B?QkwxWGxudHFqamRndlpod1UwZDZubVpBZjNWQ1ExU0Ixa1JvRVZRemNLck12?=
 =?utf-8?B?TURnN1YvMXBpcGk4b2RmcW5hSFM0V2pKQUt5WUtRZ1hrSU9jeU9wUi9yT3FH?=
 =?utf-8?B?U09vZ0Y4RlQxRW5kR2cxTnhRcVlrK2ZOUzRVSU9tMFJoZXJEMzFaQzF6WXh3?=
 =?utf-8?B?TElUN1ByamNXc2t3WGNIZWdvcVUrQWJ1WGhuOGlCOE1WZmo1TC9xc0p1b2tJ?=
 =?utf-8?B?SC96WW9iNGhybDJwM3lZdWdrdm1ueS94cGV4R01JOFRBS1pTUFdHZ2VocXlC?=
 =?utf-8?B?TFo5S1BROHM4eU13Yy9haGZyR1lGUXZnWXNtY3BIamhENUV3Rko2cVZlQ3dB?=
 =?utf-8?B?NWZQYTVJQzFpQzRvN0JpN1YwaFZQSDc2K1gyN0lYbnIxUDdIYWtYK3JIbWZq?=
 =?utf-8?B?NnBGZE1sMkFkZVVDWlpUZndPTUFXMTJKMmJIMkNOY3RNVENQckJkSHQ0UWV6?=
 =?utf-8?B?eUQ3MEJMbzZBNHQ2WFEyOEpUVEoxZU5WV3JjTkRBdHpSNUJkQ1NUWmx4R1k2?=
 =?utf-8?B?S2FraUcvTzMrT0VzUVlvbGpmdGFpandtZjRlWDBGWEcxcHNRYitqdGFvNDJu?=
 =?utf-8?B?V2FRc2J1Z0VZcDVXRlVoVHNuWGhpRmsrMGxwbm13clIrcCtOTU84MnhvbzZ3?=
 =?utf-8?B?NVZ4ZFQwci9oakkrNGR5Z2x3M29WNjNvWVpKa0Njd3U3bmc0bHMzN1FKNDE2?=
 =?utf-8?B?dUkxVGNDUmp0RDV4bG9KTHVXUDdrQVJOUzhvaTlYOGdENWRBNjBVTGZwSXl4?=
 =?utf-8?B?Ti9NdlZzRkk3bnRqQU9CYkVuRkFJOWFSNEIvd0czcjV5eU9GNlRnUXNoYW5C?=
 =?utf-8?B?QW5CSDVoOC9xNVVkT3JRWFBjNGg5c1BBMUNveXUyQkFUNXBNV2h4MnlCeHNK?=
 =?utf-8?B?QXVCcThBWnVkbnBYR1VzVys0QUs5Zk9FKzlRb0tzMU0vN0RhTGNtdTNKdjhF?=
 =?utf-8?B?akJWOUxBcmlzQTFxVHpYaEtnekNqUjlZRVBuUzd4dzhRam9RTGJteHZuMXhB?=
 =?utf-8?B?WXhhMkIyZjBuL3h6aDFwTnhMU3NWT294Umw4YXJGN202MmhSWXpWNFdscUhz?=
 =?utf-8?B?S2pMSTc4K3BlRmFYR1AzbGpMb3NnUDlVYTJqVVp6QkNQeHJmeTk4OVpRL3RX?=
 =?utf-8?B?RTNIdHBUYnJwOWc1Q2k1WGd4TnZuNUkwVE90ZjRKOHVmekR2cTBtRTROYlE1?=
 =?utf-8?B?TldHVGlWYUhDTm0xK0J3d1pIMnpLcWJXS0Yyb1hLMTF5cGdwRU9Bek9WdlNF?=
 =?utf-8?B?bE55VXlBZXpobndlSE1IMzc1ZktsOCtVbTlQa1cramlMVnVTc01vVC84V1V5?=
 =?utf-8?B?bVJRTi9QSGJadVo0eFFwWDh3OWdIcFNBVUhnVFpHUWVRSjdoeUd2aFFVTyt3?=
 =?utf-8?B?a0JIa0ZwMGQwQUlRc0VRZnVNRTB1cVFRV2lYNXNKTDVxYVhpMXMvV0hQTHM0?=
 =?utf-8?B?SnNUMU1QRTFsWm9jWU4yZ0ZUMW8xTlpRMU9QZnNYVG5lTWJ4cm1rUkhNZm1l?=
 =?utf-8?B?THFFbnBvc0NxMCtnWGJiWXZRMXZPVmo5NXVMMzZBWFN2TEw1OWRvQm1yY2R3?=
 =?utf-8?B?VE5vdDI4M2lBVytPZCt6YWxRRTVjRUExQXlMdmlOYkJpYzl1SzY0QUxQNW83?=
 =?utf-8?B?eEhXNDNwQTNIQmpTSTh5SmIyQU5jb3NvVys3RzA1SjE2Y1NPV010QjN6RnQr?=
 =?utf-8?B?dlhEMzNyOFdjVndTaVF6V0FMYndnNElRUWtBd0Iyd1RLVzNSV280TkZqaWt2?=
 =?utf-8?B?TXZaMFBrUnpaV0VEb0hBMG9HaEliSXpUQnJuUmZCZ092SENuRVM1QXpHdUw3?=
 =?utf-8?B?empYZ1dqZXE3ZUNXZGdBWmZiMDA5MHI0ZzgwRmdmZEtRbzRTR3VraUNWeHN6?=
 =?utf-8?B?OFpXR2RleWpkVk4zTUxIejJJWHJ3R1hRQlZtQjV6ajNZQVRUK0Eydz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 617b969e-d8a0-43e7-5c5c-08de7fe4f1e6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 03:10:42.2664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IdfE9M+2JF2QimR3ZRUWpxf/T/KQ8E+3DCRAEgcPRAtc4Ep0yx+a4hVXIb2bH3G2Ow7Y7nU5BTeb3ceDBG7+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR04MB12395
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,phytec.de,jmondi.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55461-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 10A6826CAA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Fix a hang issue when capturing a single frame with applications like cam
in libcamera. It would hang waiting for the driver to complete the buffer,
but streaming never starts because min_queued_buffers was set to 2.

The ISI module uses a ping-pong buffer mechanism that requires two buffers
to be programmed at all times. However, when fewer than 2 user buffers are
available, the driver use internal discard buffers to fill the remaining
slot(s). Reduce minimum queued buffers from 2 to 0 allows streaming to
start without any queued buffers.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v2:
- Reduce min_queued_buffers from 2 to 0 suggested by Jacopo Mondi
  https://lore.kernel.org/linux-media/20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com/T/#mcd4b7dcc218a02e2f218ba2c83b947ccefd9308b
- Add fix tag
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 13682bf6e9f8895bb9eb1f92d5f74b0d5968544e..1be3a728f32f89338a75ddcc4e96e7501ed954e1 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -1410,7 +1410,7 @@ int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->buf_struct_size = sizeof(struct mxc_isi_buffer);
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_queued_buffers = 2;
+	q->min_queued_buffers = 0;
 	q->lock = &video->lock;
 	q->dev = pipe->isi->dev;
 

-- 
2.34.1


