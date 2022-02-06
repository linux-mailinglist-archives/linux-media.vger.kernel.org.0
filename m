Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1B14AAF10
	for <lists+linux-media@lfdr.de>; Sun,  6 Feb 2022 12:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234436AbiBFLwy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Feb 2022 06:52:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234530AbiBFLku (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Feb 2022 06:40:50 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC4CC06173B
        for <linux-media@vger.kernel.org>; Sun,  6 Feb 2022 03:40:47 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id u18so23646085edt.6
        for <linux-media@vger.kernel.org>; Sun, 06 Feb 2022 03:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=u6lQE3knqkwdj7FU6UrqTfA49O0C/wfTpgeC0F2ZBzs=;
        b=jqEMZpX3knva+5DFIendW/Z3imzK5oSun1dLCtu3at62QwKsyC3Hw3CCL8k9hOUlgh
         c7YJtXcbg5YROiU0f/Q5SPmqYMy/WOJBnK90344chjpISjAuiuc9LhzirElhwgfITiTV
         Am+cp6uh8lnyWcL18zAcyhZicToYe8vPkyd2UViW6RntVtRgEMLUDVIEdtp5UdGWYYbu
         17b5rQTM5F1VUoVvS2/+X51DOy9u9zsesre64FYr+Y4uP+dDu29ZVkkcp7XN/V/kOWBE
         QaxlikJSKZ/9feQ36BhBhWnK4AeJi63vMrfz2ogB6aLgSv+Ef32jz8PzyE5HTnmtxc3x
         q0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u6lQE3knqkwdj7FU6UrqTfA49O0C/wfTpgeC0F2ZBzs=;
        b=6WYbdbQa4OiBMWmi3b6mDLu/fe+C0PQHIK3GsVIgdoSSUTyjFJVdCxIESSrWlITJdh
         mnryZxy2QkR6JwLibd7OZzL/jUjbuzoBBffDoBC1sG9qQJGq5Q68yIpbqePR2XTic/yw
         UZ2VbZVNszy6AKAS7Jct+4J1bu8Vxf5eEj6wdifi+cjT6BWaL77cn7WZSDNvQ5DsJgkU
         2BbmNj4Y6UO/j+mXLN37PNtE8pgsEHRmaRYnBYGu1Eli/OMTFqrw459/ZWjDQ7MUZzj0
         IkrUgUjEINdu/7tehITHzUYhnKaAoIjJzrGuUg0ALyhalxFRmmi6je8B/jVYH36FEsYz
         qyUA==
X-Gm-Message-State: AOAM533iKpuEEiULsW+hyMj7FzhsFcZhH8UEuBkmxfv7qzzsNJhVXfyX
        SCnp1Ze5KKyjAGac0kHUTdmRPAYsrD4SqvWj364ajQ==
X-Google-Smtp-Source: ABdhPJxRSIUOOJ/CGoiKmkXNOnt9WhFrN712AGekgzmuiQFMpoqJH1MUbgHvG3n9LeMuCUw+Tdoh000F86o7KrQn4M0=
X-Received: by 2002:a05:6402:d0:: with SMTP id i16mr4329168edu.163.1644147646513;
 Sun, 06 Feb 2022 03:40:46 -0800 (PST)
MIME-Version: 1.0
References: <20220125080213.30090-1-dafna.hirschfeld@collabora.com> <20220125080213.30090-3-dafna.hirschfeld@collabora.com>
In-Reply-To: <20220125080213.30090-3-dafna.hirschfeld@collabora.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sun, 6 Feb 2022 08:40:33 -0300
Message-ID: <CAAEAJfCck_3UVnQN3S0MHBou-EF-mkkTzLaj_9OWcABxG0a25w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] media: stk1160: If start stream fails, return
 buffers with VB2_BUF_STATE_QUEUED
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Collabora Kernel ML <kernel@collabora.com>,
        linux-media <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, senozhatsky@google.com,
        hch@lst.de, Dafna Hirschfeld <dafna3@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, 25 Jan 2022 at 05:08, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> If the callback 'start_streaming' fails, then all
