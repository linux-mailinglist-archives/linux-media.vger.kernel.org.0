Return-Path: <linux-media+bounces-8343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23539894BC6
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 08:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E5EC1F22DC0
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 06:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250F32CCD7;
	Tue,  2 Apr 2024 06:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="obh08nam"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2134.outbound.protection.outlook.com [40.107.255.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF481D6AA;
	Tue,  2 Apr 2024 06:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712040557; cv=fail; b=Dv2+0da1Guzx0aDc4ar62JaqpV0ZhBg76xnd0oI+kgqWyRktYGGpRw5Fl6fy5ZL+08/anwsd/8EtlIeLd0qK+8Bcp/kpl/n9ToDyOFPhQc0kSADzkDjzk9KNdV/1f7GCoa/f2nxfjm6I9sT7JACqMkAFyvGKJ3CFGdOY+BEg8fQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712040557; c=relaxed/simple;
	bh=DaIyXyCUtv5h1lPf36WbqcnZ/Gw0gbirsdS+o1OPEfk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rf/m4eR+Hynjo22l5GwUuRCduLqGsPqLdHSXAIsdeQrnWsnu55/NAFk1Z/OYfP0zeIF4jsp8Hygs7Z5LpZgvDZglcbt3A69k9MM6McafNAdbYogyiOQmuV4PBXcFlZj3LEbjv5b1slCzoK30MZd6FOf7K8TktnU6NT+wkhfLGtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=obh08nam; arc=fail smtp.client-ip=40.107.255.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvOt5MKKynq9YA6fV84J3c6Wm0W1RpLuR+mN7+iPNQrUBcr7+h5UiPa4XcQNHC4L5FnN9qSkA4nQCyL9Ay5RHCDUoQsqk0puHygHb+u1syb6Z5d9aeE7IBkEUD723tN5i7I/xY51ut9mJbIiLoVXlHgEEXAryqwQE3Tv1Y/0n1ZKxkiwYnDVx7v2YZJHeD1m5oZcUeUQeem/PdghbQmys0SSNhM8s/aIKsGWVg4T6+gNlzji1wpsp4RZcLgoq/T77OvprZGdKXgDaldI1yPJ0wJd9lR0lBtmEYkis7bZ6rQzbhXNg/kbvmRAIg1WXvu4ejd1WfLpGMewHHScfuvtCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZB4CjZECDohEvB3rdQL2kHj1nkaVzQZAK5Byd6oZ2t8=;
 b=EN9jzT+YbWIrflgvzURmdQBGWCVE6kk12JdK+x7cWVc8t0+dsk0kqPK/4FJmobAXqaY1+YPHzRC2XqZa2DD9UIWqPi6SMzz/L2aL3rsvy+qH99bnL3CishtiHfSQADIe7NHuRPGR+gN+A8pKjMAesyfuImuhodokwX1uCokwYYH0Ccw+Km2dRJ+OFFzUpSyq1b/nXAcEU/L6Lp1UfkL/LEnOhCk7PD4v98SH1nm13dd+VIwcHGz+C6245JQyiH5QTp6EoPqO1BYlNEo7TxJq4Kldd6u45n/ZXlVtCoxocBpY1OsAMs+kf6MJdIpNWGnO5TDOvx2lfjiwH6hVpZnvYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZB4CjZECDohEvB3rdQL2kHj1nkaVzQZAK5Byd6oZ2t8=;
 b=obh08namAGsHY6eDzQwG8r06alpXAeP9kYV/8JisE4DOHwA28162ZvBZ6b1zuSmRMAgWczTMj1exVBNCVECUYLC4xbjvCgaTkLwNMGSsxBzfd2ljVg/32rqYdjzRVWkuty8NNaHSLSPE4C3i1Ub2j4tlwcixbkxXQJUZ9qPtno0jKuYUiaBtGvX6jx8Tcht7/Z9nwsRMFomINe4pFlwFeNjsdNAl6QsXLYG8GGWTz4dtZuLcbmHowBo2PhAIpNcwHiBhC+c+BSyxGn90rVBspxgEMt0mKxdYx/3AucqvHOqKn7E3aN9KqOxdpqGzkZwwk914oObHW70aCV6DyFWcUA==
Received: from JH0PR06MB6849.apcprd06.prod.outlook.com (2603:1096:990:47::12)
 by SEZPR06MB5365.apcprd06.prod.outlook.com (2603:1096:101:7d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 06:49:11 +0000
Received: from JH0PR06MB6849.apcprd06.prod.outlook.com
 ([fe80::ed24:a6cd:d489:c5ed]) by JH0PR06MB6849.apcprd06.prod.outlook.com
 ([fe80::ed24:a6cd:d489:c5ed%2]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 06:49:10 +0000
Message-ID: <cc7defae-60c1-4cc8-aee5-475d4460e574@vivo.com>
Date: Tue, 2 Apr 2024 14:49:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240327022903.776-1-justinjiang@vivo.com>
 <5cf29162-a29d-4af7-b68e-aac5c862d20e@amd.com>
From: zhiguojiang <justinjiang@vivo.com>
In-Reply-To: <5cf29162-a29d-4af7-b68e-aac5c862d20e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0203.apcprd04.prod.outlook.com
 (2603:1096:4:187::22) To JH0PR06MB6849.apcprd06.prod.outlook.com
 (2603:1096:990:47::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR06MB6849:EE_|SEZPR06MB5365:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dh3VPhUdF4Xqh1uxCWbdIh6Pf2XKgryacWtdfGpR5mIAwzToqMG8T0hso8qUXlbLnho1c9GkCqC4yEs0lTMZO9661K+DH+4ShWVOh4YdudluVmRiJjcTxiFWPaNVjlGRjY7m9Q1A7DqLp/tzu6WYgFQA5fAyK742zZ1iDXx1JxNW8b81bvr0gFfs6A3HdNjpS29SKaKJSriEJKKzYh/bxFiuwLRnKU50DgKUs1grGqPP2satcPO1bXGtsT53OiffheetwwmGaaIDDne2Yd5fkbsCRTACKCBjTm69hCkJg3KMkZ4AXrxFu3qPImnKNmAzMzf8wrrhMzu/uejDgcQ5by3xzTvSLA8yB37/kh+nuMNAHM/2us0NLCuDkRAlIEdP/GOecIsp1oiKryRqZVQdvo6gu1aKyvsgXw/5LyedQWKPrbhGkVrQ69A4G/EGpH+TGADzzZh25vyneMgO7A5yLdC3v97bE6RQ2Wi/Ylvb1AF4SRGNRaRi/WcJ4/17f/0IRtVl8DT4rQyqk7jRzD7K0nydmmOxlPtvtCCi1i8b5kzYE5Chc4spPh20FthU9NR+FrvsLbf4Fv65ni/Ellrd6+h00Vm1WbNIcI8RbkjJb53o1JH35PIM5ab7P85LV7BNcMkeLZ4dQL1tx1svk2j9ABO7z+IQjv/baEkVtTupsywmrb2/DQT20SYs1/ZtAFOGkDfwSLG5hsH1jvljosOkCIEL6X1xQyCqTL+84y6Y2cfK/HCmCkRM8iNxkMqOKEB2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR06MB6849.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(376005)(1800799015)(366007)(38350700005)(43062008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkZkL0ZidnNtaHNiR1BMMzFLYTUwa3BtZnNKRnB2eUU4OEtZdjRSVDFqMktI?=
 =?utf-8?B?dUtGRWw1eGpRZHZIS0w2UGZLMXlQa3VncXV2RDJleG9Ob09xSjBHeUtBQldN?=
 =?utf-8?B?WFZCNnE5dWxaenA1S3MvT3dkOVRTSTQ3WmJUSFU5VmZRNkJkZ081aUV1dGd4?=
 =?utf-8?B?OStKbkdzZkYzWTJoSVhqcE96WWZKc3dodHJPbmhCYjdWa1ZYdmRpMlQyUU5q?=
 =?utf-8?B?YysrYUdQZGdCL0xleXNlT0xkUkJhRHVzQWN6WkZmSksxc2RNOVU3YkhSVUMw?=
 =?utf-8?B?WjExcHJCeHgwNnFzQm9BRm15Z2c1V3FpVmJ5ZWhYWU1XMklUUmdJQWZ4YUM0?=
 =?utf-8?B?a1JrL212cm9iaU9sYmRodEVpNGw2TVhTUzRPVmFnc2dqN3NQamtURHVSeHdW?=
 =?utf-8?B?YmFtVTN6bGIyNDdDNmpmazN2WWYrV3pGS0tHT2pjc0dHRjdMdUxubDVXd3hs?=
 =?utf-8?B?MUZPQ05HZE16MVFiYXdzNEJXcnljUVQ2N1E1ck1PU1FULzE4NmprMnh5cHNq?=
 =?utf-8?B?cVgwOVREWVNvZ2YxUlA3SXh4aHVwaHpxekdCbWlzbmZPOC9GVXBpRFVSMCtJ?=
 =?utf-8?B?TzZBQXRRQUFGRnRXNnppRithTllaQmxVRDVTQW5NdkhGMXlrUldpSmdjbUgz?=
 =?utf-8?B?ZXE4ODM1NTBTQy82ckZ2MTJvSDBFcHJRNWRTQkYyc0NXVFp6Nyt4U1UrbXpt?=
 =?utf-8?B?WUd1MnZmVWNNdWJwVlQ2RFVVTm4rR1BLeGV1SHlra0k4c0Z5S1JDN29PcVlj?=
 =?utf-8?B?Z1NHZ1JkREZhcjVqNkNrbXZ0YXcvZjFjNDFMTHJKTm5JYmhmOE5tYlhBd1hl?=
 =?utf-8?B?dXpSQWRqT1Q3WVBYS0p4aUNYaWtodGFxWkw1TGNPc3dkK29hMW5ybXRJUHZn?=
 =?utf-8?B?ZTZjbDU5WkpMTnNLT0Yya3MwSkZvd2lCSHJTUGQ0Z0htcERuaGl2Zis0LzZu?=
 =?utf-8?B?SC90MzVOSkhJRzhmWFprTTlDWmxhVUN0NDcwbG9xYXkweGhIUXdFYkRFMEN2?=
 =?utf-8?B?UUVVSHBVci9uc0YxMUlMbjhScEpNVWorU001Z3FXdGI0eW52ZmN1YjVVQktm?=
 =?utf-8?B?WlhBTFlYejByR1JjQUpqeXhOWCszeDBUeHVRNlQvVU44OUJtZjVESVpHaS9h?=
 =?utf-8?B?eUNEVTlsZFNYS0VtVUUvcisyc1lzeFZ1dEo5NUFYcHJlL3hQSHdBZldFdUdV?=
 =?utf-8?B?V0N1SkZyM01mYXdmdlBMR2o2RlB4SVg2N0ErZUFJelR4YmRJbGM4RkcwUHBl?=
 =?utf-8?B?MHk1d1R4NVhhbUI5NTJqY3hLaXZFTjRiU0Z3NHVYbzZrMHVtS1RpOCsrVnJH?=
 =?utf-8?B?VFQycmVPa1llSGtjaGpPVVA0ZTlzeE45ODFHNzVmWjE3OHlpdUJHc3JYSHBR?=
 =?utf-8?B?TEk5VFFhK2JuTjU5SjdvaUU4cTY1RnNuWUFOTFZmUnNMOHpHSEFHZERXRnNK?=
 =?utf-8?B?VGZiRkh6dnFHbDU3VFpzRXpqT2RrOFdXWUZETXMvVVoxeldpL0pmRHpsWW55?=
 =?utf-8?B?STN4b3R1Z3crZEFPREo0UWJtZVoyYXE5OTdiTjBFZk5tdEZDcFFneXZIMEpq?=
 =?utf-8?B?c2VFZWphY1VmYjEzK1BCTVZlc0ViM3Yya0xlYThlWjEyZlV3U2NiYytFNTFM?=
 =?utf-8?B?M01jT3p1QzJBWmk4bU83QjVtdy9zdU0vWWJreXJqQ1VCYkx6Z09idDVFQ0pr?=
 =?utf-8?B?Z3ZOSEVuUmFuWVJZUDVOR3dnRUZRSG9PVk8zZlJNM01KOVFGb0MxSnBtTjF3?=
 =?utf-8?B?MktjMXRFS0I2L3dZa3JmWklPeExEZVpXTk9TOExmM3loYnltVEUvRWxCMS85?=
 =?utf-8?B?VHpIMHRCTHo5cHZaL3JSR0RRbUI3RkRxdDQra3JhTlBrY21LeVJEYnlNVmNX?=
 =?utf-8?B?U0lSUGFraGl5K1JsTC8wUFV3ZmhCNUxOVzBES25nUDFxdHJhc202N1YxRWpI?=
 =?utf-8?B?ejI1Z3hhNHJ1OSsvdkYrMTR0YVVIVGF6dFZES1ZaaVRsRmhqMW0wYlpoZjFR?=
 =?utf-8?B?eVU3anlzMnFYaU1JVHFBbzM0OXVOWk14b2pvZ0dTUSszNWFtejdlYUJZYzFa?=
 =?utf-8?B?SVNBcW5zK0c0UDdMdytEVnIyQy84bXBXcGl5SStEY1VnMHliT3VHTTlzYmhx?=
 =?utf-8?Q?dWMrJytSTlMDnjuTAkDbWCAM5?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f4a8cb-e1e6-485b-d98f-08dc52e1006b
X-MS-Exchange-CrossTenant-AuthSource: JH0PR06MB6849.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 06:49:10.9089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNma3lpOpF+W4MoNXaVzP+mnbulXBvCnOVAlY/Ouv0azA1bHG2UyKVChPxC/BvSSgD3vdzsPp9naLc81bTWJYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5365

> As far as I can see that's not because of the DMA-buf code, but 
> because you are somehow using this interface incorrectly.
>
> When dma_buf_poll() is called it is mandatory for the caller to hold a 
> reference to the file descriptor on which the poll operation is executed.
>
> So adding code like "if (!file_count(file))" in the beginning of 
> dma_buf_poll() is certainly broken.
>
> My best guess is that you have some unbalanced 
> dma_buf_get()/dma_buf_put() somewhere instead.
>
>
Hi Christian,

The kernel dma_buf_poll() code shound not cause system crashes due to 
the user mode usage logical issues ?

Thanks


在 2024/4/1 20:22, Christian König 写道:
> Am 27.03.24 um 03:29 schrieb Zhiguo Jiang:
>> The issue is a UAF issue of dmabuf file fd. Throght debugging, we found
>> that the dmabuf file fd is added to the epoll event listener list, and
>> when it is released, it is not removed from the epoll list, which leads
>> to the UAF(Use-After-Free) issue.
>
> As far as I can see that's not because of the DMA-buf code, but 
> because you are somehow using this interface incorrectly.
>
> When dma_buf_poll() is called it is mandatory for the caller to hold a 
> reference to the file descriptor on which the poll operation is executed.
>
> So adding code like "if (!file_count(file))" in the beginning of 
> dma_buf_poll() is certainly broken.
>
> My best guess is that you have some unbalanced 
> dma_buf_get()/dma_buf_put() somewhere instead.
>
> Regards,
> Christian.
>
>>
>> The UAF issue can be solved by checking dmabuf file->f_count value and
>> skipping the poll operation for the closed dmabuf file in the
>> dma_buf_poll(). We have tested this solved patch multiple times and
>> have not reproduced the uaf issue.
>>
>> crash dump:
>> list_del corruption, ffffff8a6f143a90->next is LIST_POISON1
>> (dead000000000100)
>> ------------[ cut here ]------------
>> kernel BUG at lib/list_debug.c:55!
>> Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
>> pc : __list_del_entry_valid+0x98/0xd4
>> lr : __list_del_entry_valid+0x98/0xd4
>> sp : ffffffc01d413d00
>> x29: ffffffc01d413d00 x28: 00000000000000c0 x27: 0000000000000020
>> x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000080007
>> x23: ffffff8b22e5dcc0 x22: ffffff88a6be12d0 x21: ffffff8b22e572b0
>> x20: ffffff80254ed0a0 x19: ffffff8a6f143a00 x18: ffffffda5efed3c0
>> x17: 6165642820314e4f x16: 53494f505f545349 x15: 4c20736920747865
>> x14: 6e3e2d3039613334 x13: 2930303130303030 x12: 0000000000000018
>> x11: ffffff8b6c188000 x10: 00000000ffffffff x9 : 6c8413a194897b00
>> x8 : 6c8413a194897b00 x7 : 74707572726f6320 x6 : 6c65645f7473696c
>> x5 : ffffff8b6c3b2a3e x4 : ffffff8b6c3b2a40 x3 : ffff103000001005
>> x2 : 0000000000000001 x1 : 00000000000000c0 x0 : 000000000000004e
>> Call trace:
>>   __list_del_entry_valid+0x98/0xd4
>>   dma_buf_file_release+0x48/0x90
>>   __fput+0xf4/0x280
>>   ____fput+0x10/0x20
>>   task_work_run+0xcc/0xf4
>>   do_notify_resume+0x2a0/0x33c
>>   el0_svc+0x5c/0xa4
>>   el0t_64_sync_handler+0x68/0xb4
>>   el0t_64_sync+0x1a0/0x1a4
>> Code: d0006fe0 912c5000 f2fbd5a2 94231a01 (d4210000)
>> ---[ end trace 0000000000000000 ]---
>> Kernel panic - not syncing: Oops - BUG: Fatal exception
>> SMP: stopping secondary CPUs
>>
>> Signed-off-by: Zhiguo Jiang <justinjiang@vivo.com>
>> ---
>>   drivers/dma-buf/dma-buf.c | 28 ++++++++++++++++++++++++----
>>   1 file changed, 24 insertions(+), 4 deletions(-)
>>   mode change 100644 => 100755 drivers/dma-buf/dma-buf.c
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 8fe5aa67b167..e469dd9288cc
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -240,6 +240,10 @@ static __poll_t dma_buf_poll(struct file *file, 
>> poll_table *poll)
>>       struct dma_resv *resv;
>>       __poll_t events;
>>   +    /* Check if the file exists */
>> +    if (!file_count(file))
>> +        return EPOLLERR;
>> +
>>       dmabuf = file->private_data;
>>       if (!dmabuf || !dmabuf->resv)
>>           return EPOLLERR;
>> @@ -266,8 +270,15 @@ static __poll_t dma_buf_poll(struct file *file, 
>> poll_table *poll)
>>           spin_unlock_irq(&dmabuf->poll.lock);
>>             if (events & EPOLLOUT) {
>> -            /* Paired with fput in dma_buf_poll_cb */
>> -            get_file(dmabuf->file);
>> +            /*
>> +             * Paired with fput in dma_buf_poll_cb,
>> +             * Skip poll for the closed file.
>> +             */
>> +            if (!get_file_rcu(&dmabuf->file)) {
>> +                events &= ~EPOLLOUT;
>> +                dcb->active = 0;
>> +                goto clear_out_event;
>> +            }
>>                 if (!dma_buf_poll_add_cb(resv, true, dcb))
>>                   /* No callback queued, wake up any other waiters */
>> @@ -277,6 +288,7 @@ static __poll_t dma_buf_poll(struct file *file, 
>> poll_table *poll)
>>           }
>>       }
>>   +clear_out_event:
>>       if (events & EPOLLIN) {
>>           struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_in;
>>   @@ -289,8 +301,15 @@ static __poll_t dma_buf_poll(struct file 
>> *file, poll_table *poll)
>>           spin_unlock_irq(&dmabuf->poll.lock);
>>             if (events & EPOLLIN) {
>> -            /* Paired with fput in dma_buf_poll_cb */
>> -            get_file(dmabuf->file);
>> +            /*
>> +             * Paired with fput in dma_buf_poll_cb,
>> +             * Skip poll for the closed file.
>> +             */
>> +            if (!get_file_rcu(&dmabuf->file)) {
>> +                events &= ~EPOLLIN;
>> +                dcb->active = 0;
>> +                goto clear_in_event;
>> +            }
>>                 if (!dma_buf_poll_add_cb(resv, false, dcb))
>>                   /* No callback queued, wake up any other waiters */
>> @@ -300,6 +319,7 @@ static __poll_t dma_buf_poll(struct file *file, 
>> poll_table *poll)
>>           }
>>       }
>>   +clear_in_event:
>>       dma_resv_unlock(resv);
>>       return events;
>>   }
>


