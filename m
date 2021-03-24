Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD162347D4D
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 17:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232618AbhCXQIk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 12:08:40 -0400
Received: from mail-il1-f181.google.com ([209.85.166.181]:39861 "EHLO
        mail-il1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236983AbhCXQIU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 12:08:20 -0400
Received: by mail-il1-f181.google.com with SMTP id y17so10210737ila.6;
        Wed, 24 Mar 2021 09:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PWntTBdilFIzzODO+pt1+y7ZLxwm8UdrhZilDI7MhbM=;
        b=RsylS3/+J3dqCOkyxpyrnfSInZ5m54ERC3MHHmyL5kXB0VXs6nLiaSrFgTT8dhNgXZ
         MKSIzw1jYzB3OnE808wLDk5BxS5eshSzEV9HbcjxzqTnH2fhBfMhpNmNntJ2ZomF0Rtf
         /L0qb/mLpomdNTUvLB5O8q12FrWkrXBKoJB4RB0f2bCkUfCIjbmGplADweQg6Q07hxu5
         EXHRcm8rtpOqtDaGlkANwxGK6V4oRubjtQdOJw1Ef4oNIhXQ7E3P4AhMaI+hxEnONk/t
         mEUYn9cPl/GZAUsw9gpoeNJUhFE21ILuAbW6GFLcLd91xG6wqX7P3uIbWGtQPZvqRx+6
         Irbg==
X-Gm-Message-State: AOAM531tpFnO7WCRNgpf1bGSvDxniVmd1uPs9cQ96I/hd+djoLWIIZBa
        QIKOb8h3rA78vAPU5PrrVw==
X-Google-Smtp-Source: ABdhPJwXYzr2SeXJETpB0NvzNDWK4dZlYzXRGp9sfapQb3Ru9eyQKePhu3/YFI1mvc14GIpZGl0iuw==
X-Received: by 2002:a92:6e0e:: with SMTP id j14mr3219584ilc.90.1616602100220;
        Wed, 24 Mar 2021 09:08:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id c9sm1355159ili.34.2021.03.24.09.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:08:19 -0700 (PDT)
Received: (nullmailer pid 3162937 invoked by uid 1000);
        Wed, 24 Mar 2021 16:08:17 -0000
Date:   Wed, 24 Mar 2021 10:08:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: media: renesas,vin: Add r8a77961 support
Message-ID: <20210324160817.GA3162802@robh.at.kernel.org>
References: <20210312130330.1742445-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312130330.1742445-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 12 Mar 2021 14:03:30 +0100, Niklas Söderlund wrote:
> Add the compatible string for M3-W+ (r8a77961) to the list of supported
> SoCs.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
