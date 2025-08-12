Return-Path: <linux-media+bounces-39479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B00C8B219A7
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 02:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B65D817FA2D
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 00:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845D1F50F;
	Tue, 12 Aug 2025 00:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="EeBXQW7V"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BEA1DE8AD
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 00:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754956929; cv=none; b=qvshJOfMLt6hFVLmqffiRBRiDT9fhdx9Ku86fzTqmF+kM5uQHgGAY6SaqBQT0Ow1ApOv6eeWefelNzjTbLzeY191zPN3ca3JnF6bk5qgf8L4maFoLCtAKopsK2uYc9FdiUotp7GJtNBjorZUSaO50PL+ULYRCcSdLNaYzAmzNXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754956929; c=relaxed/simple;
	bh=h3XIrRi4Eh1r1otKGR/Gs4MjvshCnmwLL1ZN39prrfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rDD0/3VT8T4mR5o3k04Y0qHod+wO0qeqBgqhAp8OOPD+k2YqQ5aJKqAjBIEVqt45utoZn+UdnV8z1gperyVUTcC9TGo8L5P2uHFKmpbBt7LgPYgNfaXo8MAxKphvN8f0/jMWkJgMJ+cIm6TPjAc3HEkN561q8xbLmLYtBLM/X9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=EeBXQW7V; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1754956920;
 bh=LksAwlMK4Zcalf/VkDre46LCCYPoR3RkYJEdyB3ZKtw=;
 b=EeBXQW7Vof3Srqrc9frLmPydDGmzghR1wpRB41M6Z2grUMK81zh89emtHi27RFOAU5prY6P76
 LWtfKAZ0jq09PtH2cBpzYXcXvpkYIJ2dHMT6Ac53tdvkjTqRWe6yAqTAf2uG6wg78ZeqBDsG/Z3
 jULBB7V5GNaNyG5tN7T0Hyypo61YftQHLjfvr97A4abo1r093QZl19k1Ds6QZYAz+xvFAAf/C1a
 OlZxBaA56kikFkzqX1gewyRnM/CWUOjcYi0pv4nr80XoIhMj+GP8j5cnXcPuEtjlmB2xsB7KdPJ
 3zh8NdRH5HRXCamxgN0/n8QIxCmNHEVFVh1O6klVbtqA==
X-Forward-Email-ID: 689a841810bdea4a6d7c54b0
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <1dd29158-0660-4254-ac00-1316768d9b82@kwiboo.se>
Date: Tue, 12 Aug 2025 02:00:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Alex Bee <knaerzche@gmail.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <50162371fd54fc976a84fcf57c9b69112a892c46.camel@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <50162371fd54fc976a84fcf57c9b69112a892c46.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nicolas,

