Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9D042D6B4A
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 00:38:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388556AbgLJW6V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 17:58:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728584AbgLJWzN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 17:55:13 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D52C0619D7
        for <linux-media@vger.kernel.org>; Thu, 10 Dec 2020 14:42:33 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id w79so6704167qkb.5
        for <linux-media@vger.kernel.org>; Thu, 10 Dec 2020 14:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BI42y0NL4g9pgxSiCUPEnrdmXwNVwllMLibIxfqxMAE=;
        b=hWMsNOC78oPCR/5SbuVMdo29OQDG3LMI1Knmo1sKFCQLyigIG4vSOWQB5xY6tp8cU+
         77Z8uG/aPnl2cGAEAmpDq76vp2e71hOkDQQAkwfJgpJYru1alEkjWhfQ6bHjPtzIyCS9
         b+Hs8TTIVwUxiv7jNe3RMNaOlKh2oyjH1g4P4BoUKdwVR7/UQI7veEed1ZexzU24kbw8
         UpV5cQ2SJ0IRPENlPCcfFgCEUQi3mbkX/YJMbCNFTg4oMKCRK1Xd1S3xGkVeiFbfTIvc
         kq0UJFcKGNMB3ngzzV9qSQBRsz5C7c9UcOilExHurYt7II0zPp1kOdr07XcXXgaWio9z
         GU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BI42y0NL4g9pgxSiCUPEnrdmXwNVwllMLibIxfqxMAE=;
        b=eoH3T2nO1CsXgTFr12/2pQ2qsM8EhnZYey3/vFVmJjFtfoa8ILCRAhX98fjvHfvfPB
         UBBBqco2a3U93IW72xl2C/R7+TfABKp9NH+F96wzyFIi6zcUkafgrpiD/KwINQ9lopQj
         O7wMwZNBuESQjOI3hoOoyYNx1Lfp5A/uUG1cZdAgM1QXOZQ2f0ExJSuKsxc1uGva3lH+
         QzPEjpca7mPRCUmrcoDu/SV7bxZjDAzJeyaDZtIJDvt5S5Amj5yYidXfHBaQsGmcT2Lj
         InrdKPRJgvndETJk3z05EzPkCAQaKlRgzycs0PeDVvIfFsntdiPyP0Y3t+vTF+ymgA4z
         w/tw==
X-Gm-Message-State: AOAM531yW4Tz4PhgZg5HZFi8VQHp/ZEG9QAZQCSt4Jrkcqo2K0fKfyBK
        nH05am5Og4COUX9CYn7p39vP5iUj+etLcF6h/h1LxA==
X-Google-Smtp-Source: ABdhPJyssOsPAM+0T8O2ecn5LMu0P4i9w+iyWsreu7x70gwVAySfKdx+0tWzoyaCLA9gf8su9JPsj/jlR1Tal3U3Zo4=
X-Received: by 2002:a37:a80a:: with SMTP id r10mr11644017qke.467.1607640152596;
 Thu, 10 Dec 2020 14:42:32 -0800 (PST)
MIME-Version: 1.0
References: <20201210044400.1080308-1-hridya@google.com> <b5adfe46-8615-5821-d092-2b93feed5b79@amd.com>
 <X9H0JREcdxDsMtLX@kroah.com> <20201210102727.GE401619@phenom.ffwll.local>
 <X9H+3AP1q39aMxeb@kroah.com> <f95ee5dc-62f8-4870-11e4-3513dc8382ef@amd.com>
In-Reply-To: <f95ee5dc-62f8-4870-11e4-3513dc8382ef@amd.com>
From:   Hridya Valsaraju <hridya@google.com>
Date:   Thu, 10 Dec 2020 14:41:56 -0800
Message-ID: <CA+wgaPPtoz_JSAwsVVpFGLrcrO8-tAGD+gdrsWmBA3jpidigzQ@mail.gmail.com>
Subject: Re: [PATCH] dmabuf: Add the capability to expose DMA-BUF stats in sysfs
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org,
        Android Kernel Team <kernel-team@android.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks again for the reviews!

