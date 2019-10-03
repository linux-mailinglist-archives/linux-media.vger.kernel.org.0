Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D45ECAF8F
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 21:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732832AbfJCTvt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 15:51:49 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46088 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbfJCTvt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 15:51:49 -0400
Received: by mail-lj1-f193.google.com with SMTP id d1so4071702ljl.13;
        Thu, 03 Oct 2019 12:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9pgSkfRdp0+C6gQGEaXGS6gP5j2Rq8fOoVTyq+Yt++k=;
        b=t/XDWKfUS+mez5ZWHjWM3/9sAabp0xSKYo/p+tDfckbCxuxK7DXRe0LVGjtjGatLH0
         NQcqJshl91AUKWnRxrSX/4BR8ckJw4oshWzgx0B6UMzxLmC4MrrVRZdfFVI4Nevu5qeY
         H1IauHE7iqruHnrGiWA4+0dKmX7cliKfRf/Hc7MiLmqjcXI/TupO+oaWjL5sqho0h4wJ
         b+HrNZQkTy8ecSXaJSjkWaFO2xnVt1xwMxlwl48KIqjyhfDxC8pZ5yZodKD/t9AjU1m4
         fZo4XVie7sCQo3vtJjjGwa0KDR/nVhnEbtvznh/WmCUgw15X27vjxjt9H817a2JPWx9x
         GG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9pgSkfRdp0+C6gQGEaXGS6gP5j2Rq8fOoVTyq+Yt++k=;
        b=m0Puz3hg6VaTuCjirvFFy07wnsuIK94iLGFYWvLgYXyQwt8KoHvaNzzChsIGYm2KAw
         HuRmfsNLfGAhXWFF1ATzt5c59UNWP+SssmlwsNk5r9Vw/TjWXR74iftk56PLOOaV3j8j
         4CHF/ozPaFUfSI+Tqrmync0KVAMrT9L+qvs4sK7ofrUM5gIU4BCm+4PNypwM1DkAOiAU
         E2g/pZOokn4Df/rnX35RjY+rB8Ig/uB0U+BAmnpacg8sdrZNllyci84dTkpmk3K2UxHR
         QLLf1/t50yIO3+bT9GE67WR8O8Pa5D/um78uqsPN6YKttFDjrqjm7fl/Ol6ClcxPM0VS
         b48w==
X-Gm-Message-State: APjAAAWJStrvrUCnkRianPt/oqEIM4HcL3UY+kOKmLq2bJ9WynSzotVT
        HOnV5mA7SacfZFrZBVjG20VVTF5o7uAaYtXK4VY=
X-Google-Smtp-Source: APXvYqzwrZZA4tXUUKBsAx7C7thA3+8YeHSUaBIu35E5BGCGg0rjZfmCZsiDKt9c8WQzgrPZVODXPSpQles/57KM8q0=
X-Received: by 2002:a2e:7d0d:: with SMTP id y13mr7214977ljc.170.1570132306661;
 Thu, 03 Oct 2019 12:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl> <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
 <20191003080539.2b13c03b@coco.lan> <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
 <20191003120238.75811da6@coco.lan> <20191003160336.GA5125@Limone>
 <20191003130909.01d29b77@coco.lan> <20191003162326.GA2727@Limone>
 <20191003144225.0137bf6c@coco.lan> <20191003183200.GA2631@Limone>
 <e468b867-1b45-8220-a5d2-ac40fdb4e0e6@jpvw.nl> <CANL0fFQms9oyec_1UevbJ7aLp+KNJ3h6UhGEbqrnCNO286rbGg@mail.gmail.com>
 <20191003163914.7c384d36@coco.lan> <20191003164426.6da8538f@coco.lan>
In-Reply-To: <20191003164426.6da8538f@coco.lan>
From:   Gonsolo <gonsolo@gmail.com>
Date:   Thu, 3 Oct 2019 21:51:35 +0200
Message-ID: <CANL0fFRSNbUhcik7rnhjZ0qUe-tZyzcjY+M1J_iGzUa5jNc9_A@mail.gmail.com>
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

> 1) The firmware file is likely at the Windows driver for this device
> (probably using a different format). It should be possible to get
> it from there.

If you tell me how I'm willing to do this. :)

> 2) Another possibility would be to add a way to tell the si2168 driver
> to not try to load a firmware, using the original one. That would
> require adding a field at si2168_config to allow signalizing to it
> that it should not try to load a firmware file, and add a quirk at
> the af9035 that would set such flag for Logilink VG0022A.

I don't get this. Which firmware, si2168 or si2157?

I'm still for option 3: If there is a bogus chip revision number it's
likely the VG0022A and we can safely set fw to NULL, in which case
everything works.
All already working devices will continue to work as before.
With a low probability there are other devices that will return 0xffff
but a) they didn't work until now and b) they receive a clear message
that they return bogus numbers and this works just for the VG0022A, in
which case this hardware can be tested.
At last, *my* VG0022A will work without a custom kernel which I'm a
big fan of. :))

Are there any counterarguments except that it is not the cleanest
solution in the universe? ;)

-- 
g
