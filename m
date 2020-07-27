Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C31D22EDDE
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 15:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729172AbgG0NtO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 09:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgG0NtM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 09:49:12 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CFBDC061794
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 06:49:12 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id o10so2512381edh.6
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 06:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5nrJGkR5gzoJoAzFw0QkQIZLHmzb77Jw0yeZu9JZot4=;
        b=dFtmj2Pf6AsbS3ZvrmOl3FfSHcXv98akIbtsWzzmClw206P7VO9+ayWWQx9sByRB4h
         IvdlzRxURd8G6ieLgdpRGeBUc1taiMQV3jsbSXZC2A1tKVunmUZsw/k3TKGTTsczi9M8
         hr6HisxYH5uZ1vlNHNfdpSAqCLg7wwALQkKrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5nrJGkR5gzoJoAzFw0QkQIZLHmzb77Jw0yeZu9JZot4=;
        b=ir1vTd3xFXtTIkKXqcam539fDWaQTEeJT4xzHqi5Ait8ok/ivqsfhGe2VbKeCT9wYT
         ZS2UWeb9ZVvkFjPjaNHLE/meG9aQ8aluEioSHLU+x6AbEUopCq/fwCKagRjNA7SnuTFo
         3dNXtX9N7lrsECU1B74rwzo9qTi+t9g8AeHTF8/MDenY8YhfXK93ZTlBh2Ov5oaZKSaY
         RTrSxCfNl8qbOvpDSLgIlNc4zLbacAxggkb+hNDo+UwP2ZT+CEyXu0/8PGXmPjlQsI+q
         6T+yNNOvbucCyyDxRllOfH4gsZL/B3XT3n1/hJYBljDtk7uJLdJb1TfaIV0PIY3e8Kc/
         Imww==
X-Gm-Message-State: AOAM532Nt1wmoaQoflAVOXrw56Ybrc6If90bKJkawqXQvgKHt5DYMEZa
        3XUD5Op6zxRGvv8IC257qgedm19LpFk4NQ==
X-Google-Smtp-Source: ABdhPJxuZHDTRfUVR4n1aRiEXpW8/7/0ZXTbYPuZWRyPsx05VXC5T2KCIenQws9oKxpUkVDQmNxisA==
X-Received: by 2002:a05:6402:7cf:: with SMTP id u15mr13203901edy.360.1595857750429;
        Mon, 27 Jul 2020 06:49:10 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id k7sm1940973edr.76.2020.07.27.06.49.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 06:49:09 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id f1so14423493wro.2
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 06:49:09 -0700 (PDT)
X-Received: by 2002:adf:82b2:: with SMTP id 47mr19927685wrc.17.1595857749000;
 Mon, 27 Jul 2020 06:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200426022650.10355-1-xc-racer2@live.ca> <BN6PR04MB0660DB1C884EE9F9C7D94857A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <20200707184412.GJ2621465@chromium.org> <BN6PR04MB0660C1942C3738F9F9D1AAAFA3620@BN6PR04MB0660.namprd04.prod.outlook.com>
 <CAAFQd5ABvEnt7QQHmwwFyCqRLMabE=Vs_e7FrG3fMmrAWgD_bQ@mail.gmail.com> <BN6PR04MB066075594507854A6619A3E3A3770@BN6PR04MB0660.namprd04.prod.outlook.com>