On 8/11/2025 11:52 PM, Nicolas Dufresne wrote:
> Le dimanche 10 août 2025 à 21:24 +0000, Jonas Karlman a écrit :
>> This series add a HEVC backend to the Rockchip Video Decoder driver.
>>
>> With the dependent H.264 High 10 and 4:2:2 profile support series
>> finally merged there is finally time to send a v2 with minor changes and
>> a suggested code style fix of this series. v1 of this series has been
>> fully functional up until recent unstaging of the rkvdec driver.
>>
>> A version of this HEVC backend has been in use by the LibreELEC distro
>> for the past 5+ years [1]. It was initially created based on a copy of
>> the H264 backend, unstable HEVC uAPI controls and a cabac table + scaling
>> matrix functions shamelessly copied 1:1 from the Rockchip mpp library.
>>
>> It has since then been extended to use the stable HEVC uAPI controls and
>> improved opon e.g. to include support for rk3288 and fix decoding issues
>> by Alex Bee and Nicolas Dufresne.
>>
>> The version submitted in this series is based on the code currently used
>> by the LibreELEC distro, excluding hard/soft reset, and with cabac table
>> and scaling matrix functions picked from Sebastian Fricke prior series
>> to add a HEVC backend [2].
>>
>> Big thanks to Alex Bee, Nicolas Dufresne and Sebastian Fricke for making
>> this series possible!
>>
>> Patch 1 add the new HEVC backend.
>> Patch 2-3 add variants support to the driver.
>> Patch 4 add support for a rk3288 variant.
>> Patch 5 add a rk3328 variant to work around hw quirks.
>> Patch 6-7 add device tree node for rk3288.
>>
>> This was tested on a ROCK Pi 4 (RK3399) and Rock64 (RK3328):
>>
>>   v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
>>   ...
>>   Total for rkvdec device /dev/video1: 49, Succeeded: 49, Failed: 0, Warnings:
>> 0
>>
>>   Running test suite JCT-VC-HEVC_V1 with decoder FFmpeg-H.265-v4l2request
>>   ...
>>   Ran 137/147 tests successfully
> 
> I've also tested RK3399 using Renegade Elite from Libre Computer, though with
> GStreamer. My results for this suite is 134/147, with failing tests being:
> 
> - DBLK_D_VIXS_2
> - DSLICE_A_HHI_5
> - DELTAQP_A_BRCM_4
> - EXT_A_ericsson_4
> - PICSIZE_A_Bossen_1 (expected)
> - PICSIZE_B_Bossen_1 (expected)
> - PICSIZE_C_Bossen_1 (expected)
> - PICSIZE_D_Bossen_1 (expected)
> - SAODBLK_A_MainConcept_4
> - SAODBLK_B_MainConcept_4
> - TSUNEQBD_A_MAIN10_Technicolor_2 (expected)
> - WPP_D_ericsson_MAIN10_2
> - WPP_D_ericsson_MAIN_2
> 
> Please share your list, this seems big enough difference to be worth making sure
> we did not diverge somewhere between both interpretation of the V4L2 spec.
> GStreamer has been mostly tested with MTK driver so far. Can you also share a
> link to the latest ffmpeg tree you are using (since its not upstream FFMPEG) ?

As mentioned in this cover letter the full fluster report can be found
at [3], and has links to the trees used to produce the raw report data,
have now also added some more details of versions used.

The tests from the report was running on a RK3399 Rock Pi 4B v1.5.

- Linux: 6.17-rc1 + patches
- fluster: 0.4.1 + patch
- FFmpeg: 7.1.1 + patches
- GStreamer: 1.27.1

JCT-VC-HEVC_V1 on GStreamer-H.265-V4L2SL-Gst1.0:

- DBLK_D_VIXS_2 (fail)
- DSLICE_A_HHI_5 (fail)
- EXT_A_ericsson_4 (fail)
- PICSIZE_A_Bossen_1 (error)
- PICSIZE_B_Bossen_1 (error)
- PICSIZE_C_Bossen_1 (error)
- PICSIZE_D_Bossen_1 (error)
- SAODBLK_A_MainConcept_4 (fail)
- SAODBLK_B_MainConcept_4 (fail)
- TSUNEQBD_A_MAIN10_Technicolor_2 (error)

JCT-VC-HEVC_V1 on FFmpeg-H.265-v4l2request:

- CONFWIN_A_Sony_1 (fail)
- EXT_A_ericsson_4 (fail)
- PICSIZE_A_Bossen_1 (error)
- PICSIZE_B_Bossen_1 (error)
- PICSIZE_C_Bossen_1 (error)
- PICSIZE_D_Bossen_1 (error)
- SAODBLK_A_MainConcept_4 (fail)
- SAODBLK_B_MainConcept_4 (fail)
- TSUNEQBD_A_MAIN10_Technicolor_2 (error)
- VPSSPSPPS_A_MainConcept_1 (error)

The WPP_*_ericsson_MAIN* samples get a mixed Fail/Success when running
the full test suite for FFmpeg-H.265-v4l2request, however retrying them
individually they will eventually report Success. Not sure this is an
issue with FFmpeg or the driver, since they pass with GStreamer.

Interesting that DBLK_D_VIXS_2, DSLICE_A_HHI_5 and CONFWIN_A_Sony_1
consistently differs between GStreamer and FFmpeg.

[3] https://gist.github.com/Kwiboo/bedf1f447b50921ffbe26cb99579582d

> 
> Detlev reports 146/147 on newer hardware using GStreamer, failing
> TSUNEQBD_A_MAIN10_Technicolor_2 (9bit chroma) only. On Detlev side, it will we
> important to check why 8K videos (PICSIZE*) passes with a single core, perhaps
> we accidently use both cores ?
> 
> Note, also expected, we failt JCT-VC-SCC, JCT-VC-MV-HEVC, and JCT-VC-RExt passes
> 2/49. This last suite is pretty new in fluster.

