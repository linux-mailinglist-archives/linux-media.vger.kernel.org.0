Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5D0309E57
	for <lists+linux-media@lfdr.de>; Sun, 31 Jan 2021 20:47:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231418AbhAaTqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Jan 2021 14:46:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbhAaThD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Jan 2021 14:37:03 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam08on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8d::61f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBEFAC061220;
        Sun, 31 Jan 2021 09:54:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFNifsgP+djBlMV5ai2FepfWXdDFNHbZKJHSq+DWj3r98cZl3rz5uY/romVJMq7BKTqiHnF9HR5B/qUtavXgyUJ7yGgEzRe2dHOgBJ/Rms0fJaDEzF2NH39kQpF+VK5MTopQQVNDWgSkfyNJowipx/NAroL9OziEAWo83G3SNBZzESN/xyQvVbaRfp2Wd7hUFZj4O4xrhcJceuYUZogf+NM/ebmxBKRAWlbOben5TEZQNMtx4ogXIHZTAoLNxe+zJrVROzdTNTv0QRmphxnGXhYd+nQIqzyQjRSNqDRK5oPdIxLUSmrC/Hzgx6GFWg/nPz/7OOYY/H4w9LcQTyLzbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNQVbBYv/+xW1ahOMYeSDDnRf20eEm8aexPlXXMNbLo=;
 b=RFh2eTTcQ71KbfFG72tGBrSy08FacrFypRMSY6iLK8VCdHuoYx76IL9OncLqHmqT0W2sf0Zoyp8ZS+6i5rWQ2KIK4idyryro6brYyBnIGkcDtQ9qFi257XGpJQtPE21BM4Fbdkio6HSsuZW/MFFhxcgbTft6/NCiRFFI/mEcfyMt0+1poMXfpaFtiTCKS+MhJw6zRKhVvKrA/6kjr6VyohhRyetTc7oD7Z6966FMvjMPC0mSGJvi9tvwczQHWReWrmM8EtYEUZbwZ+2PJf8uwGoSp4tdvrzAROfSDDHlnyNEdXaXFqaRPFunkI3dd4C+NrHKwigmf5puG6MdA525iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNQVbBYv/+xW1ahOMYeSDDnRf20eEm8aexPlXXMNbLo=;
 b=a+21mEGmPirs9SNRZdvEYzqdd+cXGmFYggFbOZh5stnGyi7wDh60x8qx2+rqzcK+/Gfq9Q3DOc4fc134ZTuC8qzRzGqnCSDQPcMx5ApWfaNmXGeW4Kbgx+zKNlcgVDc8d85AsacK46nyfcslaNeTqP+iErf1haw3OqLA4WbnTFM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.23; Sun, 31 Jan
 2021 17:54:03 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3805.024; Sun, 31 Jan 2021
 17:54:03 +0000
Subject: Re: [PATCH 08/29] dma-buf: Avoid comma separated statements
To:     Joe Perches <joe@perches.com>, Jiri Kosina <trivial@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <cover.1598331148.git.joe@perches.com>
 <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
 <a87b95d11c22d997ebc423bba71cabef15ca0bac.camel@perches.com>
 <4d5891b7-ea87-974e-d260-f78c3af326bc@amd.com>
 <004fa2c0c74bb26d6144198552c8bae33a57be2e.camel@perches.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <cc136d2e-687f-3b82-ae67-8206bd3a860f@amd.com>
