Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4F6D441520
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 09:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbhKAIOl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 04:14:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:45280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229933AbhKAIOk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 04:14:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64C5A60F46;
        Mon,  1 Nov 2021 08:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635754327;
        bh=/XrbaNo3c4vIg8DZARkqtBco88bBisulCyzuObFfJKY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=O90okAEyidfsiRmvFxKJ4nPAlhMB50r56TxkW4Lyu4jZQKZTGZ5lRIqfGGD8srjS9
         5DwRY12VZJs8tVi0I4g9+rcpzweaE1q6j3ozWiv69su6fvNgJN5Zrs+O/ICrBG4h4V
         q0/Zi+BE8wdDAFqOGkNXHq9zw0bP1r2gFGwchIK6bpPyuuqIF+aNJeQYgc+wXTSxFB
         k9cz5VIczAWG8pwkdqMIN6p3zRbq9YeMO0LITbzxjyMYCCB1scBjqvzj8hGTe7kLKD
         8kM1gLsMHAan/BreUpR7T3TFjiLshhvh765rawXV2Y2mbbEBaGkuQZuLa4D+xilZAI
         6VsdCaJAVpx2A==
Date:   Mon, 1 Nov 2021 08:11:59 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linuxarm <linuxarm@huawei.com>, mauro.chehab@huawei.com,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ingo Molnar <mingo@kernel.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 3/3] media: atomisp: comment-out JPEG format
Message-ID: <20211101081159.43d119d9@sal.lan>
In-Reply-To: <CAHp75VcaWqeY2=13WE+ObQzjA1q83QPU4NGJnPR0H12m68uzVQ@mail.gmail.com>
References: <dc24ab2a6c9bb0831e1bb732d3377529fb0ead87.1635679495.git.mchehab+huawei@kernel.org>
        <b561275a4b10949ac06ff834e27243ec6ad6d546.1635679495.git.mchehab+huawei@kernel.org>
        <CAHp75VcaWqeY2=13WE+ObQzjA1q83QPU4NGJnPR0H12m68uzVQ@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

Em Sun, 31 Oct 2021 15:03:39 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

> On Sun, Oct 31, 2021 at 1:30 PM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > This is already disabled on some parts of the code, and trying
> > to use it with current firmware causes an error:
> >
> > [   53.799946] atomisp-isp2 0000:00:03.0: can't create streams
> > [   53.799962] atomisp-isp2 0000:00:03.0: __get_frame_info 1600x900 (padded to 0) returned -22
> >
> > So, completely disable reporting it.  
> 
> 
> Can't we simply remove all these pieces altogether?
> The rationale:
>  - code is still kept in the index of the Git
>  - avoid robots and humans of sending patches against dead code
>  - leaving dead code (even in staging) is not what we want in the long term

Good point.

IMO, it is a little premature to drop those. I mean, clearly at least
some firmware for the ISP2 is capable of encoding in JPEG format,
but the code which creates such pipeline is not selecting the right
binary. 

Btw, the same issue also happens here for BG10 fourcc, which is the
real output of the sensor:

	$ v4l2grab -f BG10 -x 1600 -y 1200 -d /dev/video2 -u -n 1 -R
	Device caps: CAPTURE OUTPUT STREAMING EXT_PIX_FORMAT DEVICE_CAPS STREAMING 
	Driver caps: CAPTURE OUTPUT STREAMING EXT_PIX_FORMAT STREAMING 
	xioctl(5): error 22, Invalid argument

