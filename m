Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76B17388AC9
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 11:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345825AbhESJjE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 05:39:04 -0400
Received: from comms.puri.sm ([159.203.221.185]:52120 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345828AbhESJjB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 05:39:01 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 92B55E0E31;
        Wed, 19 May 2021 02:37:42 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1e6KLwkwppxO; Wed, 19 May 2021 02:37:40 -0700 (PDT)
Message-ID: <2b916ab33c25a9181caced37e609c60bf39b717e.camel@puri.sm>
Subject: Re: [PATCH] media: imx: imx7-media-csi: Fix buffer return upon
 stream start failure
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Date:   Wed, 19 May 2021 11:37:36 +0200
In-Reply-To: <20210519005834.8690-1-laurent.pinchart@ideasonboard.com>
References: <20210519005834.8690-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, dem 19.05.2021 um 03:58 +0300 schrieb Laurent Pinchart:
> When the stream fails to start, the first two buffers in the queue
> have
> been moved to the active_vb2_buf array and are returned to vb2 by
> imx7_csi_dma_unsetup_vb2_buf(). The function is called with the
> buffer
> state set to VB2_BUF_STATE_ERROR unconditionally, which is correct
> when
> stopping the stream, but not when the start operation fails. In that
> case, the state should be set to VB2_BUF_STATE_QUEUED. Fix it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c
> b/drivers/staging/media/imx/imx7-media-csi.c
> index f644a640a831..da768ea21d03 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -361,6 +361,7 @@ static void imx7_csi_dma_unsetup_vb2_buf(struct
> imx7_csi *csi,
>  
>                         vb->timestamp = ktime_get_ns();
>                         vb2_buffer_done(vb, return_status);
> +                       csi->active_vb2_buf[i] = NULL;
>                 }
>         }
>  }
> @@ -386,9 +387,10 @@ static int imx7_csi_dma_setup(struct imx7_csi
> *csi)
>         return 0;
>  }
>  
> -static void imx7_csi_dma_cleanup(struct imx7_csi *csi)
> +static void imx7_csi_dma_cleanup(struct imx7_csi *csi,
> +                                enum vb2_buffer_state return_status)
>  {
> -       imx7_csi_dma_unsetup_vb2_buf(csi, VB2_BUF_STATE_ERROR);
> +       imx7_csi_dma_unsetup_vb2_buf(csi, return_status);
>         imx_media_free_dma_buf(csi->dev, &csi->underrun_buf);
>  }
>  
> @@ -526,9 +528,10 @@ static int imx7_csi_init(struct imx7_csi *csi)
>         return 0;
>  }
>  
> -static void imx7_csi_deinit(struct imx7_csi *csi)
> +static void imx7_csi_deinit(struct imx7_csi *csi,
> +                           enum vb2_buffer_state return_status)
>  {
> -       imx7_csi_dma_cleanup(csi);
> +       imx7_csi_dma_cleanup(csi, return_status);
>         imx7_csi_init_default(csi);
>         imx7_csi_dmareq_rff_disable(csi);
>         clk_disable_unprepare(csi->mclk);
> @@ -691,7 +694,7 @@ static int imx7_csi_s_stream(struct v4l2_subdev
> *sd, int enable)
>  
>                 ret = v4l2_subdev_call(csi->src_sd, video, s_stream,
> 1);
>                 if (ret < 0) {
> -                       imx7_csi_deinit(csi);
> +                       imx7_csi_deinit(csi, VB2_BUF_STATE_QUEUED);
>                         goto out_unlock;
>                 }
>  
> @@ -701,7 +704,7 @@ static int imx7_csi_s_stream(struct v4l2_subdev
> *sd, int enable)
>  
>                 v4l2_subdev_call(csi->src_sd, video, s_stream, 0);
>  
> -               imx7_csi_deinit(csi);
> +               imx7_csi_deinit(csi, VB2_BUF_STATE_ERROR);
>         }
>  
>         csi->is_streaming = !!enable;


this fixes the below warning I've been seeing. thank you.

Tested-by: Martin Kepplinger <martin.kepplinger@puri.sm>



