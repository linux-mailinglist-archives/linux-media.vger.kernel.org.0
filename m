Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 804BDCFB76
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 15:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbfJHNkJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 09:40:09 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40250 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbfJHNkJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 09:40:09 -0400
Received: by mail-wr1-f67.google.com with SMTP id h4so10745518wrv.7
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xkjnCS4lpIPMQVrXbrlnON1H5dNgMu+E39ktRsJw3+c=;
        b=bI0jGc7qCzyal2QO9TvttEh0LPZ7vNgU1UixLSLWiIo4UggEG8iO4ycx8OYm9fkCxP
         osRmCnS0hUaPDbgvaDGZODYrhniziCBRmHUU7+lyG4S/4IHt3FVQes8qkhRy43I4fCEu
         3gOHCbmf6/Lf+IWwpbiI6eDG+YUl+xl6XoFyCzXhfTi76hUogC7ivs+LcTPA16WU1T0b
         aGlaV10tj8TTfeIeYHwkLiusbXgMnahFR7yUQRulTWfhwkfD/DoJPU40U+7yP/EzUkmQ
         uslEjn/fdVuFS8Z1ncR9dEGTfkbL5q0AGIL6KwVIk+jLrJ/B/FXIl9hzuI6WfM2E8k3z
         /c+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xkjnCS4lpIPMQVrXbrlnON1H5dNgMu+E39ktRsJw3+c=;
        b=AiZtaboJehd5sXwp62jV9X5EkvuFv7x0Y/6Gp9AGYxyXgRbOUZ2Svnk3P/3IATguQ6
         i5eTmad/WAaUGbzXKzYFnRweycoyZ8BGA/Xo6aazYqjGJMvFp8tlt2YFFeYMrQxeNNcY
         2vdi7Ic3XBl1FiR7Adz6awpdUNzE+H76stYScr/sG3WyCo/R3ORV6P4gEmXZGcNObSGQ
         Ik3uO2bcwRT0s/4XT4ySvfQ5ik8YLAfu6eskyU+nMcu3pi8dVRvwSaMKF1/hizCTUSsV
         A6SzuiWqleVmfci55KpubbMVbu+U+loey4jlm6s95dUCrsDSjUJNPtFgh/C13G4fRRNs
         XoTg==
X-Gm-Message-State: APjAAAV70YTB4CO1OZ+Zj2rWJxKzlJ0yAMZg3RGByHQibfc5IKX+Z6p+
        76111aCzRESHInazcEbHbbb3evsScXs=
X-Google-Smtp-Source: APXvYqwI+fsIK0XnJj1jdXdkVQ/KsRpQYVXJ5hEj63HpEZ94tMgiGfCXc9DGItNNQA7lyDxhQpMSQQ==
X-Received: by 2002:adf:eb05:: with SMTP id s5mr26707377wrn.360.1570542006303;
        Tue, 08 Oct 2019 06:40:06 -0700 (PDT)
