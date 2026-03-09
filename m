Return-Path: <linux-media+bounces-54907-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJzhFNUmrmkdAAIAu9opvQ
	(envelope-from <linux-media+bounces-54907-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 02:48:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A46C523314E
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 02:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE0D630125EF
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 01:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D02D221DB6;
	Mon,  9 Mar 2026 01:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uSAEu+Cj"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011042.outbound.protection.outlook.com [52.101.70.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824DD7081F
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 01:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773020879; cv=fail; b=SrVcGLga4Opj0jXcv7xLQ/Vhf63mv3VG4ZW08i5c7/Fh1yZzca1JtIcWLjKGQR2KjHP2AL7XnjFIUQ5dvSIvJVPcZArXcQqkAz0WLbem0V/JbgNsh24QIM+Tnn4M3Nm6hlwI9gqsatKXp+uj9gWMOWAmBHSqkH4k54T9NYusTl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773020879; c=relaxed/simple;
	bh=92r5t+DLUS0Yr0C0ju5N/3B6DrbqMLju6EzrlWMMEvA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PURAVDx4hPjfElAiWmzklfLMiP9dXpkePCsKWHiSx2S/yD73+C7uck/UoLj+rlTosxjXvh0GZn+YgwZl2a29f484wxksKUxmy6mdKXKTm9LWyrPFH6SxHaqsKRjmA7kdjeY4PfcKWGIDwZdwfg0s70L4L4NHr1Kze0S+H6Kv6u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uSAEu+Cj; arc=fail smtp.client-ip=52.101.70.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZbWBUB9fPDbinrtt2UiAa1WBPddiogBkzKz6Gqq/gY9W2b/ZloDApSlpemkutFlE7K4SKg3JAhHhkRP+C+Mk84C0dekxY2lnO3KWOA2AfsxbkBbPL5fvZpxi2dYt+KhEjO7+31hx2Nhn9fZU8NtACZU2TiW3tcEjmH5QdloVNPjwB+XJJ4dTbTOQYmXSIkfAjnNVTmlxMJpWfKymVXiiASfVp25Z56vwHOG30fmA1qQYJv+J4lWutC4NI70k2Z1FsAUyENwf8MHHepBuK+JMI3sY9vZq+ClxODbGcGjC+EYw3muJ73Te65AdedTh7jq4bxnsBMnQ/3G5K0mu+PJvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kCjGZgv4dVwRibqyqsuyAEVq1JDC5VoYH0X576vHPw=;
 b=GCT3udhTVkP6Ymo7sNJVyKxFCd/gpy1RbpTWfcjOMBuvJ7cSXQNkhffn7Dlzo/zL110rgM0SDln7xuo1uo1J82Cb2FIYS6YbljIbiRa/etKBt1Eb3hdPMkkxpI7wzF93k1SETjsyYeyW3+9q2TlBXWdf//A0Piux8GxaVIphIBYARbBT/f3QGuwVwVWy1cRaQi8N2ixTJNXVxfkpo1AE03oD2BytWdKA0XidDvqXDAgJOGtDsg44NJf7CKklEEgwUYH0bC+urcniBEufkLOxl9xAJZGErfvavKpZoBcy/B2gS3MK9JTxmwMBiYMM8cIq/I/MqrR3GWVIUemj0Gj2rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kCjGZgv4dVwRibqyqsuyAEVq1JDC5VoYH0X576vHPw=;
 b=uSAEu+Cj3kKmmvBpfsLFN1GRjRdqNH3WQUPODqMlG0yonJ+IypZQ9CfOyfuDIB78nbNbgJCBAL+hQ+7UMvg0x4bTBwBp6+koWc9M7NtgrYB1M8pJTlaqAlAFtndL8l+re6xD9oDetYrIOPys8GZS8wTKi7OSk9BcGJi+r+cYnoRWQ3VqE4QBpezBg44MuH6ky2Obd7AjVQWQcToDz7LXkqFzEzXiJBScCookxxEDNnUUootqLolavteETFs+9ovG3l2PhyfaMooeF3C3djz53m3nIHbh24mN0plsizROfbP3mHoCegNT1NRhbMmpORlqQfCegBlqjZGW70oH48MYsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI0PR04MB12155.eurprd04.prod.outlook.com (2603:10a6:800:312::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Mon, 9 Mar
 2026 01:47:55 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::20db:4017:28ea:911b]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::20db:4017:28ea:911b%4]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 01:47:55 +0000
Message-ID: <4d9d2482-5f97-4c57-86b5-ef238f5b830e@oss.nxp.com>
Date: Mon, 9 Mar 2026 09:47:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v4] media: verisilicon: Fix kernel panic due to __initconst
 misuse
To: linux-media@vger.kernel.org
References: <20260306031059.801-1-ming.qian@oss.nxp.com>
 <69aa7d15.050a0220.661bc.3d20@mx.google.com>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <69aa7d15.050a0220.661bc.3d20@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0236.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::10) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI0PR04MB12155:EE_
