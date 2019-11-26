Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18C4110A1C7
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 17:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728728AbfKZQRV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 11:17:21 -0500
Received: from mail-lj1-f180.google.com ([209.85.208.180]:37370 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728290AbfKZQRV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 11:17:21 -0500
Received: by mail-lj1-f180.google.com with SMTP id d5so20932229ljl.4
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2019 08:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/DuHUYnElSyPqztAtsBvKkDQaJRhnG9tal9i8VgI00c=;
        b=tQMgYHSzZYj/Zm+3j/W+napSXtpLfX8a7Lv2t+gsiy9Pv2UCBqyvuFDPkD83ABGNJt
         Ad/N6BOcsixtH2903EdZ2lMAQF+m1hoa/8sNVnFaEfvUY39pyGmHX+fg2V2j+neRFwpK
         P40q3PjpCXNRzCtpnxXbfw2V+BbO8HECMfXULHisJdkbl4VwjfdJbZ6tJszX82aM4tTK
         kyYfLwBdMKx7GsQmz1j7afqHgufo0a5tRTwjrfC/4vIaEgxRlGXPBhAV80wUrzH5IMlM
         EzG3CS0vEJRLwtfiEZl3zzecyKGkCvN0b8i9xkKYFMjVFBerPK55exJLk6tKA6y8bwCu
         8WhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/DuHUYnElSyPqztAtsBvKkDQaJRhnG9tal9i8VgI00c=;
        b=ieFVBjhYTEIllJ7HXGJSshnHV/Ie7mR1uXYrzf+gtakt0jnOYiiHzNEC0GReky236H
         EFA6cSoSkR3J1iQ/F2ym7+x3vmW9UafohMvs2ATlC/kqp0H4YY+yB/X4MSIli8+Q2NZr
         WCj3IgKxlBtNVC6wElZL8QYvYG83Ff34sL5l5oWYMjEM9Pnkas9B9aKoX7uYokNCx3ZF
         lBz019pVgMOKBOgzodzOhoEAHJ8n81/hwVAHjtc1tCmYMCLI5VGjqKrj0ulBT5DpIOFq
         fgo/MsJ+ct0cY+BTVe2SMDmI21C9fRejannKJJ04DO2q3tiqF+reMUkL9E0icrQjuDa5
         XgqA==
X-Gm-Message-State: APjAAAVvfy5vh46thYhfFHDjiEVQHDkHkfCKqWv6Hj1m/3ko9HBjQcK8
        xMOUxjT118zBdkT1fxYw41Jm9V9vaEidJsQ+QJaNhviM
X-Google-Smtp-Source: APXvYqxjkYIenA6qbLyVsuug5PsQFNibYTQ//8+4qzpUpYl8fGr3R+VcjRyD6/c4+SAj/1Uq9CWZGl4/ubxmrdVc5MU=
X-Received: by 2002:a2e:8885:: with SMTP id k5mr11188830lji.98.1574785038528;
 Tue, 26 Nov 2019 08:17:18 -0800 (PST)
MIME-Version: 1.0
References: <CAAMGra5wp8o3DAFQdYk3Ky2oaWaNcX-o4gejW7jro5Rm1pkVug@mail.gmail.com>
 <20191126161100.lmow4vehzy3b5vcd@sapphire.tkos.co.il>
In-Reply-To: <20191126161100.lmow4vehzy3b5vcd@sapphire.tkos.co.il>
From:   Stuvart S <lovelinuxdeeply@gmail.com>
Date:   Tue, 26 Nov 2019 21:47:06 +0530
Message-ID: <CAAMGra4XkmX9rjO2doMKoxuyNGhMMVY9EOyZXMQPm40HwWU6rA@mail.gmail.com>
Subject: Re: TI Deserializer DT node configuration
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you Baruch for the quick response. I will check it out definitely

On Tue, 26 Nov 2019 at 21:41, Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Stuvart,
>
> On Tue, Nov 26, 2019 at 09:25:48PM +0530, Stuvart S wrote:
> > I am integrating DS90UB964 deserializer into my custom board based on
> > Rcar H3 Salvator XS. Deserializer is connected in i2c6.Also I have my
> > four serializers as DS90UB913 and cameras OV10635.
> >
> > Can any one please help with the following?
> >
> > How Deserializer connects to Serializer in DT node?I came accross
> > about the terms remote i2c, i2c-mux,i2c-atr.but I dont understand.I am
> > not using any i2c switches.
> > Any DT example is helpful for me
>
> You might find this Luca Ceresoli ELCE talk interesting:
>
>   https://www.youtube.com/watch?v=7hLv6fYAW-E
>
> Slides: https://elinux.org/images/f/fc/Ceresoli-elce2019-video-serdes-linux.pdf
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -



-- 
                        --- Come    Let's enjoy the world of Open Source  ---


Best regards,
Stuvart
