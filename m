Return-Path: <linux-media+bounces-62791-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEMCA/+WFWqNWgcAu9opvQ
	(envelope-from <linux-media+bounces-62791-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 14:50:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B73A75D5C85
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 14:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9ED03013BB2
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 12:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92BEF2264CA;
	Tue, 26 May 2026 12:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KeOqfOGc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727C0214204;
	Tue, 26 May 2026 12:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799770; cv=none; b=WTAtASaUL9n6cQ/7nmlQC8H0/BNKc6E1IqnBw0c/PmTbWL3L97vbl1F6/zRkDUChhAJLKu8iIAaE8FKNj+5Z3QjG3HuOzPg8OuWJCeWEiV/YnMHPH6W+2y68eAmn+NP71nMtyiqwZyoPHz1gKW31ThZk3zqpfT3DgRo3cB4T2Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799770; c=relaxed/simple;
	bh=pS4eLGd/BXtwpbYBBWMTsqkQdJI9FVfDYLoXd59olh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FMc+rOmIjIhVwgyOBhIGW0bgdpc4kQSyQw7LCH24djXcc2qeI5NI2dnOVQb2kpWo248g1JPqaeTgy1UgoHApptFstIYlUwOcyggskqC+mpfKc4q38ULkv+bchwTfW3hkszhBgoSTfXKT8ibHEynYwG7tsl5U2bGS4fxzfaLKNtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeOqfOGc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B9B1F00A3F;
	Tue, 26 May 2026 12:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779799768;
	bh=B5bQe/xVdGiU9uGdav6T7X5GGz8gWhOzLpuzwqabKIU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KeOqfOGcaPN+w0DqoklYwWZDvOG8oJrJNvR79LPjVhh+RRyPBK9xbKGYh+Uscu7pz
	 Y7BMQJAi11YVY4Fif/k2AUWScqQ2IjYhLAOnT0Zt3EafhAe7cDjXTfHbLCE6YBN33t
	 gKLByZx9ibRKhru/aUoE/U6xtWmSVThjBiwX5WOtTQVBwtmP1IC7UcuWz90sSh4NX9
	 3NFoQKZo0M95FuQpXke00jdDRLrhhb2rh79T4d/hd1pulQXhGTg5PulZNsXSF1p958
	 omWPNjhKVgNEaz8Aic86C8qlBvdWiQS6iX8EjFkX5wO9ywAfAm+ugzuvHvA2ZmrcvJ
	 YkQbsbYPpgOfQ==
Message-ID: <ad61077f-4e7b-4088-834d-0fd7d3567a47@kernel.org>
Date: Tue, 26 May 2026 13:49:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] media: qcom: flip the switch between Venus and
 Iris drivers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <sYZHD3u8jIct2FxvEcwr_2zJAwlRZlgApp_nZRHcBHzhnTYkersBivmgF9agXwr_MAMQq9aXHnEfhYlOs_B6qw==@protonmail.internalid>
 <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62791-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[18];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B73A75D5C85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27/03/2026 20:19, Dmitry Baryshkov wrote:
