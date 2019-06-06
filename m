Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBF973754F
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 15:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbfFFNfC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 09:35:02 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:38677 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbfFFNfC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 09:35:02 -0400
Received: by mail-ot1-f46.google.com with SMTP id d17so1950844oth.5
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2019 06:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iZt44MBoJHnXLDEo+Z9lOe/YuGndNsoumomZ3cXlW1Q=;
        b=fNtdilMg1NiGmH7GggH4e4Wba8lwO8xduEc8HxA2qDWalAtcZ2uVDAQFcdQdeEvBdh
         ds295WbsmoOsjKMktMjl++oa/GZ+ysZcdHgZNlXIMdy2Tvnme6LE1j0jHK2bGT4+2Kh1
         XZ0cn2RdWbuwW0Y38OhGmu3XTFiCQqmhy0JoNP7yRGkKJdWYb2nE3WFQaZgrlNAKl+FT
         WuR/cPU0bMJKuXBuWwvC55q5cJiYRTksqVNruUjWzDLh7oGZUkZDy1NvAzUD4yWBdcQU
         O1/nOGA0dqc2uz0mbgWoo4Aq7QILgIrPiIdIMMDk93QJQ4v6ohXiQaKPPPjrkwF8VT3W
         MiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iZt44MBoJHnXLDEo+Z9lOe/YuGndNsoumomZ3cXlW1Q=;
        b=j4cHyEVugkgNue/EdC+3zrHAOmoo8meD7H3bCpfD2hEApzf52BV8/nXEoonKABmbqy
         iixvX4gjOOemoSH2D4aIYGxrlEpQSYRr81+n7neJd8YAf2fJZFcQIBp3vgV37Thk+tEL
         Qz0R8P5BbUMI1fezuT/6Fs/wYo91gZAOffAymAXXmCsB1MvbOdeEhn7+dNVsvBkXoIGj
         A3lFSqmPGINXjzWm+g33LVwFmI9vIUZHBAHCK9dGpbtPoRefLd7A2mC3KcEqW2RyDrBE
         oHN5lmY8bl/4G07Z4yOidAtBgYzlUxtImC5xhsvAgn3FeUnr+BhhEP2IUe6i+Kay9sWZ
         vlwA==
X-Gm-Message-State: APjAAAU4XU7WPTXHW1LiPXNb9LGFsvvCiyArvDkv6tT/NbPAhFFkcAhP
        sK0/7CbqplsScBE4WyI0KDdxlqS7JCv5yrUW6wg=
X-Google-Smtp-Source: APXvYqxCz2Rj3qPtmzZzxJ93qizYZ3ytEUPXpZDs7MmlYULrHB47DO3CFIovV2u6fmTBpiSHloxIZeV+4a4XLPnNmOM=
X-Received: by 2002:a9d:3bb4:: with SMTP id k49mr14459401otc.332.1559828101815;
 Thu, 06 Jun 2019 06:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
 <20190529154431.11177-1-TheSven73@gmail.com> <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
 <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
 <4afffe3822026e23a55c05b7e18b43a2d6d0274e.camel@ndufresne.ca>
 <CAGngYiUZJCwg-VgOafU=gBgDtaSV++UVmNQawn6d5LunBFg1FQ@mail.gmail.com>
 <CAOMZO5AxL6MeOY=Pooq65B-Ly=t41JVp0Y_nXrYUKk03yh0KJQ@mail.gmail.com>
 <VE1PR04MB6638C5E75F797BD3114C467A89190@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiX3xOHYw97VU-buuLLwu7vuMk23HEatDpk6vgieE7ozXg@mail.gmail.com>
 <VE1PR04MB663874C6BDAE5ED7B5A36A3F89150@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiW9vqHXVt771P7tQvHwJ1ifr2qbtmxnVm7Ff6vY=DjKwg@mail.gmail.com>
 <VE1PR04MB663800AFCE7FF016DBE9EB7689160@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiWJ3u0NpP8Tji0oOJ4-9MFm1Ac1mzur_gL9+e8Jsj4EdA@mail.gmail.com> <VE1PR04MB66382A33B135E7A724D13C2F89170@VE1PR04MB6638.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB66382A33B135E7A724D13C2F89170@VE1PR04MB6638.eurprd04.prod.outlook.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Thu, 6 Jun 2019 09:34:50 -0400
Message-ID: <CAGngYiWiQ1XRWSsgE5DbMZTiy9HkSvhvWNn3cPPw9p6HZZaBEw@mail.gmail.com>
Subject: Re: [v8] media: imx: add mem2mem device
To:     Robin Gong <yibin.gong@nxp.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 5, 2019 at 10:32 PM Robin Gong <yibin.gong@nxp.com> wrote:
>
> So that's another issue that I can't reproduce. How do you switch between sdma ROM/RAM firmware load? Just keep or remove
> sdma-imx6q.bin in your ramfs(seems you used)?

I add the sdma firmware to the kernel image, by adding the following to the
defconfig:

+CONFIG_EXTRA_FIRMWARE="imx/sdma/sdma-imx6q.bin"
+CONFIG_EXTRA_FIRMWARE_DIR="firmware/"

If you are unable to reproduce this, I will have to do the bisect myself
to find the bad commit. Please bear with me, this is very time consuming.
