Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9BB1A33C
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 21:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbfEJTBa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 15:01:30 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42608 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727878AbfEJTB3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 15:01:29 -0400
Received: by mail-lj1-f193.google.com with SMTP id 188so5952913ljf.9
        for <linux-media@vger.kernel.org>; Fri, 10 May 2019 12:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=lRsqoSqizC0Lpx0MdOlUYVCjsAeqtwnsFnbrDqrKraM=;
        b=OaHdjFZLrNEAtgu+yLoo6K6uB60m3lXMjf7uIS986pi4ch+u+j0VHGA9iM6qafIe1J
         TUClfIbFo8wh+PD7SEIhRpum972FmSfqfGOddhUdUe10ZndI6Sx7zjQ1LeI232xcqY4L
         hzaHEcsuT1i3TobIPMYKjxW8TliQ7lXpRhyaJU8qXd0MixgtqgjtPtEdGd2SdV1PYrP/
         W8tDvuz6mpySNO7bW7AsESIwhJbD7m36h1L6LzzHVGk6U27rOA9vEKUcMLL6jZmbT8Mw
         Azf73GWltM4JrqNaWdALZxe1dWA+X2wwoXF1igjDNJ1fbs19eXkP9Gf6ZWsaDpHUmA6w
         dJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=lRsqoSqizC0Lpx0MdOlUYVCjsAeqtwnsFnbrDqrKraM=;
        b=uepmj9tAbvDrVkRBGONiL+4XZpsf6wGlYBq09XMmYn+LPYBmn+1flJ0PkurFzgRD+r
         WR/4GdCCEJDn3VGMUWJjubkJosi5cdLWu2a8CJBXdO8ruJJxeBQqghrMl83e/cxzGiaU
         tOCVj60o5AFw7Aymk0YO9VGNBFfzxeDnOLbKV/L+MxaaFErLxkWMNLZlqrbAzCKqvDu6
         JLP4o3GzwfZFCJZaCAG2lqCyws0jC7jY8yWv/05Qn91Qe0fUwm6qZKQnydXgJkt9s0Dm
         yLYK1UaVMFJwK42JvsRExs0YSeoBL26E2lprWfx/P6qCIbVSWBJ2oOfser61LlCTPLXh
         5ipA==
X-Gm-Message-State: APjAAAWjw9h1eAiwlr6DKHtwJz8dK7MU3I46I1EqrVlfoQaAZbSF3vVS
        bJro+V5LfNi7zxp4S5EJ1U0u47a5Gw0=
X-Google-Smtp-Source: APXvYqxEFvqRRYfGkqf67TGF7zMsFQidnKuhJN5ls47d7/B4qBA0DwhzDln8IPGXP94A5LuWmq4nBA==
X-Received: by 2002:a2e:99d4:: with SMTP id l20mr7056110ljj.10.1557514887462;
        Fri, 10 May 2019 12:01:27 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id s16sm1584264lji.61.2019.05.10.12.01.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 May 2019 12:01:26 -0700 (PDT)
Date:   Fri, 10 May 2019 21:01:24 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Michael Rodin <mrodin@de.adit-jv.com>, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        michael@rodin.online,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: adv748x: initialize bit 7 of
 csi_tx_top_reg_1f
Message-ID: <20190510190124.GE28561@bigcity.dyn.berto.se>
References: <1557502240-16274-1-git-send-email-mrodin@de.adit-jv.com>
 <26e001a0-298f-e23b-9e46-98e62a8399c2@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26e001a0-298f-e23b-9e46-98e62a8399c2@ideasonboard.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran and Michael,

On 2019-05-10 17:25:24 +0100, Kieran Bingham wrote:
<snip>

> 
> Niklas, how does RCar-CSI determine the top/bottom sequence?

That patch just got merged in the media tree a few days ago,

    9f7983bdc4925ae2 ("media: rcar-csi2: Propagate the FLD signal for NTSC and PAL")

> 
> Do we have field inversion currently? (or one which is perhaps swapped
> somewhere along the pipeline in rcar-vin?)
> 

I'm not sure which tree this patch is developed on but Steve Longerbeam 
posted a RFC which IMHO had the fields inverted, there was a discussion 
in his thread [1] where I tried to get to the bottom of the issue. My 
conclusions there might be wrong due to the issues addressed in this 
patch.

Michael: Did you have Steve's patch in your tree when testing this?

1. https://patchwork.kernel.org/patch/10904263/

-- 
Regards,
Niklas Söderlund
