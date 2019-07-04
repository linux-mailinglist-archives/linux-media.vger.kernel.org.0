Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A86425F359
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 09:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbfGDHTn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 4 Jul 2019 03:19:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47894 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbfGDHTm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 03:19:42 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5996328AC32;
        Thu,  4 Jul 2019 08:19:38 +0100 (BST)
Date:   Thu, 4 Jul 2019 09:19:34 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Kees Cook <keescook@chromium.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        ZhiChao Yu <zhichao.yu@rock-chips.com>
Subject: Re: [PATCH v2 2/2] media: hantro: Add support for VP8 decoding on
 rk3288
Message-ID: <20190704091934.3524f019@collabora.com>
In-Reply-To: <1562164006.4604.7.camel@pengutronix.de>
References: <20190702170016.5210-1-ezequiel@collabora.com>
 <20190702170016.5210-3-ezequiel@collabora.com>
 <1562164006.4604.7.camel@pengutronix.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+Kees for the safe-array-iteratio question.

On Wed, 03 Jul 2019 16:26:46 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Hi Ezequiel
> 
> On Tue, 2019-07-02 at 14:00 -0300, Ezequiel Garcia wrote:
> > From: ZhiChao Yu <zhichao.yu@rock-chips.com>
> > 
> > Introduce VP8 decoding support in RK3288.
> > 
> > Signed-off-by: ZhiChao Yu <zhichao.yu@rock-chips.com>
> > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>  
> 
> I have just tried this (with broken userspace) and got a crash in
> cfg_parts, see below for details:
> 
> [  114.308757] Unable to handle kernel paging request at virtual address ffff0000112b0002
> [  114.316691] Mem abort info:
> [  114.319503]   ESR = 0x96000021
> [  114.322576]   Exception class = DABT (current EL), IL = 32 bits
> [  114.328513]   SET = 0, FnV = 0
> [  114.331586]   EA = 0, S1PTW = 0
> [  114.334744] Data abort info:
> [  114.337626]   ISV = 0, ISS = 0x00000021
> [  114.341479]   CM = 0, WnR = 0
> [  114.344466] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000040d61000
> [  114.351185] [ffff0000112b0002] pgd=00000000dffff003, pud=00000000dfffe003, pmd=00000000dbf36003, pte=00e8000038300707
> [  114.361822] Internal error: Oops: 96000021 [#1] PREEMPT SMP
> [  114.367394] Modules linked in: crct10dif_ce hantro_vpu(C) videobuf2_dma_contig v4l2_mem2mem
> [  114.375749] Process ffmpeg (pid: 1871, stack limit = 0x0000000059d846e4)
> [  114.382450] CPU: 1 PID: 1871 Comm: ffmpeg Tainted: G         C        5.1.16-20190703-1 #2
> [  114.390710] Hardware name: NXP i.MX8MQ EVK (DT)
> [  114.395240] pstate: 40000005 (nZcv daif -PAN -UAO)
> [  114.400042] pc : hantro_g1_vp8_dec_run+0x1178/0x18a0 [hantro_vpu]
> [  114.406139] lr : hantro_g1_vp8_dec_run+0x1160/0x18a0 [hantro_vpu]
> [  114.412229] sp : ffff000011ae3c10
> [  114.415541] x29: ffff000011ae3c10 x28: ffff000008a154c8 
> [  114.420853] x27: 000000007033b039 x26: ffff000008a130f0 
> [  114.426164] x25: 000000000000000c x24: ffff000008a153f0 
> [  114.431474] x23: ffff800099a0d880 x22: ffff000008a13150 
> [  114.436785] x21: 000000000c5b88d0 x20: ffff80009b7d65a0 
> [  114.442096] x19: ffff800099bd3800 x18: 0000000000000010 
> [  114.447407] x17: 0000000000000001 x16: 0000000000000007 
> [  114.452717] x15: ffffffffffffffff x14: ffff000010e8c5c8 
> [  114.458028] x13: ffff000091ae3987 x12: ffff0000112b0002 
> [  114.463339] x11: ffff000010ea4000 x10: ffff000011ae3910 
> [  114.468649] x9 : 00000000ffffffd0 x8 : 00000000edcb88d0 
> [  114.473960] x7 : 0000000000000125 x6 : ffff000010e8cd60 
> [  114.479270] x5 : ffff000010e8c000 x4 : 0000000000000000 
> [  114.484580] x3 : 0000000000000002 x2 : 8127d140a3196d00 
> [  114.489891] x1 : 0000000000000000 x0 : 00000000e1700000 
> [  114.495201] Call trace:
> [  114.497652]  hantro_g1_vp8_dec_run+0x1178/0x18a0 [hantro_vpu]
> [  114.503401]  device_run+0xac/0xc0 [hantro_vpu]
> [  114.507849]  v4l2_m2m_try_run+0x9c/0x110 [v4l2_mem2mem]
> [  114.513077]  v4l2_m2m_request_queue+0xd4/0x130 [v4l2_mem2mem]
> [  114.518826]  media_request_ioctl+0x1e8/0x2d0
> [  114.523097]  do_vfs_ioctl+0xc4/0x870
> [  114.526671]  ksys_ioctl+0x84/0xc0
> [  114.529985]  __arm64_sys_ioctl+0x28/0x40
> [  114.533908]  el0_svc_common.constprop.0+0x98/0x170
> [  114.538698]  el0_svc_handler+0x2c/0x40
> [  114.542447]  el0_svc+0x8/0xc
> [  114.545328] Code: 0b150008 b94002c3 121d7108 8b23418c (b940018c) 
> [  114.551421] ---[ end trace b9ad6b0f72902ba5 ]---
> 
> > ---
> > Changes from v1:
> > * Place operators at the end of each line.
> > * Update to uAPI changes.
> > ---
> >  drivers/staging/media/hantro/Makefile         |   4 +-
> >  drivers/staging/media/hantro/hantro.h         |   5 +
> >  drivers/staging/media/hantro/hantro_drv.c     |   6 +
> >  .../staging/media/hantro/hantro_g1_vp8_dec.c  | 552 ++++++++++++++++++
> >  drivers/staging/media/hantro/hantro_hw.h      |  17 +
> >  drivers/staging/media/hantro/hantro_v4l2.c    |   1 +
> >  drivers/staging/media/hantro/hantro_vp8.c     | 188 ++++++
> >  drivers/staging/media/hantro/rk3288_vpu_hw.c  |  22 +-
> >  8 files changed, 793 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/staging/media/hantro/hantro_g1_vp8_dec.c
> >  create mode 100644 drivers/staging/media/hantro/hantro_vp8.c
> >   
> [...]
> > diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
> > new file mode 100644
> > index 000000000000..31d31faae4aa
> > --- /dev/null
> > +++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
> > @@ -0,0 +1,552 @@  
> [...]
> > +/* dct partition base address regs */
> > +static const struct vp8_dec_reg vp8_dec_dct_base[8] = {  
> [...]
> > +/* dct partition start bits regs */
> > +static const struct vp8_dec_reg vp8_dec_dct_start_bits[8] = {  
> 
> So these arrays can be directly indexed with values smaller than 8 ...
> 
> [...]
> > +static void cfg_parts(struct hantro_ctx *ctx,
> > +		      const struct v4l2_ctrl_vp8_frame_header *hdr)
> > +{  
> [...]
> > +	/* dct partitions base address */
> > +	for (i = 0; i < hdr->num_dct_parts; i++) {
> > +		u32 byte_offset = dct_part_offset + dct_size_part_size + count;
> > +		u32 base_addr = byte_offset + src_dma;
> > +
> > +		vp8_dec_reg_write(vpu, &vp8_dec_dct_base[i],
> > +				  base_addr & (~DEC_8190_ALIGN_MASK));
> > +
> > +		vp8_dec_reg_write(vpu, &vp8_dec_dct_start_bits[i],
> > +				  (byte_offset & DEC_8190_ALIGN_MASK) * 8);  
> 
> ... and here they are indexed with i, which is only guaranteed to be
> smaller than hdr->num_dct_parts. num_dct_parts is passed from userspace
> via v4l2-ctrl, it can be as large as 255.

Hm, I fear we have the same problem in other places (including the
patch series adding support for H264). Kees, I wonder if there's some
kind of safe array iterator macro, something like

#define for_each_static_array_entry_safe(_array, _iter, _max_user) 		\
	_max_user = min_t(typeof(_max_user), _max_user,	ARRAY_SIZE(_array));	\
	for (_iter = 0; _iter < _max_user; _iter++)

The problem with this approach is that it's papering over the real
issue, which is that hdr->num_dct_parts should be checked and the
driver/core should return an error when it's > 7 instead of silently
iterating over the 8 entries of the dct[] arrays. Static code analysis
tools can probably detect such issues too.

Any advice on how to detect such problems early on?

Thanks,

Boris

