Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08F9145DCEE
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 16:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236671AbhKYPMe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 10:12:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237283AbhKYPL1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 10:11:27 -0500
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F36C061746;
        Thu, 25 Nov 2021 07:08:12 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qGM3m7t9G1HGJqGM6m3XbT; Thu, 25 Nov 2021 16:08:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637852891; bh=lUXHDU++diczvNIMw4BSOv0xLDv2tW+enr4E4KlWjZ0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YNfjgQ8DqCWurWzS0s96GKL/vdoGE5VtxKmKXt7eeA2lndyGFz+G3TuyT1/ZXZfpA
         AGi1n9h2Zqn4/ErSXuuaelPYgf/xGvaj23S0iXynQBRGhp3/Hg+MEKN0IQJ7uqCJ4k
         3kReS4G0Qn6FGbDi/VuqJfiqVXdd2i3UAXxwpRJmYTStqY+ASbNgkdSK0pcWPOUZRC
         sQxrTn0jGHsPiw4fNd3Zxr+cRwBRj7tNl1BEeB0wTBZdxPjSL4SKxjaxV6ly10RqEH
         aPqgq2/qhjR5UALbMaxgJmZA/NbR8MJR0URRHUuBzcsl7x/R6nS0skzN8IhSuCfYAt
         8DFCMklDWSh9w==
Subject: Re: [PATCH v3 0/6] staging: media: wave5: add wave5 codec driver
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        laurent.pinchart@ideasonboard.com, kernel@collabora.com,
        dafna3@gmail.com, bob.beckett@collabora.com,
        kiril.bicevski@collabora.com,
        Nas Chung <nas.chung@chipsnmedia.com>,
        lafley.kim@chipsnmedia.com, scott.woo@chipsnmedia.com,
        olivier.crete@collabora.com, dan.carpenter@oracle.com,
        rdunlap@infradead.org
References: <20211110120910.12411-1-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c8a766f2-137b-5c17-74b0-6acf6e0338d2@xs4all.nl>
Date:   Thu, 25 Nov 2021 16:08:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211110120910.12411-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGNuXXSmyrsfIIrCpxf1wp++V9Rag1wezYju3KhWz+SM38RcpslOgMJpVKGgeTVvmTPNWLGgWJyOp/jAhYNi+11XLoZJK+qrCRU7LJI8luMOOySz33jb
 XqG3sPB/149iG+MfAcNptTcAqbKq9CklVo0PsXjEZJKwGmJHJEwzaY1/C2px1oJnHyO78Rr3NMeSMoGh0h3RTTeio3y3+WPb5jXGzCeZqC6Y9xana1js2jXY
 KcHXGS5skpqfSyq0BlPcyYx6WnIuky8kkwPmLybaryqqy+dSmKXyT/Ey3EcvFFMuqNDMKMJd7DcCNLkK5PxBeZ/CiBuKPZEd5qfSSr9O//cs08AGvNZXXJDu
 rXefyICf+SgRse7BBZxSseXWpAYfuOxIwFgdneEwo241+BPf+xyOG5jXKHx1j0D5DESS/2ZO8wPWPJhoJ0SRFnOpZvSu3UtrKcMGypy+pxaxgGn6BqsAov7j
 pMoogIzJ4Ue8uleymKxoHsi2JTAQDOILJVYnRA5KH2ByK4iaTAFUwxGgMOIj52xqKwbpfqyfhVB4Pm0xVfRjemKc7dnbyjqb/NrNAnkFSBXQpeSdUpCP6Zir
 2r1ZvNX7Ypo1VYICGWVh/bddWqinHsA35vEwiiVeeW7OVSNrgNAH/e6+8HU8GLYXYyzANPeDAju5VOWJ3OWymx/nQqXRH0iOxnM3KtmWrBpMNk44c3ANUKxf
 50jpSkTs0tpZu38wJGnj74zMqZmB9zFtb6GHuogVjsFC+HZGyrSl49yHr1Q7MPcUC73ytWRE6qRrgdaBM5efCTLLFOnfBz/ei5pGOddqhNY/tCiTshpTyQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Just a high-level comment below:

