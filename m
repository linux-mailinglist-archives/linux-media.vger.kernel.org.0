Return-Path: <linux-media+bounces-61050-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDJ8I/2JAWpJcwEAu9opvQ
	(envelope-from <linux-media+bounces-61050-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:49:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C477750989B
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0AB43036EE0
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 07:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5705D396B68;
	Mon, 11 May 2026 07:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jrQ0/JCz"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013048.outbound.protection.outlook.com [40.107.201.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD5D393DD3;
	Mon, 11 May 2026 07:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485204; cv=fail; b=bguGXJPFJKRUy0Skt9V2HyVJsT2C6IY84TV5bLqlSHu2lycMBajWsGpgJYopT44/juIEhaQ5W/jD/MbaLmpMAd/+bMFMG3sLdJdPhqH8HGBSHide4zk2Bck2b1CxZjl1N9ypvCL24cwQ4bys8gdEfgUelntK2fbGPxDMrKftrWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485204; c=relaxed/simple;
	bh=9jqtLtpNzCZUQQI2zMuJqNQ9bYk2KbdP2tKRGUE4R9o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EGY4NRl/eIQc+XTxGovhyTFfpsrJWPUosT9hNgwqNmCRVz93sHGsDqalbWJ2gvCs0PHKDwUfma4wJRRCbDC/KulOSfuzCII9hW8stwxKgSb+MxeSWNmmODVpRQXegwDnRDkL4TfhsIYfPKfc8QTq7aBI11tFQGDCrIgKjX+njZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jrQ0/JCz; arc=fail smtp.client-ip=40.107.201.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXgP1t9/dp+0E6dnYz30AJDn6z+wAhu0qcPHMQfr187we7VT6WL08Puk8je7j0W2QzmetV2QmYcH6FwSNf4uReE5vFLwQvei8Bd0sMqHijfXwaupd0fm3dEv0fndTCWyWmFyqxuz4lv9UzL2i9SCS2OCz24lzbB75C2tI7ZrYX1VdtUzjvrPdVVLBVPKjLhrvy63iwy2w0o10mvKw3bzjW/EPfpfz4azsOLHiyGXcz1yhi5NfGVoVzyOcdZ5+d7xviehwBfh38UKhPtYFkkd7hv+PGNgPZHJem1Zim5qZ2+Wh/QkH2nxnhqZNFq48b5w48tckdAKEuQdSPLtyc4lhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rppOxq2Mtt32OGnFm3KicpVEIjX0RT4JcTooZuqStU=;
 b=AWPD3G0ivDho9TRsft6kknfCktV3Sthj0Ieo4omKYwKnRsdgFupEvzYACZW6haGPhaKmLlzZ1zwtjTGLCQJQqZiOBfdHMkZAxrmAalXYut34GML/A0R0hz2iR6zTCgosgt8dzTlh5xcyvPJqcgCmtjyIBFQFG10DnWFrjYTsoylsGv+1NGlxEP1uYF+1r5aCtGeWKVy93AUkdi8xNO3vREOdeP237D0xWv/vJGE7Oe3noxEn5iegUCZvIrdjyew7sO6CztKSyDdzeWfD9bh2xaR2jrnXidivmRManz5WOabbn9NpCfQerigitTDXlbPJ93MMGakIMd1+DSEfYMF1Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rppOxq2Mtt32OGnFm3KicpVEIjX0RT4JcTooZuqStU=;
 b=jrQ0/JCzl5sGK60rRSTAcfl8KU6SFL30oCe2nh7OQj4NWedPvKaGQcTqNbCW51URd7pnSDgEXYD0VXO92/HO9pMorSRCblz/5qPBExNg9QNndF4cc7tSYuSG5dPcriaofk6xhBJlsokZvTY+ROsXKS6dWJUAhi999pSygNe/C+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH1PPFC908D89D1.namprd12.prod.outlook.com (2603:10b6:61f:fc00::623) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Mon, 11 May
 2026 07:39:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9891.020; Mon, 11 May 2026
 07:39:55 +0000
Message-ID: <14b62cee-c46e-4fb9-91ab-aa09c0962834@amd.com>
Date: Mon, 11 May 2026 09:39:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Reject PRIME export of userptr BOs
To: Ziyi Guo <guoziyi114@gmail.com>, maciej.falkowski@linux.intel.com,
 karol.wachowski@linux.intel.com, jacek.lawrynowicz@linux.intel.com
Cc: ogabbay@kernel.org, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Ziyi Guo <n7l8m4@u.northwestern.edu>
References: <20260508162856.1131843-1-n7l8m4@u.northwestern.edu>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260508162856.1131843-1-n7l8m4@u.northwestern.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH1PPFC908D89D1:EE_
X-MS-Office365-Filtering-Correlation-Id: 461da6a1-cb05-4d14-387a-08deaf307e7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099003|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	q4qc898hULFURlJWVLR6QExGlQ57AuxgkWSx7tVsNUQoNqewOzc+yOk6jYye8qp3RysX8GuXyO4QlPO5fV2VkPnYYt6vQtXQyeiBK/jWMGJLKDhFgbmCPHBewG+n2uTIzEqBXRPiGy3bbb3B9nxLWy71xH+FpB/nV6pWTMTiebqEcOIfET2LhuqBYlsVqvPtYrOAlejyejWhaHvgI7rstq+TeuxlkooILVTEvt4/tHIyXiOhZVx5gr7qrPstRge6t89kNosV+xVCFg0qss1GM3NVSS0/TeM3Cxrtv9VegrzP+YuMDinOqSC4geeDsSRCElmcAEiSNjdvNTJTp66Gpuvu6Y5x9q+HFFxNrcwwZ0tkIqKGIN4X5FDPpeOgn2qTCraEuKM9j+tW4eU0qZJkEnf9OxUabmmZrhaHLnGXOYWjwcM/ojExOUMKWxYemBt+bVQpkoUGJxjJXOyL+ZIzZwvm9/dAUMI/SCcnosZLQzPYOZu4GDotgBc2OOeNstq9T+Fw2qvNJdMX3NaT1PZWzCFUMYHg15HFP/9yHsksKIbTQmNa2sGLR+WR3alNSUNRmFAeCszM356544YsVmkfS7tS53fv+rJ3zSjZldAGXnNldY8+ZjbTf4RtLCpz6nYsuK0d/KSPAqU0q4oitSUH2u9qjwcNh34RUqBIHAuQ+ljVT/2QRJilIw/Nfj99LLqm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099003)(56012099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlNzSFZCV3Z3bDUrR3d1cVRqd2dsSDZNdTg4YzM0UkRIZ25aSFRlVm9yalNX?=
 =?utf-8?B?S0VFcEpoZm95L2NmU3FWWmdzMlVhZUtOTENKbkhLWG5VZ2VFVXUzdzBSWEVE?=
 =?utf-8?B?VHBoc1p6NVJaUzFkWkZwWS9OeUpyaitNZmtVSjdvb0dUUVJYTkJyMURDSzFF?=
 =?utf-8?B?UEhPcmJYczMvOVBoS0dYeU43Wk5TamRVV3pXZ0xYcEdIMGNjeFVjdFd3QlVX?=
 =?utf-8?B?WThHSGNEaGg2MWJvc2tiQWh0UEpYQlB0WGluVWFhbFlORUxPS3IybFdmaWZk?=
 =?utf-8?B?OUlrLzhkVk1PQWVzbGRpaWVySmYxY1lJWis4TW1OODZBNmtFVndVUzFTUko0?=
 =?utf-8?B?OEkzbTdHK3NzWlRKMkFNTW51bUxNajNJTWQ1bFEwYXgxVDBZSlBIUmF1K05t?=
 =?utf-8?B?QUl1VWt2VEhkOUxUa0xUMjJ4VlJDeThIZWZ1Z3F0djB1UXkxVmI2N041MGtW?=
 =?utf-8?B?ZnpENWc2UWRMZDMwS3AvNldsWUx2VWUrYW1SVXpZYjNhZGZMUjl2THBaN1Y4?=
 =?utf-8?B?T1FubGtsZnZ3T1dnWXBPcUkxVjRKZ0ZFZzluTmdYcENBRW1jVlM1UzIrb3Vm?=
 =?utf-8?B?MUFiZ01FVGNYZmYvVTk4ak1mVENyU0lEUXJ5bE1xL0hmZjluUjd2cEdOMm05?=
 =?utf-8?B?Rlk2UWtZRVVZZnZYR0o1TWI4a3p4ZTgycndHNmUyYXdqWEE5RkZqbzNEam5l?=
 =?utf-8?B?aTJzSmtXZTNGS3VmckFmZ0pxQUZzMDNGeFBpNmYydVNJUzBYb2xjYWUrUEl1?=
 =?utf-8?B?QUJqaG14QUhqeVg5SFUxM05jQlhsWEZKc09vVW1CTCs2ZU5PaDZDYUpLM0RF?=
 =?utf-8?B?N2pGRmVmNFQrMDFXazJaN3ZIUXVaRFlJOWxKd0E4QUtGbW8vQlozcGcrNXRl?=
 =?utf-8?B?RC81YXBPbUhVeWIzT1FFL0FjRnNMZGllYjh4VWRTaFF5TE83RDZnRlJrRkpS?=
 =?utf-8?B?Y08reHNHQUovZWYzamd2WEdLeUdUSWNPTTIzd0ZIMjB0bm85YzRTZEtxMWZ2?=
 =?utf-8?B?QlAxZkNheGp2dURWVnFKbU5BZzJTeEE0RUhmZEpQUExNMUdCN2Mya0RaSHBs?=
 =?utf-8?B?YVJOR3ljR1hJeUVyU0JBSW52RHZNdDdkTGczSk42TUdza2cxU282VjVYYlY1?=
 =?utf-8?B?a2UyU0ZYQ3JkanZ4TnhRbVM0MXVVT2xOcTRVeWlQYmtJUHBsTUJCQVNKSURx?=
 =?utf-8?B?ODM1TTZwWURRa3dpM0dncHdFazFDMWVpcDZ6MFFGQzhMbEh4MWdEVUM0bzVM?=
 =?utf-8?B?OXltZVRFMXZtdW9PZUpkaG42cFJDbGhkQlRTdVhSZEo0a04rV3lpYW9JdUY4?=
 =?utf-8?B?MkRDTGZ1Q3dFVDFka05Fd3grTHgzN3dOYktDdklwZ0ZReDlBbGtuNTVJK29x?=
 =?utf-8?B?d0twYlE5MVZrbVFwMmJQWVJaa2trMTU1eXVLQjY2bHNJVU1zL2lPbXU2TUln?=
 =?utf-8?B?WG9iYlpiUk80YmxCcndMa29VZXo0YzF3bitZM2lzRGNFK0hKYy9OZGFuN3ZC?=
 =?utf-8?B?TXhidUwrU2JNTUY3SC96MmJWWjhTRWVvZmdROEtYWVFiVVduKzYxQXkrVnRK?=
 =?utf-8?B?bHhXeWovR0w3NW9LM0dXNjhmaStHaHhoWHJmODhuL0E2MU5MYmNCMHNjZmF3?=
 =?utf-8?B?RUQ0RnFvU3hIZm5sSWlxa01RbjlUWDNSb1NZOWhUbXBqbjI1Zm1ZWGxReWRH?=
 =?utf-8?B?SDlMeE15NWFqaTNJdUdzQWIxSGE3U2xwMDV3ZE1IVXBlVzBGM1JFRTZrZmNz?=
 =?utf-8?B?RjdQZUJ0SWFjdFpKRHVIUlV3Zi9FaFBVZ0d2eE1JYm0zUDlQTEpDaUYvR3NO?=
 =?utf-8?B?Q3NYZVFDZ2FPdFZDbGcwRnF2Q0dCUGY1eXQrMzhUdFVOMUI0aFl6bXlKUm9C?=
 =?utf-8?B?Y1NMdUtJWXdBSmlFT1VabkFYc0dIQXZiNFY1eDdGRUxwSVpYc1cyWHFhOHMy?=
 =?utf-8?B?dk94M3VOaTduN0ExUEdReXZLekxEaTcyMHVZWTdyQzh3ODBpR0hCYnNsTGR4?=
 =?utf-8?B?ajhBS3Z6dmJ0ZHBRdSthUGxnVUIzNER6ZnVvbmI4Uml6R1U5Y2FJY09ySDVn?=
 =?utf-8?B?K3ovRUt4SVd6cVUvdzJzVHhYMU84akFYYXU2Zk01Y1hwTDNFRjNiZmVncXRw?=
 =?utf-8?B?dFM3WXZPOEtjTkJsWWMvMnhQQURIcEdHN3JpcVp1Q1pPRmJ4dmhZc1BscjJB?=
 =?utf-8?B?MllmRWdqT2w1U0hOU3JJM1RObTdWRzlycUxHWUg4amNvN0pBUUhLbGVIekJh?=
 =?utf-8?B?cHpTQ3BLaTY0c3AwVGdBcU9FMVVQN1hLd1Y2dC9ETHJMbk00enBkSy9sZldu?=
 =?utf-8?Q?slCDbNlaeeIiPOtf/8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 461da6a1-cb05-4d14-387a-08deaf307e7e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 07:39:55.1472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StY69bLq8/BeOO9fJAQlXc5zHDFn/bzzJyQtYYdzu9cGd4qmeGN0lzFu0Vk4Cf6j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFC908D89D1
X-Rspamd-Queue-Id: C477750989B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.34 / 15.00];
	SEM_URIBL(3.50)[northwestern.edu:email];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-61050-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com];
	DMARC_POLICY_ALLOW(0.00)[amd.com,quarantine];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[amd.com:s=selector1];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.740];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Zivi,

