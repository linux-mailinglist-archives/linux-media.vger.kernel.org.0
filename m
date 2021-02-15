Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3813331B8CC
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 13:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhBOMLQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 07:11:16 -0500
Received: from mail-bn8nam11on2045.outbound.protection.outlook.com ([40.107.236.45]:54462
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229738AbhBOMLP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 07:11:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d451ugoTJKWIfVM+OL/xKpBU8cuC1vRtIOP8cfxcPex1He0w70fUCXSSvF5Bd57tdVX5duESPd7OjeaRuMnbP/KNqca7I87d9SfLV/QXivJqyBqUujySkLpG+BUcYJYVpOT2+srlO2vO6Tr4cMGwZRvCtdW8FI2yzKat9RKNPjCMUoNJ9xBD3ypW8UdtAGJ4WhTmPtGxvlv8kmuOok92Q55hQMlrtPNhjDefpy7s/gFYIhBe8gRzZ6ngkWpwl9j0+0hVxNfxmiysYhkt6sciI+Mj4t9KuLtdwW9ALOM4xdFT93vMh4avVFOCRxrcJJ4up4K1H8ZQH/YUH7MQqHf59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQRgbhmFdA7RPj4GwlHs/L351IfylaAsY7zg/BQogmQ=;
 b=hproz+3Zlz0HX73oMQCStnT9BwOaFtKaKjE4Kn2gcd3kDQaRTcn5dFas5gdxzkZtq5zWrkyO6cNn21TFQAfLm4ammCEBndo4Ky4XKyUXe+guCjd1EcazBaG04sQnqQMc7MKImYbnuJM43X9V/oSD3KGTyWrs2211LkSitkH2YvHVpNUBgCbT7G7j40ILYIG0pdjg2DSsXiBSbz5zFOLnorlHjfjv3vMcsnraZCZRUVlI5GhpJbU4lqmjQV5usvw+GgfaVCntKtlGklSulPDE70zZ3Kn9w9qBV7mrZzpE9V9JLYCHAQ12xfrxowQArcxxodL527Z0jqxSyXzoHpIW3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQRgbhmFdA7RPj4GwlHs/L351IfylaAsY7zg/BQogmQ=;
 b=Y+pJQM2OxIiDUiGK6o2RG5fqgxKJmqexZPNqZGPEnMgwSdt0au3/ZUctLyNx/8MrRsC+MGXKlUgs5TBr5lsaPxzztgRBn1g0JMd0UIsD6Rux/hwQVssDi5u8pNgUUYYxFQ87kXLEJS5396jJoxkJEtza89YpP4sZuEJXc0a3TSs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4336.namprd12.prod.outlook.com (2603:10b6:208:1df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 15 Feb
 2021 12:10:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.038; Mon, 15 Feb 2021
 12:10:19 +0000
Subject: Re: DMA-buf and uncached system memory
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org, lkml <linux-kernel@vger.kernel.org>
Cc:     "Sharma, Shashank" <Shashank.Sharma@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <e6897f92-4c61-cd42-2822-43c50a744d4c@suse.de>
 <302e06ad-f979-dc77-5d84-fa0923aa4632@suse.de>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <80c42ce0-6df1-71ab-81ec-e46cc56840ba@amd.com>
Date:   Mon, 15 Feb 2021 13:10:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <302e06ad-f979-dc77-5d84-fa0923aa4632@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3e90:5494:cc4a:73e5]
X-ClientProxiedBy: FR2P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3e90:5494:cc4a:73e5] (2a02:908:1252:fb60:3e90:5494:cc4a:73e5) by FR2P281CA0035.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.11 via Frontend Transport; Mon, 15 Feb 2021 12:10:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7174aca6-b803-43eb-3187-08d8d1aaa96c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4336:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43369DE3146253E70EE3A47A83889@MN2PR12MB4336.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L3ekg0GQQ/LKr8mvNw2aXxQohA3zhUvVuoX+jGaOnMcMU3b7bjDBfPCzwSRofOidtxSBe8TYfFEoZxUfLHr2EQD//A/DW8ZTCvsmbZ/GFtNKXX13yphIbER6D9Bknst7FRhoQs21NrVOeEB7oYyb/DgKQzxjaZiPm7kbbmDH5rjHNpE4Wh6WhTdjgD+HAsLKv4XLeVzMp8BWsFlFEiSdYpXE+b74Bmg2fVIvfh4RTDgTUkdFpKbPtv4eEJI+hK5uNwNpjcQ0WCRpGJcTBPCKE70OqYfCHYY8EFzW5BOXg1STBssymBmhRLMxnLA6WCwSHPUCnZCJ7RX+9qsq+JgHRKtoSFwMRx9GDXC3qYuf6uBnk01XxRHS4Z59CV3t3OJvjGRoh+3GqcMcJqT7nGA1juomDF45RijJTHiyEwuT7rTtxmnM/BlFe0hC4+3CfqOw7FJ6NR6DCyi+5bzbUJN7Ei+5V6L8LFjcb4Zi8BTInyRxXelVjHKCwnzCk8IYMEiYs2mzEAvaxtY40K8vLp1xNL8IEiLqBnjryHhzdJWIX6oEfVTYAVyF48hRdK5i+twFHtvwQbVt0RMOUbE/wLBhwR+t1PLrRYk5MMAoCufI7xr2vWH2CD2KGfRufObEpeg4dyHICgNUAufcCB+3xLSvCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(110136005)(83380400001)(316002)(66476007)(66946007)(66556008)(2616005)(52116002)(86362001)(8936002)(36756003)(31696002)(6486002)(31686004)(5660300002)(478600001)(4326008)(66574015)(6666004)(186003)(16526019)(2906002)(966005)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eFpTRVZ6VU9mR0UzcXpqZEI1NGhteWN3RnRHc2o5bHh5Q1M3cDJUYVB0ZzNK?=
 =?utf-8?B?QzJtZFJ3N1E4S0F5YVJVTGt2NFkxYUd5ODZ5Q3ZXbm9EQTFtdElxQ3dvSmZR?=
 =?utf-8?B?N01Xa0FnaVNjUWFBYmMraFRzd1lIUTQvKzlRYTNLbStSNUl4M1dZM1ZWTXdG?=
 =?utf-8?B?YW0zaXdqUEdOckpYbFU4SUhYVWgzbjF5RGd1UUVjaS9Xam01c0ZFY0tzdnRK?=
 =?utf-8?B?dWFTckppWnZlZnhGaThhV2Fta1VIUWlPa01oL29Uaisyc09oUGNKUXhTZ2Nr?=
 =?utf-8?B?RTVaTmpFWFA1L1F1WEF2YzM0b2NjWDFrbmFRNlJxRTM5SnRRWm9lSHp0eUxr?=
 =?utf-8?B?ZFNoYllDTGVheGNwa2ZJNDAxZnVUQmxVWFp2MmVJb0N3R1VwNUFnQm0zY05p?=
 =?utf-8?B?UkdPd3ROanhobUVCcDBqdWVoOWFTR24zbVFKSHBFVUY2eVhwRjZnNnhyVlU1?=
 =?utf-8?B?Y2NSbVlQd2phUmdDVG95ZjZ4d1MvZlJtOWZ5TWNUZEp2eHhFSG9kODd3LzdB?=
 =?utf-8?B?ZDJQTUFadm51U2k4bHRHNVBDTGxRbXI4SXJEWHJ4dzRGd1lrWFE4NGQ4QUp6?=
 =?utf-8?B?c3dQRjZ0V3FDemdOU2FUd2g4ZEp6NE9lZitwMWZMRjIxN0h3VTkrMlMySzZ3?=
 =?utf-8?B?b25DWUlEek9FMFNBVm5zUDNBUmJkdE5YNXd5MjVueVN6V2x2L283bk5IdzZO?=
 =?utf-8?B?UW0xSkp0SEhyczNoS1VFTlZTNi9sVGJBelBJdXV2akp3K085SWp5SjRMdUsy?=
 =?utf-8?B?Z1FYSHhjdWF0R1A0bWRlUUR0SXd6MXJOb2FETjlWdUc1eFpkdlF3Y1dOWHdB?=
 =?utf-8?B?cERVWnA2bkVNdHI0ZWlzNGZsYVROSnF2cVhueDdVQWpWUVdXNzMrNTk4Unly?=
 =?utf-8?B?amFPRGk4d3lUY3gwTXJkdmVubkZHYjJLajRFbk9vTi9YZlFvKzk1ZGV5djRN?=
 =?utf-8?B?YkRJS0xNaFMzVDl1b0xFRGc5d25xbXgzSExxRlNyUngrQVBTN0FtZTIzR1VT?=
 =?utf-8?B?Zk9iaDVZMWtpVVJWdXUrRDJBWGVzWnhlZVZHaVNtNm56QmdNTFhVMnM1Z1Zv?=
 =?utf-8?B?dk05T00rWjZmT0d0cDR0bENGWWllWHVPL3k0S0FzbVdPYUNIVDFUWmZ1NExn?=
 =?utf-8?B?SWs2Y0hMM2tYRVBVUGhaRXZVTlhoTC92d1BGL002b3VNdS93RkdlM0NoS25j?=
 =?utf-8?B?Vmk3cUZ2V2I4ZjhqVWZka202dHdjVktRUEErZ2w4cHZ6MUpiaHV0MGs2cXBs?=
 =?utf-8?B?cjV0SjVzakYxOW4vekRiOWMyb0xHenlOa0tIRWVTZmxLS0lwRWJmNTBvT0NJ?=
 =?utf-8?B?blZwUlpkRUhCdEZXSXhaMTJwU1pIN3NpV0g3c1ltbS9RV1RqSWVFNjl1aDhq?=
 =?utf-8?B?Q1RES1UxdWRKQ1Yybk96aGtDdWg3MGttSWtZZjF6emVhM3hYQnllR2pRckN4?=
 =?utf-8?B?NWlZUHdHYTlnaG9DM3Qxd0VSOHJzNzFXdFFoWVY1YVRES3V1b01zdllBNG80?=
 =?utf-8?B?cmF5WVd2bXM2ZFVudi83T0hOWjlXelh3ZEszWVVnMTdVbTF3elFCeC9jeXFZ?=
 =?utf-8?B?M25DNk5GdlJvT1hYTHZxL1RqZmRCQ3cxVWpxMkFCS2IrVmpETUdkYitRQTds?=
 =?utf-8?B?RUZ2WWk2aW0wblBUR1MvWXM2NXlTN25UcEVsMmk2d1Z1bVFaRnRlazVrRHJL?=
 =?utf-8?B?VnYrQTJRNFBUTTNxVlhTa25PSlJCdXA3TUlnaTB1MTVTTFlLeTlSRFBKRWdj?=
 =?utf-8?B?TC9WTXBHUUNGWExhUCt4M0RhcURjUDBNNlR5dUMyRzJDZW9BSkVGblBMa3oz?=
 =?utf-8?B?Ym1EV1RySVlCdWN2Njl3VGtwTVhjUWlNZzgvZjNwd2ttQ05MbERqOU1QWTNC?=
 =?utf-8?Q?DenRz48PduoMD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7174aca6-b803-43eb-3187-08d8d1aaa96c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 12:10:19.1240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SH+3EjADKYNE7CmJnXGaLfR2pq1I024x/AqPTAHuN4Pqpg5TIYTbCf7DknIryaic
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4336
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 15.02.21 um 13:00 schrieb Thomas Zimmermann:
> Hi
>
> Am 15.02.21 um 10:49 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 15.02.21 um 09:58 schrieb Christian König:
>>> Hi guys,
>>>
>>> we are currently working an Freesync and direct scan out from system 
>>> memory on AMD APUs in A+A laptops.
>>>
>>> On problem we stumbled over is that our display hardware needs to 
>>> scan out from uncached system memory and we currently don't have a 
>>> way to communicate that through DMA-buf.
>
> Re-reading this paragrah, it sounds more as if you want to let the 
> exporter know where to move the buffer. Is this another case of the 
> missing-pin-flag problem?

No, your original interpretation was correct. Maybe my writing is a bit 
unspecific.

The real underlying issue is that our display hardware has a problem 
with latency when accessing system memory.

So the question is if that also applies to for example Intel hardware or 
other devices as well or if it is just something AMD specific?

Regards,
Christian.

>
> Best regards
> Thomas
>
>>>
>>> For our specific use case at hand we are going to implement 
>>> something driver specific, but the question is should we have 
>>> something more generic for this?
>>
>> For vmap operations, we return the address as struct dma_buf_map, 
>> which contains additional information about the memory buffer. In 
>> vram helpers, we have the interface drm_gem_vram_offset() that 
>> returns the offset of the GPU device memory.
>>
>> Would it be feasible to combine both concepts into a dma-buf 
>> interface that returns the device-memory offset plus the additional 
>> caching flag?
>>
>> There'd be a structure and a getter function returning the structure.
>>
>> struct dma_buf_offset {
>>      bool cached;
>>      u64 address;
>> };
>>
>> // return offset in *off
>> int dma_buf_offset(struct dma_buf *buf, struct dma_buf_off *off);
>>
>> Whatever settings are returned by dma_buf_offset() are valid while 
>> the dma_buf is pinned.
>>
>> Best regards
>> Thomas
>>
>>>
>>> After all the system memory access pattern is a PCIe extension and 
>>> as such something generic.
>>>
>>> Regards,
>>> Christian.
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>

