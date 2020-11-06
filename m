Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBCCB2A913E
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 09:26:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgKFI0k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 03:26:40 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:45489 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbgKFI0k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 03:26:40 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 35601C0007;
        Fri,  6 Nov 2020 08:26:35 +0000 (UTC)
Date:   Fri, 6 Nov 2020 09:26:36 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hugues FRUCHET <hugues.fruchet@st.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "tomi.valkeinen@ti.com" <tomi.valkeinen@ti.com>,
        "sam@elite-embedded.com" <sam@elite-embedded.com>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [RFC 0/3] media: ov5640: Adjust htot, rework clock tree, add
 LINK_FREQ
Message-ID: <20201106082636.qduds2anq2jcwczj@uno.localdomain>
References: <20201028225706.110078-1-jacopo+renesas@jmondi.org>
 <84c8e00e-92e0-eecf-cb6a-ddb34e9bf36c@st.com>
 <20201105101403.tqxjellllwunfgk4@uno.localdomain>
 <f2f7e42e-f3ed-12b5-61fe-e7f77ed04fc5@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f2f7e42e-f3ed-12b5-61fe-e7f77ed04fc5@st.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,
   thanks for the detail, as soon as I have a bit of time I'll re-look
into this.

But in the meantime, I wonder, are you testing with JPEG only ?
What is the bpp of a JPEG image ?

So far, I only tested with YUYV as that's what I can capture on my
platform...

