Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 783011E4C01
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 19:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403784AbgE0Rgn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 13:36:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:36098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403778AbgE0Rgm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 13:36:42 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5CE6820707;
        Wed, 27 May 2020 17:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590601001;
        bh=5RnsMVbVOnGod29Mv0qel83xkUwWKY07VeXYzELhStA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=yKsm666ky5S0mHyJaN52bl2bYM0iK2wKdxjWnhJ9qGYi4oHg3SZ3FXuzorEmwkX4q
         6tu3HY3/f69TpiwNfFqFXDGXdMykiwa9DRkKH3O2kVRrQO9BSHh83/MP9H+7+cq7BT
         gIgoM5syqav21whF8+vUjsv4ypEZmVG1j33OOYBM=
Date:   Wed, 27 May 2020 19:36:37 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Francescodario Cuzzocrea 
        <francescodario.cuzzocrea@mail.polimi.it>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL] Ressurect the atomisp staging driver
Message-ID: <20200527193637.4b8fd8f7@coco.lan>
In-Reply-To: <bb6c2d97-1614-246a-35b1-ee1531115734@redhat.com>
References: <20200501215741.3be05695@coco.lan>
        <3f551a8f87808ee7828dc03d41c7a23faac89f3c.camel@mail.polimi.it>
        <20200503173213.78ae6aaa@coco.lan>
        <CADnVkj96W0QfthukTKQ0a-i2fH1buooH3BEgfy22J9H9=_PcKA@mail.gmail.com>
        <20200503180751.0b1e29c4@ASUS>
        <20200504101628.0f632bf2@ASUS>
        <20200504104934.7873cee3@coco.lan>
        <20200504124539.77eac397@ASUS>
        <20200504140833.11dd5622@coco.lan>
        <20200504154420.5dcf505f@ASUS>
        <20200515103232.47b2a35e@coco.lan>
        <be0935ce-4d88-e7de-5013-6651b8c4edac@redhat.com>
        <20200515114245.266a6fc8@coco.lan>
        <20200519093920.7bb22161@coco.lan>
        <20200519193635.14e806b6@coco.lan>
        <4dd760d6-6445-f3b5-cb14-1705e05820bc@redhat.com>
        <20200522134203.0fe139d6@coco.lan>
        <20200523100000.1131bd29@coco.lan>
        <bb6c2d97-1614-246a-35b1-ee1531115734@redhat.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 27 May 2020 18:23:26 +0200
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi,
>=20
> On 5/23/20 10:00 AM, Mauro Carvalho Chehab wrote:
>=20
> <snip>
>=20
> > Btw, this can also be useful:
> >=20
> > 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=3Dyocto_intel_=
aero_ported_v2
> >=20
> > This is basically the Yocto Aero patchset from:
> >=20
> > 	https://github.com/intel-aero/meta-intel-aero-base
> >=20
> > applied on the top of Kernel 4.4.76 and then ported to
> > Kernel 5.7-rc2, making it run there.
> >=20
> > On such version, I tried to preserve the patch history as much
> > as possible and minimize the changes, while not touching at the media
> > framework. This version contains 3 new I2C sensor drivers.
> >=20
> >  From the new sensors, I ported only the ov8858 code to be built
> > on the top of v5.7-rc2, but aiming another device I have here,
> > using ipu3. So, it got removed from all atomisp-dependent code. =20
>=20
> Thanks for the info, that might be useful later.
>=20
> Note ATM I'm swamped with a lot of other stuff, so I have no idea
> when I will have time to scratch my itch wrt to looking at this.
>=20
> And TBH I'm waiting for you to reach that all important milestone
> of actually getting some sort of picture outside of the sensor
> before I start sinking time into this :)


:-D

Today, I was able to (at least partially) fix an issue that was
causing an OOPS when using a scaler.

I also got rid of the Kernel 3.10 fork of get_user_pages().=20

Still, the free logic seems to be losing some pages:

	[   71.472835] BUG: non-zero pgtables_bytes on freeing mm: 4096

