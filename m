Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86DB067DE0A
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 07:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbjA0G5f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 01:57:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbjA0G5e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 01:57:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888D7E0
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 22:57:32 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 159D22B3;
        Fri, 27 Jan 2023 07:57:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674802649;
        bh=BBCcRJxs2gcQ51hIo39Yb07kjx5HFdIArnPg/52xVjU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ne1kki7gSRS4t1BETb08x/6ZizTk6PDH0livrEcpqNAEqH6RjGf8uradPVpf58+ef
         4fx81wpvMiiV91vi55RRsJbHgn7RPNzH8J+oscS2uEuhN8gvVPbf4SieYQbNiOkCRq
         bTJXLwebuA/OVGXmObno7m7QqVwDufHvbV8rFtv4=
Date:   Fri, 27 Jan 2023 08:57:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        kernel@pengutronix.de, linux-imx@nxp.com
Subject: Re: [PATCH v1 2/6] media: imx: imx7-media-csi: Simplify
 imx7_csi_video_init_format()
Message-ID: <Y9N11U7x/5h5eKHf@pendragon.ideasonboard.com>
References: <20230127022715.27234-1-laurent.pinchart@ideasonboard.com>
 <20230127022715.27234-3-laurent.pinchart@ideasonboard.com>
 <CAHCN7x+VFoQskRGSSRxLPkE0=LGZ+vA=23Cc04NBTUyR03WNUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7x+VFoQskRGSSRxLPkE0=LGZ+vA=23Cc04NBTUyR03WNUw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On Thu, Jan 26, 2023 at 09:19:28PM -0600, Adam Ford wrote:
> On Thu, Jan 26, 2023 at 8:27 PM Laurent Pinchart wrote:
> >
> > The imx7_csi_video_init_format() function instantiates a
> > v4l2_subdev_format on the stack, to only use the .format field of that
> > structure. Replace it with a v4l2_mbus_framefmt instance.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> 
> With this series and the CSIS series you posted earlier, I get a ton
> of splat and the ov5640 camera doesn't appear in the media information
> with media-ctrl -p

Oops :-S Thank a lot for testing.

