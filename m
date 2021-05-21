Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7222438C943
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 16:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234801AbhEUOfe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 10:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbhEUOfc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 10:35:32 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA3E1C061574
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 07:34:09 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id x19so30057282lfa.2
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 07:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uCsHv0MS1ZWd9nFVcEuV5dpcdSvlLyGKp8h3kVe0cBs=;
        b=Q/BfGLSj5uAmN+9HsMOYH5rl3+uuHsCDibA6yrDq29Wpbszjv5mk08D5tARU43bLcz
         oT/CthOd8g+7vNi/DQMETK6S4tNKcfm5BVJ/c0Pa11M9VUpy6AIQATlOi8DbanebXSte
         HQjBbFZW45ZfGAzl8t2/m4nrTSVQzwHdiVtFq7hJIBCpNdt1hNR4iNY9vQByhMjPqQeE
         qVmXfAVEx2MYaWzKOFgFpVSACAhIo8cGoLdPiD5dMVkfbhAXh1t0zVNuez67vHJL6d6v
         Ie13Slkje21Ap89gY/ciSEvckl8emsgymbbb2W7G2FsRanv+T9CvZNA14afT6D+t6DY5
         ZSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uCsHv0MS1ZWd9nFVcEuV5dpcdSvlLyGKp8h3kVe0cBs=;
        b=DVyQ0wxG/Ofqi6oeakzeT4mbzF6oFrLUk3ZFzRY+ylO2g+WHDwiWLErOaUur76glOk
         FlbpFN092YOjMaV0I6loaYAUSypFKGYv/07CsiT4/0wPTxShMK5kX+4hF5GwO3TRmXXF
         rllinxrE2PLhAhYmgnnIVYsF8zonkGlyJ2C9w5XtFRtJ6K1KjzsCVD26caoGyIjaeDNs
         wuYvWg+YE0S/zJGT/bNZpsMmLojTiWEOIf0RFPqg4jThTS76qNnfVp77EftVrdAEsDqs
         wFdgjIgPGAAXZAkbOH7MY6Tv2JfycherXDxzIpZLCtBKa8KeG8AzyCzdlf6Le7GHhk93
         XRxQ==
X-Gm-Message-State: AOAM530YBV8NcpzRsHAWrWyL/YHokjZjryFhJ6c1RGjV2Gs3rU0RjfbZ
        rgOtQJBfM2muojsK160ICAkB3lFFICEf4waLFtiRWUOS+n+SXQ==
X-Google-Smtp-Source: ABdhPJwmsiy7EM7ga5P59NMCVGt0VF3z9VoLLC7rdeha5rSS/YH25mvxPalZdM/L3lHCrbT59Xxf0zIFKHsUEZDmn0I=
X-Received: by 2002:a05:6512:1031:: with SMTP id r17mr2412364lfr.583.1621607647977;
 Fri, 21 May 2021 07:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5CacHaESju9XQU1C7NU41Myk1-2_+7sju1dnCZuqRv98Q@mail.gmail.com>
 <CAJ+vNU09LC1i_-HzybPSy02DY5x-JNfMrO9wPMsb5BSK0ofEYg@mail.gmail.com>
 <CAOMZO5DJ0Y5CaeBLanQssqsb6fA5ma+B363g=d33BPb9+me3wQ@mail.gmail.com>
 <CAOMZO5BCDMnPT3m=usxWrhVmEw+a9X8uCnv-J5gv4JQC8UCYWA@mail.gmail.com> <CAJ+vNU1e5m45xSRqFJPSKqEL-bOLsGX+OhOFA5vERob+o1SYUg@mail.gmail.com>
In-Reply-To: <CAJ+vNU1e5m45xSRqFJPSKqEL-bOLsGX+OhOFA5vERob+o1SYUg@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 21 May 2021 11:33:56 -0300
Message-ID: <CAOMZO5DwX=tTGjyZwge9JsFZDkgZ1GsgYP5-iV=NNSsXXp0x9A@mail.gmail.com>
Subject: Re: adv7280: Scrolling images on imx6
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Schrempf Frieder <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi  Tim,

On Fri, May 21, 2021 at 11:25 AM Tim Harvey <tharvey@gateworks.com> wrote:

> Fabio,
>
> Yes sorry for not getting back to you on this. I actually haven't had
> time to go find the proper board and test it. You are correct, the
> scrolling sync issue on the adv7280 occurs with NTSC. I'm still not
> sure how best to fix this as the patch was Nak'd. As discussed I guess
> we will have to do something with a kernel param. I am told that we
> should not attempt to normalize default configurations among the
> various chips the adv7180 driver supports as it may break someone's
> current use of them.

Yes, I am interested in getting this fix upstream.

I will try to rework Matthew's patch by adding a device tree property
so that current systems are not affected by this change and will post
a patch for discussion soon.

BTW, I have sent a v3 of Steve's fix for skipping initial bad frames:
https://www.spinics.net/lists/linux-media/msg192778.html

It would be nice if you could give your Reviewed-by or Tested-by.

Thanks
