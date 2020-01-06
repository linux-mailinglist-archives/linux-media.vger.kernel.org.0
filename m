Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A99AC131B09
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 23:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbgAFWG5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 17:06:57 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46622 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgAFWGx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 17:06:53 -0500
Received: by mail-ot1-f66.google.com with SMTP id r9so221731otp.13
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2020 14:06:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J+PYNm7dQL8K14ScybU+6pQ9OSx67pufTIOMHAwIfCo=;
        b=nXZJf233IoeloHBZMXQ+aBj8Vjdv0OkeHi0CX9qvsUeQ54I2X3qMCiDOks8QOLrbfB
         EkLQfKBU1QnYZ5Dx6ICQu3/bA9lytd5pWdo9IcKA6RohRTQBdLA7iPtThquxPoWTLrN2
         8YSUuMQ9HKPDZ1BM8XQ6LX94ANUPpt4GEnetVYuIoxc91YFEc1AIp6U6ViwZ6PUQqC9q
         1ZT1LyqoaGYlxNsu+Hy3AQj852WrJneTaXmHdCWdFrRVTVb9wPi4Ca3tyvA5Ocufq2t7
         ywNU6Hzt8XfZLRnOyUjYYPu3kpC1WK621smay5QwOs2+p7/qIfr2zLzBVbRuBsLAhNM1
         hYLw==
X-Gm-Message-State: APjAAAX3m1IxH4o8f9iI+MBOpHntmQYngWw+glz4gxXnqPklvsUk1Em8
        Mruk0R/EkP61+/NP488hlLLDaxU=
X-Google-Smtp-Source: APXvYqxAfGl8nMUqyctaLdX0me30mYqTL0DeQUkbrKkG1YuOoByZrXyXuJDr3C3zGvGTTtVUC4A3YA==
X-Received: by 2002:a05:6830:194:: with SMTP id q20mr122368603ota.92.1578348412669;
        Mon, 06 Jan 2020 14:06:52 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id d7sm19473246otc.73.2020.01.06.14.06.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 14:06:52 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2207cd
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 16:06:49 -0600
Date:   Mon, 6 Jan 2020 16:06:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v4 08/12] dt-bindings: media: venus: Convert sdm845 to DT
 schema
Message-ID: <20200106220649.GA15045@bogus>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
 <20200106154929.4331-9-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106154929.4331-9-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon,  6 Jan 2020 17:49:25 +0200, Stanimir Varbanov wrote:
> Convert qcom,sdm845-venus Venus binding to DT schema.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../bindings/media/qcom,sdm845-venus.yaml     | 156 ++++++++++++++++++
>  1 file changed, 156 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
