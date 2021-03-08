Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB4C73316DF
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 20:00:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbhCHS7d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 13:59:33 -0500
Received: from mail-io1-f50.google.com ([209.85.166.50]:32810 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbhCHS7J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 13:59:09 -0500
Received: by mail-io1-f50.google.com with SMTP id n132so11147809iod.0;
        Mon, 08 Mar 2021 10:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KsA5EdC0tc8FFg4g1xLCCBciKaOXDEyn9tN1cVS6pVw=;
        b=sPB7OQzm+KfY7DxyxTVsNR+X1zKFyKPD4CBjaOYUecClB5BepcMvlBdf8+djKyi7xG
         tXEkOb06Jg1mPR32i9lReL4a5FgJHUQWEi3c50mVrqyMb4YoqqiHq4kA3tMwCHLp5AR1
         2R/yZk8pDgybixjYIWrDPbRiylPYFPf3JfV/qj/Q+HPW4HES4dCR4fq7+1UmYcW/zWYt
         cSfbu2e9qtOgnIAbIqR08rzi8i4VsdQnx31qCZzFM6diICdmZoIkzDZTroO0P33EBwVQ
         Xk9IQRYQmeqfaq7hmAqY1cdoQfDb/PjXHHH84dNz2A9ceFO07rlCppSutwqb35qyiGuO
         4xDQ==
X-Gm-Message-State: AOAM53362pllWZEGkhiDZD2OhhIXfV4CEmpjvDPAuBUF1zNDaYfCv5vb
        0SpIXanyezgOzF0cWEB/mA==
X-Google-Smtp-Source: ABdhPJyybMNLMzGm8+V4u8kf+lqJhbH8gdd7yQjuKA4we1f1NhpFak5pC2thbFLSR2Q4nvz6lalPVQ==
X-Received: by 2002:a02:c8d4:: with SMTP id q20mr24708479jao.90.1615229948593;
        Mon, 08 Mar 2021 10:59:08 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id i12sm6586718ilk.46.2021.03.08.10.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 10:59:07 -0800 (PST)
Received: (nullmailer pid 2788025 invoked by uid 1000);
        Mon, 08 Mar 2021 18:59:05 -0000
Date:   Mon, 8 Mar 2021 11:59:05 -0700
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>, od@zcrc.me
Subject: Re: [PATCH 1/2] dt-bindings: media: Document RDA5807 FM radio
 bindings
Message-ID: <20210308185905.GA2787981@robh.at.kernel.org>
References: <20210302144236.72824-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210302144236.72824-1-paul@crapouillou.net>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 02 Mar 2021 14:42:35 +0000, Paul Cercueil wrote:
> Add documentation for the devicetree bindings of the RDA5807 FM radio
> I2C chip from Unisoc.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/media/i2c/rda,rda5807.yaml       | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/rda,rda5807.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
