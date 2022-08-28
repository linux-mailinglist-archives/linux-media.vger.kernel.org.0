Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B049E5A3E2B
	for <lists+linux-media@lfdr.de>; Sun, 28 Aug 2022 16:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiH1OrY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 10:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbiH1OrX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 10:47:23 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF66627B06
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 07:47:19 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id m5so8030121lfj.4
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=gb/n297KVC/J2OGgkuHVeJbH9/QiH3tBuCeuNP84b3Q=;
        b=oJoCm26fgmWQWg+i+r70akcaRtBmR6AZbP3SjXtp+yzAjDp/YmuNO1kWDn0NyyZIR7
         0YD3qDHVRS41sGj+X7QDjbnK/JhhXYvGnVzyPYNdf5sACxZR2ULdIWR0QFMtlzFA85xO
         fUQcJtuaRciiQ+x48amCvU9ucQtxfua+z1zfA2Ryh0EvSyEat7pucn/sFpSx2z6AE7cE
         0MU7VDocQTvSIH14Esm6J0LorCwG0ClX5ZfbQOPOyh69MQ5T3UAMqXgOn17i6z2fenN3
         NfSoOFvgCoD4fPgV/TCaGJCQTLqI8I8EZoDk4h4c2nAivFPHqPepbv0T/wWH5DKb/sou
         tmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=gb/n297KVC/J2OGgkuHVeJbH9/QiH3tBuCeuNP84b3Q=;
        b=1tEj9E5HYRDAghdhPgsYwhmftHqpGa447pG1AR/ljXGnuHoG6sw83/PQbx2psMXZxP
         xdo9k6YQUQR9TubPhN/mo1yj4LNpbH68RmPG//wD42/jLg/8iA+2rtTdqtk33Ud1ydF5
         VF82yWPG/LfDrnJkKboEkVDg4vQ6wuBrneDJ0toMVmFcgWbxoddNtpEAdULlVzaFcGrD
         7NfqRxfkJZplSOY2r4NEtb3xvSR7HkU2BIR+fzhvBnxmYPkZlh4sZmpTFvSZ4NNfe1yq
         fZK0vHHrhi1FyLZTAyZ4h86uW1KhHOtYdLrhnFOdIVdN0U+dZ4WdrozhN26P6CTwHilx
         ul3A==
X-Gm-Message-State: ACgBeo0VMu62rwsJk0C844ng4luBx+qbxwuKAwB05235GiU1240ryMX0
        CZtcKY9BadgZB0GxdOMgEmZ+ny5Bu0BlcBe2
X-Google-Smtp-Source: AA6agR5ePv69+ckPYbLxCfn3MHWBryoJtwYN7aYTTsDUbSg9mO251FJpVlzK8yG8xeEQRkYOgjZSrw==
X-Received: by 2002:a05:6512:151e:b0:492:cbd3:e8cf with SMTP id bq30-20020a056512151e00b00492cbd3e8cfmr4704624lfb.262.1661698038151;
        Sun, 28 Aug 2022 07:47:18 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id j3-20020ac25503000000b0047dace7c7e5sm965371lfk.212.2022.08.28.07.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Aug 2022 07:47:17 -0700 (PDT)
Message-ID: <51e77545-e029-69f3-f5cd-f2fdf8846582@linaro.org>
Date:   Sun, 28 Aug 2022 17:47:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/3] Added platform module alias for the xiic I2C driver
Content-Language: en-US
To:     martin.tuma@digiteqautomotive.com, linux-media@vger.kernel.org
References: <20220822194721.1238-1-martin.tuma@digiteqautomotive.com>
 <20220822194721.1238-2-martin.tuma@digiteqautomotive.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220822194721.1238-2-martin.tuma@digiteqautomotive.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/08/2022 22:47, martin.tuma@digiteqautomotive.com wrote:
> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
> 

Thanks for the patch. Empty commits are not accepted, so instead you
should explain here why do you need it. In general, your change should
not be needed, so please explain in detail why do you think otherwise.

Best regards,
Krzysztof
