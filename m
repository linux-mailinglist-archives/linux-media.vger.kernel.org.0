Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7495100A7B
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 18:40:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbfKRRkE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 12:40:04 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39400 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbfKRRkD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 12:40:03 -0500
Received: by mail-oi1-f195.google.com with SMTP id v138so16095250oif.6;
        Mon, 18 Nov 2019 09:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HR5G7YllB3yBoP1VaKbqalm04pOE91aZ4flxfcWit7o=;
        b=LILAQxoWslf1mIkeLomeuOclHD4ATtNjY1Dbg58bzXaRyGy34l57P8clyVwnKjPm7a
         3crnZoiCL+dutQKz7nWmGUw2EjQDIhPfnlbmk/vY4R9xpdnBNaE+XdaXH5LB0pzkIS3h
         5ExZLYp/mQvPYkks0Az2h/hlYvZe1FJo6QmXfZAODxBGtLJMxlTncaadsSkV4DPij/Jg
         C0nAcfyVR1Vmdx7dABoK9euwNPD9g2F//238rALS72M5bXzj2Av8vFqwwJY+EbmiFnJs
         jcDjBbegA0Ew53ySGGt1KyqrCw5DfqKZQ+NpCoTQ0RdTzbihUNllK47WvVAW4QXhHoej
         Fq+Q==
X-Gm-Message-State: APjAAAXnF1ixKd8oz3/sr6e6yEL5S1fkl1qY7VIlFk2FINASX01xGrv1
        3nGm96RrTC5WdN6/QeuZUZTJJBw=
X-Google-Smtp-Source: APXvYqyNEcbuRyYTbqpR2eYVi1OEjRcS06GdZdvr3yrHT2MH88vBkjpS3CCYVVthd5u6EBAx8RzOCw==
X-Received: by 2002:aca:cdc2:: with SMTP id d185mr96054oig.35.1574098802794;
        Mon, 18 Nov 2019 09:40:02 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i11sm6444275otj.17.2019.11.18.09.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 09:40:02 -0800 (PST)
Date:   Mon, 18 Nov 2019 11:40:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
Subject: Re: [RESEND Patch v3 02/20] dt-bindings: media: cal: update binding
 example
Message-ID: <20191118174001.GA7672@bogus>
References: <20191112145347.23519-1-bparrot@ti.com>
 <20191112145347.23519-3-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112145347.23519-3-bparrot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 12 Nov 2019 08:53:29 -0600, Benoit Parrot wrote:
> Update binding example to show proper endpoint properties and linkage.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  .../devicetree/bindings/media/ti-cal.txt      | 31 ++++++++++---------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
