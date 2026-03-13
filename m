Return-Path: <linux-media+bounces-55627-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOzyG27Ws2mzbgAAu9opvQ
	(envelope-from <linux-media+bounces-55627-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:18:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF89B28058D
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92D4D31B476A
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F22331A65;
	Fri, 13 Mar 2026 09:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xPgu1QuA"
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012005.outbound.protection.outlook.com [40.107.209.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6664C3845D9;
	Fri, 13 Mar 2026 09:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773393159; cv=fail; b=gdg/QnS5liYBJpLlN4CEf27R5XkhOnGlYu8HnTOPn3iOTIVy2grlvnp1tYryUW2kf8E86N4fCymzRV7NmNKBSNFFJ4is8TI0oZK7Ljt587DHGxAXVEGF6tPJn/t8YKc+6F1QJBAXUUe66e+kJWGzX+2ky7TOcD5LrohG1zOHPTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773393159; c=relaxed/simple;
	bh=CTpN+6nGP9+y5kSAXGe/sNfML67XhDwzQnnrD0O0H2A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XhDJ3PljIFDXSVoYrTf+/HaV+6IRvSEETsn+AksgUrTbWKGZiW6iXbTIXlRWLOeR6BpY5emC4pIX7ZjRJebUnJMb3uqA3CL8qYKakJt/xw8ZjVn8W7TEpU8OPYqsNndHgzU72esZFXRj21xnDErsMCoFDL3xjdS/VDc89BxQ2fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xPgu1QuA; arc=fail smtp.client-ip=40.107.209.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sd5M/tLgOQu4hC7rpCR94zdLrXs2ga4P5RDmKZEE2p4L9Rjsj1Cdl2+gXBzsBBbYvBXwRgizXx3CINhX4myY6AQ/4ZePHfS4z8hONiAWY5/d4tJDjKlb4gUE0RrxaMSaCrQxzWPUik40pC1JvdKXPIS3sJ9l3hjXTCE3Umtp6+XwRk4byXsd3bgvv2LyQREbTGP5hTH67LqTPDHbaf5aoxzej+QewpMUeLGG7AH/rWdogmYpbObFKdYRUi26C2EZsh+GwXDVmthZjNqU554x42R0wL63Lo2jOJyUo0351td11cSXJTbmpetXSQamzU264LDGuIwkm2urj5UsYWSQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5WBmDWQBoUIJW2AbV/HHiBC9zdE9Ww/ThAWmlWoezY=;
 b=FIhYkhnawg38FRLgIeNNXRZVDbPKY4VlrcrdT0/EyWMWhxzJps++XMZ+rhly4IvcbuwVaOn3O/7Ke3Zdh13nKIwp4/DFeVHprw+r7HhVSP8HHTfgQ9gSBKusEkbnoBWR2lG4lwM/hX9Bok2PsSZZ2bPVe/7Z1/n8f5BXrB9d4wPo59584LYDEhxxvqyFGh6oSpDrMQNQQ/XCWoaV9rVDG2aad7rBEGBmA7QHEleWTt3WpAr2kPY2NK42G3hX3AxuMMbvCQNpBg0mg6Tfc507haqSikY0FXF39nCeLVDi5qsgncuaIdbpQlDb14ySoixzbdVm8MapTuJQ3sL2PSs3HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5WBmDWQBoUIJW2AbV/HHiBC9zdE9Ww/ThAWmlWoezY=;
 b=xPgu1QuAyUnM3oR+OJimgy+hBvDlsJa/rlUPWeKkh5JsM3AjPMe2UF+v5CRr8KJrkkTl0iKI9aIEfYAFzP/8l1NzkO/6vPPRDeN8flO3IVgUvvE9M8EAkCl05o07VZkKp08LpLtKjqpPY33jGVyyScQxiIaSu5xVvWaJicp/520=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9358.namprd12.prod.outlook.com (2603:10b6:408:201::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 09:12:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9723.004; Fri, 13 Mar 2026
 09:12:31 +0000
Message-ID: <50de8376-d675-4a98-9a86-8485dba5d449@amd.com>
Date: Fri, 13 Mar 2026 10:12:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 PATCH 06/10] vfio/pci: Remove vfio_pci_zap_bars()
To: Matt Evans <mattev@meta.com>, Alex Williamson <alex@shazbot.org>,
 Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Mastro <amastro@fb.com>, Mahmoud Adam <mngyadam@amazon.de>,
 David Matlack <dmatlack@google.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kevin Tian <kevin.tian@intel.com>,
 Ankit Agrawal <ankita@nvidia.com>, Pranjal Shrivastava <praan@google.com>,
 Alistair Popple <apopple@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org
References: <20260312184613.3710705-1-mattev@meta.com>
 <20260312184613.3710705-7-mattev@meta.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260312184613.3710705-7-mattev@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: ee3282fc-bd55-4c6a-d5b7-08de80e0a7dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QDeC4Dgqa7wXbTdSnWlSphQhJvczMprAh5vJ5OvcO71HP44EsvA+uy/lhoJx/JuDGJos2bLbq1qSKt4Sw8LjA83Vn7e8jofzZmKzonQJpTTMCQzJZekqmDHluelyj8nsE90lc0YmDPrUUvyUwZ4FbGqGywFJxHIMbRukLDwmnhxTNVjcsUSQqiBczK+BYmqaU0K3nNlNDMfAUKrtMsLyGZsWOjiyk6rfspDAXr/ehaj3KKeJKDi+wL/rGVRUOkKiI5AMBukC1qsKVy2Djq0nL2fSXOPkvqaeTrRzDqf7Vm36/zOC611FxtjrDsjBf9yjWW+ZY6EkIKhqLs7HFhPxvhAKn0FVcfn9D/3t2POwjoNwyu3IqSOcp6EjQG+355sALyjWjQu4nfaGY9ujsqDxkqu61668TYUPUm+Kv80n9LEbBB/iuw5hqtVG4AWz5gZKmx1gC4cBJXhnBfBE5n9aamTm0XCdEUs8+ksJ6VP0mQFzbvX0DuEA0O3+K9JMvNPbaRh06DJqxXCmROfcYdBAWMHTtQ7HiYjpF91wyDS0F5PP/MMElScuaVmkh6GsgYz5U1Y9+W8Qd9tHOtRdKxzdLM+hVKKEjcg7SJ6C1CfkcPVDcQ1LUdFDN37g219qf8DK+FiXU3m7I1b003pR8fh7yWc2C/ML++482BE933B+ap6lCMmXmudL7KggaJ3bwcbgSSwiNmdhCFvbcGGodyfeNFyNrux5O5ZDqbGhvwJU+I4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlE3QVViblQ0SG1qZWVxMW82eXRGbEZaTzI3NFFqSERpcWxrRkUrVE42SlFI?=
 =?utf-8?B?WU5hWnVjeVBYN2Z6ZjlESlRtaHUzSVlGdjdEMVpYdXV2dFdQWEZSVmw2ZlZI?=
 =?utf-8?B?Q3daYlNXc2cybXhGOXR4NldyN2xabEVvUlBZNkVCYVFGU0FjcFZLa1A5b3ZV?=
 =?utf-8?B?NTFkYXgxVTZDc214Y3dORERDeTRKYTVmRE1vajBuRkl6MSs3NUMzR3NXY2pO?=
 =?utf-8?B?QTFsZHBkTUIrcUhDTE1DVGdPTnU0L3ZjM1ppRlVOS1d3U0tBc3JaOHpuV0lT?=
 =?utf-8?B?d05Eb3VudEtOV2lMOHluMFBnZ3I1aEtpODhJUnNYSVJhNTZySFpWcjY4eFdU?=
 =?utf-8?B?NlhXWkJ0SVVFaHZWMWpybnZZSXp4Uk1zMUNPd0N4UEFGYmpzL0FYWUpXck9l?=
 =?utf-8?B?cUV4R1ZUbm5sbXEzTXJZWHZ0NS9ZdnNJWVAvMUZQbFlET1Byc0ZhZWVQMUxZ?=
 =?utf-8?B?Wjh6aGYyTUFYOGppRVhVcWJ3MFRxdlRGbFJxVHhmM0R2S0NKVkg3bStPV2NH?=
 =?utf-8?B?M01GcFJQNEkxRU9NeTMyT2lJVVNiZ2VkYi83WEM5bUY0NU5Wd1JhUG4rOUFm?=
 =?utf-8?B?OFBrTnJ1SUVpRDJzS2lDU2NqYzk5ZUtheWxyZzRKalZERjh2UzFtWjd1WjZ5?=
 =?utf-8?B?UWpWc0crTXkrOFRtUVBDakJNTzJqRkMxRHFLTHpreTJyVmN5VlhhcndUYjM3?=
 =?utf-8?B?eFd3R1hDdXZoKzE4ZVh2L2dCU0FlbU1LNjM0MUMrdUJWSkJ5MzRIU2h6UllT?=
 =?utf-8?B?QWtXZ1FveU5GeURtY2VzUTdXYnVNMUo4ajYzQ0daZk0rNGhzNWxHamZrYm5P?=
 =?utf-8?B?R3AzZFVIZzF3b0lYZ1RGRG96enZBVE1QcXZjdGx1bUdYb0pDRHN2WHhXWFBJ?=
 =?utf-8?B?c3JNYitJbDUrbUpIQVFIMURiZTBRMzdHcm5abVFINjRkNS9HN2piZ3JtMG9X?=
 =?utf-8?B?L1NFb2V0dHdRSHhBYWdtTWJLNjV5ekRaMGcwS2FRVG9DUUF6ZFBVSW4vcldi?=
 =?utf-8?B?NzdrbzRkamNtMyszNXdVZEVkMFpKbTlLN3J4aHBEWUMzZndJYk8rdG9iRXVN?=
 =?utf-8?B?ZXloME1NOUNmR2RSTjJzSGFjUi8xTURKRDhyN3FSK25oUGlOUHJrODRWY1A0?=
 =?utf-8?B?cG1SK2xuek9FMHVEWklWU1lDUjJHRG8rTXFTbXF6eHNEa0UzczJERFgxd3VP?=
 =?utf-8?B?TXI3TWEvdysybVdWNmNJaXM1OGxZUFpOb3JPdDc5L0ZuaHZxZWFPUzFYNXdN?=
 =?utf-8?B?NTdGZlUvZzlTR0tTbDlLQy9GdUgzcGNWZjR3NmovN2FIbnFlY0tEdkExSUVs?=
 =?utf-8?B?MTl3S2dhS0VINGh5MHMyb0s0cm1iMzZNd2VGS0FCYUlBdmk5L2hibjVNN0dE?=
 =?utf-8?B?V1NSNXc4c2tzUnNESHpIREQxMS96VitPa0FoRHVvZ3Qxdnh2UFcxOStlakZr?=
 =?utf-8?B?ZUI2Z2d0TEhndnJ3bStTY055d3lEc2FpOWVEcTBlSERiYXU0NDkyUEthaEpF?=
 =?utf-8?B?dE5CNUhzYXhJQ1ZJSVVTaFZwaFRjelFwbytpQzc2SE1pKytKYXlyOE1YNUZ4?=
 =?utf-8?B?dm94SnROb2Nka0pOeU9WVWpuQWN3Z2xuejkwTndVbFFMaU5ta0dNdWJ0N3J0?=
 =?utf-8?B?QWlaOGduQm1nSE5IZGtnWGJKYTdlRGZibGp5UWs0M3llRVB5TkwxOHNXbDhR?=
 =?utf-8?B?MWhUL1JJZ1liSS9kMGt2UXhDYzRmNWFVQXVDM25IMXhZLzFQZ3VVbmpjeUNI?=
 =?utf-8?B?cjBzTHZhNlg4MzUrSjA3WXhzR2xqL3I5TG1rYlpSNjgyb1pTd0RBQlh0cktz?=
 =?utf-8?B?ZDFlMmdFWDRvY1dONmIxeGgyZHRQY0tmcWc1WXdrOWZVL2NiakVaNmpNYXgv?=
 =?utf-8?B?WDB4d0RDYzk2OFdVVkV6alZsdWhqODJRVG0vL0NrbjllNGNWZ2I4UDhiTGlW?=
 =?utf-8?B?cFZPU1lHNnFSVVpJVThOMDlCc1dEU3l4Sk1nRnd5d3pzQldZRWJSV2ZiR1Nm?=
 =?utf-8?B?Q0g1cVdVRHMvZ3dDb2lyZlZCSWdGQjZFNzdNaTFXOFhrVVlMUERNL1k3d3FQ?=
 =?utf-8?B?VFhiWFY5SVZiQ1dmSGRIcnFoaHhweVduUkgyek9Ob2pIZjhvV0o4U3NrUXQv?=
 =?utf-8?B?dW1NMkZPQmZNMjdpVlpEMG9TemhOWmxQQkJWa2ljWWM4YmFYZXJwaW42RkxW?=
 =?utf-8?B?enNkTERYb2VLWmJvMzM1UStiRXJDTW9vOFhEZDhDTFRmM2Rlb0pQcWlMOWxN?=
 =?utf-8?B?ejlMS0FMamlrVGZvV3lqbTJpTjRVUUUzbnFLNUxpMXJvaE1yajhyUlZFSkFn?=
 =?utf-8?Q?1UvfAFYSvn6KpdJ/qM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3282fc-bd55-4c6a-d5b7-08de80e0a7dd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 09:12:31.3165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pz/N2nUrJ0CaHe5BbMmM47YiRLLvmZt/1kbdFahgj2ApZDkVhSzwm9pGhQv1MPJF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9358
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55627-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,meta.com:email]
X-Rspamd-Queue-Id: CF89B28058D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 19:46, Matt Evans wrote:
> vfio_pci_zap_bars() and the wrapper
> vfio_pci_zap_and_down_write_memory_lock() are redundant as of
> "vfio/pci: Convert BAR mmap() to use a DMABUF".  The DMABUFs used for
> BAR mappings already zap PTEs via the existing
> vfio_pci_dma_buf_move(), which notifies changes to the BAR space
> (e.g. around reset).
> 
> Remove the old functions, and the various points needing to zap BARs
> become slightly cleaner.

No a full review, but it looks like you now take the DMA buf reservation lock while holding vdev->memory_lock.

I strongly recommend enabling lockdep while testing that, just to be on the sure side that all locks are taken in a consistend order.

Regards,
Christian.

> 
> Signed-off-by: Matt Evans <mattev@meta.com>
> ---
>  drivers/vfio/pci/vfio_pci_config.c | 18 ++++++------------
>  drivers/vfio/pci/vfio_pci_core.c   | 30 +++++++-----------------------
>  drivers/vfio/pci/vfio_pci_priv.h   |  1 -
>  3 files changed, 13 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
> index b4e39253f98d..c7ed28be1104 100644
> --- a/drivers/vfio/pci/vfio_pci_config.c
> +++ b/drivers/vfio/pci/vfio_pci_config.c
> @@ -590,12 +590,9 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
>  		virt_mem = !!(le16_to_cpu(*virt_cmd) & PCI_COMMAND_MEMORY);
>  		new_mem = !!(new_cmd & PCI_COMMAND_MEMORY);
>  
> -		if (!new_mem) {
> -			vfio_pci_zap_and_down_write_memory_lock(vdev);
> +		down_write(&vdev->memory_lock);
> +		if (!new_mem)
>  			vfio_pci_dma_buf_move(vdev, true);
> -		} else {
> -			down_write(&vdev->memory_lock);
> -		}
>  
>  		/*
>  		 * If the user is writing mem/io enable (new_mem/io) and we
> @@ -712,12 +709,9 @@ static int __init init_pci_cap_basic_perm(struct perm_bits *perm)
>  static void vfio_lock_and_set_power_state(struct vfio_pci_core_device *vdev,
>  					  pci_power_t state)
>  {
> -	if (state >= PCI_D3hot) {
> -		vfio_pci_zap_and_down_write_memory_lock(vdev);
> +	down_write(&vdev->memory_lock);
> +	if (state >= PCI_D3hot)
>  		vfio_pci_dma_buf_move(vdev, true);
> -	} else {
> -		down_write(&vdev->memory_lock);
> -	}
>  
>  	vfio_pci_set_power_state(vdev, state);
>  	if (__vfio_pci_memory_enabled(vdev))
> @@ -908,7 +902,7 @@ static int vfio_exp_config_write(struct vfio_pci_core_device *vdev, int pos,
>  						 &cap);
>  
>  		if (!ret && (cap & PCI_EXP_DEVCAP_FLR)) {
> -			vfio_pci_zap_and_down_write_memory_lock(vdev);
> +			down_write(&vdev->memory_lock);
>  			vfio_pci_dma_buf_move(vdev, true);
>  			pci_try_reset_function(vdev->pdev);
>  			if (__vfio_pci_memory_enabled(vdev))
> @@ -993,7 +987,7 @@ static int vfio_af_config_write(struct vfio_pci_core_device *vdev, int pos,
>  						&cap);
>  
>  		if (!ret && (cap & PCI_AF_CAP_FLR) && (cap & PCI_AF_CAP_TP)) {
> -			vfio_pci_zap_and_down_write_memory_lock(vdev);
> +			down_write(&vdev->memory_lock);
>  			vfio_pci_dma_buf_move(vdev, true);
>  			pci_try_reset_function(vdev->pdev);
>  			if (__vfio_pci_memory_enabled(vdev))
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 41224efa58d8..9e9ad97c2f7f 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -319,7 +319,7 @@ static int vfio_pci_runtime_pm_entry(struct vfio_pci_core_device *vdev,
>  	 * The vdev power related flags are protected with 'memory_lock'
>  	 * semaphore.
>  	 */
> -	vfio_pci_zap_and_down_write_memory_lock(vdev);
> +	down_write(&vdev->memory_lock);
>  	vfio_pci_dma_buf_move(vdev, true);
>  
>  	if (vdev->pm_runtime_engaged) {
> @@ -1229,7 +1229,7 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
>  	if (!vdev->reset_works)
>  		return -EINVAL;
>  
> -	vfio_pci_zap_and_down_write_memory_lock(vdev);
> +	down_write(&vdev->memory_lock);
>  
>  	/*
>  	 * This function can be invoked while the power state is non-D0. If
> @@ -1613,22 +1613,6 @@ ssize_t vfio_pci_core_write(struct vfio_device *core_vdev, const char __user *bu
>  }
>  EXPORT_SYMBOL_GPL(vfio_pci_core_write);
>  
> -static void vfio_pci_zap_bars(struct vfio_pci_core_device *vdev)
> -{
> -	struct vfio_device *core_vdev = &vdev->vdev;
> -	loff_t start = VFIO_PCI_INDEX_TO_OFFSET(VFIO_PCI_BAR0_REGION_INDEX);
> -	loff_t end = VFIO_PCI_INDEX_TO_OFFSET(VFIO_PCI_ROM_REGION_INDEX);
> -	loff_t len = end - start;
> -
> -	unmap_mapping_range(core_vdev->inode->i_mapping, start, len, true);
> -}
> -
> -void vfio_pci_zap_and_down_write_memory_lock(struct vfio_pci_core_device *vdev)
> -{
> -	down_write(&vdev->memory_lock);
> -	vfio_pci_zap_bars(vdev);
> -}
> -
>  u16 vfio_pci_memory_lock_and_enable(struct vfio_pci_core_device *vdev)
>  {
>  	u16 cmd;
> @@ -2487,10 +2471,11 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>  		}
>  
>  		/*
> -		 * Take the memory write lock for each device and zap BAR
> -		 * mappings to prevent the user accessing the device while in
> -		 * reset.  Locking multiple devices is prone to deadlock,
> -		 * runaway and unwind if we hit contention.
> +		 * Take the memory write lock for each device and
> +		 * revoke all DMABUFs, which will prevent any access
> +		 * to the device while in reset.  Locking multiple
> +		 * devices is prone to deadlock, runaway and unwind if
> +		 * we hit contention.
>  		 */
>  		if (!down_write_trylock(&vdev->memory_lock)) {
>  			ret = -EBUSY;
> @@ -2498,7 +2483,6 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>  		}
>  
>  		vfio_pci_dma_buf_move(vdev, true);
> -		vfio_pci_zap_bars(vdev);
>  	}
>  
>  	if (!list_entry_is_head(vdev,
> diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
> index 37ece9b4b5bd..e201c96bbb14 100644
> --- a/drivers/vfio/pci/vfio_pci_priv.h
> +++ b/drivers/vfio/pci/vfio_pci_priv.h
> @@ -78,7 +78,6 @@ void vfio_config_free(struct vfio_pci_core_device *vdev);
>  int vfio_pci_set_power_state(struct vfio_pci_core_device *vdev,
>  			     pci_power_t state);
>  
> -void vfio_pci_zap_and_down_write_memory_lock(struct vfio_pci_core_device *vdev);
>  u16 vfio_pci_memory_lock_and_enable(struct vfio_pci_core_device *vdev);
>  void vfio_pci_memory_unlock_and_restore(struct vfio_pci_core_device *vdev,
>  					u16 cmd);


