Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0414C54D63
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 13:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbfFYLTg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 07:19:36 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:40726 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727227AbfFYLTg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 07:19:36 -0400
Received: by mail-qk1-f195.google.com with SMTP id c70so12214014qkg.7;
        Tue, 25 Jun 2019 04:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=64y1Jl3E54NVU84ingXkOpLnS+rsOVnSacEQOqg2J1w=;
        b=sITr3gWmFmV/1WWOaIp5y6sCKtr6km7K3vakrQjKPJFKaY+00RSHnuzDLR1W7ObI5q
         6Mpj6tXMx7IhlRb/z9Xb+1SDn6hqADI4/kjz1QZfjhaGzWVDKg4EJUmigicGjj2ESv3v
         l5NbRnGBn/PYwG54oIiNCmjyru2OWPziqmu/uR+baryJdYjTN7qIfWbF3fIzLt4x3qSw
         p0zqOto99gFBUaDyGX0W9YIRU8PSGukgtHLZIYbS+PKK2cvNfYe2H7mq8lHIzT0dA10R
         1GHlRK0pP1Ysgs36yaXwHLUhab3p9w0aJ1aPqBLwhPKS3PZDjb7ZoDKDVPI8Ama20Fcs
         B8jQ==
X-Gm-Message-State: APjAAAVpi17ogyBrLXCu4S94X+AQAQ6oAhzQtZqChczdsTrYKU0tkzHy
        XqpzuWMFhnaxpwEghpmcoQKusE4+H5qqPbsLmyI=
X-Google-Smtp-Source: APXvYqw9dxyYhvOf0CehdbEXdFH0r5aphU3aqYN2yfOZgOz4pRBFGnfseg6WNMqky6w5nCWex/YYZ8R2T/XY4+uneMs=
X-Received: by 2002:a37:ad12:: with SMTP id f18mr84085002qkm.3.1561461574892;
 Tue, 25 Jun 2019 04:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190617111718.2277220-1-arnd@arndb.de> <20190617111718.2277220-3-arnd@arndb.de>
 <20190625105650.scnahq2e5xgdnt2c@gofer.mess.org>
In-Reply-To: <20190625105650.scnahq2e5xgdnt2c@gofer.mess.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 25 Jun 2019 13:19:18 +0200
Message-ID: <CAK8P3a2=wFMxLjNdTtHT9rDq8+xhwPmDJgbMCBqMjoSa9otk_A@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: ttpci: add RC_CORE dependency
To:     Sean Young <sean@mess.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 25, 2019 at 12:56 PM Sean Young <sean@mess.org> wrote:
>
> On Mon, Jun 17, 2019 at 01:16:53PM +0200, Arnd Bergmann wrote:
> > The ttpci driver now uses the rc-core, so we need to ensure it
> > is enabled:
> >
> > ERROR: "rc_unregister_device" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
> > ERROR: "rc_allocate_device" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
> > ERROR: "rc_free_device" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
> > ERROR: "rc_keydown" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
> > ERROR: "rc_register_device" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
> >
> > Fixes: 71f49a8bf5c5 ("media: ttpci: use rc-core for the IR receiver")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Thank you for the patch, unfortunately this was already fixed in
> commit 12e23ebb396e6ffea88b8c5e483059a297326afb (which was accepted
> after you sent your patch).

That seems like a better fix, thanks for addressing the issue!

      Arnd
