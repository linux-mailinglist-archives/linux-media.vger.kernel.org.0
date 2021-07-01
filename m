Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDDA3B92CF
	for <lists+linux-media@lfdr.de>; Thu,  1 Jul 2021 16:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232680AbhGAOIW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 10:08:22 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:46076 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232081AbhGAOIW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 10:08:22 -0400
Received: by mail-io1-f43.google.com with SMTP id g3so5691793iok.12;
        Thu, 01 Jul 2021 07:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=12l+gwFOyYMTn1lN9NrIjhKO4v7UDszfHZhFnLr4IRw=;
        b=pMAvrQUnQ9IyFgo0SEf88IVzM/h1YDWTLEYk+UnaJOIyBXy3zfCyO3Wh5zyoWiDeYz
         kz0KTD70YnaNFh5xxxa2s0URfcHDLjWgIV2MOPJWuAY7CzwPa1FCZHJBrd+MU6MaBSV6
         iXmCBvRkZ2RrMCSFSDqRJH9KEeW0IrzZNWD6l1DKrWM3JCqvUVtp6TWDNEXhNsNn2a00
         jC7MvRvfYMbJ6hF5VkSM/aamohH1Yvx1DhkEI9dCSif43gZs0+23Npn36u8mLkUw2BPS
         1Aw+1T2MS0Jg+Iu8/ZmDR+i3drLenM0JhqdRI1UFC9SIEk3AApP1cBarL/EZ+nRFf6eE
         yiaA==
X-Gm-Message-State: AOAM531CovKbbeu5NyQIulkH6AoKTwhv5bCakuY72Awvyyw94AZRpaUA
        rNcmSIh4PYZBQhnHofNCFg==
X-Google-Smtp-Source: ABdhPJz+cFgjPBmg3ygC4pYAqlU2H6/8DTbJ7lVjj21ahKLzD/sW25MvGii3LafQmLyw+e/ZHR3wCQ==
X-Received: by 2002:a6b:b2d6:: with SMTP id b205mr11495466iof.107.1625148351436;
        Thu, 01 Jul 2021 07:05:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id k2sm30263ili.57.2021.07.01.07.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 07:05:50 -0700 (PDT)
Received: (nullmailer pid 2284114 invoked by uid 1000);
        Thu, 01 Jul 2021 14:05:46 -0000
Date:   Thu, 1 Jul 2021 08:05:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH] dt-bindings: media: adv7180: Add missing
 video-interfaces.yaml reference
Message-ID: <20210701140546.GA2284016@robh.at.kernel.org>
References: <20210623164256.2569839-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210623164256.2569839-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 23 Jun 2021 10:42:56 -0600, Rob Herring wrote:
> The adv7180 binding is using 'bus-width' property, but doesn't document it.
> Add a reference to the video-interfaces.yaml schema to properly document it.
> 
> Fixes: 066a94e28a23 ("media: dt-bindings: media: Use graph and video-interfaces schemas")
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/adv7180.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Applied, thanks!
