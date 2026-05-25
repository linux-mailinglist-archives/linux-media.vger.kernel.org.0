Return-Path: <linux-media+bounces-62719-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJovBnVVFGp2MgcAu9opvQ
	(envelope-from <linux-media+bounces-62719-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 15:58:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7263E5CB6F6
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 15:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 375573025D23
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 13:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E0D386C0C;
	Mon, 25 May 2026 13:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XpPUPIJZ"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011063.outbound.protection.outlook.com [52.101.70.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE0430C17E;
	Mon, 25 May 2026 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779717454; cv=fail; b=dLJuMUPUMJpFsDJxGm6mV6id4rup2UaISQ7+oKU0Rm9ZGcfV0X7ZBS55OM6cNTgB1LjHHY/FY+xyzVY2AZMQdqx9TIt9LSrzjLg9xe4k1afKVEOeV292TF2hbk+BzgfWbFkuNAyPP0J0cSx+BT88ACqR/ZoUci+3Kc27Yxw2Sm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779717454; c=relaxed/simple;
	bh=VjaSl2AKNyHO0kzoBVdNicA+t45RvYW9g7bb3subFgo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Cw9aVPWXhcwdHtvWpdCrhUKLaRNIgDybNsPVCcWRCGarZv+V75HRRIGKH+TezwstDJsvZuIyAGsZjAzmJSeALEE65DT16bnZcSw1ZDARDQOkUrYOK5rqeeCQPHgKfzl/Xa+DxnnZ4zvlpL2OqfMtmodSdthgUnyq8tYhjizS8FU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XpPUPIJZ; arc=fail smtp.client-ip=52.101.70.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbelYM0vqdH9qiBjRRolUjdyjldlIbjOSRKG+yPgw/vN9C5Vc36aLbqS/zYZvHuHEeXrQPWai4015pIXmOfNGDCC6KFvE+/PjcoKFnCyXXZq0KamyqYornYGVWdShJo9I3dD5Hj/k95W+U3DtBanSzv7X7RCOrvK3WMPRn6o6WSAOskOkQmAHArEzKaFrk69HJHKr8vqXWR6gLrwANw44JnlPV39HavhRwuX/3WFD8bphMjQy5Tr9G4N9ojYhyopUcAc/spfjxZFYrSWBjbkhA/dfRC7j3HS7R0Uy9iho7HkPlRg7GwUZIcC1tnoeNw2II2laM+fvD9FtrscmnrBEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dsYK8MGJ623Wv4i4j03wdHY599I7JFDsGg7jQ0ZPO4=;
 b=jWkY4PYkZKZtyiLljuvrwGiIclQFwqwGsKQNSrld1xAHgND62krJJQbkeEUCcUq32HYPkf45k6km7d0RivM4WwQeq847cpmWXs9np5iFtixXsVepO/sP27w7rhpHwQqJUBEzhyEusY1VF9bk+oicDm2Rk7GKDSkJ+oYJ+yWQa+U4oXdUoExDjwmz//62OZ4d/BswbAtPtUB0uk8i1810PXGREZLSGV8ZCrKkQHRcHR5ZtIIVT0yvQbP9FhYFnI3d07jitLkUm76St0vcW/EWu9yDECRPTNjTLoFi0NGDWkCHDmJJspV6FnlV6cqtoH2lSvr5BoeQ2oWzobUk/R95YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dsYK8MGJ623Wv4i4j03wdHY599I7JFDsGg7jQ0ZPO4=;
 b=XpPUPIJZ2pehd4wJXkAg1qhylHJioUpjx3Y4WS0GI3rzq8R9Wq+dAzNIJ1yCdLo+aFwhPuZBXlZ9FrheVN6Wmio/uNtiL7kYP4N7pGZuT/IoVNFCkfGkSKcPErDf+h/bGb1agFOPczJxwHaKDiQhEzWZHejIY0ecjNehXH53MRp+bLWlaN5L29U+4fh/8uiNRBjBqOHAfq0rdr6mcREx+4wFHMf3GRheFfdONcZ+rrtf1E35Xv76vNEHlhpFMhdTSHFcclxKwl7mOUKijftWPdu8k2Y7dN5UcCQ53VF3v82hj+a/ekiByQ06tuh8NlklfzdoOdgo7JaUe7Onjqc9Lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by DU4PR04MB11859.eurprd04.prod.outlook.com (2603:10a6:10:61e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 13:57:29 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%4]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 13:57:29 +0000
Message-ID: <824d2c59-d355-4f8c-a602-bc08e49d52e1@nxp.com>
Date: Mon, 25 May 2026 17:04:42 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: imx-jpeg: avoid double free on video register
 failure
To: Guangshuo Li <lgs201920130244@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
 imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260518130259.1001956-1-lgs201920130244@gmail.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20260518130259.1001956-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0008.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::6) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|DU4PR04MB11859:EE_
