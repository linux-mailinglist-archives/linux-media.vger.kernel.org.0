Return-Path: <linux-media+bounces-66810-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oLUDM1akTGoZngEAu9opvQ
	(envelope-from <linux-media+bounces-66810-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 09:01:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 244F37183B4
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 09:01:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=windriver.com header.s=PPS06212021 header.b=UuCOvipj;
	dmarc=pass (policy=reject) header.from=windriver.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66810-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66810-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 896D83088F28
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 06:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE5A3CF026;
	Tue,  7 Jul 2026 06:55:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7226B3AEF27;
	Tue,  7 Jul 2026 06:55:23 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407327; cv=fail; b=sK7tQ8drpIhpa7jTxIMCDOkVGMcM+r3VcG4nTj9qCGb+1pFqvy67/BH+RvBrkCVuWYkJTRqS+T39laRItMh3f5dMme8tXK17CxXJwb4W50ItGQVQuNpR2aX5qZ0ALz+OwsHba/ATt1L01kiefohdnx8pPAKYKlYPN2dlTLLbQGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407327; c=relaxed/simple;
	bh=mDBbMdJJMCvtShUFUfHDGRDDl7e8UTsey4tLuT23Fd0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DFaJCTCPGBbTJFSI8bsaJJAmNi86hX5BmB6hBMVDnFsvctpV9cBH4rxtSVCAikQLOscRs1qA/1OFIlcBcSy7CNqBju+sBRZ+ZDRjjb0clUHOIDddI3kda82bTyWuXHCwr8cY/svQBraqpcho8EqPRShU5vHoBz68zv/WUVz/YEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=UuCOvipj; arc=fail smtp.client-ip=205.220.178.238
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6674m6xs649263;
	Tue, 7 Jul 2026 06:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ytuhS22cF+H5ve9faQgaPittdOfvePEdXhskFeUU2Vs=; b=
	UuCOvipjfM+6jmdKeIUbIObiojPghwZLR6BTCeOlY7r3uJ7DXCZNQUnz8xViUsiS
	eKIup2aQRR5/sPpmlUL7wlLyBZXGJDhCn6ayCwzG2/BVU/fsyQugzU2DV7jWSi9h
	O081wqbzDcApJE8aHEG1WJ86CDQgMrMWUzy5fUtWyCicdIO8FVAMtKTez/qM5fDC
	VdHMnOQNxpejq1e4z5PsK65k6usvE80RLJ0F1c2BNVnqiAQ/mDEGLsvMJN5SpQre
	acIwM8YSWFz+l1oju1R5uG2Yoi3PZeQO1TOcr9LUyvhJWmEwwK/d04jcCiWi5NUT
	9LJcKegKE6qdWJdLrXsNdw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012056.outbound.protection.outlook.com [52.101.53.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6s58bqpf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 06:55:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhqFZLHjAmtaqAdwbVFTTdLRM29wd9A0v5X1wiT5baF3uI083+KGo+ulMuXKD5qWOedefkVjY+P6+xIWy/Abc5rQuqsRgQ8LbwZw4mOGm/MsvsWQzWTOj3gHLO0Mm5xo3VF2V1nRjRQ/ANoZHQGN8dhSwsjUWGs+hzuE3s4Q8/fTeIkiZn6dmKHx81kffZ0kIUM2+6cphvf2ggtAV/o6yS/hEUdemfmS/Jb85dmajEhPCFUwH0bvNgQTo/5JJtborYA5dVSPvZ3oUZonDgcEj1Th+TEhOlfO2kKPL3ageeDoS+oRStIacj9y7sOJXjW+TjJF1HhM025pv1cpQoSqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytuhS22cF+H5ve9faQgaPittdOfvePEdXhskFeUU2Vs=;
 b=wcavjCh6RzfdAW4pKGL2uC/oXciogJJHu4JBF2NJKnQ+V6TyI4gNCnu5/lsH28s1Sq+WmBZnedm7F23pasdLRPEnpbh48cRRBKAl3lEINLPyYGyKIVAShfcw9Ikzb4se4IN+1SqO+Oqr9X+qeS4U2MpltvdmbRbzuwNLqUjPAKgNiQapO+YltpEiefwxHDyVZh4Y0nx+p6oDVc27huInjRBXcxUymFw29y83+DpXSksYbfb8aVjiQFrH1q4M01ZhZhAWDHAHHAoXB0mBiErGYhZn5hy5ehXan7s5BzR641mBK18pLkSNAxnDoxkqcXnTtHUzES3SyyC2jGBwvB6K1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB5332.namprd11.prod.outlook.com (2603:10b6:610:bf::17)
 by DS4PPF00BBED10C.namprd11.prod.outlook.com (2603:10b6:f:fc02::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 06:55:09 +0000
Received: from CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13]) by CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13%6]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 06:55:09 +0000
Message-ID: <66efd2f3-b6c3-4e6d-b1b9-5640db61ebd9@windriver.com>
Date: Tue, 7 Jul 2026 14:55:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: dvb-core: fix use-after-free in
 dvb_frontend_open()
