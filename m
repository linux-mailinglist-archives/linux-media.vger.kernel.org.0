Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59FAAECF12
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2019 15:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfKBOGP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Nov 2019 10:06:15 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:46723 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726454AbfKBOGP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 Nov 2019 10:06:15 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Qu2Zirp2kTzKrQu2cidLLQ; Sat, 02 Nov 2019 15:06:12 +0100
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Michael Ashton <mpa@fb.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        jacopo mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [ANN] Report of Media Summit: V4L2 Future Work
Message-ID: <756c2d9c-ef4d-9f56-d6bd-a09767ec2ae8@xs4all.nl>
Date:   Sat, 2 Nov 2019 15:06:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPAVGWPC+vtPPFt9HUkQ482OpPJu/kjTqQYV1a5MPPyMs3oXdrZxIdCjwAMmgJ+sEAjyAPZNn+p1Nl/tqcp7cZCU3lzDwcRym/MhcCGgUY6j3JYtXevc
 iHp++g6+FDWLYMQ9Pf4cyHzYNJj4L7ojzbyKrEyTY0WPoslgUfOepKWi6MO3sqXVrC3Pc21c/7FKY1Tvot6l2sHkTVqYxHOVWEsuq3JZUolCIwR9A3sphGwz
 shpxiEROHrj42DIpRj1Dg3CJAMyR6SHCg0op8RGD+XPIozIgfBcsC4NHZy5edRpxndtoWBVqie2AuclclPQs2PZaiyr+5aAB5qng9VudbfcS2Vab2o/MkAO0
 v4N0nKIJRWhxvZufvw+fJZYyutLAhkzA56tVFGWc44nO1BmrrJkvVuxc2JduO69DxSekmSxT6fHeGI3kHqevf1+cHQM5QRQBYG/bW3IGVdJFvdFVlVF6BcO+
 IexL7yIJ2xCPtEjGf7PsDxdDkaC2fzdYESzFqXGU4xnOT6DOLjUV609EXJRlSAEaasfNfizdJblsZbfQCd1/HzoUDlhxNFhoEVB/CzEiqoan2W+RDvhaLNOc
 USe4fO+AesqJjBqwlzS+nHuKoVO7wOcjFd06t3Q2MqGN3sx4NtAT7202kvT++14hSiMtO6EnFOtxrSP2VAEIsQ4yVSqQeVCFHk/8aBFs44nA4Eyn1vHn+Vzi
 jHgtUjIOkFynvxNm9TrofkkflKJfhUKdVd1EDDHmaxdjHT4jWUOA5Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Media Summit: V4L2 Future Work
October 30, 2019 - Lyon, France

Many thanks to the Linux Foundation for hosting this meeting. Much appreciated!

Please reply to this report with any comments/corrections. Especially if I missed
any action items or attendees!


Original announcement:

https://lore.kernel.org/linux-media/2ef17f32-5957-7b52-fea3-19913ec1c7b3@xs4all.nl/T/


Attendees:

Michael Ashton <mpa@fb.com> (Facebook/Oculus)
Boris Brezillon <boris.brezillon@collabora.com>
Alexandre Courbot <acourbot@chromium.org> (Google, Chrome OS)
Nicolas Dufresne <nicolas@collabora.com>
Tomasz Figa <tfiga@chromium.org> (Google, Chrome OS)
Ezequiel Garcia <ezequiel@collabora.com>
Daniel Gomez <daniel@qtec.com>
Peter Griffin <peter.griffin@linaro.org>
Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Eugen Hristev <eugen.hristev@microchip.com>
Shuah Khan <skhan@linuxfoundation.org>
Helen Koike <helen.koike@collabora.com>
Jacopo Mondi <jacopo@jmondi.org>
Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Niklas Söderlund <niklas.soderlund@ragnatech.se>
Stanimir Varbanov <stanimir.varbanov@linaro.org>
Hans Verkuil <hverkuil@xs4all.nl> (Cisco Systems Norway)


V4L2 Future Work
----------------

This discussion was intentionally not very structured. The goal was
to see what the main pain points are and how to fix those.

Boris Brezillon made an RFC v3 with proposed new ioctls:

https://patchwork.linuxtv.org/cover/59345/


The main blockers for drivers/userspace today with our current
API are:

- Missing format (DRM) modifier support
- one dmabuf fd with per-plane offsets (mplane API today requires
  separate dmabuf fds for each plane)
- userspace cannot specify offsets of planes

Note that the DRM modifiers are per frame and not per plane.
Typically the modifiers describe tiled and/or compressed formats.
Compressed formats are typically lossless HW compression schemes
(often proprietary) used to reduce memory bandwidth. Compressed
formats are considered opaque formats by userspace.

