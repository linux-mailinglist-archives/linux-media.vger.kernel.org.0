Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5856F53D8
	for <lists+linux-media@lfdr.de>; Wed,  3 May 2023 10:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbjECI57 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 May 2023 04:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjECI56 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 May 2023 04:57:58 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9424810D9
        for <linux-media@vger.kernel.org>; Wed,  3 May 2023 01:57:56 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f192c23fffso30352865e9.3
        for <linux-media@vger.kernel.org>; Wed, 03 May 2023 01:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683104275; x=1685696275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DnRb7dDXP217oGo1HF2W6EYow19JwD0ZBlHKF/B0F1s=;
        b=nKz9j4av6PvO4+KQsmLJhqBm9WWlR9U2fpFqJBZjLhWr8IKluihScR4lvkQ3kIGfhn
         PQF9Q/gZTh0XeEwdphja6hPZaHh+V4RhppJWnmOV6AV9xwE5JurkKluq5ZjQtQfxZzG2
         CIOhqbug02+l0xvqhAO/ZK7wMIhe1d0dngaavzg4LCEKs2VEjH7rQqOpmIQ9NC3S/KL0
         TMUZLzVi1DK8ayaQE1F9Nk3PNQmojFW+E42S6d/TcaTX/IcyIJ4gn0bj1f2ClE8mc3Jw
         e6dPPjEq7iioZZLel6UjJxFAYGMgndT0LnRsggaGrQ93zmj/pIoQweqHMYk0ueXuykJ+
         qTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683104275; x=1685696275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DnRb7dDXP217oGo1HF2W6EYow19JwD0ZBlHKF/B0F1s=;
        b=J49vcppnGq1Z4ephkmaXcrv5M8mWOnlFLG1cSa9jguTKFtvmw8m5mlJIMG+R3aZr9l
         /aq09eplcF8YCqPsZpKk27zpzMaxyfz5TnrmfLVHRIx0XnrC6kW6D+WHKXI/9hQXtmRH
         fBNIPLaoJkGBsl3LxrX5ddZpk3CQHKUWXBvIqWNVLBEWcgzn1Tc1QCQDWGLRF+1d984M
         J6GPftl3J395ouB6Z6Eav7xjkztzuTGKhJi3r4rOv7n6N9R7axc3yiKnhtbOos307vWl
         ftNQk4EuBIC9ZSdopvQ4zH/3Yo9iCFkdtmlB5VlL0voG+Hzz0F4GKs++kEWTIEUqCtpQ
         bMoQ==
X-Gm-Message-State: AC+VfDyUynyuNxn7HiHBAW8eCzkH9FO8zVXzrfAT/Yb8IZL/cw9ITzIR
        ngzSb0oY0JcJDNEnAZPpgxrrhw==
X-Google-Smtp-Source: ACHHUZ7rdLlv/3s8yG4JbblbnG+sbMkxQNNVv3adxxdOWjyGlPNDx1ClTj/QjF7GE76Jbpq26AhpKQ==
X-Received: by 2002:a5d:4d44:0:b0:2fe:e435:4a17 with SMTP id a4-20020a5d4d44000000b002fee4354a17mr14436000wru.65.1683104275055;
        Wed, 03 May 2023 01:57:55 -0700 (PDT)
Received: from [197.55.55.58] ([93.107.151.186])
        by smtp.gmail.com with ESMTPSA id v15-20020a05600c214f00b003f18141a016sm1224227wml.18.2023.05.03.01.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 01:57:54 -0700 (PDT)
Message-ID: <36f2a720-976f-7c88-1bfb-6c226ec286d8@linaro.org>
Date:   Wed, 3 May 2023 09:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/3] media: camss: Link CAMSS power domain on MSM8996
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hans Verkuil <hansverk@cisco.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230503072543.4837-1-y.oudjana@protonmail.com>
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230503072543.4837-1-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/05/2023 08:25, Yassine Oudjana wrote:
> CAMSS on MSM8996 has been broken since commit
> 46cc03175498 (media: camss: Split power domain management, 2022-07-04).

Don't forget to run your patches through checkpatch --strict

ERROR: Please use git commit description style 'commit <12+ chars of 
sha1> ("<title line>")' - ie: 'Commit 46cc03175498 ("media: camss: Split 
power domain management")'


