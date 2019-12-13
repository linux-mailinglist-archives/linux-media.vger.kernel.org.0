Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B67D011DBFB
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 03:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731912AbfLMCGH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 21:06:07 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43776 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731910AbfLMCGH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 21:06:07 -0500
Received: by mail-wr1-f66.google.com with SMTP id d16so4859772wre.10
        for <linux-media@vger.kernel.org>; Thu, 12 Dec 2019 18:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Mw8EW83cosmiQE+UaosVXBv03NWKkPkaFOtzv1VzjCQ=;
        b=cjNnXVtnvtQia0K2KbhpLNAeEdFH/d2hkcA3VosxGkyt0uAqWt5HknuHvpO2ogvMrh
         mUr4MPckkTku/7nAY6yNBsTDkXq1avIVBqnS+A1Y2vJJqXDlpMnDZn5u5WvFBF+hHSV/
         3z3MrjSDKThP07L5GVZW0PoETKrdpgABSKtpotwmdhOBSpmuVhxqj529df18n0uT4jug
         Pt+6jqA6MMq9G7wHMT6d+DWsNNYqqsAzpVdBOW53p8F6c/qd24cEVAv4K9AiSTkI4ewb
         sbx8NBEuCf4fxnVH2iWPZ2o0IlhrX74IanwEZbf8E2UYAOdHnIzqFBzNAzaj5hJHHTQs
         GQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Mw8EW83cosmiQE+UaosVXBv03NWKkPkaFOtzv1VzjCQ=;
        b=J3BC0AIWCxqT8YBVUh6gGyLNQNJhTJrv6Tp/CmvZOskQnr/HmRn5NnkcydmBdD4h1r
         YKTyupoqXnQP9m3LuJbgI9aJRTNw0YgWhm9pnor10kGCTS1qHxnORFF4Z5dbqgfATlIV
         27N/owjGLk1x9j9xgYFoe5EqOvbsRGh8JhIKmDman5NJjMZTMBq61fX3A3AtgxhkJfIb
         rLMgYBlmEVKHGAkKxEiBtsY86f8WdDuZla7LU3pdYvLiuTUH+649NBoAGFMFi0KoYcKi
         wjxoq1vi1TLNfjHC+/ZgAnNhjCCZFq4QrRlEoYy4lIZC3H4998hIvWBQ6wVGHqsJBzlC
         wKkQ==
X-Gm-Message-State: APjAAAX/iT0nJOxduIHlnM3iQEuX87Ff87ddDuwJ8QkM6ZNaxYzzArZF
        N0pmGx0V2kbaiQKvaaLHCtg=
X-Google-Smtp-Source: APXvYqwkL9mwmuap/aBeos1lalFh1j9+Rp5XcBDUgY5eMnCzHtDZyckNfu5KNghiABEB2x1ki7xfLw==
X-Received: by 2002:adf:fd84:: with SMTP id d4mr9574903wrr.211.1576202764985;
        Thu, 12 Dec 2019 18:06:04 -0800 (PST)
Received: from [172.30.89.135] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id l22sm8087934wmj.42.2019.12.12.18.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 18:06:04 -0800 (PST)
Subject: Re: [PATCH] media: imx7-mipi-csis: remove subdev_notifier
To:     Rui Miguel Silva <rui.silva@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20191212191714.812249-1-rmfrfs@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <90fd1ef5-7807-2de1-c4c8-73fc29688b0d@gmail.com>
Date:   Thu, 12 Dec 2019 18:06:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191212191714.812249-1-rmfrfs@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 12/12/19 11:17 AM, Rui Miguel Silva wrote:
> It was defined a notifier in the csi_state structure that is never
> allocated. And besides that it's unregister in the remove, even though
> it is a no-op, just remove both.
>
> Fixes: 7807063b862b ("media: staging/imx7: add MIPI CSI-2 receiver subdev for i.MX7")
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>

Reviewed-by: Steve Longerbeam <slongerbeam@gmail.com>

> ---
>   drivers/staging/media/imx/imx7-mipi-csis.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 99166afca071..383abecb3bec 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -251,8 +251,6 @@ struct csi_state {
>   
>   	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
>   
> -	struct v4l2_async_notifier subdev_notifier;
> -
>   	struct csis_hw_reset hw_reset;
>   	struct regulator *mipi_phy_regulator;
>   	bool sink_linked;
> @@ -1104,7 +1102,6 @@ static int mipi_csis_remove(struct platform_device *pdev)
>   
>   	mipi_csis_debugfs_exit(state);
>   	v4l2_async_unregister_subdev(&state->mipi_sd);
> -	v4l2_async_notifier_unregister(&state->subdev_notifier);
>   
>   	pm_runtime_disable(&pdev->dev);
>   	mipi_csis_pm_suspend(&pdev->dev, true);

