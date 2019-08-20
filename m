Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E65695ABE
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 11:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729312AbfHTJNR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 05:13:17 -0400
Received: from mga14.intel.com ([192.55.52.115]:30959 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728414AbfHTJNR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 05:13:17 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Aug 2019 02:13:16 -0700
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; 
   d="scan'208";a="195728293"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Aug 2019 02:13:14 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 0D9FE20928; Tue, 20 Aug 2019 12:13:12 +0300 (EEST)
Date:   Tue, 20 Aug 2019 12:13:12 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hugues FRUCHET <hugues.fruchet@st.com>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH v2] media: ov5640: add support of V4L2_CID_LINK_FREQ
Message-ID: <20190820091311.GB5123@paasikivi.fi.intel.com>
References: <1561640224-24062-1-git-send-email-hugues.fruchet@st.com>
 <20190627160518.ylc2xfvqdw5w77xc@paasikivi.fi.intel.com>
 <5b43d59c-92d0-7234-71aa-b283e7462a84@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b43d59c-92d0-7234-71aa-b283e7462a84@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

On Tue, Jul 02, 2019 at 04:05:46PM +0000, Hugues FRUCHET wrote:
> Hi Sakari,
> 
> On 6/27/19 6:05 PM, Sakari Ailus wrote:
> > Hi Hugues,
> > 
> > On Thu, Jun 27, 2019 at 02:57:04PM +0200, Hugues Fruchet wrote:
> >> Add support of V4L2_CID_LINK_FREQ, this is needed
> >> by some CSI-2 receivers.
> >>
> >> 384MHz is exposed for the time being, corresponding
> >> to 96MHz pixel clock with 2 bytes per pixel on 2 data lanes.
> >>
> >> This setup has been tested successfully with ST MIPID02
> >> CSI-2 to parallel bridge.
> >>
> >> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> >> ---
> > 
> > Thanks for the patch.
> > 
> > The driver calculates the sensor configuration based on its configuration,
> > and this needs to be reflected in the link frequency: it's not a static
> > value. See e.g. ov5640_calc_sys_clk().
> > 
> 
> I know this code, but for a reason I don't understand yet, this seems
> to not have effects on the CSI-2 link frequency.
> 
> This has been verified with MIPID02 CSI-2 bridge which only work with
> this fixed link frequency as input to program its ui_x4 register 
> setting, see 
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2028171.html.
> All resolutions and all framerate have been tested succesfully with this 
> setting.
> 
> Initially I tried to set the link frequency according to the value 
> computed in ov5640_calc_sys_clk() but it was only functional when 
> resolutions/framerate was close to the 384MHz value...
> 
> As OV5640 D3 engineering board has been initially developped for 
> dragonboard, I'll dig into this and found this commit:
> https://lore.kernel.org/patchwork/patch/886794/
> which set a fixed pixel rate value to 96MHz, which match perfectly
> with the 384MHz value I found for link frequency...
> 
> Perhaps other CSI-2 OV5640 users can comment about it and have the 
> explanations of what I experiment...
> Maxime, Jacopo, do you have any idea about it ?

I would also like to wee a comment from someone who's familiar with the
device. Yet I can tell a static value of 348 MHz is clearly incorrect as it
ignores sensor runtime configuration as well as platform configuration
(external clock frequency for instance).

Generally speaking, configuring a CSI-2 receiver to expect a particular
frequency usually doesn't mean it's going to fail even if the transmitter
uses a different frequency, albeit the likelihood of it not working
increases as the difference grows. Could the problem be at the receiver's
end?

Have you checked what kind of values ov5640_calc_pclk() returns for
different configurations? It would seem like that this is what the
LINK_FREQ (divided by lanes and multiplied by two) should be.

> 
> 
> >> version 2:
> >>    - do not set control read only as per Hans' comment:
> >>      See https://www.mail-archive.com/linux-media@vger.kernel.org/msg147910.html
> >>
> >>   drivers/media/i2c/ov5640.c | 10 ++++++++++
> >>   1 file changed, 10 insertions(+)
> >>
> >> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> >> index 82d4ce9..e6307f3 100644
> >> --- a/drivers/media/i2c/ov5640.c
> >> +++ b/drivers/media/i2c/ov5640.c
> >> @@ -218,6 +218,7 @@ struct ov5640_ctrls {
> >>   	struct v4l2_ctrl *test_pattern;
> >>   	struct v4l2_ctrl *hflip;
> >>   	struct v4l2_ctrl *vflip;
> >> +	struct v4l2_ctrl *link_freq;
> >>   };
> >>   
> >>   struct ov5640_dev {
> >> @@ -2198,6 +2199,10 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
> >>   	return 0;
> >>   }
> >>   
> >> +static const s64 link_freq_menu_items[] = {
> >> +	384000000,
> >> +};
> >> +
> >>   static int ov5640_set_fmt(struct v4l2_subdev *sd,
> >>   			  struct v4l2_subdev_pad_config *cfg,
> >>   			  struct v4l2_subdev_format *format)
> >> @@ -2636,6 +2641,8 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
> >>   	case V4L2_CID_VFLIP:
> >>   		ret = ov5640_set_ctrl_vflip(sensor, ctrl->val);
> >>   		break;
> >> +	case V4L2_CID_LINK_FREQ:
> >> +		return 0;
> >>   	default:
> >>   		ret = -EINVAL;
> >>   		break;
> >> @@ -2703,6 +2710,9 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> >>   				       V4L2_CID_POWER_LINE_FREQUENCY_AUTO, 0,
> >>   				       V4L2_CID_POWER_LINE_FREQUENCY_50HZ);
> >>   
> >> +	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
> >> +						  0, 0, link_freq_menu_items);
> >> +
> >>   	if (hdl->error) {
> >>   		ret = hdl->error;
> >>   		goto free_ctrls;
> >> -- 
> >> 2.7.4
> >>
> > 
> 
> BR,
> Hugues.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
