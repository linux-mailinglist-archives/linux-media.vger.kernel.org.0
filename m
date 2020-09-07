Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C89825FC2E
	for <lists+linux-media@lfdr.de>; Mon,  7 Sep 2020 16:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729974AbgIGOjH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 10:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729890AbgIGOgD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Sep 2020 10:36:03 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A8DCC061574;
        Mon,  7 Sep 2020 07:35:49 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id 189so9482122ybw.3;
        Mon, 07 Sep 2020 07:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fIhQQiZtslyNPYELVVcC02oFefKutsjEPbIfRwrgqkw=;
        b=frkycR2vuJn+uhM6MSnXrsEGfgnVWRnN9W4cQfI/OO4O3cYFa9sf8+P0SSofYbMs+A
         eu76qbGPi1pTcvQmG1e1LhHkNeFcW+L11rUdvv/0YR64fQEUtteUopblJJWHkv8ElXkL
         spG+MpwpK8tvBZVO15IcmamuoP5D4I+W1XodY4HPiacIYNROQRkT32LodiZSMLXJVFkc
         +aSw8qhZSXAnIoHIpufa0Rap9YoyuR0uExFRT9klQJa7UFS43F5tWzxVXmyBUG97onvg
         7bGZB+VObMjWS5b3D9wTa/uxi+X+4cHKTHV16zmgb/rhdwDrETsgzLkVMSWlvpVzzLHh
         8dPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fIhQQiZtslyNPYELVVcC02oFefKutsjEPbIfRwrgqkw=;
        b=Sy+hWILmoUre6xHyjioNSulxpTFVyTPYeUwi5Jimauy5Q4XSM2DKJy3D2mNYQgcR3g
         EuAuYAGddn4lgSrUDv4p3iP5dzpwWq5Xg1I64PbXz3Cl2Tdp8QzWQhdq3fFdV/+AhIa5
         oEjxyW+DUfb1OkUMyCmjSEzDmTMD6notuHO7cZBLzCiNUL4X6/bC4FYszksz7baa/JIW
         qPR65LsMQonEnzz4RoTOXKb1y1odndjgdj38vJKsFJxpzVXJqlTpg5xxQic/900crVs0
         e3sRzc+v8hUROcFSx/EcuZitolUpSVrQizhPf8wiiSEAnA5HG6aWMRXlmdPIjD5W7fIO
         WtOw==
X-Gm-Message-State: AOAM5300BWu6ZGl6NdmtKQONCHZx9VSuBTHkOyntIhdGokwY3DkKodeb
        WtNRL/euasEl4N8b2MfIdgJP+yxiYX6c+A9TdB8=
X-Google-Smtp-Source: ABdhPJwceZYxSYXkMUtkzAeDkXBC5ydcMmpZGOj9r5Pa9j3sABt71hESMnWeoRPO3shf873OvhWYLrnFyPoVs8Sfbt4=
X-Received: by 2002:a25:ab91:: with SMTP id v17mr27384371ybi.76.1599489348119;
 Mon, 07 Sep 2020 07:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200904201835.5958-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200904201835.5958-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <5fd9865f-4c4d-66c7-1fb4-ec3e65ab0d28@st.com>
In-Reply-To: <5fd9865f-4c4d-66c7-1fb4-ec3e65ab0d28@st.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 7 Sep 2020 15:35:21 +0100
Message-ID: <CA+V-a8vjG71PyFx7bF7kamFMcBjbu-t5gZsx=xX9+vcwYGmSkg@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] media: i2c: ov5640: Enable data pins on poweron
 for DVP mode
To:     Hugues FRUCHET <hugues.fruchet@st.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Paul <paul.kocialkowski@bootlin.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

Thank you for the review.

On Mon, Sep 7, 2020 at 10:44 AM Hugues FRUCHET <hugues.fruchet@st.com> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patches, good to see one more OV5640 stakeholder
> upstreaming some fixes/features.
>
> I'm also using a parallel setup with OV5640 connected on STM32 DCMI
> camera interface.
> First basic tests have not shown any regressions on my side but I would
> like to better understand the problem you encountered and the way you
> solve it, see below my comments.
>
>
Thank you for testing the patches.

