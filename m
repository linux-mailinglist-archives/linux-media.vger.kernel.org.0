Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BED6434F68
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 19:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfFDR5h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 13:57:37 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38551 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbfFDR5h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 13:57:37 -0400
Received: by mail-ot1-f68.google.com with SMTP id d17so6221807oth.5
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2019 10:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qhMXDz9g6dTVucbRQt0OlnTKawIs8btTxKTIU4apLKM=;
        b=VQdFpnTT6rFdVrjSuRWSrHUX6Iunu3X++RWpbvHNbxNG4xPBA9hrdidNDld5SYpTKo
         p0IG4BtuZGg1cILHnHM2VYBBPObGSMox5dQPxDIIlnRexDVxIyy7PvTiDhtVljKeiE+5
         Qlf9uAc6shHkJ2bT9opvcXnUVt+0FOrudpKIo0Qeoq363eRSM+D8afiam38mmpxfOKrn
         qQfjwl05EF3Uy4+Tzt4LfnAOalCVdYi+1U5mUwpjlnjAoFVmCQ5Ca3fizi8VaDW2iE/+
         dBF3Kpws1AUnNcFkF8EkBkSUtKKg4sNY/d2xlfOdnhUGDZYtowy4KXbmbkaTOQx6cO/F
         LsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qhMXDz9g6dTVucbRQt0OlnTKawIs8btTxKTIU4apLKM=;
        b=dUL4snNo7yBPSljMW+ncXr0DnkRMrZlnX2iP04ejnl6bJjp/nnsJvpQbmbcj+4WXf1
         BBco2IZAXS3E2zAifWAi+63NaYlFZAJak2mUrhTII/46IIXMjpeQOf7O35L5+5eqMfbw
         KcKv+NVnk0IA70RPZq05ZV1R5LwUEQy+1VKkZSDNndnHAvTN1CV05kOo3IKU18MpxQyY
         dRJTIa5Dp6a6kQiAx3esY111xgaV8gjopCwsWlONiBsDcLPaO2ivK/va5/6+CJxjNeQw
         ZF89CYsgG2nkxGQOZa0C7ypOaHTYoJxZsqk54dk0Cz8nV6ufzg1oziII8VzG77zQHJfa
         vhmA==
X-Gm-Message-State: APjAAAUKz0X0u1BtxWr9P+iX3DxE1eojXApqVBgEimbZ0xKdeQmAMCmm
        AOFfJiOGJBYTeb/DHR37nhKd03zOLKvcyk+DGH0=
X-Google-Smtp-Source: APXvYqwdpYA6RtUKz9Mu21cGyOgI5ZxYKUg3FShcR/LnlyI+XT2v3AbNSy/XbkX1/b0jPnRVEI0ixyJ0s+e33O7Uad8=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr6264074oto.224.1559671055920;
 Tue, 04 Jun 2019 10:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
 <20190529154431.11177-1-TheSven73@gmail.com> <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
 <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
 <4afffe3822026e23a55c05b7e18b43a2d6d0274e.camel@ndufresne.ca>
 <CAGngYiUZJCwg-VgOafU=gBgDtaSV++UVmNQawn6d5LunBFg1FQ@mail.gmail.com>
 <CAOMZO5AxL6MeOY=Pooq65B-Ly=t41JVp0Y_nXrYUKk03yh0KJQ@mail.gmail.com>
 <VE1PR04MB6638C5E75F797BD3114C467A89190@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiX3xOHYw97VU-buuLLwu7vuMk23HEatDpk6vgieE7ozXg@mail.gmail.com> <VE1PR04MB663874C6BDAE5ED7B5A36A3F89150@VE1PR04MB6638.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB663874C6BDAE5ED7B5A36A3F89150@VE1PR04MB6638.eurprd04.prod.outlook.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Tue, 4 Jun 2019 13:57:24 -0400
Message-ID: <CAGngYiW9vqHXVt771P7tQvHwJ1ifr2qbtmxnVm7Ff6vY=DjKwg@mail.gmail.com>
Subject: Re: [v8] media: imx: add mem2mem device
To:     Robin Gong <yibin.gong@nxp.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robin,

On Tue, Jun 4, 2019 at 4:51 AM Robin Gong <yibin.gong@nxp.com> wrote:
>
> Hi Sven,
>         I saw similar kernel crash issue on the latest linux-next during kernel boot up, but not on
> the 'Linux 5.2-rc1 ' tag. Will do bisect later. But v5.0 should be okay, could you help double check?

Of course. My tests show:

v5.0 bad
v5.2-rc1 bad
v5.2-rc2 bad
v5.2-rc3 bad
v4.20 good

where "bad" means: kernel crashes on boot if sdma firmware is loaded.
kernel works ok if we use sdma firmware already in rom.

Are you able to reproduce this issue? I started bisecting last week, but
ran out of time. I could try again here, if you cannot reliably reproduce it.