[   56.128122] imx7-csi 30a90000.csi1_bridge: walk: returning entity
'csi capture'
[   56.128127] imx7-csi 30a90000.csi1_bridge: walk: returning entity
'csi'
[   56.128133] imx7-csi 30a90000.csi1_bridge: pipeline start failed
with -19
[   56.135091] ------------[ cut here ]------------
[   56.135102] WARNING: CPU: 3 PID: 1984 at
drivers/media/common/videobuf2/videobuf2-core.c:1568
vb2_start_streaming+0xe4/0x160 [videobuf2_common]
[   56.135151] Modules linked in: aes_ce_ccm exfat rfcomm algif_hash
algif_skcipher af_alg bnep qmi_wwan cdc_wdm option usbnet usb_wwan
usbserial mii ofpart mousedev spi_nor caam_jr mtd caamhash_desc
caamalg_desc crypto_engine uas redpine_sdio usb_storage redpine_91x
bluetooth mac80211 aes_ce_blk crypto_simd crct10dif_ce ghash_ce
cfg80211 sha2_ce sha1_ce st_lsm6dsx_spi bq25890_charger pwm_vibra
snd_soc_gtm601 snd_soc_simple_card snd_soc_simple_card_utils hi846
s5k3l6xx edt_ft5x06 snd_soc_wm8962 mx6s_capture imx7_media_csi(C)
imx_media_common(C) videobuf2_dma_contig imx8mq_mipi_csis(C)
mxc_mipi_csi2_yav videobuf2_memops videobuf2_v4l2 tps6598x
videobuf2_common vcnl4000 v4l2_fwnode typec
industrialio_triggered_buffer leds_lm3560 videodev mc st_lsm6dsx_i2c
st_lsm6dsx kfifo_buf gnss_mtk gnss_serial gnss snd_soc_fsl_sai imx_sdma
snvs_pwrkey imx_pcm_dma virt_dma snd_soc_core imx2_wdt watchdog
snd_pcm_dmaengine snd_pcm snd_timer snd caam soundcore error rfkill_hks
rfkill ledtrig_timer usb_f_acm
[   56.135494]  u_serial usb_f_rndis g_multi usb_f_mass_storage u_ether
libcomposite ledtrig_pattern fuse ip_tables x_tables ipv6 xhci_plat_hcd
xhci_hcd usbcore imx_dcss clk_bd718x7 cdns_mhdp_imx cdns_mhdp_drmcore
dwc3 ulpi udc_core roles phy_fsl_imx8mq_usb usb_common
[   56.135596] CPU: 3 PID: 1984 Comm: v4l2-ctl Tainted: G         C   
5.12.2-librem5-00049-g99f86eccfeae #335
[   56.135607] Hardware name: Purism Librem 5r4 (DT)
[   56.135613] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
[   56.135623] pc : vb2_start_streaming+0xe4/0x160 [videobuf2_common]
[   56.135653] lr : vb2_start_streaming+0x74/0x160 [videobuf2_common]
[   56.135682] sp : ffff8000148bbba0
[   56.135686] x29: ffff8000148bbba0 x28: ffff00001e833f00 
[   56.135700] x27: 0000000040045612 x26: ffff800008f406a0 
[   56.135713] x25: 0000000000000000 x24: ffff8000148bbd58 
[   56.135725] x23: ffff0000be730138 x22: ffff00000230ab00 
[   56.135738] x21: ffff0000be730330 x20: ffff0000be730348 
[   56.135751] x19: 00000000ffffffed x18: 0000000000000000 
[   56.135763] x17: 0000000000000000 x16: 0000000000000000 
[   56.135776] x15: 0000000000000030 x14: ffffffffffffffff 
[   56.135788] x13: ffff8000948bb737 x12: ffff8000148bb73f 
[   56.135801] x11: ffff80001152a7a0 x10: 00000000ffffe000 
[   56.135813] x9 : ffff800008f3c900 x8 : ffff80001147a7a0 
[   56.135826] x7 : ffff80001152a7a0 x6 : 0000000000000000 
[   56.135838] x5 : 0000000000000000 x4 : 0000000000000000 
[   56.135850] x3 : ffff0000be730344 x2 : 0000000000000000 
[   56.135863] x1 : ffff800008fe4000 x0 : ffff0000253d29f0 
[   56.135877] Call trace:
[   56.135882]  vb2_start_streaming+0xe4/0x160 [videobuf2_common]
[   56.135912]  vb2_core_streamon+0x9c/0x1a0 [videobuf2_common]
[   56.135940]  vb2_ioctl_streamon+0x68/0xbc [videobuf2_v4l2]
[   56.135964]  v4l_streamon+0x30/0x40 [videodev]
[   56.136063]  __video_do_ioctl+0x194/0x3f4 [videodev]
[   56.136145]  video_usercopy+0x1a4/0x770 [videodev]
[   56.136226]  video_ioctl2+0x24/0x40 [videodev]
[   56.136305]  v4l2_ioctl+0x4c/0x70 [videodev]
[   56.136385]  __arm64_sys_ioctl+0xb4/0xfc
[   56.136401]  el0_svc_common.constprop.0+0x68/0x130
[   56.136416]  do_el0_svc+0x28/0x34
[   56.136426]  el0_svc+0x2c/0x54
[   56.136438]  el0_sync_handler+0x1a4/0x1b0
[   56.136449]  el0_sync+0x174/0x180
[   56.136459] ---[ end trace 122c8abc5f14e4e5 ]---