And the relevant logs from firmware load time:

	 atomisp-isp2 0000:00:03.0: binary #0  type SP: sp
	 atomisp-isp2 0000:00:03.0: binary #1  type ISP (Normal), binary id is  0: isp_copy_var
	 atomisp-isp2 0000:00:03.0: binary #2  type ISP (Normal), binary id is  2: isp_vf_pp_full
	 atomisp-isp2 0000:00:03.0: binary #3  type ISP (Normal), binary id is  3: isp_vf_pp_opt
	 atomisp-isp2 0000:00:03.0: binary #4  type ISP (Normal), binary id is 60: isp_capture_pp_var_bli
	 atomisp-isp2 0000:00:03.0: binary #5  type ISP (Normal), binary id is 61: isp_capture_pp_ldc
	 atomisp-isp2 0000:00:03.0: binary #6  type ISP (Normal), binary id is  5: isp_capture_pp_var
	 atomisp-isp2 0000:00:03.0: binary #7  type ISP (Normal), binary id is  4: isp_yuv_scale_var
	 atomisp-isp2 0000:00:03.0: binary #8  type ISP (Normal), binary id is  6: isp_preisp_var
	 atomisp-isp2 0000:00:03.0: binary #9  type ISP (Normal), binary id is  7: isp_preisp_var_isp2
	 atomisp-isp2 0000:00:03.0: binary #10 type ISP (Normal), binary id is 58: isp_pre_de_var_isp2
	 atomisp-isp2 0000:00:03.0: binary #11 type ISP (Normal), binary id is  8: isp_gdc_var
	 atomisp-isp2 0000:00:03.0: binary #12 type ISP (Normal), binary id is 11: isp_anr_var
	 atomisp-isp2 0000:00:03.0: binary #13 type ISP (Normal), binary id is 12: isp_anr_var_isp2
	 atomisp-isp2 0000:00:03.0: binary #14 type ISP (Normal), binary id is  9: isp_postisp_var
	 atomisp-isp2 0000:00:03.0: binary #15 type ISP (Normal), binary id is 10: isp_postisp_var_isp2
	 atomisp-isp2 0000:00:03.0: binary #16 type ISP (Normal), binary id is 15: isp_preview_dec
	 atomisp-isp2 0000:00:03.0: binary #17 type ISP (Normal), binary id is 16: isp_preview_cont_bds125_isp2
	 atomisp-isp2 0000:00:03.0: binary #18 type ISP (Normal), binary id is 17: isp_preview_cont_dpc_bds150_isp2
	 atomisp-isp2 0000:00:03.0: binary #19 type ISP (Normal), binary id is 19: isp_preview_cont_dpc_bds200_isp2
	 atomisp-isp2 0000:00:03.0: binary #20 type ISP (Normal), binary id is 18: isp_preview_cont_bds150_isp2
	 atomisp-isp2 0000:00:03.0: binary #21 type ISP (Normal), binary id is 20: isp_preview_cont_bds200_isp2
	 atomisp-isp2 0000:00:03.0: binary #22 type ISP (Normal), binary id is 21: isp_preview_var
	 atomisp-isp2 0000:00:03.0: binary #23 type ISP (Normal), binary id is 22: isp_preview_var_isp2
	 atomisp-isp2 0000:00:03.0: binary #24 type ISP (Normal), binary id is 24: isp_primary_var
	 atomisp-isp2 0000:00:03.0: binary #25 type ISP (Normal), binary id is 25: isp_primary_var_isp2
	 atomisp-isp2 0000:00:03.0: binary #26 type ISP (Normal), binary id is 26: isp_primary_small
	 atomisp-isp2 0000:00:03.0: binary #27 type ISP (Normal), binary id is 27: isp_primary_striped
	 atomisp-isp2 0000:00:03.0: binary #28 type ISP (Normal), binary id is 28: isp_primary_striped_isp2
	 atomisp-isp2 0000:00:03.0: binary #29 type ISP (Normal), binary id is 29: isp_primary_8mp
	 atomisp-isp2 0000:00:03.0: binary #30 type ISP (Normal), binary id is 30: isp_primary_14mp
	 atomisp-isp2 0000:00:03.0: binary #31 type ISP (Normal), binary id is 31: isp_primary_16mp
	 atomisp-isp2 0000:00:03.0: binary #32 type ISP (Normal), binary id is 33: isp_primary_isp261_stage0
	 atomisp-isp2 0000:00:03.0: binary #33 type ISP (Normal), binary id is 34: isp_primary_isp261_stage1
	 atomisp-isp2 0000:00:03.0: binary #34 type ISP (Normal), binary id is 35: isp_primary_isp261_stage2
	 atomisp-isp2 0000:00:03.0: binary #35 type ISP (Normal), binary id is 36: isp_primary_isp261_stage3
	 atomisp-isp2 0000:00:03.0: binary #36 type ISP (Normal), binary id is 37: isp_primary_isp261_stage4
	 atomisp-isp2 0000:00:03.0: binary #37 type ISP (Normal), binary id is 38: isp_primary_isp261_stage5
	 atomisp-isp2 0000:00:03.0: binary #38 type ISP (Normal), binary id is 42: isp_video_dz
	 atomisp-isp2 0000:00:03.0: binary #39 type ISP (Normal), binary id is 44: isp_video_high
	 atomisp-isp2 0000:00:03.0: binary #40 type ISP (Normal), binary id is 45: isp_video_nodz
	 atomisp-isp2 0000:00:03.0: binary #41 type ISP (Normal), binary id is 46: isp_video_cont_multibds_isp2_min
	 atomisp-isp2 0000:00:03.0: binary #42 type ISP (Normal), binary id is 47: isp_video_cont_bds_300_600_isp2_min
	 atomisp-isp2 0000:00:03.0: binary #43 type ISP (Normal), binary id is 48: isp_video_cont_dpc_bds150_isp2_min
	 atomisp-isp2 0000:00:03.0: binary #44 type ISP (Normal), binary id is 50: isp_video_cont_dpc_bds200_isp2_min
	 atomisp-isp2 0000:00:03.0: binary #45 type ISP (Normal), binary id is 49: isp_video_cont_bds150_isp2_min
	 atomisp-isp2 0000:00:03.0: binary #46 type ISP (Normal), binary id is 51: isp_video_cont_bds200_isp2_min
	 atomisp-isp2 0000:00:03.0: binary #47 type ISP (Normal), binary id is 52: isp_video_cont_nobds_isp2_min
	 atomisp-isp2 0000:00:03.0: binary #48 type ISP (Normal), binary id is 53: isp_video_dz_isp2_min
	 atomisp-isp2 0000:00:03.0: binary #49 type ISP (Normal), binary id is 54: isp_video_dz_isp2
	 atomisp-isp2 0000:00:03.0: binary #50 type ISP (Normal), binary id is 55: isp_video_lp_isp2

