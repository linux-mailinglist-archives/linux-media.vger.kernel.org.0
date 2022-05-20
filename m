Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA3352E02C
	for <lists+linux-media@lfdr.de>; Fri, 20 May 2022 00:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245608AbiESW6z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 18:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245598AbiESW6x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 18:58:53 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C8DA941AF
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 15:58:49 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id tk15so12550988ejc.6
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 15:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fbvRpFr5DPXTtOR44VCta4b2435YDPc6d32y8p5DMFs=;
        b=tmgzSvLs41etypUwVw6uvM4NJ7dps6ZyQj2aBbW7epcFgM1Ay51F0S7IjbCoJksZfX
         TTpFjuHjkEptjOiTlsli4tFh+oErHaBnqtMItPyxv2qy7VODo1p/EvoTTfwQwKwaDtxb
         dk32GAC35YE/UiJkyA28GkYicMdMnT9LP7CMNqwb2P7wDaRcMQdLF64WhHwAOsVqxEzb
         IvirbQNwC8JmFxmLhZwIKBA5IZSGNgSq9qJzWpO7P3/5qZEk4hYfsFqfvt5mHhY5wy7a
         Hb+gMTAQi/YzZ0omwdFPKdnq3EUQ2uM8UWqYpmjfHk2WfAxiHrxKonHfqn1Ynn5Acb+x
         QvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fbvRpFr5DPXTtOR44VCta4b2435YDPc6d32y8p5DMFs=;
        b=lkRj6i8gtbk3Fbs81xMOsAriqVmQ9LAQX92eSO0kgdHzIeDNRIfDpq845nWbj5UHwT
         oRoFqy3xLIsQ72QlrXuqvyDXzYtkwdB4ZUFx/MxkWXIAZarGwsJSr35BJHh2zxfOsTHO
         GMzggaGhe8oBwOgXVgWOtCcsqX6OjEmp3Yx9Dt/HZ7EqwWQ/PuXhYovX7lbeKfvMtZOa
         uQ03WHRFXNHKehntk3jYTewzAHl1efA7hHd6D3Mvo9luRg7UkDLyt3WY69ir8Nh1iFbe
         ld9NzE05FPWD4DxIqf5qtsttcrT+0nFB6UbK+Dhdn61Lphr/HappwGQ/yKOQ970HVcra
         gCTQ==
X-Gm-Message-State: AOAM5313fQaRG8rkvLTX9/Fh5dM84qriZpS2m8rlc6Mf359Pma+aS2Xk
        qJZUuo6MsCa8PPjyIrcR5fqolv8MTGox9V8mPP+CgA==
X-Google-Smtp-Source: ABdhPJyCspSO6uSSvdTwbgpo114K2n8Zu/UEIhiXBAFu3CbmO21LqPpQWV86fpjxbG/+XuAjm/dg3ve7EPV7qg0jVvo=
X-Received: by 2002:a17:907:3fa7:b0:6fe:8a4e:5ff1 with SMTP id
 hr39-20020a1709073fa700b006fe8a4e5ff1mr6285207ejc.665.1653001127748; Thu, 19
 May 2022 15:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220516171315.2400578-1-tjmercier@google.com>
 <175c5af3-9224-9c8e-0784-349dad9a2954@amd.com> <CABdmKX2GcgCs1xANYPBp8OEtk9qqH7AvCzpdppj9rHXvMqWSAw@mail.gmail.com>
 <0875fa95-3a25-a354-1433-201fca81ed3e@amd.com> <CABdmKX1+VYfdzyVYOS5MCsr4ptGTygmuUP9ikyh-vW6DgKk2kg@mail.gmail.com>
 <YoM9BAwybcjG7K/H@kroah.com> <d820893c-fa2e-3bac-88be-f39c06d89c01@amd.com>
 <CABdmKX2m1b1kdACKM19S+u9uR5RTy1UGMRgd+3QA_oAyCpeggg@mail.gmail.com> <7f895a99-adfa-bcbd-c130-a924c668b8af@amd.com>
In-Reply-To: <7f895a99-adfa-bcbd-c130-a924c668b8af@amd.com>
From:   "T.J. Mercier" <tjmercier@google.com>
Date:   Thu, 19 May 2022 15:58:36 -0700
Message-ID: <CABdmKX0XLvRZvXyiN0P_B-fUACiF5xwQ07+u_gaR+hDhu_x_TA@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: Move sysfs work out of DMA-BUF export path
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Kalesh Singh <kaleshsingh@google.com>,
        Minchan Kim <minchan@google.com>,
        Greg Kroah-Hartman <gregkh@google.com>,
        John Stultz <jstultz@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Hridya Valsaraju <hridya@google.com>, kernel-team@android.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 18, 2022 at 5:03 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 18.05.22 um 01:09 schrieb T.J. Mercier:
