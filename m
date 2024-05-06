Return-Path: <linux-media+bounces-10884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1BC8BD00C
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 16:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 969501F20F7C
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 14:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E76513D8A7;
	Mon,  6 May 2024 14:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ZrKQo4LL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m19731107.qiye.163.com (mail-m19731107.qiye.163.com [220.197.31.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657A513D882;
	Mon,  6 May 2024 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715005216; cv=none; b=qtzmFVqQOHmnvyNIMMBx6ADXQ3Yv0r08QbvvAX5Fa1OKZm0Q9FDc7vtsj/vVSMFiQFhtmXC/q1cHKfRUSxH7RiyH5wqVLiUuHADchNbSfa5Crq978mF627cRA481n1s9/LzPEbIPHWJi33Uev1AbV9+Yn4733h8IYn8veqiqIWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715005216; c=relaxed/simple;
	bh=pyfAwvjWpp9yO49mvYPG4/3Ctuy4s/rdglAXCFfPT4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FnK1Vjgls9XuajwTmkrglwmzh18IH694vYebh31X4dP8vae4f8iBp7etw3W/eGeSvhRxRfVn/y+cMoagozp0LOiBUKNBEwUAK2V+0oAYewqSWcaXkbSwCJnhnPnfby40EVpgeywcZ7ARj52eUX+gQCMv/8dMsq9pds+0PgpMObQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ZrKQo4LL; arc=none smtp.client-ip=220.197.31.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=ZrKQo4LLpXHMy8d4LXYD5iTRkQxizuI2VtgsgE+tJYIizoDN242zSfeuyZB6BxBPQMhQ7sm0BOLRbctDuuDGN2P8iej4bSnj/drKmF3/FNT3RqhqTyIlvpEtD8A/Fe6P9zFf5Mb0Hkg6Vj8aO4luGZv0MwCJTidSzkGU/cgb2Ro=;
	c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=GJuF3hTrQtUJMZ2uZFlEfERKTqM4rnSOLJVMQPzCloc=;
	h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 739F18404C4;
	Mon,  6 May 2024 16:23:00 +0800 (CST)
Message-ID: <ed035e25-dd9e-4041-b413-7511544d0aba@rock-chips.com>
Date: Mon, 6 May 2024 16:22:46 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 27/28] drm/rockchip: inno_hdmi: Switch to HDMI
 connector
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240423-kms-hdmi-connector-state-v12-0-3338e4c0b189@kernel.org>
 <20240423-kms-hdmi-connector-state-v12-27-3338e4c0b189@kernel.org>
 <68eba0ec-bf9c-4d76-a362-5304a4cb61d5@rock-chips.com>
 <20240506-eccentric-wren-of-peace-819aad@houat>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20240506-eccentric-wren-of-peace-819aad@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhlNTFZOGhpJGk5ITU1IGUlVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5IVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a8f4cffc4c703a4kunm739f18404c4
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PEk6STo6DDMDFBdDQhojTDg#
	DkgaCQNVSlVKTEpPQkNITENJS09JVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBTU1JSzcG

Hi Maxime,

On 5/6/24 15:59, Maxime Ripard wrote:
> Hi Andy,
> 
> Thanks a lot for giving it a try
> 
> All the issues you raised in your review are fixed.
> 
> On Sat, Apr 27, 2024 at 06:44:54PM GMT, Andy Yan wrote:
>> And after this whole series applied on linux 6.9-rc4, the display on rk3036 kylin is lost, I get
>> the following error:
>> [  178.999421] rockchip-drm display-subsystem: [drm:drm_atomic_check_only] checking 87b7fbde
>> [  178.999471] rockchip-drm display-subsystem: [drm:drm_atomic_helper_check_modeset] [CRTC:35:crtc-0] mode changed
>> [  178.999498] rockchip-drm display-subsystem: [drm:drm_atomic_helper_check_modeset] [CRTC:35:crtc-0] enable changed
>> [  178.999521] rockchip-drm display-subsystem: [drm:drm_atomic_helper_check_modeset] [CRTC:35:crtc-0] active changed
>> [  178.999547] rockchip-drm display-subsystem: [drm:drm_atomic_helper_check_modeset] Updating routing for [CONNECTOR:37:HDMI-A-1]
>> [  178.999575] rockchip-drm display-subsystem: [drm:drm_atomic_helper_check_modeset] [CONNECTOR:37:HDMI-A-1] using [ENCODER:36:TMDS-36] on [CRTC:35:crtc-0]
>> [  178.999604] rockchip-drm display-subsystem: [drm:drm_atomic_helper_connector_hdmi_check] Trying with a 8 bpc output
>> [  178.999636] rockchip-drm display-subsystem: [drm:drm_atomic_helper_connector_hdmi_check] Trying RGB output format
>> [  178.999730] rockchip-drm display-subsystem: [drm:drm_atomic_helper_connector_hdmi_check] RGB Format, checking the constraints.
>> [  178.999757] rockchip-drm display-subsystem: [drm:drm_atomic_helper_connector_hdmi_check] RGB output format not supported with 8 bpc
>> [  178.999783] rockchip-drm display-subsystem: [drm:drm_atomic_helper_connector_hdmi_check] Failed. No Format Supported for that bpc count.
>> [  178.999810] rockchip-drm display-subsystem: [drm:drm_atomic_helper_check_modeset] [CONNECTOR:37:HDMI-A-1] driver check failed
>> [  178.999836] rockchip-drm display-subsystem: [drm:drm_atomic_check_only] atomic driver check for 87b7fbde failed: -22
>> [  178.999868] rockchip-drm display-subsystem: [drm:drm_atomic_state_default_clear] Clearing atomic state 87b7fbde
>> [  178.999898] [drm:drm_mode_object_put] OBJ ID: 37 (4)
>> [  178.999922] [drm:drm_mode_object_put] OBJ ID: 37 (3)
>> [  178.999944] [drm:drm_mode_object_put] OBJ ID: 40 (1)
>> [  178.999971] [drm:drm_mode_object_put] OBJ ID: 39 (2)
> 
> Which kind of display are you testing with? The only reason it could do
> so is if the display claim it doesn't support RGB in its EDID which is
> contradicting the HDMI spec. Are you using an Analog display by any
> chance? or the built-in EDIDs through the drm.edid_firmware mechanism?

It is because there is something wrong(I still don't know why) with the DDC on my board.
It always failed to read edid when it first bootup, that means inno_hdmi_connector_get_modes
will return 0.

and in function

drm_helper_probe_single_connector_modes:

         count = drm_helper_probe_get_modes(connector);

         if (count == 0 && (connector->status == connector_status_connected ||
                            connector->status == connector_status_unknown)) {
                 count = drm_add_modes_noedid(connector, 1024, 768);

                 /*
                  * Section 4.2.2.6 (EDID Corruption Detection) of the DP 1.4a
                  * Link CTS specifies that 640x480 (the official "failsafe"
                  * mode) needs to be the default if there's no EDID.
                  */
                 if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
                         drm_set_preferred_mode(connector, 640, 480);
         }
drm_add_modes_noedid will not initialize display_info.

> 
> Maxime

