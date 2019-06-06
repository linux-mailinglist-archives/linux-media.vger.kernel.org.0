Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF7937428
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 14:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbfFFMcZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 08:32:25 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:59749 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726717AbfFFMcZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 08:32:25 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YrZ1hzqhS3qlsYrZ4hmhxK; Thu, 06 Jun 2019 14:32:22 +0200
Subject: Re: [PATCH v8 2/3] media: meson: add v4l2 m2m video decoder driver
To:     Maxime Jourdan <mjourdan@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
References: <20190605161858.29372-1-mjourdan@baylibre.com>
 <20190605161858.29372-3-mjourdan@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a5676c4e-9c79-5ee4-fb3d-924602ef912e@xs4all.nl>
Date:   Thu, 6 Jun 2019 14:32:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605161858.29372-3-mjourdan@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfC1DkQ3NST7ErsrPPuwF0Fp+7Lg18lnXtj3qX9vnPMYk4GQRDUp97GAsWgGwbNZca+ucvpCRTSXwBovWAk2BiVTGqkX3sXVMW/3zIeueurwn6tsIYUH7
 C1P0HyQRxgWfG12uf04zpaSrB+MIpAONVTRGZaAsIsTquUCFGAsMpABkmz6ub0Zs/h2+bguhWyE5pp021jlyP6qyUk+Wc6XRdWH9B3hlKIdgYpBP3GZZzfej
 9L8OAc7rIhUbFc+IKSNgqtScA1//lC0LYdsFULMgzcBcjJ2gf+Kg7h3LZqYbbdT1DwcORZIZv7KGR8/0RdYvMnQINStPFlvSgwW0LBfr6H/7N3zn1tMZfLjZ
 bRC5wyQEYjPMDx7h2tOmZ4IqIf1g9cds9dZh7qwBe07EM7FVHAfBUUEDFO/L0bQpo6uYBMe5+VJWk6M58xbQyK1Vb4AGr6ZqKPXFrGUSDxj5GBXT5WbLbPSS
 mGh5grYHpkw+nD9z3izD8ksMLllZ8c+adqBReoW/HUHlzDOFCZN5MqyrcdwR1ppN1jPu+UZBy4/8LBvXKd3iUq2WbBjmeJ5d36DlNQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/5/19 6:18 PM, Maxime Jourdan wrote:
> Amlogic SoCs feature a powerful video decoder unit able to
> decode many formats, with a performance of usually up to 4k60.
> 
> This is a driver for this IP that is based around the v4l2 m2m framework.
> 
> It features decoding for:
> - MPEG 1
> - MPEG 2
> 
> Supported SoCs are: GXBB (S905), GXL (S905X/W/D), GXM (S912)
> 
> There is also a hardware bitstream parser (ESPARSER) that is handled here.
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> ---
>  drivers/staging/media/Kconfig                 |    2 +
>  drivers/staging/media/Makefile                |    1 +
>  drivers/staging/media/meson/vdec/Kconfig      |   11 +
>  drivers/staging/media/meson/vdec/Makefile     |    8 +
>  drivers/staging/media/meson/vdec/TODO         |    8 +
>  .../staging/media/meson/vdec/codec_mpeg12.c   |  209 ++++
>  .../staging/media/meson/vdec/codec_mpeg12.h   |   14 +
>  drivers/staging/media/meson/vdec/dos_regs.h   |   98 ++
>  drivers/staging/media/meson/vdec/esparser.c   |  324 +++++
>  drivers/staging/media/meson/vdec/esparser.h   |   32 +
>  drivers/staging/media/meson/vdec/vdec.c       | 1075 +++++++++++++++++
>  drivers/staging/media/meson/vdec/vdec.h       |  269 +++++
>  drivers/staging/media/meson/vdec/vdec_1.c     |  229 ++++
>  drivers/staging/media/meson/vdec/vdec_1.h     |   14 +
>  drivers/staging/media/meson/vdec/vdec_ctrls.c |   29 +
>  drivers/staging/media/meson/vdec/vdec_ctrls.h |   14 +
>  .../staging/media/meson/vdec/vdec_helpers.c   |  449 +++++++
>  .../staging/media/meson/vdec/vdec_helpers.h   |   83 ++
>  .../staging/media/meson/vdec/vdec_platform.c  |  101 ++
>  .../staging/media/meson/vdec/vdec_platform.h  |   30 +
>  20 files changed, 3000 insertions(+)
>  create mode 100644 drivers/staging/media/meson/vdec/Kconfig
>  create mode 100644 drivers/staging/media/meson/vdec/Makefile
>  create mode 100644 drivers/staging/media/meson/vdec/TODO
>  create mode 100644 drivers/staging/media/meson/vdec/codec_mpeg12.c
>  create mode 100644 drivers/staging/media/meson/vdec/codec_mpeg12.h
>  create mode 100644 drivers/staging/media/meson/vdec/dos_regs.h
>  create mode 100644 drivers/staging/media/meson/vdec/esparser.c
>  create mode 100644 drivers/staging/media/meson/vdec/esparser.h
>  create mode 100644 drivers/staging/media/meson/vdec/vdec.c
>  create mode 100644 drivers/staging/media/meson/vdec/vdec.h
>  create mode 100644 drivers/staging/media/meson/vdec/vdec_1.c
>  create mode 100644 drivers/staging/media/meson/vdec/vdec_1.h
>  create mode 100644 drivers/staging/media/meson/vdec/vdec_ctrls.c
>  create mode 100644 drivers/staging/media/meson/vdec/vdec_ctrls.h
>  create mode 100644 drivers/staging/media/meson/vdec/vdec_helpers.c
>  create mode 100644 drivers/staging/media/meson/vdec/vdec_helpers.h
>  create mode 100644 drivers/staging/media/meson/vdec/vdec_platform.c
>  create mode 100644 drivers/staging/media/meson/vdec/vdec_platform.h
> 

