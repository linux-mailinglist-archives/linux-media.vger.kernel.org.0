Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9BA71BC068
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 15:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgD1N7h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 09:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726868AbgD1N7h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 09:59:37 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C55DC03C1A9;
        Tue, 28 Apr 2020 06:59:37 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a21so18685126ljj.11;
        Tue, 28 Apr 2020 06:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/zDDEPocLsCCoVeXtmXy84tPsu7600voeG3oAn4ZlpA=;
        b=kUNbrCtmRLSJ/pudx3+TenRiaadVEt9iw7/4tzRtVz5f/MZveB8dNvKk2/ugbTRJhR
         Zc4pUnkymtC8EutfUFzMyYsKttPwsPjlD6AaornIRldASJA4iHMJ02RsgXc4oiL45RPT
         zuqWAUPYL+6qHrzh95mLH2MjhNtZYNXaEkibHmCeipxrXopGe4oUAiY8S40ud8JKMSLh
         rUeu1zEG2pwxbmZLiK1vLU7VzezAMwC6qkcj3zjVopvb/eXGcoHRakxEt9D3gR7mzqtw
         H8nTX7D79cjA+d+H2H/UCv2J5pHS+HBmTR/vmPF7lkGMzHjulmVeSQIxE1hi5q2A5tSX
         3bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/zDDEPocLsCCoVeXtmXy84tPsu7600voeG3oAn4ZlpA=;
        b=HN7w7/PfUjQkDZv3rGz8agSN5Kwqkn052WjMehxM+sZ3HrlmLVaFLH0L/Y74Mb03X1
         GEWsMI50J6AWUlqq3b2skmdluZbhmMamiinkpzRP11WYUar4n86c6IGcZWr1/5WyJ3jA
         ZJemSsszHmN3sbCOOJxlRjIv6wzic0qNqHiP+L9mTwfUtP5xrVP9AxvsIx5Mq2i7DIb7
         t5JQ+ceb30D6SGg1ABFjm+Ri1rRkg3oy3VSddUbNFXrcSJozQwfSqky7X1tf4JBFm5S2
         QnvjOSdX2P2PJqIiNj8OcPXtYmryQ0lglpC1voPj5+HEbQcxzto6kWzZOVVXW/1yFpuU
         Fkfg==
X-Gm-Message-State: AGi0PuZtkNHXYQ2SftoZ/iLPX3pbxu2CPqEcFtJXV+70aXKLaq/s9Wz9
        YpMu81w4kjca356hHJ+/G9cjQQ5I
X-Google-Smtp-Source: APiQypKJJuzlxQ9mHh3+8CqA33Kq/xzKGGJF2P2UiVJ2Y2mGNO1HupwCr8Yqb6gYmn+InovKMBfcPA==
X-Received: by 2002:a2e:85d1:: with SMTP id h17mr18032882ljj.70.1588082372333;
        Tue, 28 Apr 2020 06:59:32 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id o3sm14358371lfl.78.2020.04.28.06.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 06:59:31 -0700 (PDT)
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
Message-ID: <631390cb-9aff-0e3f-6c39-81d6c565987e@gmail.com>
Date:   Tue, 28 Apr 2020 16:59:30 +0300
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
> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
> index b3dd0c3..29ccdae 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -272,8 +272,25 @@ static int tegra_csi_s_stream(struct v4l2_subdev *subdev, int enable)
>  	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
>  	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>  	struct tegra_csi *csi = csi_chan->csi;
> +	int ret;
> +
> +	if (enable && atomic_add_return(1, &csi->clk_refcnt) == 1) {
> +		ret = pm_runtime_get_sync(csi->dev);
> +		if (ret < 0) {
> +			dev_err(csi->dev,
> +				"failed to get runtime PM: %d\n", ret);
> +			pm_runtime_put_noidle(csi->dev);
> +			atomic_dec(&csi->clk_refcnt);
> +			return ret;
> +		}
> +	}
> +
> +	ret = csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable);
>  
> -	return csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable);
> +	if ((ret < 0 || !enable) && atomic_dec_and_test(&csi->clk_refcnt))
> +		pm_runtime_put_sync(csi->dev);

Runtime PM maintains its own refcount, why these
clk_refcnt/power_on_refcnt are needed?
