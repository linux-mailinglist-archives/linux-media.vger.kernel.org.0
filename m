Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2E22295A65
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 10:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2507897AbgJVIdF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 04:33:05 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:56553 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502986AbgJVIdD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 04:33:03 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id EE78620013;
        Thu, 22 Oct 2020 08:32:56 +0000 (UTC)
Date:   Thu, 22 Oct 2020 10:32:55 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hugues FRUCHET <hugues.fruchet@st.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Laura Nao <laura.nao@kynetics.com>,
        Sam Bobrowicz <sam@elite-embedded.com>
Subject: Re: [PATCH v2] media: ov5640: add support of V4L2_CID_LINK_FREQ
Message-ID: <20201022083255.7eu6feuwygdff6ak@uno.localdomain>
References: <1561640224-24062-1-git-send-email-hugues.fruchet@st.com>
 <20190627160518.ylc2xfvqdw5w77xc@paasikivi.fi.intel.com>
 <5b43d59c-92d0-7234-71aa-b283e7462a84@st.com>
 <20190820091311.GB5123@paasikivi.fi.intel.com>
 <20190821142407.facveek5omjdide6@uno.localdomain>
 <3a54de53-6a9b-f0e9-f4bb-77ccbb1f8ede@st.com>
 <c1a0cc6f-a52a-3863-3c49-a52f92e6c944@st.com>
 <20201021165147.hr4dqadlzdfc3nda@uno.localdomain>
 <97679c52-ad94-7377-d349-a3a49504f3ec@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <97679c52-ad94-7377-d349-a3a49504f3ec@st.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

On Thu, Oct 22, 2020 at 08:14:39AM +0000, Hugues FRUCHET wrote:
> Hi Jacopo,
>
> On 10/21/20 6:51 PM, Jacopo Mondi wrote:
> > Hi Hugues,
> >
> > On Mon, Oct 19, 2020 at 01:40:26PM +0000, Hugues FRUCHET wrote:
> >> Hi Jacopo, all,
> >>
> >> Back on this subject recently, I've found interesting things around
> >> register 0x4837 PCLK PERIOD thanks to Samuel Bobrowicz work on PLL
> >> settings [1], but 0x4837 register value computation differs from what
> >> I've understood/measured.
> >
> > Thanks, very useful to know!
> >
> >>
> >> The OV5640 PCLK_PERIOD register value must be in line with the
> >> ST MIPID02 CSI-2 receiver CLOCK_LANE_1 register, otherwise receptions
> >> issues are encountered has shown in my previous mail.
> >>
> >> Configuring those 2 registers according to measured MIPI clock frequency
> >> allows to cover almost all resolutions/formats (RGB565, YUV422, JPEG).
> >> I've also measured with oscilloscope the MIPI clock-lane frequency and
> >> verified that this is well matching computed one [2].
> >
> > Is this based on the current mainline driver ? I still wonder if
> > Tomi's patch that adjusts the vtot and htot value to reflect datasheet
> > needs to be applied.
>
> Yes it is based on latest media codebase, so no vtot/htot changes as
> done by Tomi (status of those changes is not clear on my side, but I
> could test on my platform, just let me know).
>

I've now included that change in my tree again, and see if it could
help or not.

I see where the data Tomi changed come from, but I wonder why vtot and
htot was set in the way they currently are in the original register
blobs :/

