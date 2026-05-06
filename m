Return-Path: <linux-media+bounces-60568-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEojOEsN+2mbVQMAu9opvQ
	(envelope-from <linux-media+bounces-60568-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:43:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA204D8D01
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75DB53046CFE
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 09:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110093DC4C9;
	Wed,  6 May 2026 09:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5gnfgrLa"
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012013.outbound.protection.outlook.com [40.107.209.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DF03E3C45;
	Wed,  6 May 2026 09:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060504; cv=fail; b=IhD0XdchYw5iIG7d3GHDQtw8tHnMMD8ODJZ1Tzu3cc2vgUfBXLS1ustfuDCBbfp0oSyFYQ15rykavnVRkEW81IT9USYnUhrvOHP9nGOCPQzT54vhjjQCZMQRiFvz4l3GpUctB5HflubIA43lxF7IggNCTa5v24pz26NnqiSpiyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060504; c=relaxed/simple;
	bh=hAXfPCIe2c6GNpS3Hjbzd9McJBOmugYoxOdZoHsuKyo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I+8sGc41OVIMkBMHsBd38CZmWCZ+XLGfRVvu6MCO6MFevepUJI2K/uz1Xj7VXEIjip92L4VCkbQI0JFGMGEZBCAN4pMS6hvVTZe6Yd0Sczt7YLPPCHrujZb2EzjR/OXf+JomcddvTguG1Ckqh1lchNYPVdRk+dRoIrc3HW3Av+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5gnfgrLa; arc=fail smtp.client-ip=40.107.209.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTKpuhSmYPBwClhkgSoa8OxGmsmfSOJen2jQ5iUKVAnFYVJWmaAUMBLz93aO/jOdyFlhu/3DAPD7XuQgg3da5AVvwE34pX/S28mNrvIsgNVvFdKPdz7P+0Y7qJnJrTZ+C7IDKVpOHN+Gy7S+bWTVbdd+pZG2QktioHhaAY39fBMWgIykD03vpNaMcBZQS0+2qnOznZdO3UJsHUk/MxouyQvCLm9stzoM4YGJgkHNXbh3jsWjEzGAiE0U8NXfkg6UqJz2jUY4E4nPLnhdvF5SQE24FM2a6FpxmZeXy6EHy7BITjr/wbxaEUS4mQXW0YxGILv7A0LVLKaiExnpLjgViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMnhcqSXucHt67RxbpCPFN531Yb2jsonYzFsKbPC/po=;
 b=GyFZs2L8O33mFD/kaE2Faiqkj1G0JPkrXkFtQIh7XExsVyM9fsdwVc1B5d88s03gAuRCEDFuqhf2qWm/oZlfAtS3NLLaz3JMlNfG6mVlvPEEtzqJoKAKYdf/Csiz/+tJThgzw5z2G2Yvh96/DymgoSKaZP1hLHz+ToamTI8CR2LZwuMXs71RRxNVubjUOuEW0Y7zaktRwn+eLroorR/RuNxR57PnfNj+J+u9HiU7AFeTpjM+oZDP0AYtICjMoYRaYZACUJndSfjonjCVMgWtJkaItrHZ8S5cYizIoDgeOdtVvj9TmyvNMM4BhJj/JNvjIRlXWqgSNQt6s1HdaIoM2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMnhcqSXucHt67RxbpCPFN531Yb2jsonYzFsKbPC/po=;
 b=5gnfgrLapYkIStr6Xe+7wGhX4+/eh6vA5ouoR+ej8vA1GXZXXBRsYVYhHrP3n1V7XUKxdjYkryDvCpi6ixUnvPkRXGom0KlNkPsgvZrz+eePKEcMt0xVDkoWpKJHdBMak8N3O0RjhcQdp70XfKrzMh8M8x4HK9jfikfh0z4NVWM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by CY8PR12MB7434.namprd12.prod.outlook.com (2603:10b6:930:52::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 09:41:39 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 09:41:38 +0000
Message-ID: <21140553-f207-468a-9357-a0ae08aa28c4@amd.com>
Date: Wed, 6 May 2026 17:41:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/7] Add AMD ISP4 driver
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Cc: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>,
 "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
 "prabhakar.mahadev-lad.rj@bp.renesas.com"
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sultan@kerneltoast.com" <sultan@kerneltoast.com>,
 "Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>,
 "Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>,
 "Li, King" <King.Li@amd.com>,
 "gjorgji.rosikopulos@amd.com" <gjorgji.rosikopulos@amd.com>,
 "Jawich, Phil" <Phil.Jawich@amd.com>,
 "Antony, Dominic" <Dominic.Antony@amd.com>,
 "Gong, Richard" <Richard.Gong@amd.com>, "Tsao, Anson" <anson.tsao@amd.com>
References: <20260320084146.200988-1-Bin.Du@amd.com>
 <7d5d52bf-b0dc-47d4-8cb8-d6099fd05c57@amd.com>
 <470a9fbc-c4c2-4bde-a91d-a22f1c730b31@amd.com>
 <LV9PR12MB982900FA14329B742FF64BBE875EA@LV9PR12MB9829.namprd12.prod.outlook.com>
 <adSlwqPVF81feLHx@kekkonen.localdomain>
 <21dfb3d2-d838-4325-8a6a-6024b851cbc5@amd.com>
 <afpSBiF8sUqulE-7@kekkonen.localdomain>
Content-Language: en-US
From: Bin Du <Bin.Du@amd.com>
In-Reply-To: <afpSBiF8sUqulE-7@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0037.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:4::9)
 To LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|CY8PR12MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: e485b01f-0f44-42e1-c087-08deab53abc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	h/1oSeNLSboK9xybjOgvCSah6i9kjqmqW4ehqEUbTJKIkCnwBC7Io0aDHv4PBlQ9NRkFSigIcuaJ0TiimPSHunntSt/oTy3TSu/brMYQ2z0AKz8XZHstWs3uf6KS1wwrZNfYju0TMSStW+YZu/7hY8kl4UoBbvCXXsWheZZIEXLJ8NRR5c0dwl7kkbMVqTELG+zAiUxLA/OFZdF11ashUJaudCRrIZn7oVkwyvAA4bI1U8xHEHU5gk15aorpOOlwc9hRtHbJRcCTwASXZT7cosuAob/k/p6oYmosDaGmtwWuBynQKUkQtQhh46vvCQJ49QBjoKNh74BqwaKAaZKgKOKTXjJBSvPozbwijcHWPdg32iwg2XpsWiU/N/QzLhRZcMEuhK5VShZ7QceFWiDxSUTka2QI+FCv1HSxWrFG68cckhnQtGKzpEaaFaNA1HR55SdhL1AByw20pofasBfID4j9naOC1/ml20rITvVTx37ScvaAw4oB0fTxcJv+wE3SI5c84B6P7FbCIiwm2L/11U4KpJHQB7plAWn85fvy3q4D3aZC6pnPECO3qLjay0iyQVmGeom+pMFlufUZiCJvBHJAAXHXELYwy8w/tnv23o/oVRTKkNucVmXFemfSrzVXxDtNylj5KAWU6nCYgHk++Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ek9wckpVNENmMlNlaGN6TFVsOTZLNWlqOUNodHhpckxqNnFxbVAyRFluenk1?=
 =?utf-8?B?MUQ2Q1lrZ0F3NVVXLzh2aVlRdlJYUlYyRm5aN2NyTTJCZWg2MC9NZHNBeVhu?=
 =?utf-8?B?TW1JRk5PRVhzNWJyNXQ5TE0wVE5aTmY3RlEzemkwalZOTTM5M21iY1ladjl2?=
 =?utf-8?B?SUlKdEc5RW9Rc0MzeVdvbzMyU3NnQXVqMG12a0x4NkNncnp5OURRYmVDdDA1?=
 =?utf-8?B?K2Fna3Z3d0ppSUFaYUFtYnVBTHBhWmNIUW85SjFvNVhEWEYrUTdqK1Q2R1Rm?=
 =?utf-8?B?TElHNGlFRS80bnBNS1BFM3B3TVc2ZWFBc1hkVEU2M2EwRDBpbjdZVVU4NTJs?=
 =?utf-8?B?UkplVUxURVQ0bWdZVHdHWEhrTFQ4M21DSFZKMmdUbm5nYUpCQ0ZyMFZsUzdW?=
 =?utf-8?B?WVBnbXVKZHhUdEFpTXlJcUtIRmxwQVBtR1ZralVodFkvOHRjZkE3U3daeUJi?=
 =?utf-8?B?VEFlRkRkUGI0ZWpmTDJ0enFrallhcVpmL1pkNC9pMXc1K2Z4UjFaZy9YWW9T?=
 =?utf-8?B?S3dQSXBtZVVrWWVjMnJKZWtZbktRL3VaZU9oY0UvT2dwajZVOUh3dFNaOXBi?=
 =?utf-8?B?eXVEL0Z1a2xkWlA3MnFiM1MyM2JKVGZSc2NKbTUvZUVPZjZJR2s0OWZxc1dt?=
 =?utf-8?B?cUpXNmo4YmFwcDdVZ1g1a21MaXgwUGJOMDRYSC9vQVNTVkRpUVpMbUljUmZR?=
 =?utf-8?B?ck04LzRQckNsM1NFZ2tDZmlZc3BySHY5UitZVC9MWmxIKzNWSG5mQVo5UEp5?=
 =?utf-8?B?Z3NIaGZnekFvNzJnVGhTY25nL2VLOFpEZThDSXlqSkhaOEJoTm9RZUZQZllV?=
 =?utf-8?B?d3kwNzVxVDhvQWR5Y0RFRTd6ajVjdGpZb01pRlplc3FMUTFBMkFxYng1ZWhv?=
 =?utf-8?B?cDZHTFZSZkZ2NDFvVTYycXptZnh6ckhQTnhkdU9aQ3d1U3RyQ0E5ejE2d2du?=
 =?utf-8?B?SnEvMG1KZnY1T3dTSkE3M1k3TlU5Z2lRMkh2bENzTE1VUU85RVRTcjYvN3JL?=
 =?utf-8?B?a1ZxZkNSUzlHOGVTRXlVY2llNWk2Vm5tb2dvWTJKc01INnYzb0pNV3R5c1B4?=
 =?utf-8?B?Uy8wTEFGTE01U1ZiRk1hRXBhdDYxZERQa3N2QUVITkV4VjU4YkJ0WVJFdFNx?=
 =?utf-8?B?Y2UvNGVlUXlxZVYrM1ZtTFVaayt6R0UyY0Q5YXlIdFQ3Y0FTWkNNbkJJNGRV?=
 =?utf-8?B?b2czY1haTDNPcTdHdEtOVXAxM1FIUno0dStIaGoyRmp4NUNSL1gxVVJiK3VC?=
 =?utf-8?B?bEF5alByb2t4VjQyNVFaUHZncjRqK0Ewb0RVY2txUHJsVk5lMjVEZG5mRUtG?=
 =?utf-8?B?NDN5WGx6MmErK09jMHgrVXp4KzFKQkg1YTV3NEszd2Q1RnU3Tm9TRGkyNlB0?=
 =?utf-8?B?MnkvL2hSejJ2QWFzUEdXbDA3UnNhREplekJXWHlxMHhJdjV2ZE91QVh4akxT?=
 =?utf-8?B?Yi9MRmJqd3VsakpmMGNJVVVuUG1lMSt3dDFvZmFHdlp6TDVWMzRmcFlML0JI?=
 =?utf-8?B?blBqZHJqK2h0ZnNFRVBsbE8zcit3ZjJFWUFidm9zQXZjODhPQVpidzlaVEtU?=
 =?utf-8?B?dmRPYm90NUFhUEVBcjRsT3BVUFEvRVJWelVPVTRMYzFrNnN1ZnJ3Rk40ZTBP?=
 =?utf-8?B?RGhZTjJlR3dPQ2F3T0YvQmwxTzlPOEN4ODh5UUQ0YjMvbEwxclpIdTltSUdj?=
 =?utf-8?B?RWx6dEpqa25DalJEQjdGeG1mUEt2MFA5aFF3clFnUmpQd241dmR1UU53Yzdo?=
 =?utf-8?B?d1dIenI0RjRqdzA1MjFjelBLWjd2K0RvaGF0ZGZJZm9lb1l0NjNId1JHTUhM?=
 =?utf-8?B?MjlTcG9TKzJSeFBpbk1VYkNLSDdmTGE1ZW9GbDFBU21HcTc4K2pPY0Q0cG5M?=
 =?utf-8?B?UjgzNkNWK0lvcEVmWWhLNDZCNkFRcXZtaTMza080LzRib29hM0RTdHorM1k4?=
 =?utf-8?B?Ly9wWWkyNVYySlF2YmFnZDRNWm8rWVd0d3B6ZGhnVmVwc05PQVoySjM0SkRM?=
 =?utf-8?B?WHlUUG1vZUlub1NSczh5anRCQnluUzFPOGRScmtBYmNUbURWaW5CcHNsZXBp?=
 =?utf-8?B?dlVMZUE5NDNZenlDUUd5T2RKRGh6T2hqazArQ1o2K0Z0cS9GT0FlckIyMlhz?=
 =?utf-8?B?T2g4aG5TbnBsY21KRnVxTWhkNHloUXd3cVYwVzlIR0VhYldYOGhTUjdVQkh4?=
 =?utf-8?B?MElKaStlWWNtSWd4QURkRkN1Y1NKWmt6bCtrZnJ1Z3hQUVdubmVIT01LZDRH?=
 =?utf-8?B?U3U1ZERaSStlWWVwL0daQkNRbFY4WEllOVFERE1Dd1Q0V1VpQkd3MGpONHpH?=
 =?utf-8?Q?Phu5cZSPqNSLwBXDzW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e485b01f-0f44-42e1-c087-08deab53abc5
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:41:38.8634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqWPr9FRQyJY9f+ei68RkdeqNsLoWRbLkr3LjV/9YbMq7093YRaVEsmX7h/jLHCg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7434
X-Rspamd-Queue-Id: 5AA204D8D01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60568-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,xs4all.nl,ideasonboard.com,linaro.org,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,amd.com:email,amd.com:dkim,amd.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,checkpatch.pl:url]

