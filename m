Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD2A228633E
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 18:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728720AbgJGQI4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 12:08:56 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39614 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728655AbgJGQI4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 12:08:56 -0400
Received: by mail-ot1-f67.google.com with SMTP id f10so2718372otb.6;
        Wed, 07 Oct 2020 09:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BE76KE49kn0FGOMxdjcYOjUU1JDZgDRMxDQt8Ruiufw=;
        b=lbJ80zKQf5DeY3JXJf5mNt6M6eNunL/8vdm9ZaCcwjfN5VrQ3wz4U7LNBRsHUfuYwq
         7C6cOpV83ve8AtFR7MN5AF0vK3O2oR/vO8Mo0FinYTjpjeYE1d651Atg6Chg7o1YcYDx
         ZlHL0qUHOlcbuFZd3j05AKQtfcnrIIH1w0wUrEOapdbPCLJRIdq7EWLMiwKVFt0YG0Ty
         X9GXWu9H74J0xWSBB3GNeOZ2GUJi/B0ByNzVtOsyZXmNH2BBPnxJO/ndEKZPCDABiiAS
         oNu6nH+pWPxqWiJ1PPUC5bInmYgzUzRwdtGlClxMK/Y+zJzMipsuw2nzX0MBr7uUe+5f
         YnVQ==
X-Gm-Message-State: AOAM530FdntxMi4fpBfFAxP9pimNpyY15L41jTdSQZLE9CoBjvgne45a
        iCG5iFLZI+6N+Op3gyfdaw==
X-Google-Smtp-Source: ABdhPJxW3W8G4smZPO9G3K68Fvgl/bkPtSdBgKjlWRSJX0U+DR5Szj4YTYixLaCaxSAmu/MxRvW8Lg==
X-Received: by 2002:a9d:bee:: with SMTP id 101mr2184200oth.257.1602086935407;
        Wed, 07 Oct 2020 09:08:55 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m1sm1946157otq.30.2020.10.07.09.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 09:08:53 -0700 (PDT)
Received: (nullmailer pid 309801 invoked by uid 1000);
        Wed, 07 Oct 2020 16:08:53 -0000
Date:   Wed, 7 Oct 2020 11:08:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 054/106] dt-bindings: mipi,ccs: Add vcore and vio
 supplies
Message-ID: <20201007160853.GA309749@bogus>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084505.25761-10-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007084505.25761-10-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 07 Oct 2020 11:45:05 +0300, Sakari Ailus wrote:
> Vcore and vio supplies are also part of the spec and used by many sensors.
> Do not specify the voltages as they are generally sensor dependent.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
