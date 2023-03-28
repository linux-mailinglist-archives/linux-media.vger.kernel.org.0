Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9F956CB9F9
	for <lists+linux-media@lfdr.de>; Tue, 28 Mar 2023 10:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232318AbjC1I7s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Mar 2023 04:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbjC1I7q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Mar 2023 04:59:46 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E754233
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 01:59:44 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id df34so9772917vsb.8
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 01:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1679993983;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qW0YpQJlwsviRjPN/ckVgQ4Y5+uQmcDy83G/T+1wDu4=;
        b=eMfu1CgPkkSnA5543I+ad4xe6aRuTO18FMVvq7dE6zYFDd8fh7VAMytmbLa8EUJAuC
         p6Ijsa7YekySHNqEW8Gkb6NpCKfgR7eCZPaPDQFFTQqYsGHkzRUoCXDNZgLE+swCn7Z7
         RDE3IMlKHJCes7/K1NwBEeCRm50NTNjOqQK/HtkwLHcA6t9jCFdd8tv8MqWB3r9dcJ3r
         luILLesJ4qj9ndlGtXdox0TXFaaml73xDAbmP0cPTSF+l4NDXHmhyZbkI1DwV+XmRnam
         df4As1IBIQKNlqr9xh/GWr42CATmkpUfYEcbMEOQ7GHDMeGD0C+BE5HvirHIG483NKvd
         ewow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679993983;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qW0YpQJlwsviRjPN/ckVgQ4Y5+uQmcDy83G/T+1wDu4=;
        b=JQ0Hw//oI5it88SXLxmFLSs5C7OrrEIoc4R/7zDDlCFm4hnJNwFqvR/ldceJ7nvyZ2
         9oGSYH1e6yRmzg6IpmnbXw560Cca0Q2BHWNCGTHuDBxJH97BzhU6RRD60a1TKel43EMg
         JdLvc0f6b9ZDYAI/7ncx6Mbe4kG7R/igSHhOvHyb0TUt28eXH4hnTDTBswJOrL+5F9IA
         fNREER/m3QswOwVg2DkhvfKAoR3ghEZUnxyJCr79IvYtcuG1sksEQD8zBLy07DSCKRvi
         Ky457PhnMzWMf1IhXCoFr1ejHgHH9kjH6XLSd3O9GOYyqq9HtzCMtG3x6YPccnElQ7rA
         8qpA==
X-Gm-Message-State: AAQBX9ewsAX/9y5NjSvCti1UItmTcBHoYdHa50K7eX/1bkyZgrhy2XnR
        o7/BouO+p0DWYRgQueie45qOWiZI3cfqrxilRG2LyD9Do07A64fZXaE=
X-Google-Smtp-Source: AKy350bm2PCZ+m3oh/9FcdhSD8Yt4lPj1NobJnY/JdjSplAtiIR05HCdeDTDH8QKf/AXEhIOXR9AVVXcYIy0sYX37GI=
X-Received: by 2002:a67:d28a:0:b0:425:b211:3671 with SMTP id
 z10-20020a67d28a000000b00425b2113671mr8598062vsi.1.1679993983637; Tue, 28 Mar
 2023 01:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <d5bc46ad-0eb6-54f5-2e9e-7dd2d49ac9c9@butterbrot.org>
In-Reply-To: <d5bc46ad-0eb6-54f5-2e9e-7dd2d49ac9c9@butterbrot.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 28 Mar 2023 08:59:27 +0000
Message-ID: <CAPY8ntCT6rp-hM-SvDGrjOnvxcKkzXLLRjw=y8sSnTquFn2D2A@mail.gmail.com>
Subject: Re: Backtrace in media_pipeline_stop with bcm2835-unicam
To:     Florian Echtler <floe@butterbrot.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Florian

On Tue, 28 Mar 2023 at 08:52, Florian Echtler <floe@butterbrot.org> wrote:
>
> Hello everyone,
>
> I'm running a Raspberry Pi with HQ camera as timelapse webcam. Everything seems
> to be working fine, so this is probably relatively low priority, but I still
> wanted to mention that I'm getting the following backtrace in
> media_pipeline_stop for every picture taken with libcamera:

bcm2835-unicam hasn't been merged to mainline as yet - it's only in
our downstream kernel tree.

Please raise an issue on https://github.com/raspberrypi/linux/issues/,
or start a thread on our forums.

Thanks
  Dave

> [244731.171175] ------------[ cut here ]------------
> [244731.171210] WARNING: CPU: 0 PID: 900 at drivers/media/mc/mc-entity.c:873
> media_pipeline_stop+0x28/0x34 [mc]
> [244731.171417] Modules linked in: cmac algif_hash aes_arm aes_generic ecb
> algif_skcipher af_alg bnep imx477 hci_uart btbcm bluetooth brcmfmac ecdh_generic
> ecc libaes vc4 brcmutil sha256_generic libsha256 snd_soc_hdmi_codec 8021q garp
> stp llc drm_display_helper cec cfg80211 drm_dma_helper drm_kms_helper
> snd_soc_core bcm2835_unicam snd_compress v4l2_dv_timings snd_pcm_dmaengine
> syscopyarea v4l2_fwnode sysfillrect sysimgblt bcm2835_codec(C) i2c_mux_pinctrl
> fb_sys_fops i2c_mux raspberrypi_hwmon v4l2_async bcm2835_v4l2(C) bcm2835_isp(C)
> v4l2_mem2mem bcm2835_mmal_vchiq(C) rfkill videobuf2_vmalloc videobuf2_dma_contig
> videobuf2_memops videobuf2_v4l2 videobuf2_common snd_bcm2835(C) videodev snd_pcm
> snd_timer i2c_bcm2835 snd vc_sm_cma(C) mc uio_pdrv_genirq uio fixed drm fuse
> drm_panel_orientation_quirks backlight ip_tables x_tables ipv6
> [244731.171829] CPU: 0 PID: 900 Comm: raspberry_fakeh Tainted: G        WC
>    6.1.19+ #1637
> [244731.171848] Hardware name: BCM2835
> [244731.171865]  unwind_backtrace from show_stack+0x18/0x1c
> [244731.171904]  show_stack from dump_stack_lvl+0x34/0x58
> [244731.171934]  dump_stack_lvl from __warn+0x7c/0xf8
> [244731.171967]  __warn from warn_slowpath_fmt+0x60/0xcc
> [244731.172002]  warn_slowpath_fmt from media_pipeline_stop+0x28/0x34 [mc]
> [244731.172150]  media_pipeline_stop [mc] from unicam_stop_streaming+0x88/0x168
> [bcm2835_unicam]
> [244731.172343]  unicam_stop_streaming [bcm2835_unicam] from
> __vb2_queue_cancel+0x30/0x284 [videobuf2_common]
> [244731.172554]  __vb2_queue_cancel [videobuf2_common] from
> vb2_core_streamoff+0x20/0xb8 [videobuf2_common]
> [244731.172739]  vb2_core_streamoff [videobuf2_common] from
> __video_do_ioctl+0x224/0x458 [videodev]
> [244731.173460]  __video_do_ioctl [videodev] from video_usercopy+0x118/0x574
> [videodev]
> [244731.174268]  video_usercopy [videodev] from sys_ioctl+0x10c/0x90c
> [244731.174705]  sys_ioctl from ret_fast_syscall+0x0/0x1c
> [244731.174732] Exception stack(0xdc905fa8 to 0xdc905ff0)
> [244731.174752] 5fa0:                   a4311ef0 a430d65c 0000000f 40045613
> a4312f30 00000000
> [244731.174770] 5fc0: a4311ef0 a430d65c a430d670 00000036 0238e568 00000000
> b6e90134 0238e508
> [244731.174783] 5fe0: a52b9d44 a4cc770c a5237940 b6d0dd4c
> [244731.174795] ---[ end trace 0000000000000000 ]---
>
> Best, Florian
> --
> SENT FROM MY DEC VT50 TERMINAL
