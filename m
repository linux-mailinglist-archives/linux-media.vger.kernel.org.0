Return-Path: <linux-media+bounces-64108-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TYSFOfw9Jmp1TwIAu9opvQ
	(envelope-from <linux-media+bounces-64108-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 05:58:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4098C65287C
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 05:58:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=pfrfYT7u;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64108-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64108-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA2A93015450
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 03:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F6230FC34;
	Mon,  8 Jun 2026 03:57:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013049.outbound.protection.outlook.com [40.107.162.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB013B1B3;
	Mon,  8 Jun 2026 03:57:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780891061; cv=fail; b=pCzZDL3+dBaAZcAnOW/nF5DCxYYJZdAr7F6RtsTE/U+YFjEr1Nj3ei5VB4Tp/wekPLa6PwcqwnOFyw2sFyaiog08w1CA4SuwVwr6NtFWIx8v2ThtENWQzK5WBRQ8a9Cma/szrmy+ahEsfL8YFZeq1h0B471XIg3fyJlXb9qSupg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780891061; c=relaxed/simple;
	bh=7itAneMsWPSC1UOFNLBph5YHvkFUF+eaw0vI7uO/4Ro=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=VGnLAj+SQQr/eWAb1uxM0DVahX7eo1NQU8ZeSHHUyQ4j79iNk5IBg7/Y3Fx30RQ6/Q3jzEaqis8S16M6ewWKM2DtxCDF++KLXeoIsGtVkcBZBofDEgcVGJy3p9BIp36LRppE4cwZ2F21r8gI2PVw4UOqHh3uwK4dMTdTECFFVXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pfrfYT7u; arc=fail smtp.client-ip=40.107.162.49
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knP2HXYKmCGFgUZkpQ249emZZWfNrkZ2GYZdXpeZ8plvOKfsb7y3bNtBRxuuKHDGFZkSUdSvKoIy89ZIuVCiHVXHl61kSZJzhAMbyQ7Ex1acg1P8DMfIJVczYYPg2y5dWZGmzcTxiu0dTyHpEvlJNYuUP9tEsz0gXlfMOaqoHT8Vfw7uWpvP7B+4lSh0kCcvQKNMDwQSSdS9gZD9Y+7WvhFRlvWDEeM6xqWnylIitjaWDbJLI/cVbLymdfoN0TbEP6NU0xhql/lgMTn2q0ORz4Taw6y9w2N3Xs9fk2RMnJzbXUROLSXfqHW0OcHbdvKDOV/guMBT+RReO93lS+HVBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZ+z/K2lYjwdi2pJBn2A9iRzUsIFAQp1lU3zHnzlCSc=;
 b=Ntv9mAXZHQmV2dYbeGzGKfCBrhefdnuu12Di2jvmCSbeRWmWcAE8WyzfJbnQJ636m7UzwMa524syRDL2wAJwmbxzp3iozyMyg4kffr6k9PbL/qLPcIwXUh14WpviB0fPE/jW47ZgNdhn7a0jjwZl058vxN2N20eadPpxs3qxbvFDVNAgiILy3eO2kY6unQjyRsGziWcFXdTfGqCjnWKMmyQxPvgjw4x/HjY7dX/nVDPPmIyqf5ZEn+YY67Etl8Ab2PGufEEwq3bXRlPv7Sd39mMBXrrhHgna36vhqmB0ON8y0XZFl6KnGlbyL3oFc4AIwy6EeSOIi2kt+YPrEJONOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZ+z/K2lYjwdi2pJBn2A9iRzUsIFAQp1lU3zHnzlCSc=;
 b=pfrfYT7u+XSX6OvhR3jWVinxlxyjx8DM0PbK1UAZwWjoaNNuuJ9VP8EzP3EWw4XbSG5cXgiXluKSYxy7M/+ddNqm1kdCDNzSg1hxDdNmE+jRQR7GbrWsMgDHRCYZ+7O1pl/WN0v8RG4beBx/7IwKsBY910PAnPOLezDX7qBC3lhwzJsI2DpklKo4KhP4pEcQSLP9kvnV5WQ6G30QH3DiTchuQl8NRqr34WwWR2Fya+sfuNWcyNYSshglrork/9Xat8RXwc4G/luAkCW63W/GUgoyVPSdKFoTOljQlL7v8tF3buMfNH27nBBhsnTgMiRBabnvNLxMg/330XU5eztBJg==
Received: from AM9PR04MB8570.eurprd04.prod.outlook.com (2603:10a6:20b:435::12)
 by PAXPR04MB8443.eurprd04.prod.outlook.com (2603:10a6:102:1da::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 03:57:35 +0000
Received: from AM9PR04MB8570.eurprd04.prod.outlook.com
 ([fe80::c9cc:24fa:6f6d:fb03]) by AM9PR04MB8570.eurprd04.prod.outlook.com
 ([fe80::c9cc:24fa:6f6d:fb03%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 03:57:35 +0000
From: Ming Qian <ming.qian@oss.nxp.com>
Subject: [PATCH RFC 0/2] media: amphion: Clarify and restore
 V4L2_FMT_FLAG_DYN_RESOLUTION for VC1L
Date: Mon, 08 Jun 2026 12:56:57 +0900
Message-Id: <20260608-flag-dyn-resolution-v1-0-44dc65516148@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIk9JmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwML3bScxHTdlMo83aLU4vyc0hKget00Y8u0FCOTRIOkRCMloM6CotS
 0zAqwqdFKQW7OSrEQweLSpKzU5BKQeUq1tQD6XunffAAAAA==
X-Change-ID: 20260608-flag-dyn-resolution-f39fd24a0ba2
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Zhou Peng <eagle.zhou@nxp.com>, Elliot Chen <elliot.chen@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, linux-imx@nxp.com, imx@lists.linux.dev, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ming Qian <ming.qian@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0200.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::17) To AM9PR04MB8570.eurprd04.prod.outlook.com
 (2603:10a6:20b:435::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8570:EE_|PAXPR04MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: 229c91b0-7ba0-46ae-4b5a-08dec51212f8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YYHmsKkWuKLUl44+cwggE/jnH3fhmbwKCpttb2F7C8eux9LvTgMh7oGaOtFNGYmYVQfShH/R+lz/xB0Z1ivoKilod+LDSN4A++uE/Zxz1AIlHtETBB83ayzh+QVGqAZOKSvUvfoq0cK5u/SnEm35YpTqi20lYAUWEj2piZu8Moh5f8CoK0Gb8Boz3J6BO0DzyoXAgeMSz7lvbz4UJ/30geIpuQf45w5fC/iFu+tRd8/3orpOjA3+RoTbl1UhQEgPTBbye1PKAUDWKiQ30zaAd5OjTe/cK5o3I8WtwmEuIJXhOG9DIDr1OcYTjgkedATMAd9maIG57kEBgs/ym7DiTpxP7qsK3WI3aYG43+37TSBAICrBUMrKkeYIuIXnGzj8V+6mE7gEHjeM7DdwlO5jMedAqssNMkKQYdvs1xNtUl1oUCWowf0IVEhPI/HvRWoyUavDlJirgE/mG6WbVrgIynGGgIMJ34OBEAyGhhli8OXhl5Y6pkmqOcMrh0jXFh9P7E5RBjwy8N9WH8Byw7WPmTckNlJFz9sWO7rjMDes/5wKQEUbbHmfQF4diNVnnIKd4OGmbF0TIpkCdFnHcVmXiBDeeb8Bi4oqJJCQBoVMjuM676OIhTOs6mWkPipu2H8uB2apBnOHA/Lx5Cpv2V4hbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8570.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTdxa0NoUmQ1b3hpRmV5alc1RTJJY2dGL1RQVElLVlZFU1RJVTJhTGRpSjZ3?=
 =?utf-8?B?Wi9iT2Y5Z2hqQzMrOVpNbFV3UDF1MEZldTczVVQ3UU85Nzh5R1JNelI5SDY0?=
 =?utf-8?B?bUhoUnhBZisweVV3dGNDQi9XK1k1ZmxxbUk2c2dSTERLbDlvaHF6KzdBZFNU?=
 =?utf-8?B?R1RHL0F2UDIyMDZOV0JOejQ5M2xnQm9QNmErSDd1TmFWYlFDcHd2VGd2dWZx?=
 =?utf-8?B?S0l4OUl6Uys2Zm92K0ZCU0VrUDdJUXhXbkwxNjZ2VlpGUVVJSEdpRmNiRU8x?=
 =?utf-8?B?SjFwYXBHSW04MmxycmdFL3FvMkQ0UVNJSmwzRTJBSU9MVEhlSC9QYjZqR09a?=
 =?utf-8?B?TGxrUTZUeUxiS0ZybkJ2WXFRVCtTQUk0dEU0VXMzWU8xdjJmZzY4SGtUOUhx?=
 =?utf-8?B?OExmV0tINTJsRmNYZXJybitkd1dzQXkxVzhod29OclprOWtxU0t1Qnk1YW5y?=
 =?utf-8?B?ekl6VWFpRDZPMWxUcG93S2NGOFB6cWpxdkUzSk1aa0ErNy9vbGZNOWltTFRl?=
 =?utf-8?B?MlpTcndkU3kzOFRxWjVaWWdWaDNDRGl4bDNNOFhmWjE4cWt0VXNsa0ljaUJ4?=
 =?utf-8?B?V2dQYVBBb2RNV2pmVDIzdy9GL20wTWRvR3B5N0tjRndKY0p0RWlpMXRibU9C?=
 =?utf-8?B?cm1OUzV4TTgrSWwrUHBLMHpXUlRXT3l6MGFvN0tSZTE5MXVIc0VsbDlmeEJ0?=
 =?utf-8?B?WStEV2RMRnNZSVhFbzEzcG1RSFVSdlZmVmoxb3RFNGR4U3BlMTVNMDJ6NFVG?=
 =?utf-8?B?b1V5Q0hVVk1xL2lJYkcza2thanpMSWpZQk8xQU9heE5NRVFoR2Rya01jNG5Y?=
 =?utf-8?B?ZTN3UWx6WW1uK241VWxMTDNJb2VXVmJnb1pWbTFRSjUrcUdMVmxndGw0WS9U?=
 =?utf-8?B?bnU3OThsc2RBUHBKa1VTYmFKRWlKNlVpQTZ5ejA1eGxpNTlzMk00QVBnRWdG?=
 =?utf-8?B?YzRuTUI4bnBxT2F2ZlpNN1BWSVo5YTVMRXAxT08vT3VQVHlySGp5OHVZS1V6?=
 =?utf-8?B?Vk9IaGJCbzg2bzVKaDVtQ1ZyYWVwaDJkbmF4QkE2NHVRRjZrT21oWUpGNUNy?=
 =?utf-8?B?NzVGQ2NhakxTbm9LeXZqb09PdkYzR0kyRFo2VEV5RE1NYXZTNHJUazkvcmpi?=
 =?utf-8?B?cVpBWWdFaG5QV29BcDNrdWFDYkQxSzRyeURXUmZ4b1NPcEZxc2NtT3prWWhi?=
 =?utf-8?B?eXE3azJ1YnZ6RDZ0ckllM0RWU3BtVEZVVnRWdHNqeXZqY1l0VGJLMnY4M2tL?=
 =?utf-8?B?ZURzY3licWcvN1dXbW9WbG44WXBqZ2p0Kzd4WC9CZ01Qc0d5bVJQcldVSWJq?=
 =?utf-8?B?Q0tUSHdDTXFuZXVNT04vNE9yV3VEcHV2ZklMa0JGRm94VE9sdTVCeUhXYUtU?=
 =?utf-8?B?allZVC91VTl1cUowV25XNFZUTURnTE00ZTlBaHF6b2d3WU84bUFPbmI1Rk04?=
 =?utf-8?B?aExWeUcyaU1RWjZZK3crcEMrc1MzSHpBK2k4enc3czk2WEFyVnAreW1JYlB0?=
 =?utf-8?B?NTA4Z2FpbVRXZWN6RnpTR1RWNy8zN2o5Y1V6NTRpcnJIdnZYRHNTZHd3Z01y?=
 =?utf-8?B?RVI3d2FFb1RReFoxajczaUkrZ1hUM1JsbG1FblczVDZHeTRDaTVCSzErUTNw?=
 =?utf-8?B?RVVyVmdGY0V1VUdvSWhXZTRjcVlMSkMxc2U5VStTMXdLaDhDRXpja0QxZWlj?=
 =?utf-8?B?THBjUkhhNnoxNU9CdDNnVGlBWXBpOWFTZ2lJekgvRHRLclNVZm1sR3ZpQ1Q2?=
 =?utf-8?B?V3FLMnV3WkYvNkkrWlB0R3hOUFBqbEpOU2RKQVFkcVVjcUUxVGVGa3M4N25Q?=
 =?utf-8?B?MEs1YkpYRTM3TW80bjAydzUwOXNlOVJjT1poNmowZ3hLdnVtdUZIWWllV2x2?=
 =?utf-8?B?L2tVeFJWNHh1R1hjVGxuem9XRkpiUGprMW0yYVQ0THpuZHFmVzN4d3cwVmZO?=
 =?utf-8?B?NjhNUHgrSkZHNUdjR1VUaFdvMVplNkdoSHZ4eWRNaExaTkNEVHVyaEdGQjBx?=
 =?utf-8?B?ZllCcDRYVUd3RHhieVpBWmUzRVZKRzArd29jRkY3OXQzMWNWZjZvNnFnOWpG?=
 =?utf-8?B?VDN2WDN6M3dZTkd6TlEzZXZSQ2RIY2l3akorbEdNYnRpdnBDWkp4azBRd2lq?=
 =?utf-8?B?TmI4UlRIVWZ6akxlbnFUcFpXR1ZmUi9EWGZKODI0Z0g4ZU9nT3FIQzRYQXBN?=
 =?utf-8?B?Q3FQRnQreHRXek01THlVZ3F6SXpuRjFQYWdDMTR5RERsZ3hYanh1Q1NpdkhW?=
 =?utf-8?B?R3V1VEx0UVBlcDBMK1NCVjRISzV1aFpISmJZelVzN0Nnb3RXYW1GVUYzYUN2?=
 =?utf-8?B?N0RZZXhtRnNXOUVLTE84alZsMllFTFkrNUJGeFlscmxYUG41Zlc2dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 229c91b0-7ba0-46ae-4b5a-08dec51212f8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8570.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 03:57:35.2953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlTbjno3Vv1GSOBTc06yunpvG5CBXgqssUOwjP3tRl2GKnWmo7jackNGt9Kd7J2VvTcP/eHxGEjmUUnd2dG35g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8443
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64108-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil@kernel.org,m:nicolas.dufresne@collabora.com,m:eagle.zhou@nxp.com,m:elliot.chen@nxp.com,m:Frank.Li@nxp.com,m:linux-imx@nxp.com,m:imx@lists.linux.dev,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ming.qian@oss.nxp.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,nxp.com:email,NXP1.onmicrosoft.com:dkim,oss.nxp.com:from_mime,oss.nxp.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4098C65287C

The V4L2_FMT_FLAG_DYN_RESOLUTION flag was removed from the VC1 Annex L
format in commit e670f5d672ef ("media: amphion: only insert the first
sequence startcode for vc1l format") because the amphion VPU does not
support mid-stream dynamic resolution changes for this format.

However, the flag also serves another purpose: it indicates to userspace
that the decoder will emit an initial V4L2_EVENT_SOURCE_CHANGE event
during the Initialization phase (as described in the V4L2 stateful
decoder specification, section 4.5.1.5). Without this flag, userspace
frameworks like GStreamer will not subscribe to or wait for the initial
source change event, causing the CAPTURE queue setup to fail.

This was discussed in the original patch review:
https://lore.kernel.org/lkml/7f19f803-4af4-f90d-48d5-63fc0fc780a5@xs4all.nl

The GStreamer side of the issue is tracked here:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5126

This series:
1. Clarifies in the decoder documentation that
   V4L2_FMT_FLAG_DYN_RESOLUTION also indicates the driver will emit an
   initial source change event during initialization.
2. Restores the flag for the amphion VC1 Annex L format so that
   userspace can properly detect and wait for the initial resolution
   event.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
Ming Qian (2):
      media: docs: Clarify V4L2_FMT_FLAG_DYN_RESOLUTION usage
      media: amphion: Add V4L2_FMT_FLAG_DYN_RESOLUTION for VC1L

 Documentation/userspace-api/media/v4l/dev-decoder.rst | 8 ++++++++
 drivers/media/platform/amphion/vdec.c                 | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20260608-flag-dyn-resolution-f39fd24a0ba2