On 5/8/26 18:28, Ziyi Guo wrote:
>   Userptr BOs wrap pinned user pages in a private dma-buf solely for
>   internal use by the NPU driver. Allowing userspace to re-export such a
>   BO via DRM_IOCTL_PRIME_HANDLE_TO_FD would expose those pages to other
>   drivers through an interface that was never intended to be shared.
> 
>   Override the driver's prime_handle_to_fd callback to detect dma-bufs
>   backed by ivpu_gem_userptr_dmabuf_ops and reject the export with
>   -EINVAL.
> 
> Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>

first of all thanks a lot for pointing that out! The patch which orginally added that somehow slipped through the cracks.

Then @Karol and @Jacek, using DMA-buf like that is a pretty big NO-GO from the DMA-buf side!

Using page which you don't own (especially file system backend ones) in a DMA-buf is absolutely *NOT* something you can do.

I hope that it is not the case here, but if you also allow to mmap() them then you have create a massive security problem which can lead to random file system corruptions.

Regards,
Christian.

> ---
>  drivers/accel/ivpu/ivpu_drv.c         |  1 +
>  drivers/accel/ivpu/ivpu_gem.c         | 28 +++++++++++++++++++++++++++
>  drivers/accel/ivpu/ivpu_gem.h         |  3 +++
>  drivers/accel/ivpu/ivpu_gem_userptr.c |  5 +++++
>  4 files changed, 37 insertions(+)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index 2801378e3e19..086d4c769b33 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -545,6 +545,7 @@ static const struct drm_driver driver = {
> 
>         .gem_create_object = ivpu_gem_create_object,
>         .gem_prime_import = ivpu_gem_prime_import,
> +       .prime_handle_to_fd = ivpu_gem_prime_handle_to_fd,
> 
>         .ioctls = ivpu_drm_ioctls,
>         .num_ioctls = ARRAY_SIZE(ivpu_drm_ioctls),
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index 4f2005a8d496..82079f372b39 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_cache.h>
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_prime.h>
>  #include <drm/drm_utils.h>
> 
>  #include "ivpu_drv.h"
> @@ -249,6 +250,33 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
>         return ERR_PTR(ret);
>  }
> 
> +int ivpu_gem_prime_handle_to_fd(struct drm_device *dev, struct drm_file *file_priv,
> +                               u32 handle, u32 flags, int *prime_fd)
> +{
> +       struct ivpu_device *vdev = to_ivpu_device(dev);
> +       struct dma_buf *dmabuf;
> +       int fd;
> +
> +       dmabuf = drm_gem_prime_handle_to_dmabuf(dev, file_priv, handle, flags);
> +       if (IS_ERR(dmabuf))
> +               return PTR_ERR(dmabuf);
> +
> +       if (ivpu_gem_is_userptr_dma_buf(dmabuf)) {
> +               ivpu_dbg(vdev, IOCTL, "Exporting userptr BO is not allowed\n");
> +               dma_buf_put(dmabuf);
> +               return -EINVAL;
> +       }
> +
> +       fd = dma_buf_fd(dmabuf, flags);
> +       if (fd < 0) {
> +               dma_buf_put(dmabuf);
> +               return fd;
> +       }
> +
> +       *prime_fd = fd;
> +       return 0;
> +}
> +
>  static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags)
>  {
>         struct drm_gem_shmem_object *shmem;
> diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
> index 0c3350f22b55..bfd15ce02354 100644
> --- a/drivers/accel/ivpu/ivpu_gem.h
> +++ b/drivers/accel/ivpu/ivpu_gem.h
> @@ -29,6 +29,9 @@ void ivpu_bo_unbind_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_m
> 
>  struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t size);
>  struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf);
> +int ivpu_gem_prime_handle_to_fd(struct drm_device *dev, struct drm_file *file_priv,
> +                               u32 handle, u32 flags, int *prime_fd);
> +bool ivpu_gem_is_userptr_dma_buf(struct dma_buf *dma_buf);
>  struct ivpu_bo *ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
>                                struct ivpu_addr_range *range, u64 size, u32 flags);
>  struct ivpu_bo *ivpu_bo_create_runtime(struct ivpu_device *vdev, u64 addr, u64 size, u32 flags);
> diff --git a/drivers/accel/ivpu/ivpu_gem_userptr.c b/drivers/accel/ivpu/ivpu_gem_userptr.c
> index 7cbf3a4cdc73..45eabea5961e 100644
> --- a/drivers/accel/ivpu/ivpu_gem_userptr.c
> +++ b/drivers/accel/ivpu/ivpu_gem_userptr.c
> @@ -61,6 +61,11 @@ static const struct dma_buf_ops ivpu_gem_userptr_dmabuf_ops = {
>         .release = ivpu_gem_userptr_dmabuf_release,
>  };
> 
> +bool ivpu_gem_is_userptr_dma_buf(struct dma_buf *dma_buf)
> +{
> +       return dma_buf->ops == &ivpu_gem_userptr_dmabuf_ops;
> +}
> +
>  static struct dma_buf *
>  ivpu_create_userptr_dmabuf(struct ivpu_device *vdev, void __user *user_ptr,
>                            size_t size, uint32_t flags)
> --
> 2.34.1
> 


