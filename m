Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA38749D9
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 11:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390482AbfGYJ1v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 05:27:51 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42086 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390465AbfGYJ1v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 05:27:51 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 8990528AB2D
Message-ID: <1564046865.5850.1.camel@collabora.com>
Subject: Re: kernel Warning when using vivid with contiguous dma
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     "Hans Verkuil (hansverk)" <hansverk@cisco.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>
Cc:     "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "vincent.abriou@st.com" <vincent.abriou@st.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "kernel@collabora.com" <kernel@collabora.com>
Date:   Thu, 25 Jul 2019 11:27:45 +0200
In-Reply-To: <95693bd5-2118-db95-fbf9-d5e3fc301f0a@cisco.com>
References: <1563794460.2546.3.camel@collabora.com>
         <20190722083748.2abd3fe1@coco.lan> <1563887680.23193.9.camel@collabora.com>
         <95693bd5-2118-db95-fbf9-d5e3fc301f0a@cisco.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2019-07-23 at 14:05 +0000, Hans Verkuil (hansverk) wrote:
> On 7/23/19 3:14 PM, Dafna Hirschfeld wrote:
> > On Mon, 2019-07-22 at 08:38 -0300, Mauro Carvalho Chehab wrote:
> > > Em Mon, 22 Jul 2019 13:21:00 +0200
> > > Dafna Hirschfeld <dafna.hirschfeld@collabora.com> escreveu:
> > > 
> > > > I loaded the vivid module with contiguous DMA and ran streaming
> > > > with
> > > > it with large image dimensions
> > > > [  306.437327] Call Trace:
> > > > [  306.437338]  __dma_direct_alloc_pages+0xc9/0x1c0
> > > > [  306.437343]  dma_direct_alloc_pages+0x24/0xf0
> > > > [  306.437348]  dma_direct_alloc+0xe/0x10
> > > > [  306.437351]  dma_alloc_attrs+0x84/0xd0
> > > 
> > > Hmm... we had a recent regression affecting other media devices,
> > > reported via Kaffeine mailing list:
> > > 
> > > 	https://bugs.kde.org/show_bug.cgi?id=408004#c35
> > > 
> > > While this one was for S/G, maybe it is somewhat related.
> > > 
> > 
> > Also, I compiled vivid as built-in into the kernel (not as a
> > separate module) for nitrogen8m device (imx8) and
> > set it to use contig dma for mem_ops. Then I get a crash when
> > running the above command.
> > I use the master branch of
> > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > with this patch to vivid:
> > 
> > diff --git a/drivers/media/platform/vivid/vivid-core.c
> > b/drivers/media/platform/vivid/vivid-core.c
> > index bc2a176937a4..0531f36d7d0a 100644
> > --- a/drivers/media/platform/vivid/vivid-core.c
> > +++ b/drivers/media/platform/vivid/vivid-core.c
> > @@ -140,7 +140,7 @@ static bool no_error_inj;
> >  module_param(no_error_inj, bool, 0444);
> >  MODULE_PARM_DESC(no_error_inj, " if set disable the error
> > injecting controls");
> >  
> > -static unsigned int allocators[VIVID_MAX_DEVS] = { [0 ...
> > (VIVID_MAX_DEVS - 1)] = 0 };
> > +static unsigned int allocators[VIVID_MAX_DEVS] = { [0 ...
> > (VIVID_MAX_DEVS - 1)] = 1 };
> >  module_param_array(allocators, uint, NULL, 0444);
> >  MODULE_PARM_DESC(allocators, " memory allocator selection, default
> > is 0.\n"
> >                              "\t\t    0 == vmalloc\n"
> > 
> > And then on the nitrogen8m device I get the following crash report
> > which seems to be related to the cma allocation
> > 
> > ubuntu@bionic-dev64:~$ v4l2-ctl -d3 -v
> > width=2592,height=1944,pixelformat=UYVY,bytesperline=5184 --stream-
> > mmap --stream-to video.UYVY
> > [   70.139006] cma: cma_alloc(cma (____ptrval____), count 4050,
> > align 8)
> > [   70.159829] cma: cma_alloc(cma (____ptrval____), count 4050,
> > align 8)
> > [   70.166292] cma: cma_alloc: alloc failed, req-size: 4050 pages,
> > ret: -12
> > [   70.173006] cma: number of available pages: 72@184+3886@4306=>
> > 3958 free of 8192 total pages
> 
> So it looks like the CMA area is too small. Look at the
> CONFIG_CMA_SIZE_MBYTES
> setting.
> 
> That explains why it fails.
> 
> > [   70.181471] cma: cma_alloc(): returned (____ptrval____)
> > [   70.192449] cma: cma_alloc(cma (____ptrval____), count 4050,
> > align 8)
> > [   70.198907] cma: cma_alloc: alloc failed, req-size: 4050 pages,
> > ret: -12
> > [   70.205625] cma: number of available pages: 72@184+3886@4306=>
> > 3958 free of 8192 total pages
> > [   70.205733] systemd-journald[204]:
> > /var/log/journal/5cca8918401249538eacb5efd5b9b052/system.journal:
> > Journal file corrupted, rotating.
> > [   70.214083] cma: cma_alloc(): returned (____ptrval____)
> > [   70.219867] cma: cma_alloc(cma (____ptrval____), count 4050,
> > align 8)
> > [   70.237878] cma: cma_alloc: alloc failed, req-size: 4050 pages,
> > ret: -12
> > [   70.244599] cma: number of available pages: 72@184+3886@4306=>
> > 3958 free of 8192 total pages
> > [   70.253066] cma: cma_alloc(): returned (____ptrval____)
> > [   70.264893] cma: cma_release(page (____ptrval____))
> > [   70.272871] cma: cma_release(page (____ptrval____))
> > [   70.277800] BUG: Bad page state in process v4l2-ctl  pfn:b5a00
> 
> But that shouldn't lead to this.
> 
> It could be a bug somewhere.
> 
> Does it work fine if you use a smaller resolution? Perhaps there is
> something
> wrong in error handling in vb2. These corner cases are not exactly
> tested
> very often (or at all!).
> 
> Regards,
> 
> 	Hans

Hi, I suspect that the error is in the cma code, the crash occurs first
after the commit ""dma-contiguous: add dma_{alloc,free}_contiguous()
helpers"

Dafna
> 
> > [   70.283652] page:ffff7e0001d68000 refcount:13 mapcount:0
> > mapping:0000000000000000 index:0x0 compound_mapcount: 0
> > [   70.293874] flags: 0xffff00000010000(head)
> > [   70.297999] raw: 0ffff00000010000 dead000000000100
> > dead000000000122 0000000000000000
> > [   70.305772] raw: 0000000000000000 0000000000000000
> > 0000000dffffffff 0000000000000000
> > [   70.313526] page dumped because: nonzero _refcount
> > [   70.318327] Modules linked in:
> > [   70.321399] CPU: 2 PID: 482 Comm: v4l2-ctl Not tainted 5.3.0-
> > rc1+ #159
> > [   70.327927] Hardware name: Boundary Devices i.MX8MQ Nitrogen8M
> > (DT)
> > [   70.334196] Call trace:
> > [   70.336654]  dump_backtrace+0x0/0x148
> > [   70.340319]  show_stack+0x14/0x20
> > [   70.343640]  dump_stack+0x9c/0xc4
> > [   70.346959]  bad_page+0xe4/0x148
> > [   70.350188]  free_pages_check_bad+0x70/0xa8
> > [   70.354375]  __free_pages_ok+0x294/0x2b0
> > [   70.358301]  __free_pages+0x38/0x50
> > [   70.361795]  dma_free_contiguous+0x90/0x98
> > [   70.365892]  __dma_direct_free_pages+0x18/0x20
> > [   70.370338]  arch_dma_free+0x74/0x88
> > [   70.373916]  dma_direct_free+0x4c/0x58
> > [   70.377668]  dma_free_attrs+0x88/0xe0
> > [   70.381335]  vb2_dc_put+0x44/0x60
> > [   70.384653]  __vb2_buf_mem_free+0x68/0x110
> > [   70.388749]  __vb2_queue_free+0x398/0x538
> > [   70.392763]  vb2_core_queue_release+0x34/0x48
> > [   70.397122]  _vb2_fop_release+0x88/0x98
> > [   70.400960]  vb2_fop_release+0x28/0x50
> > [   70.404712]  vivid_fop_release+0x88/0x208
> > [   70.408725]  v4l2_release+0x6c/0xf0
> > [   70.412216]  __fput+0x8c/0x1f8
> > [   70.415270]  ____fput+0xc/0x18
> > [   70.418328]  task_work_run+0x94/0xb0
> > [   70.421907]  do_exit+0x2b0/0x9f8
> > [   70.425138]  do_group_exit+0x34/0x98
> > [   70.428717]  get_signal+0x104/0x678
> > [   70.432209]  do_notify_resume+0x2ac/0x380
> > [   70.436220]  work_pending+0x8/0x10
> > [   70.439648] Disabling lock debugging due to kernel taint
> > [   70.444974] BUG: Bad page state in process v4l2-ctl  pfn:b5a01
> > [   70.450822] page:ffff7e0001d68040 refcount:0 mapcount:0
> > mapping:dead000000000400 index:0x1 compound_mapcount: 0
> > [   70.451427] printk: systemd: 27 output lines suppressed due to
> > ratelimiting
> > [   70.460924] flags: 0xffff00000000000()
> > [   70.460931] raw: 0ffff00000000000 ffff7e0001d68001
> > ffffffff01d60301 dead000000000400
> > [   70.467945] Kernel panic - not syncing: Attempted to kill init!
> > exitcode=0x0000000b
> > [   70.471659] raw: 0000000000000000 0000000000000000
> > 00000000ffffffff 0000000000000000
> > [   70.479389] CPU: 1 PID: 1 Comm: systemd Tainted:
> > G    B             5.3.0-rc1+ #159
> > [   70.479394] Hardware name: Boundary Devices i.MX8MQ Nitrogen8M
> > (DT)
> > [   70.487058] page dumped because: non-NULL mapping
> > [   70.494782] Call trace:
> > [   70.494789]  dump_backtrace+0x0/0x148
> > [   70.494793]  show_stack+0x14/0x20
> > [   70.494799]  dump_stack+0x9c/0xc4
> > [   70.502460] Modules linked in:
> > [   70.508713]  panic+0x140/0x32c
> > [   70.508718]  complete_and_exit+0x0/0x20
> > [   70.508724]  do_group_exit+0x34/0x98
> > [   70.539649]  get_signal+0x104/0x678
> > [   70.543139]  do_notify_resume+0x2ac/0x380
> > [   70.547149]  work_pending+0x8/0x10
> > [   70.550553] CPU: 2 PID: 482 Comm: v4l2-ctl Tainted:
> > G    B             5.3.0-rc1+ #159
> > [   70.550554] SMP: stopping secondary CPUs
> > [   70.562387] Hardware name: Boundary Devices i.MX8MQ Nitrogen8M
> > (DT)
> > [   70.568653] Call trace:
> > [   70.571103]  dump_backtrace+0x0/0x148
> > [   70.574765]  show_stack+0x14/0x20
> > [   70.578081]  dump_stack+0x9c/0xc4
> > [   70.581398]  bad_page+0xe4/0x148
> > [   70.584627]  free_pages_check_bad+0x70/0xa8
> > [   70.588814]  __free_pages_ok+0x294/0x2b0
> > [   70.592737]  __free_pages+0x38/0x50
> > [   70.596229]  dma_free_contiguous+0x90/0x98
> > [   70.600327]  __dma_direct_free_pages+0x18/0x20
> > [   70.604771]  arch_dma_free+0x74/0x88
> > [   70.608347]  dma_direct_free+0x4c/0x58
> > [   70.612098]  dma_free_attrs+0x88/0xe0
> > [   70.615765]  vb2_dc_put+0x44/0x60
> > [   70.619082]  __vb2_buf_mem_free+0x68/0x110
> > [   70.623180]  __vb2_queue_free+0x398/0x538
> > [   70.627192]  vb2_core_queue_release+0x34/0x48
> > [   70.631551]  _vb2_fop_release+0x88/0x98
> > [   70.635387]  vb2_fop_release+0x28/0x50
> > [   70.639138]  vivid_fop_release+0x88/0x208
> > [   70.643149]  v4l2_release+0x6c/0xf0
> > [   70.646638]  __fput+0x8c/0x1f8
> > [   70.649693]  ____fput+0xc/0x18
> > [   70.652750]  task_work_run+0x94/0xb0
> > [   70.656326]  do_exit+0x2b0/0x9f8
> > [   70.659554]  do_group_exit+0x34/0x98
> > [   70.663130]  get_signal+0x104/0x678
> > [   70.666621]  do_notify_resume+0x2ac/0x380
> > [   70.670632]  work_pending+0x8/0x10
> > [   70.674036] Kernel Offset: disabled
> > [   70.677526] CPU features: 0x0002,2000200c
> > [   70.681535] Memory Limit: none
> > [   70.684599] ---[ end Kernel panic - not syncing: Attempted to
> > kill init! exitcode=0x0000000b ]---
> > 
> > Dafna
> > 
> > > Thanks,
> > > Mauro