>    12.386980] lr : imx7_csi_probe+0x26c/0x380 [imx7_media_csi]
> [   12.387010] sp : ffff80000afd3900
> [   12.387013] x29: ffff80000afd3900 x28: 0000000000000000 x27: 0000000000000000
> [   12.387025] x26: ffff8000012ae180 x25: 0000000000000001 x24: ffff000005bb8340
> [   12.387033] x23: ffff000005bb8450 x22: ffff000005bb80a8 x21: ffff8000012ac4f8
> [   12.387040] x20: 0000000000000000 x19: ffff000005bb8080 x18: ffffffffffffffff
> [   12.387048] x17: 0000000000000000
> [   12.393690] Bluetooth: HCI UART protocol QCA registered
> [   12.397321]  x16: 0000000000000000 x15: 64656d3d4d455453
> [   12.397327] x14: ffff80000a56d220 x13: 0000000000000040 x12: 0000000000000228
> [   12.397335] x11: 0000000000000000 x10: 0000000000000000 x9 : 000001e000000280
> [   12.397342] x8 : 0000000100002006 x7 : 0002000100000008 x6 : 0000000000000002
> [   12.397350] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> [   12.397357] x2 : ffff000005bb84c8 x1 : 0000000000000000 x0 : ffff000005bb8450
> [   12.397365] Call trace:
> [   12.397368]  imx7_csi_init_cfg+0x64/0x9c [imx7_media_csi]
> [   12.397385]  platform_probe+0x68/0xe0
> [   12.406436] Bluetooth: HCI UART protocol Marvell registered
> [   12.413735]  really_probe+0xbc/0x2dc
> [   12.413743]  __driver_probe_device+0x78/0xe0
> [   12.413748]  driver_probe_device+0xd8/0x160
> [   12.413754]  __driver_attach+0x94/0x19c
> [   12.413759]  bus_for_each_dev+0x70/0xd0
> [   12.413764]  driver_attach+0x24/0x30
> [   12.413769]  bus_add_driver+0x154/0x20c
> [   12.413774]  driver_register+0x78/0x130
> [   12.413780]  __platform_driver_register+0x28/0x34
> [   12.413786]  imx7_csi_driver_init+0x20/0x1000 [imx7_media_csi]
> [   12.413803]  do_one_initcall+0x50/0x1d0
> [   12.413810]  do_init_module+0x48/0x1d0
> [   12.413817]  load_module+0x193c/0x1cb0
> [   12.413822]  __do_sys_finit_module+0xa8/0x100
> [   12.413828]  __arm64_sys_finit_module+0x20/0x30
> [   12.413834]  invoke_syscall+0x48/0x114
> [   12.413842]  el0_svc_common.constprop.0+0xd4/0xfc
> [   12.413848]  do_el0_svc+0x3c/0xc0
> [   12.413854]  el0_svc+0x2c/0x84
> [   12.413863]  el0t_64_sync_handler+0xbc/0x140
> [   12.624336]  el0t_64_sync+0x190/0x194
> [   12.628002] ---[ end trace 0000000000000000 ]---
> [   12.633012] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000000
> [   12.641948] Mem abort info:
> [   12.644812]   ESR = 0x0000000096000044
> [   12.648652]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   12.654047]   SET = 0, FnV = 0
> [   12.654923] imx8m-ddrc-devfreq 3d400000.memory-controller: failed
> to init firmware freq info: -19
> [   12.657176]   EA = 0, S1PTW = 0
> [   12.669382]   FSC = 0x04: level 0 translation fault
> [   12.674349] Data abort info:
> [   12.677284]   ISV = 0, ISS = 0x00000044
> [   12.681169]   CM = 0, WnR = 1
> [   12.684189] user pgtable: 4k pages, 48-bit VAs, pgdp=000000004597e000
> [   12.690698] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
> [   12.697570] Internal error: Oops: 0000000096000044 [#1] PREEMPT SMP
> [   12.703848] Modules linked in: imx8m_ddrc v4l2_h264
> fsl_imx8_ddr_perf hci_uart cfg80211 imx7_media_csi(+) v4l2_mem2mem
> btqca videobuf2_dma_contig videobuf2_memops btbcm videobuf2_v4l2
> imx_mipi_csis etnaviv videobuf2_common gpu_sched bluetooth
> snd_soc_wm8962 clk_bd718x7 ecdh_generic ecc rfkill rtc_pcf85363 at24
> caam error spi_imx snd_soc_fsl_sai rtc_snvs snvs_pwrkey
> snd_soc_fsl_utils imx_pcm_dma imx8mm_thermal imx_cpufreq_dt imx_sdma
> ov5640 v4l2_fwnode v4l2_async videodev mc fuse drm ipv6
> [   12.747111] CPU: 0 PID: 161 Comm: systemd-udevd Tainted: G        W
>          6.2.0-rc3-30330-gb58b9dd3fb9e-dirty #3
> [   12.757549] Hardware name: Beacon EmbeddedWorks i.MX8M Mini
> Development Kit (DT)
> [   12.764945] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   12.771908] pc : imx7_csi_init_cfg+0x70/0x9c [imx7_media_csi]
> [   12.777674] lr : imx7_csi_probe+0x26c/0x380 [imx7_media_csi]
> [   12.783344] sp : ffff80000afd3900
> [   12.786655] x29: ffff80000afd3900 x28: 0000000000000000 x27: 0000000000000000
> [   12.793796] x26: ffff8000012ae180 x25: 0000000000000001 x24: ffff000005bb8340
> [   12.800934] x23: ffff000005bb8450 x22: ffff000005bb80a8 x21: ffff8000012ac4f8
> [   12.808072] x20: 0000000000000000 x19: ffff000005bb8080 x18: ffffffffffffffff
> [   12.815215] x17: 0000000000000000 x16: 0000000000000000 x15: 64656d3d4d455453
> [   12.822354] x14: ffff80000a56d220 x13: 0000000000000040 x12: 0000000000000228
> [   12.829497] x11: 0000000000000000 x10: 0000000000000000 x9 : 000001e000000280
> [   12.836636] x8 : 0000000100002006 x7 : 0002000100000008 x6 : 0000000000000002
> [   12.843778] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000050
> [   12.850918] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000005bb8450
> [   12.858058] Call trace:
> [   12.860503]  imx7_csi_init_cfg+0x70/0x9c [imx7_media_csi]
> [   12.865915]  platform_probe+0x68/0xe0
> [   12.869584]  really_probe+0xbc/0x2dc
> [   12.873160]  __driver_probe_device+0x78/0xe0
> [   12.877434]  driver_probe_device+0xd8/0x160
> [   12.881618]  __driver_attach+0x94/0x19c
> [   12.885456]  bus_for_each_dev+0x70/0xd0
> [   12.889293]  driver_attach+0x24/0x30
> [   12.892868]  bus_add_driver+0x154/0x20c
> [   12.896707]  driver_register+0x78/0x130
> [   12.900545]  __platform_driver_register+0x28/0x34
> [   12.905255]  imx7_csi_driver_init+0x20/0x1000 [imx7_media_csi]
> [   12.911099]  do_one_initcall+0x50/0x1d0
> [   12.914937]  do_init_module+0x48/0x1d0
> [   12.918691]  load_module+0x193c/0x1cb0
> [   12.922442]  __do_sys_finit_module+0xa8/0x100
> [   12.926802]  __arm64_sys_finit_module+0x20/0x30
> [   12.931336]  invoke_syscall+0x48/0x114
> [   12.935090]  el0_svc_common.constprop.0+0xd4/0xfc
> [   12.939796]  do_el0_svc+0x3c/0xc0
> [   12.943114]  el0_svc+0x2c/0x84
> [   12.946174]  el0t_64_sync_handler+0xbc/0x140
> [   12.950446]  el0t_64_sync+0x190/0x194
> [   12.954114] Code: b5fffe81 d4210000 d2800002 91014063 (a9002049)
> [   12.960209] ---[ end trace 0000000000000000 ]---

