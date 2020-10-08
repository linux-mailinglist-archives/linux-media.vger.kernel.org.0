Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 148C1287D7F
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 22:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbgJHUxW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 16:53:22 -0400
Received: from mga11.intel.com ([192.55.52.93]:63077 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbgJHUxW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Oct 2020 16:53:22 -0400
IronPort-SDR: VWl9GonUYX3+6/Fqq2bLi0ixgzMFjp4UHEs4DBXxI+j+++fDAVUZNCNydQkgN3Bs9qyvnwKAIt
 yM9x3VK3g4nw==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="161943075"
X-IronPort-AV: E=Sophos;i="5.77,352,1596524400"; 
   d="scan'208";a="161943075"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2020 13:53:21 -0700
IronPort-SDR: IlV+Vb4IYxx8pLbqubE7x8pUNLhV3sfTyxBQ/8QC91kc7TY8h+G/NLw9xTJfzNsn427f9fhWsd
 6NCEf1UYOMxQ==
X-IronPort-AV: E=Sophos;i="5.77,352,1596524400"; 
   d="scan'208";a="316815229"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2020 13:53:19 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8EFC6203EB; Thu,  8 Oct 2020 23:53:17 +0300 (EEST)
Date:   Thu, 8 Oct 2020 23:53:17 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: ipu3-cio2 causes hang on getting topology when
 GCC_PLUGIN_STRUCTLEAK_BYREF=y
Message-ID: <20201008205317.GP26842@paasikivi.fi.intel.com>
References: <3667ce6d9323a9b313d161ea6800f9fb68809356.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3667ce6d9323a9b313d161ea6800f9fb68809356.camel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tsuchiya,

On Thu, Oct 08, 2020 at 10:17:03PM +0900, Tsuchiya Yuto wrote:
> Hi, I'm one of the people who are trying to get ipu3 cameras working on
> regular PCs that came with Windows OS.
> 
> I found that the ipu3-cio2 driver causes the kernel to hang on getting
> device topology (like "media-ctl -p -d /dev/media0" or capturing images
> with libcamera) when the kernel option "Initialize kernel stack variables
> at function entry" is above "strong" ("CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF=y").
> 
> I noticed this issue because Arch Linux sets this option to "very strong"
> ("CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL=y").
> 
> This issue happens even without sensor drivers or cio2-bridge driver
> currently being developed [1]. So, I think this issue is reproducible
> easily on regular PCs equipped with the IPU3 system as well.
> 
> The way the kernel crashes varies slightly from series to series:
> - The latest stable (v5.8.y) and rc (v5.9-rcx)
>   When this issue happened, the kernel just hangs. No journal log after
>   the hang.
> - The latest LTS (v5.4.y)
>   When this issue happened, the kernel shows the following oops:
> 
>     BUG: stack guard page was hit at 00000000486e5acd (stack is 000000006e2c667d..0000000010408970)
>     kernel stack overflow (double-fault): 0000 [#1] SMP PTI
>     CPU: 2 PID: 2535 Comm: media-ctl Tainted: G         C        5.4.69-1-lts #1
>     Hardware name: Microsoft Corporation Surface Book/Surface Book, BIOS 92.3192.768 03.24.2020
>     RIP: 0010:cio2_subdev_get_fmt+0x2c/0x180 [ipu3_cio2]
> 
>   I added the full oops at the bottom of this mail.
> 
> According to the description of the kernel option, it seems that the
> uninitialized variables are used somewhere in the cio2_subdev_get_fmt()
> [ipu3_cio2.c] ?
> 
> Steps to reproduce:
> 1. Build the kernel with the option set to
>    "strong" ("CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF=y") or
>    "very strong" ("CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL=y").
> 2. Boot with the kernel and try to get the device topology by the command
>    like the following:
> 
>     $ media-ctl -p -d /dev/media0
> 
> 3. The kernel just hangs on the 5.8 and 5.9-rc, or prints the oops on 5.4
> 
> What I found so far:
> I tried print debug like the following:
> 
>     1241 static int cio2_subdev_get_fmt(struct v4l2_subdev *sd,
>     1242 			       struct v4l2_subdev_pad_config *cfg,
>     1243 			       struct v4l2_subdev_format *fmt)
>     1244 {
>     1245 	struct cio2_queue *q = container_of(sd, struct cio2_queue, subdev);
>     1246 	struct v4l2_subdev_format format;
>     1247 	int ret;
>     1248 
>     1249 	pr_info("DEBUG: %s() called\n", __func__);
>     1250 	pr_info("DEBUG: msleep()\n");
>     1251 	msleep(1000);
>     1252 
>     1253 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>     1254 		pr_info("DEBUG: Passed %s() %d\n", __func__, __LINE__);
>     1255 		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
>     1256 		return 0;
>     1257 	}
>     1258 
>     1259 	pr_info("DEBUG: Passed %s() %d\n", __func__, __LINE__);
>     1260 
>     1261 	if (fmt->pad == CIO2_PAD_SINK) {
>     1262 		pr_info("DEBUG: Passed %s() %d\n", __func__, __LINE__);
>     1263 		format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>     1264 		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL,
>     1265 				       &format);
> 
>     $ media-ctl -p -d /dev/media0
>     Media controller API version 5.9.0
> 
>     Media device information
>     ------------------------
>     driver          ipu3-cio2
>     model           Intel IPU3 CIO2
>     serial          
>     bus info        PCI:0000:00:14.3
>     hw revision     0x0
>     driver version  5.9.0
>     
>     Device topology
>     - entity 1: ipu3-csi2 0 (2 pads, 1 link)
>                 type V4L2 subdev subtype Unknown flags 0
>                 device node name /dev/v4l-subdev0
>     	pad0: Sink
>     # [output stopped here]
> 
>     $ dmesg -xw
>     [  871.807563] kernel: DEBUG: cio2_subdev_get_fmt() called
>     [  871.807566] kernel: DEBUG: msleep()
>     [  872.821254] kernel: DEBUG: Passed cio2_subdev_get_fmt() 1259
>     [  872.821258] kernel: DEBUG: Passed cio2_subdev_get_fmt() 1262
>     # [...] (same output repeatedly)
>     [  986.313536] kernel: DEBUG: cio2_subdev_get_fmt() called
>     [  986.313538] kernel: DEBUG: msleep()
>     [  987.326899] kernel: DEBUG: Passed cio2_subdev_get_fmt() 1259
>     [  987.326904] kernel: DEBUG: Passed cio2_subdev_get_fmt() 1262
>     [  987.326908] kernel: DEBUG: cio2_subdev_get_fmt() called
>     [  987.326910] kernel: DEBUG: msleep()
>     (then, system hanged)
> 
> So, it looks like the following loop is happening there:
> 1. cio2_subdev_get_fmt() calls v4l2_subdev_call()
> 2. v4l2_subdev_call() internally calls cio2_subdev_get_fmt() again
> 
> Does anyone have any ideas what's happening?

First of all, thank you for a very thorough and informative bug report. It
looks like a driver bug indeed.

I don't know how this has escaped review and testing earlier though. It's
so clear.

Anyway, I hope the patchset I just sent fixes it for you. Please let me
know if there are issues.

-- 
Kind regards,

Sakari Ailus
