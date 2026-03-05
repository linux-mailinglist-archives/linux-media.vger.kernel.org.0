Return-Path: <linux-media+bounces-54664-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBzABEWtqWn+CAEAu9opvQ
	(envelope-from <linux-media+bounces-54664-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 17:20:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E50A215569
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 17:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39620304A896
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 16:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7B73CF661;
	Thu,  5 Mar 2026 16:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="f6hFqaVd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48E43CCA17
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 16:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772727515; cv=none; b=uHDHD0xf8b7lPKENzKSJDUD0MX++kF3Q6CS5R5zGnwJoVxlG5icYp4lBFg/wojqBUh5YSZw7iKsUrTdecXGg0szcB6WRby+Dpj9AGOGIY7EYU5vTxdRgjJTIm2tQmdGT0zsGy67zS8KXjC4ge6Eqqra9GRJ3AD+XXD7c7SvRXlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772727515; c=relaxed/simple;
	bh=3xnO05k5wJ+lh4xrOpSFk9v4j+/Qn4mh6wCduyHmpNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ns3+7N9i3Jwx92gQD+c3d0NgFAJoCVFqcJ/Yf1PCyez++QdT+PkOtpKLFu07dvDXVwT6xsDKm17SmiYgS6ngqABkDfqOOELViuxTPmp/Opq9hKokDxFgTmSj/kxYhzvFOrcpyvckmcy0GdRTq8mHEzXWYRS2/NACOICMGFkHOAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=f6hFqaVd; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1772727506;
 bh=chOFspLzOmGvjGy3O0Rh29kEccThX8TLl/uY+NRHF2E=;
 b=f6hFqaVd4AvG9DRdw1aQ03rck94cVDUWP37/UZVYn3cRqkhWFfpZ4HQxejgnrJbBEo/v3ySyD
 D3XYAaoweuMl/S+H0PHLYhmUl9AWC4dKAp9x8cSHItZicKeKrGt9vThZFi/0QJqI8x2i08UEzDy
 HkCbSHSkHBOE0NJmyu5BbUqQTvFMJI5LRXqN0RNOO+1C87iKOOLvZSyVhL4dScgW33gLFXHPUyW
 VLhMqN8h2wHFqYAGkvX2IpxVPlfIn+oMCsJsQ8rcSxo7SiLNbCu0BtJYIU2so072DnulUndV8yn
 xK5oyH4L48/HJye+yFS7+hEhPbV85A4aKQBIaK7qWtzQ==
X-Forward-Email-ID: 69a9acccd9a7f34afb072f9d
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.6.39
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <1d666c43-688b-4cc1-aeed-5296d2608327@kwiboo.se>
Date: Thu, 5 Mar 2026 17:18:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] Raspberry Pi HEVC decoder driver
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 review list <kernel-list@raspberrypi.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 5E50A215569
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kwiboo.se,quarantine];
	R_DKIM_ALLOW(-0.20)[kwiboo.se:s=fe-e1b5cab7be];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54664-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[raspberrypi.com,linux.intel.com,ideasonboard.com,kernel.org,broadcom.com,vanguardiasur.com.ar,collabora.com,kynesim.co.uk,gmx.net,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonas@kwiboo.se,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kwiboo.se:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,kwiboo.se:dkim,kwiboo.se:mid,ffmpeg.org:url]
X-Rspamd-Action: no action

Hi Dave,

