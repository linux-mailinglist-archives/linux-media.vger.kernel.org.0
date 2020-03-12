Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADC271829B6
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 08:26:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388121AbgCLH0J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 03:26:09 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:40639 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387930AbgCLH0I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 03:26:08 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id CIEEjX3RN9Im2CIEHjieaT; Thu, 12 Mar 2020 08:26:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583997966; bh=cpKBziwmXVZm4TJr31kqddsze26dRQVt0z6dUA4yVow=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=WfwI7a8aIRBgaETVwTmZyntAx2Q5uC5R/cCiXQMubf9L5i6hwTfzyH0wpmsUmVnAn
         8Ts7Clbswhf6NW2YgXWu+695XJWdNNEj0wjNDgmBBBbCfxugW3k1cv5YFBLo/Jjrip
         Tp9G8iSmtS4s3qibfJzov3jP1wN4hru6/hYqATWvs4mdc3+WclIwSnMaeRxHyZvE7C
         5k+0DK6n7vxokKQ7fFN4vxd0tu1Mk2LMRCKynIgyElrQUPbp0/RkYRNN2pFrQ4KeZd
         IdUtd9r1FOCJ3rRzozk2sDkFN3VC2qy4JmOen2x1Ia2NJOluMmk6N2BykXYoBt5rTS
         HnUeFVDflz16g==
Subject: Re: [PATCH v2 20/22] media: docs: move driver-specific info to
 driver-api
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org, Mike Isely <isely@pobox.com>,
        Andy Walls <awalls@md.metrocast.net>,
        Antti Palosaari <crope@iki.fi>,
        Malcolm Priestley <tvboxspy@gmail.com>,
        Michael Krufky <mkrufky@linuxtv.org>
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
 <5dc2f7a4f15397d5e811d5bb8d110ee53135cf07.1583847557.git.mchehab+huawei@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f321b1c7-4163-10b6-8fe5-fea66aac69cd@xs4all.nl>
Date:   Thu, 12 Mar 2020 08:26:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5dc2f7a4f15397d5e811d5bb8d110ee53135cf07.1583847557.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAWcyoNLtx3vjilk1UNvlXj/XMt0S1hpEFqOzWuqxQ50S9q+Zc+yn0SvmPcZwVjQBYAAzw3/SuGvOPqF7ZtFmltM4oE91/cudx07IZV6sOJ778T55Tz6
 cBt+pSVCsz0nQFU1rtHkpXhK0USNiZ2FlyQQw1tvc/XTKU4xTtEw9DFxKh1IXQRq9yu2UiFsdqoRNHIoiFNQPCYAik5Dc5NU1uc7xPKgXbnJrs5V7mNZdCS2
 RloIDB8Jy+E1l97YRtvM6jhfLoIMy251CKM1ab56qabnRWzRrYIgpqKpGmNq97gCCOL0VnA103NO3j7YRk00uouOgcAyiMH2q8VMDb/rf1FFMdbL1enqWAKk
 bVJXxhBOLVkd6vPUREtsMmwJUOyVbk3EJz0wlSxjEuwLtfrfdfJRszrR3vGpt57p5M/og5hrxe+LZTVZ4g0erw5w4OC3KUWjZg4YNQlj5sBDBNpq/jY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/10/20 2:43 PM, Mauro Carvalho Chehab wrote:
> Those documents don't really describe the driver API.
> 
> Instead, they contain development-specific information.
> 
> Yet, as the main index file describes the content of it as:
> 
> 	"how specific kernel subsystems work
> 	 from the point of view of a kernel developer"
> 
> It seems to be the better fit.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../media/drivers}/bttv-devel.rst             |  0
>  .../media/drivers}/contributors.rst           |  0
>  .../media/drivers}/cpia2_devel.rst            |  0
>  .../media/drivers}/cx2341x-devel.rst          |  0
>  .../media/drivers}/cx88-devel.rst             |  0
>  .../media/drivers}/davinci-vpbe-devel.rst     |  0
>  .../media/drivers}/dvb-usb.rst                |  0
>  .../media/drivers}/fimc-devel.rst             |  0
>  .../media/drivers}/frontends.rst              |  0
>  .../media/drivers}/index.rst                  | 29 ++++++++++++++++++-
>  .../media/drivers}/pvrusb2.rst                |  0
>  .../media/drivers}/pxa_camera.rst             |  0
>  .../media/drivers}/radiotrack.rst             |  0
>  .../media/drivers}/saa7134-devel.rst          |  0
>  .../media/drivers}/sh_mobile_ceu_camera.rst   |  0
>  .../media/drivers}/tuners.rst                 |  0
>  .../media/drivers}/vimc-devel.rst             |  0
>  Documentation/driver-api/media/index.rst      |  2 ++
>  Documentation/media/index.rst                 |  1 -
>  Documentation/media/v4l-drivers/index.rst     | 14 ---------
>  MAINTAINERS                                   |  8 ++---
>  drivers/media/dvb-frontends/dib3000.h         |  2 +-
>  drivers/media/dvb-frontends/dib3000mb.c       |  2 +-
>  drivers/media/dvb-frontends/eds1547.h         |  2 +-
>  drivers/media/dvb-frontends/z0194a.h          |  2 +-
>  drivers/media/pci/cx18/cx18-streams.c         |  4 +--
>  drivers/media/platform/pxa_camera.c           |  4 +--
>  drivers/media/radio/Kconfig                   |  2 +-
>  drivers/media/usb/dvb-usb-v2/Kconfig          |  2 +-
>  drivers/media/usb/dvb-usb-v2/gl861.c          |  2 +-
>  drivers/media/usb/dvb-usb-v2/lmedm04.c        |  2 +-
>  drivers/media/usb/dvb-usb-v2/lmedm04.h        |  2 +-
>  drivers/media/usb/dvb-usb-v2/mxl111sf.c       |  2 +-
>  drivers/media/usb/dvb-usb-v2/mxl111sf.h       |  2 +-
>  drivers/media/usb/dvb-usb/Kconfig             |  2 +-
>  drivers/media/usb/dvb-usb/a800.c              |  2 +-
>  drivers/media/usb/dvb-usb/af9005-fe.c         |  2 +-
>  drivers/media/usb/dvb-usb/af9005-remote.c     |  2 +-
>  drivers/media/usb/dvb-usb/af9005.c            |  2 +-
>  drivers/media/usb/dvb-usb/af9005.h            |  2 +-
>  drivers/media/usb/dvb-usb/az6027.c            |  2 +-
>  drivers/media/usb/dvb-usb/cxusb.c             |  2 +-
>  drivers/media/usb/dvb-usb/dibusb-common.c     |  2 +-
>  drivers/media/usb/dvb-usb/dibusb-mb.c         |  2 +-
>  drivers/media/usb/dvb-usb/dibusb-mc-common.c  |  2 +-
>  drivers/media/usb/dvb-usb/dibusb-mc.c         |  2 +-
>  drivers/media/usb/dvb-usb/dibusb.h            |  2 +-
>  drivers/media/usb/dvb-usb/digitv.c            |  2 +-
>  drivers/media/usb/dvb-usb/dtt200u-fe.c        |  2 +-
>  drivers/media/usb/dvb-usb/dtt200u.c           |  2 +-
>  drivers/media/usb/dvb-usb/dtt200u.h           |  2 +-
>  drivers/media/usb/dvb-usb/dvb-usb-init.c      |  2 +-
>  drivers/media/usb/dvb-usb/dw2102.c            |  2 +-
>  drivers/media/usb/dvb-usb/gp8psk.c            |  2 +-
>  drivers/media/usb/dvb-usb/gp8psk.h            |  2 +-
>  drivers/media/usb/dvb-usb/m920x.c             |  2 +-
>  drivers/media/usb/dvb-usb/nova-t-usb2.c       |  2 +-
>  drivers/media/usb/dvb-usb/opera1.c            |  2 +-
>  drivers/media/usb/dvb-usb/ttusb2.c            |  2 +-
>  drivers/media/usb/dvb-usb/ttusb2.h            |  2 +-
>  drivers/media/usb/dvb-usb/umt-010.c           |  2 +-
>  drivers/media/usb/dvb-usb/vp702x-fe.c         |  2 +-
>  drivers/media/usb/dvb-usb/vp702x.c            |  2 +-
>  drivers/media/usb/dvb-usb/vp7045-fe.c         |  2 +-
>  drivers/media/usb/dvb-usb/vp7045.c            |  2 +-
>  drivers/media/usb/dvb-usb/vp7045.h            |  2 +-
>  66 files changed, 81 insertions(+), 67 deletions(-)
>  rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/bttv-devel.rst (100%)
>  rename Documentation/{media/dvb-drivers => driver-api/media/drivers}/contributors.rst (100%)
>  rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/cpia2_devel.rst (100%)
>  rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/cx2341x-devel.rst (100%)
>  rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/cx88-devel.rst (100%)
>  rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/davinci-vpbe-devel.rst (100%)
>  rename Documentation/{media/dvb-drivers => driver-api/media/drivers}/dvb-usb.rst (100%)
>  rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/fimc-devel.rst (100%)
>  rename Documentation/{media/dvb-drivers => driver-api/media/drivers}/frontends.rst (100%)
>  rename Documentation/{media/dvb-drivers => driver-api/media/drivers}/index.rst (67%)
>  rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/pvrusb2.rst (100%)
>  rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/pxa_camera.rst (100%)
>  rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/radiotrack.rst (100%)
>  rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/saa7134-devel.rst (100%)
>  rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/sh_mobile_ceu_camera.rst (100%)
>  rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/tuners.rst (100%)
>  rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/vimc-devel.rst (100%)

Same question here: can we keep the v4l/dvb split?

Regards,

	Hans