On 10/11/2021 13:09, Dafna Hirschfeld wrote:
> The wave5 codec is a stateful encoder/decoder.
> It is found on the JH7100 SoC.
> 
> The driver currently supports V4L2_PIX_FMT_HEVC, V4L2_PIX_FMT_H264.
> 
> This driver has so far been tested on pre-silicon FPGA and on the beta BeagleV
> board which uses the StarFive JH7100 beta SoC.
> 
> Testing on FPGA shows it working fine, though the FPGA uses polled interrupts
> and copied buffers between the host and it's on board RAM.
> 
> Testing on BeagleV shows buffer corruption that is currently attributed to a
> known silicon issue in the SoC that makes the cache coherent interconnect not
> so coherent.
> This can likely be solved when the riscv non-coherent dma support lands and
> provide optional v4l2 non-contiguous allocator, though it remains to be seen
> whether support non-coherent use cases will be useful in real world hw.
> 
> Until we can test and resolve any issues on final silicon (due 2H 2021)
> this driver should remain in staging.
> 
> We currently tested only the decoder.
> Testing the encoder is currently impossible because of the BeagleV buffer problems,
> That will need to be tested once we have fixed beaglev buffer problems.
> 
> v4l2-compliance all pass for v2 as well.
> 
> changes since v1:
> 
> Main fixes includes:
> * change the yaml and dirver code to support up to 4 clks (instead of one)
> * fix Kconfig format
> * remove unneeded cast,
> * change var types
> * change var names, func names
> * checkpatch fixes
> 
> 
> Dafna Hirschfeld (4):
>   staging: media: wave5: Add vpuapi layer
>   staging: media: wave5: Add the vdi layer
>   staging: media: wave5: Add the v4l2 layer
>   staging: media: wave5: Add TODO file
> 
> Robert Beckett (2):
>   dt-bindings: media: staging: wave5: add yaml devicetree bindings
>   media: wave5: Add wave5 driver to maintainers file
> 
>  .../bindings/staging/media/cnm,wave.yaml      |   73 +
>  MAINTAINERS                                   |    9 +
>  drivers/staging/media/Kconfig                 |    2 +
>  drivers/staging/media/Makefile                |    1 +
>  drivers/staging/media/wave5/Kconfig           |   12 +
>  drivers/staging/media/wave5/Makefile          |   10 +
>  drivers/staging/media/wave5/TODO              |   59 +
>  drivers/staging/media/wave5/vdi.c             |  260 ++
>  drivers/staging/media/wave5/vdi.h             |   76 +
>  drivers/staging/media/wave5/vpu.c             |  367 ++
>  drivers/staging/media/wave5/vpu.h             |   64 +
>  drivers/staging/media/wave5/vpu_dec.c         | 1397 +++++++
>  drivers/staging/media/wave5/vpu_enc.c         | 1585 ++++++++
>  drivers/staging/media/wave5/vpuapi.c          | 1066 +++++
>  drivers/staging/media/wave5/vpuapi.h          | 1140 ++++++
>  drivers/staging/media/wave5/vpuconfig.h       |   85 +
>  drivers/staging/media/wave5/vpuerror.h        |  455 +++
>  drivers/staging/media/wave5/wave5-hw.c        | 3476 +++++++++++++++++
>  drivers/staging/media/wave5/wave5.h           |   81 +
>  drivers/staging/media/wave5/wave5_regdefine.h |  638 +++

Please prefix the source/header filenames with 'wave5_' (or 'wave5-',
as long as it is consistent).

See e.g. drivers/staging/media/hantro/ or really any media driver.
If you just see the filename then you can at least tell for which driver
it is. Just 'vpu.c' is not descriptive enough.

For the next version I would also like to see the v4l2-compliance output.

Regards,

	Hans

>  20 files changed, 10856 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/staging/media/cnm,wave.yaml
>  create mode 100644 drivers/staging/media/wave5/Kconfig
>  create mode 100644 drivers/staging/media/wave5/Makefile
>  create mode 100644 drivers/staging/media/wave5/TODO
>  create mode 100644 drivers/staging/media/wave5/vdi.c
>  create mode 100644 drivers/staging/media/wave5/vdi.h
>  create mode 100644 drivers/staging/media/wave5/vpu.c
>  create mode 100644 drivers/staging/media/wave5/vpu.h
>  create mode 100644 drivers/staging/media/wave5/vpu_dec.c
>  create mode 100644 drivers/staging/media/wave5/vpu_enc.c
>  create mode 100644 drivers/staging/media/wave5/vpuapi.c
>  create mode 100644 drivers/staging/media/wave5/vpuapi.h
>  create mode 100644 drivers/staging/media/wave5/vpuconfig.h
>  create mode 100644 drivers/staging/media/wave5/vpuerror.h
>  create mode 100644 drivers/staging/media/wave5/wave5-hw.c
>  create mode 100644 drivers/staging/media/wave5/wave5.h
>  create mode 100644 drivers/staging/media/wave5/wave5_regdefine.h
> 