On 3/4/2026 3:05 PM, Dave Stevenson wrote:
> Hi All
> 
> This has been in the pipeline for a while, but I've finally cleaned
> up our HEVC decoder driver to be in a shape to upstream.
> John Cox has done almost all of the work under contract to Raspberry
> Pi, and I'm largely just doing the process of patch curation and
> sending.
> 
> Thanks
>   Dave
> 
> v4l2-compliance 1.33.0-5448, 64 bits, 64-bit time_t
> v4l2-compliance SHA: bd0aabb96710 2026-02-09 17:38:28
> 
> Compliance test for rpi-hevc-dec device /dev/video0:
> 
> Driver Info:
> 	Driver name      : rpi-hevc-dec
> 	Card type        : rpi-hevc-dec
> 	Bus info         : platform:rpi-hevc-dec
> 	Driver version   : 6.19.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 	Detected Stateless Decoder
> Media Driver Info:
> 	Driver name      : rpi-hevc-dec
> 	Model            : rpi-hevc-dec
> 	Serial           : 
> 	Bus info         : platform:rpi-hevc-dec
> 	Media version    : 6.19.0
> 	Hardware revision: 0x00000000 (0)
> 	Driver version   : 6.19.0
> Interface Info:
> 	ID               : 0x0300000c
> 	Type             : V4L Video
> Entity Info:
> 	ID               : 0x00000001 (1)
> 	Name             : rpi-hevc-dec-source
> 	Function         : V4L2 I/O
> 	Pad 0x01000002   : 0: Source
> 	  Link 0x02000008: to remote pad 0x1000004 of entity 'rpi-hevc-dec-proc' (Video Decoder): Data, Enabled, Immutable
> 
> Required ioctls:
> 	test MC information (see 'Media Driver Info' above): OK
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 		fail: v4l2-test-controls.cpp(942): try_ext_ctrls returned an error (22)
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 3 Private Controls: 0
> 	Standard Compound Controls: 5 Private Compound Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK
> 	test blocking wait: OK
> 
> Total for rpi-hevc-dec device /dev/video0: 49, Succeeded: 48, Failed: 1, Warnings: 0
> 
> Testing is with a downstream patchset to FFmpeg. I'm told FFmpeg
> currently has no stateless decode support, but we will be reviewing
> works that have been in progress and our downstream patches to see
> whether that can be pushed onwards.

Please see FFmpeg PR20847 "Add V4L2 Request API hwaccels for MPEG2,
H.264, HEVC, VP8, VP9 and AV1" [1] for pending upstream FFmpeg work.

My 4l2request-v3-pixfmts branch [2] also contains extra commit to make
it work with downstream rpi kernel version, using non-MT pixfmts.

I will give this a spin together with the FFmpeg PR, adding support for
the MT based pixfmts should hopefully be easy.

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/pulls/20847
[2] https://code.ffmpeg.org/Kwiboo/FFmpeg/commits/branch/v4l2request-v3-pixfmts

Regards,
Jonas

