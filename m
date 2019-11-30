Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABB3710DDDB
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2019 15:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbfK3OJi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Nov 2019 09:09:38 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:34913 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfK3OJh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Nov 2019 09:09:37 -0500
Received: by mail-pj1-f66.google.com with SMTP id s8so14653022pji.2
        for <linux-media@vger.kernel.org>; Sat, 30 Nov 2019 06:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FKtvrB0Mt1dPDCU0lQQZ0+l4lFfg4eSb8vzPxs0x5Z8=;
        b=NMkJgp7dKL3T2uJcSbqnKzitPUjziDIfJ3LtXAhLmdnMzmv40dWWMkIqR1yKeiK+sI
         wCpyM5e8aHnsEfAZblNQgMSBbCbB8v2WFqNdByM6hZ3+z1o87nyVUenCwdt74D4+ulIO
         hAkbVXihxpLwP842/1Leq7lDEJr1QpvEeTE30S/uHthFsrG1XRv9Hx9was377htC/oBL
         g2K7hL6jrlQnP32lkWxK4Z54hEcMCXTbNwYEhUaTTfnUNX7qoivwHzVexEkbfpDXHZoK
         dmFi1XUaUbRfELLhcxQKs3S8F/R0o7A5bm8aDCkpbf5pVHtNV5B/JPdlS6CxxUiSIk5a
         uVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FKtvrB0Mt1dPDCU0lQQZ0+l4lFfg4eSb8vzPxs0x5Z8=;
        b=DBMZsCCGrc7vAbTVIjjyeZD2/UoaqsmqbjyrA1UuTB3eMTzVx7WRar5ArLlu0sxugl
         6WcItMq+36a5cE+Jdxw7EFal38ZxITaRu8I6mUA4vBYaYxtX96e884pGsVimcCYN8zWi
         NwyBaEAGPbA26xQismktRAs2rJePSQS7X6gBNed1nCNzkhPPaijn0GFy0yeK46VQhTQL
         yyyAs9tnJAa2ZLfakJqG2qJlc98PgmSI7Ya+ZXWXdVlmmVfzbCi01dfyVj/mn/qrCXIk
         TtKy9u8MKp7nj7hVlmnQQVmtAdIL4c//ktwEtYlkVIT6sWuCS5iClt2vyBjJZK2DpVvp
         KtfA==
X-Gm-Message-State: APjAAAUjUSuNp/DUfW+FOa8w28oLCnqK7FjLUvoTSkmKZ62gK0MaQUCf
        Gg4HQwG3uhBfsW0thipSDaOj
X-Google-Smtp-Source: APXvYqzDwytiCfrEZJAt8NDxceGrzYgYfocCmVVy6k9xea1LbWHW7Mwlsg5/EklXVb4xjzRje9x+UQ==
X-Received: by 2002:a17:90a:c697:: with SMTP id n23mr434520pjt.37.1575122976893;
        Sat, 30 Nov 2019 06:09:36 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:980:53e7:19a8:fb8d:d702:6994])
        by smtp.gmail.com with ESMTPSA id p16sm28346128pgm.8.2019.11.30.06.09.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Nov 2019 06:09:36 -0800 (PST)
Date:   Sat, 30 Nov 2019 19:39:29 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, c.barrett@framos.com,
        linux-kernel <linux-kernel@vger.kernel.org>, a.brela@framos.com,
        Peter Griffin <peter.griffin@linaro.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: [PATCH 3/5] media: i2c: imx290: Add RAW12 mode support
Message-ID: <20191130140929.GA23629@Mani-XPS-13-9360>
References: <20191129190541.30315-1-manivannan.sadhasivam@linaro.org>
 <20191129190541.30315-4-manivannan.sadhasivam@linaro.org>
 <CAOMZO5Btkd0NLM5RBFZHD5dryE7mR5JZRLC2X__pQNmjHGCywA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5Btkd0NLM5RBFZHD5dryE7mR5JZRLC2X__pQNmjHGCywA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Fri, Nov 29, 2019 at 04:49:25PM -0300, Fabio Estevam wrote:
> Hi Manivannan,
> 
> On Fri, Nov 29, 2019 at 4:07 PM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
>                }
> > +
> > +               imx290->bpp = 10;
> > +
> > +               break;
> > +       case MEDIA_BUS_FMT_SRGGB12_1X12:
> > +               ret = imx290_set_register_array(imx290, imx290_12bit_settings,
> > +                                               ARRAY_SIZE(
> > +                                                       imx290_12bit_settings));
> 
> Could you please write the ARRAY_SIZE and its parameter in the same line?
> 
> It would improve readability.
> 

I don't favor this change but Sakari did this to supress the checkpatch
warning while applying my initial patch, so now I did this here itself
to maintain the uniformity.

Thanks,
Mani

> Thanks
