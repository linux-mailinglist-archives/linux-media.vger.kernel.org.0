Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D43020B281
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 15:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbgFZN37 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 09:29:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:36472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726013AbgFZN36 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 09:29:58 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6327020768;
        Fri, 26 Jun 2020 13:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593178197;
        bh=nQHHQCKOL7VfMY+RUpTGj1fPX9bVQs579VgRuEUAano=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Sed0C5SCKVFBsTZOPK1dZWMSMlLOLCIspiTiU/3LvsReeFeBApsPuIdtz2GkkRiCN
         TNxxBfq/zNV24Je0ivRzphkav7sZ2XmbYKv3VDzHY7ECeQ69jq1ATu8auQJB5hsirn
         4PZJegeqpGkLLl1CXjnzeLEMYe2FhgoD1Z5zMmj0=
Date:   Fri, 26 Jun 2020 15:29:53 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2 00/15] media: atomisp: Clean ups and fixes to make it
 load on Baytrail
Message-ID: <20200626152953.261dd214@coco.lan>
In-Reply-To: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
References: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

Em Fri, 26 Jun 2020 15:19:10 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:

> I'm experimenting with it on Baytrail machine and found some issues.
> Along with fixing them I cleaned up a bit this.

Thanks for that! Yeah, I found some issues there myself, although
testing on a device with more than one camera is very nice.

I'll apply your patches on the top of my atomisp tree:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=3Datomisp_v5

On a very quick look, I suspect that some may rise some conflicts,
as I did some improvements at the detection logic, in order to get
rid of the ugly DMI match stuff when ACPI has what's needed.

Regards,
Mauro

>=20
> So, after applying I have the following log
>=20
> # modprobe atomisp
> [  116.215056] atomisp: module is from the staging directory, the quality=
 is unknown, you have been warned.
> [  116.310077] atomisp-isp2 0000:00:03.0: Detected Baytrail version 15 (I=
SP2400) on VALLEYVIEW C0 (CR) PLATFORM
> [  116.354189] atomisp-isp2 0000:00:03.0: start: 0x50000000
> [  116.376888] atomisp-isp2 0000:00:03.0: atomisp mmio base: 0000000027f9=
eb1f
> [  116.401267] ACPI: \: failed to evaluate _DSM (0x1001)
> [  116.423479] atomisp-isp2 0000:00:03.0: Failed to find EFI variable 000=
0:00:03.0_HpllFreq
> [  116.449254] atomisp-isp2 0000:00:03.0: HpllFreq: using default (2000)
> [  116.473045] atomisp-isp2 0000:00:03.0: ISP HPLL frequency base =3D 200=
0 MHz
> [  116.770613] atomisp-isp2 0000:00:03.0: Probing Subdev INT33F8:00
> [  116.793750] atomisp-isp2 0000:00:03.0: Subdev INT33F8:00 successfully =
register
> [  116.818155] atomisp-isp2 0000:00:03.0: raw_index: -1
> [  116.839924] atomisp-isp2 0000:00:03.0: SOC_INDEX: 0
> [  116.861622] atomisp-isp2 0000:00:03.0: Probing Subdev INTCF1C:00
> [  116.896885] lm3554 i2c-INTCF1C:00: Failed to power on lm3554 LED flash
> [  116.920236] atomisp-isp2 0000:00:03.0: Subdev INTCF1C:00 detection fail
> [  116.943649] atomisp-isp2 0000:00:03.0: detected 1 camera sensors
> [  116.966177] atomisp-isp2 0000:00:03.0: atomisp_csi_lane_config: the po=
rtconfig is 2-1-0, CSI_CONTROL is 0x0002009C
> [  117.009054] atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP=
 CSI2-port0 was not initialized!
> [  117.050772] atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP=
 CSI2-port1 was not initialized!
> [  117.050795] atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP=
 CSI2-port2 was not initialized!