X-MS-Office365-Filtering-Correlation-Id: a9ac1c3d-7c95-468f-3ef2-08de7d7de19b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	/HWCbB/2htpeNXjQBB53CuxwRf6BVfx/hwqWz+l4cY5/ymoBInDmBhiLMMcr95S+K3SuxjW/UOvAs7SyIkirTLnjTk8YgfWZUE8yQ04EFLxq6YoFDvrPLB3GL16muffk6rqRZK3NHmAO55YB1fJ/DZD2eCUrM+5O7COU5/MDAGDL/h25Cy9SEVkncSr27EeXfAulHVQdEMhlBANGFDBfg4RjzvobXUfyXXrMM2T6FH61H299DbLUalEfO2RRNzVwlo0NYmSoUfkpiMe2bmDpYRqRCRprUjePR0cvqc4PweemsI8eiJjdLuni55YVk0NgDSajDXI1Si4UEDnlSM0dc65qam8/T77Qr+bojJ189FNp4uLQvpbb/vuZN9gw1QbHVTPCNCAq4NvjlmlTGuoijujQ5DOwqR5dVD0whS8xaj8Lp+H4YSZbP0CL1PQLXA73VXfnKFOoG0br4NHk9rBmuhbvO0FvB3yRJtBi5Ql1f9BvedL5ei1Yk19KqJM63pzVLkJHIVMc4Q8Ajo62Acr1vSs4H0bfB7d5snkQif0HrDvehR/0k+z35y0lZp2e8VNR7YfkU080PTAfHJtA2dCbncqp61rHgqdDrzMKy+pB9W+S+qrP4FDbbt30+9IW6L9yyXGJw1fshx9+9eEE4Q+0uPlyTQmZ1vW8WsAbHYRKU32cs7zmiOuToXhsa39kB3kY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bi9IdzVSelZYVlpxS0pMRVFhVnM4T28yQi9LOXJsdk5pdXNTOWI4cG1kM2dN?=
 =?utf-8?B?YkZhckNRRGY4ZW1SakhsRW1STFhIcVpINDZiNkM0YnFIbFUvaXp2K21lSUFk?=
 =?utf-8?B?Vk5OajFTcEJYb3A0ekdKMW0wWjlZUGZyYWN2c3ljQ2NjRXJZc2F3a1R5Rm0v?=
 =?utf-8?B?NUcxWGV5Vys2UTZLYlNjUTBEdnE5bXQrVXRyVWNrMHBycThmZ0hOY1FZYnBL?=
 =?utf-8?B?ZG9Dd3I5RTZNYVIvakw3eUsrTnRCbmtlTlc0ZTIvOXEwWVpnL1FsbWVGck1V?=
 =?utf-8?B?L0t0eVBVcldFRm5FVytoNWcxMlBDZHI1K2lpVWxieWJFTFI3UDZrZnhaZ25t?=
 =?utf-8?B?UjRKYWI5YS9BSnBwTzlkK2lnU01QS0tvcVVRVG0vTmM2N01lRWovYU5yY2ZU?=
 =?utf-8?B?eEZyT3QxL2lZYjhxOEZjMU9UVVlvazlueFptT25xNTFwaTRSMzRCMTc1WDdV?=
 =?utf-8?B?RTV3cllVbGVjcjFZL1pkcmYwUU54QlRicVJSZkFla2JEZFNaa2JLUUdkcGE1?=
 =?utf-8?B?bmFiOWgzT2JXWEVObFpsVjVCYU9VMzAyRHlOS1RwMGxueUtmYnlNMUZ3K3Vq?=
 =?utf-8?B?bTZneFdJZG1RdzZVbmZuZGtjU0tBNU1iYldIM2hCWURJUHd5Vzd4dllRN1Ro?=
 =?utf-8?B?czlSUGFKeHVQVTcwVklWR3IwYzhQdHRKb3hRRkFxeHd3YzRtMTE5dC9lZ3ds?=
 =?utf-8?B?Q2V3UlpPbU9jY3NUUUJlRXlremtVYWFVbnhwOVJIdFg5cUdKQUNxR1Z6ZkVn?=
 =?utf-8?B?SmQ0eGdpb2dxaG5WNE5MOFVUM01CelBrWUlQR1BCOGpVUEFxNUxTVW0zL3Z1?=
 =?utf-8?B?dWlzUjJYVERuQ1dua1ArWXlsYk93dC9aZGhhSkgxbTBkQ3hYck9iTk53dmRF?=
 =?utf-8?B?QTFBZlZmZWIwS1NRc1pZUGRsa3ROY0tCQmNGUTBSbFVPU2lmdTI1eGZVM3Bh?=
 =?utf-8?B?c2RMNUphdldtWnZCbGV6YWZ4SWpYTk5Eb1d5TkdqUUhxdWNqeEVyQlBlYWRJ?=
 =?utf-8?B?Rm1PdUwrYjFjRndrd3Z4SEJXWFNlNzV3Y3JEelN1S0xNRkdBcEFwL1BjNnpN?=
 =?utf-8?B?alVYVFE1bm1FbVRTVFZjbGhtYjNtSExqNDUxT3lGS3dRekFTVlluVWFIekpC?=
 =?utf-8?B?ays4ODQ5UG9PdW12VlZob2dwam5iTy9Mb1cvRy91M29uSVhaNVdsREJxMDUr?=
 =?utf-8?B?RExHWWJTQVlQaENYN2FNS3oySHNpdXFhRjIzejFZWGtqc0QzZVM4WklpTEpJ?=
 =?utf-8?B?WW4waDZqNzcrSjVocGVGaWRRVVpiTzNkaFlhbWJtclF4YmQ1bXIzNTdXZEd0?=
 =?utf-8?B?OW9XYnk5Vzl3K3JQRkhoUnNtQXJhcTlWUm45VFFZMm1SUDFzNmovSVlaeDF3?=
 =?utf-8?B?OG1uVUo5Q2tJaS9DNXdTL0UxUmNwdzQ5NFNNU0dSQXU2QjNRSFFIa2pNV2Ir?=
 =?utf-8?B?QzJLM2syVFU1Z0RadG9Cb3BGOGwvNHA3R1VPUTN6QmdjSUhnRlcrZk10cEEr?=
 =?utf-8?B?RUdxRmp0SmZONUFhbVI4U1ZrcVB4ckNUb3ZDRUhtSU9ETjZKckl2ZFNWYVJS?=
 =?utf-8?B?dE9oV3djYTlpODQ0ZFJ5TFU3c2Frc2h0Y1IvbWd4S0Y3dUpMNi9IZWp0Wlk2?=
 =?utf-8?B?NEptSlJsdUxqUlRHNW1NUEdzNEtNU3ZpYjVHaHRreWJnbFZ4WHNCNDI0bWk0?=
 =?utf-8?B?QXkwSTExMWtKZ29CbFV3YTVYdVh4Ly95QUNPSGQ0ZWJYSmJURU8rWDNXTzRF?=
 =?utf-8?B?TEM0V3VOWW1obTJkZmQxRWVDOHdyMkliYlZVc2pSc25xWXE3U2pNWUduWTRz?=
 =?utf-8?B?U0dDOXJxaGIwZGxINlk4T1ZPd3ltRkZKSFQzR0V6aHJkbHQ5SXJxbXdyamQ2?=
 =?utf-8?B?MlJJRjlaYVozWUkxb3NrUWhWQWRZU0QvY0xrVlV2UzVZcDViSUJzaVVMQUJ2?=
 =?utf-8?B?NTRFcGpEWkN0Y1BpTE5Dcm1vYkJPYS82dXlaOEg4eGc1dzJaK2dqekZiRGtt?=
 =?utf-8?B?L0tGelk5UW5CR1FVejcySVRoWncxQ1B4M2w2a3hpbXJtTDNLS0lkTzlpeWpD?=
 =?utf-8?B?U3o5RTFpR0IyT3p3dUVpMEczZlVyemJ6TW5CVGtUSVlkK0VUNGJzaDB5Ujcz?=
 =?utf-8?B?OFg5cExlcTU5Z1VkV29jRkpBQzNMM0R1MlVvazA1MHc0S3VQM2JxR1hvcWZG?=
 =?utf-8?B?QldPRHNSMk8rd0tuMnNNN2Y4Zm1ubDF6TVl6blRJTExwZ3FjOGR1cHVZNE1M?=
 =?utf-8?B?TkhHR2RNb2w2K2Z3d2xiT2VtTDc5YWdEK29aZlRHRUdYM0xhMkZvQjdLUjZN?=
 =?utf-8?B?UGlsalZLM25QU2hGeDBNa1g3dm9GSjhBcTBCZDZlZVFWTTRZVDJodz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ac1c3d-7c95-468f-3ef2-08de7d7de19b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 01:47:55.1082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwLQFeyw0LcziuWnUCehfyHHsivySOPT+SWUYLYAaA4/etzSNcY+b8+jdEIn73d6WeiHzrYcd5VnKwBGA19Swg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12155
X-Rspamd-Queue-Id: A46C523314E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54907-lists,linux-media=lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pages.freedesktop.org:url,oss.nxp.com:mid,gitlab.freedesktop.org:url]
X-Rspamd-Action: no action



On 3/6/2026 3:07 PM, Patchwork Integration wrote:
> Dear Ming Qian(OSS):
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test checkpatch:./0001-media-verisilicon-Fix-kernel-panic-due-to-__initcons.patch checkpatch
> ERROR: missing sentinel in ID array
> #51: FILE: drivers/media/platform/verisilicon/imx8m_vpu_hw.c:346:
> +static const struct of_device_id imx8mq_vpu_shared_resources[] = {
>   { .compatible = "XXXXXXXXXXXXXXXXX", },
>   { .compatible = "XXXXXXXXXXXXXXXXX", },
>   {  }
> 
> 
> total: 1 errors, 0 warnings, 0 checks, 8 lines checked
> 

checkpatch false positive: sentinel present but outside diff context,
If the diff context is one line longer, running `checkpatch.pl` will pass.

Regards,
Ming

> 
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/94619357/artifacts/report.htm .
> 
> 
> 
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
> 

