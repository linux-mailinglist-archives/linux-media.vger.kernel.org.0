Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD661D1F41
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2020 21:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390363AbgEMTcq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 May 2020 15:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1733166AbgEMTcq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 May 2020 15:32:46 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8198C061A0C
        for <linux-media@vger.kernel.org>; Wed, 13 May 2020 12:32:45 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id s3so543267eji.6
        for <linux-media@vger.kernel.org>; Wed, 13 May 2020 12:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BE622nGiTtu6v9vVxV14reu8OE6xnzpoEgMB5sSvex8=;
        b=v8Fz6qm1UPHcy4fzB1etrJtc5izL/GqEwddtqreXSdnRxvaCZO93lPxWCxy6dYNopO
         ovTSMdPH5x3EcqCJVFhALEQGdCHBhHOxJcbfjejGwXLVpdyoqWR5grnKsbYXYZBYMTDW
         jdw79nr8BGsjc84MHBGJGCPWGXXZwQUJRnP+/fUYQH/KFcDG4sQTaAkDVB8uy3r4Kva6
         1c7eENLEXz1TDTmM0bZq9Iq19X+gC84bVj2IETeUpm3AzHtoHxtTTygNy6flCIvIIatX
         8sbRRDzTOIcjexPkw9H2mGRXMJHZRNgjjEi7x7v3MQgHq21h514+LW7nHsvIA1sRMo47
         ddUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BE622nGiTtu6v9vVxV14reu8OE6xnzpoEgMB5sSvex8=;
        b=rFL09bvdyAmmiGPyOdeNoXpp6zHv+LCt1QgI4xBbUJRAOmyNrEh3IN91aS2OHHzJQB
         sFg3WHbRYO3Eh30x7xefOPcW1sldjY6c2zWr9ydzgW31DRuFe2K3d4a2p3A+1g+3wudh
         0aoh6ME48H/fbCfF+o5TkoZBhR2CEJ3YDJ6dO+oNqVGSvhd7/IQVeDocHarbfuuPO5zN
         Bc+IVraixgucjLV7I49HPeiEPoeRgVCDjJiju3SBazSyj386loKVYTDCZpJF4Z55NTqj
         83HaJqNx1CnvD0V5KWwJkHmVqr5uJLACGmzSK7KSC0uszMRWPrAqCFB8sKxmolg2N4De
         Rpsw==
X-Gm-Message-State: AOAM533Tdba9nOkvLkGKus3FmIR7Z/EGa4eqkSgKMA7sgkKr7fZaczkd
        iPEh0EULzWiQK103J/V9TLAaMC8j3L/8PrLNeUxREA==
X-Google-Smtp-Source: ABdhPJyabrOM2lVYltf63j7FVFAWHDtm2qZfMMxJE1PMk+5hOmSTpa6jO7omyjX4bgwtMZQAU7ZWXlAoEFkPAqDYUoE=
X-Received: by 2002:a17:906:af6f:: with SMTP id os15mr609937ejb.78.1589398364557;
 Wed, 13 May 2020 12:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <1589186626-17243-1-git-send-email-wangxiongfeng2@huawei.com>
In-Reply-To: <1589186626-17243-1-git-send-email-wangxiongfeng2@huawei.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 13 May 2020 16:32:33 -0300
Message-ID: <CAAEAJfAzcRTLE3HWHJqWvuENYnPCU-E6TdaDWXc+WNHOaUqdyA@mail.gmail.com>
Subject: Re: [PATCH] [media] tw686x: add a missing newline when printing
 parameter 'dma_mode'
To:     Xiongfeng Wang <wangxiongfeng2@huawei.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 11 May 2020 at 05:49, Xiongfeng Wang <wangxiongfeng2@huawei.com> wrote:
>
> When I cat module parameter 'dma_mode' by sysfs, it displays as follows.
> It is better to add a newline for easy reading.
>
> [root@hulk-202 ~]# cat /sys/module/tw686x/parameters/dma_mode
> memcpy[root@hulk-202 ~]#
>
> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>

I don't mind this change, but I don't think this is standard.
The lack of newline follows what other drivers are doing.

# hexdump -c /sys/module/acpi/parameters/ec_event_clearing
0000000   q   u   e   r   y
0000005

Is it really an issue for you?

Thanks,
Ezequiel

> ---
>  drivers/media/pci/tw686x/tw686x-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/pci/tw686x/tw686x-core.c b/drivers/media/pci/tw686x/tw686x-core.c
> index 74ae4f0..bfc61da 100644
> --- a/drivers/media/pci/tw686x/tw686x-core.c
> +++ b/drivers/media/pci/tw686x/tw686x-core.c
> @@ -71,7 +71,7 @@ static const char *dma_mode_name(unsigned int mode)
>
>  static int tw686x_dma_mode_get(char *buffer, const struct kernel_param *kp)
>  {
> -       return sprintf(buffer, "%s", dma_mode_name(dma_mode));
> +       return sprintf(buffer, "%s\n", dma_mode_name(dma_mode));
>  }
>
>  static int tw686x_dma_mode_set(const char *val, const struct kernel_param *kp)
> --
> 1.7.12.4
>
