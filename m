Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91D9AF1A25
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 16:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbfKFPhi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 10:37:38 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:38119 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727129AbfKFPhi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 10:37:38 -0500
Received: from [IPv6:2001:420:44c1:2577:dd0c:75f0:7ccb:ac5a]
 ([IPv6:2001:420:44c1:2577:dd0c:75f0:7ccb:ac5a])
        by smtp-cloud9.xs4all.net with ESMTPA
        id SNMxiod2G9P9bSNN0ieLmp; Wed, 06 Nov 2019 16:37:32 +0100
Subject: Re: [PATCH 0/5] Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
To:     Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, leonard.crestez@nxp.com,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com
References: <1573053633-21437-1-git-send-email-mirela.rabulea@nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <87d80882-b032-f332-0808-d669600f844f@xs4all.nl>
Date:   Wed, 6 Nov 2019 16:37:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1573053633-21437-1-git-send-email-mirela.rabulea@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDdX7D9rseKh8lAwDMMNwaOzCMluGQOcvybOlIVb/fUHxpfIy/OVNw4K3cwguOTRZFYHEfGoT2gmmymyeKhlMGQ83J4lXFssVcGgDsa/Cd8cU2Js+1PQ
 MUfYhEF42MUK+BxHdLzqbPhX4s4stBQY8NYQvnnUT8LtCqCd9DLBPlWGNTwpzG2Ic5mYpeIygiFFVXJtzA3EIeNOkvjsp/tzUfCsaXH43eYhPPmOy499Nval
 zGxM1wdTJUT/U6Ig+HzXi9gJ98QthCpmAuW2/JfyRr1w1qHP7K/CEK6bs6tGdYySUTf7600I58V7AESN339D0cfNlXwzMH5j+OlGFI/Aq6ZHFiaqdRVG+rgl
 gJgoVW78L0rGyfitVglEL4Hh0w9/iNOhjEpm79NSbiACbEWoBYYeSPy1qlmZgoiSXwwTMOiJXSpqewbs4isn4IOd0SXed/Ue3PdbrPsyq20WcwFuLwfgobN/
 +tg83Mo6/H3Kmb5F91PYJvhE6ugJRPzn6i3k8Kx36GPmpqN8oa34LQWdzPiyEO7sofGSlioiNzjKzNd+t776a+1qjezsWzBJULhO0XOrfcejMbe6EQqRessx
 vfeXhLQY6kqOjZqgStGEcgGEPAQRXrY8P4lIrw+gwKBObh76fnGFnJxhC48hGP/ENKLmoym+nYWTSxRL/IaJKTUmVv7MVSV8GWJ8JD5BlSIH75pBBT4AkieB
 Enzei+gi2tz1FrVrSIq/6cztK8mdDT1jC5+GmKA5XS0Z5XBvY4W9dX4lSNCWAbr8tErSCeM9Z+csUQFBGePYMwUAuaUwZjTAKKd4+6ftQiunlBhUr5YrO9b5
 kh8aqN/rHrGBPu4qm/u7hxki2vkKorIcrs5smHNLydRDfR2B8k/mwrF/n/iduoPRbFV2vUSip/STzItjtrOYJ29IcFkJXgX3tje6Gt+eBYH4D9rzOq/U/8Mj
 sSSD3S4/Q4sZgLQ2mSaKqBXrr8eieNQhcQPMRS8E5KUc0Jf/fjxQ2Bed2xWiApVCyQvOQw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mirela,

On 11/6/19 4:20 PM, Mirela Rabulea wrote:
> This patch set adds the V4L2 driver for i.MX8QXP/QM JPEG encoder/decoder
> and it's dependencies.
> The driver was tested on i.MX8QXP, using a unit test application and
> the v4l2-compliance tool, which passes when run on the encoder/decoder dev
> node, without any other parameters:
> v4l2-compliance -d /dev/video0
> v4l2-compliance -d /dev/video1
> v4l2-compliance SHA: 2ff1e6b3d67dbbdde212c8cf0de603f9f52078ed, 64 bits

That's too old. Always test with the latest version from the v4l-utils git
repo (git://linuxtv.org/v4l-utils.git). v4l2-compliance is continually
improved, so driver testing should always be done with the latest version.

For the JPEG encoder you can add the -s option to v4l2-compliance. Unfortunately,
the streaming tests for JPEG decoders in v4l2-compliance are not well supported
at the moment, so you can't use -s there.

Please provide the full output of the v4l2-compliance command as well, I'd
like to see the actual output.

Thank you very much for working on this, always nice to see new HW support.

Regards,

	Hans

> 
> The first patch "Add packed YUV444 24bpp pixel format" was already reviewed
> upstream, but not accepted because there was no driver using this format,
> until now. This pixel format, YUV444 24bpp, is now used and needed by the
> i.MX8QXP/QM JPEG encoder/decoder driver.
> 
> Mirela Rabulea (5):
>   media: v4l: Add packed YUV444 24bpp pixel format
>   firmware: imx: scu-pd: Add power domains for imx-jpeg
>   media: dt-bindings: Add bindings for i.MX8QXP/QM JPEG driver
>   media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
>   arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
> 
>  .../devicetree/bindings/media/imx8-jpeg.yaml       |   83 +
>  Documentation/media/uapi/v4l/pixfmt-packed-yuv.rst |   37 +-
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |    8 +
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   37 +
>  drivers/firmware/imx/scu-pd.c                      |    6 +
>  drivers/media/platform/Kconfig                     |    2 +
>  drivers/media/platform/Makefile                    |    1 +
>  drivers/media/platform/imx-jpeg/Kconfig            |   10 +
>  drivers/media/platform/imx-jpeg/Makefile           |    3 +
>  drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c      |  168 ++
>  drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h      |  140 ++
>  drivers/media/platform/imx-jpeg/mxc-jpeg.c         | 2266 ++++++++++++++++++++
>  drivers/media/platform/imx-jpeg/mxc-jpeg.h         |  187 ++
>  drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
>  include/uapi/linux/videodev2.h                     |    1 +
>  15 files changed, 2949 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/media/imx8-jpeg.yaml
>  create mode 100644 drivers/media/platform/imx-jpeg/Kconfig
>  create mode 100644 drivers/media/platform/imx-jpeg/Makefile
>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c
>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h
>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.c
>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.h
> 

