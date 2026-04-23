Return-Path: <linux-media+bounces-59431-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOlLDkc96mk2xQIAu9opvQ
	(envelope-from <linux-media+bounces-59431-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 17:39:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A6845487D
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 17:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 62961302FB71
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E99933261F;
	Thu, 23 Apr 2026 15:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OAloBMss"
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012036.outbound.protection.outlook.com [52.101.48.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE18816A956;
	Thu, 23 Apr 2026 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776958085; cv=fail; b=sO8Wv+slxG95Nn6NgYrQpz1jSXydbApwoaezo2jXURt2WHx2cV6KZMOiAEwLPcxzx5ULRmemzM1Pb6DBpzF0vKig6lkyN/mUquvnwRKMmI7LkLNnhYHwhPhfATHo0M/fjStJbl9Usxuying2sltUDaG3WCT8g2J4nCq4nG7LWG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776958085; c=relaxed/simple;
	bh=3V/8RL9/0xdpxPrXuCUo9b7udBRke++rTBS2wHtwKFc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=d5W2bbSW2zbYrQqTdxL0LmyLRRO4cxm/b0hlMFBEKVYWr36B38pognSrZ4AoS5YCGUkoBv6dIzphzxkP3r/IFXBu1kMbTdqKiddiXwf3Zbbk6AEzGMGOsSjFaYM5QrbWzSX70ssEKxs4qFZFNNaHqJMswYtBAaRgAoHRvTmPWUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OAloBMss; arc=fail smtp.client-ip=52.101.48.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNZK948Q0/ZqHIHS6IPQ/brAULkHrvIu/+60WlPqXeuwt0CdfqToNPxqNEe/RDmbPPFln+UPLRhRoL0YzVwLgxm9CASkxG60llIA8zGSY2KzJ+llrp1AKuHZPbvEEy1vkj4gLyd0EbTM9RhsHBF/SmfLslx+NSu8HnWM/Lq6htOTlU+6zFAIYB/Er2M1VTRPjOvrtHiTDzlLvQ/S7zR9THDDwIkbVQ21TNpKyvXuEEER24SFha3yaX8e2Dfolyty5450rBtzTYik82/3OL/u8669eVjVIzZSQO/z2rccD7jrEvYqsmJfMwdLui/RLVXWcB+QVha+RqK/WQQpgY+d2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPvssGjHJ9jeYuJ6i0aenHUJ/YEeN9RDC/Q46n4NE20=;
 b=UCqIe1iWgJoJreibs08s6MacXp5nVPcp4La5gsundqkbfnSTqgNjTTvvod4Z3zhZRBoaxZkhaDoAkOaZ+NIpdT5UvLWhSsWmTAT4FqVn6KHFPD93hQCqTrRmSFX2rARg6KuDVevdJxZw/rj2qdmH8enrwTEMd25WRPfp0lKXv15I1jRmAlPu1IfAanoq89CFvJGhsDEU63xHeovKMNbGVFWtnVJ7herJg+qaYwZC09A9MRzqRJMOYBbxZi1Zp0N5uWQg1ttb9S6T6Uep7tElYvSwUGiXbSwBySic0GgcgSHf3sWmDAW5BRn3RRjwILLdCmr1SVvzxNX5q0+gDj2tRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPvssGjHJ9jeYuJ6i0aenHUJ/YEeN9RDC/Q46n4NE20=;
 b=OAloBMssa+gKMvOtVYu/H3Mcov29acipxHMV+vybG+HJWkKAQ5OPvvm/E2lKkZwWyUzWg6wJk4KERl8XaOrrUCizHH+wDCh6rlGcX4j3mVnyuHcX7Kdse58GO1r7+VnlnLJxWY1aMA4+YiDT21EJusqmXzveWXEek9W9BblWJL10j92Njvp6jfnrmSaMf9Zqm1aYZh2WCBsMD1htE7/EhikVR1hnBCzuy254+lyByM1uJbIMgHOBxw2e3fbzbJIIQoRb/OFT47+R5qIixEaTIcaQy6tdlYBL8dGDInpwYuH8w7BXkAlamHCSaKB9+YWru4f1L0gCMltED0tw1cYFIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY3PR12MB9680.namprd12.prod.outlook.com (2603:10b6:930:100::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 15:27:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9846.019; Thu, 23 Apr 2026
 15:27:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 00:27:55 +0900
Message-Id: <DI0N2EDVV7MI.UFR6TKHDJLZG@nvidia.com>
Cc: "Lyude Paul" <lyude@redhat.com>, <nouveau@lists.freedesktop.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 <dri-devel@lists.freedesktop.org>, "Matthew Maurer" <mmaurer@google.com>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, <christian.koenig@amd.com>, "Asahi Lina"
 <lina@asahilina.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Alice Ryhl"
 <aliceryhl@google.com>, "Boqun Feng" <boqun@kernel.org>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, "Krishna Ketan Rai" <prafulrai522@gmail.com>,
 <linux-media@vger.kernel.org>, "Shankari Anand"
 <shankari.ak0208@gmail.com>, "David Airlie" <airlied@gmail.com>, "Benno
 Lossin" <lossin@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 <linaro-mm-sig@lists.linaro.org>, "Asahi Lina" <lina+kernel@asahilina.net>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, <kernel@vger.kernel.org>
Subject: Re: [PATCH v12 4/5] rust: drm: gem: Introduce shmem::SGTable
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260421235346.672794-1-lyude@redhat.com>
 <20260421235346.672794-5-lyude@redhat.com>
 <DI0MI6UF325Y.2TDWZGCN3WGIG@nvidia.com>
 <DI0MOCJ8BO4A.37OS3YPF3VPK3@garyguo.net>
In-Reply-To: <DI0MOCJ8BO4A.37OS3YPF3VPK3@garyguo.net>
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY3PR12MB9680:EE_
X-MS-Office365-Filtering-Correlation-Id: a379d55e-4692-4184-501a-08dea14ce648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	BiWXR3W338mUTw5RJ/EMzK3yYLKKyKdRdBJmEzSRnbkwsXjhGROcDoVC+5cW36QWSwfsJ/v7kUOPkHC+Fr3Qmn9qWDK6uWFVuqvA5Y4Zrx/LCKNKZIvwYHcDxq+Bz8IRbDJ+7bdmVwElj3ZypCvjuLx4LPEPoeRFBWpl9x049EA2gJ0VFRGOcCUajPOUrR7U4fdYnsagw3oIzW+sTyMURWE3kemQA/yX/mceeVKzTSmoYPHnQfARL0nBDGv/N52AUlajCp3q5wnm4ZOCFRQ1FxB1pyu61rjZHJ140/YB/hLeJVo9RUOXPI3tiPCs27QDLBhB13myc1SbTzPNktyleGhe1wP6h9Wl87ANEcJFsglPT9+MtX+cUMDb/bvDJMIaiq+dYncds/qgPmevLrDdXQr/9rwrAkVh9BhC0yEvSL93IFWGjPBehMHjqeBaD1sjLfvcNhVecz86+oNb/Pjq2XpaX3t9A0EMXpXKYu9h8nC8274QGWaLYUqMalL+g7jvmEtmGbZukHaDK4TiDy3B1TUKg5/KykKLG3nZzazn6e16VGLp8caTyuDG48nqknJhqqWkFz0APlxSHhBqo6jGMSJhdUky+vvl1ZXgWzfjLJWhh/AnClu9LFfbigXQCgqrB6YUGsh9oBSYSRjwZIQutZuKzwaSZFVbXm+LIdEtxRL/5BxskMmpmCtOHRMo7dNxZ/vCnvP87YteHRogS6EY/KB7R15iJFKZh+vCAbPhoY9bW9jd+fz2UAllD/VkPv4B
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHA0MzRYTUVUQitHbnFwYzNPVGtCOEMvVmM3MUZuKzByRFJ1L2dYMkJibHFo?=
 =?utf-8?B?MnpkM0s1QUs1c21nTEVIK2h1MC8yMzYrdkJndFlocWJmOE9KU08xMkZJTWRS?=
 =?utf-8?B?VGlCMzBaaFQzZko3WUJITnQ3MGVjdG1NVGI4LzJnb0Y2MEZBeHZTN0JjaW01?=
 =?utf-8?B?d0xqU0FKYnEwdWhqQ05BNVBOeEVzMm5NQUs2Yi9xdHk2YmRtdytmTU5CV1FX?=
 =?utf-8?B?V1IweWtrRVM4RUNsc29IdGd3cTNkb2ZBek9LWXlLUUIvY2g0U1J6blRLU0xB?=
 =?utf-8?B?YlorRWlNSzBFQ0FXTHVaSFArekFVUllTcGV6dVBpUkc0ODhORXBQalQzTmVG?=
 =?utf-8?B?ZXFyWlJxRGYvUmd0MHNtaXltcFdsMDNYWGIwZlExam5GZG52RVg1dmdXNDl6?=
 =?utf-8?B?Znl3NkpoQzhpSk1nOWJIZm5WdmM5MjZSckdRM284dHA3QnQwaVk0ZDZwNzJp?=
 =?utf-8?B?a3Q3Z3MvRTBiZ0EyNjhHK1ZWQmJWcXVNMlFPVW0vN0RzZDFYQjUwQjBlMTd5?=
 =?utf-8?B?czd5RFY2SWZVbVpCeUJzNk9WWDM2YTVSSkJLRUt3U2ZycElWRU44TU5hdi9Q?=
 =?utf-8?B?SFJibkt4VEkrVk4wWVB3S3BtWnZocFVwV3JEOXI3N0lmSlJLVkhxWU5tYWY3?=
 =?utf-8?B?V1I5QnlGTVBBOEFUL0hkT3VoUFZnT1dGVk0xdzh4bjdPL2pyYVJWOWhkVlNa?=
 =?utf-8?B?YXp5bWRKNXdQL29UTzVjL2ZVNTZTdFpSRWlRcHRUK3FzazkzbTJ0elhjTXpJ?=
 =?utf-8?B?SVNIdENRczJwNk9UNk04V1k5endwc0I5THlnT3llaGl1VGtaaXprOHluVTB0?=
 =?utf-8?B?M3lOOURnMVNCMnJoWFNCNVZxbmlyc2YwNEI2a1JlTWhGNTcvYmtNeTJIRm0y?=
 =?utf-8?B?c3lwMyt2MXlzbnVsemRackxoM3NaeXJKSjZndWdtelVWZ2JON2U1NmhXR2FV?=
 =?utf-8?B?TGdnSDROQm5JNzNnWUlyY0gwTGw5bFlVcGVKMWROLzcwLzVhRjM0VCtvVm85?=
 =?utf-8?B?NGFRUnZYbFpMTENLemlBYVF6QWx3dHlXTkJJUWVlQ0Jad0w0R08xWnd5T3di?=
 =?utf-8?B?VWkyWU85QTd0KzlTUWhKSy8rZUlJMEZrd2YwTnZ1N2llUElaN3VtVlE3ZzZp?=
 =?utf-8?B?QmZuRTFFWEg1bkk5S096QndCZCtyK0tzRFU2V3ROVHcrN0VDY2FnSXluaEgy?=
 =?utf-8?B?U1JhTWFBSlhWdTZFNktmNG9RbGQ5VlVhRHVjc2o4V2x5MS9yVHgvRG9NRTRp?=
 =?utf-8?B?WTdEUFpPSXBWd0YzWDk5eW9kcWpMUFg0NVRyUjVJbmJKOGROQ3IxRjYycVc4?=
 =?utf-8?B?WXhYQVBTZUt1aDhGWjBETFVSVmhyekdwajM5elRjQXdFNXIwVkRNc056STFP?=
 =?utf-8?B?MVREcGFiMlA1bEN0YTEzb2R5aHpsZFVnM2dMV1NwdTZqM25PcmR1SXd4K1BW?=
 =?utf-8?B?Q2tLVDN0RDU0TEI0UWowb1lhckpXNkh3akNjUmp0WFhvZDlqelROSzJ4VDlp?=
 =?utf-8?B?WVM4dkg2WS9iVjdPLzVUVTk2ckJTU2RzWStoaThmQ2E4WGdORmFRK0MzbWRy?=
 =?utf-8?B?czBWQ1NqRm9aR1EzOFpienBHVFAwbWhrTHVsSWlyU1BQTTdJdFdJdzBDcTRT?=
 =?utf-8?B?WHd0RDVpdlN5d0lXWVVMMnhzZStXUTdTQUJKR3krcmFnQlQzdTdSbHdmK1dL?=
 =?utf-8?B?cTZhUjFWUEpEQkRYUXhRdHZJS1N4NzNVdHE5QWRjMUZZd2RYa1M3YkNNSEJk?=
 =?utf-8?B?MU52VXJFYSt6Yit3TnZuRHBhQmdvQjZnN0E1ZDZNNjAwcE9MUmZ5S1QvY1FM?=
 =?utf-8?B?SW43cE5FRVhIZGdqVmhOSXRnSmh3YWVBVm5wdmExZjlhYk82Q3lUZTlzMk5E?=
 =?utf-8?B?ZVJjS1hjUElXWjFUdWVCcW5FOGdrTlBaa05jcHJ1TzNSQWJ6Qkp2SDZMd3FG?=
 =?utf-8?B?ekx4Y3dDanN2RFFSUjBWbzNCb0NrdS85UElkUXVPUzMyVG9URmt6YzJNU1M1?=
 =?utf-8?B?bjNFTkhsOFM3K1ZoOEhwTmk5aVdqcDZhamRGMk02a2h2WVdHNnlsZzBTQ3Vw?=
 =?utf-8?B?aHRTaUFMbXBHb2U0S3ZGTzdLeElwejIwZ0dodU5YZUZQWFNXTm5DbTFLUCtJ?=
 =?utf-8?B?eHhHNG1QQU9jRjVFNkQzcGhEQmtpSlJQM29BYVVVUU1BMk9yK3Nkd0VGMHcw?=
 =?utf-8?B?b0hBY3ZObGdnblFaZlp1R2tTVEdYS2Q2NnRPQTl6TGkxNDlKOVYwd1pnTkNU?=
 =?utf-8?B?U1ZNYng1T2ZXWkE1eWpjVE81aUN1VGR6Qk42WXdGNys0M0o2UjYxTWF6eWty?=
 =?utf-8?B?UnBSOVNla1Uxc0daWEZYdk9PL1lBQnBRVGtHQnF1OWRoRlgxY244NGpWei9u?=
 =?utf-8?Q?Gh3cXgrdtPIiM+bpOPnytDcHMXs9VlwFvDUgZFupJ0ePU?=
X-MS-Exchange-AntiSpam-MessageData-1: vwPhM7V9sliNCw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a379d55e-4692-4184-501a-08dea14ce648
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 15:27:58.8096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nue/VyjnJ2Tb/qrGn6z3gnD1QGqhVASCpg/MSRqWFaIzb2pFrjoXS8I/Sr4SmjY0FbOK31EEtTuxvNpkCS2JIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9680
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59431-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,lists.freedesktop.org,collabora.com,vger.kernel.org,kernel.org,google.com,gmail.com,oracle.com,amd.com,asahilina.net,ffwll.ch,linaro.org,lists.linaro.org,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 37A6845487D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri Apr 24, 2026 at 12:09 AM JST, Gary Guo wrote:
> On Thu Apr 23, 2026 at 4:01 PM BST, Alexandre Courbot wrote:
>> Hi Lyude,
>>
>> On Wed Apr 22, 2026 at 8:52 AM JST, Lyude Paul wrote:
>>> In order to do this, we need to be careful to ensure that any interface=
 we
>>> expose for scatterlists ensures that any mappings created from one are
>>> destroyed on driver-unbind. To do this, we introduce a Devres resource =
into
>>> shmem::Object that we use in order to ensure that we release any SGTabl=
e
>>> mappings on driver-unbind. We store this in an UnsafeCell and protect
>>> access to it using the dma_resv lock that we already have from the shme=
m
>>> gem object, which is the same lock that currently protects
>>> drm_gem_object_shmem->sgt.
>>>
>>> We also provide two different methods for acquiring an sg table:
>>> self.sg_table(), and self.owned_sg_table(). The first function is for
>>> short-term uses of mapped SGTables, the second is for callers that need=
 to
>>> hold onto the mapped SGTable for an extended period of time. The second
>>> variant uses Devres of course, whereas the first simply relies on rust'=
s
>>> borrow checker to prevent driver-unbind when using the mapped SGTable.
>>>
>>> Signed-off-by: Lyude Paul <lyude@redhat.com>
>>>
>>> ---
>>> V3:
>>> * Rename OwnedSGTable to shmem::SGTable. Since the current version of t=
he
>>>   SGTable abstractions now has a `Owned` and `Borrowed` variant, I thin=
k
>>>   renaming this to shmem::SGTable makes things less confusing.
>>>   We do however, keep the name of owned_sg_table() as-is.
>>> V4:
>>> * Clarify safety comments for SGTable to explain why the object is
>>>   thread-safe.
>>> * Rename from SGTableRef to SGTable
>>> V10:
>>> * Use Devres in order to ensure that SGTables are revocable, and are
>>>   unmapped on driver-unbind.
>>> V11:
>>> * s/create_sg_table()/get_sg_table()
>>> * Get rid of extraneous `ret =3D ` in shmem::Object::get_sg_table()
>>> V12:
>>> * Actually move sgt_res in this patch and not the next one
>>>
>>>  rust/kernel/drm/gem/shmem.rs | 192 ++++++++++++++++++++++++++++++++++-
>>>  1 file changed, 190 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.r=
s
>>> index 11749c36e8695..a477312c8a09b 100644
>>> --- a/rust/kernel/drm/gem/shmem.rs
>>> +++ b/rust/kernel/drm/gem/shmem.rs
>>> @@ -11,25 +11,38 @@
>>> =20
>>>  use crate::{
>>>      container_of,
>>> +    device::{
>>> +        self,
>>> +        Bound, //
>>> +    },
>>> +    devres::*,
>>>      drm::{
>>>          driver,
>>>          gem,
>>>          private::Sealed,
>>>          Device, //
>>>      },
>>> -    error::to_result,
>>> +    error::{
>>> +        from_err_ptr,
>>> +        to_result, //
>>> +    },
>>>      prelude::*,
>>> +    scatterlist,
>>>      types::{
>>>          ARef,
>>
>> This fails on master:
>>
>>     error[E0432]: unresolved import `crate::sync::ARef`
>>       --> ../rust/kernel/drm/gem/shmem.rs:36:5
>>       |
>>     36 |     sync::ARef,
>>       |     ^^^^^^^^^^ no `ARef` in `sync`
>>
>> Importing `sync::aref::ARef` seems to be the correct way now.
>>
>>>          Opaque, //
>>>      }, //
>>>  };
>>>  use core::{
>>> +    cell::UnsafeCell,
>>>      ops::{
>>>          Deref,
>>>          DerefMut, //
>>>      },
>>> -    ptr::NonNull,
>>> +    ptr::{
>>> +        self,
>>> +        NonNull, //
>>> +    },
>>>  };
>>>  use gem::{
>>>      BaseObjectPrivate,
>>> @@ -61,6 +74,11 @@ pub struct ObjectConfig<'a, T: DriverObject> {
>>>  #[repr(C)]
>>>  #[pin_data]
>>>  pub struct Object<T: DriverObject> {
>>> +    /// Devres object for unmapping any SGTable on driver-unbind.
>>> +    ///
>>> +    /// This is protected by the object's dma_resv lock. It needs to b=
e before `obj` to ensure that
>>> +    /// it is destroyed before `obj` on `Drop`.
>>> +    sgt_res: UnsafeCell<Option<Devres<SGTableMap<T>>>>,
>>
>> I didn't like this `UnsafeCell<Option>` since the last time, but only fi=
gured how to replace it now:
>>
>>     sgt_res: SetOnce<Devres<SGTableMap<T>>>,
>>
>> It's actually designed for that! And lets you remove at least one unsafe
>> statement, while simplifying `get_sg_table` quite a bit. With the other
>> suggestions I have below, here is my version of `get_sg_table` for
>> reference:
>>
>>     fn get_sg_table<'a>(
>>         &'a self,
>>         dev: &'a device::Device<Bound>,
>>     ) -> Result<&'a Devres<SGTableMap<T>>> {
>>         let _dma_resv =3D DmaResvGuard::new(self);
>>
>>         if let Some(devres) =3D self.sgt_res.as_ref() {
>>             Ok(devres)
>>         } else {
>>             // Only called for the side-effect of populating the GEM SG =
table.
>>             // SAFETY: We grabbed the lock required for calling this fun=
ction above.
>>             from_err_ptr(unsafe {
>>                 bindings::drm_gem_shmem_get_pages_sgt_locked(self.as_raw=
_shmem())
>>             })?;
>>
>>             // INVARIANT:
>>             // - We called drm_gem_shmem_get_pages_sgt_locked above and =
checked that it
>>             //   succeeded, fulfilling the invariant of `SGTableMap` tha=
t the object's `sgt` field
>>             //   is initialized.
>>             // - We store this Devres in the object itself and don't mov=
e it, ensuring that the
>>             //   object it points to remains valid for the lifetime of t=
he `SGTableMap`.
>>             let devres =3D
>>                 Devres::new(dev, init!(SGTableMap { obj: self.into() }))=
.inspect_err(|_| {
>>                     // We can't make sure that the pages for this object=
 are unmapped on
>>                     // driver-unbind, so we need to release the sgt
>>                     // SAFETY:
>>                     // - We grabbed the lock required for calling this f=
unction above
>>                     // - We checked above that get_pages_sgt_locked() wa=
s successful
>>                     unsafe { bindings::__drm_gem_shmem_free_sgt_locked(s=
elf.as_raw_shmem()) }
>>                 })?;
>>
>>             self.sgt_res.populate(devres);
>>
>>             // PANIC: `populate` has just succeeded, guaranteeing that `=
sgt_res` is populated.
>>             Ok(self.sgt_res.as_ref().unwrap())
>>         }
>>     }
>>
>> And if only we could populate the `SetOnce` with a `impl Init<T, E>`,
>> then we could even remove the DMA reservation acquisition on the fast
>> path, because `SetOnce` comes with its own locking and the DMA lock here
>> is used outside of its intended scope. I'll try to push the necessary
>> work for `SetOnce` and maybe we can do that as a follow-up patch.
>
> I have this sitting in my once_wip branch for while
> https://github.com/nbdd0121/linux/commits/once_wip/
> (the specific commit that adds init support is
> https://github.com/nbdd0121/linux/commit/4aabdbcf20b11626c253f203745b1d55=
c37ab2ee).
>
> This was implemented for lazy revocable support which Alvin has picked up=
, see
> https://lore.kernel.org/rust-for-linux/20260326-b4-tyr-debugfs-v1-1-074ba=
dd18716@linux.dev/

Haha that's pretty close to what I wrote to test the code. Do you have
plans to send it soon?