In-Reply-To: <BN6PR04MB066075594507854A6619A3E3A3770@BN6PR04MB0660.namprd04.prod.outlook.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 27 Jul 2020 15:48:57 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BAb+TcfMf3C_Mczo4+USsP5MzJmFj12eVPER9f-gJ41A@mail.gmail.com>
Message-ID: <CAAFQd5BAb+TcfMf3C_Mczo4+USsP5MzJmFj12eVPER9f-gJ41A@mail.gmail.com>
Subject: Re: [PATCH 10/11] media: exynos4-is: Prevent duplicate call to media_pipeline_stop
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, kgene@kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jul 25, 2020 at 1:46 AM Jonathan Bakker <xc-racer2@live.ca> wrote:
>
> Hi Tomasz,
>
> On 2020-07-20 6:10 a.m., Tomasz Figa wrote:
> > On Sat, Jul 11, 2020 at 8:17 PM Jonathan Bakker <xc-racer2@live.ca> wro=
te:
> >>
> >> Hi Tomasz,
> >>
> >> On 2020-07-07 11:44 a.m., Tomasz Figa wrote:
> >>> Hi Jonathan,
> >>>
> >>> On Sat, Apr 25, 2020 at 07:26:49PM -0700, Jonathan Bakker wrote:
> >>>> media_pipeline_stop can be called from both release and streamoff,
> >>>> so make sure they're both protected under the streaming flag and
> >>>> not just one of them.
> >>>
> >>> First of all, thanks for the patch.
> >>>
> >>> Shouldn't it be that release calls streamoff, so that only streamoff
> >>> is supposed to have the call to media_pipeline_stop()?
> >>>
> >>
> >> I can't say that I understand the whole media subsystem enough to know=
 :)
