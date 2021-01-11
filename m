Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3092F1B96
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 17:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733033AbhAKQyz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 11:54:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732327AbhAKQyy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 11:54:54 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3489C061786;
        Mon, 11 Jan 2021 08:54:14 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id p12so8131408pju.5;
        Mon, 11 Jan 2021 08:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hxC1qJrlI0mdrHZWwzeRQSreuKvyt9lhWexionM4bvc=;
        b=jxi/iFmty57nzeTvRbSd8YTGnCoBs+nIg7Xb3rogDOUe+DisU3WnALwowVXJyKCdf9
         SNIrJFrH9wUNxjvl8JlykHbNFo0sanCK9U2HLEtAA7DTdBwUqQxwSKiUlgXKN45UKMsr
         9IJ8RVGGpE1hds+aKcovVVyMX8n7xvHYhmCwhPe+81bd3a8pxpAoP8Gob1rCTxutFvpd
         eoXQoDJToMgjgIvROkHiTPbdzzORIvC2a3a1djItlqB8kTmdHgHHkyYIxOeXq1kUf9FR
         JII7XYS6E6qz3aoERJLkAcvkj4EcYuerXOaj8lnWULRHMEhH2Edrwiw4Ul+6RdxmbQ7f
         mDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hxC1qJrlI0mdrHZWwzeRQSreuKvyt9lhWexionM4bvc=;
        b=FnJhdpwSWye1m5vvqv//KKtRfTEKfEYAwvKD5K2puSQ9MhmOCOEDS5D7YJ65XPZYyc
         hkjWGY+3RTpAgczY4UQr2qj2BWA0yAYUL0OuzpKkXsiu6dBElCZTXRB8ahX3OirHHRHz
         cOtDFDI+c3X037kPn+9rP+KWZ2mJ+aL6ANCG5Dnx4JiPkq5n7cSoJdEv//+iUzM3M2nr
         TELpcNo9NqLjP+/ChBxvgjxfhSf+5LlomjVGDEn9s3qcCCA3TETQ8CZCJJjKo3MMqBqp
         gEXBwgOCNgh23x++ia/R6o6SeVCy0ykIZMh36w+4UZ1LhUj9gg2SdrbAoygYVzlcY0t+
         795g==
X-Gm-Message-State: AOAM533BJJc1XQDcvTifcIrG+WpShtUhfffBdRuW3YYePJOECCuyAwGX
        l1w1OvpUIRHTL2Wcj768/r8A4Pslogo=
X-Google-Smtp-Source: ABdhPJxZc9BlCRH4vHrwGcRGH4A9CVXGnll08SaLUdGhIqreT6BDwqmzNHnBS8fd2Kp2yKbARF6sXg==
X-Received: by 2002:a17:90a:4689:: with SMTP id z9mr145138pjf.87.1610384053835;
        Mon, 11 Jan 2021 08:54:13 -0800 (PST)
Received: from [10.230.29.29] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x1sm272433pgj.37.2021.01.11.08.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 08:54:13 -0800 (PST)
Subject: Re: [PATCH v2 01/15] ARM: bcm: Select BRCMSTB_L2_IRQ for bcm2835
To:     Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        bcm-kernel-feedback-list@broadcom.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-media@vger.kernel.org
References: <20210111142309.193441-1-maxime@cerno.tech>
 <20210111142309.193441-2-maxime@cerno.tech>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <000a8e5b-cb97-f413-6d8b-2f5a529f7137@gmail.com>
Date:   Mon, 11 Jan 2021 08:54:10 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111142309.193441-2-maxime@cerno.tech>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/11/2021 6:22 AM, Maxime Ripard wrote:
> The BCM2711 has a number of instances of interrupt controllers handled
> by the driver behind the BRCMSTB_L2_IRQ Kconfig option (irq-brcmstb-l2).
> 
> Let's select that driver as part of the ARCH_BCM2835 Kconfig option.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Nicolas, I suppose you will be taking patches 1 and 14, 15 through the
SoC pull request, right?
-- 
Florian
