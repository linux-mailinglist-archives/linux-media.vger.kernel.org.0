Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE461DAFDD
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 12:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbgETKPt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 06:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726868AbgETKPs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 06:15:48 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B04DC061A0E;
        Wed, 20 May 2020 03:15:48 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id c11so783722ljn.2;
        Wed, 20 May 2020 03:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A3jQcfTwH9hgQh8/O+gwx3D7oktbfMKBaopqhaIQ9pM=;
        b=laJRdkCg5aDI16TZ1iNoVJGsUFhWvSlm178lY/+RHopW12Q2J7mmdgB6w0g8cGTluo
         NyfqqZB/UFewKnqM9xNSZGvRlvJu3z4TraMkdnlMWjncZEJ08R6Z3wbMXpYg3UoZQRH3
         EJjLYMZuy3TgpaDDFi4PF4PjALVzyl6D+bZlGbd5Xmzug4suTqtw1ObsRh7oUZGE35Br
         mxtzAoz6z59+ay+Iy7DY6711RgTlSd2W9viHDU1k5G19rO3aEvRRWy2IuazDAZ6rcWSs
         M7YqPPj+3AsoEF4VWFI/qksCk/03a5tuMHNCpyo/CK9oQirN4egx6vO2szy6pnR0knSC
         C20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A3jQcfTwH9hgQh8/O+gwx3D7oktbfMKBaopqhaIQ9pM=;
        b=d+3aqzeobTOh60HXXSB9JVxoH2Ic9FaulL+Y/HExuhberqjUEKSkveK3yzbORdrb5X
         N1dTSNfu0ufoWUztETXTutKInvjcDGVjHoD/hTYNIwl6PCaR4u08Xn8g8XbyedBy19rU
         TPwjKwWeQLGMX7PiCN+CIu6pnHxx0Ez/w0iFQ5bryJixpgY0jWboarBn+eFeImlIAZ85
         GmQHxyTPhbk2HQjGxskfVoLq+T1DQjrl777TZgE/AVHPuK2YkdlFFnZZkrwDkG3hiVNO
         F6Vbmex2Dcqj0zBMzG7C+UrClbsocdumygOZMlTmA9vtDbFB6e/GUANYkrrH3OZRXgoA
         +n3Q==
X-Gm-Message-State: AOAM533LDl8RlyKfV3WdyROn73qykMGq8dQfhQkC0tlJ6y5RHXe/bM6O
        w+PaLnr/KKhdacXMRAscbPoDEN+Y
X-Google-Smtp-Source: ABdhPJylLv5WcZffcN6CY6DHsMMWEVlMasl60xHsskEX1iigxx3HLyXQuuOF/A2C+wOMqTnRqvSxqg==
X-Received: by 2002:a2e:b891:: with SMTP id r17mr2455976ljp.58.1589969746390;
        Wed, 20 May 2020 03:15:46 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id d22sm960520lfi.31.2020.05.20.03.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2020 03:15:45 -0700 (PDT)
Subject: Re: [PATCH] media: staging: tegra-vde: fix runtime pm imbalance on
 error
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
References: <20200520095148.10995-1-dinghao.liu@zju.edu.cn>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2b5d64f5-825f-c081-5d03-02655c2d9491@gmail.com>
Date:   Wed, 20 May 2020 13:15:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200520095148.10995-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

20.05.2020 12:51, Dinghao Liu пишет:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/staging/media/tegra-vde/vde.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
> index d3e63512a765..dd134a3a15c7 100644
> --- a/drivers/staging/media/tegra-vde/vde.c
> +++ b/drivers/staging/media/tegra-vde/vde.c
> @@ -777,7 +777,7 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
>  
>  	ret = pm_runtime_get_sync(dev);
>  	if (ret < 0)
> -		goto unlock;
> +		goto put_runtime_pm;
>  
>  	/*
>  	 * We rely on the VDE registers reset value, otherwise VDE
> 

Hello Dinghao,

Thank you for the patch. I sent out a similar patch a week ago [1].

[1]
https://patchwork.ozlabs.org/project/linux-tegra/patch/20200514210847.9269-2-digetx@gmail.com/

The pm_runtime_put_noidle() should have the same effect as yours
variant, although my variant won't change the last_busy RPM time, which
I think is a bit more appropriate behavior.
