Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6712D389273
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 17:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346501AbhESPWk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 11:22:40 -0400
Received: from comms.puri.sm ([159.203.221.185]:38620 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346830AbhESPWj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 11:22:39 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id EB5B5E0219;
        Wed, 19 May 2021 08:21:18 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RnkFYZg_m4lq; Wed, 19 May 2021 08:21:17 -0700 (PDT)
Message-ID: <7f922c8b3d4396c00ba15ad99dd572699f4b69b1.camel@puri.sm>
Subject: Re: [PATCH 00/23] media: imx: imx7-mipi-csis: Add i.MX8MM support /
 imx8mq support
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, marex@denx.de, p.zabel@pengutronix.de,
        rmfrfs@gmail.com, robh@kernel.org, slongerbeam@gmail.com
Date:   Wed, 19 May 2021 17:21:11 +0200
In-Reply-To: <YKRmhSn65fiqshsp@pendragon.ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
         <20210504155939.1194369-1-martin.kepplinger@puri.sm>
         <YKBRXesDsXk9K15J@pendragon.ideasonboard.com>
         <1da3de6c879474b814f4d820ca5eb5ba07174a26.camel@puri.sm>
         <YKRmhSn65fiqshsp@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, dem 19.05.2021 um 04:14 +0300 schrieb Laurent Pinchart:
> Hi Martin,
> 
> On Tue, May 18, 2021 at 04:39:00PM +0200, Martin Kepplinger wrote:
> > Am Sonntag, dem 16.05.2021 um 01:55 +0300 schrieb Laurent Pinchart:
> > > On Tue, May 04, 2021 at 05:59:39PM +0200, Martin Kepplinger
> > > wrote:
> > > > hi Laurent, again thanks a lot for posting this series! I can't
> > > > fully test
> > > > it, but base my work for imx8mq on it now. imx8mq includes
> > > > yet another mipi phy version than this and below is some very
> > > > rough testing
> > > > code. it's not at all something I sign-off on but my following
> > > > problem is based on it.
> > > 
> > > Unless I'm mistaken, the CSI-2 receiver in the i.MX8MQ is a
> > > completely
> > > different device. I wouldn't try to support it in the imx7-mipi-
> > > csis
> > > driver, but in a separate driver.
> > > 
> > > >  * configured to use both staging csi drivers
> > > >  * the csi bridge driver at least streams frames together with
> > > > the
> > > > nxp "yav" mipi driver
> > > > 
> > > > media-ctl -p now says the output below, so one link from mipi
> > > > to
> > > > csi is missing.
> > > > 
> > > > Note that
> > > > 
> > > > media-ctl --set-v4l2 "'csi':0 [fmt:SBGGR10/640x480]"
> > > > works in that it changes the configured format below, but
> > > > 
> > > > media-ctl -l "'imx7-mipi-csis.0':1" -> "'csi':0[1]"
> > > > doesn't create said missing link.
> > > 
> > > media-ctl can't create links, it can only enable or disable them.
> > > Link
> > > creation is the prerogative of drivers.
> > > 
> > > > Do I maybe use that wrongly? If now, does anything come to mind
> > > > that would
> > > > be missing specifically?
> > > 
> > > The link should be created by the call to media_create_pad_link()
> > > in
> > > imx_media_capture_device_register(). You'll need to figure out if
> > > the
> > > function is called and returns an error early, or if it doesn't
> > > get
> > > called at all, and why.
> > > 
> > > > When trying to stream anyway (if that makes sense), I get the
> > > > following:
> > > > 
> > > > [ 2008.377470] capture_start_streaming: starting
> > > > [ 2008.381883] capture_find_format: calling
> > > > imx_media_find_mbus_format with code 0x2006
> > > > [ 2008.389671] imx7-csi 30a90000.csi1_bridge:
> > > > capture_validate_fmt: capture_find_format err
> > > > [ 2008.397794] imx7-csi 30a90000.csi1_bridge:
> > > > capture_validate_fmt: capture_find_format found colorspace 0x1
> > > > != 0x0
> > > > [ 2008.407999] imx7-csi 30a90000.csi1_bridge: capture format
> > > > not valid: -32
> > > > 
> > > > and if I ignore that (because I'm not yet sure whether that is
> > > > specific to
> > > > platforms including an IPU), I get a WARN_ON from
> > > > vb2_start_streaming()
> > > 
> > > That I have a fix for, I'll post it as part of an imx7-media-csi
> > > series.
> > 
> > Hi Laurent,
> > 
> > You haven't posted that fix you're talking about, right?
> 
> Correct. It's now fixed (see "[PATCH] media: imx: imx7-media-csi: Fix
> buffer return upon stream start failure", I've CC'ed you).
> 
> > The below
> > driver (attached; I'll send it as patches after I successfully
> > tested
> > myself, and cleanup and fixes obviously)
> 
> Don't forget the DT bindings at that point :-)
> 
> > results in the same situation I described above:
> > 
> > * missing link from mipi (entity 10) -> csi (entity 1):
> 
> The link is supposed to be created by
> v4l2_create_fwnode_links_to_pad(),
> called from imx7_csi_notify_bound(). Could you trace the calls and
> figure out what goes wrong ?

that bound callback imx7_csi_notify_bound() is called only once during
probe: v4l2_create_fwnode_links_to_pad() returns 0 and
imx7_csi_async_register() returns success too.

(the imx8mq mipi driver probes successfully, independently, a few ms
before the above, the sensor driver a few ms after that)

So nothing obviously going wrong during probe(). that's the call trace
in imx7_csi_notify_bound() :

[    5.992126] Call trace:
[    5.992129]  dump_backtrace+0x0/0x1e4
[    5.992149]  show_stack+0x24/0x30
[    5.992155]  dump_stack+0xd0/0x12c
[    5.992163]  imx7_csi_notify_bound+0x78/0x8c [imx7_media_csi]
[    5.992182]  v4l2_async_match_notify+0x58/0x1b0 [videodev]
[    5.992262]  v4l2_async_notifier_try_all_subdevs+0x60/0xd0
[videodev]
[    5.992316]  v4l2_async_match_notify+0x130/0x1b0 [videodev]
[    5.992370]  v4l2_async_register_subdev+0x98/0x1f0 [videodev]
[    5.992424]  imx7_csi_probe+0x2c8/0x310 [imx7_media_csi]
[    5.992436]  platform_probe+0x74/0xe4
[    5.992446]  really_probe+0xf0/0x510
[    5.992453]  driver_probe_device+0xfc/0x170
[    5.992458]  device_driver_attach+0xcc/0xd4
[    5.992464]  __driver_attach+0xb0/0x17c
[    5.992469]  bus_for_each_dev+0x7c/0xe0
[    5.992478]  driver_attach+0x30/0x40
[    5.992483]  bus_add_driver+0x154/0x250
[    5.992490]  driver_register+0x84/0x140
[    5.992496]  __platform_driver_register+0x34/0x40
[    5.992502]  imx7_csi_driver_init+0x2c/0x1000 [imx7_media_csi]
[    5.992515]  do_one_initcall+0x50/0x2d0
[    5.992522]  do_init_module+0x60/0x274
[    5.992532]  load_module+0x2078/0x2450
[    5.992539]  __do_sys_finit_module+0xbc/0x130
[    5.992547]  __arm64_sys_finit_module+0x2c/0x3c
[    5.992555]  el0_svc_common.constprop.0+0x68/0x130
[    5.992565]  do_el0_svc+0x28/0x34
[    5.992571]  el0_svc+0x2c/0x54
[    5.992580]  el0_sync_handler+0x1a4/0x1b0
[    5.992587]  el0_sync+0x174/0x180


btw, my test is:

v4l2-ctl -d "/dev/v4l/by-path/platform-30a90000.csi1_bridge-video-
index0" --set-fmt-video=width=640,height=480 --stream-mmap --stream-
to=test.raw --stream-count=1

and that (probably because of the missing link) fails with

VIDIOC_STREAMON returned -1 (No such device)

which is in the kernel:

imx7-csi 30a90000.csi1_bridge: pipeline start failed with -19