> On 9/4/20 10:18 PM, Lad Prabhakar wrote:
> > During testing this sensor on iW-RainboW-G21D-Qseven platform in 8-bit DVP
> > mode with rcar-vin bridge noticed the capture worked fine for the first run
> > (with yavta), but for subsequent runs the bridge driver waited for the
> > frame to be captured. Debugging further noticed the data lines were
> > enabled/disabled in stream on/off callback and dumping the register
> > contents 0x3017/0x3018 in ov5640_set_stream_dvp() reported the correct
> > values, but yet frame capturing failed.
>
> Could you show the sequence of V4L2 calls which lead to freeze ?
>
> Reading the patch you proposed, my guess is that issue is coming when
> multiple S_STREAM(on)/S_STREAM(off) are made while power remains, is
> that true ?
> I have added some traces in code and tried to reproduce with yavta,
> v4l2-ctl and GStreamer but I'm not able to generate such sequence, here
> is what I got everytime:
>
> [  809.113790] ov5640 0-003c: ov5640_s_power>
> [  809.116431] ov5640 0-003c: ov5640_set_power>
> [  809.120788] ov5640 0-003c: ov5640_set_power_on>
> [  809.622047] ov5640 0-003c: ov5640_set_power_dvp>
> [  809.862734] ov5640 0-003c: ov5640_s_stream>
> [  809.865462] ov5640 0-003c: ov5640_set_stream_dvp on>
> <capturing here>
> [  828.549531] ov5640 0-003c: ov5640_s_stream>
> [  828.552265] ov5640 0-003c: ov5640_set_stream_dvp off>
> [  828.580970] ov5640 0-003c: ov5640_s_power>
> [  828.583613] ov5640 0-003c: ov5640_set_power>
> [  828.587921] ov5640 0-003c: ov5640_set_power_dvp>
> [  828.620346] ov5640 0-003c: ov5640_set_power_off>
>
> Which application/command line are you using to reproduce your problem ?
>
yavta.
>
> >
> > To get around this issue data lines are enabled in s_power callback.
> > (Also the sensor remains in power down mode if not streaming so power
> > consumption shouldn't be affected)
>
> For the time being, I really don't understand why this patch is fixing
> capture freeze.
>

Below is the log with this series applied in DVP mode:

root@iwg21m:~#
root@iwg21m:~# ./yavta /dev/video0 -c1 -n3 -s640x480 -fUYVY -Fov.raw
[   36.191661] ov5640_s_power>
[   36.194452] ov5640_set_power>
[   36.197413] ov5640_set_power_on>
[   36.200714] ov5640_reset>
[   36.203328] ov5640_restore_mode>
[   36.206549] ov5640_load_regs>
[   36.550255] ov5640_set_timings>
[   36.554572] ov5640_set_mode>
[   36.557963] ov5640_calc_pixel_rate>
[   36.561458] ov5640_set_dvp_pclk>
[   36.564679] ov5640_calc_pclk>
[   36.567639] ov5640_calc_sys_clk>
[   36.572190] ov5640_set_mode_direct>
[   36.575671] ov5640_load_regs>
[   36.583205] ov5640_set_timings>
[   36.591494] ov5640_set_framefmt>
[   36.595717] ov5640_set_power_dvp>
[   36.599486] ov5640_s_ctrl>
[   36.602200] ov5640_set_ctrl_white_balance>
[   36.606550] ov5640_s_ctrl>
[   36.609250] ov5640_set_ctrl_exposure>
[   36.613179] ov5640_s_ctrl>
[   36.615878] ov5640_set_ctrl_gain>
[   36.619446] ov5640_s_ctrl>
[   36.622160] ov5640_set_ctrl_saturation>
[   36.626476] ov5640_s_ctrl>
[   36.629177] ov5640_set_ctrl_hue>
[   36.632670] ov5640_s_ctrl>
[   36.635370] ov5640_set_ctrl_contrast>
[   36.639282] ov5640_s_ctrl>
[   36.642112] ov5640_s_ctrl>
[   36.644813] ov5640_set_ctrl_hflip>
[   36.648465] ov5640_s_ctrl>
[   36.651179] ov5640_set_ctrl_vflip>
[   36.654833] ov5640_s_ctrl>
[   36.657533] ov5640_set_ctrl_light_freq>
Device /dev/video0 opened.
Device `R_Car_VIN' on `platform:e6ef3[   36.662120] ov5640_set_fmt>
000.video' (driver 'rcar_vin') supports video, capture, without [
36.670491] ov5640_try_fmt_internal>
mplanes.
[   36.679593] ov5640_find_mode>
[   36.683428] ov5640_calc_pixel_rate>
Video format set: UYVY (59565955) 640x480 (stride 1280) field none
buffer size 614400
Video format: UYVY (59565955) 640x480 (stride 1280) field none buffer
siz[   36.696456] ov5640_s_stream>
e 614400
4 buffers requested.
length: 614400 offset: 0 timesta[   36.703716] ov5640_set_stream_dvp>
mp type/source: mono/EoF
Buffer 0/0 mapped at address 0xb6b4c000.
length: 614400 offset: 614400 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xb6ab6000.
length: 614400 offset: 1228800 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xb6a20000.
length: 614400 offset: 1843200 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xb698a000.
0 (0) [-] none 0 614400 B 36.776928 36.776946 15.545 fps ts mono/EoF
[   36.900255] ov5640_s_stream>
[   36.903130] ov5640_set_stream_dvp>
Captured 1 frames in 0.064348 seconds (15.540378 fps, 9548008.11[
36.907351] ov5640_s_power>
2077 B/s).
4 buffers released.
[   36.915167] ov5640_set_power>
[   36.920979] ov5640_set_power_dvp>
[   36.924765] ov5640_set_power_off>
root@iwg21m:~#
root@iwg21m:~#
root@iwg21m:~# dmesg | grep ov5640
[    2.412247] ov5640_probe>
[    2.414913] ov5640_get_regulators>
[    2.418320] ov5640 1-003c: supply DOVDD not found, using dummy regulator
[    2.425089] ov5640 1-003c: supply AVDD not found, using dummy regulator
[    2.431758] ov5640 1-003c: supply DVDD not found, using dummy regulator
[    2.438406] ov5640_check_chip_id>
[    2.441724] ov5640_set_power_on>
[    2.444996] ov5640_reset>
[    2.447664] ov5640 1-003c: ov5640_read_reg: error: reg=300a
[    2.453241] ov5640 1-003c: ov5640_check_chip_id: failed to read
chip identifier
[    2.460548] ov5640_set_power_off>
[    2.464096] ov5640_probe>
[    2.466755] ov5640_get_regulators>
[    2.470159] ov5640 3-003c: supply DOVDD not found, using dummy regulator
[    2.476917] ov5640 3-003c: supply AVDD not found, using dummy regulator
[    2.483588] ov5640 3-003c: supply DVDD not found, using dummy regulator
[    2.490240] ov5640_check_chip_id>
[    2.493548] ov5640_set_power_on>
[    2.496805] ov5640_reset>
[    2.499705] ov5640_set_power_off>
[    2.503033] ov5640_init_controls>
[    2.506342] ov5640_calc_pixel_rate>
[    2.511902] ov5640_enum_mbus_code>
[    2.515297] ov5640_enum_mbus_code>
[    2.518826] ov5640_get_fmt>
[    4.381930] ov5640_s_power>
[    4.384725] ov5640_set_power>
[    4.387687] ov5640_set_power_on>
[    4.391301] ov5640_reset>
[    4.393920] ov5640_restore_mode>
[    4.397142] ov5640_load_regs>
[    4.750263] ov5640_set_timings>
[    4.754620] ov5640_set_mode>
[    4.758008] ov5640_calc_pixel_rate>
[    4.761513] ov5640_set_dvp_pclk>
[    4.764734] ov5640_calc_pclk>
[    4.767701] ov5640_calc_sys_clk>
[    4.772239] ov5640_set_mode_direct>
[    4.775720] ov5640_load_regs>
[    4.783195] ov5640_set_timings>
[    4.791443] ov5640_set_framefmt>
[    4.795659] ov5640_set_power_dvp>
[    4.799426] ov5640_s_ctrl>
[    4.802158] ov5640_set_ctrl_white_balance>
[    4.806510] ov5640_s_ctrl>
[    4.809210] ov5640_set_ctrl_exposure>
[    4.813140] ov5640_s_ctrl>
[    4.815840] ov5640_set_ctrl_gain>
[    4.819415] ov5640_s_ctrl>
[    4.822129] ov5640_set_ctrl_saturation>
[    4.826449] ov5640_s_ctrl>
[    4.829149] ov5640_set_ctrl_hue>
[    4.832646] ov5640_s_ctrl>
[    4.835352] ov5640_set_ctrl_contrast>
[    4.839269] ov5640_s_ctrl>
[    4.842099] ov5640_s_ctrl>
[    4.844800] ov5640_set_ctrl_hflip>
[    4.848455] ov5640_s_ctrl>
[    4.851169] ov5640_set_ctrl_vflip>
[    4.854831] ov5640_s_ctrl>
[    4.857531] ov5640_set_ctrl_light_freq>
[    4.862077] ov5640_s_power>
[    4.864864] ov5640_set_power>
[    4.867824] ov5640_set_power_dvp>
[    4.871625] ov5640_set_power_off>
[   36.191661] ov5640_s_power>
[   36.194452] ov5640_set_power>
[   36.197413] ov5640_set_power_on>
[   36.200714] ov5640_reset>
[   36.203328] ov5640_restore_mode>
[   36.206549] ov5640_load_regs>
[   36.550255] ov5640_set_timings>
[   36.554572] ov5640_set_mode>
[   36.557963] ov5640_calc_pixel_rate>
[   36.561458] ov5640_set_dvp_pclk>
[   36.564679] ov5640_calc_pclk>
[   36.567639] ov5640_calc_sys_clk>
[   36.572190] ov5640_set_mode_direct>
[   36.575671] ov5640_load_regs>
[   36.583205] ov5640_set_timings>
[   36.591494] ov5640_set_framefmt>
[   36.595717] ov5640_set_power_dvp>
[   36.599486] ov5640_s_ctrl>
[   36.602200] ov5640_set_ctrl_white_balance>
[   36.606550] ov5640_s_ctrl>
[   36.609250] ov5640_set_ctrl_exposure>
[   36.613179] ov5640_s_ctrl>
[   36.615878] ov5640_set_ctrl_gain>
[   36.619446] ov5640_s_ctrl>
[   36.622160] ov5640_set_ctrl_saturation>
[   36.626476] ov5640_s_ctrl>
[   36.629177] ov5640_set_ctrl_hue>
[   36.632670] ov5640_s_ctrl>
[   36.635370] ov5640_set_ctrl_contrast>
[   36.639282] ov5640_s_ctrl>
[   36.642112] ov5640_s_ctrl>
[   36.644813] ov5640_set_ctrl_hflip>
[   36.648465] ov5640_s_ctrl>
[   36.651179] ov5640_set_ctrl_vflip>
[   36.654833] ov5640_s_ctrl>
[   36.657533] ov5640_set_ctrl_light_freq>
[   36.662120] ov5640_set_fmt>
[   36.670491] ov5640_try_fmt_internal>
[   36.679593] ov5640_find_mode>
[   36.683428] ov5640_calc_pixel_rate>
[   36.696456] ov5640_s_stream>
[   36.703716] ov5640_set_stream_dvp>
[   36.900255] ov5640_s_stream>
[   36.903130] ov5640_set_stream_dvp>
[   36.907351] ov5640_s_power>
[   36.915167] ov5640_set_power>
[   36.920979] ov5640_set_power_dvp>
[   36.924765] ov5640_set_power_off>
root@iwg21m:~#
root@iwg21m:~#
root@iwg21m:~# dmesg --clear
root@iwg21m:~#
root@iwg21m:~# ./yavta /dev/video0 -c1 -n3 -s640x480 -fUYVY -Fov.raw
[   72.934594] ov5640_s_power>
[   72.937385] ov5640_set_power>
[   72.940385] ov5640_set_power_on>
[   72.943658] ov5640_reset>
[   72.946273] ov5640_restore_mode>
[   72.949493] ov5640_load_regs>
[   73.290250] ov5640_set_timings>
[   73.294578] ov5640_set_mode>
[   73.297974] ov5640_calc_pixel_rate>
[   73.301470] ov5640_set_dvp_pclk>
[   73.304689] ov5640_calc_pclk>
[   73.307649] ov5640_calc_sys_clk>
[   73.312190] ov5640_set_mode_direct>
[   73.315671] ov5640_load_regs>
[   73.323202] ov5640_set_timings>
[   73.331533] ov5640_set_framefmt>
[   73.335765] ov5640_set_power_dvp>
[   73.339539] ov5640_s_ctrl>
[   73.342254] ov5640_set_ctrl_white_balance>
[   73.346605] ov5640_s_ctrl>
[   73.349305] ov5640_set_ctrl_exposure>
[   73.353234] ov5640_s_ctrl>
[   73.355934] ov5640_set_ctrl_gain>
[   73.359503] ov5640_s_ctrl>
[   73.362217] ov5640_set_ctrl_saturation>
[   73.366537] ov5640_s_ctrl>
[   73.369237] ov5640_set_ctrl_hue>
[   73.372733] ov5640_s_ctrl>
[   73.375434] ov5640_set_ctrl_contrast>
[   73.379349] ov5640_s_ctrl>
[   73.382180] ov5640_s_ctrl>
[   73.384888] ov5640_set_ctrl_hflip>
[   73.388543] ov5640_s_ctrl>
[   73.391257] ov5640_set_ctrl_vflip>
[   73.394914] ov5640_s_ctrl>
[   73.397615] ov5640_set_ctrl_light_freq>
Device /dev/video0 opened.
Device `R_Car_VIN' on `platform:e6ef3[   73.402191] ov5640_set_fmt>
000.video' (driver 'rcar_vin') supports video, capture, without [
73.410568] ov5640_try_fmt_internal>
mplanes.
[   73.419661] ov5640_find_mode>
[   73.423489] ov5640_calc_pixel_rate>
Video format set: UYVY (59565955) 640x480 (stride 1280) field none
buffer size 614400
Video for[   73.430741] ov5640_s_stream>
mat: UYVY (59565955) 640x480 (stride 1280) field none buffer siz[
73.438227] ov5640_set_stream_dvp>
e 614400
4 buffers requested.
length: 614400 offset: 0 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xb6b7e000.
length: 614400 offset: 614400 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xb6ae8000.
length: 614400 offset: 1228800 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xb6a52000.
length: 614400 offset: 1843200 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xb69bc000.
0 (0) [-] none 0 614400 B 73.544608 73.544626 10.257 fps ts mono/EoF
[   73.670256] ov5640_s_stream>
[   73.673132] ov5640_set_stream_dvp>
Captured 1 frames in 0.097510 seconds (10.255285 fps, 6300846.98[
73.677350] ov5640_s_power>
3972 B/s).
4 buffers released.
[   73.685162] ov5640_set_power>
[   73.690979] ov5640_set_power_dvp>
[   73.694757] ov5640_set_power_off>
root@iwg21m:~#
root@iwg21m:~#
root@iwg21m:~#

