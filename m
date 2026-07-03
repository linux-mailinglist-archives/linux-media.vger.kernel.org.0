Return-Path: <linux-media+bounces-66428-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cHYaGKdiR2oiXgAAu9opvQ
	(envelope-from <linux-media+bounces-66428-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 09:20:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD666FF7D5
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 09:20:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=y18Php5u;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66428-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66428-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC6B7302F4F6
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 07:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3AFF33E344;
	Fri,  3 Jul 2026 07:18:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011043.outbound.protection.outlook.com [40.93.194.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CD52C0268;
	Fri,  3 Jul 2026 07:18:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063109; cv=fail; b=Xmc/L+wfXFrFWnG4uM3IcmZ5sYi8DlWSed9yg3+DKvt9/m1wPUDe369f8vQIG6OwzNLhhTi/8yi+bPZmmMiLlyX3kjV4IsjozXmb5sYVWBqkB9Ry3LegigXNfLIu6Ct7pb+mYvJVRJWegRg5xmichD5Z9maL06T0GUOEaP6lx6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063109; c=relaxed/simple;
	bh=7Oihs+w1FAt0dpM9TJ1NJTL+bvu8ITlwKC26+z1spsc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gOB4iBR8xwPif1aeK7cGAa+JETiJKCt7BfSaIG9Qa6MeUywflkEUPbWSFcCJM1Z5Nd7gZFVKCbzG8sz1LWRHntmgsYcfP/sGZlBDsB/kbCeA8a4L/z8zPs+eesP5cGQA2k9xLuYHLyPAv8yoEo7Bx5W+GiYhzX6ZYIdUZgb5Wro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=y18Php5u; arc=fail smtp.client-ip=40.93.194.43
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RlpnsF9x5atzy2bHlldDL7bz+DGBWfcGk+eCMAwGh+jrODyn6VwpblG89C5FEqUyQJ2B9+sEx789Lams8qp5IxHzTLUq0JS0WeEEFOQNc0LRuxq7Dg1yunu2siubyTyyrquGFblZZUcr6XpKpr4xtToezXU5JfaYAp3eJB2/CchHM7eHvUCJLI3BusjLfeWFKgRFNRIPCS4BAktEDBdnp0wFKtWEZTFh/V7TS8JUbbh6fVXGKLHhzSnkx2fSC+tDLgHmxBcRsCnbGYGCsbMvBW23L8oTul8JmNgX/wpQKnYY5h8yATDaHC6E9DyP+eI23s5j/t7Hnp2+aprS3zfVmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbJjZJIrDSnwhHzE5qpUAoECLDEIg5imBWN1SxMXFd8=;
 b=xGbAc3QdAvuEqRVfuqZmdqYdIioWP508/vUSX3P+LjB70lWn6CkYj1SbNi7+KzWRKPoorqfKg3kE13DZr8nfHoh85pZdEQFVv+1EZ3ip8abJVWdPE3mEd3Y3axk9NKc8dR+qnO2tPT1gfnXH+zvZQ1RbcIUpILj06pUICXFZv6Pe65mFNoJufA3lt1f1Pqhlkmh/GznI/U4yu9Bw1jdIwSmMQ/yYBNLuosVDKUHqv1iEbxfSbTnjBkYcy5U3UJ/cQJWsqDAhfuxQW24WfdCIxADHGJM4yTWl/Az4OGnhsQR3bmlfMINygnIo/uAnjEws6i1v9GX/lEIy6v1WEmM8xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbJjZJIrDSnwhHzE5qpUAoECLDEIg5imBWN1SxMXFd8=;
 b=y18Php5uxHUdrla10qgXD/j+TabtUek9UKXP69PyR9IN3EAmSDhjFIcBPwOTplpGPO/db+zFGcz7CpguhHB6Td80ga/ZjNeJ/iNZkja5BTyuf2E7VWYNZoiUMTlMaUsvRvxwBvC+GAbpi3TXxO7lOaJ4UiQkl11nZ4LE2MoLNEE=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL4PR12MB9505.namprd12.prod.outlook.com (2603:10b6:208:591::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 07:18:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 07:18:24 +0000
Message-ID: <c637c757-181b-494b-9866-27539b0fa474@amd.com>
Date: Fri, 3 Jul 2026 09:18:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: docs: remove invalid struct member
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20260702171234.31030-1-nico.antinori.7@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260702171234.31030-1-nico.antinori.7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0375.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL4PR12MB9505:EE_
X-MS-Office365-Filtering-Correlation-Id: afbec0df-f2ce-47b4-2cb8-08ded8d344ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	YJJm87SQYm1Q8wbcA3WVZ6IsfvriDNqA03rc99ud7aoAJEXkNwy8faGdWU3d1f+FESYKB3tVYnGNByJETFXW5QP++Sl/23hnIsK1dzCDVFk31u180Q1Dfstk+P/HgfofCC99Rt1VVIvJyoqi8SJ+AwQVJMnk5c76hZP2RwZcAxTZCjVZ1g1rhD7Ry5C9G01ms8ZPg/O25m7LhwNmo7jC8X64aYy6msiSlHbtMPz7I53fc9n/HesvoPQQPLzvEJVazXBDbXfRV6RZIsB2JFDJZ76As9p5iihqzZOTbPpDwqRuOx/80ARXcTPaLjKLnh8o2BqbTqtnbYFrRd8hOQIVrxHHRAx9S21br+jfThMpgmqsJOU6ibl3sB2iTZ2j5Bx5f45h7GGMfWUN4avGQtwwfWi6OpmZCU7kmU2BELxvurHV0c5Vf/cktZ+d1tzDiIfjMGNBf3C5vOUD0WWshtJV3QTeN2TOEQpDBvhuuTr7WhoL4sWYyzbvQI8G+jO4fkeMke12CHFLog3xLe5TmKQrwnDZR3pe4TbwXLjy8aUw2ocSHEwS8XpOkqh7aVOtctfzGvfk13zsDgi3RwsK0UrSbaFRrC5Lr38mY8rb48nOHmm/4CTRbrV1V412mteIrknJNxclt+w2Yt1R5IEA/mrZrdnLlYSzoSkhf/AcjwUPFvI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDZPNHdGbE50eDdBbkJhUEppYnNmM01mT1JBbXJ4MytkV210SnVnbmRERVBt?=
 =?utf-8?B?YmRGWXZMSXlwVEhieStwY0RUakZ0RnMvTTYzNlJKaHllUUc5S2FDOGIvK1dS?=
 =?utf-8?B?NCtDSXBaSUZWYlFBek9iK3pFcXdkUmc1YjZQOGZ0QjU4WjZLNmJTUnU5bnBF?=
 =?utf-8?B?VDhvVG9EVkJzUFFjOG1JdnM2d3ZpRGt3ci8vZmd4dE0yUUk3YlBuMjc5d2tX?=
 =?utf-8?B?Q3FoVmk4NndaNzRHZUdBN0Y4ZFRPK0Yzdzhmc0dwRmZTOGtqaCs4OW5xSi96?=
 =?utf-8?B?azZXdGpaeC9TWkF3dnNUQXQwQ3cyd0ZjRUtWQ0tEN29MZVUvTVEzMS9QcDZY?=
 =?utf-8?B?USt2OS9kQ1l1RWQ3STVoNSt1NytmdEJSSHlHVEFsRFpieWc2ZGZtTzBkQm5x?=
 =?utf-8?B?YXBjL2NpVVRJTHlhdS95N01LTE1pYjVaQnk4L25TVllORDRUUy92MjNRaDJI?=
 =?utf-8?B?U3FUenE2UlIrQWdiSTd6Z1Nra3VHS0ovK1Q3UVBsVHJ1MmFqRWVod0dOTHkz?=
 =?utf-8?B?NEE1eUhHSEJ3Yk9hREZ3b1NVaUNtakZOREdCazE5cTRrSVN2RGc0OEM4UmJ1?=
 =?utf-8?B?Z2swbGlHVExJNEh4K2lKQndoaGdQWVVPKy9BZDhYNmVJM2tPUVdOaEJodTV3?=
 =?utf-8?B?Zit3TXVPWkJFZ2pxNUV5NUdCdTVYYkdtU28vQ2FTSi8xNk5Sby9tVXByVWVh?=
 =?utf-8?B?Uk1JdjRYdlk0VVg5Y3NKS1h4bjNVSHlXZEJVZFF1bnljZlZQdVhKS3VrRmZa?=
 =?utf-8?B?ODV3K0w5RmdiMmhKZG9tcWo4azRIRWgrNmE2TEw3bXRHZDI3dkRGMWJOYmNz?=
 =?utf-8?B?U09NMDdBdVpBZmtOdEQ1Rk50UEZIaHdyOVd5RGV6V1VER2FYN3ZjYUlweTdI?=
 =?utf-8?B?Y1NKM3hjMWZDV1IvQ2Y0M1gxV0ZnMng3Q2ZMNFdWcXFoYVVBVENYVnlEV2NP?=
 =?utf-8?B?M1paZWF2Y0kvQVJGOE5GemIzU1RqUlRYSjFDUkxxWVdlWHUxeERYNUc0MFYr?=
 =?utf-8?B?WkRyQ0QvVVBnM3dqc1AxSGJORzQxM3lxKzhRUEYrczhMWVdyL0lwVGs1WDhY?=
 =?utf-8?B?Qis1dW1hSm40T05tcWN1bU53b3BwL1UwWHd4WHkzOUVVVnV4aUlIY2Rta1Ry?=
 =?utf-8?B?YUo0elc1a3lOdWNlMlNSakhQVFRyNjdBdzdjT1Z0L1hncEhtQ1hyN0cwSU5I?=
 =?utf-8?B?Q0FZRURNYkw3TTFvcU1GTHk4eVNNWldUcC9jMWltNk12N2hCQ2dOMDBFd3Qr?=
 =?utf-8?B?czQrVjRCYm5JZjhsODlGVmllaWhwNHQvLzhIOHJZWnRHWWZ2cEhxSWhHdmNp?=
 =?utf-8?B?R3hLVFg5ZWF2Y0Y4WWpRVUtnd2VYUVZYdTlxeFRCZmIxNWRCRHcwazB6Tk1L?=
 =?utf-8?B?SGsxS2d0UXR4OXJGcE1IckQ4NHBLSzVWQjZ2UHdacVhWY28yUG5MYUVoRk1s?=
 =?utf-8?B?NWcvVE5DbThvNGhFcExzWTBEa3ZPK1QraWNFSzFId1BtUFJDVmpoaGxnOWdo?=
 =?utf-8?B?R2QyNGFHRkFETXVReUo4c3FTbGtaR00vMFBzRzZwTnBnSFlnQjNQemIyNmcr?=
 =?utf-8?B?NTJxek1URHJZMDdvOTBLakFXdXFlUW45NkxPSkxnRGc5aGNBZ3M1V2tWVFVP?=
 =?utf-8?B?N2h3MUI4VlIvdWlFZmRSbitpeEJXU2ZZRjBKQXdIT3pEaW5RdldNdUJQc2FZ?=
 =?utf-8?B?TE5WUDJmMlc5UDZIbkNMTVVMMGp0ekpHS2d6MmVQL3B0eTlmMi9ZV2pTVUJm?=
 =?utf-8?B?aFllb1ozeGNEaGRoM3JYT25QMU5EOUZWaXBRTzB6a09hM0xkNXl3c3BjeVZK?=
 =?utf-8?B?TkE0bXd3TURuWlBFMkNGWWRrUXpSSXJ0NnNkamh6QUdZT05OMzJ2TGVzRlAr?=
 =?utf-8?B?U0Q2c2NWbkl5OHlHSUhtd1pXd0pHM2dYUzNTVmMxUDhxRnZWdU12UjY0dUJ2?=
 =?utf-8?B?ckNkb01mZUtldldoVEVqR2FRcGE2RWM5OUZuWGY3SStzSC9sL2ZvQ1BGKzhN?=
 =?utf-8?B?Z3UrczhvYVF6bDEwejNUeXJZWjhrQzdJY2VNRlBzbGxXMXJwVXpYVll0UlQr?=
 =?utf-8?B?c05qTnJVN2g2MmhxOWgraWxRZ0Y5QTQ5b0hiK2d2U1U2UjdjTUg0bHJhVkNH?=
 =?utf-8?B?UnNtU09CZXFsSE5ETnV2cjZYUVdvN2ZxVUNKeS9YWVRQZHhOMktQazIyL281?=
 =?utf-8?B?QWFWMHlVSWV6VForYlNKc1YxbFZqWmdkQktFc2o5bmJpMXpTNno4M1Z0eDNV?=
 =?utf-8?B?dTZtLzRNNnBNZlkzcU5ucWtGV1htWWpRdVVzaU1ZTVVsY05hZGJLTS9KRUVx?=
 =?utf-8?Q?UcAwisOz/esAzeM8aA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afbec0df-f2ce-47b4-2cb8-08ded8d344ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 07:18:23.9324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWRMWe1jB7LaZauD6E/1ZSDnkQISFdwFvcgho++oA5D3iETZkIr5TjkrRadGEMsR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9505
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66428-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nico.antinori.7@gmail.com,m:sumit.semwal@linaro.org,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-kernel-mentees@lists.linux.dev,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:nicoantinori7@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBD666FF7D5

On 7/2/26 19:12, Nicolás Antinori wrote:
> In the structs dma_fence_array and dma_fence_chain, the field 'lock'
> has been removed, but its documentation comment remained. Remove the
> stale descriptions to clear up the following kernel-doc warnings:
> 
> WARNING: ./include/linux/dma-fence-array.h:47 Excess struct member 'lock' description in 'dma_fence_array'
> WARNING: ./include/linux/dma-fence-array.h:47 Excess struct member 'lock' description in 'dma_fence_array'
> WARNING: ./include/linux/dma-fence-chain.h:48 Excess struct member 'lock' description in 'dma_fence_chain'
> WARNING: ./include/linux/dma-fence-chain.h:48 Excess struct member 'lock' description in 'dma_fence_chain'
> 
> Fixes: 5943243914b9 ("dma-buf: use inline lock for the dma-fence-array")
> Fixes: a408c0ca0c41 ("dma-buf: use inline lock for the dma-fence-chain")
> Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to push that to drm-misc-next later today.

Regards,
Christian.

> ---
>  include/linux/dma-fence-array.h | 1 -
>  include/linux/dma-fence-chain.h | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
> index 1b1d87579c38..0c49d7ccefb6 100644
> --- a/include/linux/dma-fence-array.h
> +++ b/include/linux/dma-fence-array.h
> @@ -28,7 +28,6 @@ struct dma_fence_array_cb {
>  /**
>   * struct dma_fence_array - fence to represent an array of fences
>   * @base: fence base class
> - * @lock: spinlock for fence handling
>   * @num_fences: number of fences in the array
>   * @num_pending: fences in the array still pending
>   * @fences: array of the fences
> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
> index df3beadf1515..42289f505164 100644
> --- a/include/linux/dma-fence-chain.h
> +++ b/include/linux/dma-fence-chain.h
> @@ -20,7 +20,6 @@
>   * @prev: previous fence of the chain
>   * @prev_seqno: original previous seqno before garbage collection
>   * @fence: encapsulated fence
> - * @lock: spinlock for fence handling
>   */
>  struct dma_fence_chain {
>         struct dma_fence base;
> --
> 2.47.3
> 


