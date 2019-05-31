Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8060316A1
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 23:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbfEaVaa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 17:30:30 -0400
Received: from gofer.mess.org ([88.97.38.141]:40621 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726171AbfEaVaa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 17:30:30 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 2B10860400; Fri, 31 May 2019 22:30:28 +0100 (BST)
Date:   Fri, 31 May 2019 22:30:27 +0100
From:   Sean Young <sean@mess.org>
To:     Brad Love <brad@nextdimension.cc>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v4 4/4] pvrusb2: Add Hauppauge HVR1955/1975 devices
Message-ID: <20190531213027.x5wefqrtgthxxpqz@gofer.mess.org>
References: <1545421223-3577-1-git-send-email-brad@nextdimension.cc>
 <1551294966-12564-1-git-send-email-brad@nextdimension.cc>
 <1551294966-12564-5-git-send-email-brad@nextdimension.cc>
 <20190405152423.76fsvdrpzz4kwxsg@gofer.mess.org>
 <7b429935-cc00-ba02-e321-c976efeb6e49@nextdimension.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b429935-cc00-ba02-e321-c976efeb6e49@nextdimension.cc>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Brad,

On Fri, May 31, 2019 at 12:20:45PM -0500, Brad Love wrote:
> Hi Shawn,
> 
> Just found time to get back to this. I fixed all the checkpatch strict
> warnings, no problem. Then I noticed a few comments of yours that I
> somehow missed first time around. I've replied inline to those.
> 
> 
> On 05/04/2019 10.24, Sean Young wrote:
> > On Wed, Feb 27, 2019 at 01:16:06PM -0600, Brad Love wrote:
> >> Includes support to identify and use two Hauppauge device.
> >> HVR-1955:
> >> - LGDT3306a ATSC/QAM demod
> >> - si2177 tuner
> >> - cx25840 decoder for analog tv/composite/s-video/audio
> >>
> >> HVR-1975 dual-frontend:
> >> - LGDT3306a ATSC/QAM demod
> >> - si2168 DVB-C/T/T2 demod
> >> - si2177 tuner
> >> - cx25840 decoder for analog tv/composite/s-video/audio
> >>
> >> Signed-off-by: Brad Love <brad@nextdimension.cc>
> > First of all there are bunch of checkpatch.pl --strict warnings and checks
> > that need resolving.
> >
> >> ---
> >> Since v2:
> >> - Fix build with VIDEO_PVRUSB2_DVB enabled
> >> Changes since v1:
> >> - Fix build with VIDEO_PVRUSB2_DVB disabled
> >> - Insert 160xxx code lower, so 75xxx profile is not split
> >> - Reorganize 160xxx board profile
> >> - Share config where possible
> >>
> >>  drivers/media/usb/pvrusb2/Kconfig               |   2 +
> >>  drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c |  25 ++++
> >>  drivers/media/usb/pvrusb2/pvrusb2-devattr.c     | 164 ++++++++++++++++++++++++
> >>  drivers/media/usb/pvrusb2/pvrusb2-devattr.h     |   1 +
> >>  drivers/media/usb/pvrusb2/pvrusb2-fx2-cmd.h     |   4 +
> >>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c         |  36 +++++-
> >>  6 files changed, 231 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/usb/pvrusb2/Kconfig b/drivers/media/usb/pvrusb2/Kconfig
> >> index 1ad913f..144631c 100644
> >> --- a/drivers/media/usb/pvrusb2/Kconfig
> >> +++ b/drivers/media/usb/pvrusb2/Kconfig
> >> @@ -40,6 +40,8 @@ config VIDEO_PVRUSB2_DVB
> >>  	select DVB_S5H1409 if MEDIA_SUBDRV_AUTOSELECT
> >>  	select DVB_S5H1411 if MEDIA_SUBDRV_AUTOSELECT
> >>  	select DVB_TDA10048 if MEDIA_SUBDRV_AUTOSELECT
> >> +	select DVB_LGDT3306A if MEDIA_SUBDRV_AUTOSELECT
> >> +	select DVB_SI2168 if MEDIA_SUBDRV_AUTOSELECT
> >>  	select MEDIA_TUNER_TDA18271 if MEDIA_SUBDRV_AUTOSELECT
> >>  	select MEDIA_TUNER_SIMPLE if MEDIA_SUBDRV_AUTOSELECT
> >>  	select MEDIA_TUNER_TDA8290 if MEDIA_SUBDRV_AUTOSELECT
> >> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c b/drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c
> >> index d5bec0f..36016ab 100644
> >> --- a/drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c
> >> +++ b/drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c
> >> @@ -111,10 +111,35 @@ static const struct routing_scheme routing_defav400 = {
> >>  	.cnt = ARRAY_SIZE(routing_schemeav400),
> >>  };
> >>  
> >> +static const struct routing_scheme_item routing_scheme160xxx[] = {
> >> +	[PVR2_CVAL_INPUT_TV] = {
> >> +		.vid = CX25840_COMPOSITE7,
> >> +		.aud = CX25840_AUDIO8,
> >> +	},
> >> +	[PVR2_CVAL_INPUT_RADIO] = {
> >> +		.vid = CX25840_COMPOSITE4,
> >> +		.aud = CX25840_AUDIO6,
> >> +	},
> >> +	[PVR2_CVAL_INPUT_COMPOSITE] = {
> >> +		.vid = CX25840_COMPOSITE3,
> >> +		.aud = CX25840_AUDIO_SERIAL,
> >> +	},
> >> +	[PVR2_CVAL_INPUT_SVIDEO] = {
> >> +		.vid = CX25840_SVIDEO1,
> >> +		.aud = CX25840_AUDIO_SERIAL,
> >> +	},
> >> +};
> >> +
> >> +static const struct routing_scheme routing_def160xxx = {
> >> +	.def = routing_scheme160xxx,
> >> +	.cnt = ARRAY_SIZE(routing_scheme160xxx),
> >> +};
> >> +
> >>  static const struct routing_scheme *routing_schemes[] = {
> >>  	[PVR2_ROUTING_SCHEME_HAUPPAUGE] = &routing_def0,
> >>  	[PVR2_ROUTING_SCHEME_GOTVIEW] = &routing_defgv,
> >>  	[PVR2_ROUTING_SCHEME_AV400] = &routing_defav400,
> >> +	[PVR2_ROUTING_SCHEME_HAUP160XXX] = &routing_def160xxx,
> >>  };
> >>  
> >>  void pvr2_cx25840_subdev_update(struct pvr2_hdw *hdw, struct v4l2_subdev *sd)
> >> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-devattr.c b/drivers/media/usb/pvrusb2/pvrusb2-devattr.c
> >> index ef36b62..97b4fc8 100644
> >> --- a/drivers/media/usb/pvrusb2/pvrusb2-devattr.c
> >> +++ b/drivers/media/usb/pvrusb2/pvrusb2-devattr.c
> >> @@ -37,6 +37,9 @@ pvr2_device_desc structures.
> >>  #include "tda18271.h"
> >>  #include "tda8290.h"
> >>  #include "tuner-simple.h"
> >> +#include "si2157.h"
> >> +#include "lgdt3306a.h"
> >> +#include "si2168.h"
> >>  #endif
> >>  
> >>  
> >> @@ -525,7 +528,164 @@ static const struct pvr2_device_desc pvr2_device_751xx = {
> >>  #endif
> >>  };
> >>  
> >> +/*------------------------------------------------------------------------*/
> >> +/*    Hauppauge PVR-USB2 Model 160000 / 160111 -- HVR-1955 / HVR-1975     */
> >> +
> >> +#ifdef CONFIG_VIDEO_PVRUSB2_DVB
> >> +static int pvr2_si2157_attach(struct pvr2_dvb_adapter *adap);
> >> +static int pvr2_si2168_attach(struct pvr2_dvb_adapter *adap);
> >> +static int pvr2_dual_fe_attach(struct pvr2_dvb_adapter *adap);
> >> +static int pvr2_lgdt3306a_attach(struct pvr2_dvb_adapter *adap);
> >> +
> >> +static const struct pvr2_dvb_props pvr2_160000_dvb_props = {
> >> +	.frontend_attach = pvr2_dual_fe_attach,
> >> +	.tuner_attach    = pvr2_si2157_attach,
> >> +};
> > Newline.
> >
> >> +static const struct pvr2_dvb_props pvr2_160111_dvb_props = {
> >> +	.frontend_attach = pvr2_lgdt3306a_attach,
> >> +	.tuner_attach    = pvr2_si2157_attach,
> >> +};
> >> +
> >> +static int pvr2_si2157_attach(struct pvr2_dvb_adapter *adap)
> >> +{
> >> +	struct si2157_config si2157_config = {};
> >> +
> >> +	si2157_config.inversion = 1;
> >> +	si2157_config.fe = adap->fe[0];
> >> +
> >> +	adap->i2c_client_tuner = dvb_module_probe("si2157", "si2177",
> >> +						&adap->channel.hdw->i2c_adap,
> >> +						0x60, &si2157_config);
> > Indentation.
> >
> >> +
> >> +	if (!adap->i2c_client_tuner)
> >> +		return -ENODEV;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int pvr2_si2168_attach(struct pvr2_dvb_adapter *adap)
> >> +{
> >> +	struct si2168_config si2168_config = {};
> >> +	struct i2c_adapter *adapter;
> >> +
> >> +	pr_debug("%s()\n", __func__);
> >> +
> >> +	si2168_config.fe = &adap->fe[1];
> >> +	si2168_config.i2c_adapter = &adapter;
> >> +	si2168_config.ts_mode = SI2168_TS_PARALLEL; /*2, 1-serial, 2-parallel.*/
> >> +	si2168_config.ts_clock_gapped = 1; /*0-disabled, 1-enabled.*/
> >> +	si2168_config.ts_clock_inv = 0; /*0-not-invert, 1-invert*/
> >> +	si2168_config.spectral_inversion = 1; /*0-not-invert, 1-invert*/
> >> +
> >> +	adap->i2c_client_demod[1] = dvb_module_probe("si2168", NULL,
> >> +						&adap->channel.hdw->i2c_adap,
> >> +						0x64, &si2168_config);
> > Indentation.
> >
> >>  
> >> +	if (!adap->i2c_client_demod[1])
> >> +		return -ENODEV;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int pvr2_lgdt3306a_attach(struct pvr2_dvb_adapter *adap)
> >> +{
> >> +	struct lgdt3306a_config lgdt3306a_config;
> >> +	struct i2c_adapter *adapter;
> >> +
> >> +	pr_debug("%s()\n", __func__);
> >> +
> >> +	lgdt3306a_config.fe = &adap->fe[0];
> >> +	lgdt3306a_config.i2c_adapter = &adapter;
> >> +	lgdt3306a_config.deny_i2c_rptr = 1;
> >> +	lgdt3306a_config.spectral_inversion = 1;
> >> +	lgdt3306a_config.qam_if_khz = 4000;
> >> +	lgdt3306a_config.vsb_if_khz = 3250;
> >> +	lgdt3306a_config.mpeg_mode = LGDT3306A_MPEG_PARALLEL;
> >> +	lgdt3306a_config.tpclk_edge = LGDT3306A_TPCLK_FALLING_EDGE;
> >> +	lgdt3306a_config.tpvalid_polarity = LGDT3306A_TP_VALID_LOW;
> >> +	lgdt3306a_config.xtalMHz = 25, /* demod clock MHz; 24/25 supported */
> >> +
> >> +	adap->i2c_client_demod[0] = dvb_module_probe("lgdt3306a", NULL,
> >> +						&adap->channel.hdw->i2c_adap,
> >> +						0x59, &lgdt3306a_config);
> >> +
> >> +	if (!adap->i2c_client_demod[0])
> >> +		return -ENODEV;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int pvr2_dual_fe_attach(struct pvr2_dvb_adapter *adap)
> >> +{
> >> +	pr_debug("%s()\n", __func__);
> >> +
> >> +	if (pvr2_lgdt3306a_attach(adap) != 0)
> >> +		return -ENODEV;
> >> +
> >> +	if (pvr2_si2168_attach(adap) != 0) {
> >> +		dvb_module_release(adap->i2c_client_demod[0]);
> >> +		return -ENODEV;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +#endif
> >> +
> >> +#define PVR2_FIRMWARE_160xxx "v4l-pvrusb2-160xxx-01.fw"
> >> +static const char *pvr2_fw1_names_160xxx[] = {
> >> +		PVR2_FIRMWARE_160xxx,
> >> +};
> >> +
> >> +static const struct pvr2_device_client_desc pvr2_cli_160xxx[] = {
> >> +	{ .module_id = PVR2_CLIENT_ID_CX25840 },
> >> +};
> >> +
> >> +static const struct pvr2_device_desc pvr2_device_160000 = {
> >> +		.description = "WinTV HVR-1975 Model 160000",
> >> +		.shortname = "160000",
> >> +		.client_table.lst = pvr2_cli_160xxx,
> >> +		.client_table.cnt = ARRAY_SIZE(pvr2_cli_160xxx),
> >> +		.fx2_firmware.lst = pvr2_fw1_names_160xxx,
> >> +		.fx2_firmware.cnt = ARRAY_SIZE(pvr2_fw1_names_160xxx),
> >> +		.default_tuner_type = TUNER_ABSENT,
> >> +		.flag_has_cx25840 = !0,
> >> +		.flag_has_hauppauge_rom = !0,
> >> +		.flag_has_analogtuner = !0,
> >> +		.flag_has_composite = !0,
> >> +		.flag_has_svideo = !0,
> >> +		.flag_fx2_16kb = !0,
> > Why are we writing 1 in such a way?
> 
> 
> 
> I did not originate the board profile part. I do see the similar
> notation used throughout this particular driver, but I cannot state the
> rational in setting it like that. In v5 I have this just set these
> properties to 1.

Sure, actually that was not so much a review as a general question. I
should have said so. 

> >> +		.signal_routing_scheme = PVR2_ROUTING_SCHEME_HAUPPAUGE,
> >> +		.digital_control_scheme = PVR2_DIGITAL_SCHEME_HAUPPAUGE,
> >> +		.default_std_mask = V4L2_STD_NTSC_M,
> >> +		.led_scheme = PVR2_LED_SCHEME_HAUPPAUGE,
> >> +		.ir_scheme = PVR2_IR_SCHEME_ZILOG,
> >> +#ifdef CONFIG_VIDEO_PVRUSB2_DVB
> >> +		.dvb_props = &pvr2_160000_dvb_props,
> >> +#endif
> >> +};
> > Newline needed.
> >
> >> +static const struct pvr2_device_desc pvr2_device_160111 = {
> >> +		.description = "WinTV HVR-1955 Model 160111",
> >> +		.shortname = "160111",
> >> +		.client_table.lst = pvr2_cli_160xxx,
> >> +		.client_table.cnt = ARRAY_SIZE(pvr2_cli_160xxx),
> >> +		.fx2_firmware.lst = pvr2_fw1_names_160xxx,
> >> +		.fx2_firmware.cnt = ARRAY_SIZE(pvr2_fw1_names_160xxx),
> >> +		.default_tuner_type = TUNER_ABSENT,
> >> +		.flag_has_cx25840 = !0,
> >> +		.flag_has_hauppauge_rom = !0,
> >> +		.flag_has_analogtuner = !0,
> >> +		.flag_has_composite = !0,
> >> +		.flag_has_svideo = !0,
> >> +		.flag_fx2_16kb = !0,
> >> +		.signal_routing_scheme = PVR2_ROUTING_SCHEME_HAUPPAUGE,
> >> +		.digital_control_scheme = PVR2_DIGITAL_SCHEME_HAUPPAUGE,
> >> +		.default_std_mask = V4L2_STD_NTSC_M,
> >> +		.led_scheme = PVR2_LED_SCHEME_HAUPPAUGE,
> >> +		.ir_scheme = PVR2_IR_SCHEME_ZILOG,
> >> +#ifdef CONFIG_VIDEO_PVRUSB2_DVB
> >> +		.dvb_props = &pvr2_160111_dvb_props,
> >> +#endif
> >> +};
> >>  
> >>  /*------------------------------------------------------------------------*/
> >>  
> >> @@ -552,6 +712,10 @@ struct usb_device_id pvr2_device_table[] = {
> >>  	  .driver_info = (kernel_ulong_t)&pvr2_device_751xx},
> >>  	{ USB_DEVICE(0x0ccd, 0x0039),
> >>  	  .driver_info = (kernel_ulong_t)&pvr2_device_av400},
> >> +	{ USB_DEVICE(0x2040, 0x7502),
> >> +	  .driver_info = (kernel_ulong_t)&pvr2_device_160111},
> >> +	{ USB_DEVICE(0x2040, 0x7510),
> >> +	  .driver_info = (kernel_ulong_t)&pvr2_device_160000},
> >>  	{ }
> >>  };
> >>  
> >> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-devattr.h b/drivers/media/usb/pvrusb2/pvrusb2-devattr.h
> >> index c1e7d48..ea0b2bf 100644
> >> --- a/drivers/media/usb/pvrusb2/pvrusb2-devattr.h
> >> +++ b/drivers/media/usb/pvrusb2/pvrusb2-devattr.h
> >> @@ -66,6 +66,7 @@ struct pvr2_string_table {
> >>  #define PVR2_ROUTING_SCHEME_GOTVIEW 1
> >>  #define PVR2_ROUTING_SCHEME_ONAIR 2
> >>  #define PVR2_ROUTING_SCHEME_AV400 3
> >> +#define PVR2_ROUTING_SCHEME_HAUP160XXX 4
> >>  
> >>  #define PVR2_DIGITAL_SCHEME_NONE 0
> >>  #define PVR2_DIGITAL_SCHEME_HAUPPAUGE 1
> >> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-fx2-cmd.h b/drivers/media/usb/pvrusb2/pvrusb2-fx2-cmd.h
> >> index 0a01de4..640b033 100644
> >> --- a/drivers/media/usb/pvrusb2/pvrusb2-fx2-cmd.h
> >> +++ b/drivers/media/usb/pvrusb2/pvrusb2-fx2-cmd.h
> >> @@ -38,6 +38,10 @@
> >>  
> >>  #define FX2CMD_FWPOST1          0x52u
> >>  
> >> +/* These 2 only exist on Model 160xxx */
> >> +#define FX2CMD_HCW_DEMOD_RESET_PIN 0xd4u
> >> +#define FX2CMD_HCW_MAKO_SLEEP_PIN  0xd5u
> >> +
> >>  #define FX2CMD_POWER_OFF        0xdcu
> >>  #define FX2CMD_POWER_ON         0xdeu
> >>  
> >> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> >> index 446a999..ab9e822 100644
> >> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> >> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> >> @@ -316,6 +316,8 @@ static const struct pvr2_fx2cmd_descdef pvr2_fx2cmd_desc[] = {
> >>  	{FX2CMD_ONAIR_DTV_STREAMING_OFF, "onair dtv stream off"},
> >>  	{FX2CMD_ONAIR_DTV_POWER_ON, "onair dtv power on"},
> >>  	{FX2CMD_ONAIR_DTV_POWER_OFF, "onair dtv power off"},
> >> +	{FX2CMD_HCW_DEMOD_RESET_PIN, "hcw demod reset pin"},
> >> +	{FX2CMD_HCW_MAKO_SLEEP_PIN, "hcw mako sleep pin"},
> >>  };
> >>  
> >>  
> >> @@ -2137,10 +2139,28 @@ static void pvr2_hdw_setup_low(struct pvr2_hdw *hdw)
> >>  				      ((0) << 16));
> >>  	}
> >>  
> >> -	// This step MUST happen after the earlier powerup step.
> >> +	/* This step MUST happen after the earlier powerup step */
> >>  	pvr2_i2c_core_init(hdw);
> >>  	if (!pvr2_hdw_dev_ok(hdw)) return;
> >>  
> >> +	/* Reset demod only on Hauppauge 160xxx platform */
> >> +	if (hdw->usb_dev->descriptor.idVendor == 0x2040 &&
> >> +	    (hdw->usb_dev->descriptor.idProduct == 0x7502 ||
> >> +	     hdw->usb_dev->descriptor.idProduct == 0x7510)) {
> > These need le16_to_cpu() else it will not work on big-endian machines.
> 
> 
> 
> Are you sure about this? This isn't doing byte order comparison, this is
> a simple number equivalence. The compiler should be taking the two byte
> hex values, and inserting them into memory however the architecture
> dictates, correct? All constant values are interpreted by the compiler
> as little endian, but they're stored based on endianess.

Yes. Values don't have endianness, only memory loads/stores. So the
constant doesn't have endianness but the fields idProduct and idVendor do.
Those fields are __le16. 

__le16 is a typedef to __u16. The compiler won't do endian conversion
for you. The __le16 typedef is just there for static analysis.

If you run sparse you should see an warning (make C=1).

> >> +		pr_info("%s(): resetting 160xxx demod\n", __func__);
> >> +		/* TODO: not sure this is proper place to reset once only */
> >> +		pvr2_issue_simple_cmd(hdw,
> >> +				     FX2CMD_HCW_DEMOD_RESET_PIN |
> >> +				     (1 << 8) |
> >> +				     ((0) << 16));
> >> +		msleep(10);
> > usleep_range() is preferred (for delays <= 10), I think. Maybe 10ms is too
> > long anyway and msleep(1) is enough.
> >
> >> +		pvr2_issue_simple_cmd(hdw,
> >> +				     FX2CMD_HCW_DEMOD_RESET_PIN |
> >> +				     (1 << 8) |
> >> +				     ((1) << 16));
> >> +		msleep(10);
> >> +	}
> >> +
> >>  	pvr2_hdw_load_modules(hdw);
> >>  	if (!pvr2_hdw_dev_ok(hdw)) return;
> >>  
> >> @@ -4011,6 +4031,20 @@ int pvr2_hdw_cmd_decoder_reset(struct pvr2_hdw *hdw)
> >>  static int pvr2_hdw_cmd_hcw_demod_reset(struct pvr2_hdw *hdw, int onoff)
> >>  {
> >>  	hdw->flag_ok = !0;
> >> +
> >> +	/* Use this for Hauppauge 160xxx only */
> >> +	if (hdw->usb_dev->descriptor.idVendor == 0x2040 &&
> >> +	    (hdw->usb_dev->descriptor.idProduct == 0x7502 ||
> >> +	     hdw->usb_dev->descriptor.idProduct == 0x7510)) {
> > Same as above. le16_to_cpu() needed.
> 
> 
> Same comment here. The rest of your concerns have been handled.
> 
> I'm pushing up a v5 of this series now, without the le16_to_cpu bit
> done, until that detail is reviewed again.


Sean
