Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47262455A72
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 12:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343643AbhKRLeu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 06:34:50 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57260 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344058AbhKRLcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 06:32:47 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BFE893;
        Thu, 18 Nov 2021 12:29:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637234984;
        bh=xzpFbudhC0ge9Isk8I5LATae17vyOULSs4wp1kikbxI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q5kepHRnu1hhhUSp90QWBnVzUtjz4VSvyuwk/rImwJxih0dtx2gyEjFTXoCZMbeiK
         kVigocsUBRbiVNAJ4XDtiKQ7qDmT+RUqKxhJn8OF7LfTkW2IAMV+PgC9xNJZGGNmkV
         tNDW/a11AZzY3zvwkuqw2F7Vh54utqlpsLljhADg=
Date:   Thu, 18 Nov 2021 13:29:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        andrey.i.trufanov@gmail.com, linux-staging@lists.linux.dev,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        libcamera-devel@lists.libcamera.org,
        Nable <nable.maininbox@googlemail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        linux-media@vger.kernel.org
Subject: Re: [libcamera-devel] [RFC] media: Auto exposure/gain support for
 atomisp / libcamera integration ?
Message-ID: <YZY5Eg4rVyxe5NBN@pendragon.ideasonboard.com>
References: <20211107175013.355188-1-hdegoede@redhat.com>
 <20211107184811.7c8a0d1b@sal.lan>
 <163716984014.4034367.5258883684773687291@Monstersaurus>
 <YZVumG+WmoNfh+BX@pendragon.ideasonboard.com>
 <20211118075824.12db99c0@sal.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211118075824.12db99c0@sal.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Thu, Nov 18, 2021 at 07:58:24AM +0000, Mauro Carvalho Chehab wrote:
> Em Wed, 17 Nov 2021 23:05:28 +0200 Laurent Pinchart escreveu:
> > On Wed, Nov 17, 2021 at 05:24:00PM +0000, Kieran Bingham wrote:
> > > Quoting Mauro Carvalho Chehab (2021-11-07 18:48:11)  
> > > > Em Sun,  7 Nov 2021 18:50:13 +0100 Hans de Goede escreveu:
> > > >   
> > > > > Hi All,
> > > > > 
> > > > > Now that we have the atomisp2 driver running on some devices like
> > > > > the Asus T101HA; and with the exposure + gain controls for the ov2680
> > > > > sensor found on that laptop fixed:
> > > > > 
> > > > > https://lore.kernel.org/linux-media/20211107171549.267583-1-hdegoede@redhat.com/  
> > > > 
> > > > Thanks for that! Yeah, those controls are needed in order to get a
> > > > more realistic image.
> > > >   
> > > > > I believe we need to start thinking about various userspace API
> > > > > concerns. Thanks to Mauro's great work on various V4L2 API things
> > > > > are starting to work (somewhat) with regular V4L2 apps, but we really
> > > > > also need some processing / 3A stuff to make the cameras really
> > > > > usable.  
> > > > 
> > > > True.
> > > >   
> > > > > The most important thing needed is automatic exposure + gain control,
> > > > > ATM this relies on a custom ATOMISP ioctl, but I believe that we can
> > > > > just export the controls as regular v4l2 controls on the sensor subdev,
> > > > > at least for the ov2680 the exposure is already exported this way
> > > > > but it is read-only. Does anyone see any problems with just making
> > > > > these normal v4l2 controls on the sensor subdev ?  
> > > > 
> > > > While it is in staging, I don't see any troubles, but we need
> > > > to think a little bit about that before moving it out of staging.
> > > > 
> > > > Yet, one thing that it makes sense would be to allow multiple
> > > > opens at the /dev/video?. This way, external apps could touch
> > > > controls while the video is streaming, just like a normal V4L2
> > > > device.  
> > > 
> > > This is where libcamera sits as a "Raison d'être"
> > > 
> > > An IPA alongside the pipeline handler runs the algorithms (we have
> > > existing open source examples in both the RPi and IPU3 ... and to some
> > > degree the RKISP), so that applications do not have to have some
> > > external thing touching the controls.  
> > 
> > And applications *must not* touch the controls behind libcamera's back.
> > 
> > This being said, the V4L2 API allows multiple opens, so the atomisp2
> > driver needs to implement that to pass v4l2-compliance. It just
> > shouldn't be used.
> 
> Yeah, multiple opens is on my TODO list. I did a quick test last
> week, but implementing it should take some care, as otherwise a
> running stream would be stopped at release callback.