> >> Since media_pipeline_start is called in streamon, it makes sense that =
streamoff
> >> should have the media_pipeline_stop call.  However, even after removin=
g the call
> >> in fimc_capture_release I'm still getting a backtrace such as
> >>
> >> [   73.843117] ------------[ cut here ]------------
> >> [   73.843251] WARNING: CPU: 0 PID: 1575 at drivers/media/mc/mc-entity=
.c:554 media_pipeline_stop+0x20/0x2c [mc]
> >> [   73.843265] Modules linked in: s5p_fimc v4l2_fwnode exynos4_is_comm=
on videobuf2_dma_contig pvrsrvkm_s5pv210_sgx540_120 videobuf2_memops v4l2_m=
em2mem brcmfmac videobuf2_v4l2 videobuf2_common hci_uart sha256_generic lib=
sha256 btbcm bluetooth cfg80211 brcmutil ecdh_generic ecc ce147 libaes s5ka=
3dfx videodev atmel_mxt_ts mc pwm_vibra rtc_max8998
> >> [   73.843471] CPU: 0 PID: 1575 Comm: v4l2-ctl Not tainted 5.7.0-14534=
-g2b33418b254e-dirty #669
> >> [   73.843487] Hardware name: Samsung S5PC110/S5PV210-based board
> >> [   73.843562] [<c010c7c4>] (unwind_backtrace) from [<c010a120>] (show=
_stack+0x10/0x14)
> >> [   73.843613] [<c010a120>] (show_stack) from [<c0117038>] (__warn+0xb=
c/0xd4)
> >> [   73.843661] [<c0117038>] (__warn) from [<c01170b0>] (warn_slowpath_=
fmt+0x60/0xb8)
> >> [   73.843734] [<c01170b0>] (warn_slowpath_fmt) from [<bf00c20c>] (med=
ia_pipeline_stop+0x20/0x2c [mc])
> >> [   73.843867] [<bf00c20c>] (media_pipeline_stop [mc]) from [<bf145c48=
>] (fimc_cap_streamoff+0x38/0x48 [s5p_fimc])
> >> [   73.844109] [<bf145c48>] (fimc_cap_streamoff [s5p_fimc]) from [<bf0=
3cbf4>] (__video_do_ioctl+0x220/0x448 [videodev])
> >> [   73.844308] [<bf03cbf4>] (__video_do_ioctl [videodev]) from [<bf03d=
600>] (video_usercopy+0x114/0x498 [videodev])
> >> [   73.844438] [<bf03d600>] (video_usercopy [videodev]) from [<c020502=
4>] (ksys_ioctl+0x20c/0xa10)
> >> [   73.844484] [<c0205024>] (ksys_ioctl) from [<c0100060>] (ret_fast_s=
yscall+0x0/0x54)
> >> [   73.844505] Exception stack(0xe5083fa8 to 0xe5083ff0)
> >> [   73.844546] 3fa0:                   0049908d bef8f8c0 00000003 4004=
5613 bef8d5ac 004c1d16
> >> [   73.844590] 3fc0: 0049908d bef8f8c0 bef8f8c0 00000036 bef8d5ac 0000=
0000 b6d6b320 bef8faf8
> >> [   73.844620] 3fe0: 004e3ed4 bef8c718 004990bb b6f00d0a
> >> [   73.844642] ---[ end trace e6a4a8b2f20addd4 ]---
> >>
> >> The command I'm using for testing is
> >>
> >> v4l2-ctl --verbose -d 1 --stream-mmap=3D3 --stream-skip=3D2 --stream-t=
o=3D./test.yuv --stream-count=3D1
> >>
> >> Since I noticed that the streaming flag was being checked fimc_capture=
_release
> >> but not in fimc_cap_streamoff, I assumed that it was simply a missed c=
heck.  Comparing
> >> with other drivers, they seem to call media_pipeline_stop in their vb2=
_ops stop_streaming
> >> callback.
> >
> > vb2 does a lot of state handling internally and makes sure that driver
> > ops are not called when unnecessary, preventing double calls for
> > example. I suppose it could be a better place to stop the pipeline
> > indeed. However, ...
> >
> >>
> >> I'm willing to test various options
> >>
> >
> > I think it could make sense to add something like WARN_ON(1) inside
> > media_pipeline_stop() and then check where the first call came from.
>
> Here's the results of that:
>
> [   69.876823] ------------[ cut here ]------------
> [   69.876962] WARNING: CPU: 0 PID: 1566 at drivers/media/mc/mc-entity.c:=
550 __media_pipeline_stop+0x24/0xfc [mc]
> [   69.876976] Modules linked in: s5p_fimc v4l2_fwnode exynos4_is_common =
videobuf2_dma_contig videobuf2_memops v4l2_mem2mem brcmfmac videobuf2_v4l2 =
pvrsrvkm_s5pv210_sgx540_120 videobuf2_common hci_uart sha256_generic btbcm =
libsha256 bluetooth cfg80211 ce147 brcmutil s5ka3dfx ecdh_generic ecc libae=
s videodev atmel_mxt_ts mc pwm_vibra rtc_max8998
> [   69.877182] CPU: 0 PID: 1566 Comm: v4l2-ctl Not tainted 5.7.0-14540-gb=
1220848c797-dirty #681
> [   69.877198] Hardware name: Samsung S5PC110/S5PV210-based board
> [   69.877274] [<c010c7c4>] (unwind_backtrace) from [<c010a120>] (show_st=
ack+0x10/0x14)
> [   69.877326] [<c010a120>] (show_stack) from [<c0117038>] (__warn+0xbc/0=
xd4)
> [   69.877375] [<c0117038>] (__warn) from [<c01170b0>] (warn_slowpath_fmt=
+0x60/0xb8)
> [   69.877448] [<c01170b0>] (warn_slowpath_fmt) from [<bf010130>] (__medi=
a_pipeline_stop+0x24/0xfc [mc])
> [   69.877540] [<bf010130>] (__media_pipeline_stop [mc]) from [<bf010228>=
] (media_pipeline_stop+0x20/0x2c [mc])
> [   69.877663] [<bf010228>] (media_pipeline_stop [mc]) from [<bf08fc48>] =
(fimc_cap_streamoff+0x38/0x48 [s5p_fimc])
> [   69.877904] [<bf08fc48>] (fimc_cap_streamoff [s5p_fimc]) from [<bf040b=
f4>] (__video_do_ioctl+0x220/0x448 [videodev])
> [   69.878105] [<bf040bf4>] (__video_do_ioctl [videodev]) from [<bf041600=
>] (video_usercopy+0x114/0x498 [videodev])
> [   69.878234] [<bf041600>] (video_usercopy [videodev]) from [<c0205024>]=
 (ksys_ioctl+0x20c/0xa10)
