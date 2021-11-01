Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0475D441ED9
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 17:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbhKAQ5k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 12:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbhKAQ5j (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 12:57:39 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA621C061714
        for <linux-media@vger.kernel.org>; Mon,  1 Nov 2021 09:55:05 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id y8so1826201ljm.4
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 09:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+P8SWV1XuXOdTK8A8vSoC4WCxZOoierlNI7uSqVWT6c=;
        b=bSD9NeJy6rtdzQX9R/afYtSj2qLoj+XzOBXbrPkle0qz6D3gG0TFOymgQJGSHnuZ3C
         GxldSmePJYy3Uc7q75aA1fH2Fpdw0SivKwY/NBGVY9uxUhuHz+xjUSNXZjUsd6RZczI0
         TN7mwJe5BpDnLb5INEdKeX6hJbOIByomHCrL0oSCThC2X07G3iIH9Wz+b1FCzwKzX+BZ
         ckiGvQe7nL2sWh5fjAF+H/ry5sjGRgBMUKs3Zfypo2Ffzrq/zMhb5lucjwLFkoe7IHtG
         77luO0bfVv1bGWNcU4s0r4EU05D0hBOCiVXHwdmsqMbdZb2Nh4DgE19qxOz+sbh14N4N
         bQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+P8SWV1XuXOdTK8A8vSoC4WCxZOoierlNI7uSqVWT6c=;
        b=0pM6Wa1TScehmqeEcexB1tSsoZCeiG6lmTWKz85czFlhm1NV8lXoMcYgErmSDYWXBp
         CfNthNSkxip425O+IPEypmedy7wrLQdwfOVEZuNoZWMK7LdMbSx4hPyaWlOwLemZEQ/K
         xFLrjEdyF1KlMbEk7o0AQSYA3F94QfO3gUe5efJqSHz47bOuY4ZR9x8Xb7FEPIlbBJoE
         FIDcZFIiSieBXPb8gkSt1ugiHA1tt4Au+vbn2us/z6gNeJjLthZ8qvcE9AtSo4NALiDR
         EOeJd21hqfeYKGo+DXdlv9jdaBItzgAna92rGgUnd9kJ2ayCkgoh1Z4ys1+JlxgIXvn1
         GMpA==
X-Gm-Message-State: AOAM531y20RoFIq6SjuS3ZHESxSF8o9UbDE5bjazFVwrl3j/NmRz1jVi
        gkBBMWIQ3NEe45VIT6W2sFUzABzMcAjNzA==
X-Google-Smtp-Source: ABdhPJwQayaEXCyxG3+w6Z682LhmH4Fl8BV7aeW/iPobHh1WznjAQgDpJ/rGRHFcItlTdEmsJcIpQg==
X-Received: by 2002:a2e:9517:: with SMTP id f23mr19061980ljh.105.1635785704013;
        Mon, 01 Nov 2021 09:55:04 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id e7sm1451949lfr.294.2021.11.01.09.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 09:55:03 -0700 (PDT)
Date:   Mon, 1 Nov 2021 17:55:02 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] max96712: Select VIDEO_V4L2
Message-ID: <YYAb5oYrsZMWNB+o@oden.dyn.berto.se>
References: <20211101132502.700505-1-sakari.ailus@linux.intel.com>
 <163578420928.926484.5058272719714961844@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <163578420928.926484.5058272719714961844@Monstersaurus>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On 2021-11-01 16:30:09 +0000, Kieran Bingham wrote:
> Hi Sakari,
> 
> Quoting Sakari Ailus (2021-11-01 13:25:02)
> > Select VIDEO_V4L2 for the driver actually depends on it, failing to
> > compile otherwise.
> > 
> > Fixes: 51758f8b32134bacbf30bd217f7c2074e9b4b51e ("media: staging: max96712: Add basic support for MAX96712 GMSL2 deserializer")
> 
> I guess this is a local commit in your tree so far, I can't identify it.
> 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/staging/media/max96712/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
> > index 258d47644cbd..492a7ff70dd8 100644
> > --- a/drivers/staging/media/max96712/Kconfig
> > +++ b/drivers/staging/media/max96712/Kconfig
> > @@ -6,6 +6,7 @@ config VIDEO_MAX96712
> >         select V4L2_FWNODE
> >         select VIDEO_V4L2_SUBDEV_API
> >         select MEDIA_CONTROLLER
> > +       select VIDEO_V4L2
> 
> I don't see any other driver 'select' VIDEO_V4L2...
> Most 'depend' on VIDEO_V4L2 instead.
> 
> And curiously, I already see
>  - Add 'depends on VIDEO_V4L2'
> 
> in Niklas' v4.

I noticed too late that v3 was already in the media staging tree so I 
submitted a v4 with this fix. I should probably have submitted a Fixes 
patch like this one instead of a v4 if I knew it was already picked-up.

> 
> Is this one a special case that 'needs' to select it?

Both 'select' and 'depends on' solves the problem reported by the bot, 
which one is more correct I do not know.

> --
> Kieran
> 
> 
> 
> >         help
> >           This driver supports the Maxim MAX96712 Quad GMSL2 Deserializer.
> >  
> > -- 
> > 2.30.2
> >

-- 
Regards,
Niklas Söderlund