> As the Venus and Iris drivers are close to the "feature parity" for the
> common platforms (SC7280, SM8250), in order to get more attention to
> squashing bugs from the Iris driver, flip the switch and default to the
> Iris driver if both are enabled. The Iris driver has several
> regressions, but hopefully they can be fixed through the development
> cycle by the respective team. Also it is better to fail the test than
> crash the device (which Venus driver does a lot).
> 
> Note: then intention is to land this in 6.21, which might let us to
> drop those platforms from the Venus driver in 6.22+.
> 
> Testing methodology: fluster test-suite, single-threaded mode, SM8250
> device (RB5).
> 
> $ ./fluster.py r -j 1 -d  GStreamer-H.264-V4L2-Gst1.0 -s -so out-h264.md -ts JVT-AVC_V1
> $ ./fluster.py r -j 1 -d  GStreamer-H.265-V4L2-Gst1.0 -s -so out-h265.md -ts JCT-VC-HEVC_V1
> $ ./fluster.py r -j 1 -d  GStreamer-VP9-V4L2-Gst1.0 -s -so out-vp9.md
> 
> For H.264:
> 
> Only the main set was used on both platforms
> 
> On Venus pass 126/135
> On Iris  pass 78/135
> 
> - Fail on Iris, but pass on Venus:
>    cabac_mot_fld0_full, cabac_mot_mbaff0_full, cabac_mot_picaff0_full,
>    CAFI1_SVA_C, CAMA1_Sony_C, cama1_vtc_c, cama2_vtc_b, cama3_vtc_b,
>    CAMACI3_Sony_C, CAMASL3_Sony_B, CAMP_MOT_MBAFF_L30,
>    CAMP_MOT_MBAFF_L31, CANLMA2_Sony_C, CANLMA3_Sony_C,
>    cavlc_mot_fld0_full_B, cavlc_mot_mbaff0_full_B,
>    cavlc_mot_picaff0_full_B, CVCANLMA2_Sony_C, CVFI1_Sony_D, CVFI1_SVA_C,
>    CVFI2_Sony_H, CVFI2_SVA_C, CVMA1_Sony_D, CVMAPAQP3_Sony_E,
>    CVMAQP2_Sony_G, CVMAQP3_Sony_D, CVMP_MOT_FLD_L30_B,
>    CVMP_MOT_FRM_L31_B, CVNLFI1_Sony_C, CVNLFI2_Sony_H, FI1_Sony_E,
>    MR9_BT_B, Sharp_MP_Field_1_B, Sharp_MP_Field_2_B, Sharp_MP_Field_3_B,
>    Sharp_MP_PAFF_1r2, Sharp_MP_PAFF_2r
> 
> - Fail on Venus, but pass on Iris:
>    BA3_SVA_C
> 
> For Venus several tests crash the firmware or crash the device,
> so test-suite was executed with extra:
> 
> -sv CABREF3_Sand_D CAMANL1_TOSHIBA_B CAMA1_TOSHIBA_B \
>    CAMA3_Sand_E CAMANL2_TOSHIBA_B CAMANL3_Sand_E CAPA1_TOSHIBA_B \
>    CAPAMA3_Sand_F CVMA1_TOSHIBA_B CVMANL1_TOSHIBA_B CVMANL2_TOSHIBA_B \
>    CVPA1_TOSHIBA_B
> 
> For H.265:
> 
> Only the main set was used on both platforms
> 
> On Venus pass 135/147
> On Iris  pass 133/147
> 
> - Fail on Iris, but pass on Venus:
>    INITQP_B_Main10_Sony_1, WP_A_MAIN10_Toshiba_3,
>    WPP_A_ericsson_MAIN10_2, WPP_B_ericsson_MAIN10_2,
>    WPP_C_ericsson_MAIN10_2, WPP_E_ericsson_MAIN10_2,
>    WPP_F_ericsson_MAIN10_2
> 
> - Fail on Venus, but pass on Iris:
>    ipcm_A_NEC_3, ipcm_B_NEC_3, ipcm_C_NEC_3, ipcm_D_NEC_3, ipcm_E_NEC_2,
>    IPRED_B_Nokia_3, VPSSPSPPS_A_MainConcept_1
> 
> For VP9 codec:
> 
> On Venus pass 174/311
> On Iris  pass 232/311
> 
> - Fail on Venus, but pass on Iris:
>    vp90-2-05-resize.ivf, vp90-2-14-resize-10frames-fp-tiles-1-2-4-8,
>    vp90-2-14-resize-10frames-fp-tiles-1-2,
>    vp90-2-14-resize-10frames-fp-tiles-1-4,
>    vp90-2-14-resize-10frames-fp-tiles-1-8,
>    vp90-2-14-resize-10frames-fp-tiles-2-1,
>    vp90-2-14-resize-10frames-fp-tiles-2-4,
>    vp90-2-14-resize-10frames-fp-tiles-2-8,
>    vp90-2-14-resize-10frames-fp-tiles-4-1,
>    vp90-2-14-resize-10frames-fp-tiles-4-2,
>    vp90-2-14-resize-10frames-fp-tiles-4-8,
>    vp90-2-14-resize-10frames-fp-tiles-8-1,
>    vp90-2-14-resize-10frames-fp-tiles-8-2,
>    vp90-2-14-resize-10frames-fp-tiles-8-4-2-1,
>    vp90-2-14-resize-10frames-fp-tiles-8-4, vp90-2-14-resize-fp-tiles-1-16,
>    vp90-2-14-resize-fp-tiles-1-2-4-8-16, vp90-2-14-resize-fp-tiles-1-2,
>    vp90-2-14-resize-fp-tiles-1-4, vp90-2-14-resize-fp-tiles-16-1,
>    vp90-2-14-resize-fp-tiles-16-2, vp90-2-14-resize-fp-tiles-16-4,
>    vp90-2-14-resize-fp-tiles-16-8-4-2-1, vp90-2-14-resize-fp-tiles-16-8,
>    vp90-2-14-resize-fp-tiles-1-8, vp90-2-14-resize-fp-tiles-2-16,
>    vp90-2-14-resize-fp-tiles-2-1, vp90-2-14-resize-fp-tiles-2-4,
>    vp90-2-14-resize-fp-tiles-2-8, vp90-2-14-resize-fp-tiles-4-16,
>    vp90-2-14-resize-fp-tiles-4-1, vp90-2-14-resize-fp-tiles-4-2,
>    vp90-2-14-resize-fp-tiles-4-8, vp90-2-14-resize-fp-tiles-8-16,
>    vp90-2-14-resize-fp-tiles-8-1, vp90-2-14-resize-fp-tiles-8-2,
>    vp90-2-14-resize-fp-tiles-8-4, vp90-2-15-segkey,
>    vp90-2-21-resize_inter_1280x720_5_1-2, vp90-2-21-resize_inter_1280x720_5_3-4,
>    vp90-2-21-resize_inter_1280x720_7_1-2, vp90-2-21-resize_inter_1280x720_7_3-4,
>    vp90-2-21-resize_inter_1920x1080_5_1-2,
>    vp90-2-21-resize_inter_1920x1080_5_3-4,
>    vp90-2-21-resize_inter_1920x1080_7_1-2,
>    vp90-2-21-resize_inter_1920x1080_7_3-4,
>    vp90-2-21-resize_inter_320x180_5_3-4, vp90-2-21-resize_inter_320x180_7_3-4,
>    vp90-2-21-resize_inter_320x240_5_3-4, vp90-2-21-resize_inter_320x240_7_3-4,
>    vp90-2-21-resize_inter_640x360_5_1-2, vp90-2-21-resize_inter_640x360_5_3-4,
>    vp90-2-21-resize_inter_640x360_7_1-2, vp90-2-21-resize_inter_640x360_7_3-4,
>    vp90-2-21-resize_inter_640x480_5_1-2, vp90-2-21-resize_inter_640x480_5_3-4,
>    vp90-2-21-resize_inter_640x480_7_1-2, vp90-2-21-resize_inter_640x480_7_3-4
> 
> $ v4l2-compliance -d /dev/video0
> v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
> 
> Compliance test for iris_driver device /dev/video0:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : Iris Decoder
>          Bus info         : platform:aa00000.video-codec
>          Driver version   : 6.19.0
>          Capabilities     : 0x84204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>          Detected Stateful Decoder
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video0 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 2 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK
>          test Composing: OK
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>          test blocking wait: OK
> 
> $ v4l2-compliance -d /dev/video1
> v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : Iris Encoder
>          Bus info         : platform:aa00000.video-codec
>          Driver version   : 6.19.0
>          Capabilities     : 0x84204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>          Detected Stateful Encoder
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video1 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 18 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>          test blocking wait: OK
> 
> Total for iris_driver device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0
> 
> For SC7280, the results match the SM8250 ones.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v5:
> - Rebased on linux-next, dropping applied patch
> - No other changes from the previous patchset, the previous patchset can
>    still be applied, if it was already.
> - Link to v4: https://lore.kernel.org/r/20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com
> 
> Changes in v4:
> - Fixed building (Dikshita)
> - Changed H265D_MAX_SLICE to have the same value as in Venus, fixing
>    H.265 decoding on SC7280
> - Link to v3: https://lore.kernel.org/r/20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com
> 
> Changes in v3:
> - Dropped dependency on the sc8280xp patchset, this will probably go in
>    earlier.
> - Updated commit messages for DT bindings (Konrad)
> - Link to v2: https://lore.kernel.org/r/20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com
> 
> Changes in v2:
> - Sorted out SC7280 Chromebook bindings (Stephan)
> - Dropped most of ifdef from venus (Vikash, Konrad)
> - Added testign results to the cover letter.
> - Link to v1: https://lore.kernel.org/r/20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com
> 
> ---
> Dmitry Baryshkov (4):
>        media: dt-bindings: qcom,sc7280-venus: drop non-PAS support
>        media: dt-bindings: qcom-sc7180-venus: move video-firmware here
>        media: qcom: iris: increase H265D_MAX_SLICE to fix H.265 decoding on SC7280
>        media: qcom: venus: flip the venus/iris switch
> 
>   .../devicetree/bindings/media/qcom,sc7180-venus.yaml      | 15 +++++++++++++++
>   .../devicetree/bindings/media/qcom,sc7280-venus.yaml      | 10 ++--------
>   .../devicetree/bindings/media/qcom,venus-common.yaml      | 15 ---------------
>   drivers/media/platform/qcom/iris/Makefile                 |  5 +----
>   drivers/media/platform/qcom/iris/iris_probe.c             |  2 --
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h        |  2 +-
>   drivers/media/platform/qcom/venus/core.c                  |  6 ++++++
>   drivers/media/platform/qcom/venus/core.h                  | 11 +++++++++++
>   8 files changed, 36 insertions(+), 30 deletions(-)
> ---
> base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
> change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b
> 
> Best regards,
> --
> With best wishes
> Dmitry
> 
> 

Not applicable against -next with enough of a splat I'll ask you to 
rebase/reset this yourself.

---
bod

