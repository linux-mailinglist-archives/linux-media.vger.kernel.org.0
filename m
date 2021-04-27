Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00D5D36C581
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 13:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235929AbhD0Lrr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 07:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhD0Lrr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 07:47:47 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D634CC061574;
        Tue, 27 Apr 2021 04:47:03 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id n138so93367221lfa.3;
        Tue, 27 Apr 2021 04:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6mN7UJosAzy0Fgag1DI+J5II0Cv8JwYcpqR0ZdaZ6Pw=;
        b=VXVdlKxet0oHyPdjnO6HFu2QcGCTj2OnpNUQBPewkERKV+sw2dsktG1hLLOs3DcZaO
         9DOXKyYVY6Tza+Oa/28VnQIzzIzhF2iS6NwC91VoSxakURxdNl3e2QqsRBj1NBRCZkwI
         edbTrVaohbDwNfjnP8OUaT/PNSySXJdBF0wLnz/EPNa5DOaZhXwbWlrDuKzgVuPNwiDD
         2Zdpm0gQ+laaB0mM1y4PZOUmOYhtytVWEnFv88OojOpD3ngTCQTKjrnLE8Q6NbEPBWQS
         oNfsAvXkSyXdQlDMnf66Ju89qCVFs0AiOCZDF/iVmjAZJXhgeASyrIYcCc8REWBl2hxo
         r5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6mN7UJosAzy0Fgag1DI+J5II0Cv8JwYcpqR0ZdaZ6Pw=;
        b=Cla9HqcPT0NCHpcRPnz1rX6/1ah6Lo2Gs2oUMODbxYHq4xvO3yoLIrhLR35MB8XFxY
         h392OzxVG+CeSnG8O9sD3BmfR4SUYfBIu7CKpvswRsdg7YFZv+O33vPuVvFjumdzJI00
         YCFP/grMz4f4pXy10Nf3F1iGeaevsbrjYkCt8ajFexj5Q2/UXxfIVrV+8Ar6r28Y6zp7
         Gd4u5u64r6E55VtOm9vlzouXGo4OOJdnlIDWhqEzvBUv1v4Kx+L9nNtzR4zHw1NIaiD8
         rsGdDKesK6XREBPttrYvUrPVtMxWOoHGkmNakK2Pp7md3GtXDeWEFYxLbucxmtTc9usJ
         O8pQ==
X-Gm-Message-State: AOAM5318D1pVFj844fxj6N2aWqaP/fROmeejb57g5qYOXj8vq8jgR6ai
        H0vWZzrULE6sl3Ch8oIed3Z2y3W7ih0=
X-Google-Smtp-Source: ABdhPJx6kko3TABajn1fiMhwaIKekxa1aDYYmrMmB2KvhSCMsDtZmlLmkmnRpfkACnQvOdILCmZEfA==
X-Received: by 2002:a19:a40a:: with SMTP id q10mr16261069lfc.302.1619524022256;
        Tue, 27 Apr 2021 04:47:02 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-102.dynamic.spd-mgts.ru. [109.252.193.102])
        by smtp.googlemail.com with ESMTPSA id i8sm363303ljb.43.2021.04.27.04.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Apr 2021 04:47:01 -0700 (PDT)
Subject: Re: [PATCH v3 25/79] staging: media: vde: use
 pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
 <d7fb2d00224d37ba1c6c6e9b73609af95c886844.1619519080.git.mchehab+huawei@kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2e8bdea5-b2a7-df95-9d93-7c1f2df6158d@gmail.com>
Date:   Tue, 27 Apr 2021 14:47:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d7fb2d00224d37ba1c6c6e9b73609af95c886844.1619519080.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

27.04.2021 13:26, Mauro Carvalho Chehab пишет:
> @@ -1088,8 +1090,9 @@ static int tegra_vde_remove(struct platform_device *pdev)
>  {
>  	struct tegra_vde *vde = platform_get_drvdata(pdev);
>  	struct device *dev = &pdev->dev;
> +	int ret;
>  
> -	pm_runtime_get_sync(dev);
> +	ret = pm_runtime_resume_and_get(dev);

Should be cleaner to return error directly here, IMO.

>  	pm_runtime_dont_use_autosuspend(dev);
>  	pm_runtime_disable(dev);
>  
> @@ -1097,7 +1100,8 @@ static int tegra_vde_remove(struct platform_device *pdev)
>  	 * Balance RPM state, the VDE power domain is left ON and hardware
>  	 * is clock-gated. It's safe to reboot machine now.
>  	 */
> -	pm_runtime_put_noidle(dev);
> +	if (ret >= 0)
> +		pm_runtime_put_noidle(dev);
>  	clk_disable_unprepare(vde->clk);