It's needed for v4l2-compliance but won't be useful in practice, so
there's no urgency.

> > > > > We can then simulate the custom ATOMISP ioctl through the subdevs,
> > > > > or we can just remove it alltogether.  
> > > > 
> > > > For now, I would keep it.  
> > 
> > Why so ? Who uses that custom ioctl with mainline ? We should expose
> > sensor controls on the sensor subdev and drop redundant custom APIs.
> > It's not just about libcamera, nobody expects custom ioctls to set
> > sensor controls.
> 
> It is actually custom controls that are implemented at subdev level.
> Some such custom ctrls are used internally by the driver in order
> to know more about the sensor and set/configure the firmware binaries. 
> 
> Getting rid of them too early would cause wrongdoings or will reduce
> the driver's functionality. Those controls are (on atomisp-ov2680):
> 
> 	{
> 		.id = V4L2_CID_FOCAL_ABSOLUTE,
> 		.name = "focal length",
> 	}, {
> 		.id = V4L2_CID_FNUMBER_ABSOLUTE,
> 		.name = "f-number",
> 	}, {
> 		.id = V4L2_CID_FNUMBER_RANGE,
> 		.name = "f-number range",
> 	}, {
> 		.id = V4L2_CID_BIN_FACTOR_HORZ,
> 		.name = "horizontal binning factor",
> 	}, {
> 		.id = V4L2_CID_BIN_FACTOR_VERT,
> 		.name = "vertical binning factor",
> 	}
> 
> Maybe there are already standard V4L2 controls for those. Didn't try
> to check yet what they do.

Each of those will need to be evaluated separately, but I think most
controls are not needed. The first three in the list above are only used
in atomisp_exif_markernote(), which is called to handle the
ATOMISP_IOC_ISP_MARKERNOTE ioctl, to return information about the lens
to userspace. The information can be retrieved by userspace directly
from the lens controller, or from another source (the focal and f-number
are fixed lens properties for most sensors, and are usually stored in a
platform configuration file).

The binning factors are needed by the ISP, and should thus be queried
from the sensor subdev by userspace, and configured on the ISP subdev.

