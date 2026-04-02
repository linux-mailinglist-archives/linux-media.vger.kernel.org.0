Return-Path: <linux-media+bounces-57908-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EsUBEzfzWlVigYAu9opvQ
	(envelope-from <linux-media+bounces-57908-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 05:15:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78599383049
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 05:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1030301681D
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 03:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F5F35A93C;
	Thu,  2 Apr 2026 03:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YCGttx+C"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012059.outbound.protection.outlook.com [52.101.66.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1E9350281;
	Thu,  2 Apr 2026 03:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775099717; cv=fail; b=MiBIWyWNYlmCgyQYpoqpvBvvBs6K33+u+JSNfm0TdjmIWSElc5kM+zEN0Kjk/7xEzho8Dbc4y4JaAUhFZEmxupZbKiifmMzYh2KhRc7FeJiQYBS6B1qDO876OD3D35ha+Eu+TVJQqxjNeJw5OcJhdiYUHEURoiSXdcgJmNqTWeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775099717; c=relaxed/simple;
	bh=7WSqW9h2hsSFNsWoF1x4lq6bX0gRr4expRJicKZmPbA=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F/6iKwRlPect0Eebb7Exx97Xl+aBUITBu+pPtd+JKD8qR/MxSCiK7UhFJN9UfUD4rY1MslQgIR0z9j8cAeP5XStv5GGrbywUYfRhRbMER71BSCCcTdyp5Kuq/TYFy1vEtyZs44duRDXDM7jZ4psjBWfxnS5k27k3mkBfP1XOHXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YCGttx+C; arc=fail smtp.client-ip=52.101.66.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRENulPASCq3vUab3McJcSbR5dC+7fXM4MsN5FGCua0sUwYvYTt6eT2qVLKPUbEK3RAm+u+Fsu09eS3l25sKOrPV7mPVMVu1ePx0sjfYsqn4k73MRvAYqyx4CdeJtKoLQtlP2lbyEMhknuCHxgX+zl2TX/O3dIzS9rV3gPni0z5khaAcv4ues3SKa3j+HnhErHpeBYJUbnRniuBVhpuyZmMu9MuW6dKjb0ketwFvFqWvCxpEGhdvstV3FNShS1jCERZdnQSCLZwDIQJhohO7gVxB8TZe7tD8OiXdtrms0HxcpHU/N2N5Je+e2MtxFK64pQqT4RyYWpPk9KggSgBNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6w6c9zgbkjZBuwY8jMwB+fmTCD6I5ocwNz3RIE36JC8=;
 b=ortdV8iknMNrrrz5e521Di/xvqYuSQTICXKgSRIFmhUQ3eDsQe1UOnw+JyHJdWCxckBLSDFFB0FmnEXW1z27QOXbPU78N8ygj35jO+AgauA8MECpvnfuvW69Pq0qz4y7dLXcDGiFWioS99gM5SM7ZKw6m5u6oBMJNDoIw1BUIc/eJskC5fAVuC/sqzI3XTWzqRjTFY3acTCQcEvok3tnxeoSGV8IQudLiqT5Zcj7Qj0dZv43D7oxHeHUyEDnfK2QjJeRsZmM/yBgHZzXMQ2EbwkYxclR44nmaAxi1G94YEy251kKgtF3gs3CSVB46uDNbQ/Bw15+QXKEzwY9WoEvpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6w6c9zgbkjZBuwY8jMwB+fmTCD6I5ocwNz3RIE36JC8=;
 b=YCGttx+CJXmDM0/WQ8Bk/dEXCVmzA/qN1iEw7QjSzdFmvfHdQll9tElO0+CDDZ6avgLyQEPt4QpaE1EDhhV6Y6wl8nyRibnkP22o7PvLXDFsx0O59hnw4d88RXe50Zd3vhI9QaEGl1xexhumezf7Gs4wdINH0T7ecKtDEQYgEtmFYyKQk571wIvg6REDpJU+xOyjdaBAwc38bT12HoeNqgGlVYCO3qq6ESuQRktgVhmraxjmGWC5KblmeHeoa6oAEwgBr/k2o3ZB8i8USsOf88FtYowq09C+6kSPLatLWd4QucOxqNvDOsipKSy+zPgaj17XJAwguaz6qQ0wDpmDvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5118.eurprd04.prod.outlook.com (2603:10a6:803:5f::18)
 by DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 03:15:11 +0000
Received: from VI1PR04MB5118.eurprd04.prod.outlook.com
 ([fe80::c885:a48:57e4:d4f9]) by VI1PR04MB5118.eurprd04.prod.outlook.com
 ([fe80::c885:a48:57e4:d4f9%6]) with mapi id 15.20.9678.034; Thu, 2 Apr 2026
 03:15:15 +0000
Message-ID: <5c24fe3f-a1c7-4fd6-b5e6-c920bc3e7fcb@oss.nxp.com>
Date: Thu, 2 Apr 2026 11:14:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/7] media: v4l2-ctrls: Add V4L2_CID_MEMORY_USAGE
 control
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
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
 <d8c12ba1-5004-4a51-8a2b-3d500184778b@oss.nxp.com>
