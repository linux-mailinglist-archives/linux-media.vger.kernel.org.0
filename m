Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE9866FFFB
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 14:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728380AbfGVMp0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 08:45:26 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:41110 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727510AbfGVMp0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 08:45:26 -0400
Received: by mail-lj1-f182.google.com with SMTP id d24so37441931ljg.8
        for <linux-media@vger.kernel.org>; Mon, 22 Jul 2019 05:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EAluuQFe9siqnpIP/CYh3dDqEB4+QzNnR4kwYX5Q4I4=;
        b=uBSQK5XoQD0CqSuofgTHX+4ZxtZIRcVyM6fpOcGIUCibjYCl21Gp9kVwQnI9kmC99j
         fLL9kUGGEDsbhzuR5XPeG+gIleTzVXi+5DoLu+0Io4TLUFG0W4SQbPNntZ58ITJ0rUM1
         XGigboTq/ZIIfTutBbge+OYNVzlggLB+HNL0xJh8zJS4bYhq7GStQqaYcxJN6MoWA9cW
         OG+jddErn8S7QxcJn6B5t6Cs700WBrLG7tl+uZdvCptjcR+/c6gshIS3v42CBrEIPODd
         3zcfXDc7oetI0H4fQF/vAsJBOnX1SAlnDsyuUeyC3oNCGuHycM973jINVJvVTpWe0nuy
         o2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EAluuQFe9siqnpIP/CYh3dDqEB4+QzNnR4kwYX5Q4I4=;
        b=Glg9si5lhQhRl7528YvLWS03HakQ9WBPDserVpz3VP1IkfRcMNV7/3kbIsPxuyO54Q
         rVLrXTTEadjt3DZHEtnfkF4gYKRQmRCbCT+Bzu+PEIZb1sDV3KqBI8tK0D4zMVhOG0gD
         PnrWhCiaBXfsO4A5mS+jQvgadxlxsKW53gWNgWxMNcHiE5x9GgJfAAhpg+t5PNddHQWZ
         p3xos8z9RqR6iEBUNehLB4+O0cNYq1bcaY32QyiRyjNS4bTSIONwSBq31poD4R9/C4Vt
         XFKvHqWd4v9R5u3TGBM8/FFqJq90ExoTu657ixWiSm33k/bj9QXhs4a2lPZ8otoGGhBn
         9w9A==
X-Gm-Message-State: APjAAAUqosAdAZc+xzpuDg6R3ksAXXg44X2Gwi/Mvuy6hKPEfvmOuTIV
        bTpOJeyTHD9A30kBagGKHdGreUqX3Hzmf3gKa4g=
X-Google-Smtp-Source: APXvYqzzbGWQYHGOpWKPjDZkzi/vYSg6OT13RlwKABeVQoQrTN4Nz6sPGIQ4/4dMfyfQ98gxpnDTL/rdWTOl6n7B4Xg=
X-Received: by 2002:a2e:2c07:: with SMTP id s7mr36623154ljs.44.1563799524232;
 Mon, 22 Jul 2019 05:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <890e6dbe-2d8e-d674-b17e-2421a38e7acd@kynetics.com>
In-Reply-To: <890e6dbe-2d8e-d674-b17e-2421a38e7acd@kynetics.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 22 Jul 2019 09:45:16 -0300
Message-ID: <CAOMZO5B3GV8fPLAdsxx2F+dyH68xPn6MN5rehEvwDvjJmirZrg@mail.gmail.com>
Subject: Re: Issues with ov5640 camera on i.MX6Q
To:     Laura Nao <laura.nao@kynetics.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     loic.poulain@linaro.org, linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[Adding Steve and Philipp]

On Thu, Jul 18, 2019 at 10:06 AM Laura Nao <laura.nao@kynetics.com> wrote:
>
> Hello Loic,
>
> I'm having some issues with RAW8 mode on the OV5640 camera and I'd like
> to kindly ask for your advice, as I saw that you added support for RAW
> mode in the mainline kernel driver.
>
> I'm trying to capture some raw images on a i.MX6Q based board. I
> configured the pipeline as follows:
>
> media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
> media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
> media-ctl -V "'ov5640 1-003c':0 [fmt:SBGGR8_1X8/2592x1944 field:none]"
> media-ctl -V "'imx6-mipi-csi2':2 [fmt:SBGGR8_1X8/2592x1944 field:none]"
>
> I'm capturing the frame using v4l-utils:
>
> v4l2-ctl -d /dev/video5 --verbose --set-fmt
> video=width=2592,height=1944,pixelformat=BA81 --stream-mmap
> --stream-count=1 --stream-to=bggr_2592x1944.raw
>
> The images I'm obtaining are completely garbled. I tried both 5.2
> mainline and 5.1.18 kernels.
>
> I'm able to correctly capture YUV frames in all resolutions with the
> same driver (with the pipeline configured to go through the
> ipu1_ic_prpenc node first).
>
> Do you have any insight on what might be causing these issues? Is the
> PLL configuration supposed to be changed when RAW8 format is selected?
>
> Thanks for your help,
>
> Best regards,
>
> Laura
