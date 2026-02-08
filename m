Return-Path: <linux-media+bounces-52345-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GSv1BXnah2kheAQAu9opvQ
	(envelope-from <linux-media+bounces-52345-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Feb 2026 01:36:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6431A10778A
	for <lists+linux-media@lfdr.de>; Sun, 08 Feb 2026 01:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E406302A6C4
	for <lists+linux-media@lfdr.de>; Sun,  8 Feb 2026 00:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588E72FD697;
	Sun,  8 Feb 2026 00:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IU72wpkb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A474428E00
	for <linux-media@vger.kernel.org>; Sun,  8 Feb 2026 00:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770510961; cv=pass; b=uyTWDaP0sFfxhagkCu2l4SKUR7VziSt7cNDDS0qPaWEpm3iJ5sJNLfZq0aDIZJyGGakJmnpKT0+6C2zLag/3hMfD9HKrlYklx7EVuaCG4j6eZaPnhYV7Fkg20tmaU73GF+5TzAs+EHNK3ROkMqR57drNWyml7qyZ0xyMhDFo4sI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770510961; c=relaxed/simple;
	bh=PRXfW1xczsTV6tUkwGDseKTOuzBpKEmtjRK0kFsCfTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPLjbb4zOk97GwEDX/LpvAEnOp6nLEAa0SMejh+MB66zFGmgDhzWqbYt8gV8fTkf/VfXk4sbPu1gI4aVOvOb8HIT7biO4wv9pKJMDpQkgSUZwtoEDunrlugUNlQnOg5PhujtdnW0t3gWaewUkg2gH1HyiAxACNSOCzIQzzK/v3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IU72wpkb; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-124899ee9d3so2248553c88.0
        for <linux-media@vger.kernel.org>; Sat, 07 Feb 2026 16:36:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770510961; cv=none;
        d=google.com; s=arc-20240605;
        b=kITeIDwg6L7TIjx/gHRECdXAvGVKKRPd4LEVEiGQn+c37aoWDuHW+w4VhzRGbxzyGo
         IX7DLSBb4LqgPQ+AIeKk/3rlmlFlkS4J85EiRKbOsMzp74v3lZKTwC3ppHdVnXYhugC0
         jwCTRkpMbCBOhS9GdXNACy1HDSGUayUvUHxLKX/t93bkgT9yKqFc3BMGFh6WoMxi3WeY
         tNmVqcOgkpL81neC8EcT1cG4kWUyBbSdobCCGVvkgoMRct0dP2ttzmry3lyh9rf7tqSb
         ZhXj3+DP8ASQ2Heuou8qWO0zy6KkxLNtvbApky4rsJpZLAwagTijZrRcLmp3GjcfZODE
         H+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L9OVhbo0I3sJD/8yglKIH5QK5PrVSt2NJ91/w2gd3CQ=;
        fh=8WgmoOpo/VartJcQvHbxTYtyJvJA/oau4bxFKygb62E=;
        b=AwAesWrfjMMkYT4tCmajfoshc14a2QoMjjCiP14W4YDDnaT90xX6NW9go/eb2Hrubo
         QfjA+BfLABu6q2YlZoWLure/IQBSXGudFW6lsQN4N1NR/rf4VUCk3VPhDtc2yu2+sz9h
         nrNrHdQsp9Enm82mloIjtzfixWTRFvhBAaFrJEBL54JHLrYc/zOlIYt8DpHc6oWkLYkG
         6BGd17KQgqObW6wt5Jl8xPm/cnpWmNcUH+4GHQazE27S4Pz1GuAihCmG4cuEibN4F2yG
         clfPdX1NkFZx6lOL3r2QRWzURcEX7ZtVc3Y5LPjtJqpSYkb3Yhh2JGXPwzWWQzIDek4V
         k6HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770510961; x=1771115761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9OVhbo0I3sJD/8yglKIH5QK5PrVSt2NJ91/w2gd3CQ=;
        b=IU72wpkblemW3ZTFwmxMP31wC8yUKgipt1EwTZhQG9Q/HV4GJGm+rIATn+Jrg02R05
         CwVcklK77CSviT2hhamELYzS2e5aC5UkExa1Hvwcba0O1/GUlt3s0O+4c2BzteEJrwIy
         AflRbMJ53IpbpyB/vqFMHT7QQ+Ako3LlhGgYTFIoCjSN/1RSANvA3UffQYMQ+SdX6rW+
         knFrsDsiXy92T7qA9AZVXiIeRVfrGILudSC4lz8QI64eJGSoSrz19B3VB7etj4ZMOmm4
         amvKNAONIO2P3t2kt2rwp901O5TI2SbywVm+ZD1W9zHGtMUL3H9rQt74j41xSngxN0eO
         91yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770510961; x=1771115761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L9OVhbo0I3sJD/8yglKIH5QK5PrVSt2NJ91/w2gd3CQ=;
        b=MCukFqKzGCzv6L/Y8pofFCeQOUCcGpSAuTapwkEmXi1jKNJP+pIJcYJndhyBZiTfgw
         q3TsbY43oXmxkeF/0++4TTm5HqDlRvEgaHY3ydohcnDtgJ5MjPigK69PYdL9dgzzOZH/
         UnvpJE87jLPKtazTkvLFwkhN+/T90kSmHD2wFeICNln+3jo22+MeKaYmFNQTGd3YPomT
         6D3ytl740bXkeakgirBKFMsJvo+4KUj9Txm5Xt0MXHtTwNVYvf3e61mgchKe894Eibi6
         /TJMGpJ9+NGbAXdwRU6Dw0xb5nggQ4l41xcMfiA9S639jBJ3xgMCRMpe2lYBx9tQ/S0Z
         rPyg==
X-Gm-Message-State: AOJu0Yx6FZso/i1CtX084EvwZKqUrHcP8LtWQKuo50b0iJGhIfZ/hPTo
	v+QwP0tYNORm3Or/BMep83cC/uz/S5cJdxw9EAul2qMXBPuHDGZF+8eweR/vPpNl/0i2uzlmSeI
	j5eAEupQ9dVPj+IuB3z353i8L/YYqlpSLSRpP
X-Gm-Gg: AZuq6aJF2nEIZWBvBzBasA5VlROug2KjMxY0P5ywiDCPfuQw0cu+IDPojeE9QK6PisF
	iWPhuzDb0uXzfWaE3+AERCNJ5LPWC6U8ROBftpHvFz8ebEXxVxIG0lQxRhMYzPUYQrkDaccznM2
	WT4Ihcl/PbjBlXWAaymyw2wZoNkUqC1ijJG+8xfC+4/XggPumBIlvRMAMbd2K7/ppvAHR3aq4tS
	kQ5nEy9zxSYPqCa3b6DUI29UAEKOx+f09f9OESTuAv+QLsYkKdgmpOuiP49f/6RubXluQ==
X-Received: by 2002:a05:7022:4381:b0:11b:f271:835a with SMTP id
 a92af1059eb24-126fc18040dmr4887343c88.3.1770510960394; Sat, 07 Feb 2026
 16:36:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112022420.390854-1-hoff.benjamin.k@gmail.com>
In-Reply-To: <20260112022420.390854-1-hoff.benjamin.k@gmail.com>
From: Ben Hoff <hoff.benjamin.k@gmail.com>
Date: Sat, 7 Feb 2026 19:35:49 -0500
X-Gm-Features: AZwV_QhnyoLSoL8YDj2qXJHf5kz1nC9XEa6WQ2qR0mkKZpmbV86LQWr5pHRnYwY
Message-ID: <CAMSzxxScAW+sR6OzXt4NxOFx=Q0LDFko9d_xY4zoROYOZMzzdA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] media: pci: AVMatrix HWS capture driver
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52345-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6431A10778A
X-Rspamd-Action: no action

