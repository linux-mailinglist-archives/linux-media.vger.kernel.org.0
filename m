Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9DA43C9E7
	for <lists+linux-media@lfdr.de>; Wed, 27 Oct 2021 14:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241964AbhJ0Mq0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Oct 2021 08:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241954AbhJ0MqZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Oct 2021 08:46:25 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F610C061745
        for <linux-media@vger.kernel.org>; Wed, 27 Oct 2021 05:44:00 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id q127so2424621iod.12
        for <linux-media@vger.kernel.org>; Wed, 27 Oct 2021 05:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HDxKmOZ62FUht58FdXOSx5Qa1yp34Gywlo2BVog2d4k=;
        b=JD6O4ZfLxh8lT62FkFjA9y4GRGOql1L41J7By24XJWV1Tot3Aga8EnorZcDBx6JwSy
         O+hxUv6SYvUmpaXxk9V3Wz+Z8nmguLLjYr2Ku8u801A1YWrAI+rVZq9s/TwmOzY+KIq9
         BVOvXJqxvV+yH/84+LJjZjMhp/JilthjAJP3PdkFOsD8g3KH6vYAtMmeu9ivfGF4O9R/
         HyhVgaI0wT490I/coyp3XSy1krG376aNuw3+Rd68NGQaHc6lfja1CkHZfFxud44l1T+a
         oSjmCbivcVjG35a4p4MP1pyqdwI/JKch5MQebhpvlGrjDALa7Ir1gyAha12ZfiFkb0tq
         rzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HDxKmOZ62FUht58FdXOSx5Qa1yp34Gywlo2BVog2d4k=;
        b=1Cs6c92YiipzVfHl+jDhGur0WkRZUQv3sMj6zCkgGc5XFZYszZXO1cMQ5eYACKTgmx
         YWDk4/0zV6N6FsN0SS/8TzETXWahXmqbcFJ+4yec8snkz5/5mR0rPjpegtoygOZ3r5Pr
         z5emj6e4yz8O/JycNsbi4OxUrcvOeRquZw5bYXa/a2CUY5Ip4OA83956FT1MQmUfREHW
         05yad7kB10ksYV3zae50n/UVV74G/cCZf7cvHsU5HIeP313FB+mYWh8tl5mBHSTTIfoH
         izOrCKwzKTaeNOyXX1sRKBdHnbR/4UIQheZIhSb7xGwyDrNLZe8bUxnalx3PF0pZiiEN
         4sMA==
X-Gm-Message-State: AOAM533jPY19W8k3GouHmBzpDAk1SXGqy2Tn9LS6IdUcp1TM8ks4TW9+
        eTTkhC5xOY51QfD3Sem8Z+p2LqdrfzP+gApK8td6mw==
X-Google-Smtp-Source: ABdhPJxraYfyEAPdAQGs1VHNpepQRGngxVf/3a/ovSme8ZzoFWFZBjIZBzs37dAcZqbudR76+NRe9KtzN2zrnxVmRmc=
X-Received: by 2002:a05:6602:148b:: with SMTP id a11mr20342831iow.85.1635338639393;
 Wed, 27 Oct 2021 05:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <YXU2i0FtAGDRCMSu@fedora> <202110271450.Z8JPybLg-lkp@intel.com>
 <20211027061552.bb4fczniqp6b7amh@pengutronix.de> <20211027073204.GA3978@gofer.mess.org>
 <CAH7FV3nb8K2qKgGZh-uMCk_BykWJ_sOb7K-jEhNjazYSiXdqbw@mail.gmail.com>
In-Reply-To: <CAH7FV3nb8K2qKgGZh-uMCk_BykWJ_sOb7K-jEhNjazYSiXdqbw@mail.gmail.com>
From:   =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
Date:   Wed, 27 Oct 2021 09:43:47 -0300
Message-ID: <CAH7FV3=7Y7Z0y+Mq5Ak12KDMiZpHQHXGixF_pcrnQkuqCO9kvQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: rc: pwm-ir-tx: Switch to atomic PWM API
To:     Sean Young <sean@mess.org>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        kernel test robot <lkp@intel.com>, mchehab@kernel.org,
        thierry.reding@gmail.com, Lee Jones <lee.jones@linaro.org>,
        llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[resend it in Plain Text]
Thank you for the feedback! I appreciate that! I'm new at the kernel
and I got a little confused about how to send the new patch. Should I
send a v4 of this patch or just send a new patch fixing this issue?
I'm sorry about the question and thank you for your attention.

> Em qua., 27 de out. de 2021 =C3=A0s 04:32, Sean Young <sean@mess.org> esc=
reveu:
>>
>> On Wed, Oct 27, 2021 at 08:15:52AM +0200, Uwe Kleine-K=C3=B6nig wrote:
>> > On Wed, Oct 27, 2021 at 02:07:19PM +0800, kernel test robot wrote:
>> > > If you fix the issue, kindly add following tag as appropriate
>> > > Reported-by: kernel test robot <lkp@intel.com>
>> > >
>> > > All errors (new ones prefixed by >>, old ones prefixed by <<):
>> > >
>> > > >> ERROR: modpost: "__udivdi3" [drivers/media/rc/pwm-ir-tx.ko] undef=
ined!
>> >
>> > This comes from the line:
>> >
>> >       state.duty_cycle =3D DIV_ROUND_CLOSEST(pwm_ir->duty_cycle * stat=
e.period, 100);
>> >
>> > where DIV_ROUND_CLOSEST expands to a normal division but state.period =
is
>> > a u64. So this should use DIV64_U64_ROUND_CLOSEST I guess.
>>
>> DIV64_U64_ROUND_CLOSEST is for dividing a u64 with a u64. We're dividing
>> by 100 here so this is not necessary.
>>
>> It should use DIV_ROUND_CLOSEST_ULL, however it might be nicer to use:
>>
>>         pwm_set_relative_duty_cycle(&state, pwm_ir->duty_cycle, 100);
>>
>> Thanks
>>
>> Sean
