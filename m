Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05213178D71
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 10:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729126AbgCDJag (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 04:30:36 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37346 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728301AbgCDJac (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Mar 2020 04:30:32 -0500
Received: by mail-wr1-f66.google.com with SMTP id q8so1475055wrm.4
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2020 01:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lD7ezoq7WMl/P2AErETnnN10euQ0k0JR+fFLOJgln1o=;
        b=dcoKys563erqQpz3cuSh17HMejV7vWh5e4zzl/0RJV33qeS6smc02iC1WZkEtGraSR
         8TaxZUdQTXHXlbuG0ye56KdKkP66HTrhukl6RP25k57d8U/qJ2ZZrelSJy7yBx/0krcY
         CipG1H/eWHQkxm9g95pxCCQT1gEv2WkrXT/m+T90sY0Ga6XUuREBHLp0qNp3vXpUDsox
         sufY13maGnk03MyKQXgBTlBBP0jaFHhtkmQv+D2PXhO+ob74EoWfgSKfFDJvpgl9Qtwk
         vvbqVfYUTKbvJpgJ2Rdfwsi7ixyLeJkv1wc1HKfxnyvnELhtwSWIO6yAgxerI8WxW+3Y
         qheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=lD7ezoq7WMl/P2AErETnnN10euQ0k0JR+fFLOJgln1o=;
        b=DpTTrIfJBjfSjVwuZLgGp/li3jt58nppC1+Yu51GvtbMDV78+QPIHyDgXvT9OwkOZ3
         jOc1q8DfDzgRQPIij1LVtwGp0vxYzVh7FOMI+gq9bZR35tBWOrAzXOHU0c88Hcvw9hdU
         aBIe6jaK27sXE6octkQB9vnSxEGYjEVTzkTUCnMo4UmDGH+jiOhL6Trxt79aAcdDbqcs
         xMEb8sPkdXAuErUIjX0yshxR1qSP+px9CCQPTCsTFIlgV4bezc8siABlRIs3uqe8HmZR
         dfs8G1/BoqqSJyjBF4sGnPh6syLWYwzgPTwO85GcdE8KW8BC4lh/9ZT8wmG+4d1MtaYE
         e0GA==
X-Gm-Message-State: ANhLgQ3aZzxFOVYrhM1nWAJXouKNdEXDg0KUVs+BhteUfkite4daVSh7
        yHqh2hzRgyqqWFzpkz8Heu70Ug==
X-Google-Smtp-Source: ADFU+vsfqY5t12cLWkAkzP3Z/W+UAQzZxlEm3Yjlh1GzogxuPacfprv66xSyL137V1AI/o3oQ8ffZg==
X-Received: by 2002:a5d:42c6:: with SMTP id t6mr3367399wrr.394.1583314228425;
        Wed, 04 Mar 2020 01:30:28 -0800 (PST)
Received: from [10.1.3.173] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l8sm3236152wmj.2.2020.03.04.01.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2020 01:30:27 -0800 (PST)
Subject: Re: [PATCH v6 0/5] media: meson: vdec: Add VP9 decoding support
To:     Hans Verkuil <hverkuil@xs4all.nl>, mchehab@kernel.org,
        hans.verkuil@cisco.com
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200303143732.762-1-narmstrong@baylibre.com>
 <0935582a-ae80-f7b4-0616-a39c923a83f4@xs4all.nl>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <1ef0dbf5-a23e-8bf6-b8d6-d1890efd9218@baylibre.com>
Date:   Wed, 4 Mar 2020 10:30:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0935582a-ae80-f7b4-0616-a39c923a83f4@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 03/03/2020 17:27, Hans Verkuil wrote:
> Hi Neil,
> 
> I still get sparse warnings:
> 
> drivers/staging/media/meson/vdec/codec_hevc_common.h:15:18: warning: 'vdec_hevc_parser_cmd' defined but not used [-Wunused-const-variable=]
> drivers/staging/media/meson/vdec/esparser.c:83: warning: Function parameter or member 'core' not described in 'vp9_update_header'
> drivers/staging/media/meson/vdec/esparser.c:83: warning: Function parameter or member 'buf' not described in 'vp9_update_header'
> drivers/staging/media/meson/vdec/codec_vp9.c:1333: warning: Function parameter or member 'sess' not described in 'codec_vp9_fetch_rpm'
> 
> They look trivial to fix to me.

Erf, I ran sparse, smatch and fixed everything but simply forgot to run W=1...

Will fix these and send a v7.

Neill

> 
> The v7 series is fine, but I prefer to wait until this v6 is OK as well so I can
> combine them in one PR.
> 
> Regards,
> 
> 	Hans
> 
> On 03/03/2020 15:37, Neil Armstrong wrote:
>> Hello,
>>
>> This patchset aims to bring VP9 decoding support to Amlogic GXL, G12A & SM1
>> platforms for the amlogic stateful video decoder driver.
>>
>> With this, it passes v4l2-compliance with streaming on Amlogic G12A and
>> Amlogic SM1 SoCs successfully using the stream at [1] with a fixed
>> pyv4l2compliance script for VP9 at [2].
>>
>> The original script kept the IVF headers in the stream, confusing the
>> decoder. The fixed script only extracts the payload from the IVF container.
>>
>> The decoder has been tested using the Google CTS TestVectorsIttiam VP9 yuv420
>> samples and the VP9 Decoder Performance streams at [5], decoding all streams from
>> Profile 0 and 2 up to Level 4.1, with 10bit downsampling to 8bit.
>>
>> This patchset depends on :
>> - H.264 and compliance v7 at [4]
>>
>> Changes since v5 at [9]:
>> - Fixed sparse warnings in codec_hevc_common.h/codec_vp9.c/vdec_hevc.c
>> - No smatch warnings issued
>>
>> Changes since v4 at [8]:
>> - Fixes checkpatch warning on patches 3 & 5
>>
>> Changes since v3 at [7]:
>> - fixes necessary spare ref buffer handling in parser
>> - added a comment to indicate how it's handled
>> - fix VP9 on SM1, was working with G12A firmware, but needed some changed with SM1 specific firmware
>> - pushed (gxl) and switched to missing (sm1) vp9 firmwares to linux-firmware repo
>>
>> Changes since v2 at [6]:
>> - Rebased on H.264 and compliance at [4]
>>
>> Changes since v1 at [3]:
>> - Fixed compliance for delta frame resize, but proper ref keeping is broken
>> - Added warns for delta frame resize, to be fixed in a following patchset
>> - Added VP9 probabilities parsing and transformation support to decore the VP9 performance streams
>> - Fixed refs keeping, avoid deleting necessary refs for next frame
>> - Properly used the kernel clamp_val() macros
>> - Zeroed the workspace to avoid refs handling glitches
>> - Add lock around the flush & stop to avoid race between IRQ and drain/stop
>>
>> [1] https://github.com/superna9999/pyv4l2compliance/raw/tests/output/Jellyfish_1080_10s_5MB.vp9.hdr
>> [2] https://github.com/superna9999/pyv4l2compliance
>> [3] https://lore.kernel.org/linux-media/20191205092454.26075-1-narmstrong@baylibre.com
>> [4] https://lore.kernel.org/linux-media/20200303143320.32562-1-narmstrong@baylibre.com
>> [5] https://www.webmproject.org/vp9/levels/
>> [6] https://lore.kernel.org/linux-media/20191217111939.10387-1-narmstrong@baylibre.com
>> [7] https://lore.kernel.org/linux-media/20200116133437.2443-1-narmstrong@baylibre.com
>> [8] https://lore.kernel.org/linux-media/20200206084152.7070-1-narmstrong@baylibre.com
>> [9] https://lore.kernel.org/linux-media/20200219140958.23542-1-narmstrong@baylibre.com
>>
>> The compliance log is:
>> # v4l2-compliance --stream-from-hdr Jellyfish_1080_10s_5MB.vp9.hdr -s 200
>> v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits
>>
>> Compliance test for meson-vdec device /dev/video0:
>>
>> Driver Info:
>> 	Driver name      : meson-vdec
>> 	Card type        : Amlogic Video Decoder
>> 	Bus info         : platform:meson-vdec
>> 	Driver version   : 5.5.0
>> 	Capabilities     : 0x84204000
>> 		Video Memory-to-Memory Multiplanar
>> 		Streaming
>> 		Extended Pix Format
>> 		Device Capabilities
>> 	Device Caps      : 0x04204000
>> 		Video Memory-to-Memory Multiplanar
>> 		Streaming
>> 		Extended Pix Format
>> 	Detected Stateful Decoder
>>
>> Required ioctls:
>> 	test VIDIOC_QUERYCAP: OK
>>
>> Allow for multiple opens:
>> 	test second /dev/video0 open: OK
>> 	test VIDIOC_QUERYCAP: OK
>> 	test VIDIOC_G/S_PRIORITY: OK
>> 	test for unlimited opens: OK
>>
>> Debug ioctls:
>> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
>> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
>> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>> 	test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>> 	test VIDIOC_QUERYCTRL: OK
>> 	test VIDIOC_G/S_CTRL: OK
>> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>> 	Standard Controls: 2 Private Controls: 0
>>
>> Format ioctls:
>> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>> 	test VIDIOC_G/S_PARM: OK (Not Supported)
>> 	test VIDIOC_G_FBUF: OK (Not Supported)
>> 	test VIDIOC_G_FMT: OK
>> 	test VIDIOC_TRY_FMT: OK
>> 	test VIDIOC_S_FMT: OK
>> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>> 	test Cropping: OK (Not Supported)
>> 	test Composing: OK (Not Supported)
>> 	test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>> 	test VIDIOC_(TRY_)DECODER_CMD: OK
>>
>> Buffer ioctls:
>> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>> 	test VIDIOC_EXPBUF: OK
>> 	test Requests: OK (Not Supported)
>>
>> Test input 0:
>>
>> Streaming ioctls:
>> 	test read/write: OK (Not Supported)
>> 	test blocking wait: OK
>> 	Video Capture Multiplanar: Captured 198 buffers   
>> 	test MMAP (select): OK
>> 	Video Capture Multiplanar: Captured 198 buffers   
>> 	test MMAP (epoll): OK
>> 	test USERPTR (select): OK (Not Supported)
>> 	test DMABUF: Cannot test, specify --expbuf-device
>>
>> Total for meson-vdec device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
>>
>> Maxime Jourdan (4):
>>   media: meson: vdec: add helpers for lossless framebuffer compression
>>     buffers
>>   media: meson: vdec: add common HEVC decoder support
>>   media: meson: vdec: add VP9 input support
>>   media: meson: vdec: add VP9 decoder support
>>
>> Neil Armstrong (1):
>>   media: meson: vdec: align stride on 32 bytes
>>
>>  drivers/staging/media/meson/vdec/Makefile     |    4 +-
>>  .../media/meson/vdec/codec_hevc_common.c      |  284 +++
>>  .../media/meson/vdec/codec_hevc_common.h      |   80 +
>>  drivers/staging/media/meson/vdec/codec_vp9.c  | 2141 +++++++++++++++++
>>  drivers/staging/media/meson/vdec/codec_vp9.h  |   13 +
>>  drivers/staging/media/meson/vdec/esparser.c   |  150 +-
>>  drivers/staging/media/meson/vdec/hevc_regs.h  |  218 ++
>>  drivers/staging/media/meson/vdec/vdec.c       |   15 +-
>>  .../staging/media/meson/vdec/vdec_helpers.c   |   35 +-
>>  .../staging/media/meson/vdec/vdec_helpers.h   |    4 +
>>  drivers/staging/media/meson/vdec/vdec_hevc.c  |  231 ++
>>  drivers/staging/media/meson/vdec/vdec_hevc.h  |   13 +
>>  .../staging/media/meson/vdec/vdec_platform.c  |   38 +
>>  13 files changed, 3213 insertions(+), 13 deletions(-)
>>  create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_common.c
>>  create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_common.h
>>  create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.c
>>  create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.h
>>  create mode 100644 drivers/staging/media/meson/vdec/hevc_regs.h
>>  create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.c
>>  create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.h
>>
> 