X-MS-Office365-Filtering-Correlation-Id: 87446aec-3bfb-4be4-951f-08deba658f4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|11063799006|18002099003|56012099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	uviwe5dAAT3Vpd0GJrE8vPPO8j06bXzsuGMafuZPtDqveUXFCU0PBfSCXIoWwAutrz0EWO+Te8pWzN1I3KcNMs2yLhbMUxzBPxSLzZavR40+MgUgZc2LTVnNoO3s4G8XKtxr0nvsFG63CX7ihr8lsMOhuvXl5rnq8FFSTg46XnQZYpP2RViIcQczl+O6W/Azk2cEgJe+sUUwCbZd0SX0B6VLDap8TnR+/6yh4smFzFTvF2P2hF4cvQAMxup2wq6Bq6HVNYl3qgXBX5gNlL61/1WsBkzjN1qR/tL60kFoGwt/SgHycNnkUUAQE6nDDlaPseAB3x+Aim5Y8LORmYNP9WmKQJPAmLSI1Sxq+unK8L5nXwvQaX5Qh2rT3H0BFXH0w8VSFfICOn+l4vBrJA2Y+A+E376mG/lTtZRzF2cqJ9ABgOWirba8cf+taW3rqoXpHFAV6e/f5zlY/UENPkVmg1/KQD/buzdwgQftulisolih0I6KCKmoDTK2eMWr4Hms7dvi9xr0ysvLuDFiOWizfJ12gi4fXFD8kS9eGGaqgImd/c2Aw7tqxp3rGhRohVn3K51YTDIaHEYvK0JwCVVXnIA+1/isWk0vg4G6BfVuUBR4GdMWOSDf/M2ACTf1Gh2UaJZDLpA7Tc/4e2CIYGouEpF4OoC4eKbdYZAjN2y81JfIl6/IOiRuk1G/SaBybGJ0s93QicnfE5TOnM1yM61lNTfVTtNFTPEQV8jUYsPsgSMhB9RdR/8OM15EAOLuSKg4ORxf8p9CXBz7kvEgJZK0vA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(11063799006)(18002099003)(56012099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVBxOGFzQ2JJTGxrdmxVTnlOY25PM3pjM3lJUDZJMTdIc0V6ZENtNEpLb05j?=
 =?utf-8?B?WVIxSXFuVVU2bE93K0pMVVFiSnBvMUs4WjNIRVF5ZFQ0R3Q4OWdRT3FNa0t1?=
 =?utf-8?B?bDQ1ajVETk9kYWFjLytmalJYajhDNCtXY00vTmI3d1NjZHpaUUU2K3J1bll6?=
 =?utf-8?B?T1d0RWk3bm5IVHNyRElNU0NJdEcxaGFWV2twNS9OR3dVY0dOSGpYN0EvT04w?=
 =?utf-8?B?TjJWRkI1czgwbllmSTcxN1hxQmV0ekVtQ1laTm9ZWjJSMTlKMlhqbmdmODhC?=
 =?utf-8?B?V3FKQUwxTG5CMjc2UG5jM2hUSnROWW9WV09MYzBadGh2U0xpdUFWZ3RyZTRK?=
 =?utf-8?B?K1BGekh4K2dya0FwcGQyb1I5cUZGaHJuRVJqNXVPNWVhc3pib0xRTFRieDdy?=
 =?utf-8?B?c2tsY1BEdHNIV0VLbzdKT3hXMzJKa1ZPU1BDTXYvdTB0OGVCZGhMellKT0Mr?=
 =?utf-8?B?WEJwOTY4dGVRZytQaXBhaFA5QWpNN2xqRDNncGVyajFCanhIbzhnK2F2NG1a?=
 =?utf-8?B?Ri92QzBXMm5BaGFHNVlFUmFLT2pVNUZYdDR3Q3cvVmdyN0dTWUo5VmZkQmFv?=
 =?utf-8?B?bG1ITVRsa2lEZSt4aGpoYjFvc3owZStTNFRDbm44UmdZQnZHNG9zOWhwblF1?=
 =?utf-8?B?eDdjR2NPd2N4NURyTGtVQTlPckRGcUp1VnJyM1hhSkFHek9JMzVWU3RCYlN4?=
 =?utf-8?B?UDkzS3FSWGlRVGppUWhwSHZ3eDBBSTg3UE1HbmN1eFpGUnQxcUxjNkkzSG9W?=
 =?utf-8?B?L0JUYld0RjNWeTRka3BMRmtGSWtNejRoejYyNWc5ckR0YVpXQ0l4QnpKWnZm?=
 =?utf-8?B?Qlk0bGczSGxGcVFDTjNVUzNHRTFBTGNwTXhHM1U3d1Rpb3VyUTFuN2NyS0Jh?=
 =?utf-8?B?T3NIeWFLRkFsSGFaZnhEZGEyckNaUFNyUC9Ba1IrV0svV2U3V3gvOHo1bEtn?=
 =?utf-8?B?YWJ1bDQxRWlQZlJmRDRVeFlzTUZZeVpjdkhqS1J5akJEVDE2RUpxOHpUSkNt?=
 =?utf-8?B?MmZBTHBNZGNudGE1MFJVSjFaYmpDM2VXdnVISFpjck1mU3IxTzlmb2tKMUk4?=
 =?utf-8?B?OUY4NE5xZTJHMTJQQitWcjUvUWV1OTVxSmQ4UGhpOFdaS1ZZWG5nc0RYS2E0?=
 =?utf-8?B?eDBsQldmc0JpamEwdy9MNk9lWkMxUGI1MWVsWmxZN01nMksxZkhuTVZSNU5R?=
 =?utf-8?B?cDdrb1RhZHhyVlhSSXFmSHRZNHZiTWpDbVYvTEpkckY3OVBveTlsLzdnOUNs?=
 =?utf-8?B?U0VoMVN4em1hN2luTzJjY3dvbnY2WnI2RHd4WUlxaU5Oa3ljUndKbW13a1dn?=
 =?utf-8?B?RkJkTUJ6SXgvTmxTa1VDZDhvdGxtdy9kelQ2ZTdlek84cVE3b0N1clJlZ21W?=
 =?utf-8?B?T1VreWo5WWg0U1ZvLzBPenRtR0dwdDNHQVdteXhMTDV0aUtqMlBPMGFRZVhv?=
 =?utf-8?B?MGhWNFp6b1NjR3lhV3ROYUVFTnZxYnB2d21xTUJWQ3UvTlNBRVU4MnV3NlVQ?=
 =?utf-8?B?YVFSRXl6MGNBR0dma0ZhbS84L2FKTENKeFZ3VlFyQWF2YWVsYllQcm9vR0Er?=
 =?utf-8?B?cHVRaGJCUHluRkpvT1JFVjRCOXB2YnZFM2hlRHRGdzFQMDhrTVdjSGwvc05r?=
 =?utf-8?B?SjNYOXVER0p6Q0VuV3l2ZHBUcWdVRmRSYmJCQlllTzNXbkQ2S0lnM2xCN0tj?=
 =?utf-8?B?MVcveTI1WnM3UEJaSkdPOTgzcVhITnB3WjBXWGF0SVoyYW1ueUZaajhzdnZT?=
 =?utf-8?B?b00vNzE5OVpHRk9VL2xtcS9QMWVFMkpidWV0L0o4KzVleElRVVRQd29zd2NW?=
 =?utf-8?B?ZnNXSWlOODRYVmo0RW9MbS9xQWhtZTlZNVV5YXNJeS85Q3htc3dTeHd2aWZN?=
 =?utf-8?B?OGFCNXdRdDhpYk5FdjdiMEVlL2oySTBvd2FBYk85enpPMnQ3RC9TRWNEci9m?=
 =?utf-8?B?TG9vZVNpNGRaT05PTDlzUFZCL21naTlobGttTGp0WjJYRlhpTDliS0hHQmdk?=
 =?utf-8?B?dDBwR0xHdmI3cWwzZEEzd1k5MVJCSFBFY2FPUGNVQjZOYS92YUx3T0s5bXBa?=
 =?utf-8?B?ZElUMitnSkVYRzN0QVh2SUNRUTB0bGF3U1FiQklxYnRUZzYra3RKakQ1K3Ur?=
 =?utf-8?B?ZzRJM25seGptTHNmMDVsZEZkYXRjZ0dhajBhMVVoV1h6MXFaYXdxb011bys5?=
 =?utf-8?B?QUNscnRwSzBYaEpyK2VxeU1nVjVmNFlxcm15RXNkNW95Z28vbXJKWHFZKzk3?=
 =?utf-8?B?bExzWHNJc0dHTmQ3UTBqa1NGY21IRGdtR2lRRW1BbzNSbyt6Z3EwZ3haeGxs?=
 =?utf-8?B?ZVE5U2d2eFJzaGdQTHJLQ0UrdndiNXdUN3pIY0RQMjVmaVBDTy81UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87446aec-3bfb-4be4-951f-08deba658f4e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 13:57:29.3228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: knyE1oIGiaGPq51K56IThXGSYvBAGUW9F8gMVfPqSh4GkIDuuoo7VGY61w5eaGOSMKSSmLgzzQIDNBr7M2kMuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11859
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62719-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,nxp.com,pengutronix.de,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mirela.rabulea@nxp.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:mid,nxp.com:dkim]
X-Rspamd-Queue-Id: 7263E5CB6F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> [You don't often get email from lgs201920130244@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
>
>
> mxc_jpeg_probe() allocates a video_device with video_device_alloc() and
> releases it from the err_vdev_register error path if
> video_register_device() fails.
>
> This can double free the video_device when __video_register_device()
> reaches device_register() and that call fails:
>
>    video_register_device()
>      -> __video_register_device()
>         -> device_register() fails
>            -> put_device(&vdev->dev)
>               -> v4l2_device_release()
>                  -> vdev->release(vdev)
>                     -> video_device_release(vdev)
>
>    mxc_jpeg_probe()
>      -> err_vdev_register
>         -> video_device_release(jpeg->dec_vdev)
>
> Use video_device_release_empty() while registering the device so that
> registration failure paths do not free jpeg->dec_vdev through
> vdev->release(). mxc_jpeg_probe() then releases jpeg->dec_vdev exactly
> once from err_vdev_register. Restore video_device_release() after
> successful registration so the registered device keeps its normal lifetime
> handling.
>
> This issue was found by a static analysis tool I am developing.
>
> Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Hi Guangshuo,

sorry for the late response, so I assume this patch will be dropped in 
favor of a fix in v4l2-core, as per discussions here?:

https://lore.kernel.org/linux-media/20260519090819.1041314-1-lgs201920130244@gmail.com/

Thanks,

Mirela

> ---
>   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index b442dcba02e7..fe8a373576ef 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -2943,7 +2943,7 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>          jpeg->dec_vdev->fops = &mxc_jpeg_fops;
>          jpeg->dec_vdev->ioctl_ops = &mxc_jpeg_ioctl_ops;
>          jpeg->dec_vdev->minor = -1;
> -       jpeg->dec_vdev->release = video_device_release;
> +       jpeg->dec_vdev->release = video_device_release_empty;
>          jpeg->dec_vdev->lock = &jpeg->lock; /* lock for ioctl serialization */
>          jpeg->dec_vdev->v4l2_dev = &jpeg->v4l2_dev;
>          jpeg->dec_vdev->vfl_dir = VFL_DIR_M2M;
> @@ -2962,6 +2962,8 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>                  dev_err(dev, "failed to register video device\n");
>                  goto err_vdev_register;
>          }
> +       jpeg->dec_vdev->release = video_device_release;
> +
>          if (mode == MXC_JPEG_ENCODE)
>                  v4l2_info(&jpeg->v4l2_dev,
>                            "encoder device registered as /dev/video%d (%d,%d)\n",
> --
> 2.43.0
>

