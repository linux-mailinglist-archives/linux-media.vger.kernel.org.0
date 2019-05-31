Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 668FE305C4
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 02:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbfEaA0X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 20:26:23 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41464 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfEaA0X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 20:26:23 -0400
Received: by mail-ot1-f66.google.com with SMTP id 107so1673462otj.8
        for <linux-media@vger.kernel.org>; Thu, 30 May 2019 17:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZOUNJNPWWTP3x7rnTjLIY1Xh1YVMT+NLbFVJWX8eHzE=;
        b=IIZ4+WcBfnycH9A3msY9ufSEPkMlF4riaQp9KIF7DHgYNFoUFMwtV5OSgkWApgTdlJ
         xnSJbYvXcP7aGkBIqrqc42pRxq4LMKx9dMb37zOToZi9VjQEw1OMKOUamHyfZJd8TJX2
         cAlrccqNExEJ8+8W/9NYkoI0EvdVUVJTzYqF0c5bzSRRZV1GE1UZPs/TPXIEwuLadmEw
         AsEx5NUhRggW3gwq5bcyg9HvBLA3D+qwtBW2T2V9sWIgp4XW2tzE4TZrin1TfFXhXrAC
         p5Y1/7P60UUGOHBTAODoaHJtj0fNLwaSohpwbZ4pqJHwNynlySoAHiPeeLzZ+I6Y4Irq
         78mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZOUNJNPWWTP3x7rnTjLIY1Xh1YVMT+NLbFVJWX8eHzE=;
        b=f54Trz3Ka/CXjiY7IdoXaZPmmn1On0Zcr1bTCA04thwUPISYsmtHqFAUJISAh1LSrL
         H+FWMkme6Nx7tYy8zTS8W2SCcaNZCEobZpKnNQCZU9Gy/6ypPycoovr57i5H9mC/jwXs
         /AAqkUHt8mstItp5V8IlcnQETI+1tff89Su7PR6W/WlLQrb+mRE56R4KkmdR190uEl/i
         ukcA67yat9HyAP/NLYx7iG0NhSARInewExpWyUacwxZjN7XqQf5qGy++EkfLRUXIXlYs
         Yaj4xkoZNlK06MNybShktGDbBfYbwgZeOZPi0ATGa/uxQ5yXxUzREwjuzk0M1z/L4Xug
         oxAg==
X-Gm-Message-State: APjAAAV8A53GoNyQseSD+LIQFywch528SpG1Nw3OgFHM0T6CFrScVDJD
        M2FDL8uW2eYxwbSpME92YBgfq6zKNT5sovO0ur8=
X-Google-Smtp-Source: APXvYqy5w6uEee7uxx+xDlszpmXjOstZ7+ezRjk5XKXpnhMOKuLJEuCY9h/Vn88QBThJCG6C8vsxBnZNwxT0sMqjqkc=
X-Received: by 2002:a05:6830:209a:: with SMTP id y26mr4964813otq.232.1559262382320;
 Thu, 30 May 2019 17:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
 <20190529154431.11177-1-TheSven73@gmail.com> <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
 <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
 <4afffe3822026e23a55c05b7e18b43a2d6d0274e.camel@ndufresne.ca>
 <CAGngYiUZJCwg-VgOafU=gBgDtaSV++UVmNQawn6d5LunBFg1FQ@mail.gmail.com> <CAOMZO5AxL6MeOY=Pooq65B-Ly=t41JVp0Y_nXrYUKk03yh0KJQ@mail.gmail.com>
In-Reply-To: <CAOMZO5AxL6MeOY=Pooq65B-Ly=t41JVp0Y_nXrYUKk03yh0KJQ@mail.gmail.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Thu, 30 May 2019 20:26:10 -0400
Message-ID: <CAGngYiU9qGUxfp4UaiOM=qMB5sNLwukA3=ZUaO9o1u1KcVnV=g@mail.gmail.com>
Subject: Re: [v8] media: imx: add mem2mem device
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Robin Gong <yibin.gong@nxp.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 30, 2019 at 6:18 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Please start a new thread in linux-arm-kernel on this topic and also
> copy Robin and the folks from
> ./scripts/get_maintainer.pl -f drivers/dma/imx-sdma.c

Thank you, I will post a bug report once I locate the commit which
introduces the issue. 4 more bisects to go.
