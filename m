Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D09FACADA1
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 19:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732109AbfJCRtl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 13:49:41 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:35719 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729648AbfJCRtk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 13:49:40 -0400
Received: by mail-qk1-f196.google.com with SMTP id w2so3251024qkf.2;
        Thu, 03 Oct 2019 10:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TVggYDhALwVGtWY+/imz5nwmODBWiXEBIc32MPx5JWw=;
        b=ouvjwduU/4eBL2XjQouGsDZ17RyPqH06/8D2WRGQWH3420dGQfpWbOsJaE62g5NEn7
         o3KgrWUN54ADvQo0diN/YDSJ2RWybnXLl7zkwbpqLUIxoxTqGfXnkmamunU0uOFOHKxA
         73imSDN3acIiTEcC8bvLPwmP3mLkZzb23uctW0XHigaEVqb4NZRRbFMKLfQRhGyOcQXS
         vPvtlkLFFwl4getJ2xCneSH19sU4gDn+4xSPT0uw1CiIQf+HURy60RWzmtPMUXKZ5rBX
         uKTuLtNE51iQ4BGFlU8BF3RsLaw4/SGe/u/0Umh+Fxhk/0q6KB/A/ccG72DLv5e/Win2
         l2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TVggYDhALwVGtWY+/imz5nwmODBWiXEBIc32MPx5JWw=;
        b=bolzwaerNe5hoIFxoS7z00XkxsW1t2btyWcO4sBNi4ejNWcGchUhZf5o23SIb+lbxM
         53GnfrSBKs0x1QVx6ACoGnr+EhAbtB7zoJvMbgEW6sYrPnM9r6J7DtgxigijoXGjof+R
         vPVkF/WKYr/mbzWsF8sU+i10kOkItvqkvuRje1Onn12Wq5Q1rbKPhtJpzHQSp1BHDAB7
         rRTGOFetz30DHAxaXkIpDcgONgdKC53iO4FAoJm/TDrM55NRpclTx7G0qKUPHxnC8tJt
         jRD41l8vRNJuQY8CQDKNy6r2hBXLFf+y8jnYT9rqLP0h1MBJSI5krDE1M2BQ8M4OO+q6
         xh0A==
X-Gm-Message-State: APjAAAXDCCmLaPG2UperL1Tt/wIi1FbjKaP3lwAvWWcUA5cG8L5rI3xh
        DnafhfDiSuYrLbYPAWOADsDJU4BHyU6MxDwN9p4=
X-Google-Smtp-Source: APXvYqzG5LnN7W8Lp3zGEOUfxneKRHGxX+W0+HMbfcIPC4QGZKpo0jkCAcbYIY8vsIdcJGw9ZcVBsIGuYEBpY7Rdtwc=
X-Received: by 2002:a37:488d:: with SMTP id v135mr5286029qka.284.1570124977886;
 Thu, 03 Oct 2019 10:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191002150650.GA4227@gofer.mess.org> <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
 <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl> <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
 <20191003080539.2b13c03b@coco.lan> <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
 <20191003120238.75811da6@coco.lan> <20191003160336.GA5125@Limone>
 <20191003130909.01d29b77@coco.lan> <20191003162326.GA2727@Limone> <20191003144225.0137bf6c@coco.lan>
In-Reply-To: <20191003144225.0137bf6c@coco.lan>
From:   Gonsolo <gonsolo@gmail.com>
Date:   Thu, 3 Oct 2019 19:49:26 +0200
Message-ID: <CANL0fFTSxV8catdjwVLNBRtp2MrNUsSimz1WMdNPYAb_VVns9g@mail.gmail.com>
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

> Weird... it sounds that, after si2168 has its firmware updated, it
> starts interfering at si2157. Perhaps there's a bug at si2168 I2C
> gate mux logic. Are you using a new Kernel like 5.2?

Everything is based on git://linuxtv.org/media_tree.git which is at
5.4-rc1 right now.

> I guess the best is to enable the debug logs in order to see what's
> happening on both cases.
>
> You can enable all debug messages (after loading the modules) with:
>
>         # for i in $(cat /sys/kernel/debug/dynamic_debug/control |grep -E '(si21|af9035)' |cut -d' ' -f 1); do echo "file $i +p" >>/sys/kernel/debug/dynamic_debug/control; done

I'll give that a try.

> You could also try to disable the firmware upload at si2168 and see
> if the si2157 reads will succeed.

That too. Thanks for the advice.


-- 
g
