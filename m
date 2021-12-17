Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF77F478DF2
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 15:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237340AbhLQOj4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 09:39:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237336AbhLQOjz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 09:39:55 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90475C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Dec 2021 06:39:55 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id a83-20020a1c9856000000b00344731e044bso1691116wme.1
        for <linux-media@vger.kernel.org>; Fri, 17 Dec 2021 06:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=HWygtIWBaax9xKMejUdqL907XvRbbIbFJ++8LtFRCPM=;
        b=j709/z9d0nSj4a0LhjxAyTEsN82bBOs0ZuTF0SBlP4ANVkoPs6vU80t/hCULEe2cY6
         e9ePIzlfTZ+pso6oQW4Bx3WLmELFM1ye7QLPCo8kWo/rO02s8Zah0A0VOzXbTP9HrANf
         J76KGHrHfzwzQE1OE/3mx6gNNJoPPlJLh9m+nRgMVcTUKK4m4pVc25BGxaVzBefwoTDg
         GaPrTAWH+hapqZRvVRazMowjmEYmaCNtUgQ7GRK17yhpyP3H0ir+WnjulWYOixtxjulm
         2yDImCe+IiUPn1SOX3haboDK6x7G2bHkqCBdmXNSbEB8qQ1tXjOrPVuJVFh6lL31sC5C
         APfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HWygtIWBaax9xKMejUdqL907XvRbbIbFJ++8LtFRCPM=;
        b=RFbJ+MOo4pUcTAKcCzbGGjby2VSM0Ybm289sV+1riYwEg2bdNaDDXWdqkyc5scnlmP
         eQmAwRUIkW/tAzhXnSv+Kx5e95egZIXLgVuqk9nW181YeGsO10wmsK2D7fL4NBKv0KLK
         xDIbGLdP38CEntvRXCDfQPKd7+2Xc5+J/0dLiyqYikEGhesdS1j79c+TCGyYzN/CYN3j
         18ItcruEtBifjDMNSHqfW3s8EC3m0WScqFch/Y169Vf4C/ruOHvvGOJHH1TDniVkFOPS
         pqPSen1VrnS7Plbkmw/XhEXTrmPA+qvLi8WGN4gyem3n1H2ahj/Wt0xezW8g3uhPAQFP
         ppsQ==
X-Gm-Message-State: AOAM531DE7zpmFD9i+wSCUHQkCCsvwQVRBGz59ow0OT2K5bxz1Fa/eTG
        iQOcj5CDbRTCHadoMvgNDDs=
X-Google-Smtp-Source: ABdhPJyo5WDyT2lwprMsF8S6JSfvPGHlYUch6ROyXUW3mwaC72PuDgs8QSZqOEU1xTpafddGznuFMw==
X-Received: by 2002:a05:600c:8a7:: with SMTP id l39mr10158138wmp.138.1639751994168;
        Fri, 17 Dec 2021 06:39:54 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:5aaa:182f:8216:9a28? ([2a02:908:1252:fb60:5aaa:182f:8216:9a28])
        by smtp.gmail.com with ESMTPSA id l5sm8846192wrs.59.2021.12.17.06.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 06:39:53 -0800 (PST)
Subject: Re: completely rework the dma_resv semantic
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20211207123411.167006-1-christian.koenig@amd.com>
Message-ID: <e8c7284f-e18e-0dcc-f0a2-3a1ad6222fd4@gmail.com>
Date:   Fri, 17 Dec 2021 15:39:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

looks like this is going nowhere and you don't seem to have time to review.

What can we do?

Thanks,
Christian.

Am 07.12.21 um 13:33 schrieb Christian König:
> Hi Daniel,
>
> just a gentle ping that you wanted to take a look at this.
>
> Not much changed compared to the last version, only a minor bugfix in
> the dma_resv_get_singleton error handling.
>
> Regards,
> Christian.
>
>