Following is the FFmpeg-H.265-v4l2request result with this:

- JCT-VC-MV-HEVC 9/9
- JCT-VC-RExt 2/49
- JCT-VC-SCC 0/15
- JCT-VC-3D-HEVC 27/27
- JCT-VC-SHVC 1/69

Regards,
Jonas

> 
> regards,
> Nicolas
> 
>>
>>   Running test suite JCT-VC-MV-HEVC with decoder FFmpeg-H.265-v4l2request
>>   ...
>>   Ran 9/9 tests successfully
>>
>> And on a TinkerBoard (RK3288):
>>
>>   v4l2-compliance 1.30.1, 32 bits, 32-bit time_t
>>   ...
>>   Total for rkvdec device /dev/video3: 49, Succeeded: 49, Failed: 0, Warnings:
>> 0
>>
>>   Running test suite JCT-VC-HEVC_V1 with decoder FFmpeg-H.265-v4l2request
>>   ...
>>   Ran 137/147 tests successfully
>>
>>   Running test suite JCT-VC-MV-HEVC with decoder FFmpeg-H.265-v4l2request
>>   ...
>>   Ran 9/9 tests successfully
>>
>> The WPP_x_ericsson tests from test suite JCT-VC-HEVC_V1 has been showing
>> a mix of both Success and/or Fail result for FFmpeg-H.265-v4l2request.
>>
>> Full summary of fluster run can be found at [3].
>>
>> Please note that there is a known issue with concurrent decoding,
>> decoding errors in one decode session may affect a separate session.
>> The only known mitigation to this is to pause decoding for some time
>> and/or do a full HW reset, something to handle in future series.
>>
>> Changes in v2:
>> - Rabase after h264 high10/422 merge and unstaging of rkvdec driver
>> - Use new_value in transpose_and_flatten_matrices()
>> - Add NULL check for ctrl->new_elems in rkvdec_hevc_run_preamble()
>> - Set RKVDEC_WR_DDR_ALIGN_EN for RK3328
>> - Adjust code style in rkvdec_enum_coded_fmt_desc()
>> - Collect a-b tag
>> - Drop merged vdec node reg size patches
>> Link to v1:
>> https://lore.kernel.org/linux-media/20231105233630.3927502-1-jonas@kwiboo.se
>>
>> [1]
>> https://github.com/LibreELEC/LibreELEC.tv/blob/master/projects/Rockchip/patches/linux/default/linux-2000-v4l2-wip-rkvdec-hevc.patch
>> [2]
>> https://lore.kernel.org/linux-media/20230101-patch-series-v2-6-2-rc1-v2-0-fa1897efac14@collabora.com/
>> [3] https://gist.github.com/Kwiboo/bedf1f447b50921ffbe26cb99579582d
>>
>> Alex Bee (4):
>>   media: rkvdec: Add variants support
>>   media: rkvdec: Add RK3288 variant
>>   media: rkvdec: Disable QoS for HEVC and VP9 on RK3328
>>   ARM: dts: rockchip: Add vdec node for RK3288
>>
>> Jonas Karlman (3):
>>   media: rkvdec: Add HEVC backend
>>   media: rkvdec: Implement capability filtering
>>   media: dt-bindings: rockchip,vdec: Add RK3288 compatible
>>
>>  .../bindings/media/rockchip,vdec.yaml         |    1 +
>>  arch/arm/boot/dts/rockchip/rk3288.dtsi        |   17 +-
>>  .../media/platform/rockchip/rkvdec/Makefile   |    2 +-
>>  .../rockchip/rkvdec/rkvdec-hevc-data.c        | 1848 +++++++++++++++++
>>  .../platform/rockchip/rkvdec/rkvdec-hevc.c    |  826 ++++++++
>>  .../platform/rockchip/rkvdec/rkvdec-regs.h    |    4 +
>>  .../platform/rockchip/rkvdec/rkvdec-vp9.c     |   10 +
>>  .../media/platform/rockchip/rkvdec/rkvdec.c   |  184 +-
>>  .../media/platform/rockchip/rkvdec/rkvdec.h   |   15 +
>>  9 files changed, 2886 insertions(+), 21 deletions(-)
>>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data.c
>>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c


