Return-Path: <linux-media+bounces-53155-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAO1Km4PnGml/QMAu9opvQ
	(envelope-from <linux-media+bounces-53155-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:27:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 549B417307D
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2438A3032987
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 08:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA6734D3A5;
	Mon, 23 Feb 2026 08:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="YuCSGlnB"
X-Original-To: linux-media@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C4B34C818;
	Mon, 23 Feb 2026 08:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771835206; cv=none; b=VWI3Ac6blQSe/0h5zR/MhU+HUX4BeiIsydoNklr55GB2FYHcK0w7Te8W1ExtBQlgyAdRDPzgJqbXaVqk1SEIIiiW6REhBAhto1KDlLTiT96AvfcMiP79THjbGqyOn9mmimNlwPkdqiWaBZi+wXj4KT4ICL4suuXryabM2ZwhQxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771835206; c=relaxed/simple;
	bh=sm6q1+ERW/BaOcu2jshdc2Eho9GqqWDTk0xMpvA9awk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WH75nYszYLDFqvtBcTTPPqq6GP8pmBRxow43Japq5IWrWQaCc1WFj7WRG3GUwXlGcuTNdKl+PsvvHhk12mB9QhNiNUK3puMQRBzuyz+xTuur5Pu1JFcvzypPLDHw04TtErWwMgcbEgky03SWHGoKayke7fPEAEoS6KU/Wms8F4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=YuCSGlnB; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4fKDTt3tKQz6D9H;
	Mon, 23 Feb 2026 09:26:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1771835202;
	bh=sm6q1+ERW/BaOcu2jshdc2Eho9GqqWDTk0xMpvA9awk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YuCSGlnBs6uo8rYhCNuWFT1c8Nrr5ASloi7qT7mF6rEETrT6fqzQHm1PppOlqRB3X
	 /Z1dVLkH0NnDHaSlzHB7FdKSQAwWemcUnvBA2IAHVtad4JDZ65JoU80wgT5yNU+AtR
	 +KSwtgqRpEYlWRx+SMK+CaRrmKXQUt2eNkSvSjCVnz31bzIxkneAxxPYNhDWe8Iw2F
	 EEmyuRfpdh3e+udFOCA5NoYmj/ROMlLX69rcUYGqvXTu/MEy95St7o41h7ZXdngRWv
	 KGkXt5WIFJMSo0v65jT1fak9S8UFFwSde+LDO40KhyDdbql1RzAW/RwFsjncHy2Xzc
	 cmwLen2M2f33A==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4fKDTt36vWz4xZG;
	Mon, 23 Feb 2026 09:26:42 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fKDTp6ryqz8sWT;
	Mon, 23 Feb 2026 09:26:38 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id E600866F46;
	Mon, 23 Feb 2026 09:26:37 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <068a5363-de97-4d67-94a9-c9a2baed68b0@leemhuis.info>
Date: Mon, 23 Feb 2026 09:26:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Display freeze on VT switch back to X11 since v6.16
To: Ricardo Ribalda <ribalda@chromium.org>,
 =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
Cc: stable@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: 
 <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
 <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177183519851.1298619.12932841076943444255@mxe9fb.netcup.net>
X-NC-CID: AQ3l18WOcfyVsWr3MsuKtObqMCjuDgmJUet3MF1F4RC9SMhvp/U=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53155-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,leemhuis.info:mid,leemhuis.info:dkim];
	FREEMAIL_TO(0.00)[chromium.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[leemhuis.info];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,kernel.org,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,lists.freedesktop.org,lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[regressions@leemhuis.info,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 549B417307D
X-Rspamd-Action: no action



On 2/23/26 09:10, Ricardo Ribalda wrote:
> Hi Andrés
> 
> Thanks for doing the bisecting
> 
> On Sun, 22 Feb 2026 at 22:56, Andrés Pérez <andres.f.perez@gmail.com> wrote:
>>
>> # OVERVIEW
>>
>> Since kernel v6.16.1, switching from an X11 session to a text VT and back
>> freezes the display on a ThinkPad P15 Gen 2. The system remains responsive
>> over SSH; only the display is frozen. Bisecting identified commit
>> d1b618e7954802fe ("media: uvcvideo: Do not turn on the camera for some
>> ioctls") as the trigger. Reverting the logic change in that commit
>> fixes VT switching
>> on v6.16.1, v6.17.9, and v6.18.9, but that is not an actual solution. Wayland
>> compositors (e.g., river and sway) are not affected.
>>
>> Last good:  v6.15.9
>> First bad:  v6.16.1
>> Bisect result: d1b618e7954802fe media: uvcvideo: Do not turn on the
>> camera for some ioctls
>>
>> ## Hardware:   Lenovo ThinkPad P15 Gen 2i (20YQ0031US)
>> CPU:        Intel Core i7-11800H (Tiger Lake-H)
>> iGPU:        Intel UHD Graphics (TGL GT1)
>> dGPU:       NVIDIA T1200 (not involved in eDP output; driver: nvidia-open)

Could this be caused by nvidia's own driver, even if it is not supposed
to be involved? Might be worth ruling out with a proper vanilla kernel,
ideally really fresh, so 7.0-rc1.

Ciao, Thorsten

>> Display:    15.6" 1920x1080 eDP, 10 bpc capable (EDID 1.4)
>> Webcam:     Integrated Camera on PCH xHCI (Bus 003 Port 004)
>> Firmware:   LENOVO N37ET61W (1.97)
>> OS:         Arch Linux, Nix home-manager, X11 + xmonad, no display manager
>>
>> ## Symptoms and reproduction steps:
>> 1. Boot, start X11 on tty1 (startx).
>> 2. Switch to tty2 (Ctrl+Alt+F2): works.
>> 3. Switch back to tty1 (Ctrl+Alt+F1): display freezes.
>>    - Frozen on the last frame shown before switching away.
>>    - System is fully responsive over SSH.
>>    - Other VTs switch normally between each other as long as X11 is
>> not active on them.
>>    - Killing X does not recover the display. A reboot is required.
>>
>> # DEBUG ANALYSIS
>>
>> On v6.16.1, the VT switch back to X triggers a full modeset due to pipe
>> configuration mismatches detected by intel_pipe_config_compare:
>>
>> [drm:intel_pipe_config_compare] fastset requirement not met in pipe_bpp
>>   (expected 30, found 24)
>> [drm:intel_pipe_config_compare] fastset requirement not met in dp_m_n
>>   (expected link 269484/524288, found link 336855/524288)
>> [drm:intel_pipe_config_compare] fastset requirement not met in dpll_hw_state
>>   (expected cfgcr0: 0xe001a5, found cfgcr0: 0x1c2)
>> [drm:intel_pipe_config_compare] fastset requirement not met in port_clock
>>   (expected 270000, found 216000)
>> [drm:intel_atomic_check] forcing full modeset
>>
>> On v6.15.9, the same VT switch shows no such messages.
>> no pipe_config_compare runs, no modeset, no freeze.
>>
>> # BISECT AND VERIFICATION
>>
>> The bisect converged on d1b618e7954802fe in the uvcvideo driver. This
>> commit adds a switch statement to uvc_v4l2_unlocked_ioctl that allows
>> certain V4L2 IOCTLS to call video_ioctl2 directly without first calling
>> uvc_pm_get/uvc_pm_put. Prior to this commit, all ioctls called uvc_pm_get
>> before video_ioctl2.
>>
>> ## VT switching verification across kernel versions:
>>
>>   v6.12.74 arch pkg:   WORKS
>>   v6.15.9 arch pkg:    WORKS
>>   v6.15.9 from source: WORKS
>>   v6.16.1 with d1b618e reverted:     WORKS
>>   v6.17.9 with PM wrapping restored: WORKS
>>   v6.18.9 with PM wrapping restored: WORKS
>>
>>   v6.16.1 from source:  FREEZES
>>   v6.16.1 arch pkg:     FREEZES
>>   v6.17.9 arch pkg:     FREEZES
>>   v6.18.9 from source:  FREEZES
>>   v6.18.9 arch pkg:     FREEZES
>>
>> ## Things that do not eliminate the freeze
>>
>>   - module_blacklist=uvcvideo on boot
>>   - CONFIG_USB_VIDEO_CLASS=n (compiled out)
> 
> This is puzzling me a bit... You are saying that if you do not build
> the uvc driver, the freeze is still happening?
> 
> Am I understanding this correctly?
> 
>>   - i915.enable_psr=0
>>   - Bypassing intel_vrr_transcoder_enable/disable (no-op)
>>   - xrandr --output eDP-1 --set "max bpc" 10
>>   - Xorg config FBDepth 30 (No effect on pipe_bpp)
>>
>> ## Workaround patch
>>
>> Reverting the optimization from d1b618e to restore the unconditional
>> uvc_pm_get/put wrapping for all ioctls. This is not a proper fix.
>>
>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>> index 9e4a251eca88..15057b47ec4f 100644
>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>> @@ -1199,33 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
>>   unsigned int converted_cmd = v4l2_translate_cmd(cmd);
>>   int ret;
>>
>> - /* The following IOCTLs need to turn on the camera. */
>> - switch (converted_cmd) {
>> - case UVCIOC_CTRL_MAP:
>> - case UVCIOC_CTRL_QUERY:
>> - case VIDIOC_G_CTRL:
>> - case VIDIOC_G_EXT_CTRLS:
>> - case VIDIOC_G_INPUT:
>> - case VIDIOC_QUERYCTRL:
>> - case VIDIOC_QUERYMENU:
>> - case VIDIOC_QUERY_EXT_CTRL:
>> - case VIDIOC_S_CTRL:
>> - case VIDIOC_S_EXT_CTRLS:
>> - case VIDIOC_S_FMT:
>> - case VIDIOC_S_INPUT:
>> - case VIDIOC_S_PARM:
>> - case VIDIOC_TRY_EXT_CTRLS:
>> - case VIDIOC_TRY_FMT:
>> - ret = uvc_pm_get(handle->stream->dev);
>> - if (ret)
>> - return ret;
>> - ret = video_ioctl2(file, cmd, arg);
>> - uvc_pm_put(handle->stream->dev);
>> + ret = uvc_pm_get(handle->stream->dev);
>> + if (ret)
>>   return ret;
>> - }
>> -
>> - /* The other IOCTLs can run with the camera off. */
>> - return video_ioctl2(file, cmd, arg);
>> + ret = video_ioctl2(file, cmd, arg);
>> + uvc_pm_put(handle->stream->dev);
>> + return ret;
>>  }
>>
>>  const struct v4l2_ioctl_ops uvc_ioctl_ops = {
>>
>> Andrés
>>
> 
> 