> > [SNIP]
> >>> Perhaps we should go just one step further and make a misc device nod=
e
> >>> for dmabug debugging information to be in and just have userspace
> >>> poll/read on the device node and we spit the info that used to be in
> >>> debugfs out through that?  That way this only affects systems when th=
ey
> >>> want to read the information and not normal code paths?  Yeah that's =
a
> >>> hack, but this whole thing feels overly complex now.
> >> Yeah, totally agree on the complexity note. I'm just absolutely not ke=
en
> >> to add hack over hack over hack to make something work which from my
> >> point of view has some serious issues with it's design.
> >>
> > Why is this patch a hack? We found a problem with the initial design
> > which nobody saw when it was originally created, and now we're trying
> > to address it within the constraints that exist.
>
> Well the issue is that you don't try to tackle the underlying problem,
> but rather just mitigate the unforeseen consequences. That is pretty
> clearly a hack to me.
>
> > Is there some other
> > solution to the problem of exports getting blocked that you would
> > suggest here?
>
> Well pretty much the same as Greg outlined as well. Go back to your
> drawing board and come back with a solution which does not need such
> workarounds.
>
> Alternatively you can give me a full overview of the design and explain
> why exactly that interface here is necessary in exactly that form.
>
We ended up here because we could not use debugfs.
https://source.android.com/setup/start/android-11-release#debugfs

Another idea was adding per-buffer stats to procfs, but that was not
an option since per-buffer stats are not process specific.

So it seemed like sysfs was an appropriate solution at the time. It
comes with a stable interface as a bonus, but with the limitation of 1
value per file this leads to creating lots of files in sysfs for all
dma buffers. This leads to increased kernfs lock contention, and
unfortunately we try to take the lock on the hot path.

With the description and links to the userspace code which actually
uses the feature I feel like that's a complete picture of what's
currently happening with this interface. If you could explain what
information is missing I'll do my best to provide it.
https://cs.android.com/android/platform/superproject/+/master:system/memory=
/libmeminfo/libdmabufinfo/dmabuf_sysfs_stats.cpp;l=3D55;drc=3D3f7db7aec60bb=
ba14c6dd81600820ed62fe3f475;bpv=3D0;bpt=3D1
https://cs.android.com/android/platform/superproject/+/master:system/memory=
/libmeminfo/libdmabufinfo/tools/dmabuf_dump.cpp;l=3D182;drc=3D3f7db7aec60bb=
ba14c6dd81600820ed62fe3f475;bpv=3D0;bpt=3D1
https://cs.android.com/android/platform/superproject/+/master:frameworks/na=
tive/cmds/dumpstate/dumpstate.cpp;drc=3D621533f895b30ca281e79a7a7c03eefd352=
359b5;l=3D1832-1833

> >> For example trying to do accounting based on DMA-bufs is extremely
> >> questionable to begin with. See a modern game for example can have
> >> between 10k and 100k of different buffers, reserving one file descript=
or
> >> for each of those objects is absolutely not going to work.
> >>
> >> So my request is to please describe your full use case and not just wh=
y
> >> you think this patch is justified.
> >>
> > The use case was described in the commit message when the feature was
> > initially added (after discussion about it on the list) including
> > links to code that uses the feature:
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e.kernel.org%2Fall%2F20210603214758.2955251-1-hridya%40google.com%2F&amp;da=
ta=3D05%7C01%7Cchristian.koenig%40amd.com%7C3f6e3e98fc6f45ead80d08da385a59e=
6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637884257979664387%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Di%2BSfpB%2B6iBolBHu6KrKH3njq0zo1SBbrKDHZ=
OjpsIks%3D&amp;reserved=3D0
>
> Yeah and to be honest I have the strong feeling now that this was
> absolutely not well thought through.

I'm open to working on a replacement for this if we can't find an
acceptable solution here, but I would appreciate some direction on
what would be acceptable. For example Greg's idea sounds workable, but
the question is if it mergeable?

> This description as well as the in
> kernel documentation are not even remotely sufficient to explain what
> you guys are doing with this.
>
> So please come up with a complete design description for both userspace
> and kernel why this interface here is necessary inside the upstream kerne=
l.
>
> If you can't convince me that this is a good idea I will just bluntly
> mark this DMA-buf sysfs interface as deprecated.
>
> Regards,
> Christian.
>
> >
> >
> >> Regards,
> >> Christian.
> >>
> >>> thanks,
> >>>
> >>> greg k-h
>
