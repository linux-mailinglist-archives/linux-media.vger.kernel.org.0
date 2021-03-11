Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4D73337669
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 16:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233686AbhCKPC5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 10:02:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233582AbhCKPC0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 10:02:26 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47FCEC061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 07:02:26 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id r17so46780509ejy.13
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 07:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gXAGBeqlgyf6WoQP72pNeSpQgoAtPfYQxn1Zx/OxGXA=;
        b=TdgUqRQjhkpcX3i4KO9xpGkYINXAYYI2sRjQNydqKCpSMJhHJcaaZDxlZ2hhp45NxJ
         ToHf4STUfuUP/xKJFawD44ZpTyXr/KesyFBxWPF0A6MPK3zvYlONOiNykf/yjHbZq2mg
         4XO3cdmAPnXL45axUNe8sysY090rzGmZcR+6kQ2ZU8TfERMFpolPeAGtKMXr2m1hLhOw
         EyoXganQqwqm2eJ/jUS6WWsNQcIR2IxRvkH00Q6lyAj6nttmWVNtTGPr5TcD6mFqBG2+
         ShKDKQ9no6BJFD805g2FSDqjn9wG4YBXvdK9WmfUDqf8oDT5EH/G+0cAudu4z2e2T4GZ
         N97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gXAGBeqlgyf6WoQP72pNeSpQgoAtPfYQxn1Zx/OxGXA=;
        b=kSUuk6wkFDnQcJ36oqV1P4ubw7+wx5cafF9gcHMUwSmZ6M1zrvM6duo2v6T9dvW7EX
         /eZtyhXTE9fnX3KJ+8Gv6QzgTmxAtOEXHnruNRJnzfsvh/jI+6AI62by6L6S/hknl1BU
         1aT5Zia1Z8v19xSV+TUqa9AcaSWqW3wYQJtqYw4/sP5fkQKTgISQ/ss/5+ybCgFUBT5u
         8SovQhMJvu//fXEQ2Qzuy0mhBmbe4wIprI6BMrruju1q4T5POY3tFUsDelJ0i3HMSGjc
         w/oK4LDLpwVvUYPEdhQPD7AvipsoaYYcEdYxb5l1cmftCUIZ/fvfJmDj7dJpBA3H+Zhr
         XBLQ==
X-Gm-Message-State: AOAM531opgyyWLPKcCp9RpQ8wIxCGWPbnWdrPw1WSVluUTClBERu2Az3
        z1mx1ahfciU1zqX8mZSMf/PcJ+n7iCxG7ofKbzXFXw==
X-Google-Smtp-Source: ABdhPJwjyQf5OR9+VAVvMfJiKfK4k/G7OeOAbjpSlgfI0GLPpoln68C8Yq6/HN91ESxzpvtx+LpQAlJ+oX6vvvcOPa8=
X-Received: by 2002:a17:906:7b8d:: with SMTP id s13mr3505288ejo.247.1615474944849;
 Thu, 11 Mar 2021 07:02:24 -0800 (PST)
MIME-Version: 1.0
References: <20210310163655.2591893-1-daniel@qtec.com> <CADnq5_PmbXBaziCEqRODb_DvtKaw9ucXXjkdmdj9N_R8P-9Jcw@mail.gmail.com>
 <CAH1Ww+T4WwLzg_nnF=1sjm9LW9wCjFb0X9c=qmuubvMqJdW4PA@mail.gmail.com> <CAH1Ww+QiAyfQL_bf1u=zLiT=ayKFWA0Fr2n5sBHUxfpzxcPbrg@mail.gmail.com>
In-Reply-To: <CAH1Ww+QiAyfQL_bf1u=zLiT=ayKFWA0Fr2n5sBHUxfpzxcPbrg@mail.gmail.com>
From:   Alexandre Desnoyers <alex@qtec.com>
Date:   Thu, 11 Mar 2021 16:02:23 +0100
Message-ID: <CAN22YZcnMzefgHu9FVPGEf73SKjar2tLJO-jvpYAqNJSH4F_qA@mail.gmail.com>
Subject: Re: [PATCH]] drm/amdgpu/gfx9: add gfxoff quirk
To:     Daniel Gomez <daniel@qtec.com>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Huang Rui <ray.huang@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
        Dennis Li <Dennis.Li@amd.com>, Monk Liu <Monk.Liu@amd.com>,
        Yintian Tao <yttao@amd.com>, Guchun Chen <guchun.chen@amd.com>,
        Evan Quan <evan.quan@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 11, 2021 at 2:49 PM Daniel Gomez <daniel@qtec.com> wrote:
>
> On Thu, 11 Mar 2021 at 10:09, Daniel Gomez <daniel@qtec.com> wrote:
> >
> > On Wed, 10 Mar 2021 at 18:06, Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > On Wed, Mar 10, 2021 at 11:37 AM Daniel Gomez <daniel@qtec.com> wrote:
> > > >
> > > > Disabling GFXOFF via the quirk list fixes a hardware lockup in
> > > > Ryzen V1605B, RAVEN 0x1002:0x15DD rev 0x83.
> > > >
> > > > Signed-off-by: Daniel Gomez <daniel@qtec.com>
> > > > ---
> > > >
> > > > This patch is a continuation of the work here:
> > > > https://lkml.org/lkml/2021/2/3/122 where a hardware lockup was discussed and
> > > > a dma_fence deadlock was provoke as a side effect. To reproduce the issue
> > > > please refer to the above link.
> > > >
> > > > The hardware lockup was introduced in 5.6-rc1 for our particular revision as it
> > > > wasn't part of the new blacklist. Before that, in kernel v5.5, this hardware was
> > > > working fine without any hardware lock because the GFXOFF was actually disabled
> > > > by the if condition for the CHIP_RAVEN case. So this patch, adds the 'Radeon
> > > > Vega Mobile Series [1002:15dd] (rev 83)' to the blacklist to disable the GFXOFF.
> > > >
> > > > But besides the fix, I'd like to ask from where this revision comes from. Is it
> > > > an ASIC revision or is it hardcoded in the VBIOS from our vendor? From what I
> > > > can see, it comes from the ASIC and I wonder if somehow we can get an APU in the
> > > > future, 'not blacklisted', with the same problem. Then, should this table only
> > > > filter for the vendor and device and not the revision? Do you know if there are
> > > > any revisions for the 1002:15dd validated, tested and functional?
> > >
> > > The pci revision id (RID) is used to specify the specific SKU within a
> > > family.  GFXOFF is supposed to be working on all raven variants.  It
> > > was tested and functional on all reference platforms and any OEM
> > > platforms that launched with Linux support.  There are a lot of
> > > dependencies on sbios in the early raven variants (0x15dd), so it's
> > > likely more of a specific platform issue, but there is not a good way
> > > to detect this so we use the DID/SSID/RID as a proxy.  The newer raven
> > > variants (0x15d8) have much better GFXOFF support since they all
> > > shipped with newer firmware and sbios.
> >
> > We took one of the first reference platform boards to design our
> > custom board based on the V1605B and I assume it has one of the early 'unstable'
> > raven variants with RID 0x83. Also, as OEM we are in control of the bios
> > (provided by insyde) but I wasn't sure about the RID so, thanks for the
> > clarification. Is there anything we can do with the bios to have the GFXOFF
> > enabled and 'stable' for this particular revision? Otherwise we'd need to add
> > the 0x83 RID to the table. Also, there is an extra ']' in the patch
> > subject. Sorry
> > for that. Would you need a new patch in case you accept it with the ']' removed?
> >
> > Good to hear that the newer raven versions have better GFXOFF support.
>
> Adding Alex Desnoyer to the loop as he is the electronic/hardware and
> bios responsible so, he can
> provide more information about this.

Hello everyone,

We, Qtechnology, are the OEM of the hardware platform where we
originally discovered the bug.  Our platform is based on the AMD
Dibbler V-1000 reference design, with the latest Insyde BIOS release
available for the (now unsupported) Dibbler platform.  We have the
Insyde BIOS source code internally, so we can make some modifications
as needed.

The last test that Daniel and myself performed was on a standard
Dibbler PCB rev.B1 motherboard (NOT our platform), and using the
corresponding latest AMD released BIOS "RDB1109GA".  As Daniel wrote,
the hardware lockup can be reproduced on the Dibbler, even if it has a
different RID that our V1605B APU.

We also have a Neousys Technology POC-515 embedded computer (V-1000,
V1605B) in our office.  The Neousys PC also uses Insyde BIOS.  This
computer is also locking-up in the test.
https://www.neousys-tech.com/en/product/application/rugged-embedded/poc-500-amd-ryzen-ultra-compact-embedded-computer


