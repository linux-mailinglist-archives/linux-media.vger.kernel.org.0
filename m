Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66C291A1611
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 21:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbgDGTgg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 15:36:36 -0400
Received: from mail-qv1-f68.google.com ([209.85.219.68]:35711 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgDGTgg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 15:36:36 -0400
Received: by mail-qv1-f68.google.com with SMTP id q73so2463665qvq.2
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 12:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=pCLPL0JnUyOXfXfamhd1KYiAt+I94C6hDARt0PzER6M=;
        b=iv4SUzZ+wPaPvelHvTIV/L7sT6/Ses0zb2Tbg+j76RBsT5yQeyxbztpRsppzh8SVI1
         imum52orGD4bWHHbBs4eNRNnuNFF8E3tIl/UIO6WIpCzmDI/P5eVImng6cov8Uqi/+HL
         /5J3KM7F+wWNKIUvlhy1db1u8ZNkEAQku4YvQ4bU/qFwViuRK7ptwyrLCu57CaixN0Pc
         G4xvL1byUnLF4ItCpYaROQ4kk/x0yVWf+6ZRPELbITWpFzHWJAlSB2DRKhW5HoKVAUuY
         qMEGoJ3IxOoQ7dsNDu5Ip7fy/eZPJDQrcnPrmA08baBxG7OQQ+Po+aiybxjC7dEETmdV
         Zxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pCLPL0JnUyOXfXfamhd1KYiAt+I94C6hDARt0PzER6M=;
        b=nnXtLMYDGsawduS5594RQVPpkfmjfT/tOs0TouRTVnPZYPlvSsWHc51YTHfadby5gB
         BdYHiB1phRU4/dG+AOPwfOhfQVTBqQQQ7zGUe3hOxHv5yjpNMrd6FgjfzEDOq+jBis5i
         DoTG0Wt+mMGr3DJAbNTvf37swi9ztU1+f74N885HgRyLsJyCKAqunKSijrGcHWK7rz+S
         nkzh/BTgQVv5V9GZBWtX3lHyn0HWKqAvl6BXmflRcsfSoqcusoiPXHx6jlpCeVuaTtYV
         OsWfQYbgaAxxm8GPSlDH+ewqqs4m6/zGwEBBMzq1+TDTVyuIGwX9zoYyb0Hvi8DRQb8k
         UQ9Q==
X-Gm-Message-State: AGi0PuajLwUrI1875oRe6LN6D6P44+Zy00W1VNGvUlQfk81wd/Z/HhB0
        c4cBQqbpXhw2q1ASmsORmJVsVw==
X-Google-Smtp-Source: APiQypK74epx4+Z0DDlpxpU9KwxL4Jh/72vQvUCksY2TgaoTyWLqAOPtXgI8bV1dGPwkGhaQbLL6Vg==
X-Received: by 2002:a05:6214:12f1:: with SMTP id w17mr3807952qvv.132.1586288194290;
        Tue, 07 Apr 2020 12:36:34 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id m5sm16364954qtk.85.2020.04.07.12.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 12:36:33 -0700 (PDT)
Message-ID: <abe902f2ebdfa41bd4d99b7beb3b6c7ec91d2a8f.camel@ndufresne.ca>
Subject: Re: [PATCH v8 4/5] media: rkvdec: Add the rkvdec driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     DVB_Linux_Media <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>
Date:   Tue, 07 Apr 2020 15:36:32 -0400
In-Reply-To: <5c417620e1baeed7ec4ac750ab481366df2aa590.camel@collabora.com>
References: <20200403221345.16702-1-ezequiel@collabora.com>
         <20200403221345.16702-5-ezequiel@collabora.com>
         <CAKQmDh_pCX_s2Ze7b1YBqgvEZHNrgzDUfcjPos8_GZq8x6=5Ng@mail.gmail.com>
         <5c417620e1baeed7ec4ac750ab481366df2aa590.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 07 avril 2020 à 11:35 -0300, Ezequiel Garcia a écrit :
> On Mon, 2020-04-06 at 16:27 -0400, Nicolas Dufresne wrote:
> > Le ven. 3 avr. 2020 à 18:14, Ezequiel Garcia <ezequiel@collabora.com> a écrit :
> > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > 
> > > The rockchip vdec block is a stateless decoder that's able to decode
> > > H264, HEVC and VP9 content. This commit adds the core infrastructure
> > > and the H264 backend. Support for VP9 and HEVS will be added later on.
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > 
> > Sorry for the late feedback (got a comment lower) ...
> > 
> > Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > 
> 
> Nice, thank you.
> 
> > > --
> > > v8:
> > > * Fix kfree and style changes, as suggested by Andriy.
> > > v7:
> > > * hverkuil-cisco@xs4all.nl: replaced VFL_TYPE_GRABBER by _VIDEO
> > > * Use macros and ARRAY_SIZE instead of magic numbers,
> > >   as suggested by Mauro.
> > > * Renamed M_N macro, suggested by Mauro.
> > > * Use v4l2_m2m_buf_done_and_job_finish.
> > > * Set buffers' zeroth plane payload in .buf_prepare
> > > * Refactor try/s_fmt for spec compliance.
> > > ---
> > >  MAINTAINERS                                |    7 +
> > >  drivers/staging/media/Kconfig              |    2 +
> > >  drivers/staging/media/Makefile             |    1 +
> > >  drivers/staging/media/rkvdec/Kconfig       |   15 +
> > >  drivers/staging/media/rkvdec/Makefile      |    3 +
> > >  drivers/staging/media/rkvdec/TODO          |   11 +
> > >  drivers/staging/media/rkvdec/rkvdec-h264.c | 1156 ++++++++++++++++++++
> > >  drivers/staging/media/rkvdec/rkvdec-regs.h |  223 ++++
> > >  drivers/staging/media/rkvdec/rkvdec.c      | 1103 +++++++++++++++++++
> > >  drivers/staging/media/rkvdec/rkvdec.h      |  121 ++
> > >  10 files changed, 2642 insertions(+)
> > >  create mode 100644 drivers/staging/media/rkvdec/Kconfig
> > >  create mode 100644 drivers/staging/media/rkvdec/Makefile
> > >  create mode 100644 drivers/staging/media/rkvdec/TODO
> > >  create mode 100644 drivers/staging/media/rkvdec/rkvdec-h264.c
> > >  create mode 100644 drivers/staging/media/rkvdec/rkvdec-regs.h
> > >  create mode 100644 drivers/staging/media/rkvdec/rkvdec.c
> > >  create mode 100644 drivers/staging/media/rkvdec/rkvdec.h
> > > 
> [..]
> > > +
> > > +static void set_ps_field(u32 *buf, struct rkvdec_ps_field field, u32 value)
> > > +{
> > > +       u8 bit = field.offset % 32, word = field.offset / 32;
> > > +       u64 mask = GENMASK_ULL(bit + field.len - 1, bit);
> > > +       u64 val = ((u64)value << bit) & mask;
> > > +
> > > +       buf[word] &= ~mask;
> > > +       buf[word] |= val;
> > > +       if (bit + field.len > 32) {
> > > +               buf[word + 1] &= ~(mask >> 32);
> > > +               buf[word + 1] |= val >> 32;
> > > +       }
> > > +}
> > > +
> > > +static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> > > +                           struct rkvdec_h264_run *run)
> > > +{
> > > +       struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
> > > +       const struct v4l2_ctrl_h264_sps *sps = run->sps;
> > > +       const struct v4l2_ctrl_h264_pps *pps = run->pps;
> > > +       const struct v4l2_ctrl_h264_decode_params *dec_params = run->decode_params;
> > > +       const struct v4l2_h264_dpb_entry *dpb = dec_params->dpb;
> > > +       struct rkvdec_h264_priv_tbl *priv_tbl = h264_ctx->priv_tbl.cpu;
> > > +       struct rkvdec_sps_pps_packet *hw_ps;
> > > +       dma_addr_t scaling_list_address;
> > > +       u32 scaling_distance;
> > > +       u32 i;
> > > +
> > > +       /*
> > > +        * HW read the SPS/PPS information from PPS packet index by PPS id.
> > > +        * offset from the base can be calculated by PPS_id * 32 (size per PPS
> > > +        * packet unit). so the driver copy SPS/PPS information to the exact PPS
> > > +        * packet unit for HW accessing.
> > > +        */
> > > +       hw_ps = &priv_tbl->param_set[pps->pic_parameter_set_id];
> > > +       memset(hw_ps, 0, sizeof(*hw_ps));
> > > +
> > > +#define WRITE_PPS(value, field) set_ps_field(hw_ps->info, field, value)
> > > +       /* write sps */
> > > +       WRITE_PPS(0xf, SEQ_PARAMETER_SET_ID);
> > > +       WRITE_PPS(0xff, PROFILE_IDC);
> > > +       WRITE_PPS(1, CONSTRAINT_SET3_FLAG);
> > 
> > At first I found that part rather interesting, but I see this
> > hardcoding matches what Rockchip do.
> > 
> > https://github.com/rockchip-linux/mpp/blob/release/mpp/hal/rkdec/h264d/hal_h264d_rkv_reg.c#L266
> > 
> > > +       WRITE_PPS(sps->chroma_format_idc, CHROMA_FORMAT_IDC);
> > 
> > But here's it's not so great. This driver does not implement any kind
> > of validation. In fact, if I pass 3
> > here  (YCbCr 4:4:4) it will accept it, and kind of decode some frames,
> > but eventually with crash and
> > reboot is needed. We should (as defined in the Statelss CODEC spec)
> > validate the SPS and refuse if
> > an unsupported profile idc, chroma idc, luma/chroma depth or coded
> > size is requested.
> 
> Perhaps we could validate that at request_validate time,
> or maybe ops.try_ctrl is better.
> 
> </thinking_out_loud>
> 
> > Validating the
> > S_FMT is not sufficient as one can trick the driver in allocating
> > buffers that are too small.
> > 
> 
> I am not sure I follow you: how do you think the driver
> can be tricked like this?

What I see is that there is no cross validation between the SPS
register configuration and the frame allocations done through S_FMT. So
if I cheat in S_FMT, and then pass an SPS that is larger then
announced, the HW could potentially overrun buffers. That entirely
depends on how much robustness there is in the HW implementation iself
(and if we have a register to pass the buffer size).

This is of course a gut feeling, I haven't found time to test this yet,
but it came to my mind after I notice that passing a 4:4:4 choma_idc
stream causes driver failure (no visible memory corruption or overrun
though, the driver just stops working). So the resulting issues might
not be that bad, but you endup loosing the decoder.

> 
> > What I suspect is that we need to be careful with this HW, as it seems
> > to be a bit half backed, which
> > means it might be supporting more features then supported by the TRM
> > or reference code, and we
> > must disable this with software.
> > 
> > (p.s. I can provide a stream to reproduce the 4:4:4 driver failure)
> > 
> 
> Thanks,
> Ezequiel
> 

