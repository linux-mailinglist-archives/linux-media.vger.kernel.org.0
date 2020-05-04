Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95F31C42CE
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 19:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729942AbgEDRbK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 13:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728158AbgEDRbJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 13:31:09 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 640E0C061A0E
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 10:31:09 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id l18so62574wrn.6
        for <linux-media@vger.kernel.org>; Mon, 04 May 2020 10:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ZWMDTYY0aOYWQ4zEazteS2y2NdCBdYcT4nnG0J6eO3Q=;
        b=V/KnI793lRUzaIsitV8d+9elMsWuKzQZ8nqBR8j9EG/yuc8/CVu99ZpsYRf/DZUnh/
         47YYcw/0iqd32IklP7eucZj4qdkgoGbLvhACLL92//QCSrW9e0wlEXAP+IiKBDsHPVqx
         cxGvrvi0xeJ3+TIMAdAYCO6pZXpmp5ldqiaw15AktdlDVChNxd/0F4nIRdVmzhVng2S4
         8huwOb6kShEC0W+p+fe3yseXSxdJfBaFQtZixG6EudPES+ok0x1adrByg/6DAHyq2rj0
         XsOKWIicx9TlJxGRM9q2g9i4kTaG4NjAwyelEdaRe5mDSMGR0Y+ECSu0cRAVCmZYIG8m
         LRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ZWMDTYY0aOYWQ4zEazteS2y2NdCBdYcT4nnG0J6eO3Q=;
        b=Y1mEffpUH9Cri5mRHPMktnlGLSzrlQEG/YBigkoe8nWF5iXtdSATtN5c/Y3Yudj5Nk
         uEenErFGGH3NC++xgl4wos5Aq/fMX+HHveIV+6X0fUvFVLAtLy81YYGrz5KODCDhSTaF
         sOHNibAPMKn4gl9B3oJjlkI2GHfqmDK6HPflzVNcE0uXStQUpv57731nsL2a1s2xkK7W
         +Zdz5n7FOo0BrmTUDhu02phKbeJ9famqa4QzZO2nRwjUOGDRokmg6eCrwybontbTr1XQ
         mV8Scm5atxo7gjMcr0Nyo2QP5YzV9H8r3pipJ34lAVITq1+TRDOi/fKwufP8O2WiKkmd
         QidA==
X-Gm-Message-State: AGi0Puau9HbQoVF/1zQM7SyvfqCfH7zV6lMDOyhviF2xPCMTkv6bsx8c
        jI0HyyfjmDulaKc3OD/HzxwvD6OvdJ41nDg1sSShnDUr
X-Google-Smtp-Source: APiQypLskwvpwJdfFZfptC7bQ4e+aam5v3BIvBK77buDL5RCoCVocRpsbtzMyFl97+MkFwB4+7UT7IFNoN9HuIcyvoY=
X-Received: by 2002:adf:ffcd:: with SMTP id x13mr367283wrs.11.1588613467600;
 Mon, 04 May 2020 10:31:07 -0700 (PDT)
