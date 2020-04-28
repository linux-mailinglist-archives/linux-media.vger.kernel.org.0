Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 726671BC08C
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 16:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbgD1OFl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 10:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbgD1OFl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 10:05:41 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF07CC03C1A9;
        Tue, 28 Apr 2020 07:05:40 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id m2so16978691lfo.6;
        Tue, 28 Apr 2020 07:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r3hzm7yTEE9xqQrbBm8OOfDWzkr0IEj+zeX1Eo846UY=;
        b=p4OEQHwXTSirIiP6YEPENS2RQpq4t+1vw3fDD9fE9E8qcWtTcCZjEiliG02mYh8L94
         Ywbew18Wx/pTNrgJ+iHkP5dxm6P9hnXERGOxdOLboqd3bVsAeMPPfDmhx/9sHfnt+4FR
         TEESang+PBYT9XsK31s2qaADmj/AtHch+sKPWBZm3AnGtBIgwYadBoNSVOsqG4GpuNWm
         Td/NDuBgeXQR3rdklugeFSOOfDo1Sa/LSfOniv818VlOnD8TxHpSK0/bETwCF0a+liRJ
         C0QxMCjnQIp6K07U1Qxed5S1lL+fJTnCz2dFKVL4R2Hx9NpJ8t83Ddf5qX9NH5EGIiwY
         1f+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r3hzm7yTEE9xqQrbBm8OOfDWzkr0IEj+zeX1Eo846UY=;
        b=rvQewAiAQQg29GHhXgGxX7iWhEyKPL5vK95a8av+TfPIbkGP9VI91V4qWVVKI8ZxWt
         1q9TGd8Yyv9LcghToZDTL3e6gVSJfFvuc8wb4lNUq90mueYinWI+y/N/9zYTCP6I1GuZ
         wYh/VlWuv3XzpvTv594Dfgnq4rRas4hF7lFRRvxCZkGe7v4l/cauj9ukKKgZVOgWy+Ty
         /gRXm4Vi0+yVBqhT/zmznLoR3sMCjYIDXbzxQW50tsOgxlyPbRJpnpTJkcSMqVUCT+tt
         TJxArA4AtcZ9P8EXGy8HhgTCn5nKx3itWiRl1gTknNEXgVHP0vyNAT0XiWZVUNFuauNw
         LVZQ==
X-Gm-Message-State: AGi0PuadPeqQ6Lq4QfUjXg/Q8Y67Qt/XdcCmJhJ+EcloQIxIb6Nyg1zt
        e9WxWSUh9GIi1PtP1jqB95ZhsEFE
X-Google-Smtp-Source: APiQypKxN3pfvXCQL3vLYQ1O+Zw8BJKyVvfYPi9WBRQ+0uc2Ezri5OcRPNp9EyLJ5HnBfm7cUFyp2A==
X-Received: by 2002:ac2:53a6:: with SMTP id j6mr19174715lfh.153.1588082736038;
        Tue, 28 Apr 2020 07:05:36 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id v7sm14124531lfq.55.2020.04.28.07.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 07:05:35 -0700 (PDT)
Subject: Re: [RFC PATCH v1 3/5] media: tegra-video: Move PM runtime handle to
 streaming
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
 <1588047650-29402-4-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4d069601-5507-dc8f-0cbc-acd8fd7324b3@gmail.com>
Date:   Tue, 28 Apr 2020 17:05:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1588047650-29402-4-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

28.04.2020 07:20, Sowjanya Komatineni пишет:
> +	ret = csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable);
>  
> -	return csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable);
> +	if ((ret < 0 || !enable) && atomic_dec_and_test(&csi->clk_refcnt))
> +		pm_runtime_put_sync(csi->dev);

There shouldn't be a need to sync the RPM here, hence just
pm_runtime_put(csi->dev). Same for the VI.