> >
> >> Please note that due to platform limitation, I could not test link
> >> frequency above 720p@15fps, so additional tests are needed with platform
> >> that could handle 5Mp@15fps (OV5640 limit).
> >>
> >> In term of code, this mean:
> >>
> >> v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
> >>          		  0, 0, link_freq_menu_items);
> >>
> >> ov5640_set_mipi_pclk(rate)
> >> {
> >>     mipi_sclk = ov5640_calc_sys_clk(sensor, rate, &prediv, &mult, &sysdiv);
> >>     link_freq = mipi_sclk / 2 / mipi_div; /* the CSI-2 clock-lane
> >> frequency, measurements are matching */
> >>
> >>     _pclk_period = (u8) (2000000000UL / link_freq);/* expressed in ns and
> >
> > Is 2000000000UL to compensate for the / 2 above ?
>
> No, it is for value of register expressed in 0.5ns unit as explained in
> comment.

Oh I see. Sorry, confused by the DDR mode compensation.

>
> >
> >> with 1-bit decimal: 0x1=0.5ns, 0x2=1ns, 0x3=1.5ns and so on... */
> >>     ov5640_write_reg(sensor, OV5640_REG_PCLK_PERIOD, _pclk_period);
> >>
> >>     link_freq_menu_items[0] = link_freq;/* Currently a hack to inform
> >> receiver about the dynamically computed clock frequency, I don't know
> >> yet how to handle this correctly, please advise... */
> >
> > Can you call __v4l2_ctrl_s_ctrl on a menu control ?
> >
>
> I'll give it a try...

Looking at ov5645 that's what you're supposed to do (__ or non __
version depending on lock handling)

>
> >>
> >>     ...
> >> }
> >>
> >> As explained in comment, I miss a V4L2 way to set dynamically
> >> V4L2_CID_LINK_FREQ in order to propose a new patchset.
> >>
> >>
> >> [1]
> >> https://patchwork.kernel.org/project/linux-media/patch/1539797508-127629-1-git-send-email-sam@elite-embedded.com/
> >>
> >> [2] measure of the CSI-2 clock frequency, tested with JPEG (easier to
> >> check that capture is fine) and various resolutions:
> >>
> >
> > On my test platform setting 0x4837 with the value calculated as you
> > reported breaks capture. I'll investigate if I need to setup anything
> > on the receiver side as you have to (it's an i.MX6, if anyone reading
> > knows that platform better than what I do :)
> >
> > Thanks
> >    j
> >
>
> From
> https://www.nxp.com/docs/en/application-note/AN5305.pdf
>
> I understand that you have to set MIPI_CSI_TST_CTRL1 register according
> to link frequency as per table 4.

I noticed pretty quickly looking at the CSI-2 receiver driver:

	ctrl = v4l2_ctrl_find(csi2->src_sd->ctrl_handler,
			      V4L2_CID_LINK_FREQ);
	if (!ctrl)
		mbps_per_lane = CSI2_DEFAULT_MAX_MBPS;
	else
		mbps_per_lane = DIV_ROUND_UP_ULL(2 * ctrl->qmenu_int[ctrl->val],
						 USEC_PER_SEC);

So I guess implementing support for LINK_FREQ will make my receiver
happy as well.

Looking forward to receiving or sending a patch to support it, in the
meantime I'll look (again) at those pesky vtot/htot and the clock tree
calculation that follows.

Thanks
  j

