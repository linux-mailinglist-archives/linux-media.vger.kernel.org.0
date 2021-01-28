Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95BF1307543
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 12:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbhA1LyR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 06:54:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbhA1LyO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 06:54:14 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F78C061573;
        Thu, 28 Jan 2021 03:53:33 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id j13so6276402edp.2;
        Thu, 28 Jan 2021 03:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=DkJgFwX0t54l53HJntHsCKNxF0CgsuSqjgDoEoK0aa4=;
        b=Q1xSvStcwXIVzB9au194I1ynsiJZoqq5DEe7MwOQGLW7DwwFnnERJxv29j7n7Gj9Y3
         co4fWNRY58BvpzPdrx+mor/jOp+8RDvl5cRtXR+OGFnsIxdmAWRArwO7Tccz3L4KFqUh
         j2dz9YCfeOCWpGEdqh1sFwjHc0lqcohew5Dk3uaz6eES99OanWmGwWAEVeMVwiPDcg3m
         vwY3bPwtwpJ3JrHDD7D0KMCi4+CD6YqlUVD5WMwmB4y+klecpwKSLRfgNl0It1f6aQlJ
         bOU9PaW5XGSiwQQGQasRg7fbtkA9hgObegk28meJ1FCZbieERIzJnggqc6GD+SYh1PtO
         tmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=DkJgFwX0t54l53HJntHsCKNxF0CgsuSqjgDoEoK0aa4=;
        b=WnTa+XMmBlNy9/1Cx1JqfiF1jWD/NrQCCfSrZNWgFui8evrRNPFzkfV7vGeDkiJHZl
         PtnB26dWrn6/68Ssiv2YJF1Ls7XiRAgpV3DzcszPbaEgY4R16Y81MVRXewLbXF7IfYO9
         HutHGaiSZg0/HtXdzHoFJIL6nugbEPKO6i1oKnu37lRBjVBemx36e3lnHrnZ7J3qy/cW
         oS6rMhhu8sfYqCGZk5qMG2y25paR7gHdh1PkzjnqJtD1PT6eJVI5TUtg06mvUEe+S+vN
         QalGplgjiU3k3llFaOiFdxvqPUdnOEZmKapeo0HbSPu2XhUFIKS1cKOB/Rs/IhO2eE+Z
         xbBQ==
X-Gm-Message-State: AOAM531ltsTWcNuWOsgtq6qFz15pFk9yUFLuR5w4ebo6rXrr139yRqc3
        Ug6cznNhB5y828s1WUQ8ZluywP+yOEM=
X-Google-Smtp-Source: ABdhPJx9koQXi2Y5O82nCVvb3L6cYygKnjgNVq8w0I5z8DSed3RDQKRA5Yt60uWtPV5kqQVeFZQjNQ==
X-Received: by 2002:a05:6402:46:: with SMTP id f6mr13583297edu.163.1611834811897;
        Thu, 28 Jan 2021 03:53:31 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id k26sm2913867eds.41.2021.01.28.03.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 03:53:30 -0800 (PST)
Reply-To: christian.koenig@amd.com
Subject: Re: [Linaro-mm-sig] [PATCH v3] dmabuf: Add the capability to expose
 DMA-BUF stats in sysfs
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc:     kernel test robot <lkp@intel.com>,
        Suren Baghdasaryan <surenb@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        hyesoo.yu@samsung.com, John Stultz <john.stultz@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Hridya Valsaraju <hridya@google.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20210126204240.418297-1-hridya@google.com>
 <YBFXPbePURupbe+y@kroah.com>
 <CAO_48GHrpi9XxPhP2evwH_ZJmbVSWqxCvsYg6S2Syh-mrWBHzA@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c0684400-c1e2-0ebd-ad09-cb7b24db5764@gmail.com>
