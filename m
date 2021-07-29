Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57023D9E5F
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 09:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234524AbhG2HZS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 03:25:18 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:52659 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234515AbhG2HZS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 03:25:18 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 90PpmPLzDXTlc90PqmVk7v; Thu, 29 Jul 2021 09:25:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627543514; bh=XEYIRKsPLFLBcvgxN3puMKHiUXpg7Re7qlpPGAHAJz0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=KVCu3WOeYLif/jSzR8+Yy0wrRQG7CPn+FFC2S65IrfDKMK4nUHNVk6vUsj+v57Oqh
         m3WLp8s5mI/tsuQC5+g3QYkRKLLzg+yLQwSWtC/bXnvYwoTZGC7osziJCLtmy1hPrr
         xNsN8+IyjmDzXVp2BEE1TIzXQYy22qUZYmzbUDKtBo9bHn5xRBv2FxfUeCv4uZGT//
         weDX7LZvX5vN1kaG+aPqItls2Hze/MTXmbrbC4lfjl6QFRejbypVkfytP2/P6fN9Rg
         dNFBiQilekuVEgsGXXzttm+UIgXFNuw7RF9s8Nop6S+PncH5TplnasTObmdgtzvs1n
         Na3TrnUCi2oWQ==
Subject: Re: media/master bisection: v4l2-compliance-vivid.device-presence on
 qemu_x86_64
To:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        "kernelci-results@groups.io" <kernelci-results@groups.io>
References: <60ed7c49.1c69fb81.518d4.80d2@mx.google.com>
 <e7d8a6b9-5b60-a60f-f5e1-8d458bf56539@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <02487fea-09ba-cda8-3418-d1db4529ee7c@xs4all.nl>
Date:   Thu, 29 Jul 2021 09:25:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e7d8a6b9-5b60-a60f-f5e1-8d458bf56539@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEKfRa+HUM2bExTMOzmsimPXQqOi9nZ+SL1kccfLER2bNn2RecgXdCf5tpnKK6NOgzWjR2jXiMQvOYBPg52/WYuBws7fjUS2Mb74s/clKvE6Gbo+3VX9
 U25tu80qqE8uxg65V8x7zMTLNuqIUARPip1t3bqIVbxhn7LKAzr9cZuwjTPnjdRPV+FgRwL09UJQQ0vGsNx6wTtwf25zNt63Un7jCZxjv04pGLd77TPa/7j0
 JFe9QDqh6+7WwoT+9uula+RJ9pE7r3KGir13+QyiBsQD2Bi5Ijotdo+VjgCL0AQ1fYad9XkFyhvf8tyFH846tJ5zJyYka0koJTFXjZK5q/Vi9kwpFYtpHOHt
 g4/2wJAcOVKY6HEjtV1Iagd8egQZDxPcRuumRxPhylt6UvHfAd5LK/pJuImMsDC6x1kMa121
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/07/2021 09:05, Guillaume Tucker wrote:
> Hello,
> 
> FYI - This bisection was run because the KernelCI v4l2-compliance
> tests on vivid failed to find a media device.  Regression details
> can be found here:
> 
>   https://linux.kernelci.org/test/job/media/branch/master/kernel/v5.14-rc1/plan/v4l2-compliance-vivid/
> 
> This doesn't really seem to be a kernel config issue per se, the
> driver just wasn't built because of the DRM Kconfig change.
> Instead I've added CONFIG_FB to the fragment used by KernelCI to
> enable the vivid driver:
> 
>   https://github.com/kernelci/kernelci-core/pull/776/files
> 
> Does that sound like the best approach?  Trying to enable
> CONFIG_FB in the vivid Kconfig causes cyclic dependencies and
> seems backwards, so I thought that was the way to go.

Yes, that's the right approach.

I read that they disabled CONFIG_FB by default, so this is the fallout
of that change. I wonder if I should change vivid so that it no longer
depends on CONFIG_FB and instead just disables the bits that depend on
that if it isn't set. I think it's a fair amount of work, though.

Regards,

	Hans

