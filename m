Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84692171405
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 10:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728686AbgB0JUb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 04:20:31 -0500
Received: from mail-eopbgr680058.outbound.protection.outlook.com ([40.107.68.58]:8686
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728634AbgB0JUa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 04:20:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBTEWHAQbm8pViuYNAHxVhLii76KsLfpIwKIq6QdBgQaaXoMEwaOaXGisiUUqLAElv/vsR262ADkjfbJ0KKTMtqdThyxRaMeBSMdlTixaPbenVIA68blhy+Vx8frtVncVXH/L8Mt+RwFshdSaMUV8rc7TvwzII+yG/QHDD9IGtGOgpOFkiyy07FE1PkV6BbWMbdksiG5R3f1/WdJ5fB3Veses1iPFd9Yl2LGEgtr/v8UOv7KfIFW3HbUA40pEcfrveJZQmJKr3Yyoml0z04RZD1iPtzxjbwlwtSYpbMhZA+0AfuW18yV3LrLQoqSP14tkQ2BzeBadWzrtl3jOd0g+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWWt0TInnhngvOkOpWn5frj8f4eOHK4vBIz7zq5TBCQ=;
 b=A3JEthK5joqpUv+qfrXSUx+m5VSbsA0GOXBtV6EIY2C+zP9ZIhMnxm6VOXtsF0jJPBlvdGyl7iO3ZOWpsm/1FqvqT6mOoTtKJ6IO20ibLTYRsNrFr+1m3tnxVRAsv3/Mrg0WjFZvC6g78ff5OOADcm5/IWit4hI+aHFuwW3kVDuijWPd9XYhq9WjjxQYQJso/mLGNaguC0yzKrGSTI1Buy4iNTSCj8jyyQl8zGTd3Q7o19Sv3kKEQ5lVuOAHdUWN6Z4TmRr/jdFxN0oLcCfXeS+B2huB0R+BHA+9Yxf8zMd44TKvkbUkKxEujAH8F9WLD0NL34gW6eof7nGmCtmFWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWWt0TInnhngvOkOpWn5frj8f4eOHK4vBIz7zq5TBCQ=;
 b=kNhqJW+WGpayOITUFsuFs7G2oGyvPhUH9XN2bueBApbM+icjV7DiyZttRa20FMqXA3cQWkIqP6pJCtzI+uUovxghsB17KUzrS+2H8VeSgT5nVQuiX0lUZmLHjT2WaaqNy0XHdxSrJEuixbenc8ucPNmCDVHGafH1wy9FT8fKRuo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1833.namprd12.prod.outlook.com (2603:10b6:3:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Thu, 27 Feb
 2020 09:20:27 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2750.021; Thu, 27 Feb
 2020 09:20:26 +0000
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= 
        <thomas_os@shipmail.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <79a0d79f-91bd-2481-740c-20e6c819c7c9@shipmail.org>
 <ee929c93-c9d7-7243-810e-94c6f0fc64b0@shipmail.org>
 <20200220180459.GS2363188@phenom.ffwll.local>
 <d1c37ec4-b63e-437a-a2be-80ba5192e048@shipmail.org>
 <20200220200831.GA2363188@phenom.ffwll.local>
 <501bf409-e4fe-a318-17b4-d5d050b09529@shipmail.org>
 <20200221171217.GD2363188@phenom.ffwll.local>
 <d9343617-9da8-5fea-a0f1-99db34a0cf2c@gmail.com>
 <8f29b152-9c7b-3427-efa2-4a39f0daced8@shipmail.org>
 <7d73bdfa-63d0-11af-7029-382ad1015c4c@amd.com>
 <20200225171608.GN2363188@phenom.ffwll.local>
 <CAKMK7uFrcRjjaDAwK73e3UYoONCz36k5SaUStGbjMz7q5FqTMQ@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d524ecc5-5a18-e20f-8d9e-7060d49cb12e@amd.com>
Date:   Thu, 27 Feb 2020 10:20:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CAKMK7uFrcRjjaDAwK73e3UYoONCz36k5SaUStGbjMz7q5FqTMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0108.eurprd05.prod.outlook.com
 (2603:10a6:207:1::34) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:30c0:4f14:1c46:c226] (2a02:908:1252:fb60:30c0:4f14:1c46:c226) by AM3PR05CA0108.eurprd05.prod.outlook.com (2603:10a6:207:1::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14 via Frontend Transport; Thu, 27 Feb 2020 09:20:25 +0000
X-Originating-IP: [2a02:908:1252:fb60:30c0:4f14:1c46:c226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 359a54d6-a330-4f6b-5f1d-08d7bb6647f7
X-MS-TrafficTypeDiagnostic: DM5PR12MB1833:
X-Microsoft-Antispam-PRVS: <DM5PR12MB18332BB2BDF7E17E7D2093A583EB0@DM5PR12MB1833.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-Forefront-PRVS: 03264AEA72
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(189003)(199004)(31686004)(66946007)(6666004)(186003)(8676002)(81156014)(8936002)(86362001)(81166006)(31696002)(16526019)(2616005)(36756003)(5660300002)(6486002)(66476007)(66556008)(316002)(478600001)(54906003)(2906002)(53546011)(52116002)(6916009)(4326008)(66574012);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB1833;H:DM5PR12MB1705.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m3RlwRJRgHSZaVzdRWoxZGdlyxgTjBxJKvEc8LFIPFGIPWhlxh2F1GWqWSyuOIicGfatcORQyj/CPfv06Tcj+7f2gGDvwecIJRYFCzBCMmpYPkQhzlYmqbqDurXWjWn/dUjqvfblzsljDZ+ac30UsB1wfyvp2ZPXSdR/yHh+YylKo17crsVVotfTPj/6BYEU4faVwX/2iJDu4bJjbN4wT/c4wbgVyluevLsIIMOmZTmISTV3VaH/OYB+q76gc4W5zhKnlf/EJv1recJwHrodOuxQ9+6ca35tBnfTv9t3uI6GY2+OETF8IfxxkFsxlg8lqMWHVXiFxUrtIdjKXIK9VR/G0XaDKhI2AzS8lxsHQiq5Ii9cgfVB/ELj743MAz9dgS7AxQcpRqp4cHNrsJiikTls5i7nMTCyQ2pkefPoprmHzxf3/jWxHp6Ic8C69SN/
X-MS-Exchange-AntiSpam-MessageData: mCVv9lGCJnenkf8GfswbmwQgbZks3BVB4l7IiPa2StseOUlJIQiIix5xwvStLpuvMlZw5qn/VqGTpVQ+B+NccRJpkRB/QEX+LW44w/uVSpEbRroI4cMs2nlZwk67l9Z7HgNtMmmZJhuXIYUxot41/50VpdNoodUK1aiSxBdJgRDu6hv9ceS3TiXvc+SVqjdccWEmwvrWsrAcw4yJf99a4Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 359a54d6-a330-4f6b-5f1d-08d7bb6647f7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2020 09:20:26.7785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0XDtpKf9uhy7myYfa0uvkdSueczdkybXEuFFcjZ2uur84sPQzX4ZSP2sNMKZzsF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1833
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 26.02.20 um 17:32 schrieb Daniel Vetter:
> On Tue, Feb 25, 2020 at 6:16 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>> On Mon, Feb 24, 2020 at 07:46:59PM +0100, Christian König wrote:
>>> Am 23.02.20 um 17:54 schrieb Thomas Hellström (VMware):
>>>> On 2/23/20 4:45 PM, Christian König wrote:
>>>>> Am 21.02.20 um 18:12 schrieb Daniel Vetter:
>>>>>> [SNIP]
>>>>>> Yeah the Great Plan (tm) is to fully rely on ww_mutex slowly
>>>>>> degenerating
>>>>>> into essentially a global lock. But only when there's actual contention
>>>>>> and thrashing.
>>>>> Yes exactly. A really big problem in TTM is currently that we drop
>>>>> the lock after evicting BOs because they tend to move in again
>>>>> directly after that.
>>>>>
>>>>>  From practice I can also confirm that there is exactly zero benefit
>>>>> from dropping locks early and reacquire them for example for the VM
>>>>> page tables. That's just makes it more likely that somebody needs to
>>>>> roll back and this is what we need to avoid in the first place.
>>>> If you have a benchmarking setup available it would be very interesting
>>>> for future reference to see how changing from WD to WW mutexes affects
>>>> the roll back frequency. WW is known to cause rollbacks much less
>>>> frequently but there is more work associated with each rollback.
>>> Not of hand. To be honest I still have a hard time to get a grip on the
>>> difference between WD and WW from the algorithm point of view. So I can't
>>> judge that difference at all.
>>>
>>>>> Contention on BO locks during command submission is perfectly fine
>>>>> as long as this is as lightweight as possible while we don't have
>>>>> trashing. When we have trashing multi submission performance is best
>>>>> archived to just favor a single process to finish its business and
>>>>> block everybody else.
>>>> Hmm. Sounds like we need a per-manager ww_rwsem protecting manager
>>>> allocation, taken in write-mode then there's thrashing. In read-mode
>>>> otherwise. That would limit the amount of "unnecessary" locks we'd have
>>>> to keep and reduce unwanted side-effects, (see below):
>>> Well per-manager (you mean per domain here don't you?) doesn't sound like
>>> that useful because we rarely use only one domain, but I'm actually
>>> questioning for quite a while if the per BO lock scheme was the right
>>> approach.
>>>
>>> See from the performance aspect the closest to ideal solution I can think of
>>> would be a ww_rwsem per user of a resource.
>>>
>>> In other words we don't lock BOs, but instead a list of all their users and
>>> when you want to evict a BO you need to walk that list and inform all users
>>> that the BO will be moving.
>>>
>>> During command submission you then have the fast path which rather just
>>> grabs the read side of the user lock and check if all BOs are still in the
>>> expected place.
>>>
>>> If some BOs were evicted you back off and start the slow path, e.g. maybe
>>> even copy additional data from userspace then grab the write side of the
>>> lock etc.. etc...
>>>
>>> That approach is similar to what we use in amdgpu with the per-VM BOs, but
>>> goes a step further. Problem is that we are so used to per BO locks in the
>>> kernel that this is probably not doable any more.
>> Yeah I think it'd be nice to have the same approach for shared bo too. I
>> guess what we could do is something like this (spinning your ww_rwmutex
>> idea a bit further):
>>
>> dma_buf_read_lock(buf, vm)
>> {
>>          if (enabled(CONFIG_DEBUG_WW_MUTEX_SLOWPATH))
>>          {
>>                  check that vm is indeed listed in buf and splat if not
>>          }
>>
>>          /* for a buf that's not shared in multiple vm we'd have buf->resv
>>           * == vm->resv here */
>>          return ww_mutex_lock(vm->resv);
>> }
>>
>> dma_buf_write_lock(buf)
>> {
>>          for_each_vm_in_buf(buf, vm) {
>>                  ww_mutex_lock(vm->resv);
>>          }
>> }
>>
>> Ideally we'd track all these vms with something slightly less shoddy than
>> a linked list :-) Resizeable array is probably pretty good, I think we
>> only ever need to go from buf -> vm list, not the other way round. At
>> least in dma_resv/dma_buf code, driver code ofc needs to keep a list of
>> all bo bound to a vm somewhere. But that's probably a much bigger
>> datastructure for tracking vma offsets and mappings and other things on
>> top.
>>
>> Ofc to even just get there we'd need something like the sublock list to
>> keep track of all the additional locks we'd need for the writer lock. And
>> we'd need the release callback for backoff, so that we could also go
>> through the slowpath on a vm object that we're not holding a full
>> reference on. That also means vm need to be refcounted.
>>
>> And the list of vms on a buffer need to be protected with some lock and
>> the usual kref_get_unless_zero trickery.
>>
>> But with all this I think we can make the dma_buf_write_lock lock 100%
>> like the old per-buffer lock for everyone. And execbuf could switch over
>> to dma_buf_read_lock for shared buffers. Bonus points when the gpu context
>> just keeps track of a list of shared vm used by buffers in that context
>> ...
>>
>> That way we could make vm fastpath locking a la amdgpu opt-in, while
>> keeping everyone else on the per-object locking juices.
>>
>> Thoughts?

At least to me that sounds like a plan.

> One thing I just realized, which is nasty: The full (write) lock needs
> ww_acquire_ctx with this, because it needs to take a bunch of locks.
> Rolling that out everywhere is going to be nasty.

Why? Take a single write lock shouldn't be different to taking a single 
ww_mutex, or am I missing something?

> I guess though we could do a fallback and have a locally created
> ww_acquire_ctx if there's none passed in, with backoff entirely
> implemented within dma_resv_lock.

How should that work? As far as I understand it the ww_acquire_ctx must 
be kept existing until after the last of the locks it was used with is 
unlocked. Or do I see this incorrectly?

> -Daniel
>
>> Cheers, Daniel
>>
>> PS: Of course the write lock for these buffers is going to be terrible, so
>> every time you need to update fences for implicit sync on shared buffer
>> (well write fence at least) it's going to suck. We probably also want a
>> read_to_write_upgrade function, which also can be done easily with
>> ww_mutex magic.

I'm thinking that we probably sole want a read_to_write upgrade function.

Regards,
Christian.

>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>>

