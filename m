Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0209D37FA51
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 17:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234356AbhEMPMp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 May 2021 11:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233774AbhEMPMm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 May 2021 11:12:42 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F36FC061574
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 08:11:32 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id dl3so13938978qvb.3
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 08:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=BeplTBdXzCMRJtq75KvkBSYOXC0YncEEEybwIvizLCk=;
        b=DKK4HtUl5PbrzqIoQiBM+eKPlA7Rf7V83q+7PgAqQaMf9x9EGoQlycSNFQonRZJuZZ
         OPmyqg/5FA/Ht3wgZfRXCOAdrSYwXMoo0ev0lR57mfXH9UoxEXz3nMHmX1IRQO8chrr0
         PIpc/UJqXbqu96h3LL646zpV18eYCKUx5ubeNpZw39Kz3mYwdVD8DXE/BgsmTxNnRkvA
         SsfU1jsKi7BExw8AQrbSbX96Iux9wmQy0MXbjWWL9g2c6Kap1HT+sa1k63xt8fjt0AtL
         T0nRHvGIt0S9rvhYLYi8zgGDEMKVo0jmt8e/t8QqWFLhXJ73Wz0YyGjP9L4JquPUru1R
         +mVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BeplTBdXzCMRJtq75KvkBSYOXC0YncEEEybwIvizLCk=;
        b=pFkpWauGRbr1G+oBBuZrOm6xJgVs2LFMN4kQJa6K1/re0JLfFYMOMfrGQG1YRGMpV+
         Q+4Pej+PH8+2DlkKApseoFTce/WRK2S/WOsKRCGEdD4iuLtNS+j7lT+gKqqYYeTCIzql
         3+P5nG5YMsrpqWS0zyQtFRkV3XU0tj+KV2DoKZrrS4AbqoDAxZQNDblLGdvn6+z7hvGw
         GrWbEQfy4WDhWq/g5W3zLuo/K503Zh5Wr4RKTRTcUAPjs6YgyTu2BU0NxTF69o/ybDAe
         omazbdusuHQ5Vjm8tyHNpfx7dgroa+Sv6CD07nHLlhj93wyxwggiNmOZqxzSASSMhbf+
         1T2A==
X-Gm-Message-State: AOAM530Uh0b4XY0QxF/3FfYjXC5Ke/f1XITzw5qknzcAmUYxoYrcIVJM
        ZWGxbj9PliRZsuzkLEjQBnEcViN8c2d46J3M
X-Google-Smtp-Source: ABdhPJzSEzHaojwp+iawjs+bmqYRF/HpuN/LZtP9cuGMZRk+cx/2laFd5Tin28SMNF6XK6Q8WSe2nQ==
X-Received: by 2002:ad4:5c68:: with SMTP id i8mr41067164qvh.53.1620918691530;
        Thu, 13 May 2021 08:11:31 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id g5sm2887744qtm.2.2021.05.13.08.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 08:11:30 -0700 (PDT)
Message-ID: <694c6d07525eb5f6d5a19a0c94b4f1f280b03973.camel@ndufresne.ca>
Subject: Re: Recording videos on phones and camera on Librem 5 devboard
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
        Pavel Machek <pavel@ucw.cz>
Cc:     phone-devel@vger.kernel.org, martijn@brixit.nl,
        linux-media@vger.kernel.org, martin.kepplinger@puri.sm,
        dorota.czaplejewicz@puri.sm
Date:   Thu, 13 May 2021 11:11:21 -0400
In-Reply-To: <YJz0cn4OrXNhRDoO@bogon.m.sigxcpu.org>
References: <20210512214702.GB27652@duo.ucw.cz>
         <YJz0cn4OrXNhRDoO@bogon.m.sigxcpu.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 13 mai 2021 à 11:42 +0200, Guido Günther a écrit :
> Hi Pavel,
> On Wed, May 12, 2021 at 11:47:02PM +0200, Pavel Machek wrote:
> > Hi!
> > 
> > Who is the right person to talk about Librem 5 cameras? Is there
> > mailing list I should use?
> 
> I think most of the coordination is mostly happening via the gitlab issues in
> 
> https://source.puri.sm/Librem5/linux-next
> 
> Maybe Martin and Dorota who are working on the camera drivers (put in cc:)
> have a more suggestions.
> 
> > 
> > AFAICS from bugzillas, it is still not compeletely working. I see
> > megapixels packaged in the repository, but without required config
> > files. Are there work-in-progress configurations somewhere? Would it
> > be useful if I tried to get it to work on the devboard?
> 
> Megapixels work is mostly happening here atm:
> 
> https://source.puri.sm/dorota.czaplejewicz/megapixels

While this is interesting work, I would also keep an eye on libcamera, which I
believe is a better place for HW specific media controller and request handling.
Shouldn't be very hard to port this GTK3 library on top of libcamera.

https://libcamera.org/

> 
> Cheers,
>  -- Guido
> 
> > 
> > I created simple python+gtk+gstreamer application to take photos,
> > pictures and record videos. It is in tui repository; it is work on
> > progress but some functionality is available on PinePhone, Librem 5
> > devboard and a PC. If someone could test it on actual Librem 5... that
> > would be nice.
> > 
> > https://gitlab.com/tui/tui/-/tree/master/cam
> > 
> > Best regards,
> > 										Pavel
> > 
> > -- 
> > (english) http://www.livejournal.com/~pavelmachek
> > 
> 
> 