Date:   Thu, 28 Jan 2021 12:53:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAO_48GHrpi9XxPhP2evwH_ZJmbVSWqxCvsYg6S2Syh-mrWBHzA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 28.01.21 um 12:00 schrieb Sumit Semwal:
> Hi Hridya,
>
> On Wed, 27 Jan 2021 at 17:36, Greg KH <gregkh@linuxfoundation.org> wrote:
>> On Tue, Jan 26, 2021 at 12:42:36PM -0800, Hridya Valsaraju wrote:
>>> This patch allows statistics to be enabled for each DMA-BUF in
>>> sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
>>>
>>> The following stats will be exposed by the interface:
>>>
>>> /sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
>>> /sys/kernel/dmabuf/buffers/<inode_number>/size
>>> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/device
>>> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/map_counter
>>>
>>> The inode_number is unique for each DMA-BUF and was added earlier [1]
>>> in order to allow userspace to track DMA-BUF usage across different
>>> processes.
>>>
>>> Currently, this information is exposed in
>>> /sys/kernel/debug/dma_buf/bufinfo.
>>> However, since debugfs is considered unsafe to be mounted in production,
>>> it is being duplicated in sysfs.
>>>
>>> This information will be used to derive DMA-BUF
>>> per-exporter stats and per-device usage stats for Android Bug reports.
>>> The corresponding userspace changes can be found at [2].
>>> Telemetry tools will also capture this information(along with other
>>> memory metrics) periodically as well as on important events like a
>>> foreground app kill (which might have been triggered by Low Memory
>>> Killer). It will also contribute to provide a snapshot of the system
>>> memory usage on other events such as OOM kills and Application Not
>>> Responding events.
>>>
>>> A shell script that can be run on a classic Linux environment to read
>>> out the DMA-BUF statistics can be found at [3](suggested by John
>>> Stultz).
>>>
>>> The patch contains the following improvements over the previous version:
>>> 1) Each attachment is represented by its own directory to allow creating
>>> a symlink to the importing device and to also provide room for future
>>> expansion.
>>> 2) The number of distinct mappings of each attachment is exposed in a
>>> separate file.
>>> 3) The per-buffer statistics are now in /sys/kernel/dmabuf/buffers
>>> inorder to make the interface expandable in future.
>>>
>>> All of the improvements above are based on suggestions/feedback from
>>> Daniel Vetter and Christian König.
>>>
>>> [1]: https://lore.kernel.org/patchwork/patch/1088791/
>>> [2]: https://android-review.googlesource.com/q/topic:%22dmabuf-sysfs%22+(status:open%20OR%20status:merged)
>>> [3]: https://android-review.googlesource.com/c/platform/system/memory/libmeminfo/+/1549734
>>>
>>> Signed-off-by: Hridya Valsaraju <hridya@google.com>
>>> Reported-by: kernel test robot <lkp@intel.com>
> Thanks for the patch!
>
> Christian: If you're satisfied with the explanation around not
> directly embedding kobjects into the dma_buf and dma_buf_attachment
> structs, then with Greg's r-b from sysfs PoV, I think we can merge it.
> Please let me know if you feel otherwise!

 From the technical side it looks clean to me, feel free to add my 
acked-by while pushing.

But I would at least try to convince Daniel on the design. At least some 
of his concerns seems to be valid and keep in mind that we need to 
support this interface forever.

Regards,
Christian.

>
>>> ---
>>> Changes in v3:
>>> Fix a warning reported by the kernel test robot.
>>>
>>> Changes in v2:
>>> -Move statistics to /sys/kernel/dmabuf/buffers in oder to allow addition
>>> of other DMA-BUF-related sysfs stats in future. Based on feedback from
>>> Daniel Vetter.
>>> -Each attachment has its own directory to represent attaching devices as
>>> symlinks and to introduce map_count as a separate file. Based on
>>> feedback from Daniel Vetter and Christian König. Thank you both!
>>> -Commit messages updated to point to userspace code in AOSP that will
>>> read the DMA-BUF sysfs stats.
>>>
>>>
>>>   .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  52 ++++
>>>   drivers/dma-buf/Kconfig                       |  11 +
>>>   drivers/dma-buf/Makefile                      |   1 +
>>>   drivers/dma-buf/dma-buf-sysfs-stats.c         | 285 ++++++++++++++++++
>>>   drivers/dma-buf/dma-buf-sysfs-stats.h         |  62 ++++
>>>   drivers/dma-buf/dma-buf.c                     |  37 +++
>>>   include/linux/dma-buf.h                       |  20 ++
>>>   7 files changed, 468 insertions(+)
>>>   create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
>>>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
>>>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
>> I don't know the dma-buf code at all, but from a sysfs/kobject point of
>> view, this patch looks good to me:
>>
>> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Best,
> Sumit.
> _______________________________________________
> Linaro-mm-sig mailing list
> Linaro-mm-sig@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig

