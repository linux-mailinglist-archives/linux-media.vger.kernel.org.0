Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1322F5C51
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 09:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727373AbhANIV1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 03:21:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbhANIVY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 03:21:24 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3428FC061575;
        Thu, 14 Jan 2021 00:20:44 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id x20so6784391lfe.12;
        Thu, 14 Jan 2021 00:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3nBcH17u4wRamAJ7uMUZUGqlgSjiRmAWW0nH78rAfnc=;
        b=ovEie4gzrZBF/T8jC/PT19rGl0IpqmmOcZPDHabyd+MGIwXid951DJQjUd/QCFH3GF
         BSIXJ4d0nJRBNJVo6emoEzcnFSzZuKfjrcDN2ykv5W9RLcvjFNfbbJi8wDQzGPfCz4Bz
         7as6y+Aji4rJPitUlIoNIHSmWHtqu64YrJUj4X7DdYZoGsXDkOMLJ6b3QTf2J6RQQ09k
         uKwAQ16DmSXdfhnWraBTu2hC3ZYqVnyRzTAXmxltwJd8YJzYKOKwURfWDNevGYwgfSaL
         ss26zihDVk3PE121xHDPmvasPUdFe0fTEDezehFOPIfiPpQvRx+51WWa8/FOtS5wuxcb
         krYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=3nBcH17u4wRamAJ7uMUZUGqlgSjiRmAWW0nH78rAfnc=;
        b=Nuu4RLugHtyP2G17GqFs/kS27LgvBN44HQuuQxHTeOeFr162q7W6G0Ie7I+uDMQe/w
         JfYNc/P64oasJuaG1AzmG8EFSlQ9Tw3LmpuEqQj8vgzeLunLyveHU/wFzjXzxCc0KotH
         GlsbmG9dD6AowOUyDm4oKiOpx1QXyoAhJWep+vm/gZ+vEwvhqPlgZoUB1B0lW/KCwpWf
         +89TAhPf3fakpnSJvABa8VVZTieEpx7848ft8y4/bnAjKQiwBb1hFMKxZzr/3izIv3ta
         o/oed6U/TPM/E/w4ile9bTe7+/iJBZjrk5Av8QXFyamkFeLAVyExmC2YYNsfPezgSPGu
         cBUg==
X-Gm-Message-State: AOAM5300MIvPMeX1k9zoDw8MpB9ZpaQnQwOHIBaQDslk1lfewTb+Go9B
        m4XfvwIjXJUmp3ijtjE7szE=
X-Google-Smtp-Source: ABdhPJwKSJEcRknnP+y9jsGT0h2EP3cC4Glv4jOtT3xYilx0cp1Sf+sbgEmv53OZYAPoglkcFOqrJw==
X-Received: by 2002:a19:747:: with SMTP id 68mr2645596lfh.408.1610612442737;
        Thu, 14 Jan 2021 00:20:42 -0800 (PST)
Received: from [192.168.1.100] ([178.176.79.115])
        by smtp.gmail.com with ESMTPSA id k25sm472627lfm.236.2021.01.14.00.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jan 2021 00:20:42 -0800 (PST)
Subject: Re: [PATCH v7 4/7] dt-bindings: media: max9286: Document
 'maxim,reverse-channel-microvolt'
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210113185506.119808-1-jacopo+renesas@jmondi.org>
 <20210113185506.119808-5-jacopo+renesas@jmondi.org>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <46b966bb-e276-29c4-bcd8-091cb65a81bf@gmail.com>
Date:   Thu, 14 Jan 2021 11:20:28 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210113185506.119808-5-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello!

On 13.01.2021 21:55, Jacopo Mondi wrote:

> Document the 'reverse-channel-microvolt' vendor property in the

    Where is "maxim,"?

> bindings document of the max9286 driver.
> 
> The newly introduced property allows to specifying the initial

    Specify?

> configuration of the GMSL reverse control channel to accommodate
> remote serializers pre-programmed with the high threshold power
> supply noise immunity enabled.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
[...]

MBR, Sergei
