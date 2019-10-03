Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82F4CCA10C
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 17:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730005AbfJCPRS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 11:17:18 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45496 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727587AbfJCPRR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 11:17:17 -0400
Received: by mail-lj1-f196.google.com with SMTP id q64so3169123ljb.12;
        Thu, 03 Oct 2019 08:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PE7I0E9EcRU/h/+xMcaQ6+qShxG2nGLvXmVoLAt8iYc=;
        b=a3Yg1FgsHOrX7Hoop2klgS+z8dzIyCTEeBVYTtj+TzUs9HeNRHyJzTLJ2UZvIUT42x
         aPP5TK9w6H64iL75A8VVWfaYB1o83EDwydW+jyEBwFUz7YflsNjL2xg4PSZisCShqclR
         +CFo3VtugAAZaO5gFS5MZOlMmlQo5vtkjJhMhC67LyyvgEKVC7cbaP0NGHqAl1w1faTQ
         EQn8G76mYVkMupddMzDV2ZpW06mBbSQFS96dE8QrjgguqZ8BmWPCHd5/M+kkG1hZwd67
         i54P/APwOtKySklOFT9VuhvkGv6CwZqrEHbCSq1bXiU5/CnTnafQt+Us0oMiWTDwCgK+
         3LdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PE7I0E9EcRU/h/+xMcaQ6+qShxG2nGLvXmVoLAt8iYc=;
        b=XZYk6qhbJG2UtW4Ye6bkoqQpEqAseKgEieLPPlZ+QqKp4eyVIlGMdoV7X8dsvTquaf
         i1ctINbHwys80BkCjG/Wgmh/11PwjA/UYf4DmkHPYRxc5im4StnSwey928owfWKTd6lP
         Y3KGVDQX0D3VbeJ5zGlvasvi1Nlld01ykPQTl7qGgcdqFSKdPB3AJ9sVjWA/xMzYjT2e
         TaMcsa3n9Uv8A0DyZTicC6fr8t5SqFVpEfK46VHG6t/ZdPtky6dipXj40wSFZ+2nixqh
         V/9QThoHLQJZJsbEu5Aq/qdJWB3DoLcEpZ+uGtYOkiARQKHlWIAhOzk6b7rY5mxGRLtp
         v+xA==
X-Gm-Message-State: APjAAAWbTww41E9pa9yzEbgtK8WxshM9cfNqHSxrjaW26dB7Btfmo7KD
        Ja+VCi7n8x/jntNeChCw7o4x5pXyOAZFwI+B0pE=
X-Google-Smtp-Source: APXvYqwt3dN1HwuKAhLaZU6cZz6sAe1lmkgxh+V5dz6w1lZM/UCEtCxrKUfakXCdxWpnr/AyPINJjHJUT8/RxJ+0rU0=
X-Received: by 2002:a2e:95d0:: with SMTP id y16mr3978156ljh.255.1570115835580;
 Thu, 03 Oct 2019 08:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191001205203.4b1a5fb6@coco.lan> <20191002141359.30166-1-gonsolo@gmail.com>
 <20191002141359.30166-2-gonsolo@gmail.com> <20191002142744.GA3475@gofer.mess.org>
 <CANL0fFS9TGKJH2rfkXzak78BaLazTNO7GoZhSb4vLBsDrmz3FQ@mail.gmail.com>
 <20191002150650.GA4227@gofer.mess.org> <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
 <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl> <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
 <20191003080539.2b13c03b@coco.lan> <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
 <20191003120238.75811da6@coco.lan>
In-Reply-To: <20191003120238.75811da6@coco.lan>
From:   Gonsolo <gonsolo@gmail.com>
Date:   Thu, 3 Oct 2019 17:17:03 +0200
Message-ID: <CANL0fFRK+ptWQnpC50VNmWzHEdcjB4p+JMP1ems7GDGBFh3OKA@mail.gmail.com>
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

> With the original patch you proposed, what are the logs?

Which one do you mean? That one:

+       case SI_BOGUS:
+               dev_info(&client->dev, "Bogus chip version, trying
with no firmware\n");
+               fw_name = NULL;
+               break;

With this patch VLC is running but the chip revision number and
firmware version are still bogus.

Which means if you receive 0xffffffff you can force no firmware and it runs.

-- 
g
