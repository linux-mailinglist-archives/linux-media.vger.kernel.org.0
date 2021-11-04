Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F36D44515D
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 10:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbhKDJ5E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 05:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhKDJ5D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 05:57:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD15DC061714;
        Thu,  4 Nov 2021 02:54:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-18-250-nat.elisa-mobile.fi [85.76.18.250])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F3DDE52;
        Thu,  4 Nov 2021 10:54:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636019663;
        bh=cnyxyJwKgZpYQGNYyEX8NACmA9xL2fbb+o3zptN/wGA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KenoUfxcvJxUYBOBtKupjEApOV0X7i723WAPvHynN2KwAtQkJRCO1rwN6cPXsAFWW
         IRENEswlczDsGpCY0b+p2doHuAbRFyww2wQwCldv+koJMB7OPMitMXj8XiW8RuXLcI
         pqXis+2lq9inQn7+YewLM9/izL8tdLcCUPeGlFeM=
Date:   Thu, 4 Nov 2021 11:53:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Alan <alan@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>, linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: atomisp current issues
Message-ID: <YYOts0aoD/Quo5r6@pendragon.ideasonboard.com>
References: <20211103135418.496f75d5@sal.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211103135418.496f75d5@sal.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Wed, Nov 03, 2021 at 01:54:18PM +0000, Mauro Carvalho Chehab wrote:
> Hi,
> 
> From what I've seen so far, those are the main issues with regards to V4L2 API,
> in order to allow a generic V4L2 application to work with it.
> 
> MMAP support
> ============
> 
> Despite having some MMAP code on it, the current implementation is broken. 
> Fixing it is not trivial, as it would require fixing the HMM support on it, 
> which does several tricks.
> 
> The best would be to replace it by something simpler. If this is similar
> enough to IPU3, perhaps one idea would be to replace the HMM code on it by 
> videodev2 + IPU3 HMM code.
> 
> As this is not trivial, I'm postponing such task. If someone has enough
> time, it would be great to have this fixed.
> 
> From my side, I opted to add support for USERPTR on camorama:
> 
> 	https://github.com/alessio/camorama

We should *really* phase out USERPTR support. Worst case you may support
DMABUF only if MMAP is problematic, but I don't really see why it could
be easy to map an imported buffer and difficult to map a buffer
allocated by the driver. videobuf2 should be used.