> > > > > Once we have the controls available this way I think we should write
> > > > > a libcamera plugin, > which like the older versions of the Rasberry Pi
> > > > > plugin (if I've understood things correctly) won't use the MC framework
> > > > > for now.   
> > 
> > libcamera requires an MC device to enumerate cameras (the Raspberry Pi
> > drivers have supported this from their very first day in libcamera), so
> > you need at least that. 
> 
> Just enabling MC shouldn't be hard, I guess.
> 
> > The pipeline doesn't strictly need to be
> > controlled through MC, but I see no reason to use legacy APIs here.
> 
> Well, V4L2 is not a legacy API - but I understand what you're meaning ;-)
> You're talking about MC-centric control, as defined at:
> 
> 	https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/open.html#controlling-a-hardware-peripheral-via-v4l2
> 
> The thing is that atomisp is very different than other MC-controlled
> devices. There are ~60 different ISP binaries that could be selected. Each
> binary have different combinations of several parameters, like:
> 
>   struct ia_css_binary_descr {
> 	int mode;
> 	bool online;
> 	bool continuous;
> 	bool striped;
> 	bool two_ppc;
> 	bool enable_yuv_ds;
> 	bool enable_high_speed;
> 	bool enable_dvs_6axis;
> 	bool enable_reduced_pipe;
> 	bool enable_dz;
> 	bool enable_xnr;
> 	bool enable_fractional_ds;
> 	bool enable_dpc;
> 	bool enable_tnr;
> 	bool enable_capture_pp_bli;
> 
> 	unsigned int required_bds_factor;
> 	int stream_config_left_padding;
> 
> 	...
>   };
> 
> Depending on the sensor properties, the mode of operation (preview,
> continuous video, etc), the driver selects a firmware binary that will
> work best, if any.
> 
> Such logic could be moved to libcamera, but I suspect that it will be 
> different than any other MC-centric devices. 

It could be moved to userspace indeed, although I'd prefer keeping it in
the kernel if possible.

> It would actually be an hybrid between MC-centric and video-node-centric
> control, as the firmware selection happens at the atomisp driver itself,
> and not inside a subdev.

There's no meaningful separation between the "atomisp driver" and the
ISP subdev in this case. Both the ISP subdev and the video nodes will be
created by the atomisp driver, the ISP subdev won't be handled by a
separate driver.

> Ok, atomisp could create fake subdevs in order to make it easier for
> libcamera and allow selecting the firmware at the main driver via
> fake subdevs, but a random pipeline with 3 different outputs, for instance,
> would look like:
> 
> 	<sensor>  ----> <ISP running binary #0 >  ---> /dev/video0 
> 	           +--> <ISP running binary #23>  ---> /dev/video1 
> 	            `-> <ISP running binary #16>  ---> /dev/video2 
> 	               
> And the <binary #n> would internally have their own set of processing
> blocks.

It's not about "faking" anything. We should have one or multiple subdevs
in the MC graph to represent the ISP, depending on the device
architecture. I can't advise on how to split the ISP in multiple subdevs
as I don't know enough about the device, but it could be that a single
sudbev with multiple inputs (2x for the sensors, one for memory) and
multiple outputs (to all the video nodes) would work just fine.

> We would also need to find a way to expose the properties from struct
> ia_css_binary_descr via the subdev API.

If it's static data a custom ioctl would be the easiest option.

For parameters, recent ISP drivers use metadata nodes to pass a large
structure of ISP parameters to the kernel, storing it in buffers.
Possible alternatives are V4L2 controls or custom ioctls, but we'll
likely have to involve the request API in that case, which doesn't
support formats or custom ioctls. I'm not sure that's realistic, a
parameter input video node may be better.

> We need to evaluate if it would be worth doing that.
> 
> > > That's the part that confuses me on the atomisp - does it have separate
> > > (non-v4l2-subdev) drivers for all it's sensors currently?  
> > 
> > It has custom sensor drivers which need to be split out and moved to
> > drivers/media/i2c/ (or replaced with drivers already present in that
> > directory).
> 
> Yes. The atomisp-variants are normal V4L2 subdevs, but they also have:
> 
> 	- different resolutions - usually 16 pixels bigger in
> 	  horizontal and in vertical directions - as the atomisp
> 	  internally "eats" such extra pixels;

That's not an issue, all ISPs operate that way. The real sensor
resolution should be exposed to userspace, and the ISP input and output
formats (and internal parameters) should be configured by userspace to
take into account the margins that the ISP consumes.

> 	- some custom controls (see above);
> 	- as the power supply is usually controlled via GPIO and/or PMIC
> 	  drivers, the power on/off logic is bound to an ACPI atomisp
> 	  probing logic.
> 
> Converting or replacing them to be a normal driver will require first
> to implement regulator drivers for the PMICs used by BYT and CHY, and
> then address the other differences.

Power control isn't handled by ACPI then ?

> > > > Sounds like a plan to me, but I guess we'll need to solve support for
> > > > MMAP too, before adding an experimental plugin on libcamera.  
> > > 
> > > libcamera heavily uses MediaController to identify the pipelines. Is it
> > > feasible to at least add a Media device to be able to enumerate the
> > > pipeline/devices?
> > > 
> > > From what I recall having done that for RPi, it doesn't take much to do
> > > that?  
> > 
> > It should be trivial. I'd take it one step further and register entities
> > for the sensor and ISP. This should be trivial too, and will allow
> > locating the sensor subdev device node easily.
> 
> Exposing the sensors are trivial.
> 
> I'm not sure how easy/hard would be to expose the ISP. It can run
> multiple binaries at the same time, but it is not very clear how
> many binaries can run, nor if it is possible to fully control the
> input/output pads of each ISP "processing unit".
> 
> > > > > I believe we first need to understand the atomisp code better
> > > > > before we add MC support (*).
> > > > >
> > > > > *) I do believe that in the end MC support makes sense at least
> > > > > to tie together the   
> > > > 
> > > > I do think it should be exposing pipelines via MC. See, there are
> > > > two separate things here:
> > > > 
> > > > a. expose internal pipelines and subdevs via MC;
> > > > b. be MC-centric or video-centric device. See item 1.1.1 at [1]
> > > > 
> > > >   [1] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/open.html
> > > > 
> > > > The UVC driver exposes its internal topology via MC but it is a
> > > > video-centric device. There are other devices that do that too.
> > > > 
> > > > I do think we should implement (a).  
> > > 
> > > aha, yes, essentially that's what I was saying above ;-)
> > >   
> > > > It seems that we're reaching a consensus that further studies are 
> > > > needed before doing (b).
> > > > 
> > > > So, I guess that, for now, we should let the driver to register
> > > > their subdevs, but keep the control video-centric. We could then
> > > > experiment with AAA using subdevs, and try to get a better picture
> > > > about what should be done next with regards to MC.  
> > 
> > Moving sensor control from a video node to a subdev node should be easy.
> > I'd start doing so already, you'll then be able to use the libcamera
> > CameraSensor class in the pipeline handler.
> 
> Makes sense.
> 
> > The harder part with MC is to control the full pipeline, but we don't
> > need to do so, we can have a monolothic entity for the ISP in the media
> > graph, and use custom ioctls to control it.
> 
> As multiple binaries can run at the same time (it seems - didn't test it),
> a single monolithic entry won't solve. It would need to map each ISP
> "processing unit" - and/or each binary. More research is needed in order to
> model it.
> 
> > > > > But I still believe that an (experimental)
> > > > > plugin would be good, both to get something usable so that we can get
> > > > > more testers / more people interested in contributing.
> > > > > Another reason is to have another use-case where apps need to support
> > > > > libcamera to work properly (like on IPU3 devices) which will hopefully
> > > > > motivate people working on apps to put more effort in supporting libcamera
> > > > > (preferably through the new pipewire libcamera plugin so that things
> > > > > will also work in a flatpack sandbox).  
> > > > 
> > > > I didn't play yet with libcamera, but if we have an experimental
> > > > plugin to support the devices I have, I could add support for it on
> > > > Camorama. After my addition of USERPTR at camorama, I was able to confine
> > > > most of V4L2 and libv4l stuff on a single file, abstracting other parts 
> > > > from the rest of camorama code. So, maybe it won't be too complex to
> > > > make it also support libcamera. I'll see when time comes.
> > > >   
> > > > > ###
> > > > > 
> > > > > On other thing which I'm wondering about is the need to call S_INPUT to
> > > > > select front / back in this list from Mauro:
> > > > > 
> > > > >       $ for i in $(ls /dev/video*|sort -k2 -to -n); do echo -n $i:; v4l2-ctl -D -d $i|grep Name; done
> > > > >       /dev/video0:    Name             : ATOMISP ISP CAPTURE output
> > > > >       /dev/video1:    Name             : ATOMISP ISP VIEWFINDER output
> > > > >       /dev/video2:    Name             : ATOMISP ISP PREVIEW output
> > > > >       /dev/video3:    Name             : ATOMISP ISP VIDEO output
> > > > >       /dev/video4:    Name             : ATOMISP ISP ACC
> > > > >       /dev/video5:    Name             : ATOMISP ISP MEMORY input
> > > > >       /dev/video6:    Name             : ATOMISP ISP CAPTURE output
> > > > >       /dev/video7:    Name             : ATOMISP ISP VIEWFINDER output
> > > > >       /dev/video8:    Name             : ATOMISP ISP PREVIEW output
> > > > >       /dev/video9:    Name             : ATOMISP ISP VIDEO output
> > > > >       /dev/video10:   Name             : ATOMISP ISP ACC
> > > > > 
> > > > > I notice that everything is listed twice,   
> > > >
> > > > I didn't double-check, but I guess it is because video5-10 are devs
> > > > meant to support metadata, as the code calls V4L register device
> > > > function only 5 times. So, they're actually pairs of video0-4.
> > > > 
> > > > The plus side is that video5-10 could be used to send something that
> > > > would help AAA algorithms.
> > > >  
> > > > > I wonder if we can use /dev/video2
> > > > > with input 0 together with /dev/video8 for input 1, if that is possible then
> > > > > we might set a different default input on each.
> > > > > 
> > > > > And maybe also make them /dev/video0 (already done I see) and /dev/video1,
> > > > > possibly combined with a module-option to hide the others for now. This
> > > > > should make things better for regular apps.  
> > > > 
> > > > Yeah, it makes sense to have one separate device per sensor, assuming
> > > > that it would be possible to stream from both sensors at the same time.  
> > > 
> > > Is that why there are two sets of devices? to support two sensors?
> 
> No, this happens even on devices with a single sensor. I guess the second
> set was created by the V4L2 core to handle metadata.

The V4L2 core doesn't do that. atomisp_subdev_register_entities() is
called twice, see isp->num_of_streams. The naming is weird, as capture,
viewfinder and preview are different streams, I don't know what the
stream in "num_of_streams" correspond to.

> I've no idea if it allows both sensors to stream at the same time, as the
> tests I did so far were on a single sensor device.
> 
> > > I see 'ViewFinder' and 'Preview' devices, that sounds like multiple
> > > stream support, which we cover in libcamera.
> 
> Yes, it sounds it allows multiple stream support, but so far only the
> preview video node is behaving as expected by a normal V4L2 application.
> 
> Yesterday, I applied a series of fixes, but didn't re-test the other
> video devnodes yet.
> 
> > > a libcamera pipeline handler should expose a camera object for each
> > > sensor, and wrap all the devices so that the applications deal only with
> > > a 'camera' rather than trying to determine if they shoudl be looking at
> > > the capture/viewfinder/preview outputs...  
> > 
> > This needs to be investigated to figure out what it corresponds to. It
> > could indeed be that the hardware has two pipelines that can be operated
> > in parallel, one for each sensor. Or it could be that the driver
> > registers different video nodes for the two sensors, but make them
> > mutually exclusive, in which case half of the video nodes need to be
> > dropped. 
> 
> Yes, further investigation is required.
> 
> > The only thing I've been told is that the atomisp2 is an inline
> > ISP.
> >
> > > > If just one sensor can be enabled, then I would stick with just one
> > > > device and use S_INPUT to change the source pad - on video-centric
> > > > control. If we move it to MC-centric, then the MC-aware app/library
> > > > will be able to setup the right pad anyway.
> > > >   
> > > > > OTOH if we go the libcamera
> > > > > route then this is not really necessary I guess?  
> > > 
> > > If anyone wants to try creating a Pipeline Handler for this, I have a
> > > set of 'documentation patches' at :
> > > 
> > > https://git.libcamera.org/libcamera/vivid.git/log/
> > > 
> > > These hopefully walk through the core steps of constructing a basic
> > > pipeline handler, which should be enough to get started with. Of course,
> > > it's based around a single vivid device, and I'd expect the AtomISP to be
> > > more complicated, but there are other pipelines to inspect once getting
> > > to that point.  

-- 
Regards,

Laurent Pinchart
