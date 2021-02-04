Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7884E30EF71
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 10:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235129AbhBDJPN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 04:15:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235177AbhBDJOk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Feb 2021 04:14:40 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976F0C0613D6
        for <linux-media@vger.kernel.org>; Thu,  4 Feb 2021 01:13:59 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id u66so1093017oig.9
        for <linux-media@vger.kernel.org>; Thu, 04 Feb 2021 01:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RTzUaR2l9Y+wonn/5AaTUIe22c6Cvk8bS3lsdUKi7C4=;
        b=PlBUd4Py28pehHqU06+ihr1l7h0vSS4JISmS5j2ah1UZ+e8VoB9doYac74bcQDZl7B
         jYXUClMz2yJNHpgQL2WASwpxpv0GTKchb2om/0uCvplSJ3hklaRcTKDvfuqxPTTlmgMy
         eGRc6uggEdgrHWuaNQN61koxVhscZ/zAGFRnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RTzUaR2l9Y+wonn/5AaTUIe22c6Cvk8bS3lsdUKi7C4=;
        b=Az/vzUCNx9gZZVbzrLW5kyvc0mNMC7xN4y7la8s6e6h6kflPDF/IxY81NraEReLn/s
         GaP5dTwIE4sUwJbMsUHlm2FqhM72XsF8WuwXYyOwxhC0xl/6JSA0s/GercYo9RSSoiBD
         1vjPeWE6opWGvy3xsH33m/Zj3bricEqtNHbBSYJwW8SvzxTqRIE5van9BTbArhKBP/bh
         uQkDFBB7wEB0Td2dQmaUnBv07sPM01u6c9yc7B/RWdizxkaxOBaNEbhhM0tIXodP7uoF
         Bb690zBUsmv9PTLRgzkxgsLUDgTkETwAmPbA2jboJbBiiL3RACHJ+HryFnVGCCUSdBhS
         BQmw==
X-Gm-Message-State: AOAM531BSsVPSTTLABzeNWOT5OBw59XZa3gpkW/yHDS8z3PfXZZPLJhd
        epnS0bd4KLRrXgBurqZ33wl/CrmX/LIzAs0AVXqJIA==
X-Google-Smtp-Source: ABdhPJysDYIHlHu6+BiphwjplLKS1acWqikv5lmtyYRwu4CezcY5Vj2C2488GYPUOuwTLROyI3YiWCjctUrsusXcAqE=
X-Received: by 2002:aca:1906:: with SMTP id l6mr4613717oii.101.1612430038909;
 Thu, 04 Feb 2021 01:13:58 -0800 (PST)
MIME-Version: 1.0
References: <20210126204240.418297-1-hridya@google.com> <YBFXPbePURupbe+y@kroah.com>
 <CAO_48GHrpi9XxPhP2evwH_ZJmbVSWqxCvsYg6S2Syh-mrWBHzA@mail.gmail.com>
 <c0684400-c1e2-0ebd-ad09-cb7b24db5764@gmail.com> <CAO_48GGsOTLdqAQMO9vrLtWAKG6spByMC-GXwDv_f3ENvpemfA@mail.gmail.com>
 <CAKMK7uEwm5tLT3fo_+QtzUthht3JLkhCpZ+6yJ2XSB6U4Qp5wg@mail.gmail.com>
 <CA+wgaPPmTQ2x37rMVsEW=D-adHHyp12sTAh-Gfq3Fn0rOBBHQA@mail.gmail.com>
 <YBp6LJhg6mTN1U5G@phenom.ffwll.local> <CA+wgaPN-e1h8OHAJ4y9Cj+hoiWeOz2gizMAvoSnBQKvexi8ayQ@mail.gmail.com>
 <3a5e5164-e6d5-c487-71d8-910f943aee1a@amd.com>
In-Reply-To: <3a5e5164-e6d5-c487-71d8-910f943aee1a@amd.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 4 Feb 2021 10:13:47 +0100
Message-ID: <CAKMK7uF0=Xqtiny4Ad7GDRKxdoLvF7PiXVm-2FVFQyPe77PN6w@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3] dmabuf: Add the capability to expose
 DMA-BUF stats in sysfs
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Hridya Valsaraju <hridya@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Android Kernel Team <kernel-team@android.com>,
        kernel test robot <lkp@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        Hyesoo Yu <hyesoo.yu@samsung.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 4, 2021 at 9:13 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 03.02.21 um 21:14 schrieb Hridya Valsaraju:
