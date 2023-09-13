Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF90079E022
	for <lists+linux-media@lfdr.de>; Wed, 13 Sep 2023 08:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235572AbjIMGjy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 02:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbjIMGjx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 02:39:53 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A9D41736
        for <linux-media@vger.kernel.org>; Tue, 12 Sep 2023 23:39:49 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-402d0eda361so75210155e9.0
        for <linux-media@vger.kernel.org>; Tue, 12 Sep 2023 23:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694587187; x=1695191987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Ui5s5Cw3xC0m/jtp0PhZyzY/A5ADu0VxxFvthfKrY8=;
        b=bfPhFHlLK74bS5VzEeRGDx8IpZZqIb5NTHWYI5wne/T1XljNr8Oru9f+HY75etZCGt
         78R4kridBvpVV9on6Q8vNhgSDNkgvbEADLzcWK80r+sPAtxXPZ4Pqxzj28NocmQ6G1dl
         iGHAj0XMj762ZBiIk+6kZvnHyBc71KtYx7KcDN3ulEV1AhDPGkFsxVRDKTPzrj4G1EyX
         qNhO4jqJVqHinwUKLH3hDAaOcad19KjpyZqmg9VmaYcZR5r53gvxPNK2o+ds/NF+9ASN
         CI9tzIJ1v+d3G6Okd6sGk4xvrXxy8i0/e317zXYgfoGQvjVnetNweUYL0teeXLErJHTm
         TO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694587187; x=1695191987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ui5s5Cw3xC0m/jtp0PhZyzY/A5ADu0VxxFvthfKrY8=;
        b=frATgpm3oam2NTfGM4k3HLQpmRcykGmMJuoHAOwZRK5/8rrPxGp382la19GDlLdpjc
         9c0ro//wPb+gWZBtgiddJSoIWnQMFseVRuXVStp8I9QNuSPy7yTKAti0icdqCsS8uuv/
         XoZu9BpmbE3f515lURs9QFvamgrU2yAwXj+4NO8PrdrADaZAikIX6I51ekkBF3+1gEPN
         KRt7oV1enSPN8RSC19UdL1CR6gqjB8JvuLp3vNKps111fbac371Kky9A40PL1lR0TOxz
         OeSRvCbN0ozYdD0A0Nu2BGa7TqdCC+036IAss1zkfTVcH87rORHigLWBaKDrmEluqQHE
         gAJg==
X-Gm-Message-State: AOJu0YyBUzR+ur5qfA1koydWV+nLFBWg/zQW0nEyndp7Ujqj07vS5sUa
        Yoq9hKgBcvh+1abWjsePop+ZNw==
X-Google-Smtp-Source: AGHT+IHpyTen6GH7mcHEV/WC6XNcsNT7DRMaLYEEzm02K25SO6aZuYQOgCFKRJV53h8rKbJzYw1Rxg==
X-Received: by 2002:adf:d08d:0:b0:313:f94f:3b15 with SMTP id y13-20020adfd08d000000b00313f94f3b15mr1260361wrh.2.1694587187637;
        Tue, 12 Sep 2023 23:39:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d598f000000b0031fba0a746bsm3589496wri.9.2023.09.12.23.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 23:39:46 -0700 (PDT)
Message-ID: <85a43c63-9e79-09c3-ac3e-6974547655e0@linaro.org>
Date:   Wed, 13 Sep 2023 08:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 11/14] media: platform: mtk-mdp3: add mt8195 platform
 configuration
Content-Language: en-US
To:     =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "airlied@gmail.com" <airlied@gmail.com>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Cc:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "angelogioacchino.delregno@collabora.com" 
        <angelogioacchino.delregno@collabora.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
 <20230912075805.11432-12-moudy.ho@mediatek.com>
 <6b7a229d-54c9-2450-4b37-9acc659cbd12@linaro.org>
 <c8f12e96e49f471f287db82cee51b3104e2bc0de.camel@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c8f12e96e49f471f287db82cee51b3104e2bc0de.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/09/2023 04:08, Moudy Ho (何宗原) wrote:

>> This does not make any sense and such mess at v5 is confusing.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hi Krzysztof,
> 
> 
> Apologize for the confusion caused by the improper separation of
> patches.
> This occurred because I misunderstood the new warning message
> "DT_SPLIT_BINDING_PATCH: DT binding docs and includes shoulde be a
> separate patch" that I received after running 'checkpatch.pl'.

Yes, separate patch. Patch.

Best regards,
Krzysztof