Many thanks for the feedback, Sakari. I've sent v11 addressing the 
Smatch false positive and the new checkpatch.pl warnings you pointed out:

<URL: https://lore.kernel.org/all/20260506093250.93460-1-Bin.Du@amd.com/>

Could you please take a look when you have a chance?

On 5/6/2026 4:24 AM, sakari.ailus@linux.intel.com wrote:
> Hi Bin,
>
> On Tue, Apr 07, 2026 at 03:19:20PM +0800, Bin Du wrote:
>> Hi Sakari,
>>
>> Thank you very much for picking up the series and for updating Patchwork. I
>> really appreciate your help and support. It means a lot to us.
>> Yes, that's right. <20260303224433.87242-1-kinncj@gmail.com> is no longer
>> needed.
> The Media CI indeed does check there are no warnings from e.g. static
> checkers such as smatch, and this lead to build failure earlier. If the set
> would be merged, this same smatch warning would pop up as an error
> elsewhere. So in practice it doesn't matter that the smatch warning is a
> false positive, it needs to be addressed. You should check smatch is happy
> with the updated code.
>
> While you're sending a new version, can you address the new checkpatch.pl
> warnings, too? They're trivial.
>
> The best summary is here
> <URL:https://gitlab.freedesktop.org/linux-media/media-committers/-/merge_requests/278>
> I believe.
>

