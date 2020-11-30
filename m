Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50EE12C8945
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 17:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728758AbgK3QUh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 11:20:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728665AbgK3QUg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 11:20:36 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8885BC0617A7
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 08:19:53 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id h3so14728214oie.8
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 08:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=BODYfYTeDSugp1RxBgS7anYBagSna9CL1uemvUvDkss=;
        b=Z64+fGze7U4fK9y//5Jw+dCXti/GNHvXBUKcQ5kt7bBRn3l30mVR9h+HisK1syj/ag
         q8cUQVjzMmRi35Nx4lDFD2rBEsLt5wAr16JA9xwke+XjnKg+RpdJqf6zQcbxtrOMXOHL
         EIl9VtOIZTrgRty8fmpLST1u+bJwqYCUSmci5rIMaYnQKgraHvAeV99VESAS9E+VHjBN
         UlFahOSzmKSwQuTaLzozKP+cuouHrtNvK7tr0AcmxLQoVwrKrzbYNodrVJH1/5f0z1YV
         VrNzuK8U9A1GDdCamxsbu1k5ZaRcOJOtOGgUa6e3gwKQSW37geLZUEAyCOTaW1sDyg8N
         a8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=BODYfYTeDSugp1RxBgS7anYBagSna9CL1uemvUvDkss=;
        b=iSZe4hwVeCO4Osxkr1nvdYiFVmNbErCImF+N2Wg6UbTxsnhf9lOWhKRo4Nc5pXxVg5
         BpqVmzhDhKZKBg3HHm4pl5FljwAAFipGYh96qVuidrnJ1CPLU7p4yo7ocg5wu/U3MWXU
         xneNxK2zrKO0OGbAuNqfkGuHP6WbPf4ZdICLxBwUr+HkOqHugniLalnTZMgZ8QmJHQj1
         +TqztSwN1WBckCegBJRTJTpwuY7sWLej9NAbr/O5lzS7ALDbFbYasZWlxyTnguZ+Igku
         7q6O8KXO5s2OGqwv2/bq6iudC1A7VydJdecNtSd3nF3gz0PiiY70ecuxW8dzrhyx+cVJ
         avuQ==
X-Gm-Message-State: AOAM531KHlTSyU/5f0NtaHPpnj2ZSWTsxnpZW0NC5eboFLdFa7emB9wW
        xHeTshAE9HKly4ncKqTw8+mHCA==
X-Google-Smtp-Source: ABdhPJxbRslQGEjyt6Cd+u2rMfIzAuqSmYGsdkYghoA43A9HKWbbqhWgDXAW9Jxi8x9KxlLSfFqcdA==
X-Received: by 2002:aca:90c:: with SMTP id 12mr15118936oij.15.1606753192894;
        Mon, 30 Nov 2020 08:19:52 -0800 (PST)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id a4sm10047503oot.6.2020.11.30.08.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 08:19:52 -0800 (PST)
Subject: Re: [PATCH] Revert "i2c: qcom-geni: Disable DMA processing on the
 Lenovo Yoga C630"
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Wolfram Sang <wsa@kernel.org>, Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20201124185743.401946-1-bjorn.andersson@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <f5aca410-f964-07d4-e18a-e438881e37cc@kali.org>
Date:   Mon, 30 Nov 2020 10:19:51 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201124185743.401946-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 11/24/20 12:57 PM, Bjorn Andersson wrote:
> A combination of recent bug fixes by Doug Anderson and the proper
> definition of iommu streams means that this hack is no longer needed.
> Let's clean up the code by reverting '127068abe85b ("i2c: qcom-geni:
> Disable DMA processing on the Lenovo Yoga C630")'.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index dce75b85253c..046d241183c5 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -353,13 +353,11 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  {
>  	dma_addr_t rx_dma;
>  	unsigned long time_left;
> -	void *dma_buf = NULL;
> +	void *dma_buf;
>  	struct geni_se *se = &gi2c->se;
>  	size_t len = msg->len;
>  
> -	if (!of_machine_is_compatible("lenovo,yoga-c630"))
> -		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> -
> +	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>  	if (dma_buf)
>  		geni_se_select_mode(se, GENI_SE_DMA);
>  	else
> @@ -394,13 +392,11 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  {
>  	dma_addr_t tx_dma;
>  	unsigned long time_left;
> -	void *dma_buf = NULL;
> +	void *dma_buf;
>  	struct geni_se *se = &gi2c->se;
>  	size_t len = msg->len;
>  
> -	if (!of_machine_is_compatible("lenovo,yoga-c630"))
> -		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> -
> +	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>  	if (dma_buf)
>  		geni_se_select_mode(se, GENI_SE_DMA);
>  	else

Tested-by: Steev Klimaszewski <steev@kali.org>


