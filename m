Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2283751E
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 15:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727738AbfFFNYY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 09:24:24 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54133 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727711AbfFFNYW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 09:24:22 -0400
Received: by mail-wm1-f66.google.com with SMTP id x15so1798139wmj.3
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2019 06:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QoGog8a3Wrsj5HuFdAVlHcSa7d9sUGcrDi4SC/3qBKY=;
        b=khY7Hzsl2mrL6XdXHgajw/IBA9cQipqEFv5h6jaAjYz/mPADIrsyBZAwk9MD2Zn0vB
         A6Tj3bVkdGPNk12lhKNwEYMDYFBUgDkNMOEqgnXpubbQg5OHgFE8Zvq8vkdKU/e/3az4
         0M3o5ceFu7NZxuZAGuO65bv1Q/XaxqZNsN4WwlCclCVWWCIzvZmFf3MJcLBW/vzlxEoU
         8tRlUsRzCu9eIj5PEBcIaDt9NEIXyHGJRjDdMhwl0T7ydGec7lnUQwmBJUf4EXCx6ujj
         X4lWk+dBys6IcpmxdtXXx3eO9h+S75BsDnZWgeZvYyPRF6CvL5RlvZpInusxsfYIkV27
         J+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QoGog8a3Wrsj5HuFdAVlHcSa7d9sUGcrDi4SC/3qBKY=;
        b=gT/ta5bmQprNE411v6Sk3bAdBNflP/QEMArZ0KXFE7avQ2RIM4+iKILcopB3zHhUH2
         WghVSNhLRT5utE4FXBMBxDwhi15KlmZEYp5l9i2nUhU/2iOHimGKoNvD3EdaL0zyBTLV
         d8QcanQaTLAzvgONYxaIskvG2iRlR3VsYMBZVGS17c6nzZWIA6kqyUEQ89GF4x739kdo
         aMURkZ4jE/9x0+U+YfktSd8WmNtA5LV6yx4MGz5UcVXLcdDjdOuX2liMlyx9hrXEGJrO
         4Z1uFqCL0ZM0X7PB+vcC0iQlOj6qL/Q/AIbvjlhyIE5pzzsVyIWBzezyTrf3RlmsnRvF
         b0dg==
X-Gm-Message-State: APjAAAWKg4wG58ACSS1TuhdYDAPTRINRYD6GNbO783taf1vxe2bqYE4I
        WgbFKHlmRz8lLBX5WFy0VgmGi757afU5l79uaN+aidKU5aQ=
X-Google-Smtp-Source: APXvYqx8KrJ+cP3MBQAozA03nDeKj75Rodf/KMjmNziao/G2SxLWllc4LLaFap1HssB7UjMSiD61t4uXPaACXGxsSWw=
X-Received: by 2002:a1c:c706:: with SMTP id x6mr24472351wmf.162.1559827460800;
 Thu, 06 Jun 2019 06:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190605161858.29372-1-mjourdan@baylibre.com> <20190605161858.29372-3-mjourdan@baylibre.com>
 <a5676c4e-9c79-5ee4-fb3d-924602ef912e@xs4all.nl>
