Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BBF61A0F63
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 16:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729306AbgDGOf6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 10:35:58 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41454 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729287AbgDGOf4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 10:35:56 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 9F442295A6A
Message-ID: <5c417620e1baeed7ec4ac750ab481366df2aa590.camel@collabora.com>
Subject: Re: [PATCH v8 4/5] media: rkvdec: Add the rkvdec driver
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
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
Date:   Tue, 07 Apr 2020 11:35:45 -0300
In-Reply-To: <CAKQmDh_pCX_s2Ze7b1YBqgvEZHNrgzDUfcjPos8_GZq8x6=5Ng@mail.gmail.com>
References: <20200403221345.16702-1-ezequiel@collabora.com>
         <20200403221345.16702-5-ezequiel@collabora.com>
         <CAKQmDh_pCX_s2Ze7b1YBqgvEZHNrgzDUfcjPos8_GZq8x6=5Ng@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2020-04-06 at 16:27 -0400, Nicolas Dufresne wrote:
> Le ven. 3 avr. 2020 à 18:14, Ezequiel Garcia <ezequiel@collabora.com> a écrit :
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > The rockchip vdec block is a stateless decoder that's able to decode
> > H264, HEVC and VP9 content. This commit adds the core infrastructure
> > and the H264 backend. Support for VP9 and HEVS will be added later on.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> 
> Sorry for the late feedback (got a comment lower) ...
> 
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 

Nice, thank you.

> > --
> > v8:
> > * Fix kfree and style changes, as suggested by Andriy.
> > v7:
> > * hverkuil-cisco@xs4all.nl: replaced VFL_TYPE_GRABBER by _VIDEO
> > * Use macros and ARRAY_SIZE instead of magic numbers,
> >   as suggested by Mauro.
> > * Renamed M_N macro, suggested by Mauro.
> > * Use v4l2_m2m_buf_done_and_job_finish.
> > * Set buffers' zeroth plane payload in .buf_prepare
> > * Refactor try/s_fmt for spec compliance.
> > ---
> >  MAINTAINERS                                |    7 +
> >  drivers/staging/media/Kconfig              |    2 +
> >  drivers/staging/media/Makefile             |    1 +
> >  drivers/staging/media/rkvdec/Kconfig       |   15 +
> >  drivers/staging/media/rkvdec/Makefile      |    3 +
> >  drivers/staging/media/rkvdec/TODO          |   11 +
> >  drivers/staging/media/rkvdec/rkvdec-h264.c | 1156 ++++++++++++++++++++
> >  drivers/staging/media/rkvdec/rkvdec-regs.h |  223 ++++
> >  drivers/staging/media/rkvdec/rkvdec.c      | 1103 +++++++++++++++++++
> >  drivers/staging/media/rkvdec/rkvdec.h      |  121 ++
> >  10 files changed, 2642 insertions(+)
> >  create mode 100644 drivers/staging/media/rkvdec/Kconfig
> >  create mode 100644 drivers/staging/media/rkvdec/Makefile
> >  create mode 100644 drivers/staging/media/rkvdec/TODO
> >  create mode 100644 drivers/staging/media/rkvdec/rkvdec-h264.c
> >  create mode 100644 drivers/staging/media/rkvdec/rkvdec-regs.h
> >  create mode 100644 drivers/staging/media/rkvdec/rkvdec.c
> >  create mode 100644 drivers/staging/media/rkvdec/rkvdec.h
> > 
> 
[..]
> > +
> > +static void set_ps_field(u32 *buf, struct rkvdec_ps_field field, u32 value)
> > +{
> > +       u8 bit = field.offset % 32, word = field.offset / 32;
> > +       u64 mask = GENMASK_ULL(bit + field.len - 1, bit);
> > +       u64 val = ((u64)value << bit) & mask;
> > +
> > +       buf[word] &= ~mask;
> > +       buf[word] |= val;
> > +       if (bit + field.len > 32) {
> > +               buf[word + 1] &= ~(mask >> 32);
> > +               buf[word + 1] |= val >> 32;
> > +       }
> > +}
> > +
> > +static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> > +                           struct rkvdec_h264_run *run)
> > +{
> > +       struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
> > +       const struct v4l2_ctrl_h264_sps *sps = run->sps;
> > +       const struct v4l2_ctrl_h264_pps *pps = run->pps;
> > +       const struct v4l2_ctrl_h264_decode_params *dec_params = run->decode_params;
> > +       const struct v4l2_h264_dpb_entry *dpb = dec_params->dpb;
> > +       struct rkvdec_h264_priv_tbl *priv_tbl = h264_ctx->priv_tbl.cpu;
> > +       struct rkvdec_sps_pps_packet *hw_ps;
> > +       dma_addr_t scaling_list_address;
> > +       u32 scaling_distance;
> > +       u32 i;
> > +
> > +       /*
> > +        * HW read the SPS/PPS information from PPS packet index by PPS id.
> > +        * offset from the base can be calculated by PPS_id * 32 (size per PPS
> > +        * packet unit). so the driver copy SPS/PPS information to the exact PPS
> > +        * packet unit for HW accessing.
> > +        */
> > +       hw_ps = &priv_tbl->param_set[pps->pic_parameter_set_id];
> > +       memset(hw_ps, 0, sizeof(*hw_ps));
> > +
> > +#define WRITE_PPS(value, field) set_ps_field(hw_ps->info, field, value)
> > +       /* write sps */
> > +       WRITE_PPS(0xf, SEQ_PARAMETER_SET_ID);
> > +       WRITE_PPS(0xff, PROFILE_IDC);
> > +       WRITE_PPS(1, CONSTRAINT_SET3_FLAG);
> 
> At first I found that part rather interesting, but I see this
> hardcoding matches what Rockchip do.
> 
> https://github.com/rockchip-linux/mpp/blob/release/mpp/hal/rkdec/h264d/hal_h264d_rkv_reg.c#L266
> 
> > +       WRITE_PPS(sps->chroma_format_idc, CHROMA_FORMAT_IDC);
> 
> But here's it's not so great. This driver does not implement any kind
> of validation. In fact, if I pass 3
> here  (YCbCr 4:4:4) it will accept it, and kind of decode some frames,
> but eventually with crash and
> reboot is needed. We should (as defined in the Statelss CODEC spec)
> validate the SPS and refuse if
> an unsupported profile idc, chroma idc, luma/chroma depth or coded
> size is requested.

Perhaps we could validate that at request_validate time,
or maybe ops.try_ctrl is better.

</thinking_out_loud>

> Validating the
> S_FMT is not sufficient as one can trick the driver in allocating
> buffers that are too small.
> 

I am not sure I follow you: how do you think the driver
can be tricked like this?

> What I suspect is that we need to be careful with this HW, as it seems
> to be a bit half backed, which
> means it might be supporting more features then supported by the TRM
> or reference code, and we
> must disable this with software.
> 
> (p.s. I can provide a stream to reproduce the 4:4:4 driver failure)
> 

Thanks,
Ezequiel

