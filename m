Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCC85386DE4
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 01:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344585AbhEQXuJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 19:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344569AbhEQXuI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 19:50:08 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E22C061756
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 16:48:51 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id v9so9952532lfa.4
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 16:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OUHo7AchZRfqUwOt2LgISMTZDe2cDuyvfQlmYsqUMow=;
        b=AsD3gmFYBrPKDzEWahx/ViqqbOUMK278T1hROviPuFP+1s9aMT3nz7/8MAq61+VR3i
         j/3RpUyAll1q7uYaCGfmQc8Ec1TAJZsgy/l7GjQpfpbahAKuj4qT4eottIgba7vBBnMD
         91JWIQyPNS55WABHbgJ1IH0o6Wuqe6Bz2wjLQGuj5HgltCciWfdhpkHMj+i5LjVyCIUK
         9mEF5YoxUMvAMeZY9g821bdzBwBKUyvzdld61BdwKHGuoin28LZY1ahwqbX00eHeTXRI
         sah9PcGQq6ynhsvtZFPvIuEvWTTy1AJ3HbObxtuhOH6r/sr2ch1e3egR8JT9vB40X2Yk
         VC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OUHo7AchZRfqUwOt2LgISMTZDe2cDuyvfQlmYsqUMow=;
        b=cGMAYjcaP4bo0nrxULma5Rbm/5bF2ebjMorJq5AXGU+iCYUJqn1IlmLs/yrj5ifiA1
         sQEfJbO7rsB9bZIWmfwGP2mBV0dytplsWZgzCO2pOBOXgcmb7lhqIbr4STfkyaX0eqkX
         GiwAzAFni/f+8IY8VJRLzcbiW4nRs4K0x7Vjwuy5oFDIsMftrAg0bok11RFflo8hLlja
         nhtYuLhE1a2ui3JANBeYT2tWfp7grb/g3BId1czHExVRA/Y8wR0a4eAy4X5t33t8Df21
         oWMkX7OzzI1Jc4xO3ZfhYJ9fahaEj4FDFksceB7mAtzyJ0Za4ZWW7T3RqmG7sYTqDNuP
         2F+g==
X-Gm-Message-State: AOAM532oNNFXMeJUK7dOnKbR4Tn8ZQG6E6jIbvdqZO3V2/dF8q4eh/zg
        zEF7mQK3YemnBwvgQfcx0qsop5wQW8YTA63aUuM4VHwlIPEn0g==
X-Google-Smtp-Source: ABdhPJzC71yiYfMqr+09lP1s6KInV3iNogR2Uw5teM/sfI2e2MEjkaQuFUCEhaLD3hjtSCCb+62egsJXJLz4ci2Vsu8=
X-Received: by 2002:a05:6512:34d3:: with SMTP id w19mr1824106lfr.295.1621295329780;
 Mon, 17 May 2021 16:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5A0nV2bubWt3EzkaWVBoD96YNTYB10y-qB79mX2pTBu0w@mail.gmail.com>
In-Reply-To: <CAOMZO5A0nV2bubWt3EzkaWVBoD96YNTYB10y-qB79mX2pTBu0w@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 17 May 2021 20:48:38 -0300
Message-ID: <CAOMZO5CfCZcngeOj4yEV+g5s6Wy4F0=wCu3PD3LyZAUMz9V2LQ@mail.gmail.com>
Subject: Re: Unable to capture adv7280-m on i.MX6Q
To:     Schrempf Frieder <frieder.schrempf@kontron.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 17, 2021 at 5:58 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi,
>
> I am trying to capture from an adv7280-m (via MIPI-CSI2 interface) on
> an imx6q board.
>
> Here is the configuration:

Decided to try to transmit to the ipu1_csi0 (virtual channel 0) instead:

   media-ctl -l "'adv7180 2-0020':0 -> 'imx6-mipi-csi2':0[1]"
   media-ctl -l "'imx6-mipi-csi2':1 -> 'ipu1_csi0_mux':0[1]"
   media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':0[1]"
   media-ctl -l "'ipu1_csi0':1 -> 'ipu1_vdic':0[1]"
   media-ctl -l "'ipu1_vdic':2 -> 'ipu1_ic_prp':0[1]"
   media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
   media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]"

   media-ctl -V "'adv7180 2-0020':0 [fmt:UYVY2X8/720x576 field:seq-tb]"
   media-ctl -V "'imx6-mipi-csi2':1 [fmt:UYVY2X8/720x576]"
   media-ctl -V "'ipu1_csi0_mux':2 [fmt:UYVY2X8/720x576]"
   media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/720x576]"
   media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/720x576 field:none]"
   media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/720x576 field:none]"
   media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/720x576 field:none]"
   # Configure "ipu1_ic_prpvf capture" interface (assumed at /dev/video2)
   v4l2-ctl -d2 --set-fmt-video=field=none

   gst-launch-1.0 v4l2src device=/dev/video2 ! kmssink

Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
[   11.745511] imx6-mipi-csi2: LP-11 wait timeout, likely a sensor
driver bug, expect capture failures.
[   11.754956] imx6-mipi-csi2: phy_state = 0x00000200
[   12.259957] imx6-mipi-csi2: clock lane timeout, phy_state = 0x00000200
[   12.266630] ipu1_ic_prpvf: upstream stream on failed: -110
[   12.274082] ipu1_ic_prpvf: pipeline start failed with -110
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
to allocate required memory.
Additional debug info:
../sys/v4l2/gstv4l2src.c(659): gst_v4l2src_decide_allocation ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Buffer pool activation failed
Execution ended after 0:00:01.072478334
Setting pipeline to NULL ...
Freeing pipeline ...

Not sure why I am getting LP-11 and clock lane timeouts though.

Thanks