=46rom the driver fixing, that's probably the next step.


I want to be sure that the mm/ code is reliable enough, before
trying to identify what's wrong at the image side.

Btw, the firmware is actually split into several different binaries:

	$ sudo su -c "echo 5 >/sys/bus/pci/drivers/atomisp-isp2/dbgopt"
	$ dmesg

	[11105.369532] atomisp-isp2 0000:00:03.0: Num1 binary id is 0, name is isp=
_copy_var
	[11105.369537] atomisp-isp2 0000:00:03.0: Num2 binary id is 2, name is isp=
_vf_pp_full
	[11105.369540] atomisp-isp2 0000:00:03.0: Num3 binary id is 3, name is isp=
_vf_pp_opt
	[11105.369543] atomisp-isp2 0000:00:03.0: Num4 binary id is 60, name is is=
p_capture_pp_var_bli
	[11105.369546] atomisp-isp2 0000:00:03.0: Num5 binary id is 61, name is is=
p_capture_pp_ldc
	[11105.369549] atomisp-isp2 0000:00:03.0: Num6 binary id is 5, name is isp=
_capture_pp_var
	[11105.369605] atomisp-isp2 0000:00:03.0: Num7 binary id is 4, name is isp=
_yuv_scale_var
	[11105.369609] atomisp-isp2 0000:00:03.0: Num8 binary id is 6, name is isp=
_preisp_var
	[11105.369611] atomisp-isp2 0000:00:03.0: Num9 binary id is 7, name is isp=
_preisp_var_isp2
	[11105.369614] atomisp-isp2 0000:00:03.0: Num10 binary id is 58, name is i=
sp_pre_de_var_isp2
	[11105.369617] atomisp-isp2 0000:00:03.0: Num11 binary id is 8, name is is=
p_gdc_var
	[11105.369620] atomisp-isp2 0000:00:03.0: Num12 binary id is 11, name is i=
sp_anr_var
	[11105.369623] atomisp-isp2 0000:00:03.0: Num13 binary id is 12, name is i=
sp_anr_var_isp2
	[11105.369626] atomisp-isp2 0000:00:03.0: Num14 binary id is 9, name is is=
p_postisp_var
	[11105.369629] atomisp-isp2 0000:00:03.0: Num15 binary id is 10, name is i=
sp_postisp_var_isp2
	[11105.369632] atomisp-isp2 0000:00:03.0: Num16 binary id is 15, name is i=
sp_preview_dec
	[11105.369634] atomisp-isp2 0000:00:03.0: Num17 binary id is 16, name is i=
sp_preview_cont_bds125_isp2
	[11105.369637] atomisp-isp2 0000:00:03.0: Num18 binary id is 17, name is i=
sp_preview_cont_dpc_bds150_isp2
	[11105.369640] atomisp-isp2 0000:00:03.0: Num19 binary id is 19, name is i=
sp_preview_cont_dpc_bds200_isp2
	[11105.369643] atomisp-isp2 0000:00:03.0: Num20 binary id is 18, name is i=
sp_preview_cont_bds150_isp2
	[11105.369646] atomisp-isp2 0000:00:03.0: Num21 binary id is 20, name is i=
sp_preview_cont_bds200_isp2
	[11105.369649] atomisp-isp2 0000:00:03.0: Num22 binary id is 21, name is i=
sp_preview_var
	[11105.369652] atomisp-isp2 0000:00:03.0: Num23 binary id is 22, name is i=
sp_preview_var_isp2
	[11105.369655] atomisp-isp2 0000:00:03.0: Num24 binary id is 24, name is i=
sp_primary_var
	[11105.369657] atomisp-isp2 0000:00:03.0: Num25 binary id is 25, name is i=
sp_primary_var_isp2
	[11105.369660] atomisp-isp2 0000:00:03.0: Num26 binary id is 26, name is i=
sp_primary_small
	[11105.369663] atomisp-isp2 0000:00:03.0: Num27 binary id is 27, name is i=