> [  117.134464] atomisp-isp2 0000:00:03.0: Entity type for entity file_inp=
ut_subdev was not initialized!
> [  117.176572] atomisp-isp2 0000:00:03.0: Entity type for entity tpg_subd=
ev was not initialized!
> [  117.202301] atomisp-isp2 0000:00:03.0: Entity type for entity ATOMISP_=
SUBDEV_0 was not initialized!
> [  117.246734] atomisp-isp2 0000:00:03.0: Entity type for entity ATOMISP_=
SUBDEV_1 was not initialized!
> [  117.290990] atomisp-isp2 0000:00:03.0: FILE_INPUT enable, camera_cnt: 1
> [  117.314607] atomisp-isp2 0000:00:03.0: TPG detected, camera_cnt: 2
> [  117.341386] atomisp-isp2 0000:00:03.0: atomisp_save_iunit_reg
> [  117.363735] atomisp-isp2 0000:00:03.0: DFS target frequency=3D200.
> [  117.386272] atomisp-isp2 0000:00:03.0: Programming DFS frequency to 200
> [  117.409426] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit =
to be 0.
> [  117.433323] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit =
to be 0.
> [  117.457139] atomisp-isp2 0000:00:03.0: atomisp_ospm_dphy_down
> [  117.479800] atomisp-isp2 0000:00:03.0: binary #0  type SP: sp
> [  117.502001] atomisp-isp2 0000:00:03.0: binary #1  type ISP (Normal), b=
inary id is  0: isp_copy_var
> [  117.542907] atomisp-isp2 0000:00:03.0: binary #2  type ISP (Normal), b=
inary id is  2: isp_vf_pp_full
> [  117.584666] atomisp-isp2 0000:00:03.0: binary #3  type ISP (Normal), b=
inary id is  3: isp_vf_pp_opt
> [  117.626806] atomisp-isp2 0000:00:03.0: binary #4  type ISP (Normal), b=
inary id is 60: isp_capture_pp_var_bli
> [  117.670360] atomisp-isp2 0000:00:03.0: binary #5  type ISP (Normal), b=
inary id is 61: isp_capture_pp_ldc
> [  117.713655] atomisp-isp2 0000:00:03.0: binary #6  type ISP (Normal), b=
inary id is  5: isp_capture_pp_var
> [  117.757345] atomisp-isp2 0000:00:03.0: binary #7  type ISP (Normal), b=
inary id is  4: isp_yuv_scale_var
> [  117.801371] atomisp-isp2 0000:00:03.0: binary #8  type ISP (Normal), b=
inary id is  6: isp_preisp_var
> [  117.845621] atomisp-isp2 0000:00:03.0: binary #9  type ISP (Normal), b=
inary id is  7: isp_preisp_var_isp2
> [  117.890913] atomisp-isp2 0000:00:03.0: binary #10 type ISP (Normal), b=
inary id is 58: isp_pre_de_var_isp2
> [  117.936321] atomisp-isp2 0000:00:03.0: binary #11 type ISP (Normal), b=
inary id is  8: isp_gdc_var
> [  117.963840] atomisp-isp2 0000:00:03.0: binary #12 type ISP (Normal), b=
inary id is 11: isp_anr_var
> [  117.991190] atomisp-isp2 0000:00:03.0: binary #13 type ISP (Normal), b=
inary id is 12: isp_anr_var_isp2
> [  118.035988] atomisp-isp2 0000:00:03.0: binary #14 type ISP (Normal), b=
inary id is  9: isp_postisp_var
> [  118.081148] atomisp-isp2 0000:00:03.0: binary #15 type ISP (Normal), b=
inary id is 10: isp_postisp_var_isp2
> [  118.127374] atomisp-isp2 0000:00:03.0: binary #16 type ISP (Normal), b=
inary id is 15: isp_preview_dec
> [  118.173707] atomisp-isp2 0000:00:03.0: binary #17 type ISP (Normal), b=
inary id is 16: isp_preview_cont_bds125_isp2
> [  118.221920] atomisp-isp2 0000:00:03.0: binary #18 type ISP (Normal), b=
inary id is 18: isp_preview_cont_bds150_isp2
> [  118.270412] atomisp-isp2 0000:00:03.0: binary #19 type ISP (Normal), b=
inary id is 20: isp_preview_cont_bds200_isp2
> [  118.318942] atomisp-isp2 0000:00:03.0: binary #20 type ISP (Normal), b=
inary id is 21: isp_preview_var
> [  118.366572] atomisp-isp2 0000:00:03.0: binary #21 type ISP (Normal), b=
inary id is 22: isp_preview_var_isp2
> [  118.415086] atomisp-isp2 0000:00:03.0: binary #22 type ISP (Normal), b=
inary id is 27: isp_primary_striped
> [  118.464002] atomisp-isp2 0000:00:03.0: binary #23 type ISP (Normal), b=
inary id is 28: isp_primary_striped_isp2
> [  118.514097] atomisp-isp2 0000:00:03.0: binary #24 type ISP (Normal), b=
inary id is 24: isp_primary_var
> [  118.564053] atomisp-isp2 0000:00:03.0: binary #25 type ISP (Normal), b=
inary id is 25: isp_primary_var_isp2
> [  118.615276] atomisp-isp2 0000:00:03.0: binary #26 type ISP (Normal), b=
inary id is 26: isp_primary_small
> [  118.666737] atomisp-isp2 0000:00:03.0: binary #27 type ISP (Normal), b=
inary id is 29: isp_primary_8mp
> [  118.718346] atomisp-isp2 0000:00:03.0: binary #28 type ISP (Normal), b=
inary id is 30: isp_primary_14mp
> [  118.770053] atomisp-isp2 0000:00:03.0: binary #29 type ISP (Normal), b=
inary id is 31: isp_primary_16mp
> [  118.821763] atomisp-isp2 0000:00:03.0: binary #30 type ISP (Normal), b=
inary id is 33: isp_primary_isp261_stage0
> [  118.874370] atomisp-isp2 0000:00:03.0: binary #31 type ISP (Normal), b=
inary id is 34: isp_primary_isp261_stage1
> [  118.926992] atomisp-isp2 0000:00:03.0: binary #32 type ISP (Normal), b=
inary id is 35: isp_primary_isp261_stage2
> [  118.979792] atomisp-isp2 0000:00:03.0: binary #33 type ISP (Normal), b=
inary id is 36: isp_primary_isp261_stage3
> [  119.032714] atomisp-isp2 0000:00:03.0: binary #34 type ISP (Normal), b=
inary id is 37: isp_primary_isp261_stage4
> [  119.085749] atomisp-isp2 0000:00:03.0: binary #35 type ISP (Normal), b=
inary id is 38: isp_primary_isp261_stage5
> [  119.139422] atomisp-isp2 0000:00:03.0: binary #36 type ISP (Normal), b=
inary id is 42: isp_video_dz
> [  119.192607] atomisp-isp2 0000:00:03.0: binary #37 type ISP (Normal), b=
inary id is 44: isp_video_high
> [  119.246768] atomisp-isp2 0000:00:03.0: binary #38 type ISP (Normal), b=
inary id is 45: isp_video_nodz
> [  119.301793] atomisp-isp2 0000:00:03.0: binary #39 type ISP (Normal), b=
inary id is 46: isp_video_cont_multibds_isp2_min
> [  119.359159] atomisp-isp2 0000:00:03.0: binary #40 type ISP (Normal), b=
inary id is 47: isp_video_cont_bds_300_600_isp2_min
> [  119.416880] atomisp-isp2 0000:00:03.0: binary #41 type ISP (Normal), b=
inary id is 49: isp_video_cont_bds150_isp2_min
> [  119.474102] atomisp-isp2 0000:00:03.0: binary #42 type ISP (Normal), b=
inary id is 51: isp_video_cont_bds200_isp2_min
> [  119.531365] atomisp-isp2 0000:00:03.0: binary #43 type ISP (Normal), b=
inary id is 52: isp_video_cont_nobds_isp2_min
> [  119.588595] atomisp-isp2 0000:00:03.0: binary #44 type ISP (Normal), b=
inary id is 53: isp_video_dz_isp2_min
> [  119.644981] atomisp-isp2 0000:00:03.0: binary #45 type ISP (Normal), b=
inary id is 54: isp_video_dz_isp2
> [  119.701015] atomisp-isp2 0000:00:03.0: binary #46 type ISP (Normal), b=
inary id is 55: isp_video_lp_isp2
>=20
>=20
> Andy Shevchenko (15):
>   media: atomisp: Replace last use of Intel MID APIs
>   media: atomisp: move CCK endpoint address to generic header
>   media: atomisp: Use proper APIs to find I=C2=B2C client device by ACPI =
HID
>   media: atomisp: don't pass struct device_driver as parameter
>   media: atomisp: Get rid of struct pci_dev in struct atomisp_device
>   media: atomisp: Unify pdev to be pointer to struct pci_device
>   media: atomisp: Replace direct access to MMIO with proper helpers
>   media: atomisp: Drop global atomisp_dev variable (easy cases)
>   media: atomisp: make platform data more readable
>   media: atomisp: Don't try to parse unexpected ACPI object type
>   media: atomisp: Make pointer to PMIC client global
>   media: atomisp: Refactor PMIC detection to a separate function.
>   media: atomisp: Provide Gmin subdev as parameter to gmin_subdev_add()
>   media: atomisp: Get rid of ugly and leaky ACPI handling in
>     gmin_subdev_add()
>   media: atomisp: Deduplicate return ret in gmin_i2c_write()
>=20
>  arch/x86/include/asm/iosf_mbi.h               |   1 +
>  .../atomisp/include/linux/atomisp_platform.h  |   1 +
>  .../staging/media/atomisp/pci/atomisp-regs.h  |   3 -
>  .../staging/media/atomisp/pci/atomisp_acc.c   |   4 +-
>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  57 ++--
>  .../staging/media/atomisp/pci/atomisp_cmd.h   |   4 +-
>  .../media/atomisp/pci/atomisp_compat.h        |   2 -
>  .../media/atomisp/pci/atomisp_compat_css20.c  |  64 ++--
>  .../media/atomisp/pci/atomisp_compat_css20.h  |   2 +-
>  .../staging/media/atomisp/pci/atomisp_drvfs.c |  14 +-
>  .../staging/media/atomisp/pci/atomisp_drvfs.h |   2 +-
>  .../media/atomisp/pci/atomisp_gmin_platform.c | 220 +++++++-------
>  .../media/atomisp/pci/atomisp_internal.h      |   2 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.c |  19 +-
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  | 277 ++++++++----------
>  15 files changed, 311 insertions(+), 361 deletions(-)
>=20



Thanks,
Mauro
