Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77C7467FE9D
	for <lists+linux-media@lfdr.de>; Sun, 29 Jan 2023 12:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbjA2Lkt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Jan 2023 06:40:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjA2Lks (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Jan 2023 06:40:48 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986211F91F
        for <linux-media@vger.kernel.org>; Sun, 29 Jan 2023 03:40:47 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso6354013wms.3
        for <linux-media@vger.kernel.org>; Sun, 29 Jan 2023 03:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jazwuo7S7PRaKzzmzo6+Ei6xg2t6TmeOjR55UzCFgww=;
        b=KLbl4LXEc5WnIUdM9m46JUZFytcAbOiTBFMhOkJ2BnF/LvTl04DR3/7Yhi+HF8egY/
         Ia7Da/2zDM0DmUroHUp85Kfz0YqPnj0zziJcLpRbQ0LhspCIiB2zBJWIx3MLje+kwHd0
         JnQDCK4szG3TB9Xpq+9vd9sfvSYKiL80lNy7pJizdRjQa0VuRwvLar7l0oW8r8E5tdD3
         hnONeqtHZhXwC98ObquKhLZWD2mE4ksNd2zoor6X0YGmtyQoXkeQmKY5afTQB1N7usoC
         sMQ0z8T5ukKgqER0Dmz4mIUm9Jk14gy9XFgr+DJPIrXqTCIMO1QUz1BjREWw61Y1bEnb
         4y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jazwuo7S7PRaKzzmzo6+Ei6xg2t6TmeOjR55UzCFgww=;
        b=3Jw/PxwhCKL3arvOi50yiqq0Hhj36rRJHegtVDu3CRSkoeMkZWcEdssyV/+DoG7CjA
         MAtQrB4A3mPC0sIIbunEsm2zdu4VBWj0RDm3qMpXdemJ/5mLWZ1P+pRodVDVQTGykK+U
         tFlHZw8Wm6iDbV47kjZ4ZKHqXLdLYFysIaPBPGF44+RQNCZ6fXEppLC3N+3l7a8kuqoZ
         Na7xUs47Kfs+O+OrpliUocoyb3F6qkoMMfZTp65F53tWvCM+I5usPLD48LpTrvJF0BxD
         D6Tol9bPNpYWpHBE8fhhos3XgQpAqPMLNGgUZBwpSV/up8OoJBrFmcxmOl1bR2VlCot4
         M8tA==
X-Gm-Message-State: AFqh2kpg08vTbLTuPcLlby7fMc+UDRSqiozs62WOtCmJr6OPXY5TXe8X
        TyzpgpaLq/oonRe+aVqQSPAAag==
X-Google-Smtp-Source: AMrXdXsegIHmYjOYJSE0fSWflDV/55+6tBA+4ojGllu2fgzkaYVsvnDzw2FvVytEDn7qcOyjyTiH5Q==
X-Received: by 2002:a1c:7504:0:b0:3d3:52bb:3984 with SMTP id o4-20020a1c7504000000b003d352bb3984mr42806695wmc.17.1674992446156;
        Sun, 29 Jan 2023 03:40:46 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x26-20020a1c7c1a000000b003db01178b62sm12963733wmc.40.2023.01.29.03.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 03:40:45 -0800 (PST)
Message-ID: <144a0e59-0652-7e73-cc01-354f6a18f265@linaro.org>
Date:   Sun, 29 Jan 2023 12:40:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6.1] media: dt-bindings: Add OV5670
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        chiranjeevi.rapolu@intel.com, luca@z3ntu.xyz, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230126165909.121302-2-jacopo.mondi@ideasonboard.com>
 <20230128112736.8000-1-jacopo.mondi@ideasonboard.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230128112736.8000-1-jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/01/2023 12:27, Jacopo Mondi wrote:
> Add the bindings documentation for Omnivision OV5670 image sensor.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
> v6->6.1
> - Use additionalProperties: false for endpoint properties from
>   video-interfaces.yaml
> - List 'remote-endpoint' among the accepted endpoint properties
>   now that we use additionalProperties: false
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