Below is the log without the series applied in DVP mode:

root@iwg21m:~# ./yavta /dev/video0 -c1 -n3 -s640x480 -fUYVY -Fov.raw
[   45.262397] ov5640_s_power>
[   45.265189] ov5640_set_power>
[   45.268150] ov5640_set_power_on>
[   45.271455] ov5640_reset>
[   45.274071] ov5640_restore_mode>
[   45.621705] ov5640_set_mode>
[   45.625104] ov5640_calc_pixel_rate>
[   45.629916] ov5640_set_mode_direct>
[   45.640983] ov5640_get_sysclk>
[   45.646295] ov5640_set_framefmt>
[   45.650537] ov5640_s_ctrl>
[   45.653237] ov5640_set_ctrl_white_balance>
[   45.657588] ov5640_s_ctrl>
[   45.660289] ov5640_set_ctrl_exposure>
[   45.664217] ov5640_s_ctrl>
[   45.666918] ov5640_set_ctrl_gain>
[   45.670483] ov5640_s_ctrl>
[   45.673201] ov5640_set_ctrl_saturation>
[   45.677523] ov5640_s_ctrl>
[   45.680223] ov5640_set_ctrl_hue>
[   45.683721] ov5640_s_ctrl>
[   45.686684] ov5640_s_ctrl>
[   45.689501] ov5640_s_ctrl>
[   45.692213] ov5640_set_ctrl_hflip>
[   45.695870] ov5640_s_ctrl>
[   45.698570] ov5640_set_ctrl_vflip>
[   45.702240] ov5640_s_ctrl>
[   45.704940] ov5640_set_ctrl_light_freq>
Device /dev/video0 opened.
Device `R_Car_VIN' on `platform:e6ef1[   45.709474] ov5640_set_fmt>
000.video' (driver 'rcar_vin') supports video, capture, without [
45.717852] ov5640_try_fmt_internal>
mplanes.
[   45.726964] ov5640_find_mode>
[   45.730785] ov5640_calc_pixel_rate>
Video format set: UYVY (59565955) 640x480 (stride 1280) field none
buffer size 614400
Video format: UYVY (59565955) 640x480 (stride 1280) field none buffer
siz[   45.743733] ov5640_s_stream>
e 614400
4 buffers requested.
length: 614400 offset: 0 timesta[   45.751076] ov5640_set_stream_dvp>
mp type/source: mono/EoF
Buffer 0/0 mapped at address 0xb6b61000.
length: 614400 offset: 614400 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xb6acb000.
length: 614400 offset: 1228800 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xb6a35000.
length: 614400 offset: 1843200 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xb699f000.
^C[   57.048902] ov5640_s_stream>
[   57.051800] ov5640_set_stream_dvp>
[   57.056180] ov5640_s_power>
[   57.058967] ov5640_set_power>
[   57.061943] ov5640_set_power_off>

