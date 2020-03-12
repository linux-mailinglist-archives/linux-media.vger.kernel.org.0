Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EED7E18299E
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 08:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388072AbgCLHS7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 03:18:59 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:35791 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387959AbgCLHS6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 03:18:58 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id CI7IjX0mY9Im2CI7LjicOY; Thu, 12 Mar 2020 08:18:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583997536; bh=/KrqBcwqQoOO3I1OlZC6/TWeeXBmR+fGZij0cskbKt4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=EiaFIDoLpU60E7OwVGs78+0VGvwODGDVAPrK0KaJmI7Xukm7+1AgycCFX1xSPB0a4
         ODXxFqvO4RTI34tA5H7kdsudoFc6GlDcX0PGgo8762wngiT4tn78QEvqkKDs3Xnn7a
         WyvChN78d4wTrUGKk+QXlYChhu0VJdjUTOzMA6YP7w74twuZWLkQ+8RJ9hQHx/UGfA
         MBo/P3YCEwU5qbnTpRjXoc9djjAMwg0+bncxHQcfeEwE/WUhcuziVk6OkmDjzrW38+
         e4thAFs08y8DatE+lebjlbjP1gBZx3AxguF8Ww4d0HcXNKn/gN+684Ya4DHA74djUo
         Ogq6j946m8hxA==
Subject: Re: [PATCH v2 03/22] media: docs: split cpia2.rst on two files
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
 <7f013c412e20cec66bf605bfccddc7f90fe187cd.1583847556.git.mchehab+huawei@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <bffb67d7-a8d3-ce4a-011e-f6bb4564e84c@xs4all.nl>
Date:   Thu, 12 Mar 2020 08:18:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7f013c412e20cec66bf605bfccddc7f90fe187cd.1583847556.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCnLJc1+mUDUwo5XOiKjuMOYHub20gGEvyZ1yixmkswaqc8+zpxD7EcqWczu5JRENhgQdac2bXrqdk8DrxIZyued385ppROoZpwdirql98oFZgF0F1Eu
 NvizudMjeZ3hq0xGX4AnJraEEsyEwdjqVXViGwfAToF/LeqgVU+9kkjRylezVnp0z/2CcMI5jhbin8zYjwByr9fnMj5b+8Xuah54MNIxV6IVnDCWVqQLjDjp
 +YB3HKN3JhHCjeJ/x4fWHXhyDCwCophaqlOQM4x42nhYb955EwhtFBmvB0sOwA/0WF9ubLXVRs5wGFqd7EFIAA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/10/20 2:42 PM, Mauro Carvalho Chehab wrote:
> In order to be able to better organize the subsystem, split the
> cpia2 information on two files: one user-facing and another one
> from Kernel development PoV.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/media/v4l-drivers/cpia2.rst     | 46 ---------------
>  .../media/v4l-drivers/cpia2_devel.rst         | 56 +++++++++++++++++++

In other patches the devel file is called foo-devel.rst, here it is cpia2_devel.rst
Can you change this to cpia2-devel.rst as well?

Also, IMHO using -dev instead of -devel feels nicer, although that might be
because I use debian where all developer packages use -dev as suffix :-)

Regards,

	Hans

