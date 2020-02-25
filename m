Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 091AB16EEBB
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 20:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730174AbgBYTMB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 14:12:01 -0500
Received: from mail-mw2nam12on2054.outbound.protection.outlook.com ([40.107.244.54]:46761
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728913AbgBYTMB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 14:12:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BatMAKBtFr4SEieHwCIo9dp1aSzKIDfPDrL8u04wRmIdGAUC/ct+s5hkox6euU/lyT6+qvuqN0aESbf/KqFZUtJN4JlqUlq+UVHJz9qX+grVBkb4ga4u6JKddlNKdGOahl3m+T2uhHjtjH8YHRnE9ZjviBTi2nk8dI+lvihzZG6EC2uMYnuiCVap3I8oJ4Lhfm2kOA9X7wrRGV4GSY+ksYyZ6VmJPmolZjGt8EK8wTU5BxmcU3hcejqiPf+e6gzZyeg7dxIhQWU8zGVYRz9l4mjxqvjgXyLxb+jl6OQImlVcYOtG6pEe7kNVoYTwcB1KUbpLzHYjFOiRc1pPDfdYDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtU6v/jCEZ2hu/8tfy4y3eHBCWQByApfdOOb+N1qRA0=;
 b=U61J+t7UP/Va8W5CS5iKgzz+uV0HTs3yTGjsmkRpprl8JpAIcN82S25u9giOf3QEuy/VL3IIN3nBlTJ7ksk7H2uBnqd9o6LZZJKCq2Ez90Rk3qcpmrGZ3bNDEzdU/ImnSZkHaMN+h0TgKAOCdA0DfhG7muGdCjbUgENhbexTxplLhLlmYFORx6QUO4JccTktaxzKZe/4+DztzqCGUeZd0R9kxhj5tXWNLV8qhqoa5vHUWvXSrMJVLdA4qRdU8gRlLqDi4TcV5OlXp9YPuotO/v0T7ZCXOCC54gfbqmvSNt3tezHsUWjVM4wldaeOF7TTHNvBO9FkKWMcz9wf1vv2ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtU6v/jCEZ2hu/8tfy4y3eHBCWQByApfdOOb+N1qRA0=;
 b=1PgCMWXZpbHMAscrkrML7pp7tEkap85SSbLm5SKDzIM5Ef/iEdXQ4eZgYgx1u37/NYnHcT8Lo+6Xc7jy3jrECHQHRSe6KN6kRX/Zs1V+Crr9JZPTaw1jFmTbe/wNrBcGrwj/MUWtZjuca+uzUpnmKahq+h/ReVIof4gyFWSW5O4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1593.namprd12.prod.outlook.com (2603:10b6:4:10::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Tue, 25 Feb
 2020 19:11:58 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2750.021; Tue, 25 Feb
 2020 19:11:58 +0000
Subject: Re: [PATCH] dma-buf: Fix missing excl fence waiting
To:     "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
References: <B737F1D5-292E-4FE2-89A5-6EF72CB3EED1@amd.com>
 <7a2eb42a-2dd9-4303-3947-6bbb4de7a888@amd.com>
 <20200225172355.GO2363188@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <484ce316-55f2-b85e-a1e4-730db94f3fe3@amd.com>
Date:   Tue, 25 Feb 2020 20:11:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200225172355.GO2363188@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4PR0701CA0003.eurprd07.prod.outlook.com
 (2603:10a6:200:42::13) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM4PR0701CA0003.eurprd07.prod.outlook.com (2603:10a6:200:42::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.13 via Frontend Transport; Tue, 25 Feb 2020 19:11:55 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b69dfaa3-a790-410d-e8f1-08d7ba2695bf
X-MS-TrafficTypeDiagnostic: DM5PR12MB1593:|DM5PR12MB1593:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1593ECA93D70861682F8B59D83ED0@DM5PR12MB1593.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0324C2C0E2
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(189003)(199004)(8676002)(110136005)(316002)(16526019)(6666004)(5660300002)(186003)(478600001)(86362001)(66476007)(8936002)(2906002)(31696002)(66946007)(36756003)(52116002)(66574012)(2616005)(66556008)(81156014)(6486002)(31686004)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB1593;H:DM5PR12MB1705.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9O7QAB7YHVvHcpHVrF2a6vknygV3eGMwFSn28taGfUGHV1v9xN6NpCahLIRO8EneE83n3sDBqaUSS0+UlyGY7p28UMpnHVuT8sODqE7IRVVYKJUdMZhLlKTB10hG+qoknMN7q0wZlYaVFpBFdQR2jj5KZl/xV3a+fHzxuQCph2C8OvOBgcza/oQ4KDNFPrflIf//6dPCcsXh1L4zwnK8Zn7684a5n4fPePgf/ChV+3xZ4og6LT2I68rBz2OHbHiKiZxlAzqpM2OyvJQctcvI24ckVb6ACnxd7F8wY+Ovfqv9M7XeCz2XwMB6z08BaiexQPNfzqAFxdKQgk84aElDAqxuy4WXev/W5ERlQII0/QP5mSqn/YPAb/K+GY9bzMFSwttofbrP1XSLy7RHNAZVkDWy+jM3xnO6Zc2fHA1juUh/3lUMmdCg5nZjUaE1La0K
X-MS-Exchange-AntiSpam-MessageData: PFZpdjxEOePgsBso5/Cf7XYTOHqn8C2JT/lHpdXLwRTVWnLTs+r2AvLzKovtRXHwjGe3m2s9CXc4abfIhc3x/LbJXU9O1Una8n6/nyC14G8+9wxUDta7fY2b3wLu3TRg+61gltTrwjusvThfF5ls/7gz7PqQH2JgYcZD4jX9k1XZMOjUtu7YG6deo9cIZ103r9917Qh3ykQuQzgaQE8UxA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69dfaa3-a790-410d-e8f1-08d7ba2695bf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2020 19:11:58.2519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7j0x8XM9HYcPM6bgeimA8Q1kvFMSb7zzuaRiXLzk3Y8jDjXRL0hiWmbk2VdQLXRl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1593
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 25.02.20 um 18:23 schrieb Daniel Vetter:
> On Sun, Feb 23, 2020 at 01:04:15PM +0100, Christian König wrote:
>> Am 23.02.20 um 12:56 schrieb Pan, Xinhui:
>>> If shared fence list is not empty, even we want to test all fences, excl fence is ignored.
>>> That is abviously wrong, so fix it.
>> Yeah that is a known issue and I completely agree with you, but other
>> disagree.
>>
>> See the shared fences are meant to depend on the exclusive fence. So all
>> shared fences must finish only after the exclusive one has finished as well.
>>
>> The problem now is that for error handling this isn't necessary true. In
>> other words when a shared fence completes with an error it is perfectly
>> possible that he does this before the exclusive fence is finished.
>>
>> I'm trying to convince Daniel that this is a problem for years :)
> I thought the consensus is that reasonable gpu schedulers and gpu reset
> code should try to make really, really sure it only completes stuff in
> sequence? That's at least my take away from the syncobj timeline
> discussion, where you convinced me we shouldn't just crash&burn.
>
> I think as long as your scheduler is competent and your gpu reset tries to
> limit damage (i.e. kill offending ctx terminally, mark everything else
> that didn't complete for re-running) we should end up with everything
> completing in sequence. I guess if you do kill a lot more stuff, then
> you'd have to push these through your scheduler as dummy jobs, i.e. they
> still wait for their dependencies, but then all they do is set the
> dma_fence error and complete it. Maybe something the common scheduler
> could do.

Yes, that's exactly how we currently implement it. But I still think 
that this is not necessary the best approach :)

Anyway Xinhui's problem turned out to be deeper. We somehow add an old 
stale fence to the dma_resv object sometimes and that can result in 
quite a bunch of problems.

I'm currently trying to hunt down what's going wrong here in more detail.

Regards,
Christian.

> -Daniel
>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>>> ---
>>>    drivers/dma-buf/dma-resv.c | 9 +++++----
>>>    1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>>> index 4264e64788c4..44dc64c547c6 100644
>>> --- a/drivers/dma-buf/dma-resv.c
>>> +++ b/drivers/dma-buf/dma-resv.c
>>> @@ -632,14 +632,14 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
>>>     */
>>>    bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
>>>    {
>>> -	unsigned seq, shared_count;
>>> +	unsigned int seq, shared_count, left;
>>>    	int ret;
>>>    	rcu_read_lock();
>>>    retry:
>>>    	ret = true;
>>>    	shared_count = 0;
>>> -	seq = read_seqcount_begin(&obj->seq);
>>> +	left = seq = read_seqcount_begin(&obj->seq);
>>>    	if (test_all) {
>>>    		unsigned i;
>>> @@ -647,7 +647,7 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
>>>    		struct dma_resv_list *fobj = rcu_dereference(obj->fence);
>>>    		if (fobj)
>>> -			shared_count = fobj->shared_count;
>>> +			left = shared_count = fobj->shared_count;
>>>    		for (i = 0; i < shared_count; ++i) {
>>>    			struct dma_fence *fence = rcu_dereference(fobj->shared[i]);
>>> @@ -657,13 +657,14 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
>>>    				goto retry;
>>>    			else if (!ret)
>>>    				break;
>>> +			left--;
>>>    		}
>>>    		if (read_seqcount_retry(&obj->seq, seq))
>>>    			goto retry;
>>>    	}
>>> -	if (!shared_count) {
>>> +	if (!left) {
>>>    		struct dma_fence *fence_excl = rcu_dereference(obj->fence_excl);
>>>    		if (fence_excl) {