> [   69.878281] [<c0205024>] (ksys_ioctl) from [<c0100060>] (ret_fast_sysc=
all+0x0/0x54)
> [   69.878301] Exception stack(0xe50c1fa8 to 0xe50c1ff0)
> [   69.878342] 1fa0:                   004ef08d 00539d0c 00000003 4004561=
3 bec1578c 00517d16
> [   69.878386] 1fc0: 004ef08d 00539d0c bec188c0 00000036 bec165ac 0000000=
0 b6def320 bec18af8
> [   69.878415] 1fe0: 00539ed4 bec15730 004ef0bb b6f84d0a
> [   69.878436] ---[ end trace d004ab573a72c329 ]---
> [   69.879704] ------------[ cut here ]------------
> [   69.879794] WARNING: CPU: 0 PID: 1566 at drivers/media/mc/mc-entity.c:=
550 __media_pipeline_stop+0x24/0xfc [mc]
> [   69.879806] Modules linked in: s5p_fimc v4l2_fwnode exynos4_is_common =
videobuf2_dma_contig videobuf2_memops v4l2_mem2mem brcmfmac videobuf2_v4l2 =
pvrsrvkm_s5pv210_sgx540_120 videobuf2_common hci_uart sha256_generic btbcm =
libsha256 bluetooth cfg80211 ce147 brcmutil s5ka3dfx ecdh_generic ecc libae=
s videodev atmel_mxt_ts mc pwm_vibra rtc_max8998
> [   69.880002] CPU: 0 PID: 1566 Comm: v4l2-ctl Tainted: G        W       =
  5.7.0-14540-gb1220848c797-dirty #681
> [   69.880016] Hardware name: Samsung S5PC110/S5PV210-based board
> [   69.880071] [<c010c7c4>] (unwind_backtrace) from [<c010a120>] (show_st=
ack+0x10/0x14)
> [   69.880115] [<c010a120>] (show_stack) from [<c0117038>] (__warn+0xbc/0=
xd4)
> [   69.880161] [<c0117038>] (__warn) from [<c01170b0>] (warn_slowpath_fmt=
+0x60/0xb8)
> [   69.880231] [<c01170b0>] (warn_slowpath_fmt) from [<bf010130>] (__medi=
a_pipeline_stop+0x24/0xfc [mc])
> [   69.880318] [<bf010130>] (__media_pipeline_stop [mc]) from [<bf010228>=
] (media_pipeline_stop+0x20/0x2c [mc])
> [   69.880419] [<bf010228>] (media_pipeline_stop [mc]) from [<bf08fc48>] =
(fimc_cap_streamoff+0x38/0x48 [s5p_fimc])
> [   69.880582] [<bf08fc48>] (fimc_cap_streamoff [s5p_fimc]) from [<bf040b=
f4>] (__video_do_ioctl+0x220/0x448 [videodev])
> [   69.880776] [<bf040bf4>] (__video_do_ioctl [videodev]) from [<bf041600=
>] (video_usercopy+0x114/0x498 [videodev])
> [   69.880895] [<bf041600>] (video_usercopy [videodev]) from [<c0205024>]=
 (ksys_ioctl+0x20c/0xa10)
