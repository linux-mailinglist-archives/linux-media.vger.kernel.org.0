Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE877D5400
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 16:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234724AbjJXO1u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 10:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234705AbjJXO1t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 10:27:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A7712B;
        Tue, 24 Oct 2023 07:27:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 636F69CC;
        Tue, 24 Oct 2023 16:27:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698157653;
        bh=PKh78F+awQNKQ3hFVwO14AozasW2+O/YfX5GJgoELWM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WsKbp1BMljd5VUK/JERoIkUs5Xy4k3TIlIAME6Jn4rfOZVna+vlKxkGztcejVSJs/
         dI2Jp/AN2ngkyjCbg0VHuMNAI8+6phvJAGL7AJBG/Js8/mTpXR0gGpjdpt3s8YmeVP
         KyRGM80u3irZqnYgL4u/BX0owBcERzQyj5qF9NQY=
Date:   Tue, 24 Oct 2023 17:27:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Martin Kepplinger <martink@posteo.de>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Jason Chen <jason.z.chen@intel.com>,
        Arec Kao <arec.kao@intel.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-subdev: Document and enforce .s_stream()
 requirements
Message-ID: <20231024142752.GA4781@pendragon.ideasonboard.com>
References: <20230918124838.14210-1-laurent.pinchart@ideasonboard.com>
 <2221395-6a9b-9527-d697-e76aebc6af@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2221395-6a9b-9527-d697-e76aebc6af@linux-m68k.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On Tue, Oct 24, 2023 at 10:57:26AM +0200, Geert Uytterhoeven wrote:
>  	Hi Laurent,
> 
> On Mon, 18 Sep 2023, Laurent Pinchart wrote:
> > The subdev .s_stream() operation must not be called to start an already
> > started subdev, or stop an already stopped one. This requirement has
> > never been formally documented. Fix it, and catch possible offenders
> > with a WARN_ON() in the call_s_stream() wrapper.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> >
> > - Add WARN_ON() in call_s_stream()
> > - Fix typo and language in documentation
> 
> Thanks for your patch, which is now commit 009905ec50433259 ("media:
> v4l2-subdev: Document and enforce .s_stream() requirements")
> in linux-next/master media/master.
> 
> This patch causes the below warning during s2idle/s2ram on Salvator-XS
> (R-Car H3 ES2.0) and White-Hawk (R-Car V4H).  Koelsch (R-Car M2-W) is not
> affected, as its DU does not use the VSP.

Oops :-S

https://lore.kernel.org/linux-media/20231024142522.29658-1-laurent.pinchart+renesas@ideasonboard.com/T/#u
should fix it.

>      Filesystems sync: 0.014 seconds
>      Freezing user space processes
>      Freezing user space processes completed (elapsed 0.006 seconds)
>      OOM killer disabled.
>      Freezing remaining freezable tasks
>      Freezing remaining freezable tasks completed (elapsed 0.002 seconds)
>      ------------[ cut here ]------------
>      WARNING: CPU: 2 PID: 962 at drivers/media/v4l2-core/v4l2-subdev.c:371 call_s_stream+0xd4/0xf0
>      CPU: 2 PID: 962 Comm: s2idle Not tainted 6.6.0-rc3-arm64-renesas-00068-g009905ec5043 #2302
>      Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT)
>      pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>      pc : call_s_stream+0xd4/0xf0
>      lr : vsp1_pipeline_stop+0x10c/0x2a4
>      sp : ffff800083f635f0
>      x29: ffff800083f635f0 x28: 0000000000000000 x27: 0000000000000001
>      x26: 0000000000000000 x25: ffff0004c3375b08 x24: ffff0004c3375880
>      x23: 0000000000000288 x22: ffff0004c3375b30 x21: 0000000000000000
>      x20: ffff0004c3370880 x19: ffff0004c33750f0 x18: 0000000000000001
>      x17: 000000040044ffff x16: 00000034b5503510 x15: 0000000000000028
>      x14: 0000000000000000 x13: 0000000000000003 x12: 0000000000000000
>      x11: 0000000000000000 x10: ffff800082063b78 x9 : ffff800081a5abb8
>      x8 : 00000000e50359b8 x7 : 00000000000000ac x6 : 0000000000002b10
>      x5 : 0000000000000000 x4 : ffff8000838f8000 x3 : ffff800080932760
>      x2 : ffff80008096671c x1 : 0000000000000000 x0 : 0000000000000001
>      Call trace:
>       call_s_stream+0xd4/0xf0
>       vsp1_pipeline_stop+0x10c/0x2a4
>       vsp1_du_setup_lif+0x324/0x468
>       rcar_du_vsp_disable+0x1c/0x24
>       rcar_du_crtc_atomic_disable+0x2f8/0x438
>       disable_outputs+0x22c/0x338
>       drm_atomic_helper_commit_modeset_disables+0x18/0x44
>       rcar_du_atomic_commit_tail+0x90/0xd8
>       commit_tail+0x9c/0x178
>       drm_atomic_helper_commit+0x18c/0x1a0
>       drm_atomic_commit+0xa4/0xd8
>       drm_atomic_helper_disable_all+0x1ec/0x200
>       drm_atomic_helper_suspend+0xa0/0x208
>       drm_mode_config_helper_suspend+0x2c/0x70
>       rcar_du_pm_suspend+0x14/0x1c
>       platform_pm_suspend+0x28/0x64
>       dpm_run_callback+0x34/0x90
>       __device_suspend+0x10c/0x3c4
>       dpm_suspend+0x140/0x250
>       dpm_suspend_start+0x78/0x90
>       suspend_devices_and_enter+0x124/0x570
>       pm_suspend+0x1ec/0x310
>       state_store+0x88/0x124
>       kobj_attr_store+0x14/0x24
>       sysfs_kf_write+0x48/0x6c
>       kernfs_fop_write_iter+0x118/0x1a8
>       vfs_write+0x208/0x30c
>       ksys_write+0x64/0xec
>       __arm64_sys_write+0x18/0x20
>       invoke_syscall+0x44/0x108
>       el0_svc_common.constprop.0+0x3c/0xdc
>       do_el0_svc+0x1c/0x24
>       el0_svc+0x40/0xd4
>       el0t_64_sync_handler+0x134/0x150
>       el0t_64_sync+0x14c/0x150
>      irq event stamp: 19852
>      hardirqs last  enabled at (19851): [<ffff800080dc3234>] _raw_spin_unlock_irqrestore+0x6c/0x70
>      hardirqs last disabled at (19852): [<ffff800080db3f9c>] el1_dbg+0x20/0x80
>      softirqs last  enabled at (17806): [<ffff800080010618>] __do_softirq+0x430/0x4e0
>      softirqs last disabled at (17799): [<ffff8000800151e0>] ____do_softirq+0xc/0x14
>      ---[ end trace 0000000000000000 ]---

-- 
Regards,

Laurent Pinchart
