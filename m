Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 353DFCAF6C
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 21:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387631AbfJCTkn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 15:40:43 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39258 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729264AbfJCTkm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 15:40:42 -0400
Received: by mail-lj1-f194.google.com with SMTP id y3so4068476ljj.6;
        Thu, 03 Oct 2019 12:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pSL4QLkrsIA0GWMBtimnD0jqvoSHa6naCjCGLwOOIBE=;
        b=hS7K1kByEdZ1Al4+4rw4E3jAvr/pnLNoku7kN1SRVM1RM+lOdRNhu5eu5CToOMxt00
         fGIBHJZVWgRe9ms716THfTdypLrLczOQti++xhontjhDZkF0nQBqxfC1Ok7kIXp7Wt54
         6GT9f2NDpa04oVNzIc6SBxrT9v8cMLi7dKQI9zwe27mcc2O24dLGIczZ1FppMkrImoVy
         cUb4/U3oR+nBQrk+SdAIFZD8x58cZ/Cb9GJ8cnkhETzdJfPl6d3Li0jWzuh6lwCU3XdQ
         bqDdTTTDw1lu5FVjm0a1rbfWKgfwYQw9LgTjgMmwW8M3R4wGJEBLHWFihSqXyuL/4fEr
         ZIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pSL4QLkrsIA0GWMBtimnD0jqvoSHa6naCjCGLwOOIBE=;
        b=uMTL3gYsFOyfxXl5sIR0KHdJ2a3HgOkaM0AApMX4w+oGL/A8aem7wWpen7GNdkAbpF
         knX6CZwApY7lfjoMiHWBPVhS4BcSNTMofZIBzMRFwPSaqh/meCEqmQaTO/p0jtVhkvwt
         MMXA71clQHyA9zauvPL/gdBaRRdAiQVoHccyG2Qym4pp4FcYei4qRWSbatKXdEvtLHz4
         H+nDJ8DMUSytwiFC/oS/qnqgx2/5P8cmTPjS3MC3L5wJgApTbhVnteBldln5+zxYmRih
         RoFJoIqFSxcv8qHCZn8J2QQSgyh8n7TsejbHCPQS2AfFo8fBB59YsfiT6t1Cl5xk/tib
         KYeA==
X-Gm-Message-State: APjAAAUsQqYcmRI+ZAhH+5HjwpmQbTUtvu2lY2oL3Zoj+bJOIIAoBN6b
        XGpQZr1kIvo2uw5VXqI4sN12Fq2WFDU27+XscQI=
X-Google-Smtp-Source: APXvYqy5h5JwyW6moKpyZAad5fkQZ8tBNXSZxYVrgBzBaroaenrdAruQ0irXcreNxmc398SHyuMwLn1J0D6vHVBHHPg=
X-Received: by 2002:a2e:4258:: with SMTP id p85mr7168646lja.172.1570131640635;
 Thu, 03 Oct 2019 12:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl> <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
 <20191003080539.2b13c03b@coco.lan> <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
 <20191003120238.75811da6@coco.lan> <20191003160336.GA5125@Limone>
 <20191003130909.01d29b77@coco.lan> <20191003162326.GA2727@Limone>
 <20191003144225.0137bf6c@coco.lan> <20191003183200.GA2631@Limone>
 <e468b867-1b45-8220-a5d2-ac40fdb4e0e6@jpvw.nl> <CANL0fFQms9oyec_1UevbJ7aLp+KNJ3h6UhGEbqrnCNO286rbGg@mail.gmail.com>
In-Reply-To: <CANL0fFQms9oyec_1UevbJ7aLp+KNJ3h6UhGEbqrnCNO286rbGg@mail.gmail.com>
From:   Gonsolo <gonsolo@gmail.com>
Date:   Thu, 3 Oct 2019 21:40:28 +0200
Message-ID: <CANL0fFQCax1XHMaVj6Hvwe3JMzreH2w-dP-efr5VyGAc7Vd9aA@mail.gmail.com>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
To:     JP <jp@jpvw.nl>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, crope@iki.fi,
        Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From si2168.c:808:
               /* Sometimes firmware returns bogus value */
                if (utmp1 == 0xffff)
                        utmp1 = 0;

Maybe we can include my "bogus" hack to get at least Logilink running.
Maybe with an info message to tell users what is going on.

g
