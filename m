Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFECF16981F
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2020 15:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbgBWOkZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Feb 2020 09:40:25 -0500
Received: from mail-dm6nam11on2053.outbound.protection.outlook.com ([40.107.223.53]:56928
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726583AbgBWOkZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Feb 2020 09:40:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzAl4u56BICAMWBF61uoSeAu7S+3N10Z1LUPgW3fsKsfF87JOE0BpsV/aV0+PCpls15XvWWC4br4qeYEhLUrOh2lCTFJcnIIFPa8OVJ3LbkF8ldgvw0hWzudDFxxk0+8vrEUroUJpsxp1UwIQ7T2utH+HmQPdLC+CsNoTnKQEVNcur8s8MK4/vJqcivYIKPIjyeOssO99/FIjSOMpgnFH2seoxfEakgKSufToSUv9jspDviAPOpuO86RZvxKWRMT23oMRdTx99w5a+zHbvxKkS2sd0xMaiAs4iskXEgqDFhOCFnnttcq6b+5vXLJEk+VYbCa8wRBlXBply/+SgUIAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tt4zeUvrpoLx007urafcQRBjk1ILsOstr0hH//Q/6IQ=;
 b=UiLSVkfHPePrKB5Nwuc8mgC7Afx/nGzkuY5gIkwWW6KO77bPL/hg9RlIU58MBEzIrkq7/9hmb7YljHh2CvJ8PPd/UWU4tkxp44aRvFzziFDJI5ZIKxcXC56PTjQWNVi6N8gAXYGvwD1I7poC3n/huJyKNssk52UFquKG5M3ksQcL3ksIqDcCa3ZC+tyvFzqLfvhiljOFrLDWHhWbsW/hyG7zwKONBgkSIHVGzLmPHhq2Np4R5NRVuDo9D4SXN1qmDlOPjaeBh56UaWNR/B2doKu+UDGVNbp5XxB0P9UgOPK+SMFARFIQ6LceReRXhjYYjSAjxJcDU3iX8HpHAwPSsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tt4zeUvrpoLx007urafcQRBjk1ILsOstr0hH//Q/6IQ=;
 b=SYCoLMnM07wA4d3dmUdq6nIeZRfAhL3QUIyFL9XYf9Nh5XSHkQlkotAdjFf+H7hreD8ma03LBLVBAoKitKrfTvY6EEKt6ksQU/ylXRf83AEUuCF3PLkkBIh8fJNsQXWV4nCj7fblAyKhEKJ+P7eSSTiMfl2TFxZEOIZ1r/TdfN8=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1849.namprd12.prod.outlook.com (2603:10b6:3:107::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Sun, 23 Feb
 2020 14:40:20 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2750.021; Sun, 23 Feb
 2020 14:40:20 +0000
Subject: Re: [PATCH] dma-buf: Fix missing excl fence waiting
To:     "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
References: <B737F1D5-292E-4FE2-89A5-6EF72CB3EED1@amd.com>
 <7a2eb42a-2dd9-4303-3947-6bbb4de7a888@amd.com>
 <3B6ADD37-8287-4180-B99B-C747DBACC6F4@amd.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <60825044-261f-f5e9-bc86-285cd486b398@amd.com>
Date:   Sun, 23 Feb 2020 13:12:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <3B6ADD37-8287-4180-B99B-C747DBACC6F4@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: ZRAP278CA0010.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::20) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by ZRAP278CA0010.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend Transport; Sun, 23 Feb 2020 14:40:16 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f5beddf8-29e4-441b-7aa5-08d7b86e4ea6
X-MS-TrafficTypeDiagnostic: DM5PR12MB1849:|DM5PR12MB1849:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB18497701A0368523FC9058EE83EF0@DM5PR12MB1849.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0322B4EDE1
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(189003)(199004)(5660300002)(36756003)(2906002)(52116002)(31696002)(8676002)(81166006)(81156014)(6486002)(86362001)(8936002)(4326008)(66946007)(54906003)(6636002)(6862004)(37006003)(478600001)(16526019)(66556008)(316002)(2616005)(186003)(31686004)(6666004)(66476007);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB1849;H:DM5PR12MB1705.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7ZKleIF67ErvCmqm/ACUVQBV76QHFV06IU4tQ3bC72Ye4QXMgyJlw8RTIZWgZMFzoJ3z/0onOek51SA1CLxwTGqa0NShjOR1vXLHm1UBlNbIjepJbsgekuHFPpr+/87DyQnXP1qq7nRRzsftjvHzUuK4qrxhenWKzcupofnL6Z3Yu267RTQGlQL+e2IBdYt6f0vFL/zQ3Hq7TH6FANHdvXuWBq+Ajsv2k1qifAyrju4nzt1QSZlUM6hPbt8UdrodZNQ/ynbP4ojZLUbr5Ll5gMAFXmZSQ7lwl6xNLs83gae7FH4f3qq7VJ/avEvKFl0sAkUtxfZQFMZ8+qdd6+Ig0436RQunqRfCEcfGQOD3f+/XvHAOX1jN3vzEsRkk+U6RdBQk8rz0Z+l4q58n45k0I+f/6zdpcvaIh/CrmzKPqftgv1wlxO3KNwj4MTczG1x/
X-MS-Exchange-AntiSpam-MessageData: 7mNT5poByy3lGdWn37TJ0u5pu0XOlVn863P7GHaNgoEhASJmAT5cnTv1YMpHsq41+zXq52r0UjPj+S4IeQAJhYjukzjqv45LfimP+snmz1KdSwOwUl6vkV9FVrYSfXsagnAB2ZhJgLUlbBDdXPgBumxXsPA0MRdvxkypO6BfCTCtvgAOfTTKWAJ586VKnX/SJZRU2G1vkWlGzHyHtGh52w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5beddf8-29e4-441b-7aa5-08d7b86e4ea6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2020 14:40:20.4070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4R7/pcFJOEmsPlA+3XezrB5Be/CWhtTO9NRL9k0lQCdCmxDRY1KKtRcT7hsEXEk2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1849
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 23.02.20 um 13:21 schrieb Pan, Xinhui:
>
>> 2020年2月23日 20:04，Koenig, Christian <Christian.Koenig@amd.com> 写道：
>>
>> Am 23.02.20 um 12:56 schrieb Pan, Xinhui:
>>> If shared fence list is not empty, even we want to test all fences, excl fence is ignored.
>>> That is abviously wrong, so fix it.
>> Yeah that is a known issue and I completely agree with you, but other disagree.
>>
>> See the shared fences are meant to depend on the exclusive fence. So all shared fences must finish only after the exclusive one has finished as well.
> fair enough.
>
>> The problem now is that for error handling this isn't necessary true. In other words when a shared fence completes with an error it is perfectly possible that he does this before the exclusive fence is finished.
>>
>> I'm trying to convince Daniel that this is a problem for years :)
>>
> I have met problems, eviction has race with bo relase.  system memory is overwried by sDMA. the kernel is 4.19, stable one, LOL.

Ok sounds like we add some shared fence which doesn't depend on the 
exclusive one to finish. That is of course highly problematic for the 
current handling.

It might be that this happens with the TTM move fence, but I don't of 
hand know either how to prevent that.

Question at Daniel and others: Can we finally drop this assumption that 
all shared fences must finish after the exclusive one?

Thanks for pointing this out Xinhui,
Christian.

>
> amdgpu add excl fence to bo to move system memory which is done by the drm scheduler.
> after sDMA finish the moving job,  the memory might have already been released as dma_resv_test_signaled_rcu did not check excl fence.
>
> Our local customer report this issue. I took 4 days into it. sigh
>
> thanks
> xinhui
>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>>> ---
>>>   drivers/dma-buf/dma-resv.c | 9 +++++----
>>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>>> index 4264e64788c4..44dc64c547c6 100644
>>> --- a/drivers/dma-buf/dma-resv.c
>>> +++ b/drivers/dma-buf/dma-resv.c
>>> @@ -632,14 +632,14 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
>>>    */
>>>   bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
>>>   {
>>> -	unsigned seq, shared_count;
>>> +	unsigned int seq, shared_count, left;
>>>   	int ret;
>>>     	rcu_read_lock();
>>>   retry:
>>>   	ret = true;
>>>   	shared_count = 0;
>>> -	seq = read_seqcount_begin(&obj->seq);
>>> +	left = seq = read_seqcount_begin(&obj->seq);
>>>     	if (test_all) {
>>>   		unsigned i;
>>> @@ -647,7 +647,7 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
>>>   		struct dma_resv_list *fobj = rcu_dereference(obj->fence);
>>>     		if (fobj)
>>> -			shared_count = fobj->shared_count;
>>> +			left = shared_count = fobj->shared_count;
>>>     		for (i = 0; i < shared_count; ++i) {
>>>   			struct dma_fence *fence = rcu_dereference(fobj->shared[i]);
>>> @@ -657,13 +657,14 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
>>>   				goto retry;
>>>   			else if (!ret)
>>>   				break;
>>> +			left--;
>>>   		}
>>>     		if (read_seqcount_retry(&obj->seq, seq))
>>>   			goto retry;
>>>   	}
>>>   -	if (!shared_count) {
>>> +	if (!left) {
>>>   		struct dma_fence *fence_excl = rcu_dereference(obj->fence_excl);
>>>     		if (fence_excl) {

