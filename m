Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD76B2852AC
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 21:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbgJFTvb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 15:51:31 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43748 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgJFTvb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 15:51:31 -0400
Received: by mail-oi1-f195.google.com with SMTP id l85so13892179oih.10;
        Tue, 06 Oct 2020 12:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CC1oCWbNLI3eptGZBeolVxA9tqWKH7lLgPhxCRFWUFo=;
        b=HW/FZayyvKTMNaInMqVTdvb7uxc9mGmS8HD6Ob9Ef4jhSxeqMGCKMajgzdkJr4jRyk
         Gyoul++DBcreke8XFpsyUjjw7pP8qnSbJFf1sZHasG5OJ3b26AmGz17KZ9Bm1E41Mjlq
         gvhz8aRvVpR8NGi/N7sRfYXeM/5YlvLnEFj0ERK7wIzbbo6LDOqLDCtKE6T129gOko7c
         lelUt0Mxah/fxJGKYAnynH9IOfLmPUC7A12VXMTJ0T1lEfGoUDx8IXYr+ST7N07lCLoL
         C0ml+0zd6SaJiUfo64gQ3EmN+q1hsztf5izC8qVyuHesczbRrbYn5RQyrG33POVgtZLp
         h3Gw==
X-Gm-Message-State: AOAM530C4Ru189PIpq6WHSeXBbWQif7KI0XToNngIQEV/7iQfq8Z31fx
        sy+BNfIWXXFnRBJvPTvpHH8rwAVxygpC
X-Google-Smtp-Source: ABdhPJyqyPO5BdHkze8+kDmsvgvcSHfTPdyyXMWYeboQ56spVhC28B8WGJi6nUA3k+TqP3vPp8LJUA==
X-Received: by 2002:aca:f0a:: with SMTP id 10mr3895357oip.13.1602013889395;
        Tue, 06 Oct 2020 12:51:29 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q14sm1519857ota.41.2020.10.06.12.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 12:51:28 -0700 (PDT)
Received: (nullmailer pid 2722885 invoked by uid 1000);
        Tue, 06 Oct 2020 19:51:28 -0000
Date:   Tue, 6 Oct 2020 14:51:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH 021/100] dt-bindings: nokia,smia: Fix
 link-frequencies documentation
Message-ID: <20201006195128.GA2722833@bogus>
References: <20200930201914.31377-1-sakari.ailus@linux.intel.com>
 <20200930201914.31377-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930201914.31377-3-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 30 Sep 2020 23:19:09 +0300, Sakari Ailus wrote:
> The link-frequencies property belongs to the endpoint, not to the node
> representing the device.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../devicetree/bindings/media/i2c/nokia,smia.txt          | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