To: mchehab@kernel.org, kees@kernel.org, linma@zju.edu.cn
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        yun.zhou@windriver.com
References: <20260610083055.3976083-1-yun.zhou@windriver.com>
Content-Language: en-US
From: "Zhou, Yun" <yun.zhou@windriver.com>
In-Reply-To: <20260610083055.3976083-1-yun.zhou@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:194::20) To CH0PR11MB5332.namprd11.prod.outlook.com
 (2603:10b6:610:bf::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5332:EE_|DS4PPF00BBED10C:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf668ca-366a-4281-810c-08dedbf4af46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|22082099003|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Az7TgxZirUfR7sMmRSK8d9Jz4DiSM8VWJrg1sHZhKvCXzVlSYjf2je2YWuCZTDvKqusyJ0B38H93MjuTj8NkduDfdjLAW94IqdJ0gPS430AIha6PlRa5xNBWYdm3rmt0Vni6LqBZKFToqfEjnpI52FPmzEBLqAQ1+3ddFoMiFRUSU0Qqrm91DlDx4sg1rJsxFoSqz4kYsDS5cP76LF2U4ZXvKgWX0Yh5MzX0ScOEzFuowbZ10XV34jvShS57xVy9M7WG8XUG28psQN5+j6/c4YJgpnqec+9+8UinRBjOdTLsDH9GhYvU2pMFqy99kXWJvpeukXdyDNX3VSeTuIWPZxAW4QeYJl8FcY5uIB1djm0s9c5SJfDZo3dd/62Rss9wBhJKvT3GneR9UDW3suXn2WOKS/tRzdqyi+91uH+I39jCKkowxZne0X79SXO+EKxvM+cgRquqfS/a6lXgWXlTaCkjYdhmls0HDnuJJiyR5MSF/qUZBYkmfzdcoQJB0nr1VtauxsCkJtv8CfmLnFuXL+U+1IcHdN+MwIC0tzujp15MKciuCYfFRHoc2csaKfEef/A2w+L55wdv97LMX+usOAsbml70hsDGFuySxHn3y6JvZqRZpzcyOqDz0+Ptlm+Y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5332.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(6133799003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVNzUXluVzB1VndaRkRnUEcvZVZFby9VWmNqckszUFdHNU83Q0lmb2pvMmo1?=
 =?utf-8?B?Qkx0ZTZpQVIweU15VWZRZnJabytXNUxNZTRqMTE3c0I3RERJSUVXblBhdXJP?=
 =?utf-8?B?cGdvTnpCVWVyWnp0bnliWisxNm1kblNTd3c5YXJnalZFajZhRG10T1RuM2dk?=
 =?utf-8?B?VC9ZS3gzNC9ScFZ4S0g5VUVzLzVIdFdvK0dSWEZGdkdXa0xoWnhoS29xVXNL?=
 =?utf-8?B?ZkpxU2hKYnZON2UwSHBFQTJSK0dBQkZ0by90ZFJtVmljVXlZUTZzNC8vMXpu?=
 =?utf-8?B?T3VIK2lhdndkaEs2OEJTNkRSa1k1N1k5T3BqSXBmaVRESTM3Y1FTUGJQVXVD?=
 =?utf-8?B?QSt2WVRwU29OSmQxVDZBRVd5eS9ldUtwcTQycEt0Y3JqN3E4R0I1NVhaa0dn?=
 =?utf-8?B?VDFhMm5uS3lFSEZ5VEduSDdYek95UW1mNEV4S3Vjc1YzSExkSzR1Zm9tS1hU?=
 =?utf-8?B?Z0xXd0RIL1k3YlZwbWhBc2RaT0ZnVjg3L3hwRVVPRDd0UnlGSzNNSjlXamVM?=
 =?utf-8?B?RFd0Nmtqd01VNTFXNFc0N25sYUF2Ujg2L2RtVWxkU0FSdkpaVFpqR0RqNGVw?=
 =?utf-8?B?VVM0c2thRG0rTzlzTG5hZUY1K1FNWkpwRWdBVXJWWFNsdkxIYVVoMERRZHhw?=
 =?utf-8?B?VzhOZmZOSGJKUjUvd3RWZWhvdWVUYituNDU5VlhWLzVmT2hWT2U4azZaN1ds?=
 =?utf-8?B?dVdKb2crUE9HZm80eHhYQXVSSGQvRlg0ZWFFMHZrT0JtNzI0Z2pyTkNBTGJu?=
 =?utf-8?B?bFpSaTF2QU5qQnFWR3hLY3FKZXpGZ1NhMHE0WWpjN01qUmxaMW0vdnZwR294?=
 =?utf-8?B?SFpWa2xveUZQWEk2bWJOc1JBeFNVOFJud0tXSEtGSTBVQU4wdG9xVnk4cHdV?=
 =?utf-8?B?ZjNzV1MvTnNmWmpiOHF4ekZYZmllUXZvNjhPdktrNkwxNEl1N3VNd0V5YXZR?=
 =?utf-8?B?VFE5RkNJN3prNkxMOElDdWNPYjY5SHNaWnM5ekpucjNhR3gvOGdqSzNwai96?=
 =?utf-8?B?TTdUMEVJNlhIdWt3OFhYNzBBa3BXb1VrNy9PanJZQkVRYmUwVnBoYWxaRW8r?=
 =?utf-8?B?T1pjREViaG1pdXBrZkhkaE9DMloxclBVSVpDb2FENGhtRjlZeGxlLzE5WHVN?=
 =?utf-8?B?cStlaitmYlZXQXcrRE96ZStQMnVoSCtEQnZ3NnkxRzVISXRGZ1Y4M2V1RHV1?=
 =?utf-8?B?elFqbzBQbFM1VStRRkZ3R3htRkU4TFVyd2F6OUNtSStLZjFVSHJWVGhCTFVl?=
 =?utf-8?B?ODE0OGtXTGt2TjV6MGQ5OEpsNlh5QStpcHM3VjZTQVByMUlCY3Jucy8zdUsx?=
 =?utf-8?B?WVU4ZXV3M0pJYm1ESDhyd2NUcWgwT1ZwM1hKVHE4Wk84NE1Cb2Rud2V3SHZJ?=
 =?utf-8?B?c1BNSU9Ic2lqeGNlSUpwT1QvTjhMK1hMNVo1NHkwR1N0N2h4M1Juc2ZpUDl4?=
 =?utf-8?B?QzlJb1FGVnQxUE85azM4Q1NadWxiWTFOZElKRGorNXViUWVBc05KTStneWVC?=
 =?utf-8?B?bmJxQmdxcERSc1F4bWN1UkgvZy9XblNUeW5rdHVwZW1hVXBqVGhhOG5aME9y?=
 =?utf-8?B?TkpVNFY0VDlGaFNtSXVqaTdHOGhvamxDZmpPMi80L1l0Tm5GREVhWTA5RXJh?=
 =?utf-8?B?eVZEUkxwZ2VJSU52cU5JSjBlYWxseGJYRWl5aEt6YTVEeWlmWFlxZXZlVkYr?=
 =?utf-8?B?M0xCTDE3R0I1UjJjVnAwZ2x0RkpUVjV3MFlkSEJybm9ZT1MwQUlqQS9Cd243?=
 =?utf-8?B?RGxlalRabXErc0VQSStwaTAyeDZsNU16WmJBVXV2eFRvMjJDU2xCb1VhWitG?=
 =?utf-8?B?eUVKSFprSm1mc0RoKzUycHZnejYwblM4eVRpWlcyc2pOOUsvdkloT3ZUQ1lx?=
 =?utf-8?B?c080WVBlZzlabXF5NElML3llcnF2OFYvMnp4ZGRQMmlJUlVjaUZIc1hrYlFY?=
 =?utf-8?B?bXMwaENaRFB4bXFNaGFSMHB4VDllS0R5aDY4UUlwRFA0b3IvVTBZNVNQS0Z1?=
 =?utf-8?B?ZnkwUFJIQVRuRDhqSTJ2RmhrQ2RvcjhVU2xkdWlEQWNCUEhXSStRaHNKTDlm?=
 =?utf-8?B?WGRuODZXR1AwSkQ4VUNSaVJxN3E1Z0k5c1hMOWRLMUdmVjFsVG93K1FMUUkz?=
 =?utf-8?B?NnNWUVpVMXVTV1gvdXE4dzArTTNwaDVwTHpiSXYyTjRXeWtERUdvRlJEcTRl?=
 =?utf-8?B?WlhMa0oza09GKy9hUnRlN2xWOW8zTkRXRWM3UXJqbXRYVjV3ZVNUb1djakg3?=
 =?utf-8?B?Y1NpQnNMSUZoRXQxbGQwRVQyUURPN3l4MmtSSUZGTnJYUURQWHY2NUcwZnhL?=
 =?utf-8?B?SzVkWGdvZzc1b1AySzk2L0MrTVA0T1ZvRDhLZWs2N2VPakRDWFFtdz09?=
X-Exchange-RoutingPolicyChecked:
	by5CO+MbOmJ18b38A6wu6tGBrUFt3n2sVWFLQSxYqsbexJybT8W6yPf3oPrM2Y58ULh0S4XcyQSqgAam4/yVh+dedLTdgLHKGIhwkIJXoIMjdP4H4C6NRWqWwnVxe8x7XHFHM0mDnvyBPSKRXVi67U1tmFJpAuucuI7uXFW66O8nDOoNMgba+tDp52AzI92MATBonOswGkkJHxOnQCTVT63jJTgnZBav6M8MpWZq8y5BHs4tUweTt614b7eDtInH40odVSLIZOvNFaxXFpTjbBcoc2v/jglM3K8hEEoCLtXuD5aKPB/MMDvPf3ctJrK3BDePsV3lBp/oZMQHy5AZ2Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf668ca-366a-4281-810c-08dedbf4af46
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5332.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 06:55:09.5965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4fRSeU/v/WL4VpxeI+GKaAMXUSAm21LkkkXGAggjSqoWbnUNyyp7e6cMRyqm8krRWKTk0koD/jXKAn8sMCmyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF00BBED10C
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NSBTYWx0ZWRfX+pzHWaYwbLzF
 +WUJsVRzJTN28sRGqUiL3+3KK89mWJJNzD2GA5dzf0RB8HX+L0S7GE9C2vnleJGtx7Ov8tw7SDR
 Eqm2dBLQvnbw/TSA5j9Dz5fteGcMtnjAq7f5tHU1TmNvK0ED0yut
X-Proofpoint-ORIG-GUID: P6Zb0562Gd_vxgK5eRRItYXOnyE0oknu
X-Proofpoint-GUID: P6Zb0562Gd_vxgK5eRRItYXOnyE0oknu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NSBTYWx0ZWRfX5qtGtRVz9y8E
 4neVT90BE02EovymtWfYXv2g3fGbn3JL0TevRmjEz9Ujvxw/hJBv+Haj4Jh4+i/2dXJ4THVhAZj
 O5ZwPZ0V3Pr0F8m/jKydOwu9gykGZOChAAMRLphWC6MeFT4dRvixebZvcqWBhs2HXo5PTE31lX6
 cqs6dYPXfcdnWkpLj3DgakGmsq+DUSvAs8dwhF9TyJm4/r35N5k9JIZHOlUUEauOoCYiCokqKC0
 IK5ycNvB5VfsIKtXKB1xez6zmGoUg5Eo5JvByXkWErY+/x1jbwOoJSvaJEsQsIRLIpg1w4H76bq
 UQYEoCk6YDk9uJXQHSW2szH+YCSdJAH25qxnq4qao/fI46GN6UuaGWGItVvGsRQVRl39ARnz2JM
 W0aABVZYTzBCFCJNQf2mW1YXpmNYBJKyA8isCpdBMLPPY/Vcy1oFccHaWm/6kcZi+h2QrHdAuB7
 o0u+VWqkyONEJHRG2Aw==
X-Authority-Analysis: v=2.4 cv=H5frBeYi c=1 sm=1 tr=0 ts=6a4ca2d0 cx=c_pps
 a=68eZn42HhoOzQwLNwT8gAw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8
 a=6GENO9LqX87v1q-aSr0A:9 a=QEXdDO2ut3YA:10 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66810-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,appspotmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,windriver.com:from_mime,windriver.com:email,windriver.com:mid,windriver.com:dkim];
	FORGED_SENDER(0.00)[yun.zhou@windriver.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:kees@kernel.org,m:linma@zju.edu.cn,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:yun.zhou@windriver.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yun.zhou@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 244F37183B4

Friendly ping

On 6/10/26 16:30, Yun Zhou wrote:
> dvb_frontend_open() calls dvb_generic_release() in its error path after
> dvb_generic_open() succeeds. dvb_generic_release() drops the device
> reference via dvb_device_put(), and then dvb_device_open() drops it again
> in its error handling, causing a use-after-free and refcount underflow.
> 
> Fix this by incrementing the refcount before dvb_generic_release() in the
> error path, so that the put inside dvb_generic_release() is balanced and
> dvb_device_open() remains the sole effective put on open failure.
> 
> Reported-by: syzbot+40339ea82afa8184ad5d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=40339ea82afa8184ad5d
> Cc: stable@vger.kernel.org
> Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
> Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
> ---
> v3:
>   - Simplify fix: increment refcount before dvb_generic_release() instead
>     of introducing __dvb_generic_release()
> 
> v2:
>   - Fix Fixes tag commit title
>   - Add Closes: link after Reported-by
>   - Cc stable@vger.kernel.org
> 
>   drivers/media/dvb-core/dvb_frontend.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
> index d082b6c57c76..608525d08277 100644
> --- a/drivers/media/dvb-core/dvb_frontend.c
> +++ b/drivers/media/dvb-core/dvb_frontend.c
> @@ -2887,6 +2887,7 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
>   	mutex_unlock(&fe->dvb->mdev_lock);
>   err2:
>   #endif
> +	dvb_device_get(dvbdev);
>   	dvb_generic_release(inode, file);
>   err1:
>   	if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl)


