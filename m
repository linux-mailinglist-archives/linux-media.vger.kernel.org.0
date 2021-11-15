Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2397845034C
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 12:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231214AbhKOLX0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 06:23:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbhKOLXV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 06:23:21 -0500
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33071C061746
        for <linux-media@vger.kernel.org>; Mon, 15 Nov 2021 03:20:23 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ma24mEfxOfwDFma28mONAD; Mon, 15 Nov 2021 12:20:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636975221; bh=W/GrJUWE1PifpwbKrJKvtakyGJkFvCs+rg8GjVxtaUM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vIAo2qvrJhX3UPOwRPNy5gqjW3X/mifZHWFpys4jn9NyztJ2WZ4MTXIPEdTTMnlZt
         RJV3kQnIQJpE8P/kNqtY9iiDMxTp2XcuyiQIVjIMCI6RzSyHoMb9b0DPhR2nyZh4UR
         CnOn5Z5e0In5N5bgcKMVsvJTuN9EjUwOLgvto/WTlkktBPEfvS5y4orIjDjz2ckDVe
         KrMaLzd1sRKm5cpH+DtTC/UL2w99P9AhyKDvsMDXAy9VXqXkwPsZ3Y3zTc6ayTxaBP
         mLjbAJ/YQzWZGrv/9Mjro4AO0jvs1TbJvqhoSnBvGc0lsTcunfzVcdFk3AWSSMy2xd
         ibllDwoEk1i4w==
Subject: Re: [PATCH media-staging regression fix] media: videobuf2-dma-sg: Fix
 buf->vb NULL pointer dereference
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20211101145355.533704-1-hdegoede@redhat.com>
 <28823616-9622-29d4-75d6-cfef0d4f7323@redhat.com>
 <CAAFQd5Ax6LUKMWMuvutCo7ng995rF5YBDw+WBRRDJE7dY-c0Cg@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d45dd8ce-56bf-521f-cda2-15f63f13cddd@xs4all.nl>
Date:   Mon, 15 Nov 2021 12:20:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5Ax6LUKMWMuvutCo7ng995rF5YBDw+WBRRDJE7dY-c0Cg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNkODPKAFOuGswUmggDVHWLblKHUVmmBsg8LSBukqlrB7orLl8sOj6vDNVPdomyWRSCSe9TSpD0IMf2zvAdDzGsH6YFEZQ7zymD4BYhBIZ0MDcSq4jpF
 Xn8r81LIU4n+W3VaTMPrxJXn+FWM1Pwofr6opdl+Jj8rEZuryFiw5+68ma6u2wkFEYO54/dZcB+0STqFpKmLr/SXw6B9cTcAjW6qf/bwGdxIHg+w/YxPRf3O
 wVZqxJYOswKRpDneQYHLbnN9ksuuAcvmiuybfQ7rTAj0R/x+rX9+gXYcQPD8GtYkywDkRxw8wYQgcWx4n6RKKFMJUuqdc8nINk7Fm7VpW/eQPdDOQ/RDNbO7
 kwnEKtT5MZh5gVmhazYKrb3HVkGo+eP3/M0t3pyt9clQe4xu06+IzA18zb6vGA/wtdql1Sj35VTX88v6tQqwwYj68OhTRg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/11/2021 09:54, Tomasz Figa wrote:
> Hi Hans,
> 
> On Sat, Nov 6, 2021 at 9:39 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 11/1/21 15:53, Hans de Goede wrote:
>>> Commit a4b83deb3e76 ("media: videobuf2: rework vb2_mem_ops API")
>>> added a new vb member to struct vb2_dma_sg_buf, but it only added
>>> code setting this to the vb2_dma_sg_alloc() function and not to the
>>> vb2_dma_sg_get_userptr() and vb2_dma_sg_attach_dmabuf() which also
>>> create vb2_dma_sg_buf objects.
>>>
>>> This is causing a crash due to a NULL pointer deref when using
>>> libcamera on devices with an Intel IPU3 (qcam app).
>>>
>>> Fix these crashes by assigning buf->vb in the other 2 functions too,
>>> note libcamera tests the vb2_dma_sg_get_userptr() path, the change
>>> to the vb2_dma_sg_attach_dmabuf() path is untested.
>>>
>>> Fixes: a4b83deb3e76 ("media: videobuf2: rework vb2_mem_ops API")
>>> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Ping ? This is still an issue in the current media-staging tree.
> 
> Uh, sorry, I thought this was already fixed by [1], but that was only
> for the dma-contig allocator. Thanks for the patch.
> 
> Acked-by: Tomasz Figa <tfiga@chromium.org>
> 
> [1] https://patchwork.kernel.org/project/linux-media/patch/20210928034634.333785-1-senozhatsky@chromium.org/
> 
> Hans (V.), would you pick this fix, please?

Yes, it's in a PR I posted for 5.16.

Regards,

	Hans

> 
> Best regards,
> Tomasz
> 
>>
>> Regards,
>>
>> Hans
>>
>>
>>> ---
>>>  drivers/media/common/videobuf2/videobuf2-dma-sg.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>>> index 33ee63a99139..0452ed9fac95 100644
>>> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>>> @@ -241,6 +241,7 @@ static void *vb2_dma_sg_get_userptr(struct vb2_buffer *vb, struct device *dev,
>>>       buf->offset = vaddr & ~PAGE_MASK;
>>>       buf->size = size;
>>>       buf->dma_sgt = &buf->sg_table;
>>> +     buf->vb = vb;
>>>       vec = vb2_create_framevec(vaddr, size);
>>>       if (IS_ERR(vec))
>>>               goto userptr_fail_pfnvec;
>>> @@ -642,6 +643,7 @@ static void *vb2_dma_sg_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
>>>       buf->dma_dir = vb->vb2_queue->dma_dir;
>>>       buf->size = size;
>>>       buf->db_attach = dba;
>>> +     buf->vb = vb;
>>>
>>>       return buf;
>>>  }
>>>
>>

