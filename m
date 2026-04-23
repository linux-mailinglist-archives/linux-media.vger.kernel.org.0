Return-Path: <linux-media+bounces-59429-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAR5DvQ16mk+xAIAu9opvQ
	(envelope-from <linux-media+bounces-59429-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 17:08:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F00C45418E
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 17:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39CD830C9E6B
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450EF3624BA;
	Thu, 23 Apr 2026 15:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ozNWrGYr"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011023.outbound.protection.outlook.com [52.101.62.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A8C285CA4;
	Thu, 23 Apr 2026 15:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776956528; cv=fail; b=CLsP5BURYPGa5pZS+yG2/bdW/YEBUTXszbQMy9BsFfPmR7CBhvX+OU8gGJ0X/rm8oy010ZK8KLuPlQsm/kMWjU2eUJTW1nHMxqVoFDM1r4OUCWoBpdMhMSs3FBaf1kzLx9kMvj+oTAMacJ94u1QqSsUPwAzlrod5C885EeRWiaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776956528; c=relaxed/simple;
	bh=cx2if3nwGmdSc1vwakCDzaU0Gv+NmbmPsWr40dQtgHI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=HeAhUtFsyT5uG8j+zT6Xg8DAIh6CeFeSAOQXHE/cDyh3Tp/tsxUadgoQ4bq26wB7qQ6/rnHZruwXTdAnNv1l4dn5cLKJ97rFeY221S3lEJSesF+c+VNEW7wUlu6YyP4YjnoTb+YFuEFcKMqIkaKsCpNx7sJ8w7oh66prggaJk9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ozNWrGYr; arc=fail smtp.client-ip=52.101.62.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BoU5bT7Pdzbl/BSka+GpNO0F9qdqUVHQJzjjkB6HjpTKHNfgPNx9WNyaKOT5ah3URNzPSwsRpr3IMh4pgIc5dQITtxwGzOH7oWaN2jiCBE0ZylDyf1DOSEil1aENmIgCwsKTUmCFi3dHIj6H+eYhTEamXmkdWIygAXOfSH5ITXvVH9librr0RFbV64mKUEsHjd8I6SodHpnNpZBZXkC7kM4wDnhCg8eJbKZNniPrd5qQgb17ye581KrqMELVm9Goy4NVpPjdOHw9AcOUywL3V8UhBAbwBOffKH/OfaD9CT6CkL0CDhFbst42hhC0LU4it+iG2L5+zSFsxjGefOg9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCPCYAykWa1MxUSGw79HlnhBGDigg9Z4gm3Y+uBKTOM=;
 b=qM8BGqhOrvV7cpB82UVw2WAfXNLOfHHqUEuYOm+RrXb+UaMldDXRqTqLT4EB3NurOYNAOrDDbDU/CK2XDhPhHeyzusfx5KGtnMzh+OFdILkIMGKrwzlLQU////OFaiRJ5MpPdpJuQzpPzCgDffLxemBlKArAj7lwviEw6Asq3uoyeq2PX1zIGVbV39AK4sJWk+GEyhdCiCqrXU8mq55uPU68Dk89jt0JpDCZ+h8hsc6KaUMUDAXZMiydCo/fYcOdsypCEQpjCzN/qAwf3iaNjHn+nJvUDkZ/6zDNXuLvedckMI3yGao3KgpsVUUQ43/VZ7osWhFa3HDpNd+5fxVTQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCPCYAykWa1MxUSGw79HlnhBGDigg9Z4gm3Y+uBKTOM=;
 b=ozNWrGYreeNac/fEABSFO3TfVf85gBnUjPJScfMrzHDWc6fKVSRxQ7IUDmvGjh9LkIEOH0MWvXYSGaNstS0m5Ggyb91GEIsgsDOMVMr9cqnHx/cABrm6BI5Z+HQraY87AX3Ae/jEfKB+4OBKK8jv4g+0mQ8LWIuOYnF7xMQyjETptENOvaadU9N1TVk0CbIBsHVFvO+b+dzmZDUMlwZvuuMSpO59lgDCEVW4XsfyRmNdfSn+JPM0feOD4zMBqnU91L7dPxML04Lzdxyphe6fHb5/VvFNyjFO9jN4Gz6tbGwxDFuvXPQoaR2TRde/HGjYk/LtBo2zMD/jnRlgb5hiQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS5PPF482CFEB7D.namprd12.prod.outlook.com (2603:10b6:f:fc00::64a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Thu, 23 Apr
 2026 15:02:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9846.019; Thu, 23 Apr 2026
 15:02:00 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 00:01:56 +0900
Message-Id: <DI0MII8J4P2Y.309VKYVMQJNVK@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, "Gary Guo" <gary@garyguo.net>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, <rust-for-linux@vger.kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, <dri-devel@lists.freedesktop.org>,
 "Matthew Maurer" <mmaurer@google.com>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>, "Lorenzo Stoakes"
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
Subject: Re: [PATCH v12 5/5] rust: drm: gem: Add vmap functions to shmem
 bindings
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Lyude Paul" <lyude@redhat.com>
Content-Transfer-Encoding: quoted-printable
References: <20260421235346.672794-1-lyude@redhat.com>
 <20260421235346.672794-6-lyude@redhat.com>
In-Reply-To: <20260421235346.672794-6-lyude@redhat.com>
X-ClientProxiedBy: TYCP286CA0066.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS5PPF482CFEB7D:EE_
X-MS-Office365-Filtering-Correlation-Id: 124001a8-db87-41ba-8c67-08dea1494539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	zv1hkVqc7p7+s5xQqR/8R6mYqseeq98L5QHNgMmnUaZWhrIGLGBzNKBAgJnpLIQam40+TZq8EmRQyQTATRa6K7JxC4H42fcAILfgpDjI3L3W09pOfyu4bCPZnTM1q0vwbzabDcTaATjaYNcGW+UaV5K2Ldj5mVhtH10GSaspnE6dcMqIurclCU8wO14AcCFMQ+TOHMyWeGw14vK0/2Plfsum0SzaE5KxmODUTNB0vTLo4dR0mBVbPqt1o4xBXPPnfYYi+7NG5rVjsn5xltP3GYyZ1XSFaQN/ZDXgbHXZxrpmjIDRjq2+Oqd8E664x7NYK/A7ic3U2b0QZvrLMqhNp+mSdG1otH4MEcHiW4/Ym2eNpp+cL2RVtj9CacQoOFUSxtJMqOatEWrNaHB3tjO3sui4dKtukMYti4xRzHqvxkEGIP1CWTl9LjcpSPQylB3I1r5ZFZs3D398yAO1Yu9crVtGtkDj3nAokVzX/EylVVn3nQmbaxzzyPEk0XHTwbCXjipc8ibjrCG7MoTjw3DXj50ggiL7Km3ZWcIW+mMf1encJQMSvc7PUh/4V/KcBef1UN/sEpy9S2kOhk90s+AJckE9/kyKBvYIy0k5HgAnq+pheuszOEAvx+g4rcog3JJqVFlMoQfNFYnmH3G3rBRKfZAJpeRNaiYtMMlZLOysb6sWvNrprKX7grGfW+Ncy+J15Oa9/a2ZtDv30LKFMwEc2g0JzHTGVDcDTZbkJzG3Xtc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEsxOHlhd29hYjA3NkM2RUIwTk9LNHRNcVhuRkZoNXhTQ1FMd3daN0lGS3RF?=
 =?utf-8?B?dEExbFM3N3lBVXI5enl4U3ZRUno3U1R2QmtOQ2FBQmxOUS84Y052YXR5aDY4?=
 =?utf-8?B?Y1BlZnhwZ2lyTlI4czBETCtnWFJOeTYvZFlLZEpJUXROZGVWeGcxeFJXa1R0?=
 =?utf-8?B?UzZpQkN5enJKY21MdXBLWW45bDd3N2ZtVkhMcFZKV3M1VDQwbmlLYUtlSXlh?=
 =?utf-8?B?SysvWThSWVRRdnJRWk1PSnhVR2d3ZVQ0MkpwaWM2cmhvajc0TDhLaHVRK2Vw?=
 =?utf-8?B?RnQ3bXU0aW9PbGV0OXpJMHJhOXFFbEM0SjdRT2cwVWZ2N1lXaFFkc3dYMHBW?=
 =?utf-8?B?eFE3SU5RTkNMclZWellyUG9zdWZGWkRMVkhaKzY5QnRuM2Vqb0ppNjNiN0l6?=
 =?utf-8?B?RmFNRm5IQmhaNG9IQ0hudGNRQko0OEZqQndGRms4VmVWUzc4TXhFZkVINTBz?=
 =?utf-8?B?dGxiaUdEUXV0Qyt4L056VS9nbVF5RlZoWXB5b2Rzbm9uWDJGQWlWWitscFd1?=
 =?utf-8?B?alRWaGg4U0RDazd1UmlTdm00bUpiTzg2ZUtadzRQNGl5SWF1bW9qVzA1R1Fo?=
 =?utf-8?B?Ly9sRk4rRjhkaHJjaDFPa2UvZ1ZFb0R1ZnpXdW9GSEUwZVR0K0c2NEdlUWlW?=
 =?utf-8?B?aEMxQ3dDQzlyRFRDYUVVTDJjU0VGcDJEVUtxd291dkdkVkxiQUFtS1pWbU83?=
 =?utf-8?B?dDJnbk1ES3h6RlRiRFBHbDVORlJvMTdTTGtXR3Zab0doWVZ6eHdLQTRBem9u?=
 =?utf-8?B?UU9ycXgrZm5uQ2hpNkRJQzNrdzVQRDNJODUrMUk2NFFtL0YwSVJENGpwckpL?=
 =?utf-8?B?NStwL3JGOTRMVktvRWNUNVVLZjUwdWkvOHl3UW9FaHZxVFNzaVJpRUZJb1ZU?=
 =?utf-8?B?bkJxbFBGTVFTYVVySWs1d0sxNFhpV29IZWxaNjhMSWxWM053V2EybGladmJr?=
 =?utf-8?B?Qk94T0tpVzU5dHlydHdLc3R2cHp0YjhkT09aSGZIdkcrcFppei9ZUkJSY0hC?=
 =?utf-8?B?NThHZ1pwbk1SellIOVR2SDVKL3NzZXJmUUlmWXJlQ3FjTWxDRnlGK3Mra3gv?=
 =?utf-8?B?N1NLTzBkcUFTNkoyU1Mrc1FwWEErOS83WkhjaVJBNDBld0tTN05zdlpqS0xx?=
 =?utf-8?B?c09BWURLTEFxY0hQZ3pTOHdHQXJtM082UXRIRHpReDJiWVpXSjFBT0dBWGxx?=
 =?utf-8?B?TVJZOWEyVFhpSGpFcW15TVNMZWphbGZ2d1dQdUJPZFNkUFd3TTlBcUppVkxV?=
 =?utf-8?B?M21RRjNxNFlsRWpxMXhXNmpicEZJSzVIQnFpRHh6Mys5SFNDUjNVOTJ2N2Jl?=
 =?utf-8?B?QndzUEY2T3k5RElRYnUwNDFsbCszN0Yzc1BVYVlraGlET1B6djlSeVhodkt6?=
 =?utf-8?B?VmVTSGtsSXFmOWVDZER3aWgrMk5WUFMvQXE3YnY4bm45NkxzVWRFV2xLdHZt?=
 =?utf-8?B?bU4rQ25NOVhuamVOczZ5UWxzWHBUWXpaakZJY21QNm52OTdOWjJJVlNIdFY4?=
 =?utf-8?B?YzNvMFRkRnE2QkdNL21ieVcrYkZIUVN1UEt0aERFNERlMHFrWk1TRys3cGd1?=
 =?utf-8?B?eWdOb2d1YTRNSDRvWnc2bjNxSC9UaTFtcytrenUySnFhQldZalV0ZFNZOWov?=
 =?utf-8?B?NkV0eUxoUEU5elkrUW8rUy9CRjZVOVJRNnpzY2tvMHpIdUREYU91NVBxa0Vq?=
 =?utf-8?B?TjZraDBxODhJUk5ST1ZUTkJYRDU0QW8wTG8zRTUrVCtlb0t3ZmpodWJCYTJW?=
 =?utf-8?B?OWdpeWtxUkkrd0MrTDYrTHpLb1FqaHJ3aUk1Q2RnN0s3OGlJNGxvcUVsdDRX?=
 =?utf-8?B?VXZpb21FRFhKa3RiaFIzVHdpRkVyUjB5aStuUGlaNm9Ka3A4WThJWGRTdC9I?=
 =?utf-8?B?TU9SR1hzQ2o1YkpzSlYrOUFlcnBWUUYwNkhqTTBxV01jOVVUQ1NwbFd3bUZK?=
 =?utf-8?B?TEdidGplcWp2eEpsUG9Md3NnZ1o4VVkxbFJaajMwOUM0S3hpeDRBaENCd1Ux?=
 =?utf-8?B?alVWd29zaTBXTHU2TUg3M0xrQWFLYzZBcmVzNE9HNzVOQUZTQzh4SzhFSTZj?=
 =?utf-8?B?VDZhTW56RitQL08ydTlobVpkQWRqL2NjenV4b0xuNGQ3bWgzeXA3cU5vL01F?=
 =?utf-8?B?Ri8zSTE2WmtvaE9lMHRGdjRCNFEvYUhCcnhFVHljS1FiMWJYMDlpVVRNeEtz?=
 =?utf-8?B?N1BmTlVjZitkVTl2cnFYMUlidUFDUnE4OXhvV0Q3bHF6T0p0b0U4OFVnSGRX?=
 =?utf-8?B?ejFCTHF0TWYvSFN6VWo2SzJCM2FZektmSWN0b3BCc1N1UDkxVlB1bUs4d3E1?=
 =?utf-8?B?MGl2UjBETTdnOHRVR1l0Tjc4RVUzZzU4UW5neXZhTHhTODNiNE15ODlWL05W?=
 =?utf-8?Q?2PvKgMsuZK7CqhiEy8zqizhsX3rA+QToOUC8PttAHtO1N?=
X-MS-Exchange-AntiSpam-MessageData-1: C2rXnT9g91CD9w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 124001a8-db87-41ba-8c67-08dea1494539
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 15:02:00.1547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AieZG6Dp7zaPY8E6bG/pb4otAMOdDlvIbotFdG+midTaBmUmsaDo3hG9xwSjO/cac0qywKIPiKEJQtGU3A3vqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF482CFEB7D
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,garyguo.net,collabora.com,vger.kernel.org,kernel.org,google.com,gmail.com,oracle.com,amd.com,asahilina.net,ffwll.ch,linaro.org,lists.linaro.org,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-59429-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F00C45418E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 22, 2026 at 8:52 AM JST, Lyude Paul wrote:
> One of the more obvious use cases for gem shmem objects is the ability to
> create mappings into their contents. So, let's hook this up in our rust
> bindings.
>
> Similar to how we handle SGTables, we make sure there's two different typ=
es
> of mappings: owned mappings (kernel::drm::gem::shmem::VMap) and borrowed
> mappings (kernel::drm::gem::shmem::VMapRef).
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> ---
> V7:
> * Switch over to the new iosys map bindings that use the Io trait
> V8:
> * Get rid of iosys_map bindings for now, only support non-iomem types
> * s/as_shmem()/as_raw_shmem()
> V9:
> * Get rid of some outdated comments I missed
> * Add missing SIZE check to raw_vmap()
> * Add a proper unit test that ensures that we actually validate SIZE at
>   compile-time.
>   Turns out it takes only 34 lines to make a boilerplate DRM driver for a
>   kunit test :)
> * Add unit tests
> * Add some missing #[inline]s
> V10:
> * Correct issue with iomem error path
>   We previously called raw_vunmap() if we got an iomem allocation, but
>   raw_vunmap() was written such that it assumed all allocations were sysm=
em
>   allocations. Fix this by just making raw_vunmap() accept a iosys_map.
> V11:
> * Use Alexandre's clever solution to remove the macros we were using for
>   maintaining two different VMap types.
> * Change the order of items in Object<T> to ensure that sgt_res is always
>   dropped before obj.

I am not sure this is enough to solve the double-free issue - although my G=
EM
knowledge is lacking, so please take this with a grain of salt.

Take an object where we called `sg_table`, so the SGT has been created.

When the object is dropped by DRM, `free_callback` is first called. It
calls `drm_gem_shmem_release`, which frees the SGT.

Then, the `Drop` implementation of `Object` is called, and `sgt_res` is
dropped... which attempts to free the SGT again.

I haven't tested that and rely only on a quick look at the code and my
partial understanding, but the correct fix appears to be to clearing
`sgt_res` in `free_callback`.

> * Fix typo in Object.raw_vmap()
>
>  rust/kernel/drm/gem/shmem.rs | 355 +++++++++++++++++++++++++++++++++++
>  1 file changed, 355 insertions(+)
>
> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index a477312c8a09b..b96de8d33141d 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -26,6 +26,11 @@
>          from_err_ptr,
>          to_result, //
>      },
> +    io::{
> +        Io,
> +        IoCapable,
> +        IoKnownSize, //
> +    },
>      prelude::*,
>      scatterlist,
>      types::{
> @@ -35,6 +40,11 @@
>  };
>  use core::{
>      cell::UnsafeCell,
> +    ffi::c_void,
> +    mem::{
> +        self,
> +        MaybeUninit, //
> +    },
>      ops::{
>          Deref,
>          DerefMut, //
> @@ -45,6 +55,7 @@
>      },
>  };
>  use gem::{
> +    BaseObject,
>      BaseObjectPrivate,
>      DriverObject,
>      IntoGEMObject, //
> @@ -289,6 +300,84 @@ pub fn owned_sg_table(&self, dev: &device::Device<Bo=
und>) -> Result<SGTable<T>>
>          // `Some(Devres<SGTableMap<T>>)`.
>          Ok(SGTable(self.into()))
>      }
> +
> +    /// Attempt to create a vmap from the gem object, and confirm the si=
ze of said vmap.
> +    fn raw_vmap(&self, min_size: usize) -> Result<*mut c_void> {
> +        if self.size() < min_size {
> +            return Err(ENOSPC);
> +        }
> +
> +        let mut map: MaybeUninit<bindings::iosys_map> =3D MaybeUninit::u=
ninit();
> +
> +        // SAFETY: drm_gem_shmem_vmap can be called with the DMA reserva=
tion lock held
> +        to_result(unsafe {
> +            // TODO: see top of file
> +            bindings::dma_resv_lock(self.raw_dma_resv(), ptr::null_mut()=
);
> +            let ret =3D bindings::drm_gem_shmem_vmap_locked(self.as_raw_=
shmem(), map.as_mut_ptr());
> +            bindings::dma_resv_unlock(self.raw_dma_resv());
> +            ret
> +        })?;
> +
> +        // SAFETY: The call to drm_gem_shmem_vmap_locked succeeded above=
, so we are guaranteed that
> +        // map is properly initialized.
> +        let map =3D unsafe { map.assume_init() };

With the DMA reservation guard I suggested in the previous patch, this
can become

    let map =3D {
        let mut map: MaybeUninit<bindings::iosys_map> =3D MaybeUninit::unin=
it();
        let _dma_resv =3D DmaResvGuard::new(self);

        // SAFETY: drm_gem_shmem_vmap can be called with the DMA reservatio=
n lock held
        to_result(unsafe {
            bindings::drm_gem_shmem_vmap_locked(self.as_raw_shmem(), map.as=
_mut_ptr())
        })?;

        // SAFETY: The call to drm_gem_shmem_vmap_locked succeeded above, s=
o we are guaranteed that
        // map is properly initialized.
        unsafe { map.assume_init() }
    };

> +
> +        // XXX: We don't currently support iomem allocations
> +        if map.is_iomem {
> +            // SAFETY:
> +            // - The vmap operation above succeeded, guaranteeing that `=
map` points to a valid
> +            //   memory mapping.
> +            // - We checked that this is an iomem allocation, making it =
safe to read vaddr_iomem
> +            unsafe { self.raw_vunmap(map) };
> +
> +            Err(ENOTSUPP)
> +        } else {
> +            // SAFETY: We checked that this is not an iomem allocation, =
making it safe to read vaddr
> +            Ok(unsafe { map.__bindgen_anon_1.vaddr })
> +        }
> +    }
> +
> +    /// Unmap a vmap from the gem object.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - The caller promises that `map` is a valid vmap on this gem obj=
ect.
> +    /// - The caller promises that the memory pointed to by map will no =
longer be accesed through
> +    ///   this instance.
> +    unsafe fn raw_vunmap(&self, mut map: bindings::iosys_map) {
> +        let resv =3D self.raw_dma_resv();
> +
> +        // SAFETY:
> +        // - This function is safe to call with the DMA reservation lock=
 held
> +        // - Our `ARef` is proof that the underlying gem object here is =
initialized and thus safe to
> +        //   dereference.
> +        unsafe {
> +            // TODO: see top of file
> +            bindings::dma_resv_lock(resv, ptr::null_mut());
> +            bindings::drm_gem_shmem_vunmap_locked(self.as_raw_shmem(), &=
mut map);
> +            bindings::dma_resv_unlock(resv);
> +        }
> +    }
> +
> +    /// Creates and returns a virtual kernel memory mapping for this obj=
ect.
> +    #[inline]
> +    pub fn vmap<const SIZE: usize>(&self) -> Result<VMapRef<'_, T, SIZE>=
> {
> +        Ok(VMap {
> +            // INVARIANT: `raw_vmap()` checks that the gem object is at =
least as large as `SIZE`.
> +            addr: self.raw_vmap(SIZE)?,
> +            owner: self,
> +        })
> +    }
> +
> +    /// Creates and returns an owned reference to a virtual kernel memor=
y mapping for this object.
> +    #[inline]
> +    pub fn owned_vmap<const SIZE: usize>(&self) -> Result<VMapOwned<T, S=
IZE>> {
> +        Ok(VMap {
> +            // INVARIANT: `raw_vmap()` checks that the gem object is at =
least as large as `SIZE`.
> +            addr: self.raw_vmap(SIZE)?,
> +            owner: self.into(),
> +        })
> +    }

You can factor out some of the code into a generic private method:

    fn make_vmap<R, const SIZE: usize>(&self, owner: R) -> Result<VMap<T, R=
, SIZE>>
    where
        R: Deref<Target =3D Object<T>>,
    {
        Ok(VMap {
            // INVARIANT: `raw_vmap()` checks that the gem object is at lea=
st as large as `SIZE`.
            addr: self.raw_vmap(SIZE)?,
            owner,
        })
    }

    /// Creates and returns a virtual kernel memory mapping for this object=
.
    #[inline]
    pub fn vmap<const SIZE: usize>(&self) -> Result<VMapRef<'_, T, SIZE>> {
        self.make_vmap(self)
    }

    /// Creates and returns an owned reference to a virtual kernel memory m=
apping for this object.
    #[inline]
    pub fn owned_vmap<const SIZE: usize>(&self) -> Result<VMapOwned<T, SIZE=
>> {
        self.make_vmap(self.into())
    }

It doesn't result in less LoCs, but reduces duplication and removes one
`INVARIANT` statement.

