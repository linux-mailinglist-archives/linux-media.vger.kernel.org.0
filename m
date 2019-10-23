Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E578E1297
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2019 09:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732481AbfJWHBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 03:01:46 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:35985 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727194AbfJWHBp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 03:01:45 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id NAeKiKvquHfodNAeNiz9Pa; Wed, 23 Oct 2019 09:01:44 +0200
Subject: Re: [PATCH 0/3] vimc: Allow multiple capture devices to use the same
 sensor
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Cc:     libcamera-devel@lists.libcamera.org
References: <20190518010744.15195-1-niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <991b7e6e-9420-ef3b-5271-fb272b97ff29@xs4all.nl>
Date:   Wed, 23 Oct 2019 09:01:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190518010744.15195-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOLlDmCyNmCNo5Ctkpw37Bj3aT+nG0IaXMJ4J1J1CtW0TDAFajbqSaVTE/3LLfTjFTzRQUPd/JHiM+MpKBHdBMbG4m7779NfSAskpcgmtFE6hAhvOdy1
 YDqr4qqG4w4L3wpfiPcggTVIeMjews7TZndC7R1i66q/CdZ1WFWdDBsA0Akfu0S7oKMQT5uaLXHk4omBmNrYPVB4X5XgbUuzQdSYFBrUX2uPWbN2mQvH8se+
 /TLdCpXrK9/Nh+wrYCSeDEn6w1LnyVTjp0JUvUFIpTZ+iA0+nmX4lkPx4oSNr2q8lTbuB0ZaCsABxqZea2ZXBg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

For one reason or another this series was never reviewed/picked up and
it now no longer applies.

Combined with the big switch to a monolithic driver I am sure that this
series needs to be redone. So I am marking it as "Changes Requested" and
it is up to you to decide whether to rebase/rework this series.

Regards,

	Hans

On 5/18/19 3:07 AM, Niklas Söderlund wrote:
> Hi,
> 
> This series adds support for two (or more) capture devices to be 
> connected to the same senors and run simultaneously. Each capture device 
> can be started and stopped independent of each other.
> 
> Patch 1/3 and 2/3 deals with solving the issues that arises once two 
> capture devices can be part of the same pipeline. While 3/3 allows for 
> two capture devices to be part of the same pipeline and thus allows for 
> simultaneously use.
> 
> The series is based on the latest media-tree and it functionality can be 
> demonstrated with the following test.
> 
>>>> begin test <<<
> mdev=/dev/media0
> 
> media-ctl -d $mdev -l "'Debayer A':1 -> 'Scaler':0 [1]"
> media-ctl -d $mdev -l "'Debayer B':1 -> 'Scaler':0 [0]"
> 
> media-ctl -d $mdev -V "'Debayer A':0 [fmt:RGB888_1X24/640x480 field:none]"
> media-ctl -d /dev/media0 -V "'Sensor A':0 [fmt:SRGGB8_1X8/640x480 field:none]"
> 
> yavta -f RGB24 -s 1920x1440 --field none /dev/video2
> yavta -f SRGGB8 -s 640x480 --field none /dev/video0
> 
> yavta -f RGB24 -s 1920x1440 --field none /dev/video2 --capture=100 &
> yavta -f SRGGB8 -s 640x480 --field none /dev/video0 --capture=100
> wait
>>>> end test <<<
> 
> In addition to testing with this test the series is tested with multiple 
> qv4l2 instances controlling different capture devices connected to the 
> same sensor.
> 
> Niklas Söderlund (3):
>   vimc: Add usage count to subdevices
>   vimc: Serialize vimc_streamer_s_stream()
>   vimc: Join pipeline if one already exists
> 
>  drivers/media/platform/vimc/vimc-capture.c  | 35 ++++++++++++++++++++-
>  drivers/media/platform/vimc/vimc-debayer.c  |  8 +++++
>  drivers/media/platform/vimc/vimc-scaler.c   |  8 +++++
>  drivers/media/platform/vimc/vimc-sensor.c   |  7 +++++
>  drivers/media/platform/vimc/vimc-streamer.c | 23 +++++++++-----
>  5 files changed, 73 insertions(+), 8 deletions(-)
> 