It appears I forgot something. Could you try with the following change ?

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 9275447987d1..81d5f08b02d1 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -2259,21 +2259,15 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;

-	/* Set the default mbus formats. */
-	ret = imx7_csi_init_cfg(&csi->sd, NULL);
-	if (ret)
-		goto media_cleanup;
-
 	ret = imx7_csi_async_register(csi);
 	if (ret)
-		goto subdev_notifier_cleanup;
+		goto err_async_unregister;

 	return 0;

-subdev_notifier_cleanup:
+err_async_unregister:
 	v4l2_async_nf_unregister(&csi->notifier);
 	v4l2_async_nf_cleanup(&csi->notifier);
-media_cleanup:
 	imx7_csi_media_cleanup(csi);

 	return ret;

> The media information:
> 
> root@beacon-imx8mm-kit:~# media-ctl -p
> Media controller API version 6.2.0
> 
> Media device information
> ------------------------
> driver          imx7-csi
> model           imx-media
> serial
> bus info        platform:32e20000.csi
> hw revision     0x0
> driver version  6.2.0
> 
> Device topology
> - entity 1: csi (2 pads, 1 link)
>             type V4L2 subdev subtype Unknown flags 0
> pad0: Sink
> pad1: Source
> -> "csi capture":0 [ENABLED,IMMUTABLE]
> 
> - entity 4: csi capture (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video0
> pad0: Sink
> <- "csi":1 [ENABLED,IMMUTABLE]
> 
> I confirmed the ov5640 camera enumerated:
> 
> I'm going to roll back this latest series to verify whether or not
> this series caused the splat.
> 
> adam
> 
> >  drivers/media/platform/nxp/imx7-media-csi.c | 18 ++++++++----------
> >  1 file changed, 8 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> > index be3c1494cfb3..e96bee4e5921 100644
> > --- a/drivers/media/platform/nxp/imx7-media-csi.c
> > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > @@ -1598,17 +1598,15 @@ static struct imx7_csi_vb2_buffer *imx7_csi_video_next_buf(struct imx7_csi *csi)
> >
> >  static int imx7_csi_video_init_format(struct imx7_csi *csi)
> >  {
> > -       struct v4l2_subdev_format fmt_src = {
> > -               .pad = IMX7_CSI_PAD_SRC,
> > -               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> > -       };
> > -       fmt_src.format.code = IMX7_CSI_DEF_MBUS_CODE;
> > -       fmt_src.format.width = IMX7_CSI_DEF_PIX_WIDTH;
> > -       fmt_src.format.height = IMX7_CSI_DEF_PIX_HEIGHT;
> > +       struct v4l2_mbus_framefmt format = { };
> >
> > -       imx7_csi_mbus_fmt_to_pix_fmt(&csi->vdev_fmt, &fmt_src.format, NULL);
> > -       csi->vdev_compose.width = fmt_src.format.width;
> > -       csi->vdev_compose.height = fmt_src.format.height;
> > +       format.code = IMX7_CSI_DEF_MBUS_CODE;
> > +       format.width = IMX7_CSI_DEF_PIX_WIDTH;
> > +       format.height = IMX7_CSI_DEF_PIX_HEIGHT;
> > +
> > +       imx7_csi_mbus_fmt_to_pix_fmt(&csi->vdev_fmt, &format, NULL);
> > +       csi->vdev_compose.width = format.width;
> > +       csi->vdev_compose.height = format.height;
> >
> >         csi->vdev_cc = imx7_csi_find_pixel_format(csi->vdev_fmt.pixelformat);
> >

-- 
Regards,

Laurent Pinchart
