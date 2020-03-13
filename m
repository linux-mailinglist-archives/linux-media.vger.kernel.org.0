Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58CD71844FB
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 11:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgCMKeL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 06:34:11 -0400
Received: from mail-co1nam11on2066.outbound.protection.outlook.com ([40.107.220.66]:61408
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726055AbgCMKeL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 06:34:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUmKXATo2meED87xdJvOG/sIv1VhDW25H4Kq0/oFHiQBuakit1eEYe6hNcbpQkUcFdDWIaMYwOMJFQbLvlG28H6VakmhLcOAZBXYGIFbHFpZB3BSPoUNZZYAYmA2aZoKEmJ7uaLBmXopCzzpJ2Gekmg7rJI8pUJl/WkWy3mR3GruHVAsUMW2hPFAEpQs1G/3Y4nkh+7H0Q+11FizR9Xd8WYPmRb0KVu/lAPtcEd7iPqJBByDYyRx+LixWzQhJaDXrPa6RvS2m3nc4JxFvgxue5wM/4VeoZhhmmeovDsdCQShaIghyCXGFBxfwTXIWqNGp6Hp5+An/hyCTTQbygA9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Fhj/64Oxej/3BzoUi1ZhAPegzsmL3S+aiHhAGmkCvw=;
 b=QCGs9PJb5tZMXisr+PIqrxFBOoLDz4Qf85MA2bA6uHzxFwTk5cKbEI3f1jNWH15V+cdoQ+aHfyGVYfJCB5KrJbUn25NaKoFNgrDYT1fkjN9oHBgHb758agREFtaWwO7k56nqx3pA7Wf9NG+SozW1LXxWXVYhLS+EfG/DmP+G7vTUWjAoMRRz0LlYzvDR3cIMv0roYvStAdNtH1a2tyZdvK7xxiYRxP4TprpjREwFQoC3saJdxzT6yGxOmEsQQc6UTOE89ohIhai+lVSQkD66Gvdofm39t9wAojpa8jO5TpjMem6Xol2HySC19URb5l6HMLGWtUevX6pxk7Mdxv0l6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Fhj/64Oxej/3BzoUi1ZhAPegzsmL3S+aiHhAGmkCvw=;
 b=pj7xN08KxZ0LZCYNKDJCYQxEJ38wyU29dts1einV39fuXfYIvj2dWLV/B0ES/ymZbYIS2v6pC1Ud0qOZcOJ3TSnwomVd7d/P/oJAA0Vpw7eNzhRTgaano+Y9xnvTtzQ4dXSqUx0dtUKhem0HRv6+yrM4YobbQzChZYyybWsYZ+Y=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1578.namprd12.prod.outlook.com (2603:10b6:4:e::7) by
 DM5PR12MB2533.namprd12.prod.outlook.com (2603:10b6:4:b0::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.14; Fri, 13 Mar 2020 10:34:03 +0000
Received: from DM5PR12MB1578.namprd12.prod.outlook.com
 ([fe80::113e:3059:1470:c73c]) by DM5PR12MB1578.namprd12.prod.outlook.com
 ([fe80::113e:3059:1470:c73c%7]) with mapi id 15.20.2793.021; Fri, 13 Mar 2020
 10:34:03 +0000
Subject: Re: [PATCH 3/3] RFC: dma-buf: Add an API for importing and exporting
 sync files (v4)
To:     Jason Ekstrand <jason@jlekstrand.net>
Cc:     Dave Airlie <airlied@redhat.com>,
        Jesse Hall <jessehall@google.com>,
        James Jones <jajones@nvidia.com>,
        Daniel Stone <daniels@collabora.com>,
        =?UTF-8?Q?Kristian_H=c3=b8gsberg?= <hoegsberg@google.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Greg Hackmann <ghackmann@google.com>,
        Chenbo Feng <fengc@google.com>, linux-media@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
        LKML <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
References: <20200303190318.522103-1-jason@jlekstrand.net>
 <20200311034351.1275197-1-jason@jlekstrand.net>
 <20200311034351.1275197-3-jason@jlekstrand.net>
 <bcd22ed3-c1fe-c018-5cb2-a077562eb1ff@amd.com>
 <CAOFGe96gbU03odF2OoLMnA7t7UgM6XrscogOD75dk62=hVFRmA@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d986c1d5-b46c-0ed1-be65-eb2756ddb91d@amd.com>
Date:   Fri, 13 Mar 2020 11:33:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CAOFGe96gbU03odF2OoLMnA7t7UgM6XrscogOD75dk62=hVFRmA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::14) To DM5PR12MB1578.namprd12.prod.outlook.com
 (2603:10b6:4:e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.13 via Frontend Transport; Fri, 13 Mar 2020 10:34:00 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e9c1a043-09ec-4a32-80c8-08d7c73a0c47
X-MS-TrafficTypeDiagnostic: DM5PR12MB2533:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2533FFCF53984DEFE737074B83FA0@DM5PR12MB2533.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 034119E4F6
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(199004)(6486002)(6916009)(8936002)(316002)(5660300002)(54906003)(4326008)(7416002)(31696002)(36756003)(16526019)(86362001)(2616005)(31686004)(8676002)(66574012)(478600001)(2906002)(186003)(66946007)(66476007)(66556008)(6666004)(81156014)(52116002)(81166006)(53546011);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB2533;H:DM5PR12MB1578.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6uv+R/7HRStyKQ3FW8khaqoBz61aGMyATgRKlkUPdZDIDDhUJIyt/c6OctyxORgUH38NxlHlOunMYPA/MvIfJLpHEyYvbq6vqj37SMVAZhkI1X0Njn1l0JTdW1pBrRI6e4UCugFdHe1Z6f8+i89vEbcUCbS7jjpeXxLM00+Ra4zetzBv47A7lBWN7WlWrkLUVkX8cPBT4Vn8/Mmfn6H5biNH7S1FGLiO+5l6771kytpnjHtU3W4KU9/6idf2XJq8PfNqdqErW+G5xhE/bqUhLxob3AkBUvA5bBT8XPIiu906UNyXTrUI4ThmyKM8pV+HjYFxHQ/R0n+JzAKQQZ5kBz4FLWd1lMXtyF+wQx9i1IZOKcd6cjrZe/U5zXOX8t+0VQ+M0haBH5HODWu5VCyAL5IOP/e/9O3zHbgq1TDTyJyRvzhyJ7THzpXfyGtm0Ps+
X-MS-Exchange-AntiSpam-MessageData: yJxSjHcJ1ZleNJ70CRsemPvAYi506BB0xdVlk5CuvMGVi6jUgTxgJUnkb3oPDfb7rHjACTMQxRi6D99VRpjF/rEYWR1PYpbcFBorbM9wLwBA9FifxMawTsYjKr52S73vOirbx5wkldmjDazhejpDXs30H5WOqnARasaQjFK3FDKFpAt9OxLZ+sjGN1W0oT/lZuMYuTXnQhpkcsNok3pVWA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c1a043-09ec-4a32-80c8-08d7c73a0c47
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2020 10:34:03.0804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxfyBra7teVVUC6lwbvIPuFxi5doVlvZIYy+iX+INZx+W6HFS7BQK0qwXNGc1CJN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2533
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 12.03.20 um 16:57 schrieb Jason Ekstrand:
> On Wed, Mar 11, 2020 at 8:18 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 11.03.20 um 04:43 schrieb Jason Ekstrand:
>>> Explicit synchronization is the future.  At least, that seems to be what
>>> most userspace APIs are agreeing on at this point.  However, most of our
>>> Linux APIs (both userspace and kernel UAPI) are currently built around
>>> implicit synchronization with dma-buf.  While work is ongoing to change
>>> many of the userspace APIs and protocols to an explicit synchronization
>>> model, switching over piecemeal is difficult due to the number of
>>> potential components involved.  On the kernel side, many drivers use
>>> dma-buf including GPU (3D/compute), display, v4l, and others.  In
>>> userspace, we have X11, several Wayland compositors, 3D drivers, compute
>>> drivers (OpenCL etc.), media encode/decode, and the list goes on.
>>>
>>> This patch provides a path forward by allowing userspace to manually
>>> manage the fences attached to a dma-buf.  Alternatively, one can think
>>> of this as making dma-buf's implicit synchronization simply a carrier
>>> for an explicit fence.  This is accomplished by adding two IOCTLs to
>>> dma-buf for importing and exporting a sync file to/from the dma-buf.
>>> This way a userspace component which is uses explicit synchronization,
>>> such as a Vulkan driver, can manually set the write fence on a buffer
>>> before handing it off to an implicitly synchronized component such as a
>>> Wayland compositor or video encoder.  In this way, each of the different
>>> components can be upgraded to an explicit synchronization model one at a
>>> time as long as the userspace pieces connecting them are aware of it and
>>> import/export fences at the right times.
>>>
>>> There is a potential race condition with this API if userspace is not
>>> careful.  A typical use case for implicit synchronization is to wait for
>>> the dma-buf to be ready, use it, and then signal it for some other
>>> component.  Because a sync_file cannot be created until it is guaranteed
>>> to complete in finite time, userspace can only signal the dma-buf after
>>> it has already submitted the work which uses it to the kernel and has
>>> received a sync_file back.  There is no way to atomically submit a
>>> wait-use-signal operation.  This is not, however, really a problem with
>>> this API so much as it is a problem with explicit synchronization
>>> itself.  The way this is typically handled is to have very explicit
>>> ownership transfer points in the API or protocol which ensure that only
>>> one component is using it at any given time.  Both X11 (via the PRESENT
>>> extension) and Wayland provide such ownership transfer points via
>>> explicit present and idle messages.
>>>
>>> The decision was intentionally made in this patch to make the import and
>>> export operations IOCTLs on the dma-buf itself rather than as a DRM
>>> IOCTL.  This makes it the import/export operation universal across all
>>> components which use dma-buf including GPU, display, v4l, and others.
>>> It also means that a userspace component can do the import/export
>>> without access to the DRM fd which may be tricky to get in cases where
>>> the client communicates with DRM via a userspace API such as OpenGL or
>>> Vulkan.  At a future date we may choose to add direct import/export APIs
>>> to components such as drm_syncobj to avoid allocating a file descriptor
>>> and going through two ioctls.  However, that seems to be something of a
>>> micro-optimization as import/export operations are likely to happen at a
>>> rate of a few per frame of rendered or decoded video.
>>>
>>> v2 (Jason Ekstrand):
>>>    - Use a wrapper dma_fence_array of all fences including the new one
>>>      when importing an exclusive fence.
>>>
>>> v3 (Jason Ekstrand):
>>>    - Lock around setting shared fences as well as exclusive
>>>    - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
>>>    - Initialize ret to 0 in dma_buf_wait_sync_file
>>>
>>> v4 (Jason Ekstrand):
>>>    - Use the new dma_resv_get_singleton helper
>>>
>>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>>> ---
>>>    drivers/dma-buf/dma-buf.c    | 96 ++++++++++++++++++++++++++++++++++++
>>>    include/uapi/linux/dma-buf.h | 13 ++++-
>>>    2 files changed, 107 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index d4097856c86b..09973c689866 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -20,6 +20,7 @@
>>>    #include <linux/debugfs.h>
>>>    #include <linux/module.h>
>>>    #include <linux/seq_file.h>
>>> +#include <linux/sync_file.h>
>>>    #include <linux/poll.h>
>>>    #include <linux/dma-resv.h>
>>>    #include <linux/mm.h>
>>> @@ -348,6 +349,95 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>>>        return ret;
>>>    }
>>>
>>> +static long dma_buf_wait_sync_file(struct dma_buf *dmabuf,
>>> +                                const void __user *user_data)
>>> +{
>>> +     struct dma_buf_sync_file arg;
>>> +     struct dma_fence *fence;
>>> +     int ret = 0;
>>> +
>>> +     if (copy_from_user(&arg, user_data, sizeof(arg)))
>>> +             return -EFAULT;
>>> +
>>> +     if (arg.flags != 0 && arg.flags != DMA_BUF_SYNC_FILE_SYNC_WRITE)
>>> +             return -EINVAL;
>>> +
>>> +     fence = sync_file_get_fence(arg.fd);
>>> +     if (!fence)
>>> +             return -EINVAL;
>>> +
>>> +     dma_resv_lock(dmabuf->resv, NULL);
>>> +
>>> +     if (arg.flags & DMA_BUF_SYNC_FILE_SYNC_WRITE) {
>>> +             struct dma_fence *singleton = NULL;
>>> +             ret = dma_resv_get_singleton(dmabuf->resv, fence, &singleton);
>>> +             if (!ret && singleton)
>>> +                     dma_resv_add_excl_fence(dmabuf->resv, singleton);
>>> +     } else {
>>> +             dma_resv_add_shared_fence(dmabuf->resv, fence);
>>> +     }
>> You also need to create a singleton when adding a shared fences.
>>
>> The problem is that shared fences must always signal after exclusive
>> ones and you can't guarantee that for the fence you add here.
> I'm beginning to think that I should just drop the flags and always
> wait on all fences and always take what's currently the "write" path.
> Otherwise, something's going to get it wrong somewhere.  Thoughts?

If that is sufficient for your use case then that is certainly the more 
defensive (e.g. less dangerous) approach.

> Also, Michelle (added to CC) commented on IRC today that amdgpu does
> something with implicit sync fences where it sorts out the fences
> which affect one queue vs. others.  He thought that stuffing fences in
> the dma-buf in this way might cause that to not work.  Thoughts?

Yes that is correct. What amdgpu does is it ignores all fences from the 
same process.

E.g. when A submits IBs 1, 2 and 3 and then B submits IB 4 then 4 waits 
for 1,2,3, but 1,2,3 can run parallel to each other.

And yes adding anything as explicit sync would break that, but I don't 
think that this is much of a problem.

Regards,
Christian.


>
> --Jason
>
>
>> Regards,
>> Christian.
>>
>>> +
>>> +     dma_resv_unlock(dmabuf->resv);
>>> +
>>> +     dma_fence_put(fence);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static long dma_buf_signal_sync_file(struct dma_buf *dmabuf,
>>> +                                  void __user *user_data)
>>> +{
>>> +     struct dma_buf_sync_file arg;
>>> +     struct dma_fence *fence = NULL;
>>> +     struct sync_file *sync_file;
>>> +     int fd, ret;
>>> +
>>> +     if (copy_from_user(&arg, user_data, sizeof(arg)))
>>> +             return -EFAULT;
>>> +
>>> +     if (arg.flags != 0 && arg.flags != DMA_BUF_SYNC_FILE_SYNC_WRITE)
>>> +             return -EINVAL;
>>> +
>>> +     fd = get_unused_fd_flags(O_CLOEXEC);
>>> +     if (fd < 0)
>>> +             return fd;
>>> +
>>> +     if (arg.flags & DMA_BUF_SYNC_FILE_SYNC_WRITE) {
>>> +             /* We need to include both the exclusive fence and all of
>>> +              * the shared fences in our fence.
>>> +              */
>>> +             ret = dma_resv_get_singleton(dmabuf->resv, NULL, &fence);
>>> +             if (ret)
>>> +                     goto err_put_fd;
>>> +     } else {
>>> +             fence = dma_resv_get_excl_rcu(dmabuf->resv);
>>> +     }
>>> +
>>> +     if (!fence)
>>> +             fence = dma_fence_get_stub();
>>> +
>>> +     sync_file = sync_file_create(fence);
>>> +
>>> +     dma_fence_put(fence);
>>> +
>>> +     if (!sync_file) {
>>> +             ret = -EINVAL;
>>> +             goto err_put_fd;
>>> +     }
>>> +
>>> +     fd_install(fd, sync_file->file);
>>> +
>>> +     arg.fd = fd;
>>> +     if (copy_to_user(user_data, &arg, sizeof(arg)))
>>> +             return -EFAULT;
>>> +
>>> +     return 0;
>>> +
>>> +err_put_fd:
>>> +     put_unused_fd(fd);
>>> +     return ret;
>>> +}
>>> +
>>>    static long dma_buf_ioctl(struct file *file,
>>>                          unsigned int cmd, unsigned long arg)
>>>    {
>>> @@ -390,6 +480,12 @@ static long dma_buf_ioctl(struct file *file,
>>>        case DMA_BUF_SET_NAME:
>>>                return dma_buf_set_name(dmabuf, (const char __user *)arg);
>>>
>>> +     case DMA_BUF_IOCTL_WAIT_SYNC_FILE:
>>> +             return dma_buf_wait_sync_file(dmabuf, (const void __user *)arg);
>>> +
>>> +     case DMA_BUF_IOCTL_SIGNAL_SYNC_FILE:
>>> +             return dma_buf_signal_sync_file(dmabuf, (void __user *)arg);
>>> +
>>>        default:
>>>                return -ENOTTY;
>>>        }
>>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
>>> index dbc7092e04b5..86e07acca90c 100644
>>> --- a/include/uapi/linux/dma-buf.h
>>> +++ b/include/uapi/linux/dma-buf.h
>>> @@ -37,8 +37,17 @@ struct dma_buf_sync {
>>>
>>>    #define DMA_BUF_NAME_LEN    32
>>>
>>> +struct dma_buf_sync_file {
>>> +     __u32 flags;
>>> +     __s32 fd;
>>> +};
>>> +
>>> +#define DMA_BUF_SYNC_FILE_SYNC_WRITE (1 << 0)
>>> +
>>>    #define DMA_BUF_BASE                'b'
>>> -#define DMA_BUF_IOCTL_SYNC   _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>>> -#define DMA_BUF_SET_NAME     _IOW(DMA_BUF_BASE, 1, const char *)
>>> +#define DMA_BUF_IOCTL_SYNC       _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>>> +#define DMA_BUF_SET_NAME         _IOW(DMA_BUF_BASE, 1, const char *)
>>> +#define DMA_BUF_IOCTL_WAIT_SYNC_FILE _IOW(DMA_BUF_BASE, 2, struct dma_buf_sync)
>>> +#define DMA_BUF_IOCTL_SIGNAL_SYNC_FILE       _IOWR(DMA_BUF_BASE, 3, struct dma_buf_sync)
>>>
>>>    #endif