>  Documentation/media/v4l-drivers/index.rst     |  2 +
>  3 files changed, 58 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/media/v4l-drivers/cpia2_devel.rst
> 
> diff --git a/Documentation/media/v4l-drivers/cpia2.rst b/Documentation/media/v4l-drivers/cpia2.rst
> index a86baa1c83f1..6f4258aebbfe 100644
> --- a/Documentation/media/v4l-drivers/cpia2.rst
> +++ b/Documentation/media/v4l-drivers/cpia2.rst
> @@ -147,49 +147,3 @@ We are providing a modified gqcam application to view the output. In
>  order to avoid confusion, here it is called mview.  There is also the qx5view
>  program which can also control the lights on the qx5 microscope. MJPEG Tools
>  (http://mjpeg.sourceforge.net) can also be used to record from the camera.
> -
> -Notes to developers
> -~~~~~~~~~~~~~~~~~~~
> -
> -   - This is a driver version stripped of the 2.4 back compatibility
> -     and old MJPEG ioctl API. See cpia2.sf.net for 2.4 support.
> -
> -Programmer's overview of cpia2 driver
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -
> -Cpia2 is the second generation video coprocessor from VLSI Vision Ltd (now a
> -division of ST Microelectronics).  There are two versions.  The first is the
> -STV0672, which is capable of up to 30 frames per second (fps) in frame sizes
> -up to CIF, and 15 fps for VGA frames.  The STV0676 is an improved version,
> -which can handle up to 30 fps VGA.  Both coprocessors can be attached to two
> -CMOS sensors - the vvl6410 CIF sensor and the vvl6500 VGA sensor.  These will
> -be referred to as the 410 and the 500 sensors, or the CIF and VGA sensors.
> -
> -The two chipsets operate almost identically.  The core is an 8051 processor,
> -running two different versions of firmware.  The 672 runs the VP4 video
> -processor code, the 676 runs VP5.  There are a few differences in register
> -mappings for the two chips.  In these cases, the symbols defined in the
> -header files are marked with VP4 or VP5 as part of the symbol name.
> -
> -The cameras appear externally as three sets of registers. Setting register
> -values is the only way to control the camera.  Some settings are
> -interdependant, such as the sequence required to power up the camera. I will
> -try to make note of all of these cases.
> -
> -The register sets are called blocks.  Block 0 is the system block.  This
> -section is always powered on when the camera is plugged in.  It contains
> -registers that control housekeeping functions such as powering up the video
> -processor.  The video processor is the VP block.  These registers control
> -how the video from the sensor is processed.  Examples are timing registers,
> -user mode (vga, qvga), scaling, cropping, framerates, and so on.  The last
> -block is the video compressor (VC).  The video stream sent from the camera is
> -compressed as Motion JPEG (JPEGA).  The VC controls all of the compression
> -parameters.  Looking at the file cpia2_registers.h, you can get a full view
> -of these registers and the possible values for most of them.
> -
> -One or more registers can be set or read by sending a usb control message to
> -the camera.  There are three modes for this.  Block mode requests a number
> -of contiguous registers.  Random mode reads or writes random registers with
> -a tuple structure containing address/value pairs.  The repeat mode is only
> -used by VP4 to load a firmware patch.  It contains a starting address and
> -a sequence of bytes to be written into a gpio port.
> diff --git a/Documentation/media/v4l-drivers/cpia2_devel.rst b/Documentation/media/v4l-drivers/cpia2_devel.rst
> new file mode 100644
> index 000000000000..decaa4768c78
> --- /dev/null
> +++ b/Documentation/media/v4l-drivers/cpia2_devel.rst
> @@ -0,0 +1,56 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +The cpia2 driver
> +================
> +
> +Authors: Peter Pregler <Peter_Pregler@email.com>,
> +Scott J. Bertin <scottbertin@yahoo.com>, and
> +Jarl Totland <Jarl.Totland@bdc.no> for the original cpia driver, which
> +this one was modelled from.
> +
> +
> +Notes to developers
> +~~~~~~~~~~~~~~~~~~~
> +
> +   - This is a driver version stripped of the 2.4 back compatibility
> +     and old MJPEG ioctl API. See cpia2.sf.net for 2.4 support.
> +
> +Programmer's overview of cpia2 driver
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Cpia2 is the second generation video coprocessor from VLSI Vision Ltd (now a
> +division of ST Microelectronics).  There are two versions.  The first is the
> +STV0672, which is capable of up to 30 frames per second (fps) in frame sizes
> +up to CIF, and 15 fps for VGA frames.  The STV0676 is an improved version,
> +which can handle up to 30 fps VGA.  Both coprocessors can be attached to two
> +CMOS sensors - the vvl6410 CIF sensor and the vvl6500 VGA sensor.  These will
> +be referred to as the 410 and the 500 sensors, or the CIF and VGA sensors.
> +
> +The two chipsets operate almost identically.  The core is an 8051 processor,
> +running two different versions of firmware.  The 672 runs the VP4 video
> +processor code, the 676 runs VP5.  There are a few differences in register
> +mappings for the two chips.  In these cases, the symbols defined in the
> +header files are marked with VP4 or VP5 as part of the symbol name.
> +
> +The cameras appear externally as three sets of registers. Setting register
> +values is the only way to control the camera.  Some settings are
> +interdependant, such as the sequence required to power up the camera. I will
> +try to make note of all of these cases.
> +
> +The register sets are called blocks.  Block 0 is the system block.  This
> +section is always powered on when the camera is plugged in.  It contains
> +registers that control housekeeping functions such as powering up the video
> +processor.  The video processor is the VP block.  These registers control
> +how the video from the sensor is processed.  Examples are timing registers,
> +user mode (vga, qvga), scaling, cropping, framerates, and so on.  The last
> +block is the video compressor (VC).  The video stream sent from the camera is
> +compressed as Motion JPEG (JPEGA).  The VC controls all of the compression
> +parameters.  Looking at the file cpia2_registers.h, you can get a full view
> +of these registers and the possible values for most of them.
> +
> +One or more registers can be set or read by sending a usb control message to
> +the camera.  There are three modes for this.  Block mode requests a number
> +of contiguous registers.  Random mode reads or writes random registers with
> +a tuple structure containing address/value pairs.  The repeat mode is only
> +used by VP4 to load a firmware patch.  It contains a starting address and
> +a sequence of bytes to be written into a gpio port.
> diff --git a/Documentation/media/v4l-drivers/index.rst b/Documentation/media/v4l-drivers/index.rst
> index eca22b82de94..72fbb394f6a2 100644
> --- a/Documentation/media/v4l-drivers/index.rst
> +++ b/Documentation/media/v4l-drivers/index.rst
> @@ -65,3 +65,5 @@ For more details see the file COPYING in the source distribution of Linux.
>  	vimc
>  	vivid
>  	zr364xx
> +
> +	cpia2_devel
> 