In-Reply-To: <a5676c4e-9c79-5ee4-fb3d-924602ef912e@xs4all.nl>
From:   Maxime Jourdan <mjourdan@baylibre.com>
Date:   Thu, 6 Jun 2019 15:24:09 +0200
Message-ID: <CAMO6naxtUA82inWZKhJ99zmcDiBZZXeDpgMYeOaqLH_cqso40Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] media: meson: add v4l2 m2m video decoder driver
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,
On Thu, Jun 6, 2019 at 2:32 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> While preparing this series for merging I came across the following checkpatch
> and sparse warnings:
>
> checkpatch:
>
> CHECK: Alignment should match open parenthesis
> #159: FILE: drivers/staging/media/meson/vdec/codec_mpeg12.c:83:
> +       ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
> +                                       (u32[]){ 8, 0 });
>
> HV: I think this doesn't need changing, this is easier to read.
>
> CHECK: Alignment should match open parenthesis
> #968: FILE: drivers/staging/media/meson/vdec/vdec.c:185:
> +static int vdec_queue_setup(struct vb2_queue *q,
> +               unsigned int *num_buffers, unsigned int *num_planes,
>
> CHECK: Alignment should match open parenthesis
> #1755: FILE: drivers/staging/media/meson/vdec/vdec.c:972:
> +       core->regmap_ao = syscon_regmap_lookup_by_phandle(dev->of_node,
> +                                                        "amlogic,ao-sysctrl");
>
> CHECK: struct mutex definition without comment
> #1949: FILE: drivers/staging/media/meson/vdec/vdec.h:85:
> +       struct mutex lock;
>
> CHECK: struct mutex definition without comment
> #2085: FILE: drivers/staging/media/meson/vdec/vdec.h:221:
> +       struct mutex lock;
>
> CHECK: struct mutex definition without comment
> #2116: FILE: drivers/staging/media/meson/vdec/vdec.h:252:
> +       struct mutex bufs_recycle_lock;
>
> CHECK: spinlock_t definition without comment
> #2120: FILE: drivers/staging/media/meson/vdec/vdec.h:256:
> +       spinlock_t ts_spinlock;
>
> CHECK: Alignment should match open parenthesis
> #2247: FILE: drivers/staging/media/meson/vdec/vdec_1.c:108:
> +       amvdec_write_dos_bits(core, VLD_MEM_VIFIFO_CONTROL,
> +               (0x11 << MEM_FIFO_CNT_BIT) | MEM_FILL_ON_LEVEL |
>
> CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.txt
> #2313: FILE: drivers/staging/media/meson/vdec/vdec_1.c:174:
> +       udelay(10);
>
> CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.txt
> #2354: FILE: drivers/staging/media/meson/vdec/vdec_1.c:215:
> +       udelay(10);
>
> CHECK: Alignment should match open parenthesis
> #2413: FILE: drivers/staging/media/meson/vdec/vdec_ctrls.c:19:
> +       sess->ctrl_min_buf_capture = v4l2_ctrl_new_std(ctrl_handler, NULL,
> +                               V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 1);
>
>
> sparse:
>
> SPARSE:/home/hans/work/build/media-git/drivers/staging/media/meson/vdec/codec_mpeg12.c
> /home/hans/work/build/media-git/drivers/staging/media/meson/vdec/codec_mpeg12.c:201:25:  warning: symbol 'codec_mpeg12_ops' was not
> declared. Should it be static?
> SPARSE:/home/hans/work/build/media-git/drivers/staging/media/meson/vdec/vdec.c
> /home/hans/work/build/media-git/drivers/staging/media/meson/vdec/vdec.c:417:5:  warning: symbol 'vdec_vb2_buf_prepare' was not declared.
> Should it be static?
> SPARSE:/home/hans/work/build/media-git/drivers/staging/media/meson/vdec/vdec_1.c
> /home/hans/work/build/media-git/drivers/staging/media/meson/vdec/vdec_1.c:85:5:  warning: symbol 'vdec_1_stbuf_power_up' was not declared.
> Should it be static?
> /home/hans/work/build/media-git/drivers/staging/media/meson/vdec/vdec_1.c:85:5: warning: no previous prototype for 'vdec_1_stbuf_power_up'
> [-Wmissing-prototypes]
> /home/hans/work/build/media-git/drivers/staging/media/meson/vdec/vdec.c:417:5: warning: no previous prototype for 'vdec_vb2_buf_prepare'
> [-Wmissing-prototypes]
>
> Can you fix these issues?
>

Sure, preparing a V9. I'll add sparse to my list of tools to use
before sending a patch.

Maxime

>
> Regards,
>
>         Hans
