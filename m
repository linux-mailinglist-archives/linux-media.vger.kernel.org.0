Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1C6286338
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 18:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728948AbgJGQHo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 12:07:44 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46565 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgJGQHo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 12:07:44 -0400
Received: by mail-oi1-f195.google.com with SMTP id u126so2936001oif.13;
        Wed, 07 Oct 2020 09:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5ifK7dZcuC3mI6fP7nhFwpOaO1IsCVRhcG2IzlT/Ifg=;
        b=KWbNqeLK6K1b8gfQVLbDmkTM96TM+l2U1u7Thh/Xcsy5QQJIsw/SKJnbosEHT45nt8
         0vnczAkcvkyR3/272lIvNAvYZlB71VhZBgksEqHnbMN72QuOUlTXaxM51d5c0YsQeWWj
         i9BaPGXd+JLYPcwgebAGUzugfukWx5kruZbke3SZjjTpnvTVmdMqS6hBERKm3JKWqQUC
         /zKWpZqULLSTMFV/wA7wVVvEjzGaN+/u49r7lQxspPtxg8D+2xJ4GWBp5vn4UQEl+/7p
         4FJeuPlu7H46ZuEMOQJNIWnIt1PE4qWPtqZM8YRm/uRJK7KHDwDAMTcDm1kCfMnc8jBB
         Y/8Q==
X-Gm-Message-State: AOAM5305mUKtiHFlF/h9V5AIRAksYJvZE063Pgf7FY1SuWHYqKTEfO48
        52hyVV0SUUVZT88HAFD34F4x5qNWJUPl
X-Google-Smtp-Source: ABdhPJxcIGceVljG/6BHoZN6bQvWsD9X8UnyfX8Vvxv/u73D53BE0omChGVs96rnEEcTCqT/Apa4rQ==
X-Received: by 2002:a05:6808:1c8:: with SMTP id x8mr2459569oic.100.1602086863771;
        Wed, 07 Oct 2020 09:07:43 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k128sm2226747oib.52.2020.10.07.09.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 09:07:43 -0700 (PDT)
Received: (nullmailer pid 308124 invoked by uid 1000);
        Wed, 07 Oct 2020 16:07:42 -0000
Date:   Wed, 7 Oct 2020 11:07:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 053/106] dt-bindings: mipi,ccs: Don't mention vana
 voltage
Message-ID: <20201007160742.GA308073@bogus>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084505.25761-9-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007084505.25761-9-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 07 Oct 2020 11:45:04 +0300, Sakari Ailus wrote:
> It was mentioned vana voltage is typically 2,8 volts. This is truly sensor
> dependent, and nowadays 2,8 volts is a lot.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
