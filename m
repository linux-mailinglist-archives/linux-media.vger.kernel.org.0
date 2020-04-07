Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 957CF1A0938
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 10:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgDGIUH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 04:20:07 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44187 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbgDGIUH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 04:20:07 -0400
Received: by mail-pg1-f194.google.com with SMTP id 142so1342333pgf.11
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 01:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+VMdRNKy8WIGpy4ccnu4P7dtP9xWbu5Le2O9neeo3us=;
        b=lnw0vT+TNfJ+L11LQKtfwC+aCR9UiN5AZ6Ts62aLsiiM6ryjWoOahzK6CnWcqjMchH
         aTe0n+h84Cq3LlOkykZAXRQBLLyqwcLp7IPgg+emcChqzBL7sWbNXJET4+tbSJYgBqLC
         /gYfKIRMr3X4DVPhGf7qSiSdSP5W+FtfY2PKEpUr40DzJ4uIaLrCvGbZLGMAY46rBDDg
         52Xbe22CLCnxGBbGG+RHKfXyr+cn7PthuBPVp+cuFKnF9lowzjlYnargR/BGGoBrnPH8
         amFoLtuvobv5XvUOnbMuRqUXyV8XlqjgaAuE302SCdo3j4tZkhmzRV+VZfOoj6ubFdF6
         xvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+VMdRNKy8WIGpy4ccnu4P7dtP9xWbu5Le2O9neeo3us=;
        b=YIJUgRUg5ZRFa1frkXlRzggvT7KUzHV56rnXR8LGzEofQDUuYoxqJ/iNiUcvGjQuIo
         NbHRE9ZZsanAUScdUg+YkskZR1E6GBexHuduiTmkzKwwty+4TmFixQaCQcsBJ93OHSHj
         QXeb7DJHFo/380Aij6Uq/hHmN+uuoKAo+4XR7iHyd5cDoPNnr2vV6EcVa/ehpHpbFCas
         uReyh6dIxJtvSjKMMl/oZ1mMg+vJwWym8ppoh00Gca0FcbWXj+7tFeJhRgZWpKlsy/AA
         S1vazZKN45/FUgUVALZnlcU4TeAZ4rvkFKsPvtf6o3Fe0cnX2hBw+OCge7EK59rFIDwJ
         x1Vg==
X-Gm-Message-State: AGi0PuZrdogMD0BqEdZAthRd0SKbFXSCnQitbCobnTInFw8n9p0KvHsW
        b9paouoi6aHH5nLiRZ3FTIja
X-Google-Smtp-Source: APiQypK3p9d3RpzhN7SoFGlBmJaCKpwaSUGwY99JEMUWZ0nMRnyXot+vmeT8qffQQyIUt5h0mdZQXQ==
X-Received: by 2002:a63:f502:: with SMTP id w2mr905018pgh.423.1586247605907;
        Tue, 07 Apr 2020 01:20:05 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e86:d03b:4d11:a99a:dd42:277d])
        by smtp.gmail.com with ESMTPSA id o128sm13247007pfb.58.2020.04.07.01.20.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 01:20:05 -0700 (PDT)
Date:   Tue, 7 Apr 2020 13:49:59 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi
Cc:     Andrey Konovalov <andrey.konovalov@linaro.org>,
        linux-media@vger.kernel.org, peter.griffin@linaro.org
Subject: Re: [PATCH 0/3] IMX290 sensor driver fixes
Message-ID: <20200407081959.GD2442@Mani-XPS-13-9360>
References: <20200226215913.10631-1-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226215913.10631-1-andrey.konovalov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, Feb 27, 2020 at 12:59:10AM +0300, Andrey Konovalov wrote:
> This patchset deals with two issues in the IMX290 driver:
>   - the current_format field in the struct imx290 can be used before
>     initialization,
>   - the reset signal to IMX290 isn't handled correctly.
> 
> Andrey Konovalov (3):
>   media: i2c: imx290: set the format before VIDIOC_SUBDEV_G_FMT is
>     called
>   media: i2c: imx290: fix the order of the args in SET_RUNTIME_PM_OPS()
>   media: i2c: imx290: fix reset GPIO pin handling
> 

Any update on this series?

Thanks,
Mani

>  drivers/media/i2c/imx290.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> -- 
> 2.17.1
> 