EGL has a dma-buf extension that supports modifiers (see
EXT_image_dma_buf_import_modifiers). Also see Wayland protocol:
https://gitlab.freedesktop.org/wayland/wayland-protocols/blob/master/unstable/linux-dmabuf/linux-dmabuf-unstable-v1.xml


While not strictly a blocker feature, it is desirable to get
rid of the distinction between the single and multiplane APIs
and always describe formats as multiplane. The advantage of
the multiplane API is that bytesperline and sizeimage are
described per plane, which is much easier to understand, and it
does not require userspace to calculate bytesperline for the chroma
planes.


The RFCv3 replaces v4l2_format with a new struct, but the consensus
was that it is much better to create a new ioctl just to replace the
v4l2_pix_format struct and leave the other structs in the v4l2_format
union alone. Two reasons: there is no need to change anything for the
other VBI etc. buffer types, it's only v4l2_pix_format that no longer
scales; and it is easy to extend a struct v4l2_pix_format_ext in the
future. You can't really do that if it is in a union.


If a new ENUM_FMT_EXT ioctl is created, then let it return all
pixelformats + modifiers combinations rather than having to enumerate
over all combinations. This reduces the number of ioctl calls that
userspace has to do.

To indicate if a format supports supports putting all planes in one
buffer, or supports putting each plane in a separate buffer, new format
flags are needed. Userspace needs to know this.

The vb2 core should check if all planes belong to the same buffer or not,
and validate it based on the driver requirements. I.e. in the case of
dmabuf import it should check that all dmabuf FDs refer to the same
memory and that the per-plane offsets are valid.

The current RFCv3 drops the v4l2_timecode field. Nicolas mentioned that
while this is not used by any mainline drivers (except virtual drivers)
this is in fact used by out-of-tree drivers. While they don't use the
same struct, they do return this information since it is used by broadcast
systems. So this field needs to return.


In the past there was a discussion of creating new fourcc codes to
describe pixelformats for both DRM and V4L2. This didn't work out, but
it was suggested that we just document the mapping between DRM and V4L2
pixelformats as a reference to end-users. We can maintain that as part of
our V4L2 documentation.


The suggestion was made to add a channel number to the new format struct
and to the streaming I/O ioctls to indicate support for streaming
multiple channels. This would allow the M2M framework to support multiple
capture and output streams per instance, something that is not possible
today. One use-case would be support for H.264 Scalable Video Coding.
Another is support for compositors.

This would need more research, but the new API should prepare for this.


A known outstanding issue is syncing buffers between the CPU and the
device. Drivers that want to update the buffer before returning it
to userspace do not make the right dmabuf calls. A patch series fixing
this was never finished. Google offered to pick this up and give it
another try.


The general consensus was that these proposed new ioctls only address
part of the problems. The complexity of modern camera pipelines creates
too many video and v4l-subdev devices, making it very hard for userspace
to control all of this.

Ideally it should be possible to control a camera ISP through a single
/dev/mediaX only, rather than though a myriad of other devices. This
is however a huge change, requiring a lot of work. Quite possible a
completely new API would be required for this. There is real interest
in solving this problem, which includes assigning resources to work
on this.

Google will collect some requirements and report on that later this year.
Based on that we might decide on a three day brainstorm session in
Brussels before or after FOSDEM (Feb 1-2, 2020).


Action Items
------------

Nicolas Dufresne:

- provide more info about timecode use in userspace for Hans Verkuil
  to verify if struct v4l2_timecode provides sufficient information.

Tomasz Figa:

- Check if we can drop support for using two memory banks for luma and
  chroma planes? It's only used by the s5p architecture, and dropping
  support for that would simplify some of the code. Note that s5p doesn't
  support dmabuf.

- Continue work on my old patch series dealing with dma_buf_begin/end_cpu_access():

  https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=vb2-cpu-access

  This series converts most drivers to use these dmabuf functions.

  See also this thread: https://patchwork.kernel.org/patch/7159871/
  As mentioned in my last reply, the outstanding drivers that are not
  converted are netup_unidvb, coda, exynos4-is, rcar_jpu and au0828:
  as far as I remember I did not know how to convert coda and exynos4-is
  and never found the time to figure that out. The others are new and need
  to be looked at again. There are probably more drivers that need work
  since my patch series is from September 2015.

- Collect API requirements for a camera ISP API and report on that later
  this year.

Boris Brezillon:

- Post an RFCv4 that takes more of these issues into accounts. Research
  multistream support a bit more to see what would be involved adding support
  for that.
