Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9840438C0
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732535AbfFMPIA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:08:00 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:38025 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732382AbfFMOA2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 10:00:28 -0400
Received: by mail-oi1-f177.google.com with SMTP id v186so14484103oie.5
        for <linux-media@vger.kernel.org>; Thu, 13 Jun 2019 07:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wgRUtxRpRSNnRZGrXPwrK6cdRhLgZbD0nA47qFB52is=;
        b=elIGZixOYqoTWGj/twRWzmNx8F0xooxD3eMma7ZsjRB1hByAN3DCDDlPqOB3KdtiDD
         gV3ywxsSuCwWjLH5suZakJHzRYoXBBORQk//eNintr9pmdQ0gYxIDpdQYudX2fKdNsNL
         5gnIcFzZ99WeWlTKKp0hFy6GvGXIoUk4eaE6Z8JiWQrpcLy0aRpC6iEe5DJaHF5U0zzW
         4G0MY05XnauEnT+cXPiGeWA6S5bvu0JmT3kUwBKuXDpEsPGn35da9VgT/n7+vqey8XOU
         DxXS23DKpkva5soa9C/fS7ShOAvbrFfiFVcQol62SgJOhRanvMvJ9EJjEiPBI8oACTjO
         quug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wgRUtxRpRSNnRZGrXPwrK6cdRhLgZbD0nA47qFB52is=;
        b=iBScWBof3Q+HJrLUWCJmZr5Z+SAAyShGOst5tmWobZ1LzDW5/xWh4ZjLSqv7nNalgH
         RdKAVCwxEW/O1eytMRz4wddu8LZHRVQtmOmx+8sVHY+Y4+zU8LDH0ATMmk6Hji7nRECl
         y5LRe8JgX30FASJQ5Q8BdHg0enbzpFgvhtPx5x7vP3zln03UAsdIZLFjd3YuetNhGG9W
         5MvF4IYUs0Yt0evqbuVktSRbWsDZryVsqMsnRN9s7753gdCwSW5RYCD3/OzHnuyObyu4
         3MLXiv1ptN0idve4HLgOHFM2sf+Ti+vjoEln9hE6fGTqjqqqxB/xRAuO8OZ4NzwYvCE0
         8NHg==
X-Gm-Message-State: APjAAAX3FknMO37Z2mWCDifF5IEViTsvyvwnd5NJNG56m02vvySvVCuv
        TFs1T1xgRoC6nvKR1u73f5QvrDFnk7hqs8/Q17Y=
X-Google-Smtp-Source: APXvYqzcbOVusMdfqv4lzJsN0f6l7CWhD3/Ve+RZGhF3OWoQNNb6GdwSAF/+4wI137Sj6B4JIBq2zBvrJlktMZbmuU4=
X-Received: by 2002:aca:e106:: with SMTP id y6mr3165095oig.77.1560434427435;
 Thu, 13 Jun 2019 07:00:27 -0700 (PDT)
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
 <CAGngYiWJ3u0NpP8Tji0oOJ4-9MFm1Ac1mzur_gL9+e8Jsj4EdA@mail.gmail.com>
 <VE1PR04MB66382A33B135E7A724D13C2F89170@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiWiQ1XRWSsgE5DbMZTiy9HkSvhvWNn3cPPw9p6HZZaBEw@mail.gmail.com>
 <VE1PR04MB6638ECD904CC0F9A6F95302F89130@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiWa8o4hEFTZauTtb0mWnzusVcYakvMn84eg_Q=CugKUKg@mail.gmail.com>
 <VE1PR04MB6638B3BA8B924C327D0368E089ED0@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiUwi=sH_VoRApM4x2RtVzuxXAfgMZnxtDvQ6PUA+b4fyA@mail.gmail.com> <1560444947.15004.19.camel@nxp.com>
In-Reply-To: <1560444947.15004.19.camel@nxp.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Thu, 13 Jun 2019 10:00:15 -0400
Message-ID: <CAGngYiXfzRvUCFAPB2WR9vQGmjxJbfrjA-DvaY37JDdUq2QD3A@mail.gmail.com>
Subject: Re: [v8] media: imx: add mem2mem device
To:     Robin Gong <yibin.gong@nxp.com>
Cc:     "festevam@gmail.com" <festevam@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 13, 2019 at 4:52 AM Robin Gong <yibin.gong@nxp.com> wrote:
>
> Thank Sven, please have a try with the below patch. I'll send it to
> review later.

That's awesome, we are cooking with gas :)

Actually I patched only the sdma_load_script() function (not _context())
and the crash no longer happens.

Cc me on the patch that you'll send out, so I can test it.