> 
> The drm-tip tree is not currently covered by KernelCI, I guess it
> would have caught the issue before it landed in mainline.  We're
> planning to enable it again, mainly to run IGT but it seems like
> some basic checks for drivers that depend on some DRM configs
> would be useful too.  Maybe doing that on linux-next too would be
> useful.
> 
> Best wishes,
> Guillaume
> 
> 
> On 13/07/2021 12:43, KernelCI bot wrote:
>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>> * This automated bisection report was sent to you on the basis  *
>> * that you may be involved with the breaking commit it has      *
>> * found.  No manual investigation has been done to verify it,   *
>> * and the root cause of the problem may be somewhere else.      *
>> *                                                               *
>> * If you do send a fix, please include this trailer:            *
>> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
>> *                                                               *
>> * Hope this helps!                                              *
>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>>
>> media/master bisection: v4l2-compliance-vivid.device-presence on qemu_x86_64
>>
>> Summary:
>>   Start:      e73f0f0ee754 Linux 5.14-rc1
>>   Plain log:  https://storage.kernelci.org/media/master/v5.14-rc1/x86_64/x86_64_defconfig+virtualvideo/gcc-8/lab-collabora/v4l2-compliance-vivid-qemu_x86_64.txt
>>   HTML log:   https://storage.kernelci.org/media/master/v5.14-rc1/x86_64/x86_64_defconfig+virtualvideo/gcc-8/lab-collabora/v4l2-compliance-vivid-qemu_x86_64.html
>>   Result:     f611b1e7624c drm: Avoid circular dependencies for CONFIG_FB
>>
>> Checks:
>>   revert:     PASS
>>   verify:     PASS
>>
>> Parameters:
>>   Tree:       media
>>   URL:        https://git.linuxtv.org/media_tree.git
>>   Branch:     master
>>   Target:     qemu_x86_64
>>   CPU arch:   x86_64
>>   Lab:        lab-collabora
>>   Compiler:   gcc-8
>>   Config:     x86_64_defconfig+virtualvideo
>>   Test case:  v4l2-compliance-vivid.device-presence
>>
>> Breaking commit found:
>>
>> -------------------------------------------------------------------------------
>> commit f611b1e7624ccdbd495c19e9805629e22265aa16
>> Author: Kees Cook <keescook@chromium.org>
>> Date:   Wed Jun 2 14:52:50 2021 -0700
>>
>>     drm: Avoid circular dependencies for CONFIG_FB
>>     
>>     When cleaning up other drm config dependencies, it is too easy to create
>>     larger problems. Instead, mark CONFIG_FB as a "depends":
>>     
>>     drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!
>>     
>>     Suggested-by: Arnd Bergmann <arnd@kernel.org>
>>     Link: https://lore.kernel.org/lkml/CAK8P3a3jUQs6c5tESSNMbqfuymewj9FhqRizyHcfOXf8Rgy-nA@mail.gmail.com/
>>     Signed-off-by: Kees Cook <keescook@chromium.org>
>>     [danvet: Rebase, the symbol has changed.]
>>     Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>     Link: https://patchwork.freedesktop.org/patch/msgid/20210602215252.695994-2-keescook@chromium.org
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 594ac6c3a1f4..56a55a6e6239 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -98,8 +98,8 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>>  config DRM_FBDEV_EMULATION
>>  	bool "Enable legacy fbdev support for your modesetting driver"
>>  	depends on DRM
>> +	depends on FB
>>  	select DRM_KMS_HELPER
>> -	select FB
>>  	select FB_CFB_FILLRECT
>>  	select FB_CFB_COPYAREA
>>  	select FB_CFB_IMAGEBLIT
>> -------------------------------------------------------------------------------
>>
>>
>> Git bisection log:
>>
>> -------------------------------------------------------------------------------
>> git bisect start
>> # good: [50e7a31d30e8221632675abed3be306382324ca2] media: Fix Media Controller API config checks
>> git bisect good 50e7a31d30e8221632675abed3be306382324ca2
>> # bad: [e73f0f0ee7541171d89f2e2491130c7771ba58d3] Linux 5.14-rc1
>> git bisect bad e73f0f0ee7541171d89f2e2491130c7771ba58d3
>> # bad: [e058a84bfddc42ba356a2316f2cf1141974625c9] Merge tag 'drm-next-2021-07-01' of git://anongit.freedesktop.org/drm/drm
>> git bisect bad e058a84bfddc42ba356a2316f2cf1141974625c9
>> # good: [a6eaf3850cb171c328a8b0db6d3c79286a1eba9d] Merge tag 'sched-urgent-2021-06-30' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>> git bisect good a6eaf3850cb171c328a8b0db6d3c79286a1eba9d
>> # good: [007b312c6f294770de01fbc0643610145012d244] Merge tag 'mac80211-next-for-net-next-2021-06-25' of git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next
>> git bisect good 007b312c6f294770de01fbc0643610145012d244
>> # good: [18703923a66aecf6f7ded0e16d22eb412ddae72f] drm/amdgpu: Fix incorrect register offsets for Sienna Cichlid
>> git bisect good 18703923a66aecf6f7ded0e16d22eb412ddae72f
>> # bad: [334200bf52f0637a5ab8331c557dfcecbb9c30fa] Merge tag 'drm-msm-next-2021-06-23b' of https://gitlab.freedesktop.org/drm/msm into drm-next
>> git bisect bad 334200bf52f0637a5ab8331c557dfcecbb9c30fa
>> # bad: [c707b73f0cfb1acc94a20389aecde65e6385349b] Merge tag 'amd-drm-next-5.14-2021-06-09' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
>> git bisect bad c707b73f0cfb1acc94a20389aecde65e6385349b
>> # good: [caa18dd6dd9305d52943a6b59f410cbc960ad0a0] drm/amd/display: force CP to DESIRED when removing display
>> git bisect good caa18dd6dd9305d52943a6b59f410cbc960ad0a0
>> # bad: [691cf8cd7a531dbfcc29d09a23c509a86fd9b24f] drm/amdgpu: use correct rounding macro for 64-bit
>> git bisect bad 691cf8cd7a531dbfcc29d09a23c509a86fd9b24f
>> # bad: [2fdcb55dfc86835e4845e3f422180b5596d23cb4] drm/amdkfd: use resource cursor in svm_migrate_copy_to_vram v2
>> git bisect bad 2fdcb55dfc86835e4845e3f422180b5596d23cb4
>> # bad: [6c3f953381e526a1623d4575660afae8b19ffa20] drm/sti/sti_hqvdp: Fix incorrectly named function 'sti_hqvdp_vtg_cb()'
>> git bisect bad 6c3f953381e526a1623d4575660afae8b19ffa20
>> # bad: [5ea4dba68305d9648b9dba30036cc36d4e877bca] drm/msm/a6xx: add CONFIG_QCOM_LLCC dependency
>> git bisect bad 5ea4dba68305d9648b9dba30036cc36d4e877bca
>> # good: [4a888ba03fd97d1cb0253581973533965bf348c4] drm/vgem/vgem_drv: Standard comment blocks should not use kernel-doc format
>> git bisect good 4a888ba03fd97d1cb0253581973533965bf348c4
>> # good: [c5ef15ae09637fb51ae43e1d1d98329d67dd4fd6] video: fbdev: atyfb: mach64_cursor.c: deleted the repeated word
>> git bisect good c5ef15ae09637fb51ae43e1d1d98329d67dd4fd6
>> # bad: [f611b1e7624ccdbd495c19e9805629e22265aa16] drm: Avoid circular dependencies for CONFIG_FB
>> git bisect bad f611b1e7624ccdbd495c19e9805629e22265aa16
>> # good: [ff323d6d72e1e4971c8ba9e2f3cf8afc48f22383] video: fbdev: mb862xx: use DEVICE_ATTR_RO macro
>> git bisect good ff323d6d72e1e4971c8ba9e2f3cf8afc48f22383
>> # first bad commit: [f611b1e7624ccdbd495c19e9805629e22265aa16] drm: Avoid circular dependencies for CONFIG_FB
>> -------------------------------------------------------------------------------
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Groups.io Links: You receive all messages sent to this group.
>> View/Reply Online (#13992): https://groups.io/g/kernelci-results/message/13992
>> Mute This Topic: https://groups.io/mt/84176294/924702
>> Group Owner: kernelci-results+owner@groups.io
>> Unsubscribe: https://groups.io/g/kernelci-results/unsub [guillaume.tucker@collabora.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>
> 