> queued buffers in the driver should be returned with
> state 'VB2_BUF_STATE_QUEUED'. Currently, they are
> returned with 'VB2_BUF_STATE_ERROR' which is wrong.
> Fix this. This also fixes the warning:
>
> [   65.583633] WARNING: CPU: 5 PID: 593 at drivers/media/common/videobuf2=
/videobuf2-core.c:1612 vb2_start_streaming+0xd4/0x160 [videobuf2_common]
> [   65.585027] Modules linked in: snd_usb_audio snd_hwdep snd_usbmidi_lib=
 snd_rawmidi snd_soc_hdmi_codec dw_hdmi_i2s_audio saa7115 stk1160 videobuf2=
_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common videodev mc crct1=
0dif_ce panfrost snd_soc_simple_card snd_soc_audio_graph_card snd_soc_spdif=
_tx snd_soc_simple_card_utils gpu_sched phy_rockchip_pcie snd_soc_rockchip_=
i2s rockchipdrm analogix_dp dw_mipi_dsi dw_hdmi cec drm_kms_helper drm rtc_=
rk808 rockchip_saradc industrialio_triggered_buffer kfifo_buf rockchip_ther=
mal pcie_rockchip_host ip_tables x_tables ipv6
> [   65.589383] CPU: 5 PID: 593 Comm: v4l2src0:src Tainted: G        W    =
     5.16.0-rc4-62408-g32447129cb30-dirty #14
