Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94A231A1883
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 01:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgDGXRv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 19:17:51 -0400
Received: from mail-lf1-f52.google.com ([209.85.167.52]:38494 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgDGXRu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 19:17:50 -0400
Received: by mail-lf1-f52.google.com with SMTP id l11so3711155lfc.5
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 16:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6cQ/SkQhOd5t+Up18VUlbIT61G/ZpKKfftdi1hITXwA=;
        b=GHsTxbdWRpu/nwsOjuU7nF9GThTsFzhG0cDhYCnPx71/QHvQaaAhMy/hkAmm+6O6ev
         fFfHkZ/1P1ot3230auBJ1KLlWIK07NstLSOCK/M75qU6ZKNJw/CDb2TiBMJXBzDz1WHA
         ITpthsEuANzv4ybt8S1aI668NLRZiBGgYGeoN4oYYIH9+q/N+qKpFYMlkF6krNc9Us7T
         a+DpBA9QDgISViysM0wB6VqYX2HwXeO4qSiutXHiLSrHbnZUyVmoGDyXCjaRX1IldRpQ
         gouDsNAkJ4Ohl12HMfOEMK1aIusCXm/klj8tt0DLZyne6SKfGBtQv5QGEl1avIAC7+1g
         d54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6cQ/SkQhOd5t+Up18VUlbIT61G/ZpKKfftdi1hITXwA=;
        b=Mn9+Lrjg7vBCsi8ySFkEevVl3A6ibBRLuCDj1PXG66cC+O3dqSS20D5QS3mzVc6eUb
         2TZfDbzouIaiEvNen5oyAX8sfgUEmkiBzmY1b2kG8XRyoETzbFg5xEYiUS4yifPXyJaP
         AbPTUOzpS/RzpAdgyBlWRog7boRpfEGbeAd6TRPStIeyr7lBCgBTc/RKQmmxo/KU40Wg
         RUD0G+L3IsYts7Z/lf4RAM53DNCtrMq9BX62wOJqte9bZdkEKV8dHNic2ueRsKrqLODU
         VoBVDZF6HpxX9Tf3xrBYsLWM/Vej1/9tc0M1A9At+T10B1VQ7S+HFzoydO1rjUNSirx1
         P/GQ==
X-Gm-Message-State: AGi0PuYp84bdzuaKG1jZ/euCwWr74idRNpF0lDbSwEHp2EWFNc32IDbL
        iZtyOHdsMoilc9qJK7R3f23yoPvqK2Y5DV/Btm4=
X-Google-Smtp-Source: APiQypLA0XB72rxwMhBh6LRAPCrIN7BpeIavV6xXntJaodPytJIXBSmjbvRT7gyamHDRAb4lWZSP4y5NLQCvqraz0cM=
X-Received: by 2002:a19:c194:: with SMTP id r142mr2802062lff.7.1586301468278;
 Tue, 07 Apr 2020 16:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200407180534.2871-1-festevam@gmail.com> <4f50f3ae-de37-0f0d-c54a-5e74b4e2a4d8@gmail.com>
In-Reply-To: <4f50f3ae-de37-0f0d-c54a-5e74b4e2a4d8@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 7 Apr 2020 20:18:12 -0300
Message-ID: <CAOMZO5CqNV2=LX3HKUsJ9qqSqj0zYKG9GFb5D6Z1vqNgx-=1BQ@mail.gmail.com>
Subject: Re: [RFC] media: imx.rst: Fix the links/pads configuration for imx6qsabresd
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Tue, Apr 7, 2020 at 8:01 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>
> Hi Fabio,
>
> I do believe the problem you're having is that the OV5640 by default
> transmits on virtual channel 0, not channel 1 as is given in the
> instructions in imx.rst.
>
> But I do agree the instructions are now misleading because of the OV5640
> defaults, and probably should be changed for the virtual channel 0 pipeline.
>
> Can you try the virtual channel 0 pipeline:
>
>      media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
>      media-ctl -l "'imx6-mipi-csi2':1 -> 'ipu1_csi0_mux':0[1]"
>      media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':0[1]"
>      media-ctl -l "'ipu1_csi0':1 -> 'ipu1_ic_prp':0[1]"
>      media-ctl -l "'ipu1_ic_prp':1 -> 'ipu1_ic_prpenc':0[1]"
>      media-ctl -l "'ipu1_ic_prpenc':1 -> 'ipu1_ic_prpenc capture':0[1]"
>
>      media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/640x480]"
>      media-ctl -V "'imx6-mipi-csi2':1 [fmt:UYVY2X8/640x480]"
>      media-ctl -V "'ipu1_csi0_mux':2 [fmt:UYVY2X8/640x480]"
>      media-ctl -V "'ipu1_csi0':0 [fmt:UYVY2X8/640x480]"
>      media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/640x480]"
>      media-ctl -V "'ipu1_ic_prp':1 [fmt:AYUV32/640x480]"
>      media-ctl -V "'ipu1_ic_prpenc':0 [fmt:AYUV32/640x480]"
>      media-ctl -V "'ipu1_ic_prpenc':1 [fmt:AYUV32/640x480]"

Thanks! By running the lines above I can get the streaming to work
successfully with:

v4l2-ctl --stream-mmap -d /dev/video1

and also:

gst-launch-1.0 v4l2src device=/dev/video1! kmssink

I will submit a formal patch with these instructions.

Thanks for your help.