Digging into the BIOS source code, the only reference to GFXOFF is in
the SMU and PSP firmware release notes, where some bug fixes have been
mentioned for previous SMU/PSP releases.  After a quick "git grep -i
gfx | grep -i off", there seems to be no mention of GFXOFF in the
Insyde UEFI (inluding AMD PI) code base.  I would appreciate any
information regarding BIOS modification needed to make the GFXOFF
feature stable.  As you (Alex Deucher) mentionned, it should be
functional on all AMD Raven reference platforms.


Regards,

Alexandre Desnoyers


>
> I've now done a test on the reference platform (dibbler) with the
> latest bios available
> and the hw lockup can be also reproduced with the same steps.
>
> For reference, I'm using mainline kernel 5.12-rc2.
>
> [    5.938544] [drm] initializing kernel modesetting (RAVEN
> 0x1002:0x15DD 0x1002:0x15DD 0xC1).
> [    5.939942] amdgpu: ATOM BIOS: 113-RAVEN-11
>
> As in the previous cases, the clocks go to 100% of usage when the hang occurs.
>
> However, when the gpu hangs, dmesg output displays the following:
>
> [ 1568.279847] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
> timeout, signaled seq=188, emitted seq=191
> [ 1568.434084] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
> information: process Xorg pid 311 thread Xorg:cs0 pid 312
> [ 1568.279847] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
> timeout, signaled seq=188, emitted seq=191
> [ 1568.434084] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
> information: process Xorg pid 311 thread Xorg:cs0 pid 312
> [ 1568.507000] amdgpu 0000:01:00.0: amdgpu: GPU reset begin!
> [ 1628.491882] rcu: INFO: rcu_sched self-detected stall on CPU
> [ 1628.491882] rcu:     3-...!: (665 ticks this GP)
> idle=f9a/1/0x4000000000000000 softirq=188533/188533 fqs=15
> [ 1628.491882] rcu: rcu_sched kthread timer wakeup didn't happen for
> 58497 jiffies! g726761 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
> [ 1628.491882] rcu:     Possible timer handling issue on cpu=2
> timer-softirq=55225
> [ 1628.491882] rcu: rcu_sched kthread starved for 58500 jiffies!
> g726761 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=2
> [ 1628.491882] rcu:     Unless rcu_sched kthread gets sufficient CPU
> time, OOM is now expected behavior.
> [ 1628.491882] rcu: RCU grace-period kthread stack dump:
> [ 1628.491882] rcu: Stack dump where RCU GP kthread last ran:
> [ 1808.518445] rcu: INFO: rcu_sched self-detected stall on CPU
> [ 1808.518445] rcu:     3-...!: (2643 ticks this GP)
> idle=f9a/1/0x4000000000000000 softirq=188533/188533 fqs=15
> [ 1808.518445] rcu: rcu_sched kthread starved for 238526 jiffies!
> g726761 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=2
> [ 1808.518445] rcu:     Unless rcu_sched kthread gets sufficient CPU
> time, OOM is now expected behavior.
> [ 1808.518445] rcu: RCU grace-period kthread stack dump:
> [ 1808.518445] rcu: Stack dump where RCU GP kthread last ran:
>
> >
> > Daniel
> >
> > >
> > > Alex
> > >
> > >
> > > >
> > > > Logs:
> > > > [   27.708348] [drm] initializing kernel modesetting (RAVEN
> > > > 0x1002:0x15DD 0x1002:0x15DD 0x83).
> > > > [   27.789156] amdgpu: ATOM BIOS: 113-RAVEN-115
> > > >
> > > > Thanks in advance,
> > > > Daniel
> > > >
> > > >  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > > > index 65db88bb6cbc..319d4b99aec8 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > > > @@ -1243,6 +1243,8 @@ static const struct amdgpu_gfxoff_quirk amdgpu_gfxoff_quirk_list[] = {
> > > >         { 0x1002, 0x15dd, 0x103c, 0x83e7, 0xd3 },
> > > >         /* GFXOFF is unstable on C6 parts with a VBIOS 113-RAVEN-114 */
> > > >         { 0x1002, 0x15dd, 0x1002, 0x15dd, 0xc6 },
> > > > +       /* GFXOFF provokes a hw lockup on 83 parts with a VBIOS 113-RAVEN-115 */
> > > > +       { 0x1002, 0x15dd, 0x1002, 0x15dd, 0x83 },
> > > >         { 0, 0, 0, 0, 0 },
> > > >  };
> > > >
> > > > --
> > > > 2.30.1
> > > >
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
