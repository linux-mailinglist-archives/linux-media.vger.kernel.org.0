Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9AF25A192
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 18:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfF1Q51 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 12:57:27 -0400
Received: from mout.gmx.net ([212.227.15.19]:56843 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbfF1Q51 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 12:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561741026;
        bh=jQN9uQnWE9q4sKyUsBcJz7asKRCZXs1lpMEm+3SXt6o=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Dc8KbwCSHaRPaaxaXCJ8vFOvc0vUxw/uLOo0r9uevGXKc8nkElFvxKTiiuygEzsub
         OUEtLTJ0mVeQucXY/I5Faqe9oT0ss6h6zlwoAc3yvixsZXfC5AoBzW3iKDaaKyNBQ8
         g7SaBBb2NQvq5SqmOqXlmeTq5fKO4Krs6efv9nSo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.111]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKsjH-1hzoc83eFZ-00LJE2; Fri, 28
 Jun 2019 18:57:05 +0200
Subject: Re: [PATCH 00/31] staging: bcm2835-camera: Improvements
To:     Hans Verkuil <hverkuil@xs4all.nl>, Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
 <f4492041-2587-eedb-8ae5-ae610e90fde2@xs4all.nl>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <24265b85-a12a-7a46-91d1-f20f5a133f8b@gmx.net>
Date:   Fri, 28 Jun 2019 18:57:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <f4492041-2587-eedb-8ae5-ae610e90fde2@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:Yf35tDsGnOPt9yOS+/i7y5kuy5UmZ0auV8VpO3ff8YYineCkeCX
 DlXAgpLLJ9O8bmVc5Y4gWKl0ekRjXQsqs4ztlT+DI3YMdr66SEa6bb45GmgqmgvANzHtZPB
 QFVJ3PKESD6efl/qNnoaJTlBNwgnPKWdCtpc23q0/iv1/Y1fmGPA1a3WTw/UFosGwrKVjjJ
 sEbwhwDZv/pSjCBqE0+OQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Dapqhu54Jaw=:U6pDR0Fi9RH/1KKgQh6drE
 S+LAHg58cJ8llRjzjwMoF+bXqUtyEgS14EpPu/h/FW7IiOxNioDJlc6PbzwvSeye1wf+RFZNg
 ui/nMO9/hmHgW5Kae+/ZhMaAZoPWrtqjNzdNBybu389jaYvgXZUBqUHdwv5M8AEnzpfYvG9AZ
 6PHg23v0tBLOXJKO0oxsUak78Vm0Dn3UZyAmVQLvFbV1q73tSTRK4l3v59XPMyR3h120QZhCR
 YP9jBNL4KrsDFEo1AYYtq3DcWPJDor6xN3Yvr9Pbi+UCkK8RJRw0O0IULjDqTyuCWlZYawl8T
 lxts5t6vrgXgS8SAsLwBgZ6oV4M6dxP3nn8c4lw27H0RXTx7gPi1P1YsVqkT0cShgvuSnY0lc
 63XFwngzOmv0LvhlXXm6LNJe1EXAfBXOsPCbB0gAlPicIZJSE4yjrGTQR1Y3I2rgQut0JmDUa
 qYSsW+RPLE5AEOc4Wnr/JtzA7bh3f15rPhTNzIo4VVEhDeoizBN5ADXgPHu6r3umKe+qVYwJp
 l87FiFLZWVfqAYYWNaynPPzvpP/NV4Fu/RUUyAvvB+thw5XUHOVodKoc6LhH/+uwVkaw2tNHo
 J1DXBt2dFG1wPHmJsdu0N/6qyOZ9TSuZmt5K/oLZCRheVXLGuyXK5WipF23XJYo+v+BRmCGSn
 MXqNPH739r3ZXgkatdohpqETLyzYyWOhec9NY0zlM9Z+8qlrmigLCLvRJGextapdwUXy0aIkg
 MAw/Gn5n1Fp6RhT8ksb7p8UZmw7jIpeCXU/HzWbquj3t2P61bPOLLi39bAAR0uw3UHxp6Tvb7
 5Yxt+x2LIyn0sDzHGDK/9w1MiRJv68gkOYFfmY8WOyIVMcN/+Vp9CJn7nQYQ+JJmMBLT2q53Y
 E2JYYe4WzpiD1YYYLujjwB2HLMWcm1XH1YLCgXHpfbGGMt8Af3K0nbEfbldStCLyti9k1Okh3
 eXl3i9JPZv4hwLczqL0SfQBQJGEe73s8r8DAOl1cxrn2aD6nPDezNzXeGN7mQS1IiAmNhEYiA
 zaklv1zqrkaESlbFuvLssaI1D/BSvDUEU1a3wDKdVAqqVMd3kXF4W7B0/oSk/QqOLCj8l85IG
 5vQMMPeha1YlD4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Am 28.06.19 um 10:06 schrieb Hans Verkuil:
