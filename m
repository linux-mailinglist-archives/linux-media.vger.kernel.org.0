Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 821302A7B71
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 11:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgKEKOH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 05:14:07 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:54255 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgKEKOH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 05:14:07 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 74D1E2001D;
        Thu,  5 Nov 2020 10:14:03 +0000 (UTC)
Date:   Thu, 5 Nov 2020 11:14:03 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hugues FRUCHET <hugues.fruchet@st.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "tomi.valkeinen@ti.com" <tomi.valkeinen@ti.com>,
        "sam@elite-embedded.com" <sam@elite-embedded.com>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [RFC 0/3] media: ov5640: Adjust htot, rework clock tree, add
 LINK_FREQ
Message-ID: <20201105101403.tqxjellllwunfgk4@uno.localdomain>
References: <20201028225706.110078-1-jacopo+renesas@jmondi.org>
 <84c8e00e-92e0-eecf-cb6a-ddb34e9bf36c@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <84c8e00e-92e0-eecf-cb6a-ddb34e9bf36c@st.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hugues,

    thanks so much for testing

On Tue, Nov 03, 2020 at 04:53:21PM +0000, Hugues FRUCHET wrote:
> Hi Jacopo,
>
> Here is the results of tests with 0V5640 CSI-2 on Avenger96 board.
>
> 1) First of all, the framerate is broken, it is almost 2 times greater
> that expected. Checking code it seems that mipi_div is missing when
> computing link_freq:
>
> +	/*
>   	 * The 'rate' parameter is the bitrate = VTOT * HTOT * FPS * BPP
>   	 *
>   	 * Adjust it to represent the CSI-2 link frequency and use it to
>   	 * update the associated control.
>   	 */
> -	link_freq = rate / sensor->ep.bus.mipi_csi2.num_data_lanes / 2;
> +	link_freq = rate / sensor->ep.bus.mipi_csi2.num_data_lanes / 2 / mipi_div;

I don't think this is correct I'm sorry.

