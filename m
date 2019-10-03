Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C49CC9CC3
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 12:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729671AbfJCK6D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 06:58:03 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39478 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729304AbfJCK6D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 06:58:03 -0400
Received: by mail-lf1-f67.google.com with SMTP id 72so1467042lfh.6;
        Thu, 03 Oct 2019 03:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7oPdUNcmvU+NPNMTAZ//wtLR3acLcZSMhzABQJWIh5A=;
        b=i4PLQMVbi4z4VMAkyfWSmxiCzNQX8spgJqdQeZ2tzQlfgXLsDDtGyB7Pb/0EopLytP
         2FC6n/d7TzHdYDirMtkC3ea6ydm8grkWhWAJ7cuiWp/pqrifk594ipOUO+1zwueFfo/Z
         VqSR6vNHI561HvhPNrvlB9WdBTlsWtoTpUQJaqNeOIsBdw1L/kvi39m+qY5gmqJDuBH2
         PDlW2f0DVpX5ZxJ9q/GABgTGMCznH0mGnJ2vawX2Pf6Bcv8j9OzKZj/42bBAIzCVYEDk
         7eILKT3v1DC7Lo2wLOQ2IrCulU69HE7WDJno1O1ggh+trm5MhY6RdLtL01qhfOsuEhvC
         dM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7oPdUNcmvU+NPNMTAZ//wtLR3acLcZSMhzABQJWIh5A=;
        b=FY6Oq/ckkpgKuedk5jTzfqsfPSxe8DYUpEFTcrmM3U2Q5tnUFyilw/g+cMHlNu8vc+
         eG2eOY+XY9r97yLaXeUUvnrrKBk64PBFXrcsD2Cm/CcLElLVj9jftkToPus5PLn7HxAB
         lyWbN1nOPHFLa1LxjxV/t4nUhvFlWGuPaOEl11/JzIcVQAsZyUvmE4JhOUyUXLTn+p8k
         0TAEjnXnc5mvVe0KGXXRPzhHwzRrE8DpRXOaEHzNLk1L83mOS/hY9R0KJSmSDWC1ERxn
         yBUa9y84xXyjRsPPC0LfB+1RASjPOaUwqDYt9dLUIrXuFJ9NKpOyA/u6yUFWCvwY4bBZ
         3dZw==
X-Gm-Message-State: APjAAAUQ2XYhE37rahpsZWOiIPrfct79ZWeBwnAs9+etKSplEoYIk39/
        qNrIN5I0CDr/9dO0dQBtDPcUlxPz/MO79RIOD9Y=
X-Google-Smtp-Source: APXvYqxXNqqc2LSe0qjYORQ0K9+P72RLAub21kXk5U0yA6A6jEx3eISUZmOdiMakxVfEBFz997IJ7+3Dl/NWD+cZNWo=
X-Received: by 2002:ac2:50cb:: with SMTP id h11mr5397870lfm.170.1570100281472;
 Thu, 03 Oct 2019 03:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191001205203.4b1a5fb6@coco.lan> <20191002141359.30166-1-gonsolo@gmail.com>
 <20191002141359.30166-2-gonsolo@gmail.com> <20191002142744.GA3475@gofer.mess.org>
 <CANL0fFS9TGKJH2rfkXzak78BaLazTNO7GoZhSb4vLBsDrmz3FQ@mail.gmail.com>
 <20191002150650.GA4227@gofer.mess.org> <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
 <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl> <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
In-Reply-To: <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
From:   Gonsolo <gonsolo@gmail.com>
Date:   Thu, 3 Oct 2019 12:57:50 +0200
Message-ID: <CANL0fFTwJ4yRO+5q6WkL0+DtwdrRti6r_WY1intisYJhs5En8w@mail.gmail.com>
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

Hi!

Boot time:

> [    5.380991] si2168 1-0067: firmware version: B 4.0.2

When starting VLC:

> [  457.677363] si2168 1-0067: downloading firmware from file
> 'dvb-demod-si2168-b40-01.fw'
> [  458.631034] si2168 1-0067: firmware version: B 4.0.11
> [  458.650309] si2157 2-0063: unknown chip version Si21255-\xff\xff\xff

There are two different firmware versions, 4.0.2 and 4.0.11. Is that expected?

-- 
g