While preparing this series for merging I came across the following checkpatch
and sparse warnings:

checkpatch:

CHECK: Alignment should match open parenthesis
#159: FILE: drivers/staging/media/meson/vdec/codec_mpeg12.c:83:
+       ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
+                                       (u32[]){ 8, 0 });

HV: I think this doesn't need changing, this is easier to read.

CHECK: Alignment should match open parenthesis
#968: FILE: drivers/staging/media/meson/vdec/vdec.c:185:
+static int vdec_queue_setup(struct vb2_queue *q,
+               unsigned int *num_buffers, unsigned int *num_planes,

CHECK: Alignment should match open parenthesis
#1755: FILE: drivers/staging/media/meson/vdec/vdec.c:972:
+       core->regmap_ao = syscon_regmap_lookup_by_phandle(dev->of_node,
+                                                        "amlogic,ao-sysctrl");

CHECK: struct mutex definition without comment
#1949: FILE: drivers/staging/media/meson/vdec/vdec.h:85:
+       struct mutex lock;

CHECK: struct mutex definition without comment
#2085: FILE: drivers/staging/media/meson/vdec/vdec.h:221:
+       struct mutex lock;

CHECK: struct mutex definition without comment
#2116: FILE: drivers/staging/media/meson/vdec/vdec.h:252:
+       struct mutex bufs_recycle_lock;

CHECK: spinlock_t definition without comment
#2120: FILE: drivers/staging/media/meson/vdec/vdec.h:256:
+       spinlock_t ts_spinlock;

CHECK: Alignment should match open parenthesis
#2247: FILE: drivers/staging/media/meson/vdec/vdec_1.c:108:
+       amvdec_write_dos_bits(core, VLD_MEM_VIFIFO_CONTROL,
+               (0x11 << MEM_FIFO_CNT_BIT) | MEM_FILL_ON_LEVEL |

CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.txt
#2313: FILE: drivers/staging/media/meson/vdec/vdec_1.c:174:
+       udelay(10);

CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.txt
#2354: FILE: drivers/staging/media/meson/vdec/vdec_1.c:215:
+       udelay(10);

CHECK: Alignment should match open parenthesis
#2413: FILE: drivers/staging/media/meson/vdec/vdec_ctrls.c:19:
+       sess->ctrl_min_buf_capture = v4l2_ctrl_new_std(ctrl_handler, NULL,
+                               V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 1);


sparse:

SPARSE:/home/hans/work/build/media-git/drivers/staging/media/meson/vdec/codec_mpeg12.c
/home/hans/work/build/media-git/drivers/staging/media/meson/vdec/codec_mpeg12.c:201:25:  warning: symbol 'codec_mpeg12_ops' was not
declared. Should it be static?
SPARSE:/home/hans/work/build/media-git/drivers/staging/media/meson/vdec/vdec.c
/home/hans/work/build/media-git/drivers/staging/media/meson/vdec/vdec.c:417:5:  warning: symbol 'vdec_vb2_buf_prepare' was not declared.
Should it be static?
SPARSE:/home/hans/work/build/media-git/drivers/staging/media/meson/vdec/vdec_1.c
/home/hans/work/build/media-git/drivers/staging/media/meson/vdec/vdec_1.c:85:5:  warning: symbol 'vdec_1_stbuf_power_up' was not declared.
Should it be static?
/home/hans/work/build/media-git/drivers/staging/media/meson/vdec/vdec_1.c:85:5: warning: no previous prototype for 'vdec_1_stbuf_power_up'
[-Wmissing-prototypes]
/home/hans/work/build/media-git/drivers/staging/media/meson/vdec/vdec.c:417:5: warning: no previous prototype for 'vdec_vb2_buf_prepare'
[-Wmissing-prototypes]

Can you fix these issues?

Regards,

	Hans