> Hi Stefan,
>
> On 6/27/19 8:55 PM, Stefan Wahren wrote:
>> This is an attempt to help Dave Stevenson to get all the fixes and
>> improvements of the bcm2835-camera driver into mainline.
>>
>> Mostly i only polished the commit logs for upstream.
>>
>> The series based on the latest bugfix V2 of staging: bcm2835-camera: Re=
sto=3D
>> re
>> return behavior of ctrl_set_bitrate().
> Thank you for working on this.
>
> Three high-level questions:
>
> 1) Can you post the output of 'v4l2-compliance -s' using the latest v4l2=
-compliance
>    from https://git.linuxtv.org/v4l-utils.git ?  I'm interested to see w=
hat the
>    status is of this driver w.r.t. the compliance tests.

Before this series (Raspberry Pi 3, Camera 1.3, Linux
5.2.0-rc3-next-20190607, multi_v7_defconfig):

v4l2-compliance SHA: b16f9e945d74aa552abdd6f873821cb77faaf13a, 32 bits

Compliance test for bm2835 mmal device /dev/video0:

Driver Info:
=C2=A0=C2=A0=C2=A0 Driver name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : bm2835 mmal
=C2=A0=C2=A0=C2=A0 Card type=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : m=
mal service 16.1
=C2=A0=C2=A0=C2=A0 Bus info=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 : platform:bcm2835-v4l2
=C2=A0=C2=A0=C2=A0 Driver version=C2=A0=C2=A0 : 5.2.0
=C2=A0=C2=A0=C2=A0 Capabilities=C2=A0=C2=A0=C2=A0=C2=A0 : 0x85200005
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Video Capture
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Video Overlay
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Read/Write
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Streaming
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Extended Pix Format
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Device Capabilities
=C2=A0=C2=A0=C2=A0 Device Caps=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 0x05200005
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Video Capture
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Video Overlay
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Read/Write
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Streaming
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Extended Pix Format

Required ioctls:
=C2=A0=C2=A0=C2=A0 test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
=C2=A0=C2=A0=C2=A0 test second /dev/video0 open: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_QUERYCAP: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_PRIORITY: OK
=C2=A0=C2=A0=C2=A0 test for unlimited opens: OK

Debug ioctls:
=C2=A0=C2=A0=C2=A0 test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_LOG_STATUS: OK

Input ioctls:
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supporte=
d)
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_ENUMAUDIO: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S/ENUMINPUT: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_AUDIO: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_MODULATOR: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_ENUMAUDOUT: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_AUDOUT: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
=C2=A0=C2=A0=C2=A0 test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supporte=
d)
=C2=A0=C2=A0=C2=A0 test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
=C2=A0=C2=A0=C2=A0 test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_QUERYCTRL: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_CTRL: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S/TRY_EXT_CTRLS: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 Standard Controls: 33 Private Controls: 0

Format ioctls (Input 0):
=C2=A0=C2=A0=C2=A0 test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_PARM: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_G_FBUF: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_G_FMT: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_TRY_FMT: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_S_FMT: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test Cropping: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test Composing: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test Scaling: OK

