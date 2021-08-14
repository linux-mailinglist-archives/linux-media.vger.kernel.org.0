Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 119BA3EC3A4
	for <lists+linux-media@lfdr.de>; Sat, 14 Aug 2021 17:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238712AbhHNPoy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Aug 2021 11:44:54 -0400
Received: from mail.ispras.ru ([83.149.199.84]:44586 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234654AbhHNPoy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Aug 2021 11:44:54 -0400
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
        by mail.ispras.ru (Postfix) with ESMTPSA id 4366440A2BD1;
        Sat, 14 Aug 2021 15:44:22 +0000 (UTC)
Subject: Re: [PATCH] media: pt3: Fix IO unmapping on error handling paths in
 probe
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Akihiro Tsukada <tskd08@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kirill Shilimanov <kirill.shilimanov@huawei.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210812092435.8255-1-novikov@ispras.ru>
 <CAHp75VcBnc_76E3KbmPPQKP5xfd73jAxz4Nx1WqCgPCnQN-Lsg@mail.gmail.com>
From:   Evgeny Novikov <novikov@ispras.ru>
Message-ID: <45928f64-49ee-3a54-f2f4-79b059dd289a@ispras.ru>
Date:   Sat, 14 Aug 2021 18:44:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcBnc_76E3KbmPPQKP5xfd73jAxz4Nx1WqCgPCnQN-Lsg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On 12.08.2021 15:08, Andy Shevchenko wrote:
>
>
> On Thursday, August 12, 2021, Evgeny Novikov <novikov@ispras.ru 
> <mailto:novikov@ispras.ru>> wrote:
>
>     pt3_probe() did not free one of IO mappings in case when one of
>     them was
>     successful while another one failed. The patch fixed that.
>
>
>
> It makes code not better, what really may do is a conversion to 
> pcim_*() and devm_*() APIs.
Thank you for the good suggestion. I will resend the patch. But you 
should take into account, that I have not an ability to test upcoming 
changes except for compiling them and checking some requirement 
specifications included into our verification framework. So, further 
work and decisions are up to driver developers.

Best regards,
Evgeny Novikov
>
>
>     Found by Linux Driver Verification project (linuxtesting.org
>     <http://linuxtesting.org>).
>
>     Signed-off-by: Evgeny Novikov <novikov@ispras.ru
>     <mailto:novikov@ispras.ru>>
>     Co-developed-by: Kirill Shilimanov <kirill.shilimanov@huawei.com
>     <mailto:kirill.shilimanov@huawei.com>>
>     Signed-off-by: Kirill Shilimanov <kirill.shilimanov@huawei.com
>     <mailto:kirill.shilimanov@huawei.com>>
>     ---
>      drivers/media/pci/pt3/pt3.c | 20 +++++++++++++-------
>      1 file changed, 13 insertions(+), 7 deletions(-)
>
>     diff --git a/drivers/media/pci/pt3/pt3.c b/drivers/media/pci/pt3/pt3.c
>     index c0bc86793355..f1bd2644435b 100644
>     --- a/drivers/media/pci/pt3/pt3.c
>     +++ b/drivers/media/pci/pt3/pt3.c
>     @@ -736,19 +736,24 @@ static int pt3_probe(struct pci_dev *pdev,
>     const struct pci_device_id *ent)
>             pt3->pdev = pdev;
>             mutex_init(&pt3->lock);
>             pt3->regs[0] = pci_ioremap_bar(pdev, 0);
>     -       pt3->regs[1] = pci_ioremap_bar(pdev, 2);
>     -       if (pt3->regs[0] == NULL || pt3->regs[1] == NULL) {
>     +       if (pt3->regs[0] == NULL) {
>                     dev_err(&pdev->dev, "Failed to ioremap\n");
>                     ret = -ENOMEM;
>                     goto err_kfree;
>             }
>     +       pt3->regs[1] = pci_ioremap_bar(pdev, 2);
>     +       if (pt3->regs[1] == NULL) {
>     +               dev_err(&pdev->dev, "Failed to ioremap\n");
>     +               ret = -ENOMEM;
>     +               goto err_iounmap0;
>     +       }
>
>             ver = ioread32(pt3->regs[0] + REG_VERSION);
>             if ((ver >> 16) != 0x0301) {
>                     dev_warn(&pdev->dev, "PT%d, I/F-ver.:%d not
>     supported\n",
>                              ver >> 24, (ver & 0x00ff0000) >> 16);
>                     ret = -ENODEV;
>     -               goto err_iounmap;
>     +               goto err_iounmap1;
>             }
>
>             pt3->num_bufs = clamp_val(num_bufs, MIN_DATA_BUFS,
>     MAX_DATA_BUFS);
>     @@ -756,7 +761,7 @@ static int pt3_probe(struct pci_dev *pdev,
>     const struct pci_device_id *ent)
>             pt3->i2c_buf = kmalloc(sizeof(*pt3->i2c_buf), GFP_KERNEL);
>             if (pt3->i2c_buf == NULL) {
>                     ret = -ENOMEM;
>     -               goto err_iounmap;
>     +               goto err_iounmap1;
>             }
>             i2c = &pt3->i2c_adap;
>             i2c->owner = THIS_MODULE;
>     @@ -801,11 +806,12 @@ static int pt3_probe(struct pci_dev *pdev,
>     const struct pci_device_id *ent)
>             i2c_del_adapter(i2c);
>      err_i2cbuf:
>             kfree(pt3->i2c_buf);
>     -err_iounmap:
>     -       if (pt3->regs[0])
>     -               pci_iounmap(pdev, pt3->regs[0]);
>     +err_iounmap1:
>             if (pt3->regs[1])
>                     pci_iounmap(pdev, pt3->regs[1]);
>     +err_iounmap0:
>     +       if (pt3->regs[0])
>     +               pci_iounmap(pdev, pt3->regs[0]);
>      err_kfree:
>             kfree(pt3);
>      err_release_regions:
>     -- 
>     2.26.2
>
>
>
> -- 
> With Best Regards,
> Andy Shevchenko
>
>