> As this is something I wanted to do anyway, and it allowed me to cleanup
> several things in camorama's code.
> 
> Support for USERPTR is not autodetected. So, this should be selected
> via a command line parameter. Here (Fedora), I installed the build
> dependencies on my test device with:
> 
> 	$ sudo dnf builddep camorama
> 	$ sudo dnf install gnome-common  # for gnome-autogen.sh
> 
> Testing it with atomisp would be:
> 
> 	$ git clone https://github.com/alessio/camorama
> 	$ cd camorama && ./autogen.sh
> 	$ make && ./src/camorama -d /dev/video2  --debug -U -D
> 
> In time:
> --------
> 
>  Camorama currently doesn't work due to some other API bugs. See below.
> 
> 
> VIDIOC_G_FMT/VIDIOC_S_FMT/VIDIOC_TRY_FMT issues
> ===============================================
> 
> The implementation for VIDIOC_G_FMT/VIDIOC_S_FMT/VIDIOC_TRY_FMT are not
> properly implemented. It has several issues.
> 
> The main one is related to padding. Based on the comments inside the code,
> the ISP 2 seems to require padding to work, both vertically an horizontally.
> 
> Those are controlled by two modprobe parameters: pad_h and pad_w.
> The default for both is 16.
> 
> There are some other padding logic inside the function which sets the
> video formats at atomisp_cmd: atomisp_set_fmt(). This function is quite
> complex, being big and it calls several other atomisp kAPIs.
> 
> It basically queries the sensor, and then it mounts a pipeline that
> will have the sensor + ISP blocks. Those ISP blocks convert the format
> from Bayer into YUYV or RGB and scale down the resolution in order to
> match the request.
> 
> It also adjusts the padding. The padding code there is very complex,
> as it not only uses pad_h/pad_w, having things like:
> 
> 	if (!atomisp_subdev_format_conversion(asd, source_pad)) {
> 		padding_w = 0;
> 		padding_h = 0;
> 	} else if (IS_BYT) {
> 		padding_w = 12;
> 		padding_h = 12;
> 	}
> 	...
> 	atomisp_get_dis_envelop(asd, f->fmt.pix.width, f->fmt.pix.height,
> 				&dvs_env_w, &dvs_env_h);
> 	...
> 	/*
> 	 * set format info to sensor
> 	 * In continuous mode, resolution is set only if it is higher than
> 	 * existing value. This because preview pipe will be configured after
> 	 * capture pipe and usually has lower resolution than capture pipe.
> 	 */
> 	if (!asd->continuous_mode->val ||
> 	    isp_sink_fmt->width < (f->fmt.pix.width + padding_w + dvs_env_w) ||
> 	    isp_sink_fmt->height < (f->fmt.pix.height + padding_h +
> 				    dvs_env_h)) {
> 
> Due to that, the sensors are set to have those extra 16 columns/lines.
> Those extra data are consumed internally at the driver, so the output
> buffer won't contain those.
> 
> Yet, the buffer size to be allocated by userspace on USERPTR mode is not just
> width x height x bpp, but it may need extra space for such pads and/or other 
> things.
> 
> In practice, when VIDIOC_S_FMT asks for a 1600x1200 resolution, it
> actually sets 1616x1216 at the sensor (at the pad source), but the
> pad sink provides the requested resolution: 1600x1200.
> 
> However, the resolution returned by VIDIOC_G_FMT/VIDIOC_S_FMT/VIDIOC_TRY_FMT
> is not always the sink resolution. Sometimes, it returns the sensor format.
> 
> Fixing it has been challenging.
> 
> -
> 
> Another related issue is that, when a resolution bigger than the maximum
> resolution is requested, the driver doesn't return 1600x1200, but, instead,
> a smaller one.
> 
> On other words, setting to YUYV 1600x1200 gives:
> 
> 	$ v4l2-ctl --set-fmt-video pixelformat=YUYV,width=1600,height=1200 -d /dev/video2 --verbose
> 	VIDIOC_QUERYCAP: ok
> 	VIDIOC_G_FMT: ok
> 	VIDIOC_S_FMT: ok
> 	Format Video Capture:
> 		Width/Height      : 1600/1200
> 		Pixel Format      : 'YUYV' (YUYV 4:2:2)
> 		Field             : None
> 		Bytes per Line    : 3200
> 		Size Image        : 3842048
> 		Colorspace        : Rec. 709
> 		Transfer Function : Rec. 709
> 		YCbCr/HSV Encoding: Rec. 709
> 		Quantization      : Default (maps to Limited Range)
> 		Flags             : 
> 
> Setting to a higher resolution (which is a method that some apps use to test
> for the max resolution, when VIDIOC_ENUM_FRAMESIZES is not available or
> broken) produces:
> 
> 	$ v4l2-ctl --set-fmt-video pixelformat=YUYV,width=10000,height=10000 -d /dev/video2 --verbose
> 	VIDIOC_QUERYCAP: ok
> 	VIDIOC_G_FMT: ok
> 	VIDIOC_S_FMT: ok
> 	Format Video Capture:
> 		Width/Height      : 1600/900
> 		Pixel Format      : 'YUYV' (YUYV 4:2:2)
> 		Field             : None
> 		Bytes per Line    : 3200
> 		Size Image        : 2883584
> 		Colorspace        : Rec. 709
> 		Transfer Function : Rec. 709
> 		YCbCr/HSV Encoding: Rec. 709
> 		Quantization      : Default (maps to Limited Range)
> 		Flags             : 
> 
> Trying to set to the sensor resolution is even worse, as it returns EINVAL:
> 
> 	$ v4l2-ctl --set-fmt-video pixelformat=YUYV,width=1616,height=1216 -d /dev/video2 --verbose
> 	VIDIOC_QUERYCAP: ok
> 	VIDIOC_G_FMT: ok
> 	VIDIOC_S_FMT: failed: Invalid argument
> 
> The logs for such case are:
> 
> 	[ 4799.594724] atomisp-isp2 0000:00:03.0: can't create streams
> 	[ 4799.594757] atomisp-isp2 0000:00:03.0: __get_frame_info 1616x1216 (padded to 0) returned -22
> 	[ 4799.594781] atomisp-isp2 0000:00:03.0: Can't set format on ISP. Error -22
> 
> Video devices
> =============
> 
> Currently, 10 video? devices are created:
> 
> 	$ for i in $(ls /dev/video*|sort -k2 -to -n); do echo -n $i:; v4l2-ctl -D -d $i|grep Name; done
> 	/dev/video0:	Name             : ATOMISP ISP CAPTURE output
> 	/dev/video1:	Name             : ATOMISP ISP VIEWFINDER output
> 	/dev/video2:	Name             : ATOMISP ISP PREVIEW output
> 	/dev/video3:	Name             : ATOMISP ISP VIDEO output
> 	/dev/video4:	Name             : ATOMISP ISP ACC
> 	/dev/video5:	Name             : ATOMISP ISP MEMORY input
> 	/dev/video6:	Name             : ATOMISP ISP CAPTURE output
> 	/dev/video7:	Name             : ATOMISP ISP VIEWFINDER output
> 	/dev/video8:	Name             : ATOMISP ISP PREVIEW output
> 	/dev/video9:	Name             : ATOMISP ISP VIDEO output
> 	/dev/video10:	Name             : ATOMISP ISP ACC
> 
> That seems to be written to satisfy some Android-based app, but we don't
> really need all of those.
> 
> I'm thinking to comment out the part of the code which creates all of those,
> keeping just "ATOMISP ISP PREVIEW output", as I don't think we need all
> of those.

Why is that ? Being able to capture multiple streams in different
resolutions is important for lots of applications, the viewfinder
resolution is often different than the video streaming and/or still
capture resolution. Scaling after capture is often expensive (and there
are memory bandwidth and power constraints to take into account too). A
single-stream device may be better than nothing, but it's time to move
to the 21st century.

-- 
Regards,

Laurent Pinchart