> [   65.590293] Hardware name: Radxa ROCK Pi 4B (DT)
> [   65.590696] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [   65.591304] pc : vb2_start_streaming+0xd4/0x160 [videobuf2_common]
> [   65.591850] lr : vb2_start_streaming+0x6c/0x160 [videobuf2_common]
> [   65.592395] sp : ffff800012bc3ad0
> [   65.592685] x29: ffff800012bc3ad0 x28: 0000000000000000 x27: ffff80001=
2bc3cd8
> [   65.593312] x26: 0000000000000000 x25: ffff00000d8a7800 x24: 000000004=
0045612
> [   65.593938] x23: ffff800011323000 x22: ffff800012bc3cd8 x21: ffff00000=
908a8b0
> [   65.594562] x20: ffff00000908a8c8 x19: 00000000fffffff4 x18: fffffffff=
fffffff
> [   65.595188] x17: 000000040044ffff x16: 00400034b5503510 x15: ffff80001=
1323f78
> [   65.595813] x14: ffff000013163886 x13: ffff000013163885 x12: 000000000=
00002ce
> [   65.596439] x11: 0000000000000028 x10: 0000000000000001 x9 : 000000000=
0000228
> [   65.597064] x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : fefefeff7=
26c5e78
> [   65.597690] x5 : ffff800012bc3990 x4 : 0000000000000000 x3 : ffff00000=
9a34880
> [   65.598315] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00000=
7cd99f0
> [   65.598940] Call trace:
> [   65.599155]  vb2_start_streaming+0xd4/0x160 [videobuf2_common]
> [   65.599672]  vb2_core_streamon+0x17c/0x1a8 [videobuf2_common]
> [   65.600179]  vb2_streamon+0x54/0x88 [videobuf2_v4l2]
> [   65.600619]  vb2_ioctl_streamon+0x54/0x60 [videobuf2_v4l2]
> [   65.601103]  v4l_streamon+0x3c/0x50 [videodev]
> [   65.601521]  __video_do_ioctl+0x1a4/0x428 [videodev]
> [   65.601977]  video_usercopy+0x320/0x828 [videodev]
> [   65.602419]  video_ioctl2+0x3c/0x58 [videodev]
> [   65.602830]  v4l2_ioctl+0x60/0x90 [videodev]
> [   65.603227]  __arm64_sys_ioctl+0xa8/0xe0
> [   65.603576]  invoke_syscall+0x54/0x118
> [   65.603911]  el0_svc_common.constprop.3+0x84/0x100
> [   65.604332]  do_el0_svc+0x34/0xa0
> [   65.604625]  el0_svc+0x1c/0x50
> [   65.604897]  el0t_64_sync_handler+0x88/0xb0
> [   65.605264]  el0t_64_sync+0x16c/0x170
> [   65.605587] ---[ end trace 578e0ba07742170d ]---
>
> Fixes: 8ac456495a33d ("[media] stk1160: Stop device and unqueue buffers w=
hen start_streaming() fails")
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,

> ---
>  drivers/media/usb/stk1160/stk1160-core.c |  2 +-
>  drivers/media/usb/stk1160/stk1160-v4l.c  | 10 +++++-----
>  drivers/media/usb/stk1160/stk1160.h      |  2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/usb/stk1160/stk1160-core.c b/drivers/media/usb=
/stk1160/stk1160-core.c
> index 4e1698f78818..ce717502ea4c 100644
> --- a/drivers/media/usb/stk1160/stk1160-core.c
> +++ b/drivers/media/usb/stk1160/stk1160-core.c
> @@ -403,7 +403,7 @@ static void stk1160_disconnect(struct usb_interface *=
interface)
>         /* Here is the only place where isoc get released */
>         stk1160_uninit_isoc(dev);
>
> -       stk1160_clear_queue(dev);
> +       stk1160_clear_queue(dev, VB2_BUF_STATE_ERROR);
>
>         video_unregister_device(&dev->vdev);
>         v4l2_device_disconnect(&dev->v4l2_dev);
> diff --git a/drivers/media/usb/stk1160/stk1160-v4l.c b/drivers/media/usb/=
stk1160/stk1160-v4l.c
> index 6a4eb616d516..1aa953469402 100644
> --- a/drivers/media/usb/stk1160/stk1160-v4l.c
> +++ b/drivers/media/usb/stk1160/stk1160-v4l.c
> @@ -258,7 +258,7 @@ static int stk1160_start_streaming(struct stk1160 *de=
v)
>         stk1160_uninit_isoc(dev);
>  out_stop_hw:
>         usb_set_interface(dev->udev, 0, 0);
> -       stk1160_clear_queue(dev);
> +       stk1160_clear_queue(dev, VB2_BUF_STATE_QUEUED);
>
>         mutex_unlock(&dev->v4l_lock);
>
> @@ -306,7 +306,7 @@ static int stk1160_stop_streaming(struct stk1160 *dev=
)
>
>         stk1160_stop_hw(dev);
>
> -       stk1160_clear_queue(dev);
> +       stk1160_clear_queue(dev, VB2_BUF_STATE_ERROR);
>
>         stk1160_dbg("streaming stopped\n");
>
> @@ -745,7 +745,7 @@ static const struct video_device v4l_template =3D {
>  /********************************************************************/
>
>  /* Must be called with both v4l_lock and vb_queue_lock hold */
> -void stk1160_clear_queue(struct stk1160 *dev)
> +void stk1160_clear_queue(struct stk1160 *dev, enum vb2_buffer_state vb2_=
state)
>  {
>         struct stk1160_buffer *buf;
>         unsigned long flags;
> @@ -756,7 +756,7 @@ void stk1160_clear_queue(struct stk1160 *dev)
>                 buf =3D list_first_entry(&dev->avail_bufs,
>                         struct stk1160_buffer, list);
>                 list_del(&buf->list);
> -               vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +               vb2_buffer_done(&buf->vb.vb2_buf, vb2_state);
>                 stk1160_dbg("buffer [%p/%d] aborted\n",
>                             buf, buf->vb.vb2_buf.index);
>         }
> @@ -766,7 +766,7 @@ void stk1160_clear_queue(struct stk1160 *dev)
>                 buf =3D dev->isoc_ctl.buf;
>                 dev->isoc_ctl.buf =3D NULL;
>
> -               vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +               vb2_buffer_done(&buf->vb.vb2_buf, vb2_state);
>                 stk1160_dbg("buffer [%p/%d] aborted\n",
>                             buf, buf->vb.vb2_buf.index);
>         }
> diff --git a/drivers/media/usb/stk1160/stk1160.h b/drivers/media/usb/stk1=
160/stk1160.h
> index a31ea1c80f25..a70963ce8753 100644
> --- a/drivers/media/usb/stk1160/stk1160.h
> +++ b/drivers/media/usb/stk1160/stk1160.h
> @@ -166,7 +166,7 @@ struct regval {
>  int stk1160_vb2_setup(struct stk1160 *dev);
>  int stk1160_video_register(struct stk1160 *dev);
>  void stk1160_video_unregister(struct stk1160 *dev);
> -void stk1160_clear_queue(struct stk1160 *dev);
> +void stk1160_clear_queue(struct stk1160 *dev, enum vb2_buffer_state vb2_=
state);
>
>  /* Provided by stk1160-video.c */
>  int stk1160_alloc_isoc(struct stk1160 *dev);
> --
> 2.17.1
>
