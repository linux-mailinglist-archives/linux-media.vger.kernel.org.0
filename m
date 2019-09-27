Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99854C0843
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 17:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbfI0PEG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 11:04:06 -0400
Received: from mail-pf1-f173.google.com ([209.85.210.173]:44638 "EHLO
        mail-pf1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbfI0PEG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 11:04:06 -0400
Received: by mail-pf1-f173.google.com with SMTP id q21so1744761pfn.11
        for <linux-media@vger.kernel.org>; Fri, 27 Sep 2019 08:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=xiOLI+FcV1rhUoZyTSLkxleTs4hqbVLvfZ6ZWEBxTT4=;
        b=AUXH80byygXyXKw0Sm4z6mi9q99BlhsBJwF5f1926Uycjhi8AVs0rfm/Qrmn0pWVn5
         3UvPl04p+aLicQHRy1L7vdupfuAD54x9D3FqOFiQeBp0zYectFunDULdcjyHeBP8Hdh3
         LJQa2+3jk7LGKkCFD/EGLBJNn3x1dcBbxQJ7fPyvhwremC1OS3ttazUxLR6kzoGGY7Nu
         9P8VVAF2/htTzCrRng5oMxPfwVnNx0Hr+ltla/momdyaF7eRWLRQftw3mqcmb6rN06zC
         KYLk316mqPEqpHTEKc+VYOe0Sxnc2dKxlBKqbIzsgqisuDLJTPsU6OOySWrI9jmsqYCi
         MXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xiOLI+FcV1rhUoZyTSLkxleTs4hqbVLvfZ6ZWEBxTT4=;
        b=GVl7B5XaDt4ySBjEcMZlvfgEHWsCrzBq5U52dltST3y2x3kr4cl6dZAtT5hadX96d5
         FkVbJPwuKiFRMWyh2b4Zq6Wg0PrK7TpD9gScclHWjs1Uw1yuzJD5k7sAddMvxRBOgipn
         iYSyPMHp0nc183Y4O+AGT90roSZ5I/poKjbEon15MJZui28KjCYJCSOcT19Rab/n5PHg
         xSLPx2FEBoEpatKEVHLlOZ7KO9u2hlqpLyf3dycmLP6KFFRh8mhn/1HbND5MXwONgeIj
         INBKoPp6sXh97+JcJC0NXVi+AlOLAui7sZ8r3KUJpnQ3Gtr/ETTVa+RKY/oonp0hHOmA
         TYpw==
X-Gm-Message-State: APjAAAVhvyoSAWKTDkHtCrNGBWrU6JhMu0aYJvm2F25LEPa+2EFU6Y17
        oqJUpiR1YTHtUOuMvlLmq49WRyYe5DQ=
X-Google-Smtp-Source: APXvYqyH/9aLbn9nVkok+hrILsxwCCCrIgEWrkyBEgbEyuLIpxk25TgpubJlxb06r15UJFtbimXm5g==
X-Received: by 2002:a62:b606:: with SMTP id j6mr5099069pff.254.1569596645800;
        Fri, 27 Sep 2019 08:04:05 -0700 (PDT)
Received: from [172.20.34.69] ([12.157.10.118])
        by smtp.googlemail.com with ESMTPSA id k9sm2916917pfk.72.2019.09.27.08.04.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 08:04:04 -0700 (PDT)
Subject: Re: [ANN] Media sessions in Lyon in October: future V4L2 work
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
References: <bfeb78df-aaa5-a756-16d4-c874a7dd4645@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <2a3f66c8-0326-fb09-6a7e-b1c84a0e06c6@linaro.org>
Date:   Fri, 27 Sep 2019 08:04:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bfeb78df-aaa5-a756-16d4-c874a7dd4645@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 9/23/19 7:27 AM, Hans Verkuil wrote:
> Hi all,
> 
> Since we have three separate half-day sessions for different topics I decided
> to split the announcement for this in three emails as well, so these things
> can be discussed in separate threads.
> 
> All sessions are in room Terreaux VIP Lounge - Level 0.
> There is a maximum of 15 people.
> 
> The third session deals with future V4L2 API work and is on Wednesday afternoon
> from 14:00 to 18:00.
> 
> Attendees for this session:
> 
> Kieran Bingham <kieran.bingham@ideasonboard.com>
> Boris Brezillon <boris.brezillon@collabora.com>
> Alexandre Courbot <acourbot@chromium.org>
> Tomasz Figa <tfiga@chromium.org>
> Ezequiel Garcia <ezequiel@collabora.com>
> Daniel Gomez <daniel@qtec.com>
> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Eugen Hristev <Eugen.Hristev@microchip.com>
> Shuah Khan <skhan@linuxfoundation.org>
> Helen Koike <helen.koike@collabora.com>
> Jacopo Mondi <jacopo@jmondi.org>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Niklas Söderlund <niklas.soderlund@ragnatech.se>
> Hans Verkuil <hverkuil@xs4all.nl>
> 
> If I missed someone, or you are on the list but won't attend after all, then
> please let me know.

I'd like to attend too, I'm interested on v4l2 modifiers.

> 
> As with the previous session: if you are 'just interested', then let me know.
> If others want to join this session who actually need to be there, then I
> may have to drop some of the 'just interested' people. At this moment we're
> at 14 devs, so that fits.
> 
> Agenda:
> 
> TBD
> 
> We will at minimum discuss Boris' RFCv2 patch series:
> 
> https://www.spinics.net/lists/linux-media/msg149221.html
> 
> (I've asked if he can rebase this and post a v3)
> 
> I will expand the agenda further in a week or so.
> 
> Regards,
> 
> 	Hans
> 

-- 
regards,
Stan
