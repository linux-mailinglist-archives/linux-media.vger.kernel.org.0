Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 844933477B3
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 12:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231425AbhCXLuK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 07:50:10 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40287 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231464AbhCXLuG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 07:50:06 -0400
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lP21V-0002wN-G6
        for linux-media@vger.kernel.org; Wed, 24 Mar 2021 11:50:05 +0000
Received: by mail-wr1-f69.google.com with SMTP id n17so978117wrq.5
        for <linux-media@vger.kernel.org>; Wed, 24 Mar 2021 04:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8vgAUyfjkXnXGrfuyrB0VQ0EYt6KvIFvl6XUbm76JeI=;
        b=Ihp84JVxFZ83ua/0d0i0Six9ChYbTGVNB9UCV+unDq2Sg87qg79lcAFb98ivfecfXr
         bMq7gf0QNFV/ABFHKl4ABfAITP+6kCAAu+NPVjxRRr4V/MXeackQDt97JJ7eP4WROJGU
         +KJrHRnX+e0YzPoHTnv2AwPoWx7aQKFQn4H/Ws+LQUn9gRZKAZ7bNJWpTXg81TPg4rT4
         gV2vWLZaj2H4mBthQItOtJTvzsYS5+aOI8W3VEyqArerg65DDQOvtkHHS7lP0XZWaP/5
         FDuM3YxffMQogaCcZ2Ts3ll11TfY7vtMxqn8DjiD0BJmaXqZewCieb5rnq2ov8sUzfAA
         NxTg==
X-Gm-Message-State: AOAM532cEfZT4zrZ/udszlbAk3uDo/H61f4gwA/GsWDjVBCKhxcMBO1+
        OG4JdWanPiVaHGnF+jLDmBXO8meqpPiNyxzxgbLEVQtQtHE2R064NwygqPkjGcZw0vYgmzIRvBd
        ry1G370CCCD/CYHOFmlHQbGNk4Q0CR9kiEfjde+6r
X-Received: by 2002:adf:a59a:: with SMTP id g26mr3025818wrc.271.1616586604671;
        Wed, 24 Mar 2021 04:50:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznp6z0BFo1fOgrq13TnRHzF2nRsW6Rj43ou92jx33/+1kuozyGs/AFny5dIe9HGGV2JH5yJA==
X-Received: by 2002:adf:a59a:: with SMTP id g26mr3025805wrc.271.1616586604527;
        Wed, 24 Mar 2021 04:50:04 -0700 (PDT)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id y205sm2474131wmc.18.2021.03.24.04.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 04:50:04 -0700 (PDT)
Subject: Re: [PATCH] s3c-camif/camif-core.h: fix kernel-doc warnings
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>
References: <6d45dc10-0b14-1593-e88d-8e5ac9750586@xs4all.nl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9d67ce9e-7943-3c36-9cd7-dbcf1caf4ee2@canonical.com>
Date:   Wed, 24 Mar 2021 12:50:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6d45dc10-0b14-1593-e88d-8e5ac9750586@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/03/2021 09:26, Hans Verkuil wrote:
> Fixes these warnings:
> 
> drivers/media/platform/s3c-camif/camif-core.h:156: warning: Function parameter or member 'pix_limits' not described in 's3c_camif_variant'
> drivers/media/platform/s3c-camif/camif-core.h:156: warning: Function parameter or member 'has_img_effect' not described in 's3c_camif_variant'
> drivers/media/platform/s3c-camif/camif-core.h:156: warning: Function parameter or member 'vp_offset' not described in 's3c_camif_variant'
> drivers/media/platform/s3c-camif/camif-core.h:232: warning: Function parameter or member 'vdev' not described in 'camif_vp'
> drivers/media/platform/s3c-camif/camif-core.h:232: warning: Function parameter or member 'vb_queue' not described in 'camif_vp'
> drivers/media/platform/s3c-camif/camif-core.h:232: warning: Function parameter or member 'offset' not described in 'camif_vp'
> drivers/media/platform/s3c-camif/camif-core.h:297: warning: Function parameter or member 'ctrl_test_pattern' not described in 'camif_dev'
> drivers/media/platform/s3c-camif/camif-core.h:297: warning: Function parameter or member 'ctrl_colorfx' not described in 'camif_dev'
> drivers/media/platform/s3c-camif/camif-core.h:297: warning: Function parameter or member 'ctrl_colorfx_cbcr' not described in 'camif_dev'
> drivers/media/platform/s3c-camif/camif-core.h:297: warning: Function parameter or member 'colorfx' not described in 'camif_dev'
> drivers/media/platform/s3c-camif/camif-core.h:297: warning: Function parameter or member 'colorfx_cb' not described in 'camif_dev'
> drivers/media/platform/s3c-camif/camif-core.h:297: warning: Function parameter or member 'colorfx_cr' not described in 'camif_dev'
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