In-Reply-To: <d8c12ba1-5004-4a51-8a2b-3d500184778b@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0083.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::15) To VI1PR04MB5118.eurprd04.prod.outlook.com
 (2603:10a6:803:5f::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5118:EE_|DU0PR04MB9299:EE_
X-MS-Office365-Filtering-Correlation-Id: 83698512-9cc6-4579-e07f-08de90660eee
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uZv/hjKm4Wxs6j6ZnHMn7jD09ysNdfoKCMTTqO/MdvIUQUzgWkTmSrbCuSuSN9Jh4YmzWWvLrDh7dthc/cXRkevr6N4f/xb8oQUR8m3povGAW9z6a1ZPvn2FpMv766Z+pCpK5C/uQy/XnRHztLlkURyDrzXZ/LlQlSUBcxV6Fuo2eJTU+MQBaWqglKvMl1j2ilufVPAt/M9xZkPoyH3ctvOOyGPU7tMu/JtrhCG8ftsD/OzfdJQAh+EyUvjWF+Aty7QdZYBoOJT4J7yo+s/8EooIgDm7UDImakF5wFbFgEOFTZXSBuiGceewsKve8taKENJPNymewlvGaXWt4A6QLhdxVsroPXvI+8xUnwsGKujppmo6dEbTmve0oUMDneGXU+nOInMACfG6lFOGJ5J+AxhaavpjAdTo87CZVW8xrUFUF4j8pV//xuP7sPeIWMKtTVDeoSCFIno0yV0aeH6826/jKKUJBca90rXPvqRWCh9CI77Ik8gibSiN8PE1/2OyhNFTno0VO80teWJmEUq9MXmUGvQlONLHqHR8SwDhiQJAUKs2yxQrm0eBGGtMPE4nzIXjyORAS1KRTQ3itiTlgivAodHd83Dsofr0Lq6OGYPTFZ7eg3kdNHWBsV1YIJ/A/z+V1/J2JHLGxs15cy7CDohHLd1gvqwBJjbA/8v/Y6Z4tAu68YgxyM2NA0pHUSDdjxSqPuo5AOwwop81MPQi2JFffS7qfVAFCl6dDJ8HlgA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5118.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3FnVVZUa1NsSlI5ZGVDTWp2TVQ2MUFzZXVDZjYvVFIvUmlkVi9qOVEwWWRU?=
 =?utf-8?B?d3QzOFY2QU9VbTE0NzFqVDBPb2tsdXJ5RXBhbkZ1SW9OaWEyVEI2MEp6R0My?=
 =?utf-8?B?M1NZTEVwdXNxQjc1am9tQittY1g5WVRWM0J2TnB6TlhrcHEyNW5NVk9Tb2hu?=
 =?utf-8?B?V0sycFM0aExaaHJaMklUZW1RcGF4MHNMc3pTOCsvOEFybHV4RG0zVjRROXlJ?=
 =?utf-8?B?Qm1kOHd2THRIaEgvNUV5S0lZTWNhU1BXb0lZSk1qcFZvSE1wQ0dyZUUyVHJZ?=
 =?utf-8?B?N080SkxhTEEzbDR6L3I1dk9DalhuVWZjRFhPZ1lVZnhraGwwL29veFI4ZUNs?=
 =?utf-8?B?ZC9odFBGN1h2andKYy9VVnlMTDQ4cjhmS1paZlFhWFhpM0dPSXN1L1paMTcz?=
 =?utf-8?B?SGZJM2lDZGJYSmJEVWNsa3dmT1VTR2tibmkzS2hwOXRVNUxqRGRaY2JaeVZj?=
 =?utf-8?B?UXlhSkFBUjIyVGpJcEtCTm5Ca3hiWVY3U3FNMHo5OGVGVE1OVHRCcHplc2tp?=
 =?utf-8?B?dVVxRWhwTUxQS0RCMi9OL3RPNXdxWVQ2anpvLzRQcUFzNjVITCswYUxWUUZy?=
 =?utf-8?B?bDdXS2lRLy9EcXdxdWVNUDJNQjlnN3ltU2N5WXk1ZlNtSkI2cFAxMlB4SzZx?=
 =?utf-8?B?a2MvTGpFaW52bDV1WEgwSk5EZHBlL1cwOHc3a3NYK3lOc3U1QWJ5SG5jeDJu?=
 =?utf-8?B?bFNreUN2MEZEd3U5TW1VNHhWMUhyMk9TNm03dUdzS3RleUhWUWtSZVVYTWxM?=
 =?utf-8?B?RFdzN3JFMk9oOWwydzA3ODNuZWhvcXpQMFErTG5NR2FoSFZldTBzYTl1UmJq?=
 =?utf-8?B?dGEvaGxhUFZrY1p5NlduSEFBaFppKzVPajhid3UyektKK2RFWHIwdmt0aHpm?=
 =?utf-8?B?RURDZ0gwbExuOHJmUUpvdUVzSExvR3ZrLy9iZGJSRDZPREZGN1FxR0R6cTh0?=
 =?utf-8?B?K05kOGcvWHh1T09RTEg2M2t1WXRZa2lTQ2w4a3hIYzl3Zk14bjJ4VHVCeHdS?=
 =?utf-8?B?dEFXSmhGY1A1S3ZkcHA0QThOci8ydkg4SWIreFhSQXBpUjdmUnVqUUhtanJM?=
 =?utf-8?B?VTlzSkdKRUJ0RHFVcU01aFpmcUc2RkZGSjZRRFhoQ1dycDZqZTU5YjNDSlAv?=
 =?utf-8?B?amZuc3FOVTA3QU9EOHN4SVhpbGhqT0FwN2huWjNUay9ZdktWM0ZoSFhkQlFH?=
 =?utf-8?B?ZDljeUFLTnFTQXY3ekMvVU9SNlBjUVZuNTlpYi9tWHM5VHk1aTcwdjJQQUtz?=
 =?utf-8?B?TnZmQUxZOU5XaTNOVWoyUXRXOGMxYmlZdXFEamNnYlg5c2IzeHB4UzY0Yjcv?=
 =?utf-8?B?OFMrNXFaaktsVHMrUGJrYjlFbXRKbUtZTVdyTnA3V2x4WWpocmtwTENTOTV5?=
 =?utf-8?B?VUIwRGJqWnZUWXllZm12NE5CL1FxY1JWQWNRK1oxTHJqRmYyWTQxNEx1dGpH?=
 =?utf-8?B?VUtMYXY2MFd6cTRUQkxac3lGdlo5Vm5YWThVdHpBeWZacmUzSEJtOHBhWDJG?=
 =?utf-8?B?b0l0WnEyTGM2VEpMUkw5bnpUZjRGOThueWVqVjRhVk1jQnFMdzBaaEVpMmY5?=
 =?utf-8?B?QXpJallqYXpaT2pHRk5tV3JPRmJSRThqYUlNR0V4YW9yeHNVVm1KWUJOdGNR?=
 =?utf-8?B?YVhqandKcmtPVWJZcXJvRGlGNWlDTXkxazJhSTRaZkpLVml1Zk5aOWl5ajBM?=
 =?utf-8?B?cHZzMnV5WkpaYjJrd2JRQVBoR1B3TmxIZFF2cE03NklBYTZKQk5pRDhlT2kr?=
 =?utf-8?B?R2Mxc2pQaXk0WDhiMUVzN2xtd25nZVhSY3JDNEpTNktITXBTYzIvOTlHdytp?=
 =?utf-8?B?R1JnSnk2dFpZdFNoOE5EQlFRS0h4VUhONDhjME1tUm9KdFY5clZyemJRZ0Ex?=
 =?utf-8?B?TjlmV3U5Mi9wOGRLdXg4ekxDTy8zVmFnQWFHNXZ2TXF6U3RDZGN5TktqeElI?=
 =?utf-8?B?bUVzNWYrQ1pUcjNQUllEWXJkRGdjZ3JFNU5BV2VtdEw1Sm9qbmpaeU5nKzVX?=
 =?utf-8?B?UmEzWjlpMDZmWmFZM0U2ZDBmV21wSlA3OW1YOE9NR1lOZm4zZ2JnZTJPdjNO?=
 =?utf-8?B?UlpHNVpxL2pMU0ZlaHlkRXpXcTd2WXpjTndIR1RaNXFyM3NXQVJFSnp0WStZ?=
 =?utf-8?B?WTNRZC82Q2NsWW5WcjN3R3dQSUxlT0RXbUNUOENNZnYyVmRrWjJBaU1oSG1S?=
 =?utf-8?B?U04rUEVZdGdvd3lMeGJ0eEV4a0lsL0cvWG1pbWJRdHhoWkRKRzViQVUwYjBD?=
 =?utf-8?B?dzZ4cG5UQlBnNmJrcEl2N21pWHJ5K1ZKYktNWnpScllLRkJMOXlnVDUzb09Y?=
 =?utf-8?B?ZzdzUHFGYktXWW4vYUpOWFZ1T296Ri9Cem02bXY2RGhUU3NuVzVkUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83698512-9cc6-4579-e07f-08de90660eee
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5118.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 03:15:14.9784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3F991rWYU/4aQLzo18DGCAcyrNmMxq7WCiwfeY5sU73TIVPSkIidV7W0iC5khan2cc1npUFW/V2xT0BKkqilg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9299
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57908-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email,NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid]
X-Rspamd-Queue-Id: 78599383049
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Nicolas,

