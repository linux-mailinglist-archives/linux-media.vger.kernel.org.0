Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1BF54A6FEA
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 12:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343933AbiBBLZk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 06:25:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343931AbiBBLZi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 06:25:38 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B454C061714
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 03:25:38 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id a28so39906086lfl.7
        for <linux-media@vger.kernel.org>; Wed, 02 Feb 2022 03:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=njtgT/Hj6QOxnTQzsDM9CxbROgEchM6ZlUmD1fFi8h0=;
        b=Yfa9SzdZEFSzuNuCORX+HsBgYgMhscV1+2ILJIRa/wl7Phq/cinr6ADeGyWPwJvZEJ
         RMh9md7Ho62CMKs0lnpf2ZGgsJB2xu9GWx6Ueb07SjVLWBjUqcj4zlYYrypLukUIeBo4
         RkIq+nUHybAsIjlBzWYPD2YwrQuAZEk2xOneZV1vqVWOwNfkuQEPntWoWUfygqQTV0F9
         7f0t/ZenpYgP1R7LvCxiXriWoSQOHMIwDGpvILIdgSFnWR3HeTkK/Guh9McHFGEg7SzW
         yZbbd/fejaV/UEYiugiLKjTIifG26G8RX1WlDfzHNIiskGl6nljJAQaglo/L5sAUshXf
         lJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=njtgT/Hj6QOxnTQzsDM9CxbROgEchM6ZlUmD1fFi8h0=;
        b=rtxkXrvSVw9VTa9/pnUX4DZ2B/p1hrgANpQ2d4y3KqCiqT874JKtIl+WUZYJR7TKBb
         LW6wBcp/ywuivT3y+y+ZUXy7ewZo8rgbwsjURDYcEeMe78Zkt0TuLrJb4x0igMlxYF0U
         GKjJPakhcKLVlQf9/DDBmSVPgtBmzFjY1Ej/Dxf3TVHVmrEHygF10a221skUrskzQv1Y
         5u7NQ6t539d4Qow/bVEJ/zI+WHbm2W81NHAhAYKnAo24fvuy6QdiV3EnsPrstaaVKUs7
         WQHdMP2EC0RYy6QtN62DPWmdLiwMqgeoQyU4ecdlt8oQHtehlFzDFfJmRdGI1BkXHl2M
         rqtQ==
X-Gm-Message-State: AOAM531OAnTLnxr3a8esBeN9e+S9PqSmU0V36MIi2hU1Bd3uFJdAGnG0
        nnpRMTN4Q7sgEff3J6O1+jwGeA==
X-Google-Smtp-Source: ABdhPJxqWwktBiY9sY0hxxB5jfTG/UKv+PohXhZtZgufEqPQZfD4nwQTeH9kSFDrFTn378LB88Zt2Q==
X-Received: by 2002:a05:6512:238c:: with SMTP id c12mr22469363lfv.333.1643801136432;
        Wed, 02 Feb 2022 03:25:36 -0800 (PST)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id n20sm2769079ljg.136.2022.02.02.03.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 03:25:35 -0800 (PST)
Message-ID: <8c3dfbb7-3978-438b-36cc-6bb0fa57a814@cogentembedded.com>
Date:   Wed, 2 Feb 2022 14:25:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] media: rcar-vin: require master VIN only for CSI source
Content-Language: en-US
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
References: <20220202104700.3329055-1-nikita.yoush@cogentembedded.com>
 <Yfpm/7p/O4WPpx3m@oden.dyn.berto.se>
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <Yfpm/7p/O4WPpx3m@oden.dyn.berto.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi.

> I agree this issue needs to be addressed and I think the use-case is
> covered in the patch 1/3 in the VIN routing series [1].

Indeed, that patch moves the check to CSI-only path, which is exactly what I tried to do. Thank you!

> I don't have
> access to King Fisher hardware so I can't test it, if you do could you
> test that series and see if it fix the issue?

Right now I don't have all needed hw to run the test that reproduced the issue. If/when I get access to 
hw, I will try it.

Nikita
