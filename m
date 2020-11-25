Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B40B02C4148
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 14:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729567AbgKYNjn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 08:39:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729526AbgKYNjm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 08:39:42 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A63FC0613D4
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 05:39:42 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id r24so3156468lfm.8
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 05:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=R7BxWH7Bj9NBvw+bPysAv/QTCXhP/te13HEpPeWrSPM=;
        b=VOaNOkWCqJCtErXW+ysKZJEThtlr2BJjOR4i9qeJzW8fYTmAsi8xC1YOGW1EpZOj/8
         Sp0T5twXLqPigOgMESSsPDurjgyjeN34Ig4S7zVmoj5LDLSirb9IYXUkB74JVz0vGZO3
         /7hLq/I5uHwWI+2qWCw/FhwyTkeSetvF8t5Xhfl0oY/YUaqWoqxaxe/NYscV1LFzwjCb
         kWKlpIDLCt2iYayCPPjMrA+3bBZpQH7NVwPWI44p6k/OgMOB+YUdlfOAzzlt4l1bbWMI
         TU0kuG6uCD0fETl0Rr+D4UC7tyPsDp80NPpJ8y+/MxeyUx6vNowx+ySwVMgXFthfLJwY
         9izA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=R7BxWH7Bj9NBvw+bPysAv/QTCXhP/te13HEpPeWrSPM=;
        b=BXLKdvs2uvWiWuHvM9tG7z/YYGB+2Oup4eC2SZQEl5PB18Hau752wjRCegaGRNSFdR
         zVQrJyC8sxNG4IZ0Jxaj7ZtyARO4ANhvjQ4X8TqKvt/ChbBDiPMhhe/G6nMjINrZc/+F
         5iv7rf9gxtGDPDcoTfF3J6P2YRbsjL1OvdAW3WbviUnxcAiwHO93Bgot5nTxoJSUHwIg
         PgC4T3eqQ6E+d2+fHy8Np8Kr7UT5vCQzdils65ZDivG8QyOd7RFqXrovbj//+UkqRhzg
         zpUQWQMNwXDrf2FLBHMhX+pyoYvoMuKk665WLU+4ct7q/uwh/l3SfazqGRmmYVcs1Gve
         hEPA==
X-Gm-Message-State: AOAM532/jcNF3ekQzL15rLR1wtRI5N8qwIQ5fb2e08HXvHwQSQux7tlR
        Yd1gP4TjUltNlWEb8vgAEAretQ==
X-Google-Smtp-Source: ABdhPJym0/e0ry1ZAYh6Gfvs5QmoDuh0mxKCgyt9rLVI3qkg+NOM4E+mlQGCYyd4p2HcawZcT8fBMQ==
X-Received: by 2002:a19:505:: with SMTP id 5mr1321176lff.578.1606311580947;
        Wed, 25 Nov 2020 05:39:40 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id 17sm264445lfr.52.2020.11.25.05.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 05:39:40 -0800 (PST)
Date:   Wed, 25 Nov 2020 14:39:39 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] adv748x: Add support for s2ram
Message-ID: <20201125133939.GC2162566@oden.dyn.berto.se>
References: <20201122163637.3590465-1-niklas.soderlund+renesas@ragnatech.se>
 <7ec9c2ba-ea9c-2ce5-8ecf-6239448c711f@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ec9c2ba-ea9c-2ce5-8ecf-6239448c711f@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On 2020-11-25 13:09:39 +0000, Kieran Bingham wrote:
> Hi Niklas,
> 
> On 22/11/2020 16:36, Niklas Söderlund wrote:
> > Hello,
> > 
> > This series enables usage of the ADV748x after the system have been 
> > suspended to ram. During s2ram the ADV748x may be powered down and thus 
> > lose its configuration from probe time. The configuration contains  
> > among other things the i2c slave address mappings for the different 
> > blocks inside the ADV748x. If this is lost the hardware listens to the 
> > "wrong" i2c addresses and becomes inaccessible.
> > 
> > Example trying to read the analog standard before and after s2ram with 
> > and without this this series.
> > 
> 
> Should we be considering runtime_pm for this instead?

I don't think so, why do you think we should?

I opted for this solution because we need fine grain control of when the 
registers are restored when resuming from s2ram. If they are not 
restored before (in my case) the VIN driver is resumed and it was 
streaming at suspend time it will fail as the i2c address map is wrong 
at this time. For this reason the registers are restored in the early 
resume callback.

Second I'm unsure how we could properly test such a solution as I don't 
think we can powerdown the ADV7482 without also s2ram the whole SoC on 
our test platforms as it's power is not controllable by the SoC. For 
example it's not powered down in s2idel.

> 
> --
> Kieran
> 
> 
> > Without this series,
> > 
> >   # subdev=$(grep -l "adv748x 4-0070 afe" /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g')
> >   # v4l2-ctl --get-detected-standard -d $subdev
> >   Video Standard = 0x000000ff
> >           PAL-B/B1/G/H/I/D/D1/K
> >   # echo on > /sys/bus/i2c/drivers/bd9571mwv/*/bd9571mwv-regulator*/backup_mode
> >   ** flipp SW23 off **
> >   # echo mem > /sys/power/state
> >   ** flipp SW23 on **
> >   # v4l2-ctl --get-detected-standard -d $subdev
> >   [  502.753723] adv748x 4-0070: error reading 63, 02
> >   [  502.866437] adv748x 4-0070: error reading 63, 02
> >   VIDIOC_QUERYSTD: failed: No such device or address
> > 
> > With this series,
> > 
> >   # subdev=$(grep -l "adv748x 4-0070 afe" /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g')
> >   # v4l2-ctl --get-detected-standard -d $subdev
> >   Video Standard = 0x000000ff
> >           PAL-B/B1/G/H/I/D/D1/K
> >   # echo on > /sys/bus/i2c/drivers/bd9571mwv/*/bd9571mwv-regulator*/backup_mode
> >   ** flipp SW23 off **
> >   # echo mem > /sys/power/state
> >   ** flipp SW23 on **
> >   # v4l2-ctl --get-detected-standard -d $subdev
> >   Video Standard = 0x000000ff
> >           PAL-B/B1/G/H/I/D/D1/K
> > 
> > Also any streaming while the system is suspended to ram fails to resume 
> > without this series due to the issue demonstrated above. This series is 
> > tested on R-Car M3-N on-top of latest media-tree.
> > 
> > Niklas Söderlund (3):
> >   adv748x: afe: Select input port when device is reset
> >   adv748x: csi2: Set virtual channel when device is reset
> >   adv748x: Configure device when resuming from sleep
> > 
> >  drivers/media/i2c/adv748x/adv748x-afe.c  |  6 +----
> >  drivers/media/i2c/adv748x/adv748x-core.c | 29 ++++++++++++++++++++++--
> >  drivers/media/i2c/adv748x/adv748x-csi2.c |  6 +----
> >  drivers/media/i2c/adv748x/adv748x.h      |  2 ++
> >  4 files changed, 31 insertions(+), 12 deletions(-)
> > 
> 

-- 
Regards,
Niklas Söderlund