> > On Wed, Feb 3, 2021 at 2:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >> On Mon, Feb 01, 2021 at 01:02:30PM -0800, Hridya Valsaraju wrote:
> >>> On Mon, Feb 1, 2021 at 10:37 AM Daniel Vetter <daniel@ffwll.ch> wrote=
:
> >>>> On Thu, Jan 28, 2021 at 1:03 PM Sumit Semwal <sumit.semwal@linaro.or=
g> wrote:
> >>>>> On Thu, 28 Jan 2021 at 17:23, Christian K=C3=B6nig
> >>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>>>> Am 28.01.21 um 12:00 schrieb Sumit Semwal:
> >>>>>>> Hi Hridya,
> >>>>>>>
> >>>>>>> On Wed, 27 Jan 2021 at 17:36, Greg KH <gregkh@linuxfoundation.org=
> wrote:
> >>>>>>>> On Tue, Jan 26, 2021 at 12:42:36PM -0800, Hridya Valsaraju wrote=
:
> >>>>>>>>> This patch allows statistics to be enabled for each DMA-BUF in
> >>>>>>>>> sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> >>>>>>>>>
> >>>>>>>>> The following stats will be exposed by the interface:
> >>>>>>>>>
> >>>>>>>>> /sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
> >>>>>>>>> /sys/kernel/dmabuf/buffers/<inode_number>/size
> >>>>>>>>> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_u=
id>/device
> >>>>>>>>> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_u=
id>/map_counter
> >>>>>>>>>
> >>>>>>>>> The inode_number is unique for each DMA-BUF and was added earli=
er [1]
> >>>>>>>>> in order to allow userspace to track DMA-BUF usage across diffe=
rent
> >>>>>>>>> processes.
> >>>>>>>>>
> >>>>>>>>> Currently, this information is exposed in
> >>>>>>>>> /sys/kernel/debug/dma_buf/bufinfo.
> >>>>>>>>> However, since debugfs is considered unsafe to be mounted in pr=
oduction,
> >>>>>>>>> it is being duplicated in sysfs.
> >>>>>>>>>
> >>>>>>>>> This information will be used to derive DMA-BUF
> >>>>>>>>> per-exporter stats and per-device usage stats for Android Bug r=
eports.
> >>>>>>>>> The corresponding userspace changes can be found at [2].
> >>>>>>>>> Telemetry tools will also capture this information(along with o=
ther
> >>>>>>>>> memory metrics) periodically as well as on important events lik=
e a
> >>>>>>>>> foreground app kill (which might have been triggered by Low Mem=
ory
> >>>>>>>>> Killer). It will also contribute to provide a snapshot of the s=
ystem
> >>>>>>>>> memory usage on other events such as OOM kills and Application =
Not
> >>>>>>>>> Responding events.
> >>>>>>>>>
> >>>>>>>>> A shell script that can be run on a classic Linux environment t=
o read
> >>>>>>>>> out the DMA-BUF statistics can be found at [3](suggested by Joh=
n
> >>>>>>>>> Stultz).
> >>>>>>>>>
> >>>>>>>>> The patch contains the following improvements over the previous=
 version:
> >>>>>>>>> 1) Each attachment is represented by its own directory to allow=
 creating
> >>>>>>>>> a symlink to the importing device and to also provide room for =
future
> >>>>>>>>> expansion.
> >>>>>>>>> 2) The number of distinct mappings of each attachment is expose=
d in a
> >>>>>>>>> separate file.
> >>>>>>>>> 3) The per-buffer statistics are now in /sys/kernel/dmabuf/buff=
ers
> >>>>>>>>> inorder to make the interface expandable in future.
> >>>>>>>>>
> >>>>>>>>> All of the improvements above are based on suggestions/feedback=
 from
