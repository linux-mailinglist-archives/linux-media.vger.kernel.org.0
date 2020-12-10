Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1DD2D58E5
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 12:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgLJLEG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 06:04:06 -0500
Received: from mail-dm6nam12on2053.outbound.protection.outlook.com ([40.107.243.53]:44768
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725855AbgLJLDz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 06:03:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LA8TltEtvTYXqEvkkyLgBTBGtTUpG7Mv83BFpbMDBipHTU5NMgb3FfAaHa8hIAyJBAnQ5PgYBLthf8HBYVSkGvKKkOcRwQQJcMBmsi15etDbQu3c4R0oACq+D2SK/LnnZaqhllo2fTX+rbdRRGs0+nMDQ5QEKfNZokZJxeT6IWRXhWKazxgc79QwkLV7GIfkMSyS1r0wp9sbHYQ9euWgbE/ZzkmhpDaxP2aNwr2l6TrAYQZ3FMiBHCPIoLdzhnuPhIMrLsiYp+nhwSYBKo4sekcu81h4rVZ/HaXK3bs+/AP9UMUbYWI09dFMgysVkqaxhNYij/ibnrATuu7P865NGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO6hyNVQZSLQT5Got1CR7nv/Azw5iZv9aCsyzQ7Gydo=;
 b=iLpbQdve+CLcjSnPNeReQo4zohD4NLSA6j1FUdLzf6BOfjv99fXIIgvZM9F5KiXaHbsTHotwuslxLyvfm/vyIx1qQX+atJZp3k9NKT22f3EEpR/aw8R/X3NcuLEYPsNVHc81Ns7nC22wU9Uv8kPYAObnA2CnN09Kg2eoO7OOt3ECZBloLVgu/cQBmi8rvvtXio+iV9Zx4SzvurVzANfyUdynSa5uSUPXpzb8stuQwu8FKoSKGXsGw1bhCOUGbdqlSJRK7w5PaWGY1KG6D1SApaDXze2NWxPwQH4xm5i0oUZQD+BItc1M1a3Kb8JHnjIRuYXqlEnYkqMKOYF8rkweFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO6hyNVQZSLQT5Got1CR7nv/Azw5iZv9aCsyzQ7Gydo=;
 b=YAeIbk2Ek00rYir6Y+j8is3sHBuMTam8pv/d4dcP8XH9YW4abe5grFMSPyUQzCnF5+j0omaX1WqpnYNmwgIazg8mvHmiIMljz2LkMmRrzkhUlEVmXGPz/4BoQR1+x0eUnKaDh56gvMH6JmZaASyDmH1ifBN+dOSvYUZ8Wo9TWNg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:168::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 10 Dec
 2020 11:03:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.016; Thu, 10 Dec 2020
 11:03:00 +0000
Subject: Re: [PATCH] dmabuf: Add the capability to expose DMA-BUF stats in
 sysfs
To:     Greg KH <gregkh@linuxfoundation.org>, surenb@google.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org,
        Hridya Valsaraju <hridya@google.com>, kernel-team@android.com,
        linux-media@vger.kernel.org
References: <20201210044400.1080308-1-hridya@google.com>
 <b5adfe46-8615-5821-d092-2b93feed5b79@amd.com> <X9H0JREcdxDsMtLX@kroah.com>
 <20201210102727.GE401619@phenom.ffwll.local> <X9H+3AP1q39aMxeb@kroah.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f95ee5dc-62f8-4870-11e4-3513dc8382ef@amd.com>
Date:   Thu, 10 Dec 2020 12:02:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <X9H+3AP1q39aMxeb@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0P190CA0026.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0P190CA0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 11:02:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8803686b-7bea-42b1-8866-08d89cfb2883
X-MS-TrafficTypeDiagnostic: MN2PR12MB3935:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3935AE7055252664E6BF1D8483CB0@MN2PR12MB3935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iy6YInYBWHzDhI+cd6kGSwxFcxA9bB5x/GMU7JyzMIlycRNpiw8LrVRSoQxqdr8bwFuEXcgXjIysU29xFfXubZZNEjgFHZPKWq8CCX+ajPJvaAWnWaqoX0i3SES9jR/rk39s+r5vstHMkd33J3OHJduE5/bG9xr43zjtWiRfhA/YhFrq2zU4/EBQySqWkz1tUt/b5sn4MeFvAtmofi1+S3oheu0u6HCvu8PFXnm/EPlTccli4AZxZdYmSQ7b0hgLXINGxpFejeqOYnQ5+QaULUbdKxBJYttP0oQYwQnyuKZlz4mgrYOnSigzhJxGA3wnEKqU5eVTH0MKVyemmDxZHVUBgxp818LpDMle2ma7cwbq2ftzjiuidCED198O4d8yTAKRm/rQXvMLefvW8PGF0IUzcGosrBALDK4nkQy6hVA95S7+OCesfZaB14cZu9XH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(376002)(66476007)(66946007)(508600001)(66556008)(8936002)(36756003)(8676002)(5660300002)(2906002)(34490700003)(31696002)(86362001)(6666004)(83380400001)(66574015)(2616005)(16526019)(31686004)(110136005)(52116002)(6486002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R2tKZmUwUkZVYkZaR2RMWElTYXpWTnNkZDkrT3FBcGJJNmhjenY2dlFHWnI3?=
 =?utf-8?B?My8yb3R0TXErNVkrTHVpSUJLdS94YVhBNXAvS05pZjZIc1lNczM4QUI5NGcy?=
 =?utf-8?B?dVYzOVROblVOTStFWk90N2ZBMXAzb2xyK0dJZ0RlK3MxaGY3cGdoZ09NR25r?=
 =?utf-8?B?Q2N4UHEveHM4dWdTRXdielZvY1F1QW8yRFJndSs0RnlqR3VYWml1cm5ta3Rj?=
 =?utf-8?B?ZFQwS3JkdHdmNkVrVHg0emlITUp3QStWRDNxcVRtb0RvdzduYldadFRQcm14?=
 =?utf-8?B?d3ZrNXB3NkNUNEYrREx3MEQ2a09pMmFUZXRic25UNnBORUxxQ3psL3pOWExn?=
 =?utf-8?B?a3JXdVkxNmpoN05RKzQzSzRnVkRuRmdEbjF3S0d0ZnlZakxQTC9JbDh4MVJo?=
 =?utf-8?B?TFVHd3dkRDVWLzRXRm5QOVBqZjlEeGlsTVRUNXJtL054S0cxVkV6WWhrSm9l?=
 =?utf-8?B?OGZJWnJFNXNybWtHZ2h6MW1vNk9tb2JiM2NPWmZ3QUROQlM3S2RrUmxveW5n?=
 =?utf-8?B?d0dsSU5xTy9lVzZCcHFHV2NGVG8xMGxZblBPaldyV0ttL2lucHFvUDB6eity?=
 =?utf-8?B?K3BPU2s3aXlRMlVpUkV5VlcwQVl2L1JpTG5ORGE1S3dJSERORXA1OXdiUWpV?=
 =?utf-8?B?RTRtQ2c0S2F4bFY2bmk0WTM0TXd4c01iNXR5Qnh0cDF5dHEra2h4ZFBPam80?=
 =?utf-8?B?OFBMcVFBOGRWSHBEcy9qL2hrY2gvQ3JCc3E2REN3NWQ0T0ZiMWg5SHdMeXVr?=
 =?utf-8?B?Y0dDeE5IRHhkK3pMK0R5Mi96eVNEUzBaWGNPTmRqcUZoelNYZ1BQcXFOaTRN?=
 =?utf-8?B?OTZ5cTFFeWxQWklGdmg1cUtBcW9hVDlXbFYwY1RSakpFK2szcHBxRUVmTExR?=
 =?utf-8?B?U3VXaTh0dVpRMjRUbzJxM3RUTm1QNTBZYWhGbHlqcUJCNE8vcEJqT3ErVjVM?=
 =?utf-8?B?TW1CSkZwSEZLZlhSeE9kOEVPbnR3VHBIL0RSMVhrMC9iR28wb2NUQ0ltMWd4?=
 =?utf-8?B?ZDFwelY0SmtkYW1Yc2ZwanRCNXA1THFuZW5VQklBdGR4dVhPdldRZjRLZUdh?=
 =?utf-8?B?alJrRGptSWhQc0d2UlpwNFhJK0RsanRsSkxaa1ZqandDVWhNRnNwRFJpaFZG?=
 =?utf-8?B?eUVReEVjZmdLSXBhZmFaRVFNd2NQTUhQRVc4d2lYUlhMQ1hRZWRKRnZoZWpT?=
 =?utf-8?B?MXFYQlB1QUVoOHFxbEZ4R1I4bmdkQm5NSmhCclQwQVJHQit4NzV5TnZmTW5P?=
 =?utf-8?B?SFppcVQwdURsTkpBbWZERHQ2TVR2OTc4Q3h4a3Bxc20rbVhrZDduOUhoQzF5?=
 =?utf-8?B?R3hzbU0zK0l6dnpXT3l2S3BMZUwzUnNjQ3FXYVhBbStLQU5zTTNub3ArYlRJ?=
 =?utf-8?B?aHQ1bVIzai94UVJka01QL0dVSSs2WnFDNlFraFBjOGdoWE1qempZN3ZzelVN?=
 =?utf-8?Q?Q7bI3JyY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 11:03:00.2528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 8803686b-7bea-42b1-8866-08d89cfb2883
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Ht0QXVpna3dVWkd28a1neZ/QLN0iZSRnl8/1m2X3Bffl6j0y8A3PBgDh3bXraX5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 10.12.20 um 11:56 schrieb Greg KH:
> On Thu, Dec 10, 2020 at 11:27:27AM +0100, Daniel Vetter wrote:
>> On Thu, Dec 10, 2020 at 11:10:45AM +0100, Greg KH wrote:
>>> On Thu, Dec 10, 2020 at 10:58:50AM +0100, Christian König wrote:
>>>> In general a good idea, but I have a few concern/comments here.
>>>>
>>>> Am 10.12.20 um 05:43 schrieb Hridya Valsaraju:
>>>>> This patch allows statistics to be enabled for each DMA-BUF in
>>>>> sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
>>>>>
>>>>> The following stats will be exposed by the interface:
>>>>>
>>>>> /sys/kernel/dmabuf/<inode_number>/exporter_name
>>>>> /sys/kernel/dmabuf/<inode_number>/size
>>>>> /sys/kernel/dmabuf/<inode_number>/dev_map_info
>>>>>
>>>>> The inode_number is unique for each DMA-BUF and was added earlier [1]
>>>>> in order to allow userspace to track DMA-BUF usage across different
>>>>> processes.
>>>>>
>>>>> Currently, this information is exposed in
>>>>> /sys/kernel/debug/dma_buf/bufinfo.
>>>>> However, since debugfs is considered unsafe to be mounted in production,
>>>>> it is being duplicated in sysfs.
>>>> Mhm, this makes it part of the UAPI. What is the justification for this?
>>>>
>>>> In other words do we really need those debug information in a production
>>>> environment?
>>> Production environments seem to want to know who is using up memory :)
>> This only shows shared memory, so it does smell a lot like $specific_issue
>> and we're designing a narrow solution for that and then have to carry it
>> forever.
> I think the "issue" is that this was a feature from ion that people
> "missed" in the dmabuf move.  Taking away the ability to see what kind
> of allocations were being made didn't make a lot of debugging tools
> happy :(

Yeah, that is certainly a very valid concern.

> But Hridya knows more, she's been dealing with the transition for a long
> time now.
>
>> E.g. why is the list of attachments not a sysfs link? That's how we
>> usually expose struct device * pointers in sysfs to userspace, not as a
>> list of things.
> These aren't struct devices, so I don't understand the objection here.
> Where else could these go in sysfs?

Sure they are! Just take a look at an attachment:

struct dma_buf_attachment {
          struct dma_buf *dmabuf;
          struct device *dev;

This is the struct device which is importing the buffer and the patch in 
discussion is just printing the name of this device into sysfs.

>> Furthermore we don't have the exporter device covered anywhere, how is
>> that tracked? Yes Android just uses ion for all shared buffers, but that's
>> not how all of linux userspace works.
> Do we have the exporter device link in the dmabuf interface?  If so,
> great, let's use that, but for some reason I didn't think it was there.

Correct, since we don't really need a device as an exporter (it can just 
be a system heap as well) we only have a const char* as name for the 
exporter.

>> Then I guess there's the mmaps, you can fish them out of procfs. A tool
>> which collects all that information might be useful, just as demonstration
>> of how this is all supposed to be used.
> There's a script somewhere that does this today, again, Hridya knows
> more.
>
>> There's also some things to make sure we're at least having thought about
>> how other things fit in here. E.d. dma_resv attached to the dma-buf
>> matters in general a lot. It doesn't matter on Android because
>> everything's pinned all the time anyway.
>>
>> Also I thought sysfs was one value one file, dumping an entire list into
>> dev_info_map with properties we'll need to extend (once you care about
>> dma_resv you also want to know which attachments are dynamic) does not
>> smell like sysfs design at all.
> sysfs is one value per file, what is being exported that is larger than
> that here?  Did I miss something on review?

See this chunk here:

+
+    list_for_each_entry(attachment, &dmabuf->attachments, node) {
+        if (attachment->map_counter) {
+            ret += sysfs_emit_at(buf, ret, "%s ",
+                         dev_name(attachment->dev));
+        }
+    }

And yes now that Daniel mentioned that it looks like a sysfs rules 
violation to me as well.

Regards,
Christian.


>
> thanks,
>
> greg k-h