On Thu, Dec 10, 2020 at 3:03 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 10.12.20 um 11:56 schrieb Greg KH:
> > On Thu, Dec 10, 2020 at 11:27:27AM +0100, Daniel Vetter wrote:
> >> On Thu, Dec 10, 2020 at 11:10:45AM +0100, Greg KH wrote:
> >>> On Thu, Dec 10, 2020 at 10:58:50AM +0100, Christian K=C3=B6nig wrote:
> >>>> In general a good idea, but I have a few concern/comments here.
> >>>>
> >>>> Am 10.12.20 um 05:43 schrieb Hridya Valsaraju:
> >>>>> This patch allows statistics to be enabled for each DMA-BUF in
> >>>>> sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> >>>>>
> >>>>> The following stats will be exposed by the interface:
> >>>>>
> >>>>> /sys/kernel/dmabuf/<inode_number>/exporter_name
> >>>>> /sys/kernel/dmabuf/<inode_number>/size
> >>>>> /sys/kernel/dmabuf/<inode_number>/dev_map_info
> >>>>>
> >>>>> The inode_number is unique for each DMA-BUF and was added earlier [=
1]
> >>>>> in order to allow userspace to track DMA-BUF usage across different
> >>>>> processes.
> >>>>>
> >>>>> Currently, this information is exposed in
> >>>>> /sys/kernel/debug/dma_buf/bufinfo.
> >>>>> However, since debugfs is considered unsafe to be mounted in produc=
tion,
> >>>>> it is being duplicated in sysfs.
> >>>> Mhm, this makes it part of the UAPI. What is the justification for t=
his?
> >>>>
> >>>> In other words do we really need those debug information in a produc=
tion
> >>>> environment?
> >>> Production environments seem to want to know who is using up memory :=
)
> >> This only shows shared memory, so it does smell a lot like $specific_i=
ssue
> >> and we're designing a narrow solution for that and then have to carry =
it
> >> forever.
> > I think the "issue" is that this was a feature from ion that people
> > "missed" in the dmabuf move.  Taking away the ability to see what kind
> > of allocations were being made didn't make a lot of debugging tools
> > happy :(
>
> Yeah, that is certainly a very valid concern.
>
> > But Hridya knows more, she's been dealing with the transition for a lon=
g
> > time now.

Currently, telemetry tools capture this information(along with other
memory metrics) periodically as well as on important events like a
foreground app kill (which might have been triggered by an LMK). We
would also like to get a snapshot of the system memory usage on other
events such as OOM kills and ANRs.

> >
> >> E.g. why is the list of attachments not a sysfs link? That's how we
> >> usually expose struct device * pointers in sysfs to userspace, not as =
a
> >> list of things.
> > These aren't struct devices, so I don't understand the objection here.
> > Where else could these go in sysfs?
>
> Sure they are! Just take a look at an attachment:
>
> struct dma_buf_attachment {
>           struct dma_buf *dmabuf;
>           struct device *dev;
>
> This is the struct device which is importing the buffer and the patch in
> discussion is just printing the name of this device into sysfs.

I actually did not know that this is not ok to do. I will change it in
the next version of the patch to be sysfs links instead.

>
> >> Furthermore we don't have the exporter device covered anywhere, how is
> >> that tracked? Yes Android just uses ion for all shared buffers, but th=
at's
> >> not how all of linux userspace works.
> > Do we have the exporter device link in the dmabuf interface?  If so,
> > great, let's use that, but for some reason I didn't think it was there.
>
> Correct, since we don't really need a device as an exporter (it can just
> be a system heap as well) we only have a const char* as name for the
> exporter.

Yes, the file exporter_name prints out this information.

>
> >> Then I guess there's the mmaps, you can fish them out of procfs. A too=
l
> >> which collects all that information might be useful, just as demonstra=
tion
> >> of how this is all supposed to be used.
> > There's a script somewhere that does this today, again, Hridya knows
> > more.

That is correct, we do have a tool in AOSP that gathers the
per-process DMA-BUF map stats from procfs.
https://android.googlesource.com/platform/system/memory/libmeminfo/+/refs/h=
eads/master/libdmabufinfo/tools/dmabuf_dump.cpp

When I send the next revision of the patch, I will also include links
to AOSP CLs that show the usage for the sysfs files.

> >
> >> There's also some things to make sure we're at least having thought ab=
out
> >> how other things fit in here. E.d. dma_resv attached to the dma-buf
> >> matters in general a lot. It doesn't matter on Android because
> >> everything's pinned all the time anyway.

I see your point Daniel!  I will make the interface extendable in the
next version of the patch.

> >>
> >> Also I thought sysfs was one value one file, dumping an entire list in=
to
> >> dev_info_map with properties we'll need to extend (once you care about
> >> dma_resv you also want to know which attachments are dynamic) does not
> >> smell like sysfs design at all.
> > sysfs is one value per file, what is being exported that is larger than
> > that here?  Did I miss something on review?
>
> See this chunk here:
>
> +
> +    list_for_each_entry(attachment, &dmabuf->attachments, node) {
> +        if (attachment->map_counter) {
> +            ret +=3D sysfs_emit_at(buf, ret, "%s ",
> +                         dev_name(attachment->dev));
> +        }
> +    }
>
> And yes now that Daniel mentioned that it looks like a sysfs rules
> violation to me as well.

Sysfs rules do seem to allow an array of similar values in one file
https://elixir.bootlin.com/linux/v5.10-rc7/source/Documentation/filesystems=
/sysfs.rst#L63
However, I agree that we should change it so that it can be expanded
easily in the future. I will fix it in the next version. Thank you all
for pointing it out!

Regards,
Hridya

>
> Regards,
> Christian.
>
>
> >
> > thanks,
> >
> > greg k-h
>