> [   69.880939] [<c0205024>] (ksys_ioctl) from [<c0100060>] (ret_fast_sysc=
all+0x0/0x54)
> [   69.880958] Exception stack(0xe50c1fa8 to 0xe50c1ff0)
> [   69.880997] 1fa0:                   004ef08d bec188c0 00000003 4004561=
3 bec165ac 00517d16
> [   69.881040] 1fc0: 004ef08d bec188c0 bec188c0 00000036 bec165ac 0000000=
0 b6def320 bec18af8
> [   69.881070] 1fe0: 00539ed4 bec15718 004ef0bb b6f84d0a
> [   69.881089] ---[ end trace d004ab573a72c32a ]---
> [   69.881102] ------------[ cut here ]------------
> [   69.881163] WARNING: CPU: 0 PID: 1566 at drivers/media/mc/mc-entity.c:=
556 media_pipeline_stop+0x20/0x2c [mc]
> [   69.881174] Modules linked in: s5p_fimc v4l2_fwnode exynos4_is_common =
videobuf2_dma_contig videobuf2_memops v4l2_mem2mem brcmfmac videobuf2_v4l2 =
pvrsrvkm_s5pv210_sgx540_120 videobuf2_common hci_uart sha256_generic btbcm =
libsha256 bluetooth cfg80211 ce147 brcmutil s5ka3dfx ecdh_generic ecc libae=
s videodev atmel_mxt_ts mc pwm_vibra rtc_max8998
> [   69.881367] CPU: 0 PID: 1566 Comm: v4l2-ctl Tainted: G        W       =
  5.7.0-14540-gb1220848c797-dirty #681
> [   69.881381] Hardware name: Samsung S5PC110/S5PV210-based board
> [   69.881424] [<c010c7c4>] (unwind_backtrace) from [<c010a120>] (show_st=
ack+0x10/0x14)
> [   69.881465] [<c010a120>] (show_stack) from [<c0117038>] (__warn+0xbc/0=
xd4)
> [   69.881511] [<c0117038>] (__warn) from [<c01170b0>] (warn_slowpath_fmt=
+0x60/0xb8)
> [   69.881580] [<c01170b0>] (warn_slowpath_fmt) from [<bf010228>] (media_=
pipeline_stop+0x20/0x2c [mc])
> [   69.881683] [<bf010228>] (media_pipeline_stop [mc]) from [<bf08fc48>] =
(fimc_cap_streamoff+0x38/0x48 [s5p_fimc])
> [   69.881834] [<bf08fc48>] (fimc_cap_streamoff [s5p_fimc]) from [<bf040b=
f4>] (__video_do_ioctl+0x220/0x448 [videodev])
> [   69.882025] [<bf040bf4>] (__video_do_ioctl [videodev]) from [<bf041600=
>] (video_usercopy+0x114/0x498 [videodev])
> [   69.882246] [<bf041600>] (video_usercopy [videodev]) from [<c0205024>]=
 (ksys_ioctl+0x20c/0xa10)
> [   69.882291] [<c0205024>] (ksys_ioctl) from [<c0100060>] (ret_fast_sysc=
all+0x0/0x54)
> [   69.882309] Exception stack(0xe50c1fa8 to 0xe50c1ff0)
> [   69.882348] 1fa0:                   004ef08d bec188c0 00000003 4004561=
3 bec165ac 00517d16
> [   69.882391] 1fc0: 004ef08d bec188c0 bec188c0 00000036 bec165ac 0000000=
0 b6def320 bec18af8
> [   69.882420] 1fe0: 00539ed4 bec15718 004ef0bb b6f84d0a
> [   69.882439] ---[ end trace d004ab573a72c32b ]---
>
> With the final trace being the original one that I was having.
>
> So it looks to me as if streamoff is being called twice.  Is this a possi=
bility for all drivers
> or is there a different bug that I should be trying to track down?  In an=
y event, my patch does
> prevent the warning (although my reasoning was wrong as I thought it was =
being stopped on the
> call to release).

It certainly is possible for the userspace call STREAMOFF twice and
the driver needs to ensure that the second call is essentially a
no-op, as per [1]. FWIW, if the driver defers the stream start/stop
operation entirely to the vb2 .start/stop_streaming callback, then vb2
would handle this automatically.

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-s=
treamon.html#description

Best regards,
Tomasz