And when trying to build the pipeline:

	 ia_css_binary_find() selected = 0000000004885f71, mode = 1 ID = 22
	 ia_css_binary_find() leave: return_err=0
	 atomisp-isp2 0000:00:03.0: Using binary isp_preview_var_isp2 (id 22), type 0, mode 1, continuous true
	 load_preview_binaries() num_invalid_frames=1 dvs_frame_delay=1
	 ia_css_binary_find() enter: descr=00000000d70b101f, (mode=9), binary=00000000bceb2e4a
	 BINARY INFO:
	 0:
	  Name:isp_copy_var Type:0 Cont:0
	 1:
	  Name:isp_preview_var_isp2 Type:0 Cont:1
	  Name:isp_preview_var Type:0 Cont:1
	  Name:isp_preview_cont_bds200_isp2 Type:0 Cont:1
	  Name:isp_preview_cont_bds150_isp2 Type:0 Cont:1
	  Name:isp_preview_cont_dpc_bds200_isp2 Type:0 Cont:1
	  Name:isp_preview_cont_dpc_bds150_isp2 Type:0 Cont:1
	  Name:isp_preview_cont_bds125_isp2 Type:0 Cont:1
	  Name:isp_preview_dec Type:0 Cont:1
	 2:
	  Name:isp_primary_16mp Type:0 Cont:0
	  Name:isp_primary_14mp Type:0 Cont:0
	  Name:isp_primary_8mp Type:0 Cont:0
	  Name:isp_primary_striped_isp2 Type:0 Cont:1
	  Name:isp_primary_striped Type:0 Cont:1
	  Name:isp_primary_small Type:0 Cont:0
	  Name:isp_primary_var_isp2 Type:0 Cont:1
	  Name:isp_primary_var Type:0 Cont:0
	 3:
	  Name:isp_video_lp_isp2 Type:0 Cont:0
	  Name:isp_video_dz_isp2 Type:0 Cont:0
	  Name:isp_video_dz_isp2_min Type:0 Cont:0
	  Name:isp_video_cont_nobds_isp2_min Type:0 Cont:1
	  Name:isp_video_cont_bds200_isp2_min Type:0 Cont:1
	  Name:isp_video_cont_bds150_isp2_min Type:0 Cont:1
	  Name:isp_video_cont_dpc_bds200_isp2_min Type:0 Cont:1
	  Name:isp_video_cont_dpc_bds150_isp2_min Type:0 Cont:1
	  Name:isp_video_cont_bds_300_600_isp2_min Type:0 Cont:1
	  Name:isp_video_cont_multibds_isp2_min Type:0 Cont:1
	  Name:isp_video_nodz Type:0 Cont:0
	  Name:isp_video_high Type:0 Cont:0
	  Name:isp_video_dz Type:0 Cont:0
	 4:
	  Name:isp_preisp_var_isp2 Type:0 Cont:0
	  Name:isp_preisp_var Type:0 Cont:0
	 5:
	  Name:isp_gdc_var Type:0 Cont:0
	 6:
	  Name:isp_postisp_var_isp2 Type:0 Cont:0
	  Name:isp_postisp_var Type:0 Cont:0
	 7:
	  Name:isp_anr_var_isp2 Type:0 Cont:0
	  Name:isp_anr_var Type:0 Cont:0
	 8:
	  Name:isp_yuv_scale_var Type:0 Cont:1
	  Name:isp_capture_pp_var Type:0 Cont:1
	  Name:isp_capture_pp_ldc Type:0 Cont:1
	  Name:isp_capture_pp_var_bli Type:0 Cont:1
	 9:
	  Name:isp_vf_pp_opt Type:0 Cont:1
	  Name:isp_vf_pp_full Type:0 Cont:1
	 10:
	  Name:isp_pre_de_var_isp2 Type:0 Cont:1
	 11:
	  Name:isp_primary_isp261_stage0 Type:0 Cont:1
	 12:
	  Name:isp_primary_isp261_stage1 Type:0 Cont:1
	 13:
	  Name:isp_primary_isp261_stage2 Type:0 Cont:1
	 14:
	  Name:isp_primary_isp261_stage3 Type:0 Cont:1
	 15:
	  Name:isp_primary_isp261_stage4 Type:0 Cont:1
	 16:
	  Name:isp_primary_isp261_stage5 Type:0 Cont:1
	 ia_css_binary_find() candidate = 00000000fc264b22, mode = 9 ID = 3
	 ia_css_binary_find() [1676] continue: !0
	 ia_css_binary_find() candidate = 0000000041fcca04, mode = 9 ID = 2
	 ia_css_binary_find() [1676] continue: !0
	 ia_css_binary_find() selected = 0000000000000000, mode = 0 ID = 0
	 ia_css_binary_find() leave: return_err=-22
	 atomisp-isp2 0000:00:03.0: Seeking for binary failed at:
	 CPU: 0 PID: 1343 Comm: v4l2grab Tainted: G         C        5.15.0-rc4+ #77
	 Hardware name: ASUSTeK COMPUTER INC. T101HA/T101HA, BIOS T101HA.306 04/23/2019
	 Call Trace:
	  dump_stack_lvl+0x46/0x5a
	  ia_css_binary_find+0xa7d/0xcf0 [atomisp]
	  ? vprintk_emit+0x112/0x240
	  load_preview_binaries+0x323/0x3c0 [atomisp]
	  ia_css_stream_create+0xddf/0x18e0 [atomisp]
	  __create_streams+0x255/0xe20 [atomisp]
	  ? __create_pipes+0x2b7/0x4f0 [atomisp]
	  __get_frame_info+0x9d/0x2a0 [atomisp]

See, basically the logic which seeks for a firmware that would allow
to just copy the MBUS format without touching it failed somewhere.

As no binary should be required to convert from BG10, as this is the
native format, I strongly suspect that the logic which sets the pipeline
has some bug.

So, I wouldn't drop support for Bayer and JPEG for now. Instead, the 
best seems to comment out the broken stuff for now, while we're dealing
with more relevant issues. We can return later on to address such
formats.

Regards,
Mauro
