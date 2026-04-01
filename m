Return-Path: <linux-media+bounces-57826-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLflBgqCzGkFTgYAu9opvQ
	(envelope-from <linux-media+bounces-57826-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 04:25:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72085373D28
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 04:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A1B3306DA5E
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 02:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D3C311958;
	Wed,  1 Apr 2026 02:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xK4aH0/9"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14147C14A;
	Wed,  1 Apr 2026 02:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775010203; cv=fail; b=iD2aktQHSa92OYbjBC5Lo80aAh+r6bH4NPxhAe6qGTUdM0pnfvHFpZlqJbXLbriOI5forGmoEzpoHprL86mAeFYlX8zs9Fv02NOo5WUkN/8NTGxaPm23Tgl+WHZtSu04DGEOjWjhCyZOsrOF5kh2O3VjHNihfKy0NB6mwfQLjzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775010203; c=relaxed/simple;
	bh=MPURDHG1TCyGiydYSh1ElpGZHM7z9pk5ByAx/C3SYHU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ICvDLlF8v3Bzej+MJcDTGJoGABWyVWKR/GpNQGaLdfjrLXD5Upbp7YUWhDh90O5sMAIW3eXluYwtqWN/5001+bjcJMRbRRqUOSIwUFfNfwZuQEWsd26VkUnCIP/YvlSLr7/M71aoWexkxET8MQjihZEgb0olbM7TG6HX0Yw2gPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xK4aH0/9; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/DXOuuth1AOPBYG+erRjLcVUOqQ+Zy+i7UfhEk7fZjrD/xsBs22pmxfvoPvOy7ofcqX4BhaFu6RMpjZf8xruKdGgBI0SxbUQYF9tmmEyWFvZYfODOdz+aMW+jEtwgrEvdWNERlaqC8xKPNU5mXu6XwnOHDIbSSk1hRMKrMA3py1wzfQmp7hUODQKVGjC2zKt2jDo9xTAznr9wQLYR2pjRG1sadskB21PH6VfULVQKtUwJN6+D74ShYmLrcNktvy0Ynx7g2CD8s6YBADFSewAS0nJMCPBClGBERZhIq993FKElKns8LeXykXNwIpBm+FSSkMJ4JLpnxz1us1NM6rhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KAsnlPEn6L8JobejIqPpYimxUbfqCuWqmpq2Aj4+AI=;
 b=lv60mdF/rl7I89a2tUgxOdgg8XAN7lD6Ltg00oinbk+dZkvC+9P5UDPhSKDYwrYra/1qs7yBVrCvM2qlezqAEp+vBNrqOJrjekR+0GA3ifpLh/JLHnmPqWfnx0+gLw043TEYAsJTMnbwHqGxn9kf5chJ0/JInzBNNmC/c7vc8skUvAIbFvcC55RMU6jmsekPTC9WKfdph65/97kJaLr5m254BCgaaOm7Cg5eVghpf9fAWUFJXyLopGoPzpqdTSHE4CJ0uvoJg/H0w7IcS4RiYrwK6vlkgIYyj6jTA+Ux8MdeckwL/gQLo9up2lo8YNN0LzjVAJiUIN93Hxk/pYs+NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KAsnlPEn6L8JobejIqPpYimxUbfqCuWqmpq2Aj4+AI=;
 b=xK4aH0/9FpsCK45Gq6b/Wy158cSItY4E7VYdHL/MSEKl/jx/Engybt0+vnMPrj2iurHC0zZ8PlI5t8a/9z/2V3QtWe0+Oz/t9UpdKMAHciSzltHX3I+oUVLFyqclAjNPW1BXz1zdMmJ+6qKlgBMp4f3Esl3oJcFh8Skf56gX3mK2T8cmBXciS++e05MG1UdCJ2MCibIcu6ubLRbVwoMSlvdtzqBXCK+waglyM3RdrOYTqY9W1XNFozglVwfFEZdxKv1P+In4jnEbDxE1NQg19Ng6yRZGwmjI/TH1p/r8OTqUJqMVrQn7rL/GDmYkBCCWVkmTCmgZTQVXxa5eTEAhng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com (2603:10a6:20b:8::21)
 by DU4PR04MB11457.eurprd04.prod.outlook.com (2603:10a6:10:5ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 02:23:14 +0000
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc]) by AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc%5]) with mapi id 15.20.9632.017; Wed, 1 Apr 2026
 02:23:14 +0000
