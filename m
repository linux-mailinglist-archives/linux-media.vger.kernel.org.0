Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3572622C4E7
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 14:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgGXMP1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 08:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbgGXMPY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 08:15:24 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7FDC0619D3
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 05:15:23 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id 140so5078078lfi.5
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 05:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qYbBKClC5cJ6jOqxJwLfyKowskmoneqRqnKDswcf9ag=;
        b=b81yMv6SglHboTJWm3aFxuu58QQXPtK3DcVb3RecUljgKVm26zvc6kiJ96ffLi95ox
         hsHnrjDI5FrwDYBfXBDWxkV8YfkT2C7q82LKoCueP1Vv7VlIwTzAKJ8ZrVkzXMnjv2ly
         6z4gmK/2Hse/bDpyrFrzAKZxoSx21zaVTu6asEJapg0kWr5v3SC2QOBiFfyizQLYP70L
         E+l43iBCuFkmwaIfv0RFYwypHvIKki8kp593Yus+RyyNbssBcj1dpO2GAOch9Rz59zHJ
         tbuFSNqaWXrIzkCJrAa9f4LPeDf0nZxX+fEl8egMwbNzouHgLF5IVnWD+onBc8SIw6M5
         95bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qYbBKClC5cJ6jOqxJwLfyKowskmoneqRqnKDswcf9ag=;
        b=pdPbvBwPUYvPSUf9JY6orLPr0hdBl4d6E82uUP4mVedqoJnaLCCTvqDVxtog6V2+fL
         WF0zX/7vX33DNNfPQIJICHGwQGjyclol+aNFL5qjz0OlCoHhPmKYT4baYD/6u94WUB6T
         Bkr8eIAIuY8buui1Cm2DctNzHNHl67+Dq8G3MlPdo4l8wqLHiLEh+TcS8VM+KSvrDGEd
         ALU06jHqtZP+dyYgo+N2tjOLHSIom7ekNaqMmZ57dsJlOLPfmr+cHuxLlg4TjSVZPldj
         q0rre5/PzILZRqE806gKq3Ns9DEhtPYbCISD/IN0+DVZhVJ1noRPeV5jUWZYKIUQ9/cy
         m/nQ==
X-Gm-Message-State: AOAM530QO7Rxxw0CQ5jLSmNfvrAW0TVoqcE07PCtduJ+eUuHe/jANMFo
        VQhz7btuMDoBL+wY0/T8J0sj0w==
X-Google-Smtp-Source: ABdhPJxOfgW0PEucKpHfOt7nz+90o7q0F7lQgh9KHOI2ct9QhtrpC7EeNGhUsQ71NM9FsLc9kmADFA==
X-Received: by 2002:ac2:488c:: with SMTP id x12mr4663372lfc.4.1595592922254;
        Fri, 24 Jul 2020 05:15:22 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id n82sm228020lfa.40.2020.07.24.05.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 05:15:21 -0700 (PDT)
Date:   Fri, 24 Jul 2020 14:15:21 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 0/3] media: vimc: Allow multiple capture devices to
 use the same sensor
Message-ID: <20200724121521.GA2705690@oden.dyn.berto.se>
References: <20200724120213.17119-1-kgupta@es.iitr.ac.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200724120213.17119-1-kgupta@es.iitr.ac.in>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kaaira,

Thanks for your work.

On 2020-07-24 17:32:10 +0530, Kaaira Gupta wrote:
> This is version 2 of the patch series posted by Niklas for allowing
> multiple streams in VIMC.
> The original series can be found here:
> https://patchwork.kernel.org/cover/10948831/
> 
> This series adds support for two (or more) capture devices to be 
> connected to the same sensors and run simultaneously. Each capture device 
> can be started and stopped independent of each other.
> 
> Patch 1/3 and 2/3 deals with solving the issues that arises once two 
> capture devices can be part of the same pipeline. While 3/3 allows for 
> two capture devices to be part of the same pipeline and thus allows for 
> simultaneously use.

I'm just curious if you are aware of this series? It would replace the 
need for 1/3 and 2/3 of this series right?

1.  https://lore.kernel.org/linux-media/20200522075522.6190-1-dafna.hirschfeld@collabora.com/

> 
> Changes since v1:
> 	- All three patches rebased on latest media-tree.
> 	Patch 3:
> 	- Search for an entity with a non-NULL pipe instead of searching
> 	  for sensor. This terminates the search at output itself.
> 
> Kaaira Gupta (3):
>   media: vimc: Add usage count to subdevices
>   media: vimc: Serialize vimc_streamer_s_stream()
>   media: vimc: Join pipeline if one already exists
> 
>  .../media/test-drivers/vimc/vimc-capture.c    | 35 ++++++++++++++++++-
>  .../media/test-drivers/vimc/vimc-debayer.c    |  8 +++++
>  drivers/media/test-drivers/vimc/vimc-scaler.c |  8 +++++
>  drivers/media/test-drivers/vimc/vimc-sensor.c |  9 ++++-
>  .../media/test-drivers/vimc/vimc-streamer.c   | 23 +++++++-----
>  5 files changed, 73 insertions(+), 10 deletions(-)
> 
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
