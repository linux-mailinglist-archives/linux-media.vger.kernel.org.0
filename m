Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEC1ECAFA8
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 21:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387951AbfJCT55 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 15:57:57 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45400 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730707AbfJCT54 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 15:57:56 -0400
Received: by mail-lj1-f194.google.com with SMTP id q64so4083698ljb.12;
        Thu, 03 Oct 2019 12:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2aBkEbDPMgmCiFY2g65Do1mWjqU/NiLKGaQP5y74K7M=;
        b=tCkF7XHrw3cDqkUJiCECYj9MEjzyI9PKi9AEwFAA712gBMakNBylTbyz/pU45DEBrx
         gilwWLn4AQcTkbo7NXI6wgIicGizEkoz8YlfC0V/OFWVkbT3BREZ/VbS9T1sybBHDpg6
         z9wAlKdcOC7XjitTI+De6PA1aV1R8mnM8fLEvvORDslWNgLQlg5MrnBnbfr7G7wMDJHy
         SgZtplGP+bimOqcdVdwkqzG5uMLFK9GOSzAdqLIryx/EZUAZgRgB0OSws17VHnpOin/a
         Pr5vyW19wRqliE+QiqiRGb720DicKr56675IZuuAoq/BUt3usDeTj/8nc2eKaLuWTIne
         EHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2aBkEbDPMgmCiFY2g65Do1mWjqU/NiLKGaQP5y74K7M=;
        b=sGxRtuS5gX7gi8GkJiYLXMvxb8GFirccB53du6zcxQ59yOjUV1JMJfklO0rup3/OTY
         9nTPUGAeNV+rj0s/gSUje4voQcUL950qsqEfW63KgNvQoTrV4yGSkVEMim0zj2d9s8e1
         CaqR/tH4HsX7hfdq3hAQlAb3Triysts0p2fcLPb+9SqXnxA9W36K0IGjUE/uCF7VVCVl
         cCCnWIO1xa9KGN18dVNW5BklM+nVm3s67lrKd63XYghDFyC+sR/BSMqT8F+L5Rgmewuq
         hpJvEm5wARfaMKwMBsy7JXMcg7/y/7GObd94EQIf9RWdT6QOSpidD8+Q0kiA9UnAd5q8
         HtzQ==
X-Gm-Message-State: APjAAAXVbDRUlsBVXm+4m51u8HsAUSaAD/qzJTInY87JHEZRMsG/vRDS
        2lQIWD2hpSvtvdjrCm5x+jdDPxKVBU81+pqntuc=
X-Google-Smtp-Source: APXvYqxgPkeGEhMvn9ZbcyI16LPCI2kvOkjYdKy1HnL+POOp31IWUB73vhQQ2/EIqY6dFB3OZj01LXQAyL3DlOCcjr8=
X-Received: by 2002:a2e:4258:: with SMTP id p85mr7205914lja.172.1570132674483;
 Thu, 03 Oct 2019 12:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl> <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
 <20191003080539.2b13c03b@coco.lan> <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
 <20191003120238.75811da6@coco.lan> <20191003160336.GA5125@Limone>
 <20191003130909.01d29b77@coco.lan> <20191003162326.GA2727@Limone>
 <20191003144225.0137bf6c@coco.lan> <20191003183200.GA2631@Limone>
 <e468b867-1b45-8220-a5d2-ac40fdb4e0e6@jpvw.nl> <CANL0fFQms9oyec_1UevbJ7aLp+KNJ3h6UhGEbqrnCNO286rbGg@mail.gmail.com>
 <CANL0fFQCax1XHMaVj6Hvwe3JMzreH2w-dP-efr5VyGAc7Vd9aA@mail.gmail.com> <20191003165252.4145accf@coco.lan>
In-Reply-To: <20191003165252.4145accf@coco.lan>
From:   Gonsolo <gonsolo@gmail.com>
Date:   Thu, 3 Oct 2019 21:57:43 +0200
Message-ID: <CANL0fFQEyKQiG+CD7Szt1GZOvtVP5_1nCwsnhgu-Xg45DkcgFA@mail.gmail.com>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Huh? are you using the upstream Kernel? the above code is at line 215!
> Please always use the upstream code when sending patches.

Sorry, I was confused by my vi line:
"drivers/media/dvb-frontends/si2168.c" 808 lines --26%--
                                         212,1-8       25%"

Twelve hours behind this screen. I think I have to have a walk in the
forest right now. :)

-- 
g
