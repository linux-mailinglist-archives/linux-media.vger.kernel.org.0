Return-Path: <linux-media+bounces-59517-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAX5BXVQ62nkKwAAu9opvQ
	(envelope-from <linux-media+bounces-59517-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 13:13:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7565245D8D6
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 13:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D5E9301F98A
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 11:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAD73A0B3F;
	Fri, 24 Apr 2026 11:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P9s0neYe"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011071.outbound.protection.outlook.com [40.107.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021103A1A29;
	Fri, 24 Apr 2026 11:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777028910; cv=fail; b=OcFbaoUc8a4QJNQAZA3738vDibt/yNPuoWOm6jI2A7A90yfV/q7QyBAgNOO3BpP6rz0U00NRZosm2kL2BxM4epJPoofGm/w88joW6iqnqgz0w3uBGWuAfoNAhHQUzZcQu6TkGVJKY3BLyK75detPzwuJJ7j+FN5Yl3LpsgGbzYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777028910; c=relaxed/simple;
	bh=Opt2jrobcfl/i8iSjvLCu2zvTn37XzuNzOqyDN79cD0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=TQuIdlWNCQ4thFFN1i6D5L87tbs0Hupo9DlHoorbnDcv0nSiZ0DliA+3eg7v73pOfhJv9+7d3GoNzZJpZttUoxn5n9iQLn/tvP5xcym96vBna2HUqtTlaJEkEDzonmJkXixENL33WwhA1vB2zqTAlTugSM9PBO2QxrfqlMW95MA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P9s0neYe; arc=fail smtp.client-ip=40.107.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Shol3vST34R+dEdLDawEvKHnO5UB6S1SOsxFQFSSDwwTBC1opLIBNmf2XwNb/+ydmj+xVzQ52MaqB6mAJKaj5MKiDLMTVdn9xv1B0gHoeuuIRCLJKHm4RDMae/1SZ5l6wIWxaKnT1HkRVBvVFQ2Fmb7naaQNC5OKApscBi7nNh4X4BnuwGUY5vWpICVk7q2jw7FW8uZq2zjyzXPAG2NbREVWxNXf30pKqrb1ZVmzTi6Yo4bc8USm1+oFeQ/NtpBqqQzUDgjA47E1IRBVSmjQpPMDDwE4z2JBgMFxiwsk3wZeAZ/Zeb2PlliKGnoflyMIT9MIYGRs/8sOC6xctrhuWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K36Ffc9F0lpx7myXKpmNybkudGjiINR377bgkLt/T88=;
 b=Zy2IZWL/u86WrCq6+CGWh0uhPEc06H0FJFOwZXd7ZzS5xsINDWXLphsd/yxvZ0owj2m/HS81Bomi/wEijitRERWVsn4RY4ZlHtPvBMBWxK/CUqcG7YYuJb3pYfQHHj6aMuIj1JBnplRyvPu4EuLmfMOv5hUXFjqOCi+PbOOB/A8Y8cRJUCFMqbxalgjvaZtwRgFeliQ2g1DC/h54bZRcPYiMnXgZaQqgtvCPIJeKrA1KrtzS925wQV3yRS6W06JPDaKDkCmtL/M62XTJ0QGNdNR5z6iK+7NF67vvhP9g+hGQBjCqx5XOvkfIuZROL83oop0HxwFQDTfVFRyn+Dw9Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K36Ffc9F0lpx7myXKpmNybkudGjiINR377bgkLt/T88=;
 b=P9s0neYeEzmoUaxkBggurxq32HUb7hIQgGxQo1UeKke/HydlNFyi/Uxpfcrk4wuKKnw+yQJJp3+hpaGBsbEyLJ4VUUM2Epi5SpsFbknEBebPGi68M5mAxLGYqcNU+T3VLpGKiAlUviB7nLJe75phM8d3wZGOivZvV2tPI/+tU684TNFvhqq87U25gozP5z8kfgwlHJb9Y0RxVjC7Zmm0c1RwL9DHyDr0UPrABkJZyJyFu0/mZJRC00Qhy6piHJoNR1ycSY5stKFP2GJpuZRMyN2gucgfFCsbJKfVnlkscDSdrKUUAK9nhl3djlJX5FR/0tviw5GN44WmUEb4lN5fuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9282.namprd12.prod.outlook.com (2603:10b6:610:1cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:08:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 11:08:18 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 20:08:14 +0900
Message-Id: <DI1C648G6OWI.20O3JB8VS59PB@nvidia.com>
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
Subject: Re: [PATCH v12 4/5] rust: drm: gem: Introduce shmem::SGTable
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Lyude Paul" <lyude@redhat.com>
Content-Transfer-Encoding: quoted-printable
References: <20260421235346.672794-1-lyude@redhat.com>
 <20260421235346.672794-5-lyude@redhat.com>
In-Reply-To: <20260421235346.672794-5-lyude@redhat.com>
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
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9282:EE_
X-MS-Office365-Filtering-Correlation-Id: e675cd7a-7d0a-4f71-4405-08dea1f1ca0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	feWlpK3714K1cebvzp2GiGvupPs0nuy6J2r47h/50M47G1YZgxr6XftNN8RkUi9NN4rmJrrORp29q52YVUhxQDBCeuJMj45y4ZslNiluTRVd4wjc1Ggd+zPSyuLnYT4tSBOJzAiQZdI1S/5CpEqXN9A2nYC+/yATldmEYFkmk0yD1FFFa2SmNNTxxmGF0vDpkXL+J7i2jksaqLBR6cjptuiLpW2J088sT2EgV3TbH0dARplu/bDi/NHe3aWkxXNQNaVh1HzUHSwfgGUslFOUhf6UUp/HmwRVuvS5ahJWFQJdlYR2DA+MxPOuxqcCWGf4coB+gUJ5OlGW9MvRks74b6m2p8X48fYBYE8G8VRN8YCRl0ahE9pGBTqHwrN5OU7TDNI3qf3ETlorA9XPpakKHgzFYIB9++4heDpq/DiVEtpsoBVxkTh+Y2ZkvDcUIiwNr3zYTUM3LIMATlOfAG16Wg3TbImMwpKZh6DzC60nnfKaCnxnslokEzcUXL1izOMOmPWHhaTkOyLq69bvHA+SGaUE3R8YHKN6yN2LG+ChDTm7E3GggSJw10+FdLkfBXpNn1PkA2P08M1x0S1nlS8NqZCkhMwZeEUtZ1IUAqK7zmfaOuhcnXHKNIFm26ZzxvqK+eJ697eqfn03uMcjaUCGgPJBPc794yayy8Q6GjylVsT0caRjO8TV3hkC5I4veiVffcKzoHpLVPD0RARkxNXXyi8KbkmaUPVo9x9r4ayvW9g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDZNT00rN0VnUGthUis2em5pK3ViSDNxZHJrYmY2WkdsWWd1NUh0bFJsbjdS?=
 =?utf-8?B?K25mbW1yZGhCZmJYemxydU8xdk1WdE9QaFBDNndBdDVkMng0bXhtMFNaLzZB?=
 =?utf-8?B?SlhlQ0k1Y0hKMzV3WXJ2WFh2VDhBZDZSTitxdHhLa3dBV01LY0tiYlZoL25i?=
 =?utf-8?B?OVRBdlZOcGRFbWcxZmtFRVVMZmJDSS9tVkNneGVSR0FRcURhNGt4cmY2S0lq?=
 =?utf-8?B?SmZQYXRmNFl0TTB2dlVoU3pMTE50bGpLOUhKalZKait6VFJPdEh4UCsyUGp5?=
 =?utf-8?B?T3UzNFVLTjR2OEp0UXdxL1FlT2hMcTArV2JqSi90RkVSSE0yMFIzakZHbWZG?=
 =?utf-8?B?V0dtL21kcTkvV3puRFA3WlJLTkFSVFpRMHpXNC9KeE8rSzFpQWEzSHNwcGth?=
 =?utf-8?B?TW50OEpHMEJqUmNrb2tmbmVEV2lxMWt2ZGdrOUUrWTRvcWh1emEydjVEbXBS?=
 =?utf-8?B?NGdMQmhicEplL1ZDMUlqdzhwMVpuY3dRRXhkMFlPbkVCTHBnQVNjRG5idlY5?=
 =?utf-8?B?VHZ4blVNZUU0SVFncHZrUWR4ancvQ0VDL3R2b3I1b0t1OWJ5ck0veEJGR3pj?=
 =?utf-8?B?S0o5SURzd0dJdEZ3THk1Q2V4L2x4VXpkdENQeDFVaVg0TDlRaTNjMXhlL3Nu?=
 =?utf-8?B?WXZxNHVVYndkK0MvMzZmQ05DcDU5TU15QXZtclU5bDRxLzBCZ2YxVXVCYnIw?=
 =?utf-8?B?c1h1cFRDbWkwWHdsUXd6ZmdlSUYyL3RnY29weFI5RnIxL3BTSUlGUlFpYldO?=
 =?utf-8?B?V3dCOW9KNk94VTR5QjJ5aTJzcUhncnZVdFJHbkZwbTJPMC94Z1E2RlBVNzVQ?=
 =?utf-8?B?Kzd4Z3hJYVhrZ3BHTXVSQnhYODZoR1g0dkJDK3BRdFF5YW01Skk0alBqa0dY?=
 =?utf-8?B?NjQvT3Z1c0hwbDZ4WUR2ZWdVb0ZXTTNZTkF4NlJCNlVWc0pvYTFuS3hhZmpG?=
 =?utf-8?B?amluY3BmUnZMZzNoNnpLMWRsd3JKdmN3aE8zWEtsRWdlVWRVSVhZMTVUSDNF?=
 =?utf-8?B?Y1VFRldOUGppeWxOU3d3aWFPcnBTYWNXRnRiT29SbExBZ2llUytETTNtU0hX?=
 =?utf-8?B?SmVtUk5QQlJDTFpNbGdpYUxQbHpQZ2tZNDlvTUdsc1VVYzFkS0h2WklZRkZz?=
 =?utf-8?B?RW4wekxRSS9RTHBpLzFWZVg5RWx5ZmpjSzVtcklYS1A2LzZvMVg3TkFNdDRH?=
 =?utf-8?B?bVVHQVNOR0VFMTl6L2Z4NzR3K1A0VkZrblgxUkJ5R21wKzNpcXd2OElJL21Y?=
 =?utf-8?B?aFRIeThGTkpGRVhBVnRpTGpHM1dobFlEYkRZekl6SjlxVE9xNURKNzRac2RE?=
 =?utf-8?B?ZVovQVl1VnJtN01NL2UwSFhqNUM0WFJBMWRVNlF6VGtzUEVqcW5EbkRmdGt6?=
 =?utf-8?B?dUFiRnhhaTZCQkEvMjV3UE9MTldZeXV4a0ZnZmozR1RpcUN4djE3cDBDbnFV?=
 =?utf-8?B?NGRHU1BmN2J4ZFpnWVVqVWFmWk5wSGRMZ1U3U0U0T2EvUE81V2hjdWpJS1BC?=
 =?utf-8?B?aG42VVZqSlpFNnFVSmQ5bkV6VWQzS3RvV3FVamVoZ01SaVN0bThLcGdvaW50?=
 =?utf-8?B?Qm9INkRlY082c21KRnJLQVBHNHV5dU9TMCtXd1VidDJuK1J6ZkFOUW14T2JT?=
 =?utf-8?B?ZWppOC9raGRmTDRCcmE2d2lBSURBVUlzU09UWlQvMFVXYUFFM01sSVU3Q2pp?=
 =?utf-8?B?T0Qvam9aNWlYNUc4aHBHeHRQOTEyZWlRQlpHZDdvODAzMW9SNERSTFlSUFZn?=
 =?utf-8?B?TUcwcVgyaEtJMmVWTWI2VUVxNXFTc0ErODB4NnhRR0hsc0FxOHl1eVNJc0dI?=
 =?utf-8?B?ek55eFprZVppSzVZbHlFYWVDcmVaR1ZvYkFqNG1temxMWWdOeEVxenUwTUxQ?=
 =?utf-8?B?N0ZmRmxmZEVzcHBjMjVycU8rOCsvd29wd0V0VlVMLzNDVEx0WWxsU3FRTE4w?=
 =?utf-8?B?T2paMS95SWdqQmhYTmZ5VFhTQ1lYVE03VTRQSmVaTGxsSWEyRDQ0Q051ZFA2?=
 =?utf-8?B?SlNQcmJBWFZjZm1MdkRxQkVFeERvbkw5ak5oV2M3Vm1Mdi9uZVpjaE9VTW95?=
 =?utf-8?B?UzI1c2IzUXhYZmpNbHdkbzVSbWozUnpzSnc4UEpFSi9UT1M0ZzZIWFIrMjlm?=
 =?utf-8?B?SmYxK1dDMndTTGNLcHlTYXpIQkRJT1pGVFd5ZGpuUUdycTZvamUzQmJ0UHph?=
 =?utf-8?B?TFAwQ0U3WURIREdVeW41ZXRYdExyNWhHMVhYNlVVVjhZSFZVdFQybytKWndJ?=
 =?utf-8?B?L25vV2dHM2RnWlptTHphUzZQSUYxNWVudVZxbXVEUnJBcWVjeW1Nc2ttSDcz?=
 =?utf-8?B?RlAybVVHdStLeHdxc3gyc29jSG9ManlDdEFIS2tjQ3ZPRnVrbHQxaXNYN0ZB?=
 =?utf-8?Q?7GRzuUc0NRRx3dw/tjAjR2FSPXJnMvi6qICvKhx1mgIcL?=
X-MS-Exchange-AntiSpam-MessageData-1: jMZ/CdcRFRb9JQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e675cd7a-7d0a-4f71-4405-08dea1f1ca0a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:08:18.7454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5m6wCKcLXukrMsADgpYwL6CWTpqtG/VIiv+9nR1fC6Fidl8IqZe2xnhZvj4mgHrt1ACMDvgcs3+6EGt1TLnn4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9282
X-Rspamd-Queue-Id: 7565245D8D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59517-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]

On Wed Apr 22, 2026 at 8:52 AM JST, Lyude Paul wrote:
<snip>
> @@ -176,6 +195,100 @@ extern "C" fn free_callback(obj: *mut bindings::drm=
_gem_object) {
>          // SAFETY: We're recovering the Kbox<> we created in gem_create_=
object()
>          let _ =3D unsafe { KBox::from_raw(this) };
>      }
> +
> +    // If necessary, create an SGTable for the gem object and register a=
 Devres for it to ensure
> +    // that it is unmapped on driver unbind.
> +    fn get_sg_table<'a>(
> +        &'a self,
> +        dev: &'a device::Device<Bound>,

Just noticed that the caller can technically pass a different `dev` from
the one the buffer will be mapped onto, potentially linking the `Devres`
(and thus the device mapping) to a completely unrelated lifetime.

I.e. `dev` is only used to create the `Devres`, while
`drm_gem_shmem_get_pages_sgt_locked` uses the object's device pointer to
create the mapping. We need to add the check ensuring that the two point
to the same device:

    let expected =3D self.dev().as_ref().as_raw();
    if dev.as_raw() !=3D expected {
        return Err(EINVAL);
    }

Ideally we could do without the `dev` argument altogether, but that's
our only guarantee that the device is bound, so I don't think we can do
without this runtime check.

I think it's also worth mentioning in the documentations of `sg_table`
and `owned_sg_table` which device is expected.