MIME-Version: 1.0
From:   Olcay Korkmaz <olcay.krkmz@gmail.com>
Date:   Mon, 4 May 2020 20:30:55 +0300
Message-ID: <CADBDwkce4vHu9mbfen7Z=xPW9j+weGu+5zttE=gXtc+Qz847hw@mail.gmail.com>
Subject: m88ds3103 frontend different ds3103b device is not working
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
I have a geniatech hdstar dvb-s2 device with m88ds3103b/ts2022
it doesn't work with m88ds3103 but vendor driver working link to
vendor driver(https://www.geniatech.com/product/x9320-quad-dvb-s2s-tv-tuner/#download)

i know my device isn't officially supported but recently ds3103b demod
patch landed to media_tree but it didn't work

i did compare someone else's geniatech hdstar device log and my device
have different
m88ds3103b chip and also ts2022 logs was a little bit dfferent
unluckily I bought a device different from the others(ds3103b users)

it doesn't work with m88ds3103 and firmware won't load to device and dmesg
logs show bunch of errors
vendor driver is not working fine can anyone tell me what's wrong with my device
trace logs of both drivers
m88ds3103.log: https://pastebin.com/tAfsZ7Jv
vendor.ds3000.log: https://pastebin.com/g90Ntd27

dmesg log
[   30.907082] usb 3-3.1: new high-speed USB device number 10 using xhci_hcd
[   30.927861] usb 3-3.1: New USB device found, idVendor=1f4d,
idProduct=3000, bcdDevice= 0.00
[   30.927864] usb 3-3.1: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[   30.927866] usb 3-3.1: Product: USB Stick
[   30.927867] usb 3-3.1: Manufacturer: Max
[   30.927869] usb 3-3.1: SerialNumber: 080116
[   30.951654] videodev: Linux video capture interface: v2.00
[   30.951656] WARNING: You are using an experimental version of the
media stack.
                   As the driver is backported to an older kernel, it
doesn't offer
                   enough quality for its usage in production.
                   Use it with care.
               Latest git patches (needed if you report a bug to
linux-media@vger.kernel.org):
                   e51759f56d314d28c25be7606b03791f048e44c7 media:
v4l2-ctrls.h: clarify the p_def argument of v4l2_ctrl_new_std_compound
                   e5ad7db4b2f35aaed796669b47e24c6d79cab3d0 media:
cec-gpio: handle gpiod_get_value errors correctly
                   fcab45adb853a668e9b2f653e792770399bb441a media:
vidioc-reqbufs/create-bufs.rst: fix typo
[   30.955742] WARNING: You are using an experimental version of the
media stack.
                   As the driver is backported to an older kernel, it
doesn't offer
                   enough quality for its usage in production.
                   Use it with care.
               Latest git patches (needed if you report a bug to
linux-media@vger.kernel.org):
                   e51759f56d314d28c25be7606b03791f048e44c7 media:
v4l2-ctrls.h: clarify the p_def argument of v4l2_ctrl_new_std_compound
                   e5ad7db4b2f35aaed796669b47e24c6d79cab3d0 media:
cec-gpio: handle gpiod_get_value errors correctly
                   fcab45adb853a668e9b2f653e792770399bb441a media:
vidioc-reqbufs/create-bufs.rst: fix typo
[   30.957155] dw2102: su3000_identify_state
[   30.957156] dvb-usb: found a 'TechnoTrend TT-connect S2-4600' in warm state.
[   30.957159] dw2102: su3000_power_ctrl: 1, initialized 0
[   30.957264] dvb-usb: will pass the complete MPEG2 transport stream
to the software demuxer.
[   30.957653] dvbdev: DVB: registering new adapter (TechnoTrend
TT-connect S2-4600)
[   30.957655] usb 3-3.1: media controller created
[   30.961680] dvb-usb: MAC address: 00:af:78:66:2e:73
[   30.961877] dvbdev: dvb_create_media_entity: media entity
'dvb-demux' registered.
[   31.293920] m88ds3103_probe:1813: m88ds3103 8-006a: chip_id=74
[   31.297373] i2c i2c-8: Added multiplexed i2c bus 9
[   31.299054] m88ds3103_probe:1903: m88ds3103 8-006a: dt addr is 0x21
[   31.299166] m88ds3103_get_dvb_frontend:1753: m88ds3103 8-006a:
[   31.299167] m88ds3103_get_i2c_adapter:1762: m88ds3103 8-006a:
[   31.352265] ts2020_probe:619: ts2020 9-0060: chip_id=c3
[   31.355150] ts2020 9-0060: Montage Technology TS2022 successfully identified
[   31.355221] usb 3-3.1: DVB: registering adapter 0 frontend 0
(Montage Technology M88DS3103B)...
[   31.355232] dvbdev: dvb_create_media_entity: media entity 'Montage
Technology M88DS3103B' registered.
[   31.387111] Registered IR keymap rc-tt-1500
[   31.387210] rc rc0: TechnoTrend TT-connect S2-4600 as
/devices/pci0000:00/0000:00:14.0/usb3/3-3/3-3.1/rc/rc0
[   31.387315] rc rc0: lirc_dev: driver dw2102 registered at minor =
0, scancode receiver, no transmitter
[   31.387415] input: TechnoTrend TT-connect S2-4600 as
/devices/pci0000:00/0000:00:14.0/usb3/3-3/3-3.1/rc/rc0/input20
[   31.387532] dvb-usb: schedule remote query interval to 250 msecs.
[   31.387537] dw2102: su3000_power_ctrl: 0, initialized 1
[   31.387538] dvb-usb: TechnoTrend TT-connect S2-4600 successfully
initialized and connected.
[   31.387629] usbcore: registered new interface driver dw2102
[   58.097795] dw2102: su3000_power_ctrl: 1, initialized 1
[   58.097798] m88ds3103_init:1025: m88ds3103 8-006a:
[   58.099118] m88ds3103_init:1046: m88ds3103 8-006a: firmware=ff
[   58.104573] ts2020_stat_work:435: ts2020 9-0060:
[   58.110188] m88ds3103_set_voltage:1425: m88ds3103 8-006a: fe_sec_voltage=2
[   58.110579] m88ds3103_set_voltage:1425: m88ds3103 8-006a: fe_sec_voltage=2
[   58.111311] m88ds3103_sleep:1149: m88ds3103 8-006a:
[   58.112824] dw2102: su3000_power_ctrl: 0, initialized 1
[   69.989593] dw2102: su3000_power_ctrl: 1, initialized 1
[   69.989601] m88ds3103_init:1025: m88ds3103 8-006a:
[   69.991302] m88ds3103_init:1046: m88ds3103 8-006a: firmware=ff
[   69.997066] ts2020_stat_work:435: ts2020 9-0060:
[   70.002851] m88ds3103_set_voltage:1425: m88ds3103 8-006a: fe_sec_voltage=0
[   70.003217] m88ds3103_set_tone:1378: m88ds3103 8-006a: fe_sec_tone_mode=1
[   70.004029] m88ds3103_set_tone:1378: m88ds3103 8-006a: fe_sec_tone_mode=0
[   70.004840] m88ds3103_set_frontend:638: m88ds3103 8-006a:
delivery_system=5 modulation=0 frequency=1780000 symbol_rate=27500000
inversion=2 pilot=2 rolloff=0
[   70.005589] ts2020_set_params:221: frequency=1780071 offset=71
f_vco_khz=3560000 pll_n=1846 div_ref=14 div_out=2
[   70.239415] m88ds3103b_select_mclk:412: m88ds3103 8-006a: modifying
mclk 96000000 -> 96000000
[   70.241110] m88ds3103b_dt_read:147: m88ds3103 8-006a: 0x21 reg
0x15, value 0xff
[   70.242277] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x05, value 0x40
[   70.243387] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x11, value 0x08
[   70.244505] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x15, value 0xfd
[   70.245611] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x16, value 0x60
[   70.252427] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x05, value 0x00
[   70.253704] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x11, value 0x0a
[   70.260571] m88ds3103b_dt_read:147: m88ds3103 8-006a: 0x21 reg
0x15, value 0xff
[   70.261835] m88ds3103b_dt_read:147: m88ds3103 8-006a: 0x21 reg
0x16, value 0xff
[   70.262980] m88ds3103b_dt_read:147: m88ds3103 8-006a: 0x21 reg
0x1d, value 0xff
[   70.264091] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x05, value 0x40
[   70.265193] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x11, value 0x08
[   70.266317] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x1d, value 0xff
[   70.267407] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x1e, value 0x00
[   70.268500] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x1f, value 0x00
[   70.269612] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x17, value 0xc1
[   70.270675] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x17, value 0x81
[   70.277553] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x05, value 0x00
[   70.278793] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x11, value 0x0a
[   70.305058] m88ds3103_wr_reg_val_tab:41: m88ds3103 8-006a: tab_len=83
[   70.314862] m88ds3103b_dt_read:147: m88ds3103 8-006a: 0x21 reg
0x15, value 0xff
[   70.315966] m88ds3103b_dt_read:147: m88ds3103 8-006a: 0x21 reg
0x16, value 0xff
[   70.317067] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x15, value 0xfc
[   70.318172] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x16, value 0x60
[   70.318901] m88ds3103_set_frontend:916: m88ds3103 8-006a:
target_mclk=96000000 ts_clk=16000000 ts_clk_divide_ratio=6
[   70.320568] m88ds3103b_dt_read:147: m88ds3103 8-006a: 0x21 reg
0x15, value 0xff
[   70.321675] m88ds3103b_dt_read:147: m88ds3103 8-006a: 0x21 reg
0x16, value 0xff
[   70.322776] m88ds3103b_dt_read:147: m88ds3103 8-006a: 0x21 reg
0x1d, value 0xff
[   70.323860] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x05, value 0x40
[   70.324964] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x11, value 0x08
[   70.326068] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x1d, value 0xff
[   70.327193] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x1e, value 0x00
[   70.328361] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x1f, value 0x00
[   70.329484] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x17, value 0xc1
[   70.330567] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x17, value 0x81
[   70.337346] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x05, value 0x00
[   70.338487] m88ds3103b_dt_write:98: m88ds3103 8-006a: 0x21 reg
0x11, value 0x0a
[   70.346842] m88ds3103_set_frontend:987: m88ds3103 8-006a: carrier offset=71
[   70.347641] m88ds3103_read_status:214: m88ds3103 8-006a: lock=ff status=1f
[   70.348687] m88ds3103_get_frontend:1188: m88ds3103 8-006a:
[   70.349062] m88ds3103_get_frontend:1231: m88ds3103 8-006a: invalid fec_inner
[   70.349242] m88ds3103_get_frontend:1188: m88ds3103 8-006a:
[   70.349613] m88ds3103_get_frontend:1231: m88ds3103 8-006a: invalid fec_inner
[   70.349986] m88ds3103_read_status:214: m88ds3103 8-006a: lock=ff status=1f
[   70.350899] m88ds3103_get_frontend:1188: m88ds3103 8-006a:
[   70.351257] m88ds3103_get_frontend:1231: m88ds3103 8-006a: invalid fec_inner
[   70.351771] m88ds3103_read_status:214: m88ds3103 8-006a: lock=ff status=1f
[   70.352737] m88ds3103_get_frontend:1188: m88ds3103 8-006a:
[   70.353123] m88ds3103_get_frontend:1231: m88ds3103 8-006a: invalid fec_inner
[   72.023542] ts2020_stat_work:435: ts2020 9-0060:
[   73.527858] m88ds3103_read_status:214: m88ds3103 8-006a: lock=ff status=1f
[   73.528850] m88ds3103_get_frontend:1188: m88ds3103 8-006a:
[   73.529215] m88ds3103_get_frontend:1231: m88ds3103 8-006a: invalid fec_inner
[   74.039712] ts2020_stat_work:435: ts2020 9-0060:
[   76.055837] ts2020_stat_work:435: ts2020 9-0060:
[   76.506193] m88ds3103_set_voltage:1425: m88ds3103 8-006a: fe_sec_voltage=2
[   76.507078] m88ds3103_sleep:1149: m88ds3103 8-006a:
[   76.508601] dw2102: su3000_power_ctrl: 0, initialized 1