> >>>>>>>>> Daniel Vetter and Christian K=C3=B6nig.
> >>>>>>>>>
> >>>>>>>>> [1]: https://nam11.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Flore.kernel.org%2Fpatchwork%2Fpatch%2F1088791%2F&amp;data=3D04%7C=
01%7Cchristian.koenig%40amd.com%7C32ff828b838e44b1de6f08d8c8805913%7C3dd896=
1fe4884e608e11a82d994e183d%7C0%7C0%7C637479800886768855%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1=
000&amp;sdata=3DimVoJbadV221%2F6u32diSyEICLk7WUNakz8G742RPSaA%3D&amp;reserv=
ed=3D0
> >>>>>>>>> [2]: https://nam11.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fandroid-review.googlesource.com%2Fq%2Ftopic%3A%2522dmabuf-sysfs%2=
522&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7C32ff828b838e44b1de6f0=
8d8c8805913%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637479800886778838=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DX78MH6IvdcE1mGMngrVdBYooi93vpjvfLU9kQHj=
ZyKo%3D&amp;reserved=3D0+(status:open%20OR%20status:merged)
> >>>>>>>>> [3]: https://nam11.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fandroid-review.googlesource.com%2Fc%2Fplatform%2Fsystem%2Fmemory%=
2Flibmeminfo%2F%2B%2F1549734&amp;data=3D04%7C01%7Cchristian.koenig%40amd.co=
m%7C32ff828b838e44b1de6f08d8c8805913%7C3dd8961fe4884e608e11a82d994e183d%7C0=
%7C0%7C637479800886778838%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI=
joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DJH7m5yspXKDqVX=
5DB380cnU4kWNSyh6ctDaphJvOyw8%3D&amp;reserved=3D0
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> >>>>>>>>> Reported-by: kernel test robot <lkp@intel.com>
> >>>>>>> Thanks for the patch!
> >>>>>>>
> >>>>>>> Christian: If you're satisfied with the explanation around not
> >>>>>>> directly embedding kobjects into the dma_buf and dma_buf_attachme=
nt
> >>>>>>> structs, then with Greg's r-b from sysfs PoV, I think we can merg=
e it.
> >>>>>>> Please let me know if you feel otherwise!
> >>>>>>   From the technical side it looks clean to me, feel free to add m=
y
> >>>>>> acked-by while pushing.
> >>>>>>
> >>>>>> But I would at least try to convince Daniel on the design. At leas=
t some
> >>>>>> of his concerns seems to be valid and keep in mind that we need to
> >>>>>> support this interface forever.
> >>>>> Naturally.
> >>>>>
> >>>>> Since he didn't comment over Hridya's last clarification about the
> >>>>> tracepoints to track total GPU memory allocations being orthogonal =
to
> >>>>> this series, I assumed he agreed with it.
> >>>> The tracepoint being orthogonal didn't really look convincing to me,
> >>>> since I do expect we'll need that at a much more generic level, at
> >>>> allocators. Whether that's dma-buf heaps or in drm or wherever. And =
we
> >>>> probably also need that to somehow align with cgroups accounting.
> >>>>
> >>>> But I guess for this it should be easy to extend however we see fit,
> >>>> so retrofitting allocator sources and anything else we want/need for
> >>>> the overall gpu memory account shouldn't be a problem. Also, it's
> >>>> first, so the proof for showing it all works together is more on the
> >>>> tracepoints :-)
> >>>>
> >>>>> Daniel, do you still have objections around adding this patch in?
> >>>> Needs docs (especially the uapi I think would be useful to document)=
,
> >>>> igt tests, that kind of stuff still I think? It's meant to be generi=
c
> >>>> uapi across drivers, generally we're a pile stricter for that (and y=
es
> >>>> dma-buf heaps I think didn't do all that, so maybe there's an argume=
nt
> >>>> for doing this a bit more sloppy or at least "the testsuite is
> >>>> somewhere else").
> >>> Thank you for taking another look Daniel!
> >>>
> >>> I will try adding an IGT test for the sysfs files. Other than the
> >>> documentation in
> >>> Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers(included in the
> >>> patch), is there another place you would like to see the documentatio=
n
> >>> copied to?
> >> So just read the other thread, and sounds like Christian K=C3=B6nig br=
ought up
> >> a solid concern with dma-buf fds generally not staying around for much=
.
> > Thank you for the reply Daniel! Could you please elaborate on the
> > connection with the other thread you mentioned? I am a little confused
> > since this patch does not deal with tracking DMA-BUF fds.
>
> In general DMA-buf fd are meant to be a temporary transport vehicle to
> interchange the data between processes.
>
> This here sounds like Android is using them as a long term reference.
> That is not necessary a good idea and causes multiple issues.
>
> On of those issues you try to address here, but Daniel is question now
> why do you have this problem in the first place?

Afaik it's how Android works, lots more fd passing than we do (that's
also why Android has sync_file, i.e. pass a sync fd around every
frame, whereas we have drm_syncobj, i.e. pass the sync container
object fd once around at startup and be done).

I more meant that now I'm leaning more towards "we really need a
unified *pu buffer reporting scheme" before signing up to something
that only works for very limited use cases.

The other thing that popped up is that between this patch, the virtio
tracepoint there's now a 3rd patch from google Android to account xpu
buffer memory in some cases (but only some, only partially). So really
this gap-fillers here don't work, and we need something that really
looks at the entire problem and figures out how to account that
memory. Which is probably cgroups, but we'll see.

I asked John to set up some meeting at least with the Android side so
we can start to figure this out for real.
-Daniel

>
> Regards,
> Christian.
>
> >
> > Regards,
> > Hridya
> >
> >> So I'm leaning more towards "this sounds like it's going to be useful =
for
> >> Android only, nothing else" concern.
> >> -Daniel
> >>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
