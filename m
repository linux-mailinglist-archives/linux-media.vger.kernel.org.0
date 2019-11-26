Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B46E810A361
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 18:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728168AbfKZRfF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 12:35:05 -0500
Received: from mail-lj1-f173.google.com ([209.85.208.173]:34977 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbfKZRfF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 12:35:05 -0500
Received: by mail-lj1-f173.google.com with SMTP id j6so12190728lja.2
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2019 09:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=In3WJ4lRh543V8+wkDgTza/5P0w1cRDTWMhpU4Jl8fE=;
        b=VU/JLzEHbBRXHO03mDs8kONKGShciaFdLDY6a0D77quykLTl7YyRu+MiWoIGON+0it
         tLqUeclH9MiETgPLcz2N2c9iYxOFLeD2tdG/b2NOcYaH7E2wpAO7bXviiDJeqAVXYGd9
         wvcNluKFWLckgdnA3W5z+oPtz5OSm+OGBKB6B8lAwfGuXRprpMdStZJoZip9fKYjERys
         w8uniRkUjj3qjLWv7B68n/NA5alLXJeH8MZRk1HJA9raLr7NGT+Qd8dPeqpGiD1smmLf
         n4gwqV2HwGRhn84KyCxonhAX5JxAKUcjHTRklkEIDDGLO3qQOtK59CRF/yKspyV4ZPef
         suow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=In3WJ4lRh543V8+wkDgTza/5P0w1cRDTWMhpU4Jl8fE=;
        b=b++oOMGv2iB6PkY7jI8ElBkfPO+tQrh3R49BWmhkzcnziWDSgoz0N5cUBNSFM0y/Bu
         o4TWzWmT/+3PDV/rh8okP6ljzvheWdeU7udCFv1wmftMFVTzk0ZokC0G3qUnX40nanTm
         +R5JGjSwUYZeKenLfqcN95yobG6L/UbR56M/q7eHz21ytkTTKxJsjVr5M0ZyKDvjIPLI
         96E3ypsJSy1TZKybdsOdW5BZ3TzfXWWmq4p35PdwZ7lFtJukOu5BikF0TG/WVAGepPDO
         LXaPBsE5aMD7qfWSONoPGfOk+1rJOY7Z5m1vtL2RWfSoaZx2Ne/LrDORQCZiDqMhKicL
         UW/A==
X-Gm-Message-State: APjAAAWujNd6KlYZJRpueipiQZ/K9COj5uL2PZFRiR6aAbWIoEDFYHb0
        9Cb4X0pHWbkqkVDDbQ3RYh0NggtEL19vqYMDtiM=
X-Google-Smtp-Source: APXvYqzP4L+X2eqIyPDX5f6lpBd9HRk+5WdkZ7pFGdsF5hIlT95EM6kuYwHkhu8Num+VSRY7fUXtXMvRVhMP8mTKHCA=
X-Received: by 2002:a2e:8885:: with SMTP id k5mr11435757lji.98.1574789703581;
 Tue, 26 Nov 2019 09:35:03 -0800 (PST)
MIME-Version: 1.0
References: <CAAMGra5wp8o3DAFQdYk3Ky2oaWaNcX-o4gejW7jro5Rm1pkVug@mail.gmail.com>
 <8137b15e-084d-417a-6ee8-b425b74140df@mleia.com>
In-Reply-To: <8137b15e-084d-417a-6ee8-b425b74140df@mleia.com>
From:   Stuvart S <lovelinuxdeeply@gmail.com>
Date:   Tue, 26 Nov 2019 23:04:51 +0530
Message-ID: <CAAMGra6q-7Jr_CSMR7-TtLyr1L+z1K5USKZt=UEMJspd-nJuCQ@mail.gmail.com>
Subject: Re: TI Deserializer DT node configuration
To:     Vladimir Zapolskiy <vz@mleia.com>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Vladimir,

Thank you for the information. I will check the links shared.

> Unfortunately for dealing with camera sensors there should be one more device driver present

sure,I am using OV10635 as my sensor.I think the info provided will
help me as it is something hard to get in touch with the remote I2C
part and its DT configuration according to me

I will try it and and will revert back soon

Regards
Stuvart

On Tue, 26 Nov 2019 at 22:22, Vladimir Zapolskiy <vz@mleia.com> wrote:
>
> Hello Stuvart,
>
> On 11/26/19 5:55 PM, Stuvart S wrote:
> > Hello team,
> >
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
> >
>
> once in the past I've shared the essential part of my device drivers
> and the device tree configuration of connecting a serializer/deserializer
> to a display panel [1][2]. Unfortunately for dealing with camera sensors
> there should be one more device driver present, and MIPI CSI-2 controllers
> are very specific to particular deserializer/serializer ICs.
>
> Both TI DS90UB964 and DS90UB913 are supported in my driver suite,
> however your hardware configuration may require some adjustments, also
> note that my selected approach is different from Luca's one, and to my
> knowledge anyone's published work is still under development.
>
> I feel I have to find more time and complete the driver series,
> the precondition is quite difficult though...
>
> [1] https://lore.kernel.org/lkml/f0a52a64-a7e7-b266-a402-1279036fad36@mleia.com/
> [2] https://lore.kernel.org/lkml/20181012060314.GU4939@dell/T/#mead5ea226550b6f0
>
> Slides for introduction into the patch series:
>
> * https://schd.ws/hosted_files/ossalsjp18/8a/vzapolskiy_als2018.pdf
> * https://events19.linuxfoundation.org/wp-content/uploads/2018/07/Vladimir_Zapolskiy_Bridging.pdf
>
> Hope it helps.
>
> --
> Best wishes,
> Vladimir



-- 
                        --- Come    Let's enjoy the world of Open Source  ---


Best regards,
Stuvart
