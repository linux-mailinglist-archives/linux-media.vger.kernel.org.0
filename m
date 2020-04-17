Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C55F1ADA52
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 11:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgDQJpk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 05:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgDQJpj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 05:45:39 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648AAC061A0C;
        Fri, 17 Apr 2020 02:45:39 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so1357891ljn.7;
        Fri, 17 Apr 2020 02:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LbDCyzZ+wvIY394IIvuzzVGrKtnyT3vqI08Zb16TqU8=;
        b=P2rW5IBMX7R2KqCLSsRLAu+Yu01gD4Fs6k1iCsa4rRmbDN6bf1y4Uk75MUR94B9j6B
         ccnBkoD78+NYMJMFZNc/3b0JOnHESX23grmjrVjWHZrSaAqKPw3D3JeSSs6AuZfxCOTV
         L/CLUBtSi9NNI0y10viaa8jCe9Meu0lhCFJg9rGtXjAeI8HWUoliJdajP94g7QYX6/bx
         PsIWWxeR03D5FriiQknOdrmx5w+0DCcz4K1kteQcpP3bVDfUWxJT99LUPafxFxiF3GeS
         ZkSXY9JrxarJ8P6jHrTUuhP9RDM5zNxkaR1mEKacAPvZn+Vj9TlBgUoGptIBZGnXzjlQ
         rLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LbDCyzZ+wvIY394IIvuzzVGrKtnyT3vqI08Zb16TqU8=;
        b=nWbg4kzlYjWE/cQGWeO5uMUNMCtsSLCZ4MsTsg7sirFObZ+k5tnNH+zb8Z1hQVWERw
         PBJ/TpPOQM7lyaEzZqEEMsrE6i40nOYtiBz6thmjr7ntVEVTlfuyYkgWK9tjpaAolh08
         Fl4DPDa4BkfPvVmSi2UiffAwSRzWKv0jlsBUL1WFBde7GUa3ETLJQ8NQsAORWVbRKp8C
         WeiDl8qQlPhFNLXjAZGTXT84rpto93PFKqypYyg43aPXlKczc2L+d4i7eBhQWMGpovGj
         kFmQocgu5jyVrQxVsj3A7gaQg8zRgyenTvGn1GaUWBUC/tlWFLR+bCzoSJNDJ9MkaySP
         Qzqw==
X-Gm-Message-State: AGi0PuYHqAp/cG7Y5nSdO7+oXT1doBjOMkyoaJi8+JLINKAt6ZQGEpEB
        AgLSyfptFp82c3Myf2VJsla91FtWNHjMhcX6Bmg=
X-Google-Smtp-Source: APiQypI0mj1jwcNFt3E9A0uUmQJYUkIGlF6XDEMLDymiymNJ8v/pYeR0P4Mhe285ant6cVIhc9WajxyUh43RoaIjoMY=
X-Received: by 2002:a2e:9496:: with SMTP id c22mr773456ljh.165.1587116737574;
 Fri, 17 Apr 2020 02:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200325090122.9308-1-butterflyhuangxx@gmail.com> <4149a5b4-c3f3-2902-84e2-eedc9ecc54f8@xs4all.nl>
In-Reply-To: <4149a5b4-c3f3-2902-84e2-eedc9ecc54f8@xs4all.nl>
From:   butt3rflyh4ck <butterflyhuangxx@gmail.com>
Date:   Fri, 17 Apr 2020 17:45:26 +0800
Message-ID: <CAFcO6XN-adr9SYt2KX2UyNChV+XSprnWmOWkGuPMcaS6FT+gGg@mail.gmail.com>
Subject: Re: [PATCH] media: media/pci: prevent memory leak in bttv_probe
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
        tglx@linutronix.de, mpe@ellerman.id.au, allison@lohutok.net
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 17, 2020 at 3:26 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 25/03/2020 10:01, Xiaolong Huang wrote:
> > In bttv_probe if some functions such as pci_enable_device,
> > pci_set_dma_mask and request_mem_region fails the allocated
> >  memory for btv should be released.
> >
> > Signed-off-by: Xiaolong Huang <butterflyhuangxx@gmail.com>
> > ---
> >  drivers/media/pci/bt8xx/bttv-driver.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
> > index a359da7773a9..37ac59110383 100644
> > --- a/drivers/media/pci/bt8xx/bttv-driver.c
> > +++ b/drivers/media/pci/bt8xx/bttv-driver.c
> > @@ -4013,10 +4013,14 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
> >       btv->id  = dev->device;
> >       if (pci_enable_device(dev)) {
> >               pr_warn("%d: Can't enable device\n", btv->c.nr);
> > +             bttvs[btv->c.nr] = NULL;
> > +             kfree(btv);
> >               return -EIO;
>
> Let's change this...
>
> >       }
> >       if (pci_set_dma_mask(dev, DMA_BIT_MASK(32))) {
> >               pr_warn("%d: No suitable DMA available\n", btv->c.nr);
> > +             bttvs[btv->c.nr] = NULL;
> > +             kfree(btv);
> >               return -EIO;
>
> this...
>
> >       }
> >       if (!request_mem_region(pci_resource_start(dev,0),
> > @@ -4025,6 +4029,8 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
> >               pr_warn("%d: can't request iomem (0x%llx)\n",
> >                       btv->c.nr,
> >                       (unsigned long long)pci_resource_start(dev, 0));
> > +             bttvs[btv->c.nr] = NULL;
> > +             kfree(btv);
> >               return -EBUSY;
>
> and this to a goto free_mem.
>
> >       }
> >       pci_set_master(dev);
> > @@ -4211,6 +4217,8 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
> >       release_mem_region(pci_resource_start(btv->c.pci,0),
> >                          pci_resource_len(btv->c.pci,0));
> >       pci_disable_device(btv->c.pci);
>
> And add the free_mem: label here.
>
> > +     bttvs[btv->c.nr] = NULL;
> > +     kfree(btv);
> >       return result;
> >  }
> >
> >
>
> Regards,
>
>         Hans

Good, I will modify the patch and resend a new one.

Thanks,

      Butt3flyh4ck