In my platform this fixes (in example) 640x480@30FPS but breaks
640x480@15FPS which now runs at 7.5FPS (with Tomi's patch reverted)..
What a weird behaviour

The reasoning behing link_frequency calculation is that

pixel_rate = vtot * htot * fps
bit_rate = pixel_rate * bpp
link_freq = bit_rate / num_lanes / 2 (CSI-2 DDR)

MIPI_DIV is not yet into play, as we're calculating the CSI-2 clock
lane freqeuency without applying it to the clock tree

In my clock diagram link_freq is what is the MIPI_CLK output
To transform it in SYSCLK you walk the clock tree backward and

sysclk = link_freq * 2 * mipi_div

>
> To test the setup I have patched the link frequency control to report
> dynamically the frequency instead of hardcoded value:
> +#if 0
>   	freq_index = OV5640_LINK_FREQS_NUM - 1;
>   	for (i = 0; i < OV5640_LINK_FREQS_NUM; ++i) {
>   		if (ov5640_link_freqs[i] == link_freq) {
> @@ -966,18 +979,12 @@ static int ov5640_set_mipi_pclk(struct ov5640_dev
> *sensor,
>   	ret = __v4l2_ctrl_s_ctrl(sensor->ctrls.link_freq, freq_index);
>   	if (ret < 0)
>   		return ret;
> +#else
> +	ov5640_link_freqs[0] = link_freq;
> +	ret = __v4l2_ctrl_s_ctrl(sensor->ctrls.link_freq, 0);
> +#endif

I wonder if this is acceptable for mainline. Pre-calculating the link
frequency is really a pain. I wonder why LINK_FREQ is a menu control
in first place :/

>
> 2) Second problem comes from "media: i2c: ov5640: Adjust htot", this is
> breaking 1024x768@30fps & VGA@30fps which are slowdown to 15fps

Weird, as 'Adjust htot' -increases- the htot values resulting in a
-faster- clock output, right ? Are you sure this is not due to the
above "/ mipi_div;" you've added ?

>
> 3) I have some instabilities when switching between framerate, I have to
> investigate the point. In few words this is a race problem between the
> OV5640 which set the frequency control and the MIPID02 which read the
> frequency control. I'll dig into the issue to see how to fix that.
>
>
> To summarize:
> -------------
> 1) "media: i2c: ov5640: Rework CSI-2 clock tree"
> Almost OK but mipi_div is missing
>
> 2) "media: i2c: ov5640: Adjust htot"
> Is breaking some resolutions/fps, so better to drop.
> Tomi, perhaps could you recheck with the fixed Jacopo serie if you still
> encounter your DPHY error issues ?
>
> With 1) fixed and 2) reverted, I'm back on track and have a successfull
> non-regression on my side + some better figures on some resolutions:
> - 1024x768@30fps which was not at the right framerate previously
> - 720p@30fps which was not at the right framerate previously
> - HD@15fps which was not at the right framerate previously
>
> Please note that I cannot go above HD@15fps on this platform.
>
> * QCIF  176x144 RGB565 15fps => OK, got 15
> * QCIF  176x144 YUYV   15fps => OK, got 15
> * QCIF  176x144 JPEG   15fps => OK, got 15
> * QCIF  176x144 RGB565 30fps => OK, got 30
> * QCIF  176x144 YUYV   30fps => OK, got 30
> * QCIF  176x144 JPEG   30fps => OK, got 30
> * QVGA  320x240 RGB565 15fps => OK, got 15
> * QVGA  320x240 YUYV   15fps => OK, got 15
> * QVGA  320x240 JPEG   15fps => OK, got 15
> * QVGA  320x240 RGB565 30fps => OK, got 29
> * QVGA  320x240 YUYV   30fps => OK, got 30
> * QVGA  320x240 JPEG   30fps => OK, got 29
> * VGA   640x480 RGB565 15fps => OK, got 15
> * VGA   640x480 YUYV   15fps => OK, got 15
> * VGA   640x480 JPEG   15fps => OK, got 15
> * VGA   640x480 RGB565 30fps => OK, got 30
> * VGA   640x480 YUYV   30fps => OK, got 30
> * VGA   640x480 JPEG   30fps => OK, got 30
> * 480p  720x480 RGB565 15fps => OK, got 15
> * 480p  720x480 YUYV   15fps => OK, got 15
> * 480p  720x480 JPEG   15fps => OK, got 15
> * 480p  720x480 RGB565 30fps => OK, got 30
> * 480p  720x480 YUYV   30fps => OK, got 30
> * 480p  720x480 JPEG   30fps => OK, got 30
> * XGA  1024x768 RGB565 15fps => OK, got 15
> * XGA  1024x768 YUYV   15fps => OK, got 15
> * XGA  1024x768 JPEG   15fps => OK, got 15
> * XGA  1024x768 RGB565 30fps => OK, got 30
> * XGA  1024x768 YUYV   30fps => OK, got 30
> * XGA  1024x768 JPEG   30fps => OK, got 30
> * 720p 1280x720 RGB565 15fps => OK, got 15
> * 720p 1280x720 YUYV   15fps => OK, got 15
> * 720p 1280x720 JPEG   15fps => OK, got 15
> * 720p 1280x720 RGB565 30fps => OK, got 30
> * 720p 1280x720 YUYV   30fps => OK, got 30
> * 720p 1280x720 JPEG   30fps => OK, got 30
> * HD  1920x1080 RGB565 15fps => OK, got 15
> * HD  1920x1080 YUYV   15fps => OK, got 15
> * HD  1920x1080 JPEG   15fps => OK, got 15
>
>
> So in few words, it sounds good, thanks Jacopo !

That's sweet, but doesn't match what I see on iMX.6 /o\


>
>
> On 10/28/20 11:57 PM, Jacopo Mondi wrote:
> > Hi Hugues Tomi and Sam
> >
> >     this small series collects Tomi's patch on adjusting htot which has been
> > floating around for some time with a rework of the clock tree based on
> > Hugues' and Sam's work on setting pclk_period. It also address the need to
> > suppport LINK_FREQUENCY control as pointed out by Hugues.
> >
> > I'm sort of happy with the result as I've removed quite some chrun and the clock
> > tree calculation is more linear. All modes work except full-resolution which a
> > bit annoys me, as I can't select it through s_fmt (to be honest I have not
> > investigated that in detail, that's why an RFC).
> >
> > Framerate is better than before, but still off for some combinations:
> > 640x480@30 gives me ~40 FPS, 1920x1080@15 gives me ~7.
> > The other combinations I've tested looks good.
> >
> > Can I have your opinion on these changes and if they help you with your
> > platforms?
> >
> > I've only been able to test YUYV, support for formats with != bpp will need
> > some work most probably, but that was like this before (although iirc Hugues
> > has captured JPEG, right ?)
> >
> > There's a bit more cleanup on top to be done (I've left TODOs around) and
> > probably the HBLANK calculation should be checked to see if it works with the
> > new htot values.
> >
> > Thanks
> >    j
> >
> > Jacopo Mondi (2):
> >    media: i2c: ov5640: Rework CSI-2 clock tree
> >    media: i2c: ov5640: Add V4L2_CID_LINK_FREQ support
> >
> > Tomi Valkeinen (1):
> >    media: i2c: ov5640: Adjust htot
> >
> >   drivers/media/i2c/ov5640.c | 176 +++++++++++++++++++++++++------------
> >   1 file changed, 118 insertions(+), 58 deletions(-)
> >
> > --
> > 2.28.0
> >
>
> Best regards,
> Hugues.