Hi all,

Just following up on this new driver patch sent Jan 11.

Happy to address review comments or adjust the approach if needed.

I=E2=80=99m happy to maintain this driver going forward.

Thanks,
Ben

On Sun, Jan 11, 2026 at 9:24=E2=80=AFPM Ben Hoff <hoff.benjamin.k@gmail.com=
> wrote:
>
> Hi all,
>
> This series introduces an in-tree AVMatrix HWS PCIe capture driver.
> The driver supports up to four HDMI inputs and exposes the video capture
> path through V4L2. Audio support is intentionally omitted in this
> revision so the series can focus on the video pipeline and PCIe glue.
>
> Major pieces include:
>   - PCI glue with capability discovery, BAR setup, interrupt handling,
>     and power-management hooks.
>   - A vb2-dma-contig based capture pipeline with DV timings support,
>     per-channel controls, two-buffer management, and loss-of-signal
>     recovery.
>
> The baseline GPL out-of-tree driver is available at:
>   https://github.com/benhoff/hws/tree/baseline
> A vendor driver bundle is available at:
>   https://www.acasis.com/pages/acasis-product-drivers
> The vendor is not involved in this upstreaming effort.
>
> Prior RFC posting: https://lore.kernel.org/lkml/20251027195638.481129-1-h=
off.benjamin.k@gmail.com/
>
> Current status / open items:
>   - `v4l2-compliance` passes for each video node, and I have exercised
>     basic capture in OBS and run this driver in a steady state mode
>     daily
>
> v4l2-compliance (from v4l-utils git, v4l2-compliance 1.32.0):
> v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
>
> Compliance test for HwsCapture device /dev/video1:
>
> Driver Info:
>         Driver name      : HwsCapture
>         Card type        : AVMatrix HWS Capture 2
>         Bus info         : PCI:0000:17:00.0
>         Driver version   : 6.18.3
>         Capabilities     : 0x84200001
>                 Video Capture
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04200001
>                 Video Capture
>                 Streaming
>                 Extended Pix Format
>
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
>         test invalid ioctls: OK
>
> Allow for multiple opens:
>         test second /dev/video1 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 1 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
>         test VIDIOC_DV_TIMINGS_CAP: OK
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls (Input 0):
>                 info: checking v4l2_query_ext_ctrl of control 'User Contr=
ols' (0x00980001)
>                 info: checking v4l2_query_ext_ctrl of control 'Brightness=
' (0x00980900)
>                 info: checking v4l2_query_ext_ctrl of control 'Contrast' =
(0x00980901)
>                 info: checking v4l2_query_ext_ctrl of control 'Saturation=
' (0x00980902)
>                 info: checking v4l2_query_ext_ctrl of control 'Hue' (0x00=
980903)
>                 info: checking v4l2_query_ext_ctrl of control 'Brightness=
' (0x00980900)
>                 info: checking v4l2_query_ext_ctrl of control 'Contrast' =
(0x00980901)
>                 info: checking v4l2_query_ext_ctrl of control 'Saturation=
' (0x00980902)
>                 info: checking v4l2_query_ext_ctrl of control 'Hue' (0x00=
980903)
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>                 info: checking control 'User Controls' (0x00980001)
>                 info: checking control 'Brightness' (0x00980900)
>                 info: checking control 'Contrast' (0x00980901)
>                 info: checking control 'Saturation' (0x00980902)
>                 info: checking control 'Hue' (0x00980903)
>         test VIDIOC_G/S_CTRL: OK
>                 info: checking extended control 'User Controls' (0x009800=
01)
>                 info: checking extended control 'Brightness' (0x00980900)
>                 info: checking extended control 'Contrast' (0x00980901)
>                 info: checking extended control 'Saturation' (0x00980902)
>                 info: checking extended control 'Hue' (0x00980903)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>                 info: checking control event 'User Controls' (0x00980001)
>                 info: checking control event 'Brightness' (0x00980900)
>                 info: checking control event 'Contrast' (0x00980901)
>                 info: checking control event 'Saturation' (0x00980902)
>                 info: checking control event 'Hue' (0x00980903)
>                 warn: v4l2-test-controls.cpp(1159): V4L2_CID_DV_RX_POWER_=
PRESENT not found for input 0
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 5 Private Controls: 0
>
> Format ioctls (Input 0):
>                 info: found 1 formats for buftype 1
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>                 warn: v4l2-test-formats.cpp(1485): S_PARM is supported fo=
r buftype 1, but not for ENUM_FRAMEINTERVALS
>         test VIDIOC_G/S_PARM: OK
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls (Input 0):
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls (Input 0):
>                 info: test buftype Video Capture
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test CREATE_BUFS maximum buffers: OK
>         test VIDIOC_REMOVE_BUFS: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>         test blocking wait: OK
>
> Test input 0:
>
> Stream using all formats:
>         test MMAP for Format YUYV, Frame Size 640x480:
>                 Stride 1280, Field None: OK
>                 Stride 1344, Field None: OK
>         test MMAP for Format YUYV, Frame Size 1920x1080:
>                 Stride 3840, Field None: OK
> Total for HwsCapture device /dev/video1: 51, Succeeded: 51, Failed: 0, Wa=
rnings: 2
>
>
> Thanks for taking a look!
>
> Ben
>
> Ben Hoff (2):
>   media: pci: add AVMatrix HWS capture driver
>   MAINTAINERS: add entry for AVMatrix HWS driver
>
>  MAINTAINERS                            |    6 +
>  drivers/media/pci/Kconfig              |    1 +
>  drivers/media/pci/Makefile             |    1 +
>  drivers/media/pci/hws/Kconfig          |   12 +
>  drivers/media/pci/hws/Makefile         |    4 +
>  drivers/media/pci/hws/hws.h            |  175 +++
>  drivers/media/pci/hws/hws_irq.c        |  268 ++++
>  drivers/media/pci/hws/hws_irq.h        |   10 +
>  drivers/media/pci/hws/hws_pci.c        |  722 +++++++++++
>  drivers/media/pci/hws/hws_reg.h        |  144 +++
>  drivers/media/pci/hws/hws_v4l2_ioctl.c |  755 ++++++++++++
>  drivers/media/pci/hws/hws_v4l2_ioctl.h |   38 +
>  drivers/media/pci/hws/hws_video.c      | 1542 ++++++++++++++++++++++++
>  drivers/media/pci/hws/hws_video.h      |   29 +
>  14 files changed, 3707 insertions(+)
>  create mode 100644 drivers/media/pci/hws/Kconfig
>  create mode 100644 drivers/media/pci/hws/Makefile
>  create mode 100644 drivers/media/pci/hws/hws.h
>  create mode 100644 drivers/media/pci/hws/hws_irq.c
>  create mode 100644 drivers/media/pci/hws/hws_irq.h
>  create mode 100644 drivers/media/pci/hws/hws_pci.c
>  create mode 100644 drivers/media/pci/hws/hws_reg.h
>  create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.c
>  create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.h
>  create mode 100644 drivers/media/pci/hws/hws_video.c
>  create mode 100644 drivers/media/pci/hws/hws_video.h
>
> --
> 2.51.0