On Thu, Nov 05, 2020 at 03:33:18PM +0000, Hugues FRUCHET wrote:
> Hi Jacopo,
>
> On 11/5/20 11:14 AM, Jacopo Mondi wrote:
> > Hello Hugues,
> >
> >      thanks so much for testing
> >
> > On Tue, Nov 03, 2020 at 04:53:21PM +0000, Hugues FRUCHET wrote:
> >> Hi Jacopo,
> >>
> >> Here is the results of tests with 0V5640 CSI-2 on Avenger96 board.
> >>
> >> 1) First of all, the framerate is broken, it is almost 2 times greater
> >> that expected. Checking code it seems that mipi_div is missing when
> >> computing link_freq:
> >>
> >> +	/*
> >>    	 * The 'rate' parameter is the bitrate = VTOT * HTOT * FPS * BPP
> >>    	 *
> >>    	 * Adjust it to represent the CSI-2 link frequency and use it to
> >>    	 * update the associated control.
> >>    	 */
> >> -	link_freq = rate / sensor->ep.bus.mipi_csi2.num_data_lanes / 2;
> >> +	link_freq = rate / sensor->ep.bus.mipi_csi2.num_data_lanes / 2 / mipi_div;
> >
> > I don't think this is correct I'm sorry.
> >
>
> But this is what is observed with oscilloscope:
>
> v4l2-ctl --set-ctrl=test_pattern=1;v4l2-ctl --set-parm=30;v4l2-ctl
> --set-fmt-video=width=640,height=480,pixelformat=JPEG --stream-mmap
> --stream-count=-1
> Frame rate set to 30.000 fps
> [ 3501.482829] ov5640 1-003c: Bandwidth Per Lane=491443200, 640x480 from
> 1896x1080
> [ 3501.488822] ov5640 1-003c: ov5640_set_mipi_pclk: __v4l2_ctrl_s_ctrl 0
> 122860800 Hz
> [ 3501.496415] ov5640 1-003c: sysclk=491443200, _rate=492000000,
> mipi_div=2, prediv=3, mult=123, sysdiv=2
> [ 3501.511064] ov5640 1-003c: PCLK PERIOD 0x4837=0x20
> [ 3501.569487] st-mipid02 2-0014: clk_lane_reg1=0x41
> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.00 fps
> Measured #8ns (125MHz) ==> in line with 122860800 Hz
>
> v4l2-ctl --set-ctrl=test_pattern=1;v4l2-ctl --set-parm=15;v4l2-ctl
> --set-fmt-video=width=640,height=480,pixelformat=JPEG --stream-mmap
> --stream-count=-1
> Frame rate set to 15.000 fps
> [ 5019.240550] ov5640 1-003c: Bandwidth Per Lane=245721600, 640x480 from
> 1896x1080
> [ 5019.246542] ov5640 1-003c: ov5640_set_mipi_pclk: __v4l2_ctrl_s_ctrl 0
> 61430400 Hz
> [ 5019.257485] ov5640 1-003c: sysclk=245721600, _rate=246000000,
> mipi_div=2, prediv=3, mult=123, sysdiv=4
> [ 5019.271894] ov5640 1-003c: PCLK PERIOD 0x4837=0x41
> [ 5019.329693] st-mipid02 2-0014: clk_lane_reg1=0x81
> <<<<<<<<<<<<<<<<< 15.09 fps
> Measured #16ns (62.5MHz) => in line with 61430400 Hz
>
>
> > In my platform this fixes (in example) 640x480@30FPS but breaks
> > 640x480@15FPS which now runs at 7.5FPS (with Tomi's patch reverted)..
> > What a weird behaviour
> >
> > The reasoning behing link_frequency calculation is that
> >
> > pixel_rate = vtot * htot * fps
> > bit_rate = pixel_rate * bpp
> > link_freq = bit_rate / num_lanes / 2 (CSI-2 DDR)
> >
> > MIPI_DIV is not yet into play, as we're calculating the CSI-2 clock
> > lane freqeuency without applying it to the clock tree
> >
> > In my clock diagram link_freq is what is the MIPI_CLK output
> > To transform it in SYSCLK you walk the clock tree backward and
> >
> > sysclk = link_freq * 2 * mipi_div
> >
>
> Could you add in your codebase the debug patches below and measure the
> clock lane frequency with oscilloscope so that we have a chance to
> understand what happens ?
>
>
> @@ -1842,6 +1842,7 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
>   	bool auto_exp =  sensor->ctrls.auto_exp->val == V4L2_EXPOSURE_AUTO;
>   	unsigned long rate;
>   	int ret;
> +	struct i2c_client *client = sensor->i2c_client;
>
>   	if (!orig_mode)
>   		orig_mode = mode;
> @@ -1867,6 +1868,10 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
>   	 * the same rate than YUV, so we can just use 16 bpp all the time.
>   	 */
>   	rate = ov5640_calc_pixel_rate(sensor) * 16;
> +
> +	dev_info(&client->dev, "Bandwidth Per Lane=%lu, %dx%d from %dx%d\n",
> +		 rate / sensor->ep.bus.mipi_csi2.num_data_lanes, mode->hact,
> mode->vact, mode->htot, mode->vtot);
> +
>   	if (sensor->ep.bus_type == V4L2_MBUS_CSI2) {
>
>
>
> @@ -944,6 +944,8 @@ static int ov5640_set_mipi_pclk(struct ov5640_dev
> *sensor,
>   	unsigned long sysclk;
>   	u8 pclk_period;
>   	int ret;
> +	struct i2c_client *client = sensor->i2c_client;
> +	unsigned long _rate;
>
>
>   	sysclk = link_freq * 2 * mipi_div;
> -	ov5640_calc_sys_clk(sensor, sysclk, &prediv, &mult, &sysdiv);
> +	_rate = ov5640_calc_sys_clk(sensor, sysclk, &prediv, &mult, &sysdiv);
> +
> +	dev_info(&client->dev, "sysclk=%lu, _rate=%lu, mipi_div=%d, prediv=%d,
> mult=%d, sysdiv=%d\n",
> +		 sysclk, _rate, mipi_div, prediv, mult, sysdiv);
>
>
>
> >>
> >> To test the setup I have patched the link frequency control to report
> >> dynamically the frequency instead of hardcoded value:
> >> +#if 0
> >>    	freq_index = OV5640_LINK_FREQS_NUM - 1;
> >>    	for (i = 0; i < OV5640_LINK_FREQS_NUM; ++i) {
> >>    		if (ov5640_link_freqs[i] == link_freq) {
> >> @@ -966,18 +979,12 @@ static int ov5640_set_mipi_pclk(struct ov5640_dev
> >> *sensor,
> >>    	ret = __v4l2_ctrl_s_ctrl(sensor->ctrls.link_freq, freq_index);
> >>    	if (ret < 0)
> >>    		return ret;
> >> +#else
> >> +	ov5640_link_freqs[0] = link_freq;
> >> +	ret = __v4l2_ctrl_s_ctrl(sensor->ctrls.link_freq, 0);
> >> +#endif
> >
> > I wonder if this is acceptable for mainline. Pre-calculating the link
> > frequency is really a pain. I wonder why LINK_FREQ is a menu control
> > in first place :/
> >
>
> Yes would be nice to get rid of that.
>
> >>
> >> 2) Second problem comes from "media: i2c: ov5640: Adjust htot", this is
> >> breaking 1024x768@30fps & VGA@30fps which are slowdown to 15fps
> >
> > Weird, as 'Adjust htot' -increases- the htot values resulting in a
> > -faster- clock output, right ? Are you sure this is not due to the
> > above "/ mipi_div;" you've added ?
> >
>
> Another explanation is that there are errors so that 1/2 frame is dropped.
>
> >>
> >> 3) I have some instabilities when switching between framerate, I have to
> >> investigate the point. In few words this is a race problem between the
> >> OV5640 which set the frequency control and the MIPID02 which read the
> >> frequency control. I'll dig into the issue to see how to fix that.
> >>
> >>
> >> To summarize:
> >> -------------
> >> 1) "media: i2c: ov5640: Rework CSI-2 clock tree"
> >> Almost OK but mipi_div is missing
> >>
> >> 2) "media: i2c: ov5640: Adjust htot"
> >> Is breaking some resolutions/fps, so better to drop.
> >> Tomi, perhaps could you recheck with the fixed Jacopo serie if you still
> >> encounter your DPHY error issues ?
> >>
> >> With 1) fixed and 2) reverted, I'm back on track and have a successfull
> >> non-regression on my side + some better figures on some resolutions:
> >> - 1024x768@30fps which was not at the right framerate previously
> >> - 720p@30fps which was not at the right framerate previously
> >> - HD@15fps which was not at the right framerate previously
> >>
> >> Please note that I cannot go above HD@15fps on this platform.
> >>
> >> * QCIF  176x144 RGB565 15fps => OK, got 15
> >> * QCIF  176x144 YUYV   15fps => OK, got 15
> >> * QCIF  176x144 JPEG   15fps => OK, got 15
> >> * QCIF  176x144 RGB565 30fps => OK, got 30
> >> * QCIF  176x144 YUYV   30fps => OK, got 30
> >> * QCIF  176x144 JPEG   30fps => OK, got 30
> >> * QVGA  320x240 RGB565 15fps => OK, got 15
> >> * QVGA  320x240 YUYV   15fps => OK, got 15
> >> * QVGA  320x240 JPEG   15fps => OK, got 15
> >> * QVGA  320x240 RGB565 30fps => OK, got 29
> >> * QVGA  320x240 YUYV   30fps => OK, got 30
> >> * QVGA  320x240 JPEG   30fps => OK, got 29
> >> * VGA   640x480 RGB565 15fps => OK, got 15
> >> * VGA   640x480 YUYV   15fps => OK, got 15
> >> * VGA   640x480 JPEG   15fps => OK, got 15
> >> * VGA   640x480 RGB565 30fps => OK, got 30
> >> * VGA   640x480 YUYV   30fps => OK, got 30
> >> * VGA   640x480 JPEG   30fps => OK, got 30
> >> * 480p  720x480 RGB565 15fps => OK, got 15
> >> * 480p  720x480 YUYV   15fps => OK, got 15
> >> * 480p  720x480 JPEG   15fps => OK, got 15
> >> * 480p  720x480 RGB565 30fps => OK, got 30
> >> * 480p  720x480 YUYV   30fps => OK, got 30
> >> * 480p  720x480 JPEG   30fps => OK, got 30
> >> * XGA  1024x768 RGB565 15fps => OK, got 15
> >> * XGA  1024x768 YUYV   15fps => OK, got 15
> >> * XGA  1024x768 JPEG   15fps => OK, got 15
> >> * XGA  1024x768 RGB565 30fps => OK, got 30
> >> * XGA  1024x768 YUYV   30fps => OK, got 30
> >> * XGA  1024x768 JPEG   30fps => OK, got 30
> >> * 720p 1280x720 RGB565 15fps => OK, got 15
> >> * 720p 1280x720 YUYV   15fps => OK, got 15
> >> * 720p 1280x720 JPEG   15fps => OK, got 15
> >> * 720p 1280x720 RGB565 30fps => OK, got 30
> >> * 720p 1280x720 YUYV   30fps => OK, got 30
> >> * 720p 1280x720 JPEG   30fps => OK, got 30
> >> * HD  1920x1080 RGB565 15fps => OK, got 15
> >> * HD  1920x1080 YUYV   15fps => OK, got 15
> >> * HD  1920x1080 JPEG   15fps => OK, got 15
> >>
> >>
> >> So in few words, it sounds good, thanks Jacopo !
> >
> > That's sweet, but doesn't match what I see on iMX.6 /o\
>
> Yes, I feel that debug traces and oscilloscope will help to understand
> what happens.
>
> >
> >
> >>
> >>
> >> On 10/28/20 11:57 PM, Jacopo Mondi wrote:
> >>> Hi Hugues Tomi and Sam
> >>>
> >>>      this small series collects Tomi's patch on adjusting htot which has been
> >>> floating around for some time with a rework of the clock tree based on
> >>> Hugues' and Sam's work on setting pclk_period. It also address the need to
> >>> suppport LINK_FREQUENCY control as pointed out by Hugues.
> >>>
> >>> I'm sort of happy with the result as I've removed quite some chrun and the clock
> >>> tree calculation is more linear. All modes work except full-resolution which a
> >>> bit annoys me, as I can't select it through s_fmt (to be honest I have not
> >>> investigated that in detail, that's why an RFC).
> >>>
> >>> Framerate is better than before, but still off for some combinations:
> >>> 640x480@30 gives me ~40 FPS, 1920x1080@15 gives me ~7.
> >>> The other combinations I've tested looks good.
> >>>
> >>> Can I have your opinion on these changes and if they help you with your
> >>> platforms?
> >>>
> >>> I've only been able to test YUYV, support for formats with != bpp will need
> >>> some work most probably, but that was like this before (although iirc Hugues
> >>> has captured JPEG, right ?)
> >>>
> >>> There's a bit more cleanup on top to be done (I've left TODOs around) and
> >>> probably the HBLANK calculation should be checked to see if it works with the
> >>> new htot values.
> >>>
> >>> Thanks
> >>>     j
> >>>
> >>> Jacopo Mondi (2):
> >>>     media: i2c: ov5640: Rework CSI-2 clock tree
> >>>     media: i2c: ov5640: Add V4L2_CID_LINK_FREQ support
> >>>
> >>> Tomi Valkeinen (1):
> >>>     media: i2c: ov5640: Adjust htot
> >>>
> >>>    drivers/media/i2c/ov5640.c | 176 +++++++++++++++++++++++++------------
> >>>    1 file changed, 118 insertions(+), 58 deletions(-)
> >>>
> >>> --
> >>> 2.28.0
> >>>
> >>
> >> Best regards,
> >> Hugues.
>
> BR,
> Hugues.
