Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B30E84443BF
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 15:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbhKCOny (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 10:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231510AbhKCOny (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 10:43:54 -0400
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D021C061714;
        Wed,  3 Nov 2021 07:41:17 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id iHRpmXJkf030KiHRqmUq6J; Wed, 03 Nov 2021 15:41:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1635950474; bh=mTi5xjveIrNzJpzGo7W+EniN/yKcDn5XZYVjrsVnD5Y=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=W9pKuFCFrRGoY2QghPvwQ9w8qV4xsc0ZQ0splH1OsjWc6tBqi3ZSQWfAKARQeZx0f
         ZyoyXehjJHhp2gVhxa0PiSwX+EcG0GXBeABivSb+ZdFfULgW/3A1BrBEF6mxfv7D8Z
         eLa6A7Yc1MfY+R+2a3J6E3ByY3bpZRBld7RwMeEbT9AkTKUnlv23RqmG8EPX6SQ5h3
         yOAxSJO/NUaj9ffdP+8hcfUTw012gxgZK8aN+Jwx3mzNf3C6qGArxEHD2UuRtuNMar
         wbwZjBxkqhx4k4K3tVCdfoLULIw4kguzSpZgY5JiM11eJbCS9XtldjNd9lVTwBjJKG
         jSpiToV9tBO7w==
Subject: Re: atomisp current issues
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Tsuchiya Yuto <kitakar@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Alan <alan@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>, linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20211103135418.496f75d5@sal.lan>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c39cac68-73ab-4ab0-a701-e92f01c92774@xs4all.nl>
Date:   Wed, 3 Nov 2021 15:41:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211103135418.496f75d5@sal.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFNhMDZeI7N4foSXsMu9uUUt//3oWRGwV84zMApTzO8seWl0tZMnhG4Srvk/1q3sN8MI2WojOH6RArXo4DQ7f0BZnEr9rgGA1tLdMV8r+/IqitmuXoxq
 AK3exAZmum5Zm58BSQqiXhCz88kIo8TDVcv8mkSvV3g8BcV94FfxKAn6p6p+1J30w23Lh6GDSc0+fA+/Goetzbyo4V1xTYmPVLFKUR7XqprrMhoFCvkBSsm5
 IY8wJ5jB2Zidx1GiOtvrn57DjGOXsXT9Cjk2qGNn3U7kevRWBPpGVp7LuYe6thm3xyDGIrXmww/e50BQl2VXPqQ3G4ajiL6pjcp1HSl7p7rnIWT9kGAdzDua
 NQetlRehS/xk97rmihk5p/ACwIZ1TIFYznqcCDCTdwDTzdd6zGtDcwnP+KVPDOjpYilGqLRMZWxBO4MXDfoEryRtC58zTKV3yBZssl7nFbuXoIp4HSoX1kEG
 NlkoYdYQj44OO1FraWuoIhJSTvbsrPKu0cmK0g9iJvZhcR58uLNGo9MS8E1qkTpCVXyb1fw0RU3zmWg4Ywoi9/BZ1LMWBbGcuavPmgDNaRb2U8oMmmt56Ag6
 4Kwz3Fkt3Flt1RX5k3X+QJVlkkJzsdOkYhLf/G/PQzWYyWeWFXKM/7eFQ/EgMu9SPe4ABecI+H4IUSAlTUCijXBXsFfOUdy1uXkFBJCkllIYTHJmz1dvXCKZ
 EkZ4e6RrdaiHdV33oQnZhYVLxB42lWhDnypVA7U7QTE5JULViilUiGFI+2vjfCT66q7tqDwn2F8Nr4QnP+zMhul3HMj9FOj6beAY5jcsuFXTjnoGTgd1eE7d
 47GY2rRcgnw55XPSTFxecdnjbgoef4SsRj2ZjbuOOTcy0qjzTG/8jBz8QpRniBwbsT+AWhfJOHggoLSvYcZ7GBGlthaTe7WgSvLqMzUaOSnO16ZYrYY/WYHC
 P8yywAp8TUz7pVfxR5RtR8ZuPM8TaIj665hA/VgRRrJyOtPp4NXAJV8W8tRbGCPU8qVI+D3dajyOzSw8gKfbsx9b0Rk=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/11/2021 14:54, Mauro Carvalho Chehab wrote:
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
> 
> As this is something I wanted to do anyway, and it allowed me to cleanup
> several things in camorama's code.
> 
> Support for USERPTR is not autodetected. So, this should be selected

You can autodetect this: the capabilities field returned by VIDIOC_REQBUFS
or VIDIOC_CREATE_BUFS will indicate support for this. This works with any
vb2-based driver.

Just thought I should mention this...

Regards,

	Hans

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
> 
> Comments?
> 
> Regards,
> Mauro
> 

