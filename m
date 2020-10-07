Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0F78286336
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 18:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728628AbgJGQHT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 12:07:19 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37990 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgJGQHT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 12:07:19 -0400
Received: by mail-oi1-f195.google.com with SMTP id 26so2999552ois.5;
        Wed, 07 Oct 2020 09:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BRJSxaggUs34aB9MywsbfLd39KYNHoWc2IyHcSMwN8E=;
        b=FR8skTX25I8v/VfyScdw8WSztdqNpNvgb0p6eWxGuhGJaA/Z4lxhsSfoyk6Jvbg3PC
         +BKcuNwCn5CVOy5y14+5MS5W/xU9+aiFDFtdciNfqd9P4oQo7rKICAwPcUnz/i0Xy8ut
         exwtLtRhZ9huElEcu7mYCYPyk7FNj3t8zufJAAT9zzd9cFZJlhJTNMwJAYwB0e156izR
         phmMvYjvMq87g6/Ib+DC4ahXxmGNSS+B2i+YQfd5ylfLbRSuQ/1T82vpjjbY/r2oNS/8
         4/ooK8jvGRgFIIqN4Xl1ibkA8TboeRYxL+oeQoGfUAtvEOUGHGSrW5VKvoosVArxPZWH
         fPkw==
X-Gm-Message-State: AOAM5328R5wXfVadqrZHOpPlYVQ+WsTBBzL5g+NkEBOIew1tvPJu8u8X
        yn5g7uEpUejTUpGfZ2WX6w==
X-Google-Smtp-Source: ABdhPJzOTGdVSlrPVXB3ZBkRrTFNKoVN3Wn0u0yHx43Yt223RdY7U7ITrOpeulaltzmh53uC2lec7g==
X-Received: by 2002:aca:c797:: with SMTP id x145mr2314025oif.162.1602086836859;
        Wed, 07 Oct 2020 09:07:16 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h15sm2459425ooe.42.2020.10.07.09.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 09:07:16 -0700 (PDT)
Received: (nullmailer pid 307411 invoked by uid 1000);
        Wed, 07 Oct 2020 16:07:15 -0000
Date:   Wed, 7 Oct 2020 11:07:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 025/106] dt-bindings: nokia,smia: Amend SMIA bindings
 with MIPI CCS support
Message-ID: <20201007160715.GA307359@bogus>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084505.25761-7-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007084505.25761-7-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 07 Oct 2020 11:45:02 +0300, Sakari Ailus wrote:
> Amend the existing SMIA bindings by adding MIPI CCS support, with separate
> compatible strings for CCS 1.0 and CCS 1.1. Rename the old bindings
> accordingly as CCS is the current standard.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../i2c/{nokia,smia.yaml => mipi-ccs.yaml}    | 23 ++++++++++++++-----
>  MAINTAINERS                                   |  2 +-
>  2 files changed, 18 insertions(+), 7 deletions(-)
>  rename Documentation/devicetree/bindings/media/i2c/{nokia,smia.yaml => mipi-ccs.yaml} (81%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