Codec ioctls (Input 0):
=C2=A0=C2=A0=C2=A0 test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_G_ENC_INDEX: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 fail: v4l2-test-buffers.cpp(715): q.=
create_bufs(node, 1, &fmt)
!=3D EINVAL
=C2=A0=C2=A0=C2=A0 test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
=C2=A0=C2=A0=C2=A0 test VIDIOC_EXPBUF: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
=C2=A0=C2=A0=C2=A0 test read/write: OK
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 fail: v4l2-test-buffers.cpp(2145): n=
ode->streamon(q.g_type())
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 fail: v4l2-test-buffers.cpp(2224): t=
estBlockingDQBuf(node, q)
=C2=A0=C2=A0=C2=A0 test blocking wait: FAIL
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 fail: v4l2-test-buffers.cpp(1294): q=
.create_bufs(node, 1, &fmt)
!=3D EINVAL
=C2=A0=C2=A0=C2=A0 test MMAP (no poll): FAIL
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 fail: v4l2-test-buffers.cpp(1294): q=
.create_bufs(node, 1, &fmt)
!=3D EINVAL
=C2=A0=C2=A0=C2=A0 test MMAP (select): FAIL
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 fail: v4l2-test-buffers.cpp(1294): q=
.create_bufs(node, 1, &fmt)
!=3D EINVAL
=C2=A0=C2=A0=C2=A0 test MMAP (epoll): FAIL

After this series:

v4l2-compliance SHA: b16f9e945d74aa552abdd6f873821cb77faaf13a, 32 bits

Compliance test for bm2835 mmal device /dev/video0:

Driver Info:
=C2=A0=C2=A0=C2=A0 Driver name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : bm2835 mmal
=C2=A0=C2=A0=C2=A0 Card type=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : m=
mal service 16.1
=C2=A0=C2=A0=C2=A0 Bus info=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 : platform:bcm2835-v4l2
=C2=A0=C2=A0=C2=A0 Driver version=C2=A0=C2=A0 : 5.2.0
=C2=A0=C2=A0=C2=A0 Capabilities=C2=A0=C2=A0=C2=A0=C2=A0 : 0x85200005
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Video Capture
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Video Overlay
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Read/Write
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Streaming
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Extended Pix Format
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Device Capabilities
=C2=A0=C2=A0=C2=A0 Device Caps=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 0x05200005
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Video Capture
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Video Overlay
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Read/Write
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Streaming
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Extended Pix Format

Required ioctls:
=C2=A0=C2=A0=C2=A0 test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
=C2=A0=C2=A0=C2=A0 test second /dev/video0 open: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_QUERYCAP: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_PRIORITY: OK
=C2=A0=C2=A0=C2=A0 test for unlimited opens: OK

Debug ioctls:
=C2=A0=C2=A0=C2=A0 test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_LOG_STATUS: OK

Input ioctls:
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supporte=
d)
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_ENUMAUDIO: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S/ENUMINPUT: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_AUDIO: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_MODULATOR: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_ENUMAUDOUT: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_AUDOUT: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
=C2=A0=C2=A0=C2=A0 test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supporte=
d)
=C2=A0=C2=A0=C2=A0 test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
=C2=A0=C2=A0=C2=A0 test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_QUERYCTRL: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_CTRL: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S/TRY_EXT_CTRLS: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 Standard Controls: 33 Private Controls: 0

Format ioctls (Input 0):
=C2=A0=C2=A0=C2=A0 test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_PARM: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_G_FBUF: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_G_FMT: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_TRY_FMT: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_S_FMT: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test Cropping: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test Composing: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test Scaling: OK

Codec ioctls (Input 0):
=C2=A0=C2=A0=C2=A0 test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_G_ENC_INDEX: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
=C2=A0=C2=A0=C2=A0 test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
=C2=A0=C2=A0=C2=A0 test VIDIOC_EXPBUF: OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
=C2=A0=C2=A0=C2=A0 test read/write: OK
=C2=A0=C2=A0=C2=A0 test blocking wait: OK

Unfortunately in both cases the program hangs and never finish. This is
the output of strace:

ioctl(3, VIDIOC_DQBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE

It is possible that this is a problem with the used linux-next version.
Nevertheless the series is improvement.

> 2) What is the status of this driver from your point of view?
Sorry, i'm not a media expert. But i agree with Dan this needs
improvement of error handling. For example mapping the MMAL error codes
to Linux error codes would avoid confusion.
> What is needed to get it out of staging?

I think the driver needs more testing for 64 bit. Contrary to Raspbian a
lot of the "mainline" distributions only concentrate on arm64. But
currently i don't know of any 64 bit specific issues.

I also can't say anything about the content of the TODO file.

Regards
Stefan