root@iwg21m:~#




root@iwg21m:~# dmesg | grep ov564
[    2.412449] ov5640 1-003c: supply DOVDD not found, using dummy regulator
[    2.419202] ov5640 1-003c: supply AVDD not found, using dummy regulator
[    2.425872] ov5640 1-003c: supply DVDD not found, using dummy regulator
[    2.432527] ov5640_set_power_on>
[    2.435801] ov5640_reset>
[    2.438704] ov5640_set_power_off>
[    2.442037] ov5640_init_controls>
[    2.445346] ov5640_calc_pixel_rate>
[    2.450955] ov5640_enum_mbus_code>
[    2.454350] ov5640_enum_mbus_code>
[    2.457882] ov5640_get_fmt>
[    4.222662] ov5640_s_power>
[    4.225458] ov5640_set_power>
[    4.228420] ov5640_set_power_on>
[    4.231737] ov5640_reset>
[    4.234356] ov5640_restore_mode>
[    4.591733] ov5640_set_mode>
[    4.595133] ov5640_calc_pixel_rate>
[    4.599930] ov5640_set_mode_direct>
[    4.610913] ov5640_get_sysclk>
[    4.616195] ov5640_set_framefmt>
[    4.620424] ov5640_s_ctrl>
[    4.623136] ov5640_set_ctrl_white_balance>
[    4.627485] ov5640_s_ctrl>
[    4.630185] ov5640_set_ctrl_exposure>
[    4.634115] ov5640_s_ctrl>
[    4.636815] ov5640_set_ctrl_gain>
[    4.640382] ov5640_s_ctrl>
[    4.643095] ov5640_set_ctrl_saturation>
[    4.647412] ov5640_s_ctrl>
[    4.650112] ov5640_set_ctrl_hue>
[    4.653612] ov5640_s_ctrl>
[    4.656573] ov5640_s_ctrl>
[    4.659389] ov5640_s_ctrl>
[    4.662105] ov5640_set_ctrl_hflip>
[    4.665760] ov5640_s_ctrl>
[    4.668460] ov5640_set_ctrl_vflip>
[    4.672126] ov5640_s_ctrl>
[    4.674826] ov5640_set_ctrl_light_freq>
[    4.679405] ov5640_s_power>
[    4.682211] ov5640_set_power>
[    4.685171] ov5640_set_power_off>
[   45.262397] ov5640_s_power>
[   45.265189] ov5640_set_power>
[   45.268150] ov5640_set_power_on>
[   45.271455] ov5640_reset>
[   45.274071] ov5640_restore_mode>
[   45.621705] ov5640_set_mode>
[   45.625104] ov5640_calc_pixel_rate>
[   45.629916] ov5640_set_mode_direct>
[   45.640983] ov5640_get_sysclk>
[   45.646295] ov5640_set_framefmt>
[   45.650537] ov5640_s_ctrl>
[   45.653237] ov5640_set_ctrl_white_balance>
[   45.657588] ov5640_s_ctrl>
[   45.660289] ov5640_set_ctrl_exposure>
[   45.664217] ov5640_s_ctrl>
[   45.666918] ov5640_set_ctrl_gain>
[   45.670483] ov5640_s_ctrl>
[   45.673201] ov5640_set_ctrl_saturation>
[   45.677523] ov5640_s_ctrl>
[   45.680223] ov5640_set_ctrl_hue>
[   45.683721] ov5640_s_ctrl>
[   45.686684] ov5640_s_ctrl>
[   45.689501] ov5640_s_ctrl>
[   45.692213] ov5640_set_ctrl_hflip>
[   45.695870] ov5640_s_ctrl>
[   45.698570] ov5640_set_ctrl_vflip>
[   45.702240] ov5640_s_ctrl>
[   45.704940] ov5640_set_ctrl_light_freq>
[   45.709474] ov5640_set_fmt>
[   45.717852] ov5640_try_fmt_internal>
[   45.726964] ov5640_find_mode>
[   45.730785] ov5640_calc_pixel_rate>
[   45.743733] ov5640_s_stream>
[   45.751076] ov5640_set_stream_dvp>
[   57.048902] ov5640_s_stream>
[   57.051800] ov5640_set_stream_dvp>
[   57.056180] ov5640_s_power>
[   57.058967] ov5640_set_power>
[   57.061943] ov5640_set_power_off>

Cheers,
Prabhakar