> Downstream tree is at
> https://github.com/jc-kynesim/rpi-ffmpeg/tree/test/7.1.2/main
> 
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9247
> adds support for the new formats to GStreamer, and runs Fluster.
> Using the JCT-VC-HEVC_V1 test suite we get 142 passes out of 147 tests.
> PICSIZE_[ABCD]_Bossen_1 all fail due to the image sizes being greater than
> the 4096x4096 limit of this driver.
> TSUNEQBD_A_MAIN10_Technicolor_2 fails as the hardware doesn't support
> having a different bit depth for luma and chroma.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> Changes in v6:
> - Fixed up assigned by unused variable (ctrl) in hevc_d_init_ctrls
>   (reported by CI).
> - Fixed up documentation links (reported by CI)
> - Link to v5: https://lore.kernel.org/r/20260227-media-rpi-hevc-dec-v5-0-9bb3fc1816de@raspberrypi.com
> 
> Changes in v5:
> - Updated driver based on Nicolas' review comments of V4.
> - Added NV12MT_COL128 to ./drivers/media/v4l2-core/v4l2-common.c. The
>   10 bit format can't be represented with v4l2_format_info at present
>   as it assumes a power of 2 block size.
> - Switched to kzalloc_obj/kzalloc_objs as checkpatch now checks that.
> - Link to v4: https://lore.kernel.org/r/20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com
> 
> Changes in v4:
> - dt-bindings: Drop to just SoC compatibles and updated description (Krzysztof).
> - dts: Corrected address in node name.
> - NV12MT_COL128 format description added vertical alignment to a
>   multiple of 8 (Nicolas)
> - driver: Merged in driver updates based on Nicolas' review.
> - driver: Added debug module parameter to avoid log spam due to some bitstreams.
> - cover-letter: Added Fluster results.
> - rebased and based on the updated version of 
>   https://lore.kernel.org/linux-media/20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com/
> - update v4l2-compliance output
> - Link to v3: https://lore.kernel.org/r/20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com
> 
> Changes in v3:
> - Updated the dtbinding with SoC specific compatible strings (Rob).
> - Reordered hevc_dec and v3d in bcm2711.dtsi to keep them in ascending
>   register order (Stefan).
> - Reordered hevc_dec in bcm2711-rpi.dtsi to keep them in alphabetical
>   order (Stefan).
> - Tested on top of Nicolas' revised version of Hans' patch set for
>   manual request completion.
>   https://lore.kernel.org/all/20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com/
> - Link to v2: https://lore.kernel.org/r/20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com
> 
> Changes in v2:
> - Rebased to use Hans' manual request completion scheme.
>   https://lore.kernel.org/linux-media/cover.1724928939.git.hverkuil-cisco@xs4all.nl/
> - Require all slices for a frame to be submitted in one request.
> - Added the missing header file.
> - Used the full macro name for pix format docs (Sakari)
> - Dropped unneeded |- from dtbinding (Rob)
> - Made reg and reg-names match in order (Rob)
> - Removed clock-names from dtbinding (Rob)
> - Driver changed to not request the clock by name
> - Dropped clock-names from DTS file
> - Minor fixes for compliance failures
>   fail: v4l2-test-formats.cpp(958): fmt_cap.g_colorspace() != col
>   fail: v4l2-test-buffers.cpp(901): q.create_bufs(node, 1, &fmt) != EINVAL
> - v4l2-compliance output added to cover letter (Nicholas)
>   I believe the "fail: v4l2-test-controls.cpp(939): try_ext_ctrls
>   returned an error (22)" is expected as it is validating the SPS.
>   Hantro and Cedrus certainly both appear to return errors in the same place
> - Link to v1: https://lore.kernel.org/r/20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com
> 
> ---
> Dave Stevenson (4):
>       docs: uapi: media: Document Raspberry Pi NV12 column format
>       media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL128
>       dt-bindings: media: Add the Raspberry Pi HEVC decoder
>       arm: dts: bcm2711-rpi: Add HEVC decoder node
> 
> John Cox (2):
>       docs: uapi: media: Clarify HEVC slice_param bit_size, data_byte_offset
>       media: platform: Add Raspberry Pi HEVC decoder driver
> 
>  .../bindings/media/raspberrypi,hevc-dec.yaml       |   72 +
>  .../media/v4l/ext-ctrls-codec-stateless.rst        |    6 +-
>  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   46 +
>  MAINTAINERS                                        |   10 +
>  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |    4 +
>  arch/arm/boot/dts/broadcom/bcm2711.dtsi            |    9 +
>  drivers/media/platform/raspberrypi/Kconfig         |    1 +
>  drivers/media/platform/raspberrypi/Makefile        |    1 +
>  .../media/platform/raspberrypi/hevc_dec/Kconfig    |   17 +
>  .../media/platform/raspberrypi/hevc_dec/Makefile   |    5 +
>  .../media/platform/raspberrypi/hevc_dec/hevc_d.c   |  325 +++
>  .../media/platform/raspberrypi/hevc_dec/hevc_d.h   |  195 ++
>  .../platform/raspberrypi/hevc_dec/hevc_d_h265.c    | 2436 ++++++++++++++++++++
>  .../platform/raspberrypi/hevc_dec/hevc_d_h265.h    |   22 +
>  .../platform/raspberrypi/hevc_dec/hevc_d_hw.c      |  429 ++++
>  .../platform/raspberrypi/hevc_dec/hevc_d_hw.h      |  317 +++
>  .../platform/raspberrypi/hevc_dec/hevc_d_video.c   |  634 +++++
>  .../platform/raspberrypi/hevc_dec/hevc_d_video.h   |   38 +
>  drivers/media/v4l2-core/v4l2-common.c              |    2 +
>  drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
>  include/uapi/linux/videodev2.h                     |    4 +
>  21 files changed, 4573 insertions(+), 2 deletions(-)
> ---
> base-commit: 1512bd6430c7be7723724f31a74c3b8aaacf8a20
> change-id: 20241212-media-rpi-hevc-dec-3b5be739f3bd
> 
> Best regards,


