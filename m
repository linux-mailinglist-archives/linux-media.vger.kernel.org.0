Return-Path: <linux-media+bounces-63884-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2ftCLTqXImqAagEAu9opvQ
	(envelope-from <linux-media+bounces-63884-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 11:30:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7D0646DC4
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 11:30:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Cg5Fq9EL;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63884-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63884-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6300301BEDE
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 09:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B080F2472B6;
	Fri,  5 Jun 2026 09:30:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011062.outbound.protection.outlook.com [40.107.208.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D08419308;
	Fri,  5 Jun 2026 09:30:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780651820; cv=fail; b=FrhUPrDHY6d7nCyXlL3wAp+ZPbD7th3bN87iZYsbqYPfhNISDgBJv+rCwXiKYPLm1KTUL0SRfki2opxgUG0bChfAMp/GyBRgdE6VCP8CAlkA+JTCjHmzXHKhxDSsyeICFTswNGeG6JMxedH5b21OK+nZmutpHQwOGa6oCoOFXig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780651820; c=relaxed/simple;
	bh=9itIK9+RaF52U9sWHIIBdh0etrA9E1Y6dosirCkj+Jw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XB6JT1KccrOgiOu/c0Ak9TkhOWV2gMGmbFR/gnIfSk1V1JJC70f18U097dWn/bacZKxMe872ecmij7CW2ohK1lhvSp/5y4A7KkhpWkD8ypFXZ0fgbruGyGMAVF07s55Lz+zPq9nmyp7NvD6QOOgzReU24sf3VUDSemnIIZL/6xA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Cg5Fq9EL; arc=fail smtp.client-ip=40.107.208.62
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3zyGfM6odtnJ1egNo8wn+a+Ye77wn6dJO4NTWAN8kHRb/nLwuaOfL7IR+mUJZoryavuZXqglXHBldlfOltNgWeVpc884InllgiQFwcd1iZqUK3i7tCHWOtX/TBVEcD2qqv4F/6TPlfJ0R0vXP8iPxa16uLbfl45978sjJwg1KDUdgtBk5MlenlsfM8UApZoNYJukWoa1Xqa70s9KFa1R3UB5rNmj2yTINzbFhnkC3CdKrk5a2TF/y1G3riEbO949IOKFL3hpXx/FRvK9lrxZjw59ueYOQaGYWbGu6d4647FAWKdIh2yEEx8J/Boziz9kIJP2NxgGv0XDVab9KbuUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhLkNZCcebkEx2sF7NdJqEiZnF4QK85a1ARSeqABH5M=;
 b=rWUzvUqlv3GeNFaELBQG/xftlNR6VpSZQqaF4/YV4oiapcFYXyByS6W8JU8mLyO8FagEgAWlhsxImxIGEzhfogQygh7WEPi4MPaonmkao0vcFZ5AqNCQeRUEOYDPc48hNWkTd3Q0OwsCZj0Ol5xfuLyR1iKE+9TBlCqXVkGkY+P+kEkBGIYewPkKYYQVvyjvlJnyWUEEacAuzdBQE23M48X8YkATxmYFIzMvEBtXbqX0DMSE1/w5g8DUOwWzGiuXqljUEQ6IHeRoCVGJkFZgpfnbnE+hqfp7ph7bwIrrlslvebPHvufDCLbeElZeSwmlBH9+tNJLg+cv0dhSPHY0ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhLkNZCcebkEx2sF7NdJqEiZnF4QK85a1ARSeqABH5M=;
 b=Cg5Fq9ELpBXjGBKMjVDMbVKzXwBSp5F/5OMMZgdgBFqsfkni80ajuQ7VMupdKjeBTRzQ9LIiTN7k8Wz4YMBl8X1/8xPE+2wSnPi1S98LcswBinNt6/KfuetKm0XK/se/HYLI4/SraCj+s4lh8lns2w40b6/OARsW5hNF0TPODi4=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SAWPR12MB999139.namprd12.prod.outlook.com (2603:10b6:806:4e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Fri, 5 Jun 2026
 09:30:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 09:30:15 +0000
Message-ID: <bdce2488-fe77-4f36-9ed6-dd2c785fa7c1@amd.com>
Date: Fri, 5 Jun 2026 11:30:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/4] udmabuf: emit one sg entry per pinned folio
To: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net,
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com,
 dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
References: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
 <20260603-tcpdm-large-niovs-v1-2-f37a4ac6726c@meta.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260603-tcpdm-large-niovs-v1-2-f37a4ac6726c@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:208:256::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SAWPR12MB999139:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f98924-d258-40f2-5d23-08dec2e50d20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|18002099003|22082099003|6133799003|10063799003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ggJzAiRUzxXXuMqOsuPFT7VMnvH1k+BWuYifBugDC8n2sbvHoh3gdLlY2bMXLylHrD/iDxLZHmMZWBIkO9AnkoesiWGB6xU5FcozVHRZy63ka5nmb9YWMfxQS83k6uogYhFRUSNSTGTh8JMipm6DTYdFuQ/RaoGngQhLR8Ly8cwka/gK2OoZDklzWVDyAw86xw5cXU9R1saUm1ttK3uZt5yCiDLv61J19kaMj0Zzkx6BPNiNJZYPB0ZUQdSUB4BrFnkoJpG/VjZZyBHQK3FnQNX5vJDJE6OqwDsfpbRsnayeQ848yb9WhYxlZ9jNxKO5kTiG6v1GpKPIlFsc2HlzpqJMx/TMhskwpZB+rEOU1DIe+sfY0XWmCm+LQ2HMN1LpAh/ZnstxMP9BjjSOWN5EVmW39mtRutNaHe1sAEor/R9UmATVjWG/d7CI/UushsczqFonFpyuTwOM8Gw7VTRhg5Mt1dvGNSKRUgpvg/t+DTdpjlczt9Cag/3BGaeHyRSkYMaGZ8uWWDLjHDpJBT3evXhj0fEaw22NAMxm2Tp2Nz9pIIwQDXJM2D/8EAymXW3uLraG+Sd0yUs1x4C5lRy6nITu0seE74SA3jxzH/DNaGYTl9GuoiWoPAmRVPWEix5AQrGlskXKWuekvXheQJOlzme1GJ1IWt1V+X9RsK+60yPHddCwHQs7TY0wDPBzNJLXWm2zM7KojPf5tNuaUqJbVEahQN7xtMnMQFzU9+fSGeE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(18002099003)(22082099003)(6133799003)(10063799003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmYzNHVNSm5pQTd4ZFN0VW5SS3BZLzVEZUd0WU9SaXhYdWNaOG9DVERjSnZa?=
 =?utf-8?B?T2R4VTJKWit3ckJKbldsbkw4MjdHRWdtdHNwRmw0d0lKTHY3MVVqd0ZHQmdw?=
 =?utf-8?B?QXExN0tQeFUyRFZOY01MZDE5S3JEektZYU1BV1BpenVFSU14WkppVnBKTGJ5?=
 =?utf-8?B?OHA2bmZKRzZ6cVhXUmtTaFgzS2hLcUNFUWVNNUZZUXlVeDhJTUs1NkVoZ0da?=
 =?utf-8?B?ZUJDMUphR0ZVVUkyZkJ4R2Z1SU8wNk44akR2d0NhWmFGQ2IrZWJRdnQzRWpS?=
 =?utf-8?B?RVZ3Ulh6Y2YxZFN1L25kOG5pMGtiVCsveTNhblNhMHN0OW52SjZrOXlLNnNT?=
 =?utf-8?B?dHhna0lpeUU4eC91VktOQXYreTNpSUNtU1p4M1FwU1VyVmFqTHByZFVQV3Uz?=
 =?utf-8?B?Kys1Y1FYOW1EbisxUXBXRFd5NWxVSUhMbndtYndKd05UZUFSU0VOdlJ4K3M5?=
 =?utf-8?B?blVTNTBBYWNsQ09JWGJOcElGUVhmQktpWTE1bnJsTXlpcXBLZTY2WUgwSTly?=
 =?utf-8?B?aWhaQ3RTeFB3U0RFQ3ZlcUdzNGU3TFQ1WXJDcXdTS0FzN2VwVzZyaFBGQmtL?=
 =?utf-8?B?VERpbXloSWE0SG5xeEJXQU1MTzVacWxRR2Z0VWN2NExJb250YVJXN2Z2R2kv?=
 =?utf-8?B?cDFmczRpcVljQXBxMGM5TmtIZi9qcGhZNWtIR1o5bU9ORUhYcGJyZVgrUXdU?=
 =?utf-8?B?WXJ0OUpjWVlnT25IOFhHVDdTb1ZiSHRSbWhuOGdrVWVCOEthaFhGT1gxeUVP?=
 =?utf-8?B?YVpadStKOHRCMzBsdVlnZ0J2Tkp6cDBmSld1eXVHbGN6SmdOSlBDQ3VxVkt0?=
 =?utf-8?B?dzNDVi9yWll6NmEzSjR6ejFmcVJRSDlJeVJ6ZXhxY3JMR2dwOHNQZVR0SnNz?=
 =?utf-8?B?YXdqcUFDd2pxSmR5WjMxa2V2SFRhdEFhZHVZUjVkNW43KzlIclFuR3hDSWoy?=
 =?utf-8?B?N01xNTZ1REtyaTdvRi9ZOXJIbzRYR3F4bkJJVzdJQ2h4UmpwVm5IMlpIWFla?=
 =?utf-8?B?TEx4RHlmNzVueUJkcUM4aE11NTdXdW5ickV4ZG5EVktnTk5wU2I3VmpBZWx0?=
 =?utf-8?B?c3Z4ZDlHSktELzBUVXlNNzNvVXdUQTY4a0hBTTZYWFJkdFRKaDJCUWlkVDdR?=
 =?utf-8?B?dVhTTXpUenJCN0FoRlpwdWphRzFHSTJjb1VrZTdleWF5SWtjWTN6SmdHVzYr?=
 =?utf-8?B?NW44eXQ5WktPV3RNMlJieTFWYmJBbHVvY2FzWVQ2bkJrRXhuRUphcFhaUnZQ?=
 =?utf-8?B?SlhacTU4bGhPNFE2SDFPQWtVV3RUMm8xbmVRK2RWNzk2dXloaTRGa0t0QW5v?=
 =?utf-8?B?dkFrQnVKOVR0a3E0YXdKVWJYTkhrTS9sL3U5VG9QcnJZMmJUVXREWThRL1lC?=
 =?utf-8?B?V1ZNZjVQbUhPbjFBdHM3aVIvbk93WWcyTFEyOGJ2QUlXeCs2V0pscWZUcURB?=
 =?utf-8?B?c29uRVN2Y29qZEtud2c1TXBHM1B6QjE3M1JUY0FGNjBKaCtGaWF5SHliS3Bx?=
 =?utf-8?B?MmU1aWxpR0xvdVlpUk9pa1dDZGQzOVhMaE5VUDV0R2dxZzBmMGErS2xUYURB?=
 =?utf-8?B?SEppTm1FR0tIQlZ4bXlPOTYvT0NqaitHek5UNzJDeDM4bFZwUmhvYWE1UzFS?=
 =?utf-8?B?QUNoczdML0tpeXhkSWpocCt5ZjA5ZktjcHgyNDZPajFOb2pUNWFIVzdGSXZ2?=
 =?utf-8?B?MzNDMExjd2lPNmdxQzhCVlNBN3FkWVJtaFFWS2xtNlNnQUZXMVZKd1dYUEsy?=
 =?utf-8?B?N0hlWFZrdG8vek5DazIveUwvZjh6ditIa1JzbU1WbThjcjRCdS9aL0dwVEpT?=
 =?utf-8?B?YTh5UnY5eVhXemkxRkhFbXBVcEtqY1g0WWZyc1Z6S25TaWtWZUpqNHFGYmtE?=
 =?utf-8?B?WVFyMVN5NjNqdFpRZGVqTC93YjM0c3F4cUYyRUt1d3JpWkp4RldtalJuVjlD?=
 =?utf-8?B?cHNZSG9ZQ1Fva0Z4bytvTFRHN3pEbDB1VE1SS1BwQUt0NXFKc1RWUm1hRUc1?=
 =?utf-8?B?U0k3K09BRDRrZVJLR2c4RmNOU20rRktlUElkbVdWUTJCOEFMQ3ZwSURjTkV0?=
 =?utf-8?B?Sno3ZmdvcE1hRGhGL3VZMVJ4d0pUY29MRWRLeW1XSmV6Vlg3N3M4VUk1bHJK?=
 =?utf-8?B?RUVMZHp3RUMrbVJjdFYxbUFNS2Z5Q0hsU0JSWjVYeGZLbklEa0N5Qm5xbkRX?=
 =?utf-8?B?QzJiRkJRVnNpeUUxeGxVVVQwZ0FsM2prQXBtMVJ5S2lNVFFmQUhPMDlLRGxZ?=
 =?utf-8?B?TlhoMFFlUk55SEtWTGRrMGYvbmVwV3dVaEh5S0tIcEl2Q3ZLQlBCVUUwNDFE?=
 =?utf-8?Q?CGtv1MKLDCsEuZSaMs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f98924-d258-40f2-5d23-08dec2e50d20
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 09:30:15.8483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aw2SXT0jfji5bf8SbdTkNqv0CC4DMeBy+7KHp/Mhs1tVyz7qEWZoxzYvgVlChKkq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999139
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63884-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,intel.com,linaro.org];
	FORGED_RECIPIENTS(0.00)[m:bobbyeshleman@gmail.com,m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,amd.com:mid,amd.com:from_mime,amd.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D7D0646DC4

On 6/4/26 02:42, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> get_sg_table() emitted one PAGE_SIZE sg entry per page even when the
> underlying folio was larger.
> 
> Instead, walk folios[] and emit one sg entry per folio. When folios
> represent large pages (as is for MFD_HUGETLB), each sg entry is a large
> page. Normal PAGE_SIZE sg tables are unchanged.
> 
> Required by net/core/devmem to support rx-buf-size > PAGE_SIZE with
> udmabuf.

That doesn't explain why this is required.

Please note that accessing the pages/folio of an sg-table returned by DMA-buf is illegal and strictly forbidden!

Regards,
Christian.

> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> ---
>  drivers/dma-buf/udmabuf.c | 47 ++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 42 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 94b8ecb892bb..f28dd3788ada 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -141,26 +141,63 @@ static void vunmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>         vm_unmap_ram(map->vaddr, ubuf->pagecount);
>  }
> 
> +/* Return the number of contiguous pages backed by the folio at @i.
> + * A udmabuf may map only part of a folio, or reference the same folio
> + * in multiple non-contiguous runs, so folio_nr_pages() can't be used.
> + */
> +static pgoff_t udmabuf_folio_nr_pages(struct udmabuf *ubuf, pgoff_t i)
> +{
> +       struct folio *f = ubuf->folios[i];
> +       pgoff_t j;
> +
> +       for (j = 1; i + j < ubuf->pagecount; j++) {
> +               if (ubuf->folios[i + j] != f)
> +                       break;
> +               /* Same folio, but not a sequential offset within it. */
> +               if (ubuf->offsets[i + j] != ubuf->offsets[i] + j * PAGE_SIZE)
> +                       break;
> +       }
> +       return j;
> +}
> +
> +/* Count the contiguous folio runs in @ubuf, one sg entry per run. */
> +static unsigned int udmabuf_sg_nents(struct udmabuf *ubuf)
> +{
> +       unsigned int nents = 0;
> +       pgoff_t i;
> +
> +       for (i = 0; i < ubuf->pagecount; i += udmabuf_folio_nr_pages(ubuf, i))
> +               nents++;
> +       return nents;
> +}
> +
>  static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
>                                      enum dma_data_direction direction)
>  {
>         struct udmabuf *ubuf = buf->priv;
> -       struct sg_table *sg;
>         struct scatterlist *sgl;
> -       unsigned int i = 0;
> +       struct sg_table *sg;
> +       pgoff_t i, run;
> +       unsigned int nents;
>         int ret;
> 
> +       nents = udmabuf_sg_nents(ubuf);
> +
>         sg = kzalloc_obj(*sg);
>         if (!sg)
>                 return ERR_PTR(-ENOMEM);
> 
> -       ret = sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
> +       ret = sg_alloc_table(sg, nents, GFP_KERNEL);
>         if (ret < 0)
>                 goto err_alloc;
> 
> -       for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
> -               sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
> +       sgl = sg->sgl;
> +       for (i = 0; i < ubuf->pagecount; i += run) {
> +               run = udmabuf_folio_nr_pages(ubuf, i);
> +               sg_set_folio(sgl, ubuf->folios[i], run << PAGE_SHIFT,
>                              ubuf->offsets[i]);
> +               sgl = sg_next(sgl);
> +       }
> 
>         ret = dma_map_sgtable(dev, sg, direction, 0);
>         if (ret < 0)
> 
> --
> 2.53.0-Meta
> 


