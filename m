Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF30C22364A
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 09:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgGQHyQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 03:54:16 -0400
Received: from mx2.suse.de ([195.135.220.15]:41244 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726101AbgGQHyP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 03:54:15 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 2CC93AB55;
        Fri, 17 Jul 2020 07:54:15 +0000 (UTC)
Subject: Re: [PATCH] media: atomisp: fix NULL pointer dereference
To:     mchehab+huawei@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200716115122.15909-1-jslaby@suse.cz>
From:   Jiri Slaby <jslaby@suse.cz>
Autocrypt: addr=jslaby@suse.cz; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c391a531-b55c-a868-60c7-b59a69de47f7@suse.cz>
Date:   Fri, 17 Jul 2020 09:54:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716115122.15909-1-jslaby@suse.cz>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16. 07. 20, 13:51, Jiri Slaby wrote:
> I am currently seeing:
> BUG: kernel NULL pointer dereference, address: 0000000000000002
> ...
> Hardware name: UMAX VisionBook 10Wi Pro/CQM1018CWP, BIOS CQ1018.007 09/22/2016
> RIP: 0010:gmin_subdev_add.cold+0x303/0x312 [atomisp_gmin_platform]
> ...
> Call Trace:
>  gmin_camera_platform_data+0x2f/0x60 [atomisp_gmin_platform]
>  ov2680_probe+0x7f/0x2b0 [atomisp_ov2680]
>  i2c_device_probe+0x95/0x290
> 
> power can be NULL and that is properly handled earlier in this function.
> Even i2c address is set there. So this is a duplicated assignment which
> can cause the bug above. Remove it.

BTW, the camera still doesn't work, but the kernel no longer crashes:

> atomisp_ov2680: module is from the staging directory, the quality is unknown, you have been warned.
> ov2680 i2c-OVTI2680:00: gmin_subdev_add: ACPI detected it on bus ID=CAMB, HID=OVTI2680
> ov2680 i2c-OVTI2680:00: found 'INT33F4:00' at address 0x34, adapter 6
> ov2680 i2c-OVTI2680:00: gmin: power management provided via XPower AXP288 PMIC (i2c addr 0x34)

For this CAM, the address is likely OK.

> ov2680 i2c-OVTI2680:00: found _DSM entry for 'CamClk': 1
> ov2680 i2c-OVTI2680:00: didn't found _DSM entry for 'ClkSrc'
> ov2680 i2c-OVTI2680:00: Failed to find EFI variable OVTI2680:00_ClkSrc
> ov2680 i2c-OVTI2680:00: ClkSrc: using default (1)
> ov2680 i2c-OVTI2680:00: found _DSM entry for 'CsiPort': 0
> ov2680 i2c-OVTI2680:00: found _DSM entry for 'CsiLanes': 2
> ov2680 i2c-OVTI2680:00: didn't found _DSM entry for 'eldo1_1p8v'
> ov2680 i2c-OVTI2680:00: Failed to find EFI variable OVTI2680:00_eldo1_1p8v
> ov2680 i2c-OVTI2680:00: eldo1_1p8v: using default (22)
> ov2680 i2c-OVTI2680:00: didn't found _DSM entry for 'eldo1_sel_reg'
> ov2680 i2c-OVTI2680:00: Failed to find EFI variable OVTI2680:00_eldo1_sel_reg
> ov2680 i2c-OVTI2680:00: eldo1_sel_reg: using default (25)
> ov2680 i2c-OVTI2680:00: didn't found _DSM entry for 'eldo1_ctrl_shift'
> ov2680 i2c-OVTI2680:00: Failed to find EFI variable OVTI2680:00_eldo1_ctrl_shift
> ov2680 i2c-OVTI2680:00: eldo1_ctrl_shift: using default (0)
> ov2680 i2c-OVTI2680:00: didn't found _DSM entry for 'eldo2_1p8v'
> ov2680 i2c-OVTI2680:00: Failed to find EFI variable OVTI2680:00_eldo2_1p8v
> ov2680 i2c-OVTI2680:00: eldo2_1p8v: using default (22)
> ov2680 i2c-OVTI2680:00: didn't found _DSM entry for 'eldo2_sel_reg'
> ov2680 i2c-OVTI2680:00: Failed to find EFI variable OVTI2680:00_eldo2_sel_reg
> ov2680 i2c-OVTI2680:00: eldo2_sel_reg: using default (26)
> ov2680 i2c-OVTI2680:00: didn't found _DSM entry for 'eldo2_ctrl_shift'
> ov2680 i2c-OVTI2680:00: Failed to find EFI variable OVTI2680:00_eldo2_ctrl_shift
> ov2680 i2c-OVTI2680:00: eldo2_ctrl_shift: using default (1)
> ov2680 i2c-OVTI2680:00: power_ctrl: off
> ov2680 i2c-OVTI2680:00: Failed to find EFI gmin variable gmin_V1P8GPIO
> ov2680 i2c-OVTI2680:00: V1P8GPIO: using default (-1)
> ov2680 i2c-OVTI2680:00: Failed to find EFI gmin variable gmin_V2P8GPIO
> ov2680 i2c-OVTI2680:00: V2P8GPIO: using default (-1)
> ov2680 i2c-OVTI2680:00: power_ctrl: on
> ov2680 i2c-OVTI2680:00: I2C write, addr: 0x34, reg: 0x1a, value: 0x16, mask: 0xff
> ov2680 i2c-OVTI2680:00: I2C write, addr: 0x34, reg: 0x1a, value: 0x02, mask: 0x02
> ov2680 i2c-OVTI2680:00: I2C write, addr: 0x34, reg: 0x19, value: 0x16, mask: 0xff
> ov2680 i2c-OVTI2680:00: I2C write, addr: 0x34, reg: 0x19, value: 0x01, mask: 0x01
> ov2680 i2c-OVTI2680:00: I2C write, addr: 0x34, reg: 0x1a, value: 0x16, mask: 0xff
> ov2680 i2c-OVTI2680:00: I2C write, addr: 0x34, reg: 0x1a, value: 0x00, mask: 0x02
> ov2680 i2c-OVTI2680:00: I2C write, addr: 0x34, reg: 0x28, value: 0x16, mask: 0xff
> ov2680 i2c-OVTI2680:00: I2C write, addr: 0x34, reg: 0x28, value: 0x20, mask: 0x20
> ov2680 i2c-OVTI2680:00: camera pdata: port: 0 lanes: 2 order: 00000002
> ov2680 i2c-OVTI2680:00: read error: reg=0x300a: -121

EREMOTEIO. So it shomehow doesn't work.

> ov2680 i2c-OVTI2680:00: sensor_id_high = 0x2
> ov2680 i2c-OVTI2680:00: ov2680_detect err s_config.
> ov2680 i2c-OVTI2680:00: power_ctrl: off
> ov2680 i2c-OVTI2680:00: I2C write, addr: 0x34, reg: 0x19, value: 0x16, mask: 0xff
> ov2680 i2c-OVTI2680:00: I2C write, addr: 0x34, reg: 0x19, value: 0x00, mask: 0x01
> ov2680 i2c-OVTI2680:00: I2C write, addr: 0x34, reg: 0x1a, value: 0x16, mask: 0xff
> ov2680 i2c-OVTI2680:00: I2C write, addr: 0x34, reg: 0x1a, value: 0x00, mask: 0x02
> ov2680 i2c-OVTI2680:00: I2C write, addr: 0x34, reg: 0x28, value: 0x16, mask: 0xff
> ov2680 i2c-OVTI2680:00: I2C write, addr: 0x34, reg: 0x28, value: 0x00, mask: 0x20
> ov2680 i2c-OVTI2680:00: sensor power-gating failed
> ov2680 i2c-OVTI2680:00: +++ out free

Another CAM:

> ov2680 i2c-OVTI2680:01: gmin_subdev_add: ACPI detected it on bus ID=CAMC, HID=OVTI2680
> ov2680 i2c-OVTI2680:01: gmin: power management provided via XPower AXP288 PMIC

now pmic_id is non-zero, so power is not initalized and causes the i2c
address below to be zero.

So either power should be static in that function or pmic_id should be
non-global (per device).

> ov2680 i2c-OVTI2680:01: found _DSM entry for 'CamClk': 1
> ov2680 i2c-OVTI2680:01: didn't found _DSM entry for 'ClkSrc'
> ov2680 i2c-OVTI2680:01: Failed to find EFI variable OVTI2680:01_ClkSrc
> ov2680 i2c-OVTI2680:01: ClkSrc: using default (1)
> ov2680 i2c-OVTI2680:01: found _DSM entry for 'CsiPort': 1
> ov2680 i2c-OVTI2680:01: found _DSM entry for 'CsiLanes': 1
> ov2680 i2c-OVTI2680:01: didn't found _DSM entry for 'eldo1_1p8v'
> ov2680 i2c-OVTI2680:01: Failed to find EFI variable OVTI2680:01_eldo1_1p8v
> ov2680 i2c-OVTI2680:01: eldo1_1p8v: using default (22)
> ov2680 i2c-OVTI2680:01: didn't found _DSM entry for 'eldo1_sel_reg'
> ov2680 i2c-OVTI2680:01: Failed to find EFI variable OVTI2680:01_eldo1_sel_reg
> ov2680 i2c-OVTI2680:01: eldo1_sel_reg: using default (25)
> ov2680 i2c-OVTI2680:01: didn't found _DSM entry for 'eldo1_ctrl_shift'
> ov2680 i2c-OVTI2680:01: Failed to find EFI variable OVTI2680:01_eldo1_ctrl_shift
> ov2680 i2c-OVTI2680:01: eldo1_ctrl_shift: using default (0)
> ov2680 i2c-OVTI2680:01: didn't found _DSM entry for 'eldo2_1p8v'
> ov2680 i2c-OVTI2680:01: Failed to find EFI variable OVTI2680:01_eldo2_1p8v
> ov2680 i2c-OVTI2680:01: eldo2_1p8v: using default (22)
> ov2680 i2c-OVTI2680:01: didn't found _DSM entry for 'eldo2_sel_reg'
> ov2680 i2c-OVTI2680:01: Failed to find EFI variable OVTI2680:01_eldo2_sel_reg
> ov2680 i2c-OVTI2680:01: eldo2_sel_reg: using default (26)
> ov2680 i2c-OVTI2680:01: didn't found _DSM entry for 'eldo2_ctrl_shift'
> ov2680 i2c-OVTI2680:01: Failed to find EFI variable OVTI2680:01_eldo2_ctrl_shift
> ov2680 i2c-OVTI2680:01: eldo2_ctrl_shift: using default (1)
> ov2680 i2c-OVTI2680:01: power_ctrl: off
> ov2680 i2c-OVTI2680:01: power_ctrl: on
> ov2680 i2c-OVTI2680:01: I2C write, addr: 0x00, reg: 0x1a, value: 0x16, mask: 0xff
> intel_soc_pmic_exec_mipi_pmic_seq_element: Unexpected i2c-addr: 0x00 (reg-addr 0x1a value 0x16 mask 0xff)
> ov2680 i2c-OVTI2680:01: I2C write, addr: 0x00, reg: 0x28, value: 0x16, mask: 0xff
> intel_soc_pmic_exec_mipi_pmic_seq_element: Unexpected i2c-addr: 0x00 (reg-addr 0x28 value 0x16 mask 0xff)
> ov2680 i2c-OVTI2680:01: I2C write, addr: 0x00, reg: 0x19, value: 0x16, mask: 0xff
> intel_soc_pmic_exec_mipi_pmic_seq_element: Unexpected i2c-addr: 0x00 (reg-addr 0x19 value 0x16 mask 0xff)
> ov2680 i2c-OVTI2680:01: I2C write, addr: 0x00, reg: 0x28, value: 0x16, mask: 0xff
> intel_soc_pmic_exec_mipi_pmic_seq_element: Unexpected i2c-addr: 0x00 (reg-addr 0x28 value 0x16 mask 0xff)
> ov2680 i2c-OVTI2680:01: power_ctrl: off
> ov2680 i2c-OVTI2680:01: sensor power-up failed
> ov2680 i2c-OVTI2680:01: ov2680 power-up err.
> ov2680 i2c-OVTI2680:01: power_ctrl: off
> ov2680 i2c-OVTI2680:01: sensor power-gating failed
> ov2680 i2c-OVTI2680:01: +++ out free

thanks,
-- 
js
suse labs
