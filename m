Return-Path: <linux-media+bounces-54071-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMsjIYBbpWlc+QUAu9opvQ
	(envelope-from <linux-media+bounces-54071-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 10:42:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3811D5B1D
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 10:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9593B3041BCD
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 09:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D63538F643;
	Mon,  2 Mar 2026 09:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bkh107a/"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8D92DB787;
	Mon,  2 Mar 2026 09:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444479; cv=fail; b=LswDtlDUcytPyQa+HmCLdbUvkkN6CjOEmVgpmLXokZvvlAFcki+pOULjEGRjLqYPQUuRUmCu8d2S+v01BrRHw6T2Syi+T0RS/MhpwghtK9ihgiEODRRPWMeyktg+XHWvfhfeUaCi6axwjLJ0GIC6ecVcgiu7KeVOY/KTKCFCQRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444479; c=relaxed/simple;
	bh=Wcj0UQlBW3mWo+PXoHzxjue9EvuM2+wJh+EHHul1D2g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P35BjJZO4lsK/YBjI0DdYf5r28Ut4JXIcFth3EGLpCUnLvOw41ssPVXQSngrnSdY0o+qUImt/77iuRUz6ukUHenROlo+mGoSxyxx+mpg5+oqMHYLhwNP4YJzILsCv/mqdAtIxZjN/586c2ZVIOc+cdlrEQndbsYBQiJc/e1f+r0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bkh107a/; arc=fail smtp.client-ip=52.101.66.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLKrJdzOXRgJvBRYRvGtLEeevRkDxjstoXpZAlpRWxns98RSGIEDSeaHKvjhok8f/X8QxuGMtABOg4faO/H8jMI3CTibUl+0eE7yQ9Dc6X7GyJ/FUaYj4vDMWQ4r7rGZpYCEb5AQ5/r3YSSFDUYxhrfRCi3pEVckmjlI7IDqD7BEXnzDbZwzng+1D5Sl5NHllOLBCcn58oPsquf29t6TtkpaOS/CZSHOMHg72yWMJjymhCYy8i7SfWaoKUiUBdu07y6TAqx5E3pYchXSLSct/+qORPdtM4/WcR/QOjpP1ZAJT6kfk1kJm6c8GBy2B5zqVjTchTD4pCt7zredrHyO7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Rj0FGwd3DQtJxDtHyNp0wFP6a/UYgGmJ34lKdCtsXM=;
 b=KcBXOeTTW0FX8mcbKZJstdQoXVQbcQUea+Kija6AZudocp/pPCAaiWEZGK+d0tefe/xUnNg+GdSVo0eVIZt9qF/4D2mifyv76obIBntaBlGDy+A1uMR36zUw9E4qqFZbyyob2UCvUcjqPWcsoHtWsfVpFKXaArFZknQI1BVCFgz9ZtYgMfKrtaYys7nJ00rjKlDan5KOQ6CXzxNC7gf/hyYv0oldC8PDE/6uu5OcQombmbGDLFEZzlQDN7/mk2qay7cb/rR5QDsHShekNKl264U4zD++VL3kTJcRx/pYPqS2UecOW7eXcHJFl+IfUFYvrORrSRebuf/L5w8VBk+fvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Rj0FGwd3DQtJxDtHyNp0wFP6a/UYgGmJ34lKdCtsXM=;
 b=bkh107a/Y6Rla8kBz3s4WAu/gXj8MyeCXuFUbbl8ykjz7tM2AGYsLPVNiHVedUQiZhRvMLNj6F3S9zkNj4kwuxn0f8AKa1Yyld6gU0+KIp3dNU2JLh/ct4LANjOXEu3Le/pXPeQ7kJXXNdwSot0GsbJ8fWO1vZi0yhFYdiY9A945THt3iSOH9uR0tpALZpr5JJRi0PLGa28ak0CY8G7WLoT12J4/O7KiqJLwEG+oLp5egVuoKEd671+vJt7aBn/Yz/L/lgUOO+6T3rxMmaBZIxEfrP2yK+VUjJC6ynS4E2kH+K1RojhFWwONyrS45e30jdE80T9Vj/YZwIAFU/JtYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by VI0PR04MB10392.eurprd04.prod.outlook.com
 (2603:10a6:800:21b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 09:41:13 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 09:41:13 +0000
Message-ID: <c5b5619e-d67b-4d80-8496-a5e326d239ae@nxp.com>
Date: Mon, 2 Mar 2026 10:41:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [RFC v1 01/11] media: uapi: v4l2-isp: Add v4l2 ISP extensible
 statistics definitions
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
 daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-2-antoine.bouyer@nxp.com> <aYIb8ZIZDfCJZEZ9@zed>
 <71b57f1c-be22-46a2-89a2-5abae11e0436@nxp.com> <aYNEtmJwnAtYitHO@zed>
 <20260209230036.GF2405149@killaraus.ideasonboard.com>
Content-Language: en-US
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <20260209230036.GF2405149@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0033.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::27) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|VI0PR04MB10392:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f7c0ed4-abde-4e2d-91fc-08de783fd7d3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
 7CBW5n7SDZkgrv1UoFhBErIWhXV8+8kefura16suPA1zgWmgcTOFE5nS9n2rVzYA0FK1Hy0EyDZnY4s7P7ipRxOMyiGLL633jtr4dcN9WLTloh6M6y9g70e+JwTpmLyHhUHIg1FqqS/u1Cnq+LjPQrdrk/2VKR0uIIrZmE69Kf44PwBvWFD42zHgpN+RHjCxx1uhSOzRpkp0h+e3Px0Xo6jzsrzBpbRUZjexVcJpuIMI/39/uf4A/oBXX/FSisF75tN0NvCL7PV4PjiX+pJuGBLuAnrHGs5VP3U/ymBSFJKr5Vo177+u4cYi2qEZ0V9XbwesFZp3Tv1TERruhl1Faiazcw8NZN7LhSZwllN+OASvy2CIpjYgPqXikbPIK+p3ZrHGhn5IghJk6fI9YNFf3mu2fnruANmNlRpTsk622CnBXJcAiG3pKgfKCeNNfWyO/ctQLDfI6OlLqlX1m9octP058JQh+hugbUhjvDSPNFBrjBTlzXCUzStG4adzj6ab1zmahF0bQxmI5/nkFlojqRH+IiPCAlcecwUPcrByqSfLUBKnMv1qsUNdIpHV/DgWq2q/pvGLe87y22PZVntPGvrF4acpVIfbdWNAZvq3hl9zqaWrxubbncrSBitslka+2aIFNAUgky0pg61VUh7etvh6S/PxPjtaV4tVELd/cYJ1/8nAN7dozUPhxZ+x40/z3afNVBBBpNJFSBai/a4CBdsUsv9J/EX5y2yqWfZH/NM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dFVERXlPQ2s1VWY3bG80cU5nWklIQWxpTGJ3WnFzL0o5Z1lad0VzekVuRkl6?=
 =?utf-8?B?OWNLVWtrUzV4bElQQXR6ZmZrNUpSSHQwUWk3emJ4Vmp0ZFdzNzd1S1JJZ0xa?=
 =?utf-8?B?OXY1bHpmejhJdEVtdVJNVDVDT3JHOENNdDl5RWhwMWNtRDRLZW9zS2oxazdG?=
 =?utf-8?B?WVMxdDVWdUJ6WkMvRmdZSkxiNXBRM0pnL3ZKZUR3NWdRUXp5dUNwZ3d4bkhO?=
 =?utf-8?B?WjlDN1AxY0NmNzFWY0FnR0cyZ2xyUjVmZ3Y1Yko0Z2Y3c3ozaGplZ3BPRkcy?=
 =?utf-8?B?NGJHU2pGNDd6c2s2K0tKUGhTRm1IN2hHaXU4R0dNbCtyWk5UbEw5WnZ5RlZU?=
 =?utf-8?B?Z0tpWE13V3lYb0ZKWTU5anZ4eThyc1hOZGFtSVBJT1Q2RWxJTkZ4ZGs3bGxo?=
 =?utf-8?B?UEFWZjFwaitiMEFQSnNKOXl2WjJUTXN2UUFJaWVWTGIrR2dBdWd3Unk2MHFi?=
 =?utf-8?B?RWduSHBkL1hMUEdQZy8xc3liZlI5QTQ4d0VzdkRtbXc4T0xCV1NjNTZSTDVN?=
 =?utf-8?B?ZGZpeGVBZXBMN2kra2M0Tkx5Um1vRHF3Y1JGdFdYWnZaUkF0NDFiQzRBZ0JI?=
 =?utf-8?B?UHNHZGt1NHhYam1adnJLaDMwZE9KeWc4N3hpeXc5VXpyVExsaTg3bjJHU2R6?=
 =?utf-8?B?MEJJbXdmWEhKMytmcDhEVVhBZkxRcWRmSTQ4KzR4MEJDbS9IeTJwL3RrRmoz?=
 =?utf-8?B?bDdOZ2N0bjJ4azh4RHVvc04yOEg2TWg2WEtiYzdLS3NzczlZa3Urb3Rod0tr?=
 =?utf-8?B?bSt2RXJveVAwWWVMWDYyWFcxbGdNRlN6ZnBzNWJHbTE5SmFOSHRLc2g5WHNm?=
 =?utf-8?B?TmpiWEJrc24rR3g0Uk5WNjNKNG5TWm5BQzVkaXRia3Rmb3M2K29udVZSY3FZ?=
 =?utf-8?B?SzZib2tmRzR3d1pKR1JrRUZQVUhFNzI1NTZEeU5yVzg0cnFCVzluLzcyYkcw?=
 =?utf-8?B?SUV6cElieWdzN0huZ3VaTGZxSEtFYStyWHF1SXhWOFFqcEtOT2hzYXJVb3Uy?=
 =?utf-8?B?MnFOWGVvMXlRM0w4OUVUNXVJWktDdUdBY1Nxc0ZKTXBZTUpSQ2lMcW9Lb1d1?=
 =?utf-8?B?U2E2RUxMdlg2bmFyclZ1VnNYdUFXUDgzd2l1ODN2ZkVRR2p3VUI0K1ZiaWVn?=
 =?utf-8?B?dTlKeXBPMnpBbStHTDN5NWVDTGl1dmZ0eFlBeVEreXdxZlc3a04vWEUrYzdw?=
 =?utf-8?B?QmpUOFRaOGgwbmgzNm5FVXFRcVdIektOSjdRSUc3Zy8zVmVjSEdxOHZUQUlI?=
 =?utf-8?B?ckEvemk0dms4QTcyb0UvKzRoNVlaYmVRdmxSci9IYzlXMjFrUFBPK1hCdGFv?=
 =?utf-8?B?WlpXdlVqOVl4emNvcjVOSURzUi9mdFgwRFVkQVpOMGh3QW5mYUxUalFDNjdn?=
 =?utf-8?B?Ly9IRVNEL0lqdkVWWmNYWnZFWmFRYXdWazRQaEhqWXFsM3E1M3VuSEZDcVhC?=
 =?utf-8?B?R1NhYWdWZXFSTkhtbVNmZ1lJbXVhbXpOeDI0SmNIMEZ4bUplSDdYc21lcFYy?=
 =?utf-8?B?OW1tWXhaRE9lL3IwZmRmMVNxWTJhRUI0cEZ1d3dHMUNEZlRwSmg4bSs4NWpw?=
 =?utf-8?B?eTg3NVVWYTZELzZKeDZLY3dQTUpQWnJVQjRsUENwV3A5TWlKTUtHbDdCdTA2?=
 =?utf-8?B?bk5XcnhRemQzdU8xSHVycWYyQWZWdGtTQ2ViTGRwMVc3TDdjekdOaUk4Umhh?=
 =?utf-8?B?K3B5UU5zMnBZeDRGazNSTVlWLzBRWnl0djVJcWhNcGQvYWNhRzBzOHlGSFNa?=
 =?utf-8?B?VXRpN29RWDdFYzBBZjQ1M2hMUllTTWREUkN5dWgrL2pEKzcrOWJKeXFvb2Ji?=
 =?utf-8?B?SW8yRXlobVN6ZEk5WnJVR2RpdkhMZ1VRSlozREhSQnVFam1Idk9iT2phUmhl?=
 =?utf-8?B?ckVXRXREZXR0clBDNC9qNTlWRHYzMzNLeENHbStVMGpLbGFWdXJuRFo4N0h3?=
 =?utf-8?B?T3dib3hZdXRMa09IY3VENjUvL2FBRkpwcDdZMmxDVWdFa1NJSVlmazF4Nm9i?=
 =?utf-8?B?dEJuZ1MvY01raHhxczVTNHBlRHBzeE1qcmlmbE96TE1EdGprZ2RZeWNUbG91?=
 =?utf-8?B?NFlrODRjdTI3TWRDUm9QZldZcHpRRjRtQlhKdVl4MGdZdlpaQkNBaUNnTEho?=
 =?utf-8?B?a0NwSjdjbkF0QWVpcm5GbFJVWE8vckpOWkNXdmhGbHIwc3dSNnNlNEE0bENP?=
 =?utf-8?B?T1UrdEhWK01xYVc2LzY5VytsVmlMbG9DdDRaemt2cTMvK2t5Q3V1Z1RPZlJy?=
 =?utf-8?B?WnFoNW5JQ2c0RUdvU0RGSDJFQkszbm1ra2ZTdjhNbCtqVzVoaVRTdU9KK2py?=
 =?utf-8?B?M1JZZDBVUzIrdlMybEU1OGk2b1dVaWlQOG1kQi9PQ1ROdHpWVnFWZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7c0ed4-abde-4e2d-91fc-08de783fd7d3
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 09:41:13.4938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ktqon5b6YKFCyDuNNz1zsxpU9UPw18hTmBGGD/ePlhlOwvjCEtuq9+/X6afbIIhdld0zqkMqokrqWpUkpd6GhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10392
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54071-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: DC3811D5B1D
X-Rspamd-Action: no action

Hi Laurent, Jacopo

On 2/10/26 12:00 AM, Laurent Pinchart wrote:
> 
> 
> On Wed, Feb 04, 2026 at 02:14:50PM +0100, Jacopo Mondi wrote:
>> On Wed, Feb 04, 2026 at 12:07:41PM +0100, Antoine Bouyer wrote:
>>> On 2/3/26 5:15 PM, Jacopo Mondi wrote:
>>>> On Fri, Jan 23, 2026 at 09:09:28AM +0100, Antoine Bouyer wrote:
>>>>> Extend the v4l2-isp extensible format introduced for isp parameters buffer
>>>>> to the statistics buffer as well.
>>>>>
>>>>> Like for ISP configuration purpose, that will help supporting various ISP
>>>>> hardware versions reporting different statistics data with less impact on
>>>>> userspace.
>>>>>
>>>>> The `v4l2_isp_stats_buffer` reuses the `v4l2_isp_params_buffer` container
>>>>> definitions, with similar header, versions and flags. V0 and V1 versions
>>>>
>>>> Why do you need two flags ?
>>>>
>>>> Params had to introduce two because we had two drivers already
>>>> mainlined using the pre-v4l2-isp version of extensible params which
>>>> had defined their version identifier as 1 and 0 and we didn't want to
>>>> break existing userspace using those identifiers. So we had to accept
>>>> both V0 and V1 as "first version of the v4l2-isp extensible parameters
>>>> format".
>>>>
>>>> For stats we don't have users, so I guess we can start with V1 == 0 ?
>>>
>>> I wanted to keep it aligned with params, so that any driver/userspace can
>>> use the same API version value for both params and stats buffers, and limit
>>> headache.

Seems this topic is not yet clarified. Should I use same version values 
for both params and stats as in current patch ? Or use different values 
V1 == 0 as suggested ?

 From userspace perspective, I feel it would be easier to align params 
and stats versions, so we don't need to maintain different versions for 
same purpose; and if a new version V2 comes and is applied to both 
params and stats buffers, then we can use same value too. What do you 
think ?

>>>
>>>>> are provided to match with params versions. On the other side, ENABLE and
>>>>> DISABLE flags are not really meaningfull for statistics purpose. So VALID
>>>>> and INVALID flags are introduced. Purpose is to force ISP driver to
>>>>> validate a statistics buffer, before it is consumed by userspace.
>>>>
>>>> Interesting. What do you mean with "validate a statistics buffer" ?
>>>> And if a driver has to do validation, why would it send upstream a
>>>> non-validated buffer ?
>>>
>>> Like for version, I wanted to keep same header structure, including flags.
>>> Since ENABLE/DISABLE is not relevant for statistics, I thought about using a
>>> "validation" flag, to force driver confirming statistics blocks are valid or
>>> not.
>>
>> See the question on the documentation patches.
>>
>>> If you feel it is useless, I'm fine with removing it. Should I keep a flag
>>> field anyway to stay aligned with params then ?
>>
>> RkISP1 has support for both "legacy" and "extensible" formats because
>> it has been mainline for a long time with the legacy format only. We
>> couldn't simply replace the existing format with the new one because
>> we would break existing users.
>>
>> All the other drivers that have been upstreamed with extensible only
>> (Amlogic C3 and Mali C55) do not expose a legacy format as there was
>> not prior version in mainline on which userspace might depend on.
>>
>> Unless you have very convincing reason, I would certainly drop the
>> legacy format and only use extensible.
> 
> I agree with that, for upstream we shouldn't carry legacy formats in new
> drivers. I've read elsewhere in this thread that it won't cause issues,
> otherwise I would have recommended carrying an extra patch in the BSP
> kernel to implement legacy formats, and only use extensible formats
> upstream.

ok. I'm fine with removing legacy format from neo driver, and keep it 
only in downstream for some time.

> 
>>>>> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
>>>>> ---
>>>>>    include/uapi/linux/media/v4l2-isp.h | 85 +++++++++++++++++++++++++++++
>>>>>    1 file changed, 85 insertions(+)
>>>>>
>>>>> diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
>>>>> index 779168f9058e..ed1279b86694 100644
>>>>> --- a/include/uapi/linux/media/v4l2-isp.h
>>>>> +++ b/include/uapi/linux/media/v4l2-isp.h
>>>>> @@ -99,4 +99,89 @@ struct v4l2_isp_params_buffer {
>>>>>         __u8 data[] __counted_by(data_size);
>>>>>    };
>>>>>
>>>>> +/**
>>>>> + * enum v4l2_isp_stats_version - V4L2 ISP statistics versioning
>>>>> + *
>>>>> + * @V4L2_ISP_STATS_VERSION_V0: First version of the V4L2 ISP statistics format
>>>>> + *                          (for compatibility)
>>>>> + * @V4L2_ISP_STATS_VERSION_V1: First version of the V4L2 ISP statistics format
>>>>> + *
>>>>> + * V0 and V1 are identical, and comply with V4l2 ISP parameters versions. So
>>>>> + * both V0 and V1 refers to the first version of the V4L2 ISP statistics
>>>>> + * format.
>>>>> + *
>>>>> + * Future revisions of the V4L2 ISP statistics format should start from the
>>>>> + * value of 2.
>>>>> + */
>>>>> +enum v4l2_isp_stats_version {
>>>>> +     V4L2_ISP_STATS_VERSION_V0 = 0,
>>>>> +     V4L2_ISP_STATS_VERSION_V1,
>>>>
>>>> As suggested I would make V1 == 0
>>>>
>>>>> +};
>>>>> +
>>>>> +#define V4L2_ISP_PARAMS_FL_BLOCK_VALID               (1U << 0)
>>>>> +#define V4L2_ISP_PARAMS_FL_BLOCK_INVALID     (1U << 1)
>>>>> +
>>>>> +/*
>>>>> + * Reserve the first 8 bits for V4L2_ISP_STATS_FL_* flag.
>>>>> + *
>>>>> + * Driver-specific flags should be defined as:
>>>>> + * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(0))
>>>>> + * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(1))
>>>>> + */
>>>>> +#define V4L2_ISP_STATS_FL_DRIVER_FLAGS(n)       ((n) + 8)
>>>>
>>>> Currently we have no users of V4L2_ISP_PARAMS_FL_DRIVER_FLAGS so we
>>>> could even consider making it a V4L2_ISP_FL_DRIVER_FLAGS
>>>>
>>>> Or do you think it is worth creating a new symbol ?
>>>
>>> To limit impact on potential on-going development, and future conflict,
>>> creating new symbol may be safer IMO. But I'm fine with using a single
>>> symbol if you prefer. Most probably this flag customization is not used yet
>>> by any driver.
>>>
>>>>> +
>>>>> +/**
>>>>> + * struct v4l2_isp_stats_block_header - V4L2 extensible statistics block header
>>>>> + * @type: The statistics block type (driver-specific)
>>>>> + * @flags: A bitmask of block flags (driver-specific)
>>>>> + * @size: Size (in bytes) of the statistics block, including this header
>>>>> + *
>>>>> + * This structure represents the common part of all the ISP statistics blocks.
>>>>> + * Each statistics block shall embed an instance of this structure type as its
>>>>> + * first member, followed by the block-specific statistics data.
>>>>> + *
>>>>> + * The @type field is an ISP driver-specific value that identifies the block
>>>>> + * type. The @size field specifies the size of the parameters block.
>>>>> + *
>>>>> + * The @flags field is a bitmask of per-block flags V4L2_STATS_ISP_FL_* and
>>>>> + * driver-specific flags specified by the driver header.
>>>>> + */
>>>>> +struct v4l2_isp_stats_block_header {
>>>>> +     __u16 type;
>>>>> +     __u16 flags;
>>>>> +     __u32 size;
>>>>> +} __attribute__((aligned(8)));
>>>>> +
>>>>
>>>> This is currently identical to v4l2_isp_params_block_header.
>>>>
>>>> Can we create a single header for both stats and params and provide a
>>>>
>>>> #define v4l2_isp_params_block_header v4l2_isp_block_header
>>>>
>>>> for maintaining compatibility with existing users ?
>>>>
>>>> Or do you expect stats and params to eventually need different headers ?
>>>
>>> Current approach is to use same structure definitions as for params. So I'm
>>> fine with creating a single header as suggested, and provide symbols to keep
>>> compatibility.
>>>
>>>>> +/**
>>>>> + * struct v4l2_isp_stats_buffer - V4L2 extensible statistics data
>>>>> + * @version: The statistics buffer version (driver-specific)
>>>>> + * @data_size: The statistics data effective size, excluding this header
>>>>> + * @data: The statistics data
>>>>> + *
>>>>> + * This structure contains the statistics information of the ISP hardware,
>>>>> + * serialized for userspace into a data buffer. Each statistics block is
>>>>> + * represented by a block-specific structure which contains a
>>>>> + * :c:type:`v4l2_isp_stats_block_header` entry as first member. Driver
>>>>> + * populates the @data buffer with statistics information of the ISP blocks it
>>>>> + * intends to share to userspace. As a consequence, the data buffer effective
>>>>> + * size changes according to the number of ISP blocks that driver intends to
>>>>> + * provide and is set by the driver in the @data_size field.
>>>>> + *
>>>>> + * The statistics buffer is versioned by the @version field to allow modifying
>>>>> + * and extending its definition. Driver shall populate the @version field to
>>>>> + * inform the userpsace about the version it intends to use. The userspace will
>>>>> + * parse and handle the @data buffer according to the data layout specific to
>>>>> + * the indicated version.
>>>>> + *
>>>>> + * For each ISP block that driver wants to report, a block-specific structure
>>>>> + * is appended to the @data buffer, one after the other without gaps in
>>>>> + * between. Driver shall populate the @data_size field with the effective
>>>>> + * size, in bytes, of the @data buffer.
>>>>> + */
>>>>> +struct v4l2_isp_stats_buffer {
>>>>> +     __u32 version;
>>>>> +     __u32 data_size;
>>>>> +     __u8 data[] __counted_by(data_size);
>>>>> +};
>>>>> +
>>>>
>>>> Same question. Should we introduce a struct v4l2_isp_buffer ?
>>>
>>> Yes, sounds reasonable.
> 
> That seems to make sense. Once we'll have a driver using
> v4l2_isp_stats_buffer the structure will become ABI. If it then is an
> exact copy of v4l2_isp_params_buffer, it would make sense to unify them.
> Let's see what will happen after a few review rounds, if we end up
> requiring separate fields in the stats buffer header.

ok to use same struct for both.

> 
> It would also be nice to implement support for extensible stats in a
> second driver to test the API.

What is your preferred approach then ?

Should I "split" v4l2_isp rework in different patchset BUT with another 
driver using it (with userspace changes I guess). Not something I'm 
really comfortable with since I only focused on i.MX95 isp so far. But 
if this is the only way, that could be evaluated.

Or should I "keep" v4l2_isp changes together with neoisp introduction ?

Thanks

Best regards
Antoine

> 
>>>>>    #endif /* _UAPI_V4L2_ISP_H_ */
> 
> --
> Regards,
> 
> Laurent Pinchart