On 4/1/2026 10:23 AM, Ming Qian(OSS) wrote:
> Hi Nicolas,
> 
> On 3/31/2026 10:54 PM, Nicolas Dufresne wrote:
>> Le mardi 31 mars 2026 à 10:33 -0400, Frank Li a écrit :
>>> On Tue, Mar 31, 2026 at 03:23:11PM +0800, ming.qian@oss.nxp.com wrote:
>>>> From: Ming Qian <ming.qian@oss.nxp.com>
>>>>
>>>> Add a new read-only control V4L2_CID_MEMORY_USAGE that allows
>>>> applications to query the total amount of memory currently used
>>>> by a device instance.
>>>>
>>>> This control reports the memory consumption in bytes, including
>>>> internal buffers, intermediate processing data, and other
>>>> driver-managed allocations. Applications can use this information
>>>> for debugging, resource monitoring, or making informed decisions
>>>> about buffer allocation strategies.
>>>>
>>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>>> ---
>>>
>>> Not sure why not export these information by debugfs, or any benefit vs
>>> debugfs?
>>
>> There is also a on-going proposal that uses fdinfo.
>>
>> Nicolas
>>
> 
> Thanks for the reminder about the ongoing fdinfo proposal.
> 
> Just to confirm, you are referring to Detlev’s ongoing fdinfo proposal,
> specifically this series:
> https://lore.kernel.org/lkml/20260212162328.192217-1- 
> detlev.casanova@collabora.com/
> 
> I will align my work with it and switch to using fdinfo.
> Once the show_fdinfo support from that series is merged, I will prepare
> the next revision of my patch accordingly.
> 
> Regards,
> Ming
> 

