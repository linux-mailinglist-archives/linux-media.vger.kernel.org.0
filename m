Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C585128A028
	for <lists+linux-media@lfdr.de>; Sat, 10 Oct 2020 13:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729949AbgJJLQT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Oct 2020 07:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729300AbgJJKY7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Oct 2020 06:24:59 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96117C0613D0
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2020 02:07:13 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id i2so9305732pgh.7
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2020 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=sjsQjOMpsNgi4gHvVRM7zEGmj+yOgNSt/gxniEOfOl4=;
        b=hMzXxjOYkvCTexiMNV0cjkSLb93t16DCPLeWUe4AK/wdMvNKedBDr3N/IGwyFUVKv2
         njjU92P7+NH87J6Q8UprxEQ4BCjQQHJuyudF2pRcEAOWqtOQgFZPy41lPfSaKHUAyIcb
         szktytp/ojfjLwYB5vY8Qv4q4QzPjfshSjT3E+3R6D25P7qOlAyzrglTqa3LFVJvjfWy
         Aqjv4TjgTUo2Y9X1/+WRJDlLbK0DQHt945cM5GgSSRQzkhF9QTBz8ivXu3wGUoK2Pxao
         YAskT82YbCISJrwaCnxtttXZ9n4mjE6DriTa8mUmm+y92npzi+G3YTXRH3xNpFLQwZjv
         aIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sjsQjOMpsNgi4gHvVRM7zEGmj+yOgNSt/gxniEOfOl4=;
        b=oOBA7y8XNE8iQMtuDIF/HU6bcDI1wynnFDKOEBiiBWNj6zbooeYfGMkR0IklgemP//
         Y2rIfaYreNObvzqYSKkjtv5Jsar6/8FxstokgGjaFq2olcByjksMiDLQ89j+ic6lYURM
         RIOcaldL577qX85Y9Sxm3VJ5BrmWSNzoAsvM1FExGeO2tjVymKWQcEu3UWMQYtYrZ0LX
         npXRhP+M1nQvI7FiKXVJAQBVio91knBrinY4MNVzDr9zwpPR9/NTgVMF58hWG9v2mV4i
         v7gPnYwoZGdmUKTpauiFqjC1KiHRHNrGsJVVtBNZHe1390SZiWEFc4Hq6yVUVzV9LsUs
         ILCA==
X-Gm-Message-State: AOAM530fHaCIkuHYIo8ApgF12KDFfv9DvpjDUiKE8bBXnmrQSzz3s9jx
        BVbjVmcLdE+MRBLseS7D+f0=
X-Google-Smtp-Source: ABdhPJzZgwrvomBuP29FaILMIrvaPnDXAI6i7Kj25vuyshBym9Fbc0v6SxB9jaPMv5zrvf8sZsM2Zw==
X-Received: by 2002:a17:90a:bf03:: with SMTP id c3mr9455544pjs.65.1602320832926;
        Sat, 10 Oct 2020 02:07:12 -0700 (PDT)
Received: from [192.168.1.59] (i60-35-254-237.s41.a020.ap.plala.or.jp. [60.35.254.237])
        by smtp.gmail.com with ESMTPSA id 204sm13684127pfz.74.2020.10.10.02.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2020 02:07:12 -0700 (PDT)
Message-ID: <4b15b4a4d81352bd38a45897fba846f350689d0a.camel@gmail.com>
Subject: Re: ipu3-cio2 causes hang on getting topology when
 GCC_PLUGIN_STRUCTLEAK_BYREF=y
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Date:   Sat, 10 Oct 2020 18:07:08 +0900
In-Reply-To: <20201008205317.GP26842@paasikivi.fi.intel.com>
References: <3667ce6d9323a9b313d161ea6800f9fb68809356.camel@gmail.com>
         <20201008205317.GP26842@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-10-08 at 23:53 +0300, Sakari Ailus wrote:
> Hi Tsuchiya,
> 
> On Thu, Oct 08, 2020 at 10:17:03PM +0900, Tsuchiya Yuto wrote:
> > Hi, I'm one of the people who are trying to get ipu3 cameras working on
> > regular PCs that came with Windows OS.
> > 
> > I found that the ipu3-cio2 driver causes the kernel to hang on getting
> > device topology (like "media-ctl -p -d /dev/media0" or capturing images
> > with libcamera) when the kernel option "Initialize kernel stack variables
> > at function entry" is above "strong" ("CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF=y").
> > 
> > I noticed this issue because Arch Linux sets this option to "very strong"
> > ("CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL=y").
> > 
> > This issue happens even without sensor drivers or cio2-bridge driver
> > currently being developed [1]. So, I think this issue is reproducible
> > easily on regular PCs equipped with the IPU3 system as well.
> > 
> > The way the kernel crashes varies slightly from series to series:
> > - The latest stable (v5.8.y) and rc (v5.9-rcx)
> >   When this issue happened, the kernel just hangs. No journal log after
> >   the hang.
> > - The latest LTS (v5.4.y)
> >   When this issue happened, the kernel shows the following oops:
> > 
> >     BUG: stack guard page was hit at 00000000486e5acd (stack is 000000006e2c667d..0000000010408970)
> >     kernel stack overflow (double-fault): 0000 [#1] SMP PTI
> >     CPU: 2 PID: 2535 Comm: media-ctl Tainted: G         C        5.4.69-1-lts #1
> >     Hardware name: Microsoft Corporation Surface Book/Surface Book, BIOS 92.3192.768 03.24.2020
> >     RIP: 0010:cio2_subdev_get_fmt+0x2c/0x180 [ipu3_cio2]
> > 
> >   I added the full oops at the bottom of this mail.
> > 
> > According to the description of the kernel option, it seems that the
> > uninitialized variables are used somewhere in the cio2_subdev_get_fmt()
> > [ipu3_cio2.c] ?
> > 
> > Steps to reproduce:
> > 1. Build the kernel with the option set to
> >    "strong" ("CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF=y") or
> >    "very strong" ("CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL=y").
> > 2. Boot with the kernel and try to get the device topology by the command
> >    like the following:
> > 
> >     $ media-ctl -p -d /dev/media0
> > 
> > 3. The kernel just hangs on the 5.8 and 5.9-rc, or prints the oops on 5.4
> > 
> > What I found so far:
> > I tried print debug like the following:
> > 
> >     1241 static int cio2_subdev_get_fmt(struct v4l2_subdev *sd,
> >     1242 			       struct v4l2_subdev_pad_config *cfg,
> >     1243 			       struct v4l2_subdev_format *fmt)
> >     1244 {
> >     1245 	struct cio2_queue *q = container_of(sd, struct cio2_queue, subdev);
> >     1246 	struct v4l2_subdev_format format;
> >     1247 	int ret;
> >     1248 
> >     1249 	pr_info("DEBUG: %s() called\n", __func__);
> >     1250 	pr_info("DEBUG: msleep()\n");
> >     1251 	msleep(1000);
> >     1252 
> >     1253 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> >     1254 		pr_info("DEBUG: Passed %s() %d\n", __func__, __LINE__);
> >     1255 		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> >     1256 		return 0;
> >     1257 	}
> >     1258 
> >     1259 	pr_info("DEBUG: Passed %s() %d\n", __func__, __LINE__);
> >     1260 
> >     1261 	if (fmt->pad == CIO2_PAD_SINK) {
> >     1262 		pr_info("DEBUG: Passed %s() %d\n", __func__, __LINE__);
> >     1263 		format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> >     1264 		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL,
> >     1265 				       &format);
> > 
> >     $ media-ctl -p -d /dev/media0
> >     Media controller API version 5.9.0
> > 
> >     Media device information
> >     ------------------------
> >     driver          ipu3-cio2
> >     model           Intel IPU3 CIO2
> >     serial          
> >     bus info        PCI:0000:00:14.3
> >     hw revision     0x0
> >     driver version  5.9.0
> >     
> > 
> >     Device topology
> >     - entity 1: ipu3-csi2 0 (2 pads, 1 link)
> >                 type V4L2 subdev subtype Unknown flags 0
> >                 device node name /dev/v4l-subdev0
> >     	pad0: Sink
> >     # [output stopped here]
> > 
> >     $ dmesg -xw
> >     [  871.807563] kernel: DEBUG: cio2_subdev_get_fmt() called
> >     [  871.807566] kernel: DEBUG: msleep()
> >     [  872.821254] kernel: DEBUG: Passed cio2_subdev_get_fmt() 1259
> >     [  872.821258] kernel: DEBUG: Passed cio2_subdev_get_fmt() 1262
> >     # [...] (same output repeatedly)
> >     [  986.313536] kernel: DEBUG: cio2_subdev_get_fmt() called
> >     [  986.313538] kernel: DEBUG: msleep()
> >     [  987.326899] kernel: DEBUG: Passed cio2_subdev_get_fmt() 1259
> >     [  987.326904] kernel: DEBUG: Passed cio2_subdev_get_fmt() 1262
> >     [  987.326908] kernel: DEBUG: cio2_subdev_get_fmt() called
> >     [  987.326910] kernel: DEBUG: msleep()
> >     (then, system hanged)
> > 
> > So, it looks like the following loop is happening there:
> > 1. cio2_subdev_get_fmt() calls v4l2_subdev_call()
> > 2. v4l2_subdev_call() internally calls cio2_subdev_get_fmt() again
> > 
> > Does anyone have any ideas what's happening?
> 
> First of all, thank you for a very thorough and informative bug report. It
> looks like a driver bug indeed.

Thank you for your patch! I'm glad that the bug report is informative
enough to find what is happening.

> I don't know how this has escaped review and testing earlier though. It's
> so clear.
> 
> Anyway, I hope the patchset I just sent fixes it for you. Please let me
> know if there are issues.

I tried the v2 version of your patchset with the option set to "very strong"
("CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL=y"). I can confirm that the patchset
fixed the system hang on v5.9-rc8. Thank you again.


