Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9665032393
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2019 16:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbfFBOew (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Jun 2019 10:34:52 -0400
Received: from mga12.intel.com ([192.55.52.136]:59473 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726084AbfFBOew (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 2 Jun 2019 10:34:52 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP; 02 Jun 2019 07:34:51 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Jun 2019 07:34:50 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hXRZR-000GBZ-J7; Sun, 02 Jun 2019 22:34:49 +0800
Date:   Sun, 2 Jun 2019 22:34:07 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Brad Love <brad@nextdimension.cc>
Cc:     kbuild-all@01.org, linux-media@vger.kernel.org, mchehab@kernel.org,
        sean@mess.org, Brad Love <brad@nextdimension.cc>
Subject: Re: [PATCH v5 4/4] pvrusb2: Add Hauppauge HVR1955/1975 devices
Message-ID: <201906022251.XMyUsVZ7%lkp@intel.com>
References: <1559323944-15639-5-git-send-email-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559323944-15639-5-git-send-email-brad@nextdimension.cc>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Brad,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on v5.2-rc2 next-20190531]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Brad-Love/Add-Hauppauge-HVR1955-1975-devices/20190602-191815
base:   git://linuxtv.org/media_tree.git master
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-7-g2b96cd8-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2149:37: sparse: sparse: restricted __le16 degrades to integer
   drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2150:38: sparse: sparse: restricted __le16 degrades to integer
   drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2151:38: sparse: sparse: restricted __le16 degrades to integer
   drivers/media/usb/pvrusb2/pvrusb2-hdw.c:4037:37: sparse: sparse: restricted __le16 degrades to integer
   drivers/media/usb/pvrusb2/pvrusb2-hdw.c:4038:38: sparse: sparse: restricted __le16 degrades to integer
   drivers/media/usb/pvrusb2/pvrusb2-hdw.c:4039:38: sparse: sparse: restricted __le16 degrades to integer
--
>> drivers/media/usb/pvrusb2/pvrusb2-devattr.c:649:37: sparse: sparse: incorrect type in initializer (different modifiers) @@    expected char const **lst @@    got char cchar const **lst @@
>> drivers/media/usb/pvrusb2/pvrusb2-devattr.c:649:37: sparse:    expected char const **lst
>> drivers/media/usb/pvrusb2/pvrusb2-devattr.c:649:37: sparse:    got char const *const *
   drivers/media/usb/pvrusb2/pvrusb2-devattr.c:673:37: sparse: sparse: incorrect type in initializer (different modifiers) @@    expected char const **lst @@    got char cchar const **lst @@
   drivers/media/usb/pvrusb2/pvrusb2-devattr.c:673:37: sparse:    expected char const **lst
   drivers/media/usb/pvrusb2/pvrusb2-devattr.c:673:37: sparse:    got char const *const *

vim +2149 drivers/media/usb/pvrusb2/pvrusb2-hdw.c

  2092	
  2093	
  2094	static void pvr2_hdw_setup_low(struct pvr2_hdw *hdw)
  2095	{
  2096		int ret;
  2097		unsigned int idx;
  2098		struct pvr2_ctrl *cptr;
  2099		int reloadFl = 0;
  2100		if (hdw->hdw_desc->fx2_firmware.cnt) {
  2101			if (!reloadFl) {
  2102				reloadFl =
  2103					(hdw->usb_intf->cur_altsetting->desc.bNumEndpoints
  2104					 == 0);
  2105				if (reloadFl) {
  2106					pvr2_trace(PVR2_TRACE_INIT,
  2107						   "USB endpoint config looks strange; possibly firmware needs to be loaded");
  2108				}
  2109			}
  2110			if (!reloadFl) {
  2111				reloadFl = !pvr2_hdw_check_firmware(hdw);
  2112				if (reloadFl) {
  2113					pvr2_trace(PVR2_TRACE_INIT,
  2114						   "Check for FX2 firmware failed; possibly firmware needs to be loaded");
  2115				}
  2116			}
  2117			if (reloadFl) {
  2118				if (pvr2_upload_firmware1(hdw) != 0) {
  2119					pvr2_trace(PVR2_TRACE_ERROR_LEGS,
  2120						   "Failure uploading firmware1");
  2121				}
  2122				return;
  2123			}
  2124		}
  2125		hdw->fw1_state = FW1_STATE_OK;
  2126	
  2127		if (!pvr2_hdw_dev_ok(hdw)) return;
  2128	
  2129		hdw->force_dirty = !0;
  2130	
  2131		if (!hdw->hdw_desc->flag_no_powerup) {
  2132			pvr2_hdw_cmd_powerup(hdw);
  2133			if (!pvr2_hdw_dev_ok(hdw)) return;
  2134		}
  2135	
  2136		/* Take the IR chip out of reset, if appropriate */
  2137		if (hdw->ir_scheme_active == PVR2_IR_SCHEME_ZILOG) {
  2138			pvr2_issue_simple_cmd(hdw,
  2139					      FX2CMD_HCW_ZILOG_RESET |
  2140					      (1 << 8) |
  2141					      ((0) << 16));
  2142		}
  2143	
  2144		/* This step MUST happen after the earlier powerup step */
  2145		pvr2_i2c_core_init(hdw);
  2146		if (!pvr2_hdw_dev_ok(hdw)) return;
  2147	
  2148		/* Reset demod only on Hauppauge 160xxx platform */
> 2149		if (hdw->usb_dev->descriptor.idVendor == 0x2040 &&
  2150		    (hdw->usb_dev->descriptor.idProduct == 0x7502 ||
  2151		     hdw->usb_dev->descriptor.idProduct == 0x7510)) {
  2152			pr_info("%s(): resetting 160xxx demod\n", __func__);
  2153			/* TODO: not sure this is proper place to reset once only */
  2154			pvr2_issue_simple_cmd(hdw,
  2155					      FX2CMD_HCW_DEMOD_RESET_PIN |
  2156					      (1 << 8) |
  2157					      ((0) << 16));
  2158			usleep_range(10000, 10500);
  2159			pvr2_issue_simple_cmd(hdw,
  2160					      FX2CMD_HCW_DEMOD_RESET_PIN |
  2161					      (1 << 8) |
  2162					      ((1) << 16));
  2163			usleep_range(10000, 10500);
  2164		}
  2165	
  2166		pvr2_hdw_load_modules(hdw);
  2167		if (!pvr2_hdw_dev_ok(hdw)) return;
  2168	
  2169		v4l2_device_call_all(&hdw->v4l2_dev, 0, core, load_fw);
  2170	
  2171		for (idx = 0; idx < CTRLDEF_COUNT; idx++) {
  2172			cptr = hdw->controls + idx;
  2173			if (cptr->info->skip_init) continue;
  2174			if (!cptr->info->set_value) continue;
  2175			cptr->info->set_value(cptr,~0,cptr->info->default_value);
  2176		}
  2177	
  2178		pvr2_hdw_cx25840_vbi_hack(hdw);
  2179	
  2180		/* Set up special default values for the television and radio
  2181		   frequencies here.  It's not really important what these defaults
  2182		   are, but I set them to something usable in the Chicago area just
  2183		   to make driver testing a little easier. */
  2184	
  2185		hdw->freqValTelevision = default_tv_freq;
  2186		hdw->freqValRadio = default_radio_freq;
  2187	
  2188		// Do not use pvr2_reset_ctl_endpoints() here.  It is not
  2189		// thread-safe against the normal pvr2_send_request() mechanism.
  2190		// (We should make it thread safe).
  2191	
  2192		if (hdw->hdw_desc->flag_has_hauppauge_rom) {
  2193			ret = pvr2_hdw_get_eeprom_addr(hdw);
  2194			if (!pvr2_hdw_dev_ok(hdw)) return;
  2195			if (ret < 0) {
  2196				pvr2_trace(PVR2_TRACE_ERROR_LEGS,
  2197					   "Unable to determine location of eeprom, skipping");
  2198			} else {
  2199				hdw->eeprom_addr = ret;
  2200				pvr2_eeprom_analyze(hdw);
  2201				if (!pvr2_hdw_dev_ok(hdw)) return;
  2202			}
  2203		} else {
  2204			hdw->tuner_type = hdw->hdw_desc->default_tuner_type;
  2205			hdw->tuner_updated = !0;
  2206			hdw->std_mask_eeprom = V4L2_STD_ALL;
  2207		}
  2208	
  2209		if (hdw->serial_number) {
  2210			idx = scnprintf(hdw->identifier, sizeof(hdw->identifier) - 1,
  2211					"sn-%lu", hdw->serial_number);
  2212		} else if (hdw->unit_number >= 0) {
  2213			idx = scnprintf(hdw->identifier, sizeof(hdw->identifier) - 1,
  2214					"unit-%c",
  2215					hdw->unit_number + 'a');
  2216		} else {
  2217			idx = scnprintf(hdw->identifier, sizeof(hdw->identifier) - 1,
  2218					"unit-??");
  2219		}
  2220		hdw->identifier[idx] = 0;
  2221	
  2222		pvr2_hdw_setup_std(hdw);
  2223	
  2224		if (!get_default_tuner_type(hdw)) {
  2225			pvr2_trace(PVR2_TRACE_INIT,
  2226				   "pvr2_hdw_setup: Tuner type overridden to %d",
  2227				   hdw->tuner_type);
  2228		}
  2229	
  2230	
  2231		if (!pvr2_hdw_dev_ok(hdw)) return;
  2232	
  2233		if (hdw->hdw_desc->signal_routing_scheme ==
  2234		    PVR2_ROUTING_SCHEME_GOTVIEW) {
  2235			/* Ensure that GPIO 11 is set to output for GOTVIEW
  2236			   hardware. */
  2237			pvr2_hdw_gpio_chg_dir(hdw,(1 << 11),~0);
  2238		}
  2239	
  2240		pvr2_hdw_commit_setup(hdw);
  2241	
  2242		hdw->vid_stream = pvr2_stream_create();
  2243		if (!pvr2_hdw_dev_ok(hdw)) return;
  2244		pvr2_trace(PVR2_TRACE_INIT,
  2245			   "pvr2_hdw_setup: video stream is %p",hdw->vid_stream);
  2246		if (hdw->vid_stream) {
  2247			idx = get_default_error_tolerance(hdw);
  2248			if (idx) {
  2249				pvr2_trace(PVR2_TRACE_INIT,
  2250					   "pvr2_hdw_setup: video stream %p setting tolerance %u",
  2251					   hdw->vid_stream,idx);
  2252			}
  2253			pvr2_stream_setup(hdw->vid_stream,hdw->usb_dev,
  2254					  PVR2_VID_ENDPOINT,idx);
  2255		}
  2256	
  2257		if (!pvr2_hdw_dev_ok(hdw)) return;
  2258	
  2259		hdw->flag_init_ok = !0;
  2260	
  2261		pvr2_hdw_state_sched(hdw);
  2262	}
  2263	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