Regarding the discussion about using fdinfo instead of a V4L2 control, I
have two questions:

	1. Key consistency in fdinfo
	fdinfo uses key–value pairs, which is flexible, but if multiple
	drivers want to expose the same “memory usage” information,
	they need to agree on a common key name and meaning. Otherwise
	user‑space must handle each driver differently. A V4L2 control
	naturally provides a unified interface without this coordination
	effort.


	2. Lack of notification in fdinfo
	With a control, user‑space can subscribe to control events and
	receive notifications when the memory usage changes. fdinfo does
	not have a built‑in event mechanism, so users must either poll
	or rely on additional eventfd‑like or custom event mechanisms.

Do you have any suggestions or existing practices to address these two
issues when using fdinfo?

Thanks again for your time and comments.

Regards,
Ming

>>>
>>> Generanlly document should be first patch, then driver change.
>>>
>>> Frank
>>>
>>>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c | 8 ++++++++
>>>>   include/uapi/linux/v4l2-controls.h        | 4 +++-
>>>>   2 files changed, 11 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/ 
>>>> media/v4l2-core/v4l2-ctrls-defs.c
>>>> index 551426c4cd01..053db78ff661 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>>> @@ -831,6 +831,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>>       case V4L2_CID_ALPHA_COMPONENT:        return "Alpha Component";
>>>>       case V4L2_CID_COLORFX_CBCR:        return "Color Effects, CbCr";
>>>>       case V4L2_CID_COLORFX_RGB:              return "Color Effects, 
>>>> RGB";
>>>> +    case V4L2_CID_MEMORY_USAGE:        return "Memory Usage";
>>>>
>>>>       /*
>>>>        * Codec controls
>>>> @@ -1476,6 +1477,13 @@ void v4l2_ctrl_fill(u32 id, const char 
>>>> **name, enum v4l2_ctrl_type *type,
>>>>           *min = 0;
>>>>           *max = 0xffff;
>>>>           break;
>>>> +    case V4L2_CID_MEMORY_USAGE:
>>>> +        *type = V4L2_CTRL_TYPE_INTEGER64;
>>>> +        *flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>> +        *min = 0;
>>>> +        *max = S64_MAX;
>>>> +        *step = 1;
>>>> +        break;
>>>>       case V4L2_CID_FLASH_FAULT:
>>>>       case V4L2_CID_JPEG_ACTIVE_MARKER:
>>>>       case V4L2_CID_3A_LOCK:
>>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/ 
>>>> linux/v4l2-controls.h
>>>> index 68dd0c4e47b2..02c6f960d38e 100644
>>>> --- a/include/uapi/linux/v4l2-controls.h
>>>> +++ b/include/uapi/linux/v4l2-controls.h
>>>> @@ -110,8 +110,10 @@ enum v4l2_colorfx {
>>>>   #define V4L2_CID_COLORFX_CBCR            (V4L2_CID_BASE+42)
>>>>   #define V4L2_CID_COLORFX_RGB            (V4L2_CID_BASE+43)
>>>>
>>>> +#define V4L2_CID_MEMORY_USAGE            (V4L2_CID_BASE+44)
>>>> +
>>>>   /* last CID + 1 */
>>>> -#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
>>>> +#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+45)
>>>>
>>>>   /* USER-class private control IDs */
>>>>
>>>> -- 
>>>> 2.53.0
>>>>
> 

