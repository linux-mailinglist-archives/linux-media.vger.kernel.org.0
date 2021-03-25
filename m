Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F054A348DF8
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 11:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhCYK12 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 06:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbhCYK1E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 06:27:04 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B431C06174A
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 03:27:02 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id q29so1745235lfb.4
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 03:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9Eh4CTh1OZ9KS2bDmG3AwBz4UQ8U+TRG7AH4MmfDmYE=;
        b=nmE9HyAhG4tKWTIZTEKMz0WIqW3jyZQ7gGN1LxrS2WX+fn0BzEQyPkOG0rKYQ49Rs5
         5l+u84exkfP40lMqV/A4z+5/XXZj98Ckk++2WQlxLqYYvG9ZPFcp3sx07AEh48C4Y0VB
         eZN5jTIibx+KZrliFDZwpcGmFcOBfJAcqRiqWuSmdHuKVQllz88PUqNAoPg9wRq6DwOn
         GUKYx2AyxDCOIyaGJX0XmGwTHbltZI0mTKzb2l1UbN2w4kfv6iOHNhpQxUJBrtaMi+Tz
         DHgAkklxuUkY1gm+uNKsu/kccC0ROpRJfGRzm5s9qOTqaBcOBfLB8U8sJQ8qts963N4R
         8vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9Eh4CTh1OZ9KS2bDmG3AwBz4UQ8U+TRG7AH4MmfDmYE=;
        b=O0+JDE42E2zZvJrbwLzG5U796A+iH+KkDIu1BrAuQkg9gac7UVOSyKH5LGKVvqzvDp
         tmOGOIpEW1H77J+ZOMM9vtC4qmGHUShhmD1j1K9PsxVW8kE1OZWqpAvOB0BGFahOCwvm
         hU48f7ZycDheqB+RxoC7u5lzqJ0KEbnUQyk1p5CsSrnMr4R9/tosu7CDlpu6283STuQ9
         PK2PsrtVNxD+HvxtUQgvWbBOohHv12bEs3U2qUe3DzfYriIZ8WZfGcGu15Q6sknJ8DhL
         woABXUTVNCAs9QYEoDX5v6WqXMVukgHdaUtp07LEIjtl53UYDVPqIRHKS/XCLlUuFNiH
         F2yg==
X-Gm-Message-State: AOAM5339aaNu+ozlSp3Zel50s9/PNpgMOiocyAuMiulbPr+tOKdU/LO4
        S8pdcYjImpzIpntDgraWLDVFPg==
X-Google-Smtp-Source: ABdhPJyc8+dTzkv8gW/RT9tVMF45+08f6ErD5lkD0688UQ3mCzCxR39DHuA1JvnRpAH2SQY3WEvk6w==
X-Received: by 2002:a19:8c19:: with SMTP id o25mr4711988lfd.547.1616668021382;
        Thu, 25 Mar 2021 03:27:01 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id g14sm707420ljj.3.2021.03.25.03.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 03:27:00 -0700 (PDT)
Date:   Thu, 25 Mar 2021 11:27:00 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] adv7604: support EDIDs up to 4 blocks
Message-ID: <YFxldF7Eb0eE6dVi@oden.dyn.berto.se>
References: <00882808-472a-d429-c565-a701da579ead@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00882808-472a-d429-c565-a701da579ead@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for your work.

On 2021-03-24 08:11:28 +0100, Hans Verkuil wrote:
> While the adv7604/11/12 hardware supported EDIDs up to 4 blocks, the
> driver didn't. This patch adds support for this. It also improves support
> for EDIDs that do not have a Source Physical Address: in that case the
> spa location is set to the first byte of the second block, and the
> 'physical address' is just the two bytes at that location. This is per
> the suggestion in the adv76xx documentation for such EDIDs.
> 
> Tested with an adv7604 and adv7612.

I tested this on my Koelsch together with it's two buddies [1] and [2] 
to verify that my capture tests still worked. They did not and 
unfortunately they crashed the kernel instead. A quick check suggests 
this patch (which I had first in my stack of the 3 patches on-top of 
media-tree [3]) was the source. Running directly on media-tree and 
things work as before.

I managed to reduce the TC to not even having to have a HDMI video 
source attached just running v4l2-compliance was enough. I tested it 
using both the latest master of v4l-utils [4] and the one I had on the 
system since earlier [5] with the same result.

arm ~ # v4l2-compliance --version
v4l2-compliance 1.21.0-4752, 32 bits, 32-bit time_t
v4l2-compliance SHA: 162d4e7221ca 2021-03-25 07:35:09

arm ~ # v4l2-compliance -d /dev/video27      
v4l2-compliance 1.21.0-4752, 32 bits, 32-bit time_t
v4l2-compliance SHA: 162d4e7221ca 2021-03-25 07:35:09

Compliance test for rcar_vin device /dev/v[  113.447337] rcar-vin e6ef0000.video: =================  START STATUS  =================
ideo27:

Drive[  113.456656] v4l2-ctrls: rcar-vin e6ef0000.video: Alpha Component: 255
r Info:
        Driver[  113.464244] rcar-vin e6ef0000.video: ==================  END STATUS  ==================
 name      : rcar_vin
        Card type        : R_Car_VIN
        Bus info         : platform:e6ef0000.video
        Driver version   : 5.12.0
        Capabilities     : 0x85200001
                Video Capture
                Read/Write
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x05200001
                Video Capture
                Read/Write
                Streaming
                Extended Pix Format

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video27 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
        test VIDIOC_DV_TIMINGS_CAP: OK
[  114.442397] 8<--- cut here ---
[  114.445496] Unable to handle kernel NULL pointer dereference at virtual address 00000108
[  114.453714] pgd = 4fbbee43
[  114.456475] [00000108] *pgd=00000000
[  114.460168] Internal error: Oops: 5 [#1] SMP ARM
[  114.464848] CPU: 0 PID: 361 Comm: v4l2-compliance Tainted: G        W         5.12.0-rc2-00298-gda0a886d67ea #8
[  114.474989] Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
[  114.481464] PC is at regmap_read+0x4/0x58
[  114.485524] LR is at adv76xx_read_check+0x38/0x88
[  114.490270] pc : [<c047d818>]    lr : [<c05661b4>]    psr: 400f0013
[  114.496573] sp : c2693d50  ip : 00000020  fp : c185f33c
[  114.501832] r10: c2693e6c  r9 : c185f554  r8 : c2692000
[  114.507089] r7 : c2692000  r6 : 00000000  r5 : 0000007a  r4 : c185f098
[  114.513653] r3 : 692158f0  r2 : c2693d68  r1 : 0000007a  r0 : 00000000
[  114.520225] Flags: nZcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[  114.527410] Control: 10c5387d  Table: 4246406a  DAC: 00000051
[  114.533192] Process v4l2-compliance (pid: 361, stack limit = 0xb5f9b13f)
[  114.539939] Stack: (0xc2693d50 to 0xc2694000)
[  114.544340] 3d40:                                     c185f098 0000007a 00000000 c05661b4
[  114.552575] 3d60: 00000000 c18e7000 00000071 692158f0 00000071 c185f098 0000007a 00000000
[  114.560807] 3d80: 00000001 c056673c c185f098 c08c42b0 00000000 c185f040 c2692000 c0569614
[  114.569038] 3da0: c2693e6c 00000024 00000010 00000009 00000003 ffff5008 00000080 692158f0
[  114.577269] 3dc0: 00008000 c2693e6c 00000000 00000000 c0245629 c08c4ec0 c19b9cdc c05710bc
[  114.585500] 3de0: c08d1364 c05a9bd4 c19b9850 c0575c7c c25f8000 c25f8000 00012cc0 c2693e6c
[  114.593730] 3e00: c2593680 00000000 c21bb3c0 c2593680 00008000 ff9200d3 c25f8000 00000051
[  114.601960] 3e20: c2693e8c 692158f0 00008000 00008000 00000001 c25f8000 c0245629 c2693e8c
[  114.610190] 3e40: c2693e6c c05759bc be9180d4 c0575ef4 c2693e6b a52a46b6 c0245629 00000000
[  114.618420] 3e60: c21bb3c0 be9180b0 01693f2c 00000000 00000000 00000100 00000000 00000000
[  114.626650] 3e80: 00000000 00000000 00000000 c25f8000 c2693f2c c0149bd4 c187cd40 e777f180
[  114.634880] 3ea0: e777f140 c2369e00 c2693eb4 c013d500 c2693ee4 c01408e4 c191201c c26d7980
[  114.643110] 3ec0: c187ccc0 00000000 00000000 c26d7980 e777f140 c187ccc0 c2692000 00000000
[  114.651340] 3ee0: c2693f2c c0799b00 c23ba540 692158f0 000beff9 c0245629 be9180b0 c21bb3c0
[  114.659570] 3f00: c19ab0b8 00000003 c21bb3c0 c2692000 be9180b0 c0246448 c0245629 c0246b50
[  114.667801] 3f20: c2693f40 ffffe000 c2693f3c c0799d68 c2693fb0 c2692000 be9180b0 c0108f8c
[  114.676032] 3f40: c2693fb0 c0110f68 00000014 692158f0 00000051 c222a0c0 0053a098 00000800
[  114.684262] 3f60: c222a0c0 00000817 be91b000 ffffffff c2693fb0 c0c0a6bc 00000000 692158f0
[  114.692493] 3f80: be9180b0 be921048 00484c40 00533d44 00000036 c0100264 c2692000 00000036
[  114.700723] 3fa0: be9180b0 c0100060 be921048 00484c40 00000003 c0245629 be9180b0 00000001
[  114.708954] 3fc0: be921048 00484c40 00533d44 00000036 00533d44 00000000 be921048 be9180b0
[  114.717184] 3fe0: 00533e14 be91805c 00484c8c b6d169fc 200f0010 00000003 00000000 00000000
[  114.725412] [<c047d818>] (regmap_read) from [<c05661b4>] (adv76xx_read_check+0x38/0x88)
[  114.733491] [<c05661b4>] (adv76xx_read_check) from [<c056673c>] (rep_write_clr_set+0x24/0x40)
[  114.742085] [<c056673c>] (rep_write_clr_set) from [<c0569614>] (adv76xx_set_edid+0x2d8/0x4a4)
[  114.750686] [<c0569614>] (adv76xx_set_edid) from [<c05a9bd4>] (rvin_s_edid+0x74/0xa0)
[  114.758588] [<c05a9bd4>] (rvin_s_edid) from [<c0575c7c>] (__video_do_ioctl+0x2c0/0x3f4)
[  114.766663] [<c0575c7c>] (__video_do_ioctl) from [<c0575ef4>] (video_usercopy+0x144/0x4c4)
[  114.774996] [<c0575ef4>] (video_usercopy) from [<c0246448>] (vfs_ioctl+0x20/0x38)
[  114.782560] [<c0246448>] (vfs_ioctl) from [<c0246b50>] (sys_ioctl+0xc0/0x778)
[  114.789762] [<c0246b50>] (sys_ioctl) from [<c0100060>] (ret_fast_syscall+0x0/0x58)
[  114.797401] Exception stack(0xc2693fa8 to 0xc2693ff0)
[  114.802497] 3fa0:                   be921048 00484c40 00000003 c0245629 be9180b0 00000001
[  114.810729] 3fc0: be921048 00484c40 00533d44 00000036 00533d44 00000000 be921048 be9180b0
[  114.818955] 3fe0: 00533e14 be91805c 00484c8c b6d169fc
[  114.824055] Code: e8bd81f0 e3e06015 eafffffa e92d4070 (e5903108) 
[  114.830342] ---[ end trace a454d33e4d6fe588 ]---

1. [PATCH] adv7604: fix HPD support for adv7611/12
2. [PATCH] drm/bridge: adv7511: fix support for large EDIDs
3. 97b34809ec240d82 ("media: staging: atomisp: reduce kernel stack usage")
4. 162d4e7221ca1dc2 ("v4l2-ctl: update EDIDs")
5. c7f03287bbd64c16 ("Move sync-with-kernel into dedicated shell script ./sync-with-kernel.sh")

> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
> index 18184297e2f0..7547afc85eb1 100644
> --- a/drivers/media/i2c/adv7604.c
> +++ b/drivers/media/i2c/adv7604.c
> @@ -73,6 +73,8 @@ MODULE_LICENSE("GPL");
> 
>  #define ADV76XX_MAX_ADDRS (3)
> 
> +#define ADV76XX_MAX_EDID_BLOCKS 4
> +
>  enum adv76xx_type {
>  	ADV7604,
>  	ADV7611,
> @@ -108,6 +110,11 @@ struct adv76xx_chip_info {
> 
>  	unsigned int edid_enable_reg;
>  	unsigned int edid_status_reg;
> +	unsigned int edid_segment_reg;
> +	unsigned int edid_segment_mask;
> +	unsigned int edid_spa_loc_reg;
> +	unsigned int edid_spa_loc_msb_mask;
> +	unsigned int edid_spa_port_b_reg;
>  	unsigned int lcf_reg;
> 
>  	unsigned int cable_det_mask;
> @@ -176,7 +183,7 @@ struct adv76xx_state {
>  	const struct adv76xx_format_info *format;
> 
>  	struct {
> -		u8 edid[256];
> +		u8 edid[ADV76XX_MAX_EDID_BLOCKS * 128];
>  		u32 present;
>  		unsigned blocks;
>  	} edid;
> @@ -2327,15 +2334,25 @@ static int adv76xx_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
>  				__func__, edid->pad, state->edid.present);
>  		return 0;
>  	}
> -	if (edid->blocks > 2) {
> -		edid->blocks = 2;
> +	if (info->type == ADV7604 && edid->blocks > ADV76XX_MAX_EDID_BLOCKS) {
> +		edid->blocks = ADV76XX_MAX_EDID_BLOCKS;
>  		return -E2BIG;
>  	}
> +
>  	pa = v4l2_get_edid_phys_addr(edid->edid, edid->blocks * 128, &spa_loc);
>  	err = v4l2_phys_addr_validate(pa, &parent_pa, NULL);
>  	if (err)
>  		return err;
> 
> +	if (!spa_loc) {
> +		/*
> +		 * There is no SPA, so just set spa_loc to 128 and pa to whatever
> +		 * data is there.
> +		 */
> +		spa_loc = 128;
> +		pa = (edid->edid[spa_loc] << 8) | edid->edid[spa_loc + 1];
> +	}
> +
>  	v4l2_dbg(2, debug, sd, "%s: write EDID pad %d, edid.present = 0x%x\n",
>  			__func__, edid->pad, state->edid.present);
> 
> @@ -2344,59 +2361,63 @@ static int adv76xx_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
>  	adv76xx_set_hpd(state, 0);
>  	rep_write_clr_set(sd, info->edid_enable_reg, 0x0f, 0x00);
> 
> -	/*
> -	 * Return an error if no location of the source physical address
> -	 * was found.
> -	 */
> -	if (edid->blocks > 1 && spa_loc == 0)
> -		return -EINVAL;
> -
>  	switch (edid->pad) {
>  	case ADV76XX_PAD_HDMI_PORT_A:
>  		state->spa_port_a[0] = pa >> 8;
>  		state->spa_port_a[1] = pa & 0xff;
>  		break;
>  	case ADV7604_PAD_HDMI_PORT_B:
> -		rep_write(sd, 0x70, pa >> 8);
> -		rep_write(sd, 0x71, pa & 0xff);
> +		rep_write(sd, info->edid_spa_port_b_reg, pa >> 8);
> +		rep_write(sd, info->edid_spa_port_b_reg + 1, pa & 0xff);
>  		break;
>  	case ADV7604_PAD_HDMI_PORT_C:
> -		rep_write(sd, 0x72, pa >> 8);
> -		rep_write(sd, 0x73, pa & 0xff);
> +		rep_write(sd, info->edid_spa_port_b_reg + 2, pa >> 8);
> +		rep_write(sd, info->edid_spa_port_b_reg + 3, pa & 0xff);
>  		break;
>  	case ADV7604_PAD_HDMI_PORT_D:
> -		rep_write(sd, 0x74, pa >> 8);
> -		rep_write(sd, 0x75, pa & 0xff);
> +		rep_write(sd, info->edid_spa_port_b_reg + 4, pa >> 8);
> +		rep_write(sd, info->edid_spa_port_b_reg + 5, pa & 0xff);
>  		break;
>  	default:
>  		return -EINVAL;
>  	}
> 
> -	if (info->type == ADV7604) {
> -		rep_write(sd, 0x76, spa_loc & 0xff);
> -		rep_write_clr_set(sd, 0x77, 0x40, (spa_loc & 0x100) >> 2);
> -	} else {
> -		/* ADV7612 Software Manual Rev. A, p. 15 */
> -		rep_write(sd, 0x70, spa_loc & 0xff);
> -		rep_write_clr_set(sd, 0x71, 0x01, (spa_loc & 0x100) >> 8);
> -	}
> +	if (info->edid_spa_loc_reg) {
> +		u8 mask = info->edid_spa_loc_msb_mask;
> 
> -	if (spa_loc) {
> -		edid->edid[spa_loc] = state->spa_port_a[0];
> -		edid->edid[spa_loc + 1] = state->spa_port_a[1];
> +		rep_write(sd, info->edid_spa_loc_reg, spa_loc & 0xff);
> +		rep_write_clr_set(sd, info->edid_spa_loc_reg + 1,
> +				  mask, (spa_loc & 0x100) ? mask : 0);
>  	}
> 
> +	edid->edid[spa_loc] = state->spa_port_a[0];
> +	edid->edid[spa_loc + 1] = state->spa_port_a[1];
> +
>  	memcpy(state->edid.edid, edid->edid, 128 * edid->blocks);
>  	state->edid.blocks = edid->blocks;
>  	state->aspect_ratio = v4l2_calc_aspect_ratio(edid->edid[0x15],
>  			edid->edid[0x16]);
>  	state->edid.present |= 1 << edid->pad;
> 
> -	err = edid_write_block(sd, 128 * edid->blocks, state->edid.edid);
> +	rep_write_clr_set(sd, info->edid_segment_reg,
> +			  info->edid_segment_mask, 0);
> +	err = edid_write_block(sd, 128 * min(edid->blocks, 2U), state->edid.edid);
>  	if (err < 0) {
>  		v4l2_err(sd, "error %d writing edid pad %d\n", err, edid->pad);
>  		return err;
>  	}
> +	if (edid->blocks > 2) {
> +		rep_write_clr_set(sd, info->edid_segment_reg,
> +				  info->edid_segment_mask,
> +				  info->edid_segment_mask);
> +		err = edid_write_block(sd, 128 * (edid->blocks - 2),
> +				       state->edid.edid + 256);
> +		if (err < 0) {
> +			v4l2_err(sd, "error %d writing edid pad %d\n",
> +				 err, edid->pad);
> +			return err;
> +		}
> +	}
> 
>  	/* adv76xx calculates the checksums and enables I2C access to internal
>  	   EDID RAM from DDC port. */
> @@ -2989,6 +3010,11 @@ static const struct adv76xx_chip_info adv76xx_chip_info[] = {
>  		.num_dv_ports = 4,
>  		.edid_enable_reg = 0x77,
>  		.edid_status_reg = 0x7d,
> +		.edid_segment_reg = 0x77,
> +		.edid_segment_mask = 0x10,
> +		.edid_spa_loc_reg = 0x76,
> +		.edid_spa_loc_msb_mask = 0x40,
> +		.edid_spa_port_b_reg = 0x70,
>  		.lcf_reg = 0xb3,
>  		.tdms_lock_mask = 0xe0,
>  		.cable_det_mask = 0x1e,
> @@ -3039,6 +3065,8 @@ static const struct adv76xx_chip_info adv76xx_chip_info[] = {
>  		.num_dv_ports = 1,
>  		.edid_enable_reg = 0x74,
>  		.edid_status_reg = 0x76,
> +		.edid_segment_reg = 0x7a,
> +		.edid_segment_mask = 0x01,
>  		.lcf_reg = 0xa3,
>  		.tdms_lock_mask = 0x43,
>  		.cable_det_mask = 0x01,
> @@ -3083,6 +3111,11 @@ static const struct adv76xx_chip_info adv76xx_chip_info[] = {
>  		.num_dv_ports = 1,			/* normally 2 */
>  		.edid_enable_reg = 0x74,
>  		.edid_status_reg = 0x76,
> +		.edid_segment_reg = 0x7a,
> +		.edid_segment_mask = 0x01,
> +		.edid_spa_loc_reg = 0x70,
> +		.edid_spa_loc_msb_mask = 0x01,
> +		.edid_spa_port_b_reg = 0x52,
>  		.lcf_reg = 0xa3,
>  		.tdms_lock_mask = 0x43,
>  		.cable_det_mask = 0x01,

-- 
Regards,
Niklas Söderlund
