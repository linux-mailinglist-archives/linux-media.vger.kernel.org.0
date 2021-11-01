Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 596CA441B1B
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 13:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232244AbhKAM2i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 08:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbhKAM2h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 08:28:37 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C96C061714;
        Mon,  1 Nov 2021 05:26:04 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id l13so36011429lfg.6;
        Mon, 01 Nov 2021 05:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MgNWsP/R7v7mjf3L7eJT8so27sWCSmrE5tGVgmAZM/s=;
        b=mh6Kg4rpiT6cel2PCCKCeMFtzeUkqIUFlB/OX+ArgMJpSsKguUAULk8rTjAv0qUs8n
         CnKCM0ssix93e8AsSofd1xQWKKFOhN3T+CtdF6YKCQ6tFairZg67i8xAi+QHDbnK+mwh
         2QP0r3ug8aiz9BhOKTUiqH8BZSUo8FZLw1WeR4Jz+o/0UsvRro989QUW96xjBQ3Z4XDm
         E0u3FfykaHRzey6KPxtRh2UcFrztk8krTAfGVyk0tVVXiwFSFYFHo4cl9KhRQjOHBfj2
         7iK9fiVugHEU//tjXyw9SaGmoL51yfi1OPGF9zb3ydhwlS/6/1HUXaOSl9uHqsLAHwPt
         muBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MgNWsP/R7v7mjf3L7eJT8so27sWCSmrE5tGVgmAZM/s=;
        b=movnGdpoXCPcOi1QTNRsFy10dDUzuyGB76pHNrER78eR488DwfHE6L/jgjGId+CxGm
         EIm2zS41TCt2/rQ9U2UunMdzCo7y2Mdu9gioW4CYP6Hr/I/w1xMfK4fT1VN5G9P44evT
         s7jewmjKTa99plD50MYSP+ER/runczQBgQeYqaCIDObs8mtRVx8ZfA9IybO7Pgr7K7xZ
         pfDndhYiOPCsUm+xYgOg17eSfAiquC83W5l8MfLFnz/rMLZ7f9dny3xXW7a9NArmYX4p
         aSU5LxCWepfNGkAnEXSKItJgT1Uh1W58tC6RmYYhx/FTjSAaT2CiQvHrwIY83ihSqW+f
         Hvig==
X-Gm-Message-State: AOAM531279/B0IwDpk+A0o1libdDzDh4Xuu5BqPTBLJC1THDKA9XwBFA
        WcNwoA6OpNSk8C3/KrT+0VAH4ZWR+8Y=
X-Google-Smtp-Source: ABdhPJxoRBbOjlwp+AYa3++MFwNSEOA1FB099CRUgLP42IYfSpf29yp364qpCgSidIU0AM2FakHXMw==
X-Received: by 2002:a05:6512:2618:: with SMTP id bt24mr26930808lfb.46.1635769562419;
        Mon, 01 Nov 2021 05:26:02 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.235.8])
        by smtp.gmail.com with ESMTPSA id k39sm1395953lfv.284.2021.11.01.05.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 05:26:01 -0700 (PDT)
Message-ID: <613828ef-085c-acbb-f54e-7819dc22c769@gmail.com>
Date:   Mon, 1 Nov 2021 15:26:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Need help in debugging "memory leak in em28xx_init_dev"
Content-Language: en-US
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <CAD-N9QXsUcczurqq9LdaVjXFZMBSbStynwFJyu0UayDazGe=nw@mail.gmail.com>
 <55f04cb1-18ac-085b-3d35-7a01716fbcbe@gmail.com>
 <CAD-N9QVN7cepUpRu3d-xtr1L3DG90-nLS4gmkjerDZO21F_ejQ@mail.gmail.com>
 <f622f569-25d5-f38e-e9fb-7f07e12c4b7e@gmail.com>
 <CAD-N9QWeGOZdnuRuHVVNzZHWeP3eSHg=tsm+Qn3tqGqACSNbhg@mail.gmail.com>
 <ffbaeb72-0f76-fb1e-dde5-6e6bdcce1301@gmail.com>
 <CAD-N9QWQkivwR0mWwiaW_pLE6J_b03x4dP8RyxbmuKYRkcRhoQ@mail.gmail.com>
 <28a3777a-7941-6ffc-07e5-38456372cfb3@gmail.com>
 <CAD-N9QUcoKnEWw98XnBJZkas3AkwPonNG0K-PMROOwn8kReT5g@mail.gmail.com>
From:   Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <CAD-N9QUcoKnEWw98XnBJZkas3AkwPonNG0K-PMROOwn8kReT5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/1/21 15:23, Dongliang Mu wrote:
> drop? I do see some patches from local syzkaller will attach this tag
> to assign credits to syzkaller/syzbot.
> 
> I think this form is good. Thus I copy this tag from them.
> 

Sorry for not being clear :(

I mean, I can't send my "Reviewed-by" tag to the patch. Missed that 
"R-b" can be also decoded as Reported-by


With regards,
Pavel Skripkin
