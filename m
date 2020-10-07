Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20A582863D5
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 18:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727970AbgJGQYb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 12:24:31 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41883 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727665AbgJGQYb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 12:24:31 -0400
Received: by mail-oi1-f196.google.com with SMTP id q136so1884039oic.8;
        Wed, 07 Oct 2020 09:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jq+tHvWM4iiywqLkK7TAv1q3AynzqI/YYhTbvpw+D9o=;
        b=i4xJ+L4u0kWkKd6mK44KdAucG+g/0jurDmsrrljfo7CSdg0urPsN5MOJmj3y1Uc2Mo
         vsSwe9XrIDNsXXjvVHGd+NlkkJ0pe4n0jA1bJj4pim1uBsri9UL6K/mnhq2373Jg5dym
         fkz51EmTF4rG0bzSjm6vb/C8EJHX2zJgpMN3y+KFAngr/a4DKOaUPcbYr0Gysx8dQ1CV
         Mqjus2O7yP5E/H3C332ABDe+oQdSAhP6NEYMK1GiNIysALCT7A+Dop5c3a9EOY0mF/mg
         TdVfYPKjoDFtcdpi8ACdn2oCJ4LQAFUtcmUICbnBHTxOOiKX7Jc+WWeJVGqVXRFd2iVa
         iN3g==
X-Gm-Message-State: AOAM533tycdTPbjueKvabe8AxODtT6Q5P8G4A28wNvc9bS4IEBOSbhHc
        lxm+ctLiWZ4R5K1Udocung==
X-Google-Smtp-Source: ABdhPJyicFosZDh1zhwZcCv6cf4eAx0ILfiaizgARQNA1hWO69Yr9Y1+7jbHssl3A0Gu0RmVqi5DSg==
X-Received: by 2002:aca:aa8d:: with SMTP id t135mr2323433oie.76.1602087870268;
        Wed, 07 Oct 2020 09:24:30 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 15sm1915071ooy.36.2020.10.07.09.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 09:24:29 -0700 (PDT)
Received: (nullmailer pid 330687 invoked by uid 1000);
        Wed, 07 Oct 2020 16:24:29 -0000
Date:   Wed, 7 Oct 2020 11:24:29 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 026/106] dt-bindings: mipi-ccs: Add bus-type for C-PHY
 support
Message-ID: <20201007162429.GA330627@bogus>
References: <20201007135225.GA125839@bogus>
 <20201007144937.27609-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007144937.27609-1-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 07 Oct 2020 17:49:37 +0300, Sakari Ailus wrote:
> The bus-type property is required for C-PHY support. Add it, including
> values for CCP2 and CSI-2 D-PHY.
> 
> Also require the bus-type property. Effectively all new sensors are MIPI
> D-PHY or C-PHY that cannot be told apart without the bus-type property.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../devicetree/bindings/media/i2c/mipi-ccs.yaml          | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