Date:   Sun, 31 Jan 2021 18:53:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <004fa2c0c74bb26d6144198552c8bae33a57be2e.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0902CA0021.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM4PR0902CA0021.eurprd09.prod.outlook.com (2603:10a6:200:9b::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Sun, 31 Jan 2021 17:54:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2627e0b2-306d-4538-c157-08d8c61131f4
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-Microsoft-Antispam-PRVS: <MN2PR12MB367851EE41F6CC5DDAA3770783B79@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d3C5IW+/Xn6ciC7tTebSRlBnBQgV5JnmR3ANw7NPx9MZTCBL/GqUtNFN4+XEUk78Cw9zqmzdcCLK7abMZ24DkoM5ml+KvehFg9cIAm8hxoBZ5PnWCpI+k/HcNGVKH6yzx/bu/BRg4XOPYRQV8KrKgy54n6o9mWikLvA7BJu/8HJJbSbVbEa5CKmYlWFPPgGoBuwcpgI5nAg87g5wXwZ9nmpC3pd8s209zsE8mCXJgJs/phjROX0xO21Ia05uBDjRNTJEJAaGoWzQycoglHp+4h3r/NaHxpbEFDeoteTdue11as/m8o8yPP4u9FWI6Z5qtVhrPFgHN8vPZ/Xg9AOdbSERkaLiN2vb+Nbw1nERBqAhcys9ZMG97w+NFnpWlYYkza/eeNz4BfTatfqEisR1gPkKtSDW3rkQVKd+/+hCRvfewsWUEndEzjeQOeeOQYOlttFlIo7xuO7aJt/deq4Lk3K9sVIquBKPcpo3KXKinAibBxm4lhpXhFRlfQRS6sD4U8ES4TqYfSsSyThb8J0m9FjKgJjMifEefWZ62bhGfrI7F5XYCIdaVnyDXW4RSGlZrA+KtBAkXhHuvgfzfr4H+nrOHmJD9vAyGjbQqaiZ8pE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(376002)(366004)(346002)(5660300002)(6666004)(66946007)(66476007)(66556008)(16526019)(316002)(110136005)(83380400001)(186003)(2616005)(52116002)(86362001)(31696002)(4326008)(478600001)(8936002)(8676002)(31686004)(36756003)(6486002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QVVva1ZoekJmUkdldmhVUEROQ3I2VFJpQjhYaVp6T0tXTS9mbVVzYlhuaU5n?=
 =?utf-8?B?dFhwUGxKYVNoVWtMdm1oaXBHNERLRi8vdlg3ZTA3ZS9WaTBGQzB0R1R2M0lt?=
 =?utf-8?B?WEc2TzZxbnBnaTBadlhpM2hZOTFNSWt0ZkQwY3RlbTQwdENlWDNjVmF5aVJI?=
 =?utf-8?B?SXRSWFBzaWdYN3hiQXFhaG1RSThneVlUSzR5eWFVNUY4N1VCZUpPTTU3UWZn?=
 =?utf-8?B?STBUNXZ4SUhlbkc0TzVYK3kyVVhST202YStwaG4vQW1TSTNyMUdlaVJYR1Ez?=
 =?utf-8?B?S1ozNjlGVmYwbERVOE9oMEJDRlFEcGxseVd1S0tXOEU5dTBYYVVDVlBrUGh6?=
 =?utf-8?B?SWgxSmxTNFNTRzBCcENxM3BLVEF6QmtmemlEZ2o0TDFGR1JBZ2MwdWpyb2pr?=
 =?utf-8?B?Q2UrRXYreFFMR3IrTzNGTFpkRnpmZ0F0NkYrNE9CR1VRK1VvUDBjdWxIbTJ2?=
 =?utf-8?B?ODBRZDUxeG5zaEo3Sk1LT1JvZmhsaHFEQXdqSGMrRFVNVStMSE1WTmt0MW1y?=
 =?utf-8?B?V2dyTTl2YWZzT3BPdnhLd0dRNUk4K3lnK2luaFZjb1VtanE5SkZuQ1VTNGtt?=
 =?utf-8?B?UGhyRmNNM0xNR2RpREN6alJKV1g3RUNiWlg3N0FxcG5sRldlMHNDTllGSnpn?=
 =?utf-8?B?bFp4ZWpjTjhkd3pOWGVqQi91RjMyNnJIZHptRk9CbUsrckIyT0hxdDhWSHht?=
 =?utf-8?B?dGZmTWkzQlB3MGtVMk50bVBIdjZyMFpvSUZteWI1NlpLMUliOG1pQ0JoVmRF?=
 =?utf-8?B?SVZpK1dFYlhLRXpvckRaNGlQUkEzQmhUakIyMjdRRG9veEFwS09XTFczcnFT?=
 =?utf-8?B?ZllCNkx6V0NoVjloem5SSUFqbGphQ1dKRk15ak13WHo5UHRldmkzZVF6V1p4?=
 =?utf-8?B?ZG05QWpGRkZCWkhJVFVDaHZXc3JXNjg2SUJPQ2xxZ1g2VjdiTDUzUXh0Sisv?=
 =?utf-8?B?Q3RqS3c4dUxNN1JUSjBpQTFDVFRpNzAwdEZoMW5LY0RUVDlJTjNqVFlUZG4x?=
 =?utf-8?B?TGZhclorNVJONUlKNHdZbnR1NXRDMldWTDRnZEgzMGZwdWtFYzlQZnlIWERS?=
 =?utf-8?B?THRoQUhSS2RWdEN0djlQa3AvdGJuZ092WllZVVNHb1VFcnVkU2V5NVB1KzE0?=
 =?utf-8?B?T0lNVVhPZS8rdkFSY2trNlp6K3FrelZvYTVWL1pSNWFQYWlXd205dEpLQ011?=
 =?utf-8?B?aUV0Kzh2dURpQVpUN0tGeXpWclB6S3R5WDRXdDNiTWxMWHZ4NHdzS09yV041?=
 =?utf-8?B?WUU0SkFabE1SK1JCUEVqYXdvVVdGSEQ0UnB1SUNOT0V6UktTMU1rL3crejl0?=
 =?utf-8?B?elJ6d1U2Szk4bnpDdGlKOXpuNUdpeDdjNVFNcDFmYWQ4UXhTb0dxOFFSdlZP?=
 =?utf-8?B?RlZGeUF2MnozWmxrTDU2bktHRGM1V0dPOUhlY1NyQXpDQU0ySlc3WFVxSm44?=
 =?utf-8?B?eU1zdkpyMlh1ZGRSYXlMdUVpT2JVZndlSjh1L0dQbFNjWU5CTFRGWFd3WG0z?=
 =?utf-8?Q?BnvDsZTf5JozZ6qHk7y1SYa0Hjo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2627e0b2-306d-4538-c157-08d8c61131f4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2021 17:54:02.9501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4pmBHcin/s9CK/O6Y9IXSOk6K6ydcRju6L/5PvDevM2lABZqlx4mxhmo+JEEI8O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3678
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 31.01.21 um 18:39 schrieb Joe Perches:
> On Wed, 2021-02-03 at 14:26 +0100, Christian König wrote:
>> Am 30.01.21 um 19:47 schrieb Joe Perches:
>>> On Mon, 2020-08-24 at 21:56 -0700, Joe Perches wrote:
>>>> Use semicolons and braces.
>>> Ping?
>>>> Signed-off-by: Joe Perches <joe@perches.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Do you have commit rights to drm-misc-next?
> No.

Pushed.

Thanks for the help,
Christian.

>
>>>> ---
>>>>    drivers/dma-buf/st-dma-fence.c | 7 +++++--
>>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
>>>> index e593064341c8..c8a12d7ad71a 100644
>>>> --- a/drivers/dma-buf/st-dma-fence.c
>>>> +++ b/drivers/dma-buf/st-dma-fence.c
>>>> @@ -471,8 +471,11 @@ static int thread_signal_callback(void *arg)
>>>>    			dma_fence_signal(f1);
>>>>
>>>>    		smp_store_mb(cb.seen, false);
>>>> -		if (!f2 || dma_fence_add_callback(f2, &cb.cb, simple_callback))
>>>> -			miss++, cb.seen = true;
>>>> +		if (!f2 ||
>>>> +		    dma_fence_add_callback(f2, &cb.cb, simple_callback)) {
>>>> +			miss++;
>>>> +			cb.seen = true;
>>>> +		}
>>>>
>>>>    		if (!t->before)
>>>>    			dma_fence_signal(f1);
>

