Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DBE84EA98B
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 10:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234126AbiC2Ir0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 04:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234108AbiC2IrZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 04:47:25 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF6315A216
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 01:45:43 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id n35so9804475wms.5
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 01:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=leAuZREaw8nfEmtW7ruXdribbWRIO4GyRB3TM2WPrZU=;
        b=ZghBrot0nEslQiSM+TSX6PpqRLxe/Q+3+5NX2SpFBrdYSXyaBpHMuSMnr5V+9I3Yua
         HyBfoOWO9nwZ90vMB8Ib1/c9+lf70zDSinWodLKaHO8ldjLWzTzWgmOMWOrLlpUcaIt1
         4pVGrVtK1prnOvO1Z46KwrPj1DAyfL1wj7SCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=leAuZREaw8nfEmtW7ruXdribbWRIO4GyRB3TM2WPrZU=;
        b=nBgui4PBJGP3O8b1KKXlGyZ+CRFhDgFxhQ17j6Gr0ME+uOOlXn+HxWOyT1OsHxW/Ma
         kdWoP0DHR7sAVE5oqb9UHae78rudwlSoyy1P6qNKn4oRByRLu9YCLGcpvk2OpmXdt5H3
         kxw4L01N0AAixD/kUh6kH1CpZK/acA7nH/5wyC1S40UfbCrB2m5oaMv2512zxRv1HAF6
         xjwiEc45LwkLp1V3nsI50wIOed3xMpXlFGsOvGFMIjAiWiwaoxHjjfMJ+c/d2rD9OIn5
         gHzyiolT9A0M3mGeZ59oJzDo+6isO0oOmIoWHeWy2hy7/OwO+xjdlKI4KWrbR0xOiKNc
         78jA==
X-Gm-Message-State: AOAM532LJTahGdo0/oyWJoO5+Lq22wARHot/URIA3V+vlETMEH2Tiwbd
        q71KBRW5zejJRcktuQcgeEupAA==
X-Google-Smtp-Source: ABdhPJyG1VjHY/gKAL0uy24McEyS4tmV6EaZxeg0kqJfrAkqNPPj5LI20D6nqqJeMCLTS54GwLIoOQ==
X-Received: by 2002:a7b:ce04:0:b0:38c:6c34:9aac with SMTP id m4-20020a7bce04000000b0038c6c349aacmr5261977wmc.142.1648543541654;
        Tue, 29 Mar 2022 01:45:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y6-20020a05600015c600b00203fa70b4ebsm18084964wry.53.2022.03.29.01.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 01:45:41 -0700 (PDT)
Date:   Tue, 29 Mar 2022 10:45:39 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Zhenneng Li <lizhenneng@kylinos.cn>,
        Alex Deucher <alexander.deucher@amd.com>,
        Pan Xinhui <Xinhui.Pan@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Evan Quan <evan.quan@amd.com>,
        Guchun Chen <guchun.chen@amd.com>,
        Jack Zhang <Jack.Zhang1@amd.com>,
        Lijo Lazar <lijo.lazar@amd.com>,
        Kevin Wang <kevin1.wang@amd.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH next,v2] kernel: Add 1 ms delay to init handler to fix s3
 resume hang
Message-ID: <YkLHMxf/G+TgXBsJ@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Zhenneng Li <lizhenneng@kylinos.cn>,
        Alex Deucher <alexander.deucher@amd.com>,
        Pan Xinhui <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Evan Quan <evan.quan@amd.com>, Guchun Chen <guchun.chen@amd.com>,
        Jack Zhang <Jack.Zhang1@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
        Kevin Wang <kevin1.wang@amd.com>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20220329030547.286265-1-lizhenneng@kylinos.cn>
 <ca4bd694-4685-a76c-25ae-65627c36d142@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca4bd694-4685-a76c-25ae-65627c36d142@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 29, 2022 at 08:20:24AM +0200, Christian König wrote:
> Am 29.03.22 um 05:05 schrieb Zhenneng Li:
> > This is a workaround for s3 resume hang for r7 340(amdgpu).
> > When we test s3 with r7 340 on arm64 platform, graphics card will hang up,
> > the error message are as follows:
> > Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.599374][ 7] [  T291] amdgpu 0000:02:00.0: fb0: amdgpudrmfb frame buffer device
> > Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.612869][ 7] [  T291] [drm:amdgpu_device_ip_late_init [amdgpu]] *ERROR* late_init of IP block <si_dpm> failed -22
> > Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.623392][ 7] [  T291] amdgpu 0000:02:00.0: amdgpu_device_ip_late_init failed
> > Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.630696][ 7] [  T291] amdgpu 0000:02:00.0: Fatal error during GPU init
> > Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.637477][ 7] [  T291] [drm] amdgpu: finishing device.
> > 
> > On the following hardware:
> > lspci -nn -s 05:00.0
> > 05:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Oland [Radeon HD 8570 / R7 240/340 / Radeon 520 OEM] [1002:6611] (rev 87)
> 
> Well that's rather funny and certainly a NAK. To recap you are adding a
> delay to a delayed work handler. In other words you could delay the work
> handler in the first place :)
> 
> But this is not the reason why that here is a NAK. The more obvious problem
> is that we seem to have a race between the DPM code kicking in to save power
> after driver load and the asynchronous testing if userspace command
> submission works.
> 
> Adding the delay here works around that for the IB submission, but there can
> be other things going on in parallel which can fail as well.

Yeah standard pattern for this is to refcount your dpm code (using power
domains or runtime pm ideally or hand-rolled if you have to). And then
grabbing a dpm reference before you launch that work, and dropping that
when the work has finished.

That gives you a nice clean way to handle all these problems around "right
now I'm really not ready to allow low power states" in a very clean
fashion. arm-soc drivers go totally overboard on this with runtime pm on
all the chip components, that's maybe a bit much but afaiui we could do it
on big pci drivers with power domains too :-)

Also with power domains you get autosuspend delay timers for free and
tunable in sysfs ...

Cheers, Daniel

> 
> Please rather open up a bug report instead.
> 
> Regards,
> Christian.
> 
> > 
> > Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index 3987ecb24ef4..1eced991b5b2 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -2903,6 +2903,8 @@ static void amdgpu_device_delayed_init_work_handler(struct work_struct *work)
> >   		container_of(work, struct amdgpu_device, delayed_init_work.work);
> >   	int r;
> > +	mdelay(1);
> > +
> >   	r = amdgpu_ib_ring_tests(adev);
> >   	if (r)
> >   		DRM_ERROR("ib ring test failed (%d).\n", r);
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
