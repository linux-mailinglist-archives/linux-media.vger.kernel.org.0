Return-Path: <linux-media+bounces-60904-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPpeMX6p/WmEhAAAu9opvQ
	(envelope-from <linux-media+bounces-60904-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 11:14:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB2C4F41F5
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 11:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BD343038BA7
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 09:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D68C389455;
	Fri,  8 May 2026 09:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gAbiJgrP"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012071.outbound.protection.outlook.com [40.93.195.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A1E388E5E;
	Fri,  8 May 2026 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778231413; cv=fail; b=kowoer/gwEmfh8YIAohHVPVZwhtYhhvhzLQDcxoY6IQQK+AmD3KHWyYF1UWaKAJneWGIcg1HFvUGNL0GvmgSaoCfvPOJCn2fLPmTEk9elkGbvdpT2jF/Jx/7U/5NodHBn7Nmh1k+eRO11rHOrgMfT/cUnfsD2JAecNyYSX+UoRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778231413; c=relaxed/simple;
	bh=Ezt4+4uVa302xhuact1oWrcF4Q6ai5b6H/uoFG/cCr4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aWw1KCOpOAYeUxkR48VVLe2xGQ+WcKTy30y8uL+S3TaHwEl86M92mYxHdG1CHzltfKhmbVk7mKQ653QC8gBLPaiILTblu4vJlWRZ6gVqdHM5e2RfRZveCZR/Ift6edfvzDOQsmaL4DZ4yOCvExCKM+nftwstOR7CkJM9vyQ/jZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gAbiJgrP; arc=fail smtp.client-ip=40.93.195.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIvIOAPZe4jEaj/lEloOO2wIgwrh4JoINpLGcRU4qlvLBuQq33IKSqaKd/wYa0FLr7u0VpwNL398O4okI1uCdpBaLpowqTLYFTCqjAkEE7T3i5dnncbORVmepuyUahnsgr+cGFhfTNq+TKKKbQgYsxbRSu82aCx7SqQIWHYn7P2WVHP68+gwJcHcMhq0XMcuNnOpXRdcdeYqSQjX9jljHEjP6YheZfGE1gOj+9HnP/9ycTviYFznRCl7Q0hVw5hiIwUFY1HB5N/HoX0swkDbqDdESD0AQyvzDZcO3tFmDHTtAlMSNd4fRVUbwZ0n01LUCK6K3yuMV9Y8ne0RwDmV1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GC+/l6OKL48st+7Lob/Nb09OCKTkeo6oPtZkJbhw16M=;
 b=ekqKh4Bhazc9uq9eStHv8M0QTmqlgZrtSK6SGBXOdyRjwsevsOxP7O2PizmehBZpCb+cYgem2WtLxelb5oMUxdJcKpHzL2qNLZIcpdLDhBo8tD80VPqnCz84AqolmmFakZrtW4LP4H6lTJ1Ga/DYEkG4mtcdjc99B4xomVlIQ7QZeOPQEWVenraDYuLa3g0d0eLn/WtJsHzxwc8hjHUc5BTgyDMCLYRXKDrL+Caal0sS3ilHEmQi/ziEd7Yo8x4YXpZSzxfPx+XlaSTqzRu28gG/1DbU3WyGIyUx7/WqQz8a+XzDr7U0LI/2aWGL0RfuKQK9vE4dxeBPthV7CJ7GqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GC+/l6OKL48st+7Lob/Nb09OCKTkeo6oPtZkJbhw16M=;
 b=gAbiJgrPPL6Y5lMNTMWLnk9/lIbHr4g+YH6ykIba3ENZwpJoORPfTdTx2+/yHZXm+Lz85U5y/IetCI/YrFKaBnTkSuj8MNm50Vab2/xyTnrO+ZkwcTR3XM8XsLZHHRyKBP0JQ4oyL4RFXwPlDkQKAM5rVltm3F/ykqbsmyaIYBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by PH0PR12MB7789.namprd12.prod.outlook.com (2603:10b6:510:283::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 09:10:06 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%6]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 09:10:06 +0000
Message-ID: <e5910426-032b-4c34-9f48-d3b5aefdcbf6@amd.com>
Date: Fri, 8 May 2026 17:09:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: platform: amd: avoid -Wformat-security warning
To: Arnd Bergmann <arnd@kernel.org>, Nirujogi Pratap
 <pratap.nirujogi@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sultan Alsawaf <sultan@kerneltoast.com>,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260508075926.3698178-1-arnd@kernel.org>
Content-Language: en-US
From: Bin Du <Bin.Du@amd.com>
In-Reply-To: <20260508075926.3698178-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|PH0PR12MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: fe61667c-814c-4603-d3f4-08deace19892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	h7yFIeD6CcL3GH2P0Q70MGjtGcaWnOmVgAfSaa8eFhLzd2TFU5dzEX1ep0KxwWciai8I4RKKvTkcqGU7fBp5GPC7wOCVB8k9QftrAsK8GrY0FlQToMLIfnZMlkZfOPWuak6nNbtSlwbo5WWxIMf2TbasaE7tedhMd/nGVLNtAzLkSIN97liqUfhlCEFfDO6gQ++24EXR+xN3VtHFQ+I/FBVdBT86rotNMgjHx7Wui0JaLrwhjPdIq0MsH7IIoEz4uKaA1pDjh/74XjhD2GotmnLgJhXyNOO+IY+dQ+BoO2rFYkbjRs9bgy8KDcYgP9sAkBkUZw0fPJAuQ8yPQRAKDfaitmjWIZDq48m7sUjEjRxm+4hQ43t0VydNMUugiSdAcCmgrfhhRcVnYXPJ98osytwbdBffKWyw3O0CwWNPm64BjtWPKtBMNiZLSPzEdie060q7mSmrF+S/WR6grmjMV7AzrovJSWPHzDrlxmGPbPwW9tkriIuvp9FhxS+DEj3OKoG9tTDr3lZ0Hxf3dKrE4KfjUSHmOhT0qEb1/bTKU5XCryKqnKC6YcNxNJm8cEF3m1mmkK2V+qwXqbMzGdpH8SyRcJBb7o1IADWKLwzoj3h4QIXmq+1W7QHa7kA/fBRnusYOqA00TnXG+VFmcwf4isG5CKJ6wW7JJyrqjg6kNIwJxmvdHB4IrXoe8zAQanCv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDhRTVJHUHg0b0dUb3d0VnZveGs3UlhBZUtIQnZvWTdCOFpIWkFja3Zsc21T?=
 =?utf-8?B?bjRORG9YRUltMGw4R3BQM3FiMlJ6d2N4ckUzZVhnQ2ZVT0xkb002cExuOUFq?=
 =?utf-8?B?Ym96bTBPNk9nMDgxRitWb3gwcnByaG55bEh5MzVuRUkyN0h5Tm9mcjhzdk1C?=
 =?utf-8?B?QzVRQjI3bDhaZGRkVkFvbjFkRnRPNTFBcEVNS1dScVF0RllleklBbEtBbGR0?=
 =?utf-8?B?a3dXcC9qMTZIQSs3d0VrRzROckxGREs3SU9iQU1mblErSEw1R3k4UWZNV0hW?=
 =?utf-8?B?VVJ1VTUwUGkyQmJta25vOGhySVRWUUVZbHd6a3lPYXQ1K3RhdU1vVmQweUNq?=
 =?utf-8?B?STRLcVJQVEY0TlE3NkIrM01FSUUydWdHR3c1NlY4T3hvR05qZnlGZFdmc01G?=
 =?utf-8?B?alE2aWtHWndyQUhzNGVCSW43aitPSDFaMHJXR1hqSSs1N0psM1NSaXAxOGw0?=
 =?utf-8?B?bUhUK1VPZUVMV0tXN1dqYkdFVWVHZjQ0NG5qeklDNFM4cTlPWEpWbkc5YlBK?=
 =?utf-8?B?UTdZeFo0MTlTMEw2cGo3TkluS0U5ajdwOSs5eGlTMzdCb05iQXBibWlZMEh1?=
 =?utf-8?B?N0d0Q2xTNUZXUWczM0NtWDFhRXJ1UWZEanBMOWRsQ3A5bGJlSEVndG5ncXZ2?=
 =?utf-8?B?bys0bnUvZDkzajU3K3NtdFNtT3BxTjYrVHZjS2lHZ2FhekJyUUgxYWx5MXNX?=
 =?utf-8?B?Z3owWDJTUm1rcHhSYjlqeWp3aFc3NkZiMEVLN3VqY1lydmJjVi9qVk5Qemkz?=
 =?utf-8?B?WmJLNUpKc2x0b1BpNWdaNk92QmtqVlliVjJjVkUzVmNOMWZJNTFrQm1yMnBV?=
 =?utf-8?B?dUtTOVRsRGFFNForYjRTNWpUWTdJZlNaN2xQSnV2Qk5GaUNYZFhxZnMrMVVE?=
 =?utf-8?B?RU52RFVKaWRjSS80VzBKZXlpQkpOdXdTTm5qcDdnMmthWkJ3U2x0NVRhbUJD?=
 =?utf-8?B?Z252VkxJSjl5ZFd0aGtYUGsvTFJSc0R5L1RzekNTZE5zUTdoMWJITGlkdnBX?=
 =?utf-8?B?Z0NCcHkyUWtKay9TUFcvS2gyMnJ1Qk5MSEpwTjlHeEpaMW9KT2tuRm5LejIw?=
 =?utf-8?B?ekI0OEsxd3NYUE8vMEVGMmZPZnBZNE1Ra2NRZHlQMHlJbEpNRzdaNHFIRjIz?=
 =?utf-8?B?N3E0M3YxL0w0N3RuL2ZaaWJCcFBoTi9jLzJra1hYbEZlTnh0T3JUQjVZY08r?=
 =?utf-8?B?T1l3ZWdBNWxjMXhpeVhkWThrbXozcWJCd1lLN2Z5M09DeXdQOXUwcEt3Tm9L?=
 =?utf-8?B?QzRvZHNQdUdqNXd4U0N4YTB0ZnVaNUEwMDcvRDNMdGt0QjV3UXdjUlkxMWlX?=
 =?utf-8?B?QnFOaU9sM2pDVzYvZFVJS2s5cHhDSE9pUWtQUENXU29jbVFOVzh1b0Q4WUw1?=
 =?utf-8?B?UDV5S3lIOEVDY2hjYXdNV2oxTUdGOHNmMHpHNGo0VzA5S09WL0I0aGh4UlAx?=
 =?utf-8?B?K3VWMUV1cDdrUFNXRVJYU0R1SWxGTVVJV2o2YVJ0VEFEV3I4b0NNS2RpU2VS?=
 =?utf-8?B?L25QV3JLa1ptZlgraENydkRCOUZFSkdicGkvaE1QYVdPN1YrRnJkTFNRNjdY?=
 =?utf-8?B?VllQY1ZuY3BUN0p2WlJKMmtxNzhZUzBPcEhneDdCbXdCK2tsVmhxWW5FZEJD?=
 =?utf-8?B?NkhJOXczaCs4RThheWVsN0lhQ2NwQUNDRWpsLzBPdVJueG16UGRHOTdBL1ZF?=
 =?utf-8?B?RmhJR1NxbW5TNHd1TTV5eWZJT3BEYVN4MUtqaFpRRzVtMmdPQjhiVDRURGdY?=
 =?utf-8?B?ZXNKQXVJSUpkRzQ4UkpsWFAvcnBLKzRtVDVOMmxibTAvNmdHT2paNnNUM3JF?=
 =?utf-8?B?ZE9EcS9GOXhVaTc1RHlXcVdWZWdjc21FcnJNcTB6M1FqOFZManh1OWtBOUpl?=
 =?utf-8?B?Z29saVRZM0dSSDM4MldSM0dDeHNiSEUvQTFKYlU2OGhuVnVSOS9zVi9SVTlw?=
 =?utf-8?B?ZGFXWGJTY2ZHNjViN05XYllyQWJudHBwdGZvay9PRkxnMGpvVTN2NDVZRFE3?=
 =?utf-8?B?Zlk4K3NWcUI2N2dvdnBQS1VJZWRVejFXSlgvMDhEQWRlbElDem9XSUp1cHNQ?=
 =?utf-8?B?aE1RN00zdXdobWlyTnRJdzQzTUowSlpTUjdkSkdMYzFaVmZIaXlDVVYvUVhs?=
 =?utf-8?B?a1pSK2tXcGxRc3FGMHl1VlBjQ0Q2bXlobytqRjkzWXV5WXJreGtpQW9PVS9H?=
 =?utf-8?B?S3lpbU1jaktGenMraVFXQjlnM0ZhZGdFZ0hHZjJBbGVwQlpxY3gwU05QUHVB?=
 =?utf-8?B?bnV6MjI0aUMvZk1BUGhKVWNKdGNVSDExRzUzVkRhTEsreS9Kb0FSeThrNjBI?=
 =?utf-8?Q?FTITrCvzHW2iPDqnOZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe61667c-814c-4603-d3f4-08deace19892
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 09:10:06.3571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Css0xvspgymUBo9ITZVICBUOqMoFuZ2FYj6PDjzS7Xf7RLt8vJRWDMjlMPBhVaXF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7789
X-Rspamd-Queue-Id: 5BB2C4F41F5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60904-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aka.ms:url,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Action: no action

Hi Arnd,


Thanks for the fix. I applied it on top of my current branch and 
verified that
it resolves the -Wformat-security warning in the ISP4 driver build here.


Tested-by: Bin Du <Bin.Du@amd.com>

On 5/8/2026 3:52 PM, Arnd Bergmann wrote:
> [You don't often get email from arnd@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The newly added kthread_run() call passes a string variable as an sprintf()
> style format, which gcc warns about when -Wformat-security is enabled:
>
> drivers/media/platform/amd/isp4/isp4_subdev.c: In function 'isp4sd_start_resp_proc_threads':
> include/linux/kthread.h:71:16: error: format not a string literal and no format arguments [-Werror=format-security]
>     71 |         struct task_struct *__k                                            \
>        |                ^~~~~~~~~~~
> drivers/media/platform/amd/isp4/isp4_subdev.c:596:38: note: in expansion of macro 'kthread_run'
>    596 |                 thread_ctx->thread = kthread_run(isp4sd_fw_resp_thread,
>        |                                      ^~~~~~~~~~~
>
> Use an indirect "%s" format to do this safely, avoiding the warning.
>
> Fixes: 4e5e7a7ddb4a ("media: platform: amd: isp4 subdev and firmware loading handling added")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/media/platform/amd/isp4/isp4_subdev.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
> index 48deea79ce6c..86680ec8730d 100644
> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> @@ -595,7 +595,7 @@ static int isp4sd_start_resp_proc_threads(struct isp4_subdev *isp_subdev)
>
>                  thread_ctx->thread = kthread_run(isp4sd_fw_resp_thread,
>                                                   &isp_subdev->isp_resp_para[i],
> -                                                isp4sd_thread_name[i]);
> +                                                "%s", isp4sd_thread_name[i]);
>                  if (IS_ERR(thread_ctx->thread)) {
>                          dev_err(dev, "create thread [%d] fail\n", i);
>                          thread_ctx->thread = NULL;
> --
> 2.39.5
>