Received: from [192.168.0.31] (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id h17sm6668599wme.6.2019.10.08.06.40.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 06:40:05 -0700 (PDT)
Subject: Re: [PATCH 0/2] media: meson: vdec: Add compliant H264 support
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
References: <20191007145909.29979-1-mjourdan@baylibre.com>
 <8563127e-fe2c-a633-556b-8a883cebb171@xs4all.nl>
 <977c48e8-8275-c96a-688b-ccfbb873eb79@baylibre.com>
 <65a88bfc-d82b-1487-7983-507149b11673@xs4all.nl>
From:   Maxime Jourdan <mjourdan@baylibre.com>
Message-ID: <acef4f1e-0b59-30f5-f31f-9fc22f393072@baylibre.com>
Date:   Tue, 8 Oct 2019 15:40:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <65a88bfc-d82b-1487-7983-507149b11673@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/10/2019 18:39, Hans Verkuil wrote:
> On 10/7/19 6:24 PM, Maxime Jourdan wrote:
>> On 07/10/2019 17:12, Hans Verkuil wrote:
>>> On 10/7/19 4:59 PM, Maxime Jourdan wrote:
>>>> Hello,
>>>>
>>>> This patch series aims to bring H.264 support as well as compliance update
>>>> to the amlogic stateful video decoder driver.
>>>>
>>>> There is 1 issue that remains currently:
>>>>
>>>>    - The following codepath had to be commented out from v4l2-compliance as
>>>> it led to stalling:
>>>>
>>>> if (node->codec_mask & STATEFUL_DECODER) {
>>>>      struct v4l2_decoder_cmd cmd;
>>>>      buffer buf_cap(m2m_q);
>>>>
>>>>      memset(&cmd, 0, sizeof(cmd));
>>>>      cmd.cmd = V4L2_DEC_CMD_STOP;
>>>>
>>>>      /* No buffers are queued, call STREAMON, then STOP */
>>>>      fail_on_test(node->streamon(q.g_type()));
>>>>      fail_on_test(node->streamon(m2m_q.g_type()));
>>>>      fail_on_test(doioctl(node, VIDIOC_DECODER_CMD, &cmd));
>>>>
>>>>      fail_on_test(buf_cap.querybuf(node, 0));
>>>>      fail_on_test(buf_cap.qbuf(node));
>>>>      fail_on_test(buf_cap.dqbuf(node));
>>>>      fail_on_test(!(buf_cap.g_flags() & V4L2_BUF_FLAG_LAST));
>>>>      for (unsigned p = 0; p < buf_cap.g_num_planes(); p++)
>>>>          fail_on_test(buf_cap.g_bytesused(p));
>>>>      fail_on_test(node->streamoff(q.g_type()));
>>>>      fail_on_test(node->streamoff(m2m_q.g_type()));
>>>>
>>>>      /* Call STREAMON, queue one CAPTURE buffer, then STOP */
>>>>      fail_on_test(node->streamon(q.g_type()));
>>>>      fail_on_test(node->streamon(m2m_q.g_type()));
>>>>      fail_on_test(buf_cap.querybuf(node, 0));
>>>>      fail_on_test(buf_cap.qbuf(node));
>>>>      fail_on_test(doioctl(node, VIDIOC_DECODER_CMD, &cmd));
>>>>
>>>>      fail_on_test(buf_cap.dqbuf(node));
>>>>      fail_on_test(!(buf_cap.g_flags() & V4L2_BUF_FLAG_LAST));
>>>>      for (unsigned p = 0; p < buf_cap.g_num_planes(); p++)
>>>>          fail_on_test(buf_cap.g_bytesused(p));
>>>>      fail_on_test(node->streamoff(q.g_type()));
>>>>      fail_on_test(node->streamoff(m2m_q.g_type()));
>>>> }
>>>>
>>>> The reason for this is because the driver has a limitation where all
>>>> capturebuffers must be queued to the driver before STREAMON is effective.
>>>> The firmware needs to know in advance what all the buffers are before
>>>> starting to decode.
>>>> This limitation is enforced via q->min_buffers_needed.
>>>> As such, in this compliance codepath, STREAMON is never actually called
>>>> driver-side and there is a stall on fail_on_test(buf_cap.dqbuf(node));
>>>
>>> That's interesting. I will have to look more closely at this.
>>>
>>>>
>>>>
>>>> One last detail: V4L2_FMT_FLAG_DYN_RESOLUTION is currently not recognized
>>>> by v4l2-compliance, so it was left out for the test. However, it is
>>>> present in the patch series.
>>>
>>> It is definitely recognized by v4l2-compliance.
>>>
>>>>
>>>> The second patch has 3 "Alignment should match open parenthesis" lines
>>>> where I preferred to keep them that way.
>>>>
>>>> Thanks Stanimir for sharing your HDR file creation tools, this was very
>>>> helpful :).
>>>>
>>>> Maxime
>>>>
>>>> # v4l2-compliance --stream-from-hdr test-25fps.h264.hdr -s250
>>>> v4l2-compliance SHA: a162244d47d4bb01d0692da879dce5a070f118e7, 64 bits
>>>
>>> But this SHA isn't in the v4l-utils repo, so this makes me wonder where you
>>> got this repo from.
>>>
>>
>> I am based off the hverkuil/vicodec branch. The SHA I am on is actually 05387265053bc6f9 ("test-media: add vicodec tests"), but it wasn't updated as I found out it requires a new bootstrap to refresh
>> the SHA. Maybe some rebasing at some point got rid of a162244d.
> 
> Don't use the hverkuil/vicodec branch. Everything there has been merged into the
> regular v4l-utils repo some time ago. So just clone git://linuxtv.org/v4l-utils.git
> and use that.
> 

Here is v4l2-compliance master without removing the flag from the driver 
this time. I however had to keep the codepath mentionned earlier commented.

# v4l2-compliance --stream-from-hdr test-25fps.h264.hdr -s250
v4l2-compliance SHA: fd74ecee9020fcf80b3b9628f277d9311b443395, 64 bits

Compliance test for meson-vdec device /dev/video0:

Driver Info:
	Driver name      : meson-vdec
	Card type        : Amlogic Video Decoder
	Bus info         : platform:meson-vdec
	Driver version   : 5.4.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected Stateful Decoder

Required ioctls:
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 2 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test blocking wait: OK
	Video Capture Multiplanar: Captured 250 buffers
	test MMAP (select): OK
	Video Capture Multiplanar: Captured 250 buffers
	test MMAP (epoll): OK
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for meson-vdec device /dev/video0: 49, Succeeded: 49, Failed: 0, 
Warnings: 0

Maxime

 >
> Regards,
> 
> 	Hans
> 