Message-ID: <d8c12ba1-5004-4a51-8a2b-3d500184778b@oss.nxp.com>
Date: Wed, 1 Apr 2026 10:23:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/7] media: v4l2-ctrls: Add V4L2_CID_MEMORY_USAGE
 control
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260331072347.253-1-ming.qian@oss.nxp.com>
 <20260331072347.253-2-ming.qian@oss.nxp.com>
 <acvbOo17tU-s20BS@lizhi-Precision-Tower-5810>
 <079b1630abe5dd22e032797fc12925c9c79ea305.camel@ndufresne.ca>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <079b1630abe5dd22e032797fc12925c9c79ea305.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To AM6PR04MB5110.eurprd04.prod.outlook.com
 (2603:10a6:20b:8::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5110:EE_|DU4PR04MB11457:EE_
X-MS-Office365-Filtering-Correlation-Id: 61814f83-20d2-45f6-5ee7-08de8f95a0a4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BevI+4vjhoHem/Xilz/eXb5w4w+Tt8OfsOnv77wd9kUBEFRqvo9m/gx1rpqtp7QlIYumvYYOlnS6+kJUOvgkWK7zMed4AJGKj/i4hGVnZoq/IqZIe4lwXBNQmbadBw3eU/kNlH1p6SycrdBkyenos9IdivYXnSNeMIeOLu6BFxBs8kYs+cVt03Z4yRHzw8QhXWUCtUuPseP+EQpybMjUygndV8yeVhq0YFM+dE6Hdq/hww1WR/wMwrwzNpFdakvBbVYvSE/ArdGEYu7hkqaxmoQ+ufclKd0mcki4seB197l0TnpPjJnZuMKsqBMRgySBHQtB+1lDJOj/btzO81jNanIOXhaibtiug2U06J+Dfbj08whH23s6R6X/WtJSGbCgmddvwZAL35OMY8f4mwbj/OuMOAI0kuGj1zrMM8ukPScCTGzquoj39+AdFm0G0B1RTEqZ4d4I7PFCzzBpxeNPD5ktqEbd/OXGe64IFFxj7UOPFC0bScL1tHDjzcUpGC/Qel5WYfncET6R9jxs6tDGtII4SkQU1fjpvpBPeU4rjrtPai1pQUVJHxDk4j54V8wIRznEmXbfcyr5fQ1vzsDazmewkLTbYnBAaiS/lxdvJdR0bvPaEoSH2QQN6l9FK5aLPdioJGk/SwdnXNTozhUPz+Z8t6RV5tsa6w7ewyR4cZbtzjsPKMelD/4mHqd8FEknZmLwULjH7TpGfckKDJ20XTDBb0lU18bF6PYo5nozKdRueDfPJModzOK1KSjfzrZ/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5110.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzAralUya3NQREJYaVJzMWR5SlVjS3ZqamVIbVdNUzQxTWVqM3BaZGx2a25n?=
 =?utf-8?B?YVlzZWRYa2Y5MUJKb1NVZ2JRMCtPMkRPQ1pNLzJPSzR0YlE3YnY5MVVPbXk1?=
 =?utf-8?B?UjF1dm9ESTFHL04zMk83WGdoOVN5S01adisxdFQxVXRFY2xaRkhnaVVMcDRO?=
 =?utf-8?B?c1BGOTlIQ3puUFl2bVZKU3MvZXpFMjZEQmNGZWdOS0lnWWFPcnRpTlVvTURW?=
 =?utf-8?B?NGJ2SEd5SDEvVjE2Vk5jNXY5dkcyTW1EMVE4MUpaT3RuT05uZWJBSW1zVFgz?=
 =?utf-8?B?UW0yNTM2eU1rWlV1Um0reFFHRHhGQ1BReGVlVUxlaVlUdTBUVUhnUGJKNWxq?=
 =?utf-8?B?Q05QUXFtbVkzd1RlcnNpbTFSV3J5ZHdTRUsxWXZldEVveXQrcUJrdkVyZUgy?=
 =?utf-8?B?VjUvREY0ZndHZzI4WEtQcTZleHNPNTBlQ0pXRWQzWGFHNHJSVy90NzRhQWFY?=
 =?utf-8?B?cEVCWTd0bDFHRlVIM254RklXVW5OQUpsY05qZmpTUk1OVjcxT2MrV2lFckxZ?=
 =?utf-8?B?Wmk3ZnI1NXZJUnByYzVpOXZKczBiSStudGlyVXZxblhEQnhDckE5Q3NuZm1R?=
 =?utf-8?B?M0xYbnVmUTF4NlIzMFA2U2lOMEJYdG1nWE8vVWo1STBXUmpJak9Xamh2eDVs?=
 =?utf-8?B?YTAxRDJmSFk5ZVY0WjlsNEt5TU5manpZRFcvNVlUV0tGRzlhczdDaU9wR24y?=
 =?utf-8?B?em9PSG0yTGhTb1ZTa3B5SXZqdjYxd3IrVzhES29jbmdRaldIMmVoYTlyUFlZ?=
 =?utf-8?B?T2U3WVBscUdiMXpTZGZCZVNTc0dsUWhpa3BFb2tYVW9tWnFhMTN1T1ZCb0xn?=
 =?utf-8?B?YjBkT1BSNVIra3FJM3NZQlZ3UERWN2NmalhPTStndzBTUjVsYW1WSjhuRmFP?=
 =?utf-8?B?SUpRaElUeTVQV1RhOCs4SnlvN3NtdWc1djNuL3ZnMmhNZDhuWkx6eDJaWDBw?=
 =?utf-8?B?eXdjRHR4MnJNaUxxZkJjNEY2Vmo3N1FUS1J1enBua3U4OTMxYTVURlVBTHd5?=
 =?utf-8?B?UXJsWW5sTXZSNFB0MmIyZDJGSy9FVVFVOWNDWVV5cDJhQ0M4K29QMU9abDhO?=
 =?utf-8?B?Sm1kZjUxRThCTGd6U3ZUL1V6U1dnYm56ckEyOWtPQm9JeDV0L3dwR0pFMDY2?=
 =?utf-8?B?VnJhN1VHZU5EY2M1RExiMDdkTUdHRk1LQUZFM1c1dGxMSFluWldVN2VXTFBR?=
 =?utf-8?B?QjdqcnJBa1JjQTZzN3EvOC9BTGEvUDI5eTA4aU8zVjR5dXhuMkFlVFlMVVhW?=
 =?utf-8?B?cUcxYkFiWkNUdE44UDRPY2V1eXk0cHhKSXh6SjcrOTZ5THg5V2U0ZHlTWlh6?=
 =?utf-8?B?ekY5aTZkOWJrK1FhMVU0WGI1ZE4wVWJ3N3c2bnJ1c09nTCtzUmFaYmtDZG4w?=
 =?utf-8?B?Z3JMSXAwT3NOTXFJWVVhVmdRTXNESWdsRXNlU3hCU0xZZmU3dVhTdDEwSHk1?=
 =?utf-8?B?M2pQcDZQRGx3M3NaZ21JSUsyVWxCc3h1OVFFdmJScVkvSGJaMkFmL3lkUm5G?=
 =?utf-8?B?cUNReU83M05BcHc5V3BnMkRORnBPUm5Eamdjcm55am9iREhyaDdhWnA1bDZo?=
 =?utf-8?B?TzVIQjhZSXBmQ2dhaCtzbDkybXZYdjBteDdnaURyZHUzb0l2RWlOL3JVYllQ?=
 =?utf-8?B?L0ZkbVBxWWdzV0IzOThyZTFVNmk3aGY1bXVBbFFIblQxT0tZdnhkcGtLL0Ju?=
 =?utf-8?B?bFJUU0hEcktJTTJjU0dONkxjdlZQUk50Nng5TFpKUmdaak1sdjg5TGpwbjNK?=
 =?utf-8?B?emhNbzI5US9ndzhnOWp0NTlzNlFKenNBK3N3QnEzR0lGUU1NZi96VndseHkz?=
 =?utf-8?B?UDdKemFZMWtJalMyZU55TnZmdE5TdTB4d3dmQmdHbFhPRWdya3NnaWtuR1B3?=
 =?utf-8?B?dm85VVZOaVRnRmVHc2xqSzdHUkI3N1h0bXMzdVRFTUVTYlZRd2hjVlo1TFNJ?=
 =?utf-8?B?R0NTcEtMT1FxMmJjU2FnNXlCVkVHR2x0OTA5WlJUdEwxM1RSeFFlZmwzZWQr?=
 =?utf-8?B?Vk81Y2xlZEZCbVZwUnhzY1drdVFlLzRCb21HMVM2VXpBcWNSRC9sQTN2ZUJt?=
 =?utf-8?B?dHBvTGgvZEZYRkVhMVVaUWdRNG5ZL3hmckhCbHQ2eE9zNFU4SDdMdWd3ZjFo?=
 =?utf-8?B?Zzl2TENaUFp0TWZvTkkwNkxOSnlCUVZnUy95UkR1aE1hOGZwYTVWazlqNm9r?=
 =?utf-8?B?MUdOZlFlUnh3enIxdXZCZDZjSmhSQ3hPMi9ha3lDSW1ldDV6dVFFQ0JkdXVk?=
 =?utf-8?B?N1dpZmNTTDJ5cGhzVmZIUk1oWGtnM2E0QmpnamQzd3RZODMyU0RtdDhEV2Jw?=
 =?utf-8?B?M1lEbEVSV3NmcjJjcHV1VjNsSHduOEtsQWxXTVVnb0hvZWFOdFZQdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61814f83-20d2-45f6-5ee7-08de8f95a0a4
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5110.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 02:23:14.4930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVHwh8BewmgYUM7DQm6aXfn61yrOL8Ukd0GBOWePPUUqPn/s3bN7jMV1+AzeubQstJXev2AGOa08mgyhqwEDBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11457
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57826-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,xs4all.nl,collabora.com,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 72085373D28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Nicolas,

On 3/31/2026 10:54 PM, Nicolas Dufresne wrote:
> Le mardi 31 mars 2026 à 10:33 -0400, Frank Li a écrit :
>> On Tue, Mar 31, 2026 at 03:23:11PM +0800, ming.qian@oss.nxp.com wrote:
>>> From: Ming Qian <ming.qian@oss.nxp.com>
>>>
>>> Add a new read-only control V4L2_CID_MEMORY_USAGE that allows
>>> applications to query the total amount of memory currently used
>>> by a device instance.
>>>
>>> This control reports the memory consumption in bytes, including
>>> internal buffers, intermediate processing data, and other
>>> driver-managed allocations. Applications can use this information
>>> for debugging, resource monitoring, or making informed decisions
>>> about buffer allocation strategies.
>>>
>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>> ---
>>
>> Not sure why not export these information by debugfs, or any benefit vs
>> debugfs?
> 
> There is also a on-going proposal that uses fdinfo.
> 
> Nicolas
> 

Thanks for the reminder about the ongoing fdinfo proposal.

Just to confirm, you are referring to Detlev’s ongoing fdinfo proposal,
specifically this series:
https://lore.kernel.org/lkml/20260212162328.192217-1-detlev.casanova@collabora.com/

I will align my work with it and switch to using fdinfo.
Once the show_fdinfo support from that series is merged, I will prepare
the next revision of my patch accordingly.

Regards,
Ming

>>
>> Generanlly document should be first patch, then driver change.
>>
>> Frank
>>
>>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c | 8 ++++++++
>>>   include/uapi/linux/v4l2-controls.h        | 4 +++-
>>>   2 files changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> index 551426c4cd01..053db78ff661 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> @@ -831,6 +831,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>   	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
>>>   	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
>>>   	case V4L2_CID_COLORFX_RGB:              return "Color Effects, RGB";
>>> +	case V4L2_CID_MEMORY_USAGE:		return "Memory Usage";
>>>
>>>   	/*
>>>   	 * Codec controls
>>> @@ -1476,6 +1477,13 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>>   		*min = 0;
>>>   		*max = 0xffff;
>>>   		break;
>>> +	case V4L2_CID_MEMORY_USAGE:
>>> +		*type = V4L2_CTRL_TYPE_INTEGER64;
>>> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>> +		*min = 0;
>>> +		*max = S64_MAX;
>>> +		*step = 1;
>>> +		break;
>>>   	case V4L2_CID_FLASH_FAULT:
>>>   	case V4L2_CID_JPEG_ACTIVE_MARKER:
>>>   	case V4L2_CID_3A_LOCK:
>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>>> index 68dd0c4e47b2..02c6f960d38e 100644
>>> --- a/include/uapi/linux/v4l2-controls.h
>>> +++ b/include/uapi/linux/v4l2-controls.h
>>> @@ -110,8 +110,10 @@ enum v4l2_colorfx {
>>>   #define V4L2_CID_COLORFX_CBCR			(V4L2_CID_BASE+42)
>>>   #define V4L2_CID_COLORFX_RGB			(V4L2_CID_BASE+43)
>>>
>>> +#define V4L2_CID_MEMORY_USAGE			(V4L2_CID_BASE+44)
>>> +
>>>   /* last CID + 1 */
>>> -#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
>>> +#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+45)
>>>
>>>   /* USER-class private control IDs */
>>>
>>> --
>>> 2.53.0
>>>