sp_primary_striped
	[11105.369666] atomisp-isp2 0000:00:03.0: Num28 binary id is 28, name is i=
sp_primary_striped_isp2
	[11105.369669] atomisp-isp2 0000:00:03.0: Num29 binary id is 29, name is i=
sp_primary_8mp=09
	[11105.369672] atomisp-isp2 0000:00:03.0: Num30 binary id is 30, name is i=
sp_primary_14mp
	[11105.369675] atomisp-isp2 0000:00:03.0: Num31 binary id is 31, name is i=
sp_primary_16mp
	[11105.369677] atomisp-isp2 0000:00:03.0: Num32 binary id is 33, name is i=
sp_primary_isp261_stage0
	[11105.369680] atomisp-isp2 0000:00:03.0: Num33 binary id is 34, name is i=
sp_primary_isp261_stage1
	[11105.369683] atomisp-isp2 0000:00:03.0: Num34 binary id is 35, name is i=
sp_primary_isp261_stage2
	[11105.369686] atomisp-isp2 0000:00:03.0: Num35 binary id is 36, name is i=
sp_primary_isp261_stage3
	[11105.369689] atomisp-isp2 0000:00:03.0: Num36 binary id is 37, name is i=
sp_primary_isp261_stage4
	[11105.369691] atomisp-isp2 0000:00:03.0: Num37 binary id is 38, name is i=
sp_primary_isp261_stage5
	[11105.369694] atomisp-isp2 0000:00:03.0: Num38 binary id is 42, name is i=
sp_video_dz
	[11105.369697] atomisp-isp2 0000:00:03.0: Num39 binary id is 44, name is i=
sp_video_high
	[11105.369700] atomisp-isp2 0000:00:03.0: Num40 binary id is 45, name is i=
sp_video_nodz
	[11105.369703] atomisp-isp2 0000:00:03.0: Num41 binary id is 46, name is i=
sp_video_cont_multibds_isp2_min
	[11105.369706] atomisp-isp2 0000:00:03.0: Num42 binary id is 47, name is i=
sp_video_cont_bds_300_600_isp2_min
	[11105.369709] atomisp-isp2 0000:00:03.0: Num43 binary id is 48, name is i=
sp_video_cont_dpc_bds150_isp2_min
	[11105.369712] atomisp-isp2 0000:00:03.0: Num44 binary id is 50, name is i=
sp_video_cont_dpc_bds200_isp2_min
	[11105.369715] atomisp-isp2 0000:00:03.0: Num45 binary id is 49, name is i=
sp_video_cont_bds150_isp2_min
	[11105.369717] atomisp-isp2 0000:00:03.0: Num46 binary id is 51, name is i=
sp_video_cont_bds200_isp2_min
	[11105.369720] atomisp-isp2 0000:00:03.0: Num47 binary id is 52, name is i=
sp_video_cont_nobds_isp2_min
	[11105.369723] atomisp-isp2 0000:00:03.0: Num48 binary id is 53, name is i=
sp_video_dz_isp2_min
	[11105.369726] atomisp-isp2 0000:00:03.0: Num49 binary id is 54, name is i=
sp_video_dz_isp2
	[11105.369729] atomisp-isp2 0000:00:03.0: Num50 binary id is 55, name is i=
sp_video_lp_isp2

Based on the name of some of those binaries, it sounds that there are some
binaries that are resolution-specific:

	[11105.369669] atomisp-isp2 0000:00:03.0: Num29 binary id is 29, name is i=
sp_primary_8mp=09
	[11105.369672] atomisp-isp2 0000:00:03.0: Num30 binary id is 30, name is i=
sp_primary_14mp
	[11105.369675] atomisp-isp2 0000:00:03.0: Num31 binary id is 31, name is i=
sp_primary_16mp

I'm currently using the Intel Aero firmware, which is meant for a different
sensor model. I'm wandering if such firmware has everything needed for the =
sensor.

One of the things that could be done in parallel would be to use different
firmwares and see if they would produce a different pipeline setting.

Thanks,
Mauro
