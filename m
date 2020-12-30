Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C146F2E7C67
	for <lists+linux-media@lfdr.de>; Wed, 30 Dec 2020 21:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgL3Ux3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Dec 2020 15:53:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgL3Ux2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Dec 2020 15:53:28 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B8C1C061573
        for <linux-media@vger.kernel.org>; Wed, 30 Dec 2020 12:52:48 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id d26so18491056wrb.12
        for <linux-media@vger.kernel.org>; Wed, 30 Dec 2020 12:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xXUgCEENPXo+MbUYwYvNhhxXf3WEt8t1/vrO0Y1v8ro=;
        b=T1fkO/ylfMFPfWt864U06qbBPwfk+v0HTG7pkJwcvRCQaLNPNFxAuDxT/NTz41H4JC
         4rTw1wbl73PHXoAlvpoIkzlUiYivR8IWT0FQUpvAw5RsEZlvaSd4HxlJDH1Ipmeo0HgU
         xQ0Ew2/RFT/JVHtbJXp1KpoStyEPbMgE4RtzMO74BcHL72Q5MN5TplSk9gKEMvubESKy
         f9pcndB488C/i6P58xjPE8FIO/IFA87D5mu1W5/Np56syC3zYbWBlDx3DnOFzzWQFYz3
         up2Kp0tV02Zg/Epg4DrHOAVce4sHiVytbn4lFtB74QwR7BTxUMhDcle31pL6FhNOXIHE
         7LBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xXUgCEENPXo+MbUYwYvNhhxXf3WEt8t1/vrO0Y1v8ro=;
        b=Grzqdkw7RqI2278hj2EFafq4eTBLIrY+GFEaQgpoqe6HBvQ0HZ9ZHqGmHxDMZC8dv5
         e0aLL0RLVl1+0/F5P9B8fTxvKAwhZidGEYg6MRuDBdw5ialnYTolVd5gBabYvmNFN0cX
         sQqJBWH5xySGOMQlHlTI63VeyjliJM8Sh4XQxx/IQIAlg2tq29a6TbeGhw/TZMMFi/s8
         TNYeNB8zW60aYUBx9V6jU3rjdqsy8gi0b8CFKmPfGZsCCldNWUymO0NrW24+1wt5IUnh
         yqJvvt7U74+dEfZlXjJY+Rk0GsUsh/2kc/lPZNtZU7V6rGdZE90zZKT63jleSrLJ/tdM
         93Ow==
X-Gm-Message-State: AOAM531vhb8BFCYffgaHOqNWPWIW/M7wyicTlrd09KiXc/L0JaMpggyq
        rbbyYKqMh6wI+KdgKe9UAa0=
X-Google-Smtp-Source: ABdhPJx9Rhx10bz6bPY1bamScjJ0spiU0Dbcs4vo/MtsM1EEF5HUz8RbkXdIc8edtwws4t5XwNJcQA==
X-Received: by 2002:adf:dec7:: with SMTP id i7mr62236693wrn.373.1609361567070;
        Wed, 30 Dec 2020 12:52:47 -0800 (PST)
Received: from t450s.lan (2a01cb000f9f0e00de001a392b70d6bd.ipv6.abo.wanadoo.fr. [2a01:cb00:f9f:e00:de00:1a39:2b70:d6bd])
        by smtp.gmail.com with ESMTPSA id v1sm62278992wrr.48.2020.12.30.12.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 12:52:46 -0800 (PST)
Date:   Wed, 30 Dec 2020 21:52:43 +0100
From:   Gary Bisson <bisson.gary@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: Re: Using kmssink with mxsfb-drm
Message-ID: <X+zom8wMYLikJXpq@t450s.lan>
References: <CAOMZO5D2bEc+g=OVs_cQjcFkurzk6Hj8pZP3F9U8Kdqc4_FP0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5D2bEc+g=OVs_cQjcFkurzk6Hj8pZP3F9U8Kdqc4_FP0A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Wed, Dec 30, 2020 at 03:45:40PM -0300, Fabio Estevam wrote:
> Hi,
> 
> I am trying to run a simple videotestsrc pipeline on a imx6ull-evk
> board running kernel 5.10 and Gstreamer 1.18.2, but it fails as shown
> below.
> 
> Any ideas?
> 
> Thanks,
> 
> Fabio Estevam
> 
> # modetest -M mxsfb-drm
> Encoders:
> id      crtc    type    possible crtcs  possible clones
> 34      33      none    0x00000001      0x00000000
> 
> Connectors:
> id      encoder status          name            size (mm)       modes   encoders
> 31      34      connected       unknown-1       95x54           1       34
>   modes:
>         index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
>   #0 480x272 59.94 480 482 523 525 272 274 284 286 9000 flags: nhsync,
> nvsync; type: preferred, driver
>   props:
>         1 EDID:
>                 flags: immutable blob
>                 blobs:
> 
>                 value:
>         2 DPMS:
>                 flags: enum
>                 enums: On=0 Standby=1 Suspend=2 Off=3
>                 value: 0
>         5 link-status:
>                 flags: enum
>                 enums: Good=0 Bad=1
>                 value: 0
>         6 non-desktop:
>                 flags: immutable range
>                 values: 0 1
>                 value: 0
>         4 TILE:
>                 flags: immutable blob
>                 blobs:
> 
>                 value:
> 
> CRTCs:
> id      fb      pos     size
> 33      35      (0,0)   (480x272)
>   #0 480x272 59.94 480 482 523 525 272 274 284 286 9000 flags: nhsync,
> nvsync; type: preferred, driver
>   props:
>         24 VRR_ENABLED:
>                 flags: range
>                 values: 0 1
>                 value: 0
> 
> Planes:
> id      crtc    fb      CRTC x,y        x,y     gamma size      possible crtcs
> 32      33      35      0,0             0,0     0               0x00000001
>   formats: XR24 RG16
>   props:
>         8 type:
>                 flags: immutable enum
>                 enums: Overlay=0 Primary=1 Cursor=2
>                 value: 1
> 
> Frame buffers:
> id      size    pitch
> 
> # gst-launch-1.0 videotestsrc ! kmssink connector-id=31 name=mxsfb-drm

Have you tried adding 'can-scale=false' as kmssink parameter?

Regards,
Gary