>
> >> ****************
> >> ***  QQVGA  ****
> >> ****************
> >> * JPEG QQVGA@15fps
> >> v4l2-ctl --set-ctrl=test_pattern=1;v4l2-ctl --set-parm=15;v4l2-ctl
> >> --set-fmt-video=width=160,height=120,pixelformat=JPEG --stream-mmap
> >> --stream-count=-1
> >> [  371.459607] ov5640 1-003c: Bandwidth Per Lane=223879680, 160x120 from
> >> 1896x984
> >> [  371.465516] ov5640 1-003c: mipi_sclk=224000000, mipi_div=2, prediv=3,
> >> mult=28, sysdiv=1
> >> [  371.473727] ov5640 1-003c: link freq=56000000 Hz
> >> [  371.478529] ov5640 1-003c: PCLK PERIOD 0x4837=0x23
> >> [  371.538193] st-mipid02 2-0014: clk_lane_reg1=0x8d
> >> <<<<<<<<<<<<<<<<< 15.09 fps
> >> <<<<<<<<<<<<<<< 15.04 fps
> >> <<<<<<<<<<<<<<< 15.03 fps
> >> <<<<<<<<<<<<<<< 15.02 fps
> >> <<<<<<<<<<<<<<< 15.01 fps
> >> Clock-lane frequency measured at #18ns (55.5MHz)
> >>
> >>
> >> * RGB565 QQVGA@15fps
> >> v4l2-ctl --set-ctrl=test_pattern=1;v4l2-ctl --set-parm=15;v4l2-ctl
> >> --set-fmt-video=width=160,height=120,pixelformat=RGBP --stream-mmap
> >> --stream-count=-1
> >> [ 1229.422079] st-mipid02 2-0014: clk_lane_reg1=0x8d
> >> [ 1229.431758] ov5640 1-003c: Bandwidth Per Lane=223879680, 160x120 from
> >> 1896x984
> >> [ 1229.437905] ov5640 1-003c: mipi_sclk=224000000, mipi_div=2, prediv=3,
> >> mult=28, sysdiv=1
> >> [ 1229.445620] ov5640 1-003c: link freq=56000000 Hz
> >> [ 1229.450397] ov5640 1-003c: PCLK PERIOD 0x4837=0x23
> >> <<<<<<<<<<<<<<<<< 15.09 fps
> >> <<<<<<<<<<<<<<< 15.04 fps
> >> <<<<<<<<<<<<<< 14.70 fps
> >> <<<<<<<<<<<<<<< 14.77 fps
> >> Measured #18ns (55.5MHz)
> >>
> >>
> >> **************
> >> ***  VGA  ****
> >> **************
> >> * JPEG VGA@15fps
> >> v4l2-ctl --set-ctrl=test_pattern=1;v4l2-ctl --set-parm=15;v4l2-ctl
> >> --set-fmt-video=width=640,height=480,pixelformat=JPEG --stream-mmap
> >> --stream-count=-1
> >> [ 1105.621884] ov5640 1-003c: Bandwidth Per Lane=245721600, 640x480 from
> >> 1896x1080
> >> [ 1105.627927] ov5640 1-003c: mipi_sclk=246000000, mipi_div=2, prediv=3,
> >> mult=123, sysdiv=4
> >> [ 1105.641273] ov5640 1-003c: link freq=61500000 Hz
> >> [ 1105.646789] ov5640 1-003c: PCLK PERIOD 0x4837=0x40
> >> [ 1105.709626] st-mipid02 2-0014: clk_lane_reg1=0x81
> >> <<<<<<<<<<<<<<<<< 15.09 fps
> >> <<<<<<<<<<<<<<< 15.04 fps
> >> <<<<<<<<<<<<<<< 15.03 fps
> >> <<<<<<<<<<<<<<< 15.02 fps
> >> <<<<<<<<<<<<<<< 15.01 fps
> >>
> >> Measured #16ns (62.5MHz)
> >>
> >>
> >> * JPEG VGA@30fps
> >> v4l2-ctl --set-ctrl=test_pattern=1;v4l2-ctl --set-parm=30;v4l2-ctl
> >> --set-fmt-video=width=640,height=480,pixelformat=JPEG --stream-mmap
> >> --stream-count=-1
> >> [ 1144.539082] ov5640 1-003c: Bandwidth Per Lane=491443200, 640x480 from
> >> 1896x1080
> >> [ 1144.545143] ov5640 1-003c: mipi_sclk=492000000, mipi_div=2, prediv=3,
> >> mult=123, sysdiv=2
> >> [ 1144.558756] ov5640 1-003c: link freq=123000000 Hz
> >> [ 1144.562012] ov5640 1-003c: PCLK PERIOD 0x4837=0x20
> >> [ 1144.623895] st-mipid02 2-0014: clk_lane_reg1=0x41
> >> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.09 fps
> >> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.04 fps
> >> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.13 fps
> >>
> >> Measured #8ns (125MHz)
> >>
> >>
> >> *******************
> >> ***  1024x768  ****
> >> *******************
> >> * JPEG 1024x768@15fps
> >> v4l2-ctl --set-ctrl=test_pattern=1;v4l2-ctl --set-parm=15;v4l2-ctl
> >> --set-fmt-video=width=1024,height=768,pixelformat=JPEG --stream-mmap
> >> --stream-count=-1
> >> <<<<<<<<<<<<<<<<< 15.09 fps
> >> <<<<<<<<<<<<<<< 15.04 fps
> >> <<<<<<<<<<<<<<< 15.03 fps
> >> <<<<<<<<<<<<<<< 15.02 fps
> >>
> >> Measured #16ns (62.5MHz)
> >>
> >>
> >> * JPEG 1024x768@30fps
> >> v4l2-ctl --set-ctrl=test_pattern=1;v4l2-ctl --set-parm=30;v4l2-ctl
> >> --set-fmt-video=width=1024,height=768,pixelformat=JPEG --stream-mmap
> >> --stream-count=-1
> >> [ 1218.632061] ov5640 1-003c: Bandwidth Per Lane=491443200, 1024x768
> >> from 1896x1080
> >> [ 1218.638216] ov5640 1-003c: mipi_sclk=492000000, mipi_div=2, prediv=3,
> >> mult=123, sysdiv=2
> >> [ 1218.651788] ov5640 1-003c: link freq=123000000 Hz
> >> [ 1218.655345] ov5640 1-003c: PCLK PERIOD 0x4837=0x20
> >> [ 1218.724149] st-mipid02 2-0014: clk_lane_reg1=0x41
> >> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.09 fps
> >> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.04 fps
> >> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.13 fps
> >> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.09 fps
> >> Measured #8ns (125MHz)
> >>
> >>
> >> ***************
> >> ***  720p  ****
> >> ***************
> >> * JPEG 720p@15fps
> >> v4l2-ctl --set-ctrl=test_pattern=1;v4l2-ctl --set-parm=15;v4l2-ctl
> >> --set-fmt-video=width=1280,height=720,pixelformat=JPEG --stream-mmap
> >> --stream-count=-1
> >> [ 7781.232498] ov5640 1-003c: Bandwidth Per Lane=168009600, 1280x720
> >> from 1892x740
> >> [ 7781.238554] ov5640 1-003c: mipi_sclk=169600000, mipi_div=1, prediv=3,
> >> mult=106, sysdiv=5
> >> [ 7781.247117] ov5640 1-003c: link freq=84800000 Hz
> >> [ 7781.251116] ov5640 1-003c: PCLK PERIOD 0x4837=0x17
> >> [ 7781.316980] st-mipid02 2-0014: clk_lane_reg1=0x5d
> >>
> >> Measured #12ns (83MHz)
> >>
> >> * JPEG 720p@30fps
> >> v4l2-ctl --set-ctrl=test_pattern=1;v4l2-ctl --set-parm=30;v4l2-ctl
> >> --set-fmt-video=width=1280,height=720,pixelformat=JPEG --stream-mmap
> >> --stream-count=-1
> >> [  515.548519] ov5640 1-003c: Bandwidth Per Lane=336019200, 1280x720
> >> from 1892x740
> >> [  515.554646] ov5640 1-003c: mipi_sclk=340000000, mipi_div=1, prediv=3,
> >> mult=85, sysdiv=2
> >> [  515.562406] ov5640 1-003c: link freq=170000000 Hz
> >> [  515.574376] ov5640 1-003c: PCLK PERIOD 0x4837=0xb
> >> [  515.639862] st-mipid02 2-0014: clk_lane_reg1=0x2d
> >> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.39 fps
> >> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.50 fps
> >> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.36 fps
> >> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.42 fps
> >> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.40 fps
> >> Measured #6ns (166MHz)
> >> ==> 30fps but image artefacts (out of MP1 capabilities)
> >>
> >>
> >> ****************
> >> ***  1080p  ****
> >> ****************
> >> * JPEG HD@15fps
> >> v4l2-ctl --set-ctrl=test_pattern=1;v4l2-ctl --set-parm=15;v4l2-ctl
> >> --set-fmt-video=width=1920,height=1080,pixelformat=JPEG --stream-mmap
> >> --stream-count=-1
> >> [ 1998.266915] ov5640 1-003c: Bandwidth Per Lane=336000000, 1920x1080
> >> from 2500x1120
> >> [ 1998.273040] ov5640 1-003c: mipi_sclk=336000000, mipi_div=1, prediv=3,
> >> mult=42, sysdiv=1
> >> [ 1998.280987] ov5640 1-003c: link freq=168000000 Hz
> >> [ 1998.286142] ov5640 1-003c: PCLK PERIOD 0x4837=0xb
> >> [ 1998.380206] st-mipid02 2-0014: clk_lane_reg1=0x2d
> >> <<< 1.88 fps
> >> << 1.87 fps
> >> << 1.88 fps
> >> << 1.87 fps
> >> << 1.87 fps
> >> Measured #6ns (166MHz)
> >>
> >> * JPEG HD@30fps
> >> v4l2-ctl --set-ctrl=test_pattern=1;v4l2-ctl --set-parm=30;v4l2-ctl
> >> --set-fmt-video=width=1920,height=1080,pixelformat=JPEG --stream-mmap
> >> --stream-count=-1
> >> [ 2196.981767] ov5640 1-003c: Bandwidth Per Lane=672000000, 1920x1080
> >> from 2500x1120
> >> [ 2196.987882] ov5640 1-003c: mipi_sclk=672000000, mipi_div=1, prediv=3,
> >> mult=84, sysdiv=1
> >> [ 2196.996225] ov5640 1-003c: link freq=336000000 Hz
> >> [ 2197.000553] ov5640 1-003c: PCLK PERIOD 0x4837=0x5
> >> [ 2197.097244] st-mipid02 2-0014: clk_lane_reg1=0x15
> >> Measured #3ns (333MHz)
> >>
> >> ==> no images but out of MP1 capabilities
> >>
> >>
> >> **************
> >> ***  5Mp  ****
> >> **************
> >> * JPEG 5Mp@15fps
> >> v4l2-ctl --set-ctrl=test_pattern=1;v4l2-ctl --set-parm=15;v4l2-ctl
> >> --set-fmt-video=width=2592,height=1944,pixelformat=JPEG --stream-mmap
> >> --stream-count=-1
> >>
> >> [ 2479.203457] ov5640 1-003c: Bandwidth Per Lane=671639040, 2592x1944
> >> from 2844x1968
> >> [ 2479.209647] ov5640 1-003c: mipi_sclk=672000000, mipi_div=1, prediv=3,
> >> mult=84, sysdiv=1
> >> [ 2479.217961] ov5640 1-003c: link freq=336000000 Hz
> >> [ 2479.222240] ov5640 1-003c: PCLK PERIOD 0x4837=0x5
> >> [ 2479.388400] st-mipid02 2-0014: clk_lane_reg1=0x15
> >>
> >> Measured #3ns (333MHz)
> >>
> >> ==> no images but out of MP1 capabilities
> >>
> >>
> >>
> >> On 9/3/19 4:48 PM, Hugues FRUCHET wrote:
> >>> Hi Jacopo,
> >>>
> >>> On 8/21/19 4:24 PM, Jacopo Mondi wrote:
> >>>> Hello,
> >>>>       +laura who has been working on supporting RAW capture for this
> >>>>       driver.
> >>>>
> >>>> On Tue, Aug 20, 2019 at 12:13:12PM +0300, Sakari Ailus wrote:
> >>>>> Hi Hugues,
> >>>>>
> >>>>> On Tue, Jul 02, 2019 at 04:05:46PM +0000, Hugues FRUCHET wrote:
> >>>>>> Hi Sakari,
> >>>>>>
> >>>>>> On 6/27/19 6:05 PM, Sakari Ailus wrote:
> >>>>>>> Hi Hugues,
> >>>>>>>
> >>>>>>> On Thu, Jun 27, 2019 at 02:57:04PM +0200, Hugues Fruchet wrote:
> >>>>>>>> Add support of V4L2_CID_LINK_FREQ, this is needed
> >>>>>>>> by some CSI-2 receivers.
> >>>>>>>>
> >>>>>>>> 384MHz is exposed for the time being, corresponding
> >>>>>>>> to 96MHz pixel clock with 2 bytes per pixel on 2 data lanes.
> >>>>>>>>
> >>>>>>>> This setup has been tested successfully with ST MIPID02
> >>>>>>>> CSI-2 to parallel bridge.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> >>>>>>>> ---
> >>>>>>>
> >>>>>>> Thanks for the patch.
> >>>>>>>
> >>>>>>> The driver calculates the sensor configuration based on its configuration,
> >>>>>>> and this needs to be reflected in the link frequency: it's not a static
> >>>>>>> value. See e.g. ov5640_calc_sys_clk().
> >>>>>>>
> >>>>>>
> >>>>>> I know this code, but for a reason I don't understand yet, this seems
> >>>>>> to not have effects on the CSI-2 link frequency.
> >>>>>>
> >>>>
> >>>> This seems unlikely to me, as the ov5640_calc_sys_clk() calculates the
> >>>> system clock, which then generates the MIPI CLK.
> >>>>
> >>>> I would really be interested to know if you could measure somehow the
> >>>> actual frequency of the clock lane, to make sure it actually
> >>>> changes according to to the driver calculations.
> >>>>
> >>>>>> This has been verified with MIPID02 CSI-2 bridge which only work with
> >>>>>> this fixed link frequency as input to program its ui_x4 register
> >>>>>> setting, see
> >>>>>> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2028171.html.
> >>>>>> All resolutions and all framerate have been tested succesfully with this
> >>>>>> setting.
> >>>>>>
> >>>>>> Initially I tried to set the link frequency according to the value
> >>>>>> computed in ov5640_calc_sys_clk() but it was only functional when
> >>>>>> resolutions/framerate was close to the 384MHz value...
> >>>>>>
> >>>>>> As OV5640 D3 engineering board has been initially developped for
> >>>>>> dragonboard, I'll dig into this and found this commit:
> >>>>>> https://lore.kernel.org/patchwork/patch/886794/
> >>>>>> which set a fixed pixel rate value to 96MHz, which match perfectly
> >>>>>> with the 384MHz value I found for link frequency...
> >>>>>>
> >>>>>> Perhaps other CSI-2 OV5640 users can comment about it and have the
> >>>>>> explanations of what I experiment...
> >>>>>> Maxime, Jacopo, do you have any idea about it ?
> >>>>>
> >>>>> I would also like to wee a comment from someone who's familiar with the
> >>>>> device. Yet I can tell a static value of 348 MHz is clearly incorrect as it
> >>>>> ignores sensor runtime configuration as well as platform configuration
> >>>>> (external clock frequency for instance).
> >>>>>
> >>>>> Generally speaking, configuring a CSI-2 receiver to expect a particular
> >>>>> frequency usually doesn't mean it's going to fail even if the transmitter
> >>>>> uses a different frequency, albeit the likelihood of it not working
> >>>>> increases as the difference grows. Could the problem be at the receiver's
> >>>>> end?
> >>>>>
> >>>>> Have you checked what kind of values ov5640_calc_pclk() returns for
> >>>>> different configurations? It would seem like that this is what the
> >>>>> LINK_FREQ (divided by lanes and multiplied by two) should be.
> >>>>
> >>>> Not exactly. ov5640_calc_pclk() is only used when computing the
> >>>> parallel bus pixel clock not for the CSI-2 bus.
> >>>>
> >>>> To obtain the link frequency for the MIPI interface I would consider
> >>>> the system clock frequency calculated by ov5640_calc_sys_clk(), which
> >>>> represents the bandwidth per lane in bits per second. This should then
> >>>> be divided by 2 to compensate the MIPI DDR mode [*] (no need to divide
> >>>> by the number of lanes, as this is already the bandwidth -per lane-)
> >>>>
> >>>> For 640x480 YUYV8_2X8 (and 1024x768) with 2 data lanes and 24MHz xclk
> >>>> I have calculated the following values:
> >>>>
> >>>> SYSCLK = 492MHz
> >>>> MIPISCLK = 256MHz
> >>>> PCLK = 61,50MHz
> >>>>
> >>>> For 1280x720 with the same setup
> >>>> SYSCLK = 340MHz
> >>>> MIPI_CLK = 170MHz
> >>>> PCLK = 42,50 (this seems veeery low according to datasheet)
> >>>>
> >>>> For 1920x1080
> >>>> SYSCLK = 680MHz
> >>>> MIPI_CLK = 340MHz
> >>>> PCLK = 85MHz (slightly slow according to the datasheet)
> >>>>
> >>>> All captured images seems fine...
> >>>>
> >>>> If you could confirm those values by probing the actual clock lane it
> >>>> would be just great.
> >>>>
> >>>
> >>> I've made some measurements probing clock lane with YUYV 16 bits
> >>> grabbing, here are the results:
> >>>
> >>> * VGA @ 30fps
> >>> v4l2-ctl --set-parm=30;v4l2-ctl
> >>> --set-fmt-video=width=640,height=480,pixelformat=YUYV --stream-mmap
> >>> [ 1624.854273] ov5640 0-003c: rate=491443200, 640x480 from 1896x1080
> >>> [ 1624.859192] ov5640 0-003c: sysclk=492000000, mipi_div=2
> >>> Measured clock lane frequency: 123MHz
> >>>
> >>> * 1024x768 @ 30fps
> >>> v4l2-ctl --set-parm=30;v4l2-ctl
> >>> --set-fmt-video=width=1024,height=768,pixelformat=YUYV --stream-mmap
> >>> [  558.833885] ov5640 0-003c: rate=491443200, 1024x768 from 1896x1080
> >>> [  558.840188] ov5640 0-003c: sysclk=492000000, mipi_div=2
> >>> Measured clock lane frequency: 124MHz
> >>>
> >>> * 720p @ 30fps
> >>> v4l2-ctl --set-parm=30;v4l2-ctl
> >>> --set-fmt-video=width=1280,height=720,pixelformat=YUYV --stream-mmap
> >>> [ 2920.785392] ov5640 0-003c: rate=336019200, 1280x720 from 1892x740
> >>> [ 2920.794771] ov5640 0-003c: sysclk=340000000, mipi_div=1
> >>> Measured clock lane frequency: 171MHz
> >>>
> >>> * 1080p @ 30fps
> >>> v4l2-ctl --set-parm=30;v4l2-ctl
> >>> --set-fmt-video=width=1920,height=1080,pixelformat=YUYV --stream-mmap
> >>> [ 1650.143701] ov5640 0-003c: rate=672000000, 1920x1080 from 2500x1120
> >>> [ 1650.149876] ov5640 0-003c: sysclk=672000000, mipi_div=1
> >>> Measured clock lane frequency: 330MHz
> >>>
> >>> So it seems that formula must also take care of mipi_div:
> >>> link_frequency = sys_div / 2 / mipi_div
> >>>
> >>>
> >>> Unfortunately, as said previously, when updating ov5640 codebase so that
> >>> CID_LINK_FREQUENCY returns this computed value instead of 384MHz fixed
> >>> value, the MIPID02 bridge has some troubles and some
> >>> resolutions/framerate are broken:
> >>>
> >>> dmesg -n8
> >>> echo "format link_freq +p" > /sys/kernel/debug/dynamic_debug/control
> >>>
> >>> * VGA @ 30fps => broken
> >>> v4l2-ctl --set-parm=30;v4l2-ctl
> >>> --set-fmt-video=width=640,height=480,pixelformat=YUYV --stream-mmap
> >>> [ 1624.854273] ov5640 0-003c: rate=491443200, 640x480 from 1896x1080
> >>> [ 1624.859192] ov5640 0-003c: sysclk=492000000, mipi_div=2
> >>> [ 1624.924287] st-mipid02 1-0014: detect link_freq = 123000000 Hz
> >>> ==> no frames sent to DCMI
> >>>
> >>> * 720p @ 30fps => very slow framerate
> >>> v4l2-ctl --set-parm=30;v4l2-ctl
> >>> --set-fmt-video=width=1280,height=720,pixelformat=YUYV --stream-mmap
> >>> [ 1900.707822] ov5640 0-003c: rate=336019200, 1280x720 from 1892x740
> >>> [ 1900.712717] ov5640 0-003c: sysclk=340000000, mipi_div=1
> >>> [ 1900.782402] st-mipid02 1-0014: detect link_freq = 170000000 Hz
> >>> << 0.69 fps
> >>> < 0.67 fps
> >>> < 0.67 fps
> >>>
> >>> * 1080p @ 30fps => very slow framerate
> >>> v4l2-ctl --set-parm=30;v4l2-ctl
> >>> --set-fmt-video=width=1920,height=1080,pixelformat=YUYV --stream-mmap
> >>> [ 1366.550832] ov5640 0-003c: rate=336000000, 1920x1080 from 2500x1120
> >>> [ 1366.555668] ov5640 0-003c: sysclk=336000000, mipi_div=1
> >>> Frame rate set to 30.000 fps
> >>> [ 1367.105503] ov5640 0-003c: rate=672000000, 1920x1080 from 2500x1120
> >>> [ 1367.110420] ov5640 0-003c: sysclk=672000000, mipi_div=1
> >>> [ 1367.214498] st-mipid02 1-0014: detect link_freq = 336000000 Hz
> >>> << 0.11 fps
> >>> < 0.11 fps
> >>>
> >>>
> >>> * 1080p @ 15fps => OK, 15fps as expected
> >>> v4l2-ctl --set-parm=15;v4l2-ctl
> >>> --set-fmt-video=width=1920,height=1080,pixelformat=YUYV --stream-mmap
> >>> [ 1327.417545] ov5640 0-003c: rate=336000000, 1920x1080 from 2500x1120
> >>> [ 1327.422560] ov5640 0-003c: sysclk=336000000, mipi_div=1
> >>> [ 1327.527852] st-mipid02 1-0014: detect link_freq = 168000000 Hz
> >>> <<<<<<<<<<<<<<<<< 15.09 fps
> >>> <<<<<<<<<<<<<<< 15.04 fps
> >>>
> >>>
> >>> One could argue that this is the mipid02 bridge codebase that is wrong:
> >>> drivers/media/i2c/st-mipid02.c:
> >>>      mipid02_configure_from_rx_speed()
> >>>        [...]
> >>>        bridge->r.clk_lane_reg1 |= (2000000000 / link_freq) << 2;
> >>>
> >>> but computation is inline with MIPID02 spec:
> >>>
> >>> "CLOCK LANE 1 REGISTER"
> >>> Bit_no   Bit_name
> >>> 7        ui_x4_clk_lane[5]
> >>> 6        ui_x4_clk_lane[4]
> >>> 5        ui_x4_clk_lane[3]
> >>> 4        ui_x4_clk_lane[2]
> >>> 3        ui_x4_clk_lane[1]
> >>> 2        ui_x4_clk_lane[0]
> >>> Unit interval time multiplied by four
> >>> This signal indicates the bit period in units of
> >>> 0.25 ns. If the unit interval is 3 ns, twelve (0x0C)
> >>> should be programmed. This value is used to
> >>> generate delays. Therefore, if the period is not a
> >>> multiple of 0.25 ns, the value should be rounded
> >>> down. For example, a 600 Mbit/s single lane
> >>> linkuses a unit interval of 1.667 ns. Multiplying
> >>> by four results in 6.667. In this case, a value of 6
> >>> (not 7) should be programmed.
> >>>
> >>>
> >>> Perhaps that someone which knows well CSI-2 interfaces could
> >>> detect what is wrong here, but personally I don't.
> >>>
> >>>
> >>>> However, this only work assuming the here below [*], and we're still
> >>>> missing something because RAW still doesn't work as expected :(
> >>>>
> >>>> Anyway, clock tree madness apart, fixing the LINK_FREQ control value
> >>>> to 96MHz seems like it does not reflect what the driver actual does.
> >>>>
> >>>> Could you try setting the control value to what the driver actually
> >>>> computes as here suggested?
> >>>>
> >>>> Thanks
> >>>>       j
> >>>>
> >>>> PS. I'm still confused why the have the link-frequencies property in
> >>>> DTS bindings. What is its purpose if all drivers compute or hardcode
> >>>> it?
> >>>
> >>> I share this point of view, I don't know how to return a dynamically
> >>> computed link frequency. Current drivers are exposing a single one
> >>> or a set of discrete frequencies.
> >>> For a matter of test purpose, I've done this hack:
> >>>
> >>> -static const s64 link_freq_menu_items[] = {
> >>> +static s64 link_freq_menu_items[] = {
> >>> 	384000000,
> >>> };
> >>>
> >>> +	link_freq_menu_items[0] = _rate / 2 / mipi_div;
> >>>
> >>>
> >>>>
> >>>> [*] There is a big assumption here, that the MIPI bus clock gets
> >>>> generated by two different clock outputs depending if the mode goes
> >>>> through the the scaler or not. You can see this at line 967 in the
> >>>> driver code. If mode goes though the scaler, MIPI_DIV = 2 and you get
> >>>> the bus clock from the MIPISCLK signal. If it does not go through the
> >>>> scaler MIPI_DIV = 1 and then the MIPI bus clock gets provided by the
> >>>> MIPI_CLK signal. This is the result of several attempts to decode the
> >>>> ov5640 clock tree, but it has only been tested with modes with bpp =
> >>>> 16 and 2 data lanes. As it has been recently reported, for RAW mode,
> >>>> this does not work well, so the assumption might not be correct.
> >>>>
> >>>>>
> >>>>>>
> >>>>>>
> >>>>>>>> version 2:
> >>>>>>>>       - do not set control read only as per Hans' comment:
> >>>>>>>>         See https://www.mail-archive.com/linux-media@vger.kernel.org/msg147910.html
> >>>>>>>>
> >>>>>>>>      drivers/media/i2c/ov5640.c | 10 ++++++++++
> >>>>>>>>      1 file changed, 10 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> >>>>>>>> index 82d4ce9..e6307f3 100644
> >>>>>>>> --- a/drivers/media/i2c/ov5640.c
> >>>>>>>> +++ b/drivers/media/i2c/ov5640.c
> >>>>>>>> @@ -218,6 +218,7 @@ struct ov5640_ctrls {
> >>>>>>>>      	struct v4l2_ctrl *test_pattern;
> >>>>>>>>      	struct v4l2_ctrl *hflip;
> >>>>>>>>      	struct v4l2_ctrl *vflip;
> >>>>>>>> +	struct v4l2_ctrl *link_freq;
> >>>>>>>>      };
> >>>>>>>>
> >>>>>>>>      struct ov5640_dev {
> >>>>>>>> @@ -2198,6 +2199,10 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
> >>>>>>>>      	return 0;
> >>>>>>>>      }
> >>>>>>>>
> >>>>>>>> +static const s64 link_freq_menu_items[] = {
> >>>>>>>> +	384000000,
> >>>>>>>> +};
> >>>>>>>> +
> >>>>>>>>      static int ov5640_set_fmt(struct v4l2_subdev *sd,
> >>>>>>>>      			  struct v4l2_subdev_pad_config *cfg,
> >>>>>>>>      			  struct v4l2_subdev_format *format)
> >>>>>>>> @@ -2636,6 +2641,8 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
> >>>>>>>>      	case V4L2_CID_VFLIP:
> >>>>>>>>      		ret = ov5640_set_ctrl_vflip(sensor, ctrl->val);
> >>>>>>>>      		break;
> >>>>>>>> +	case V4L2_CID_LINK_FREQ:
> >>>>>>>> +		return 0;
> >>>>>>>>      	default:
> >>>>>>>>      		ret = -EINVAL;
> >>>>>>>>      		break;
> >>>>>>>> @@ -2703,6 +2710,9 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> >>>>>>>>      				       V4L2_CID_POWER_LINE_FREQUENCY_AUTO, 0,
> >>>>>>>>      				       V4L2_CID_POWER_LINE_FREQUENCY_50HZ);
> >>>>>>>>
> >>>>>>>> +	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
> >>>>>>>> +						  0, 0, link_freq_menu_items);
> >>>>>>>> +
> >>>>>>>>      	if (hdl->error) {
> >>>>>>>>      		ret = hdl->error;
> >>>>>>>>      		goto free_ctrls;
> >>>>>>>> --
> >>>>>>>> 2.7.4
> >>>>>>>>
> >>>>>>>
> >>>>>>
> >>>>>> BR,
> >>>>>> Hugues.
> >>>>>
> >>>>> --
> >>>>> Sakari Ailus
> >>>>> sakari.ailus@linux.intel.com
> >>>
> >>> BR,
> >>> Hugues.
> >>>
> >> BR,
> >> Hugues.
>
> BR,
> Hugues.
