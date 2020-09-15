Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3350226AE74
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 22:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgIOUJj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 16:09:39 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:45391 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727974AbgIOUJY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 16:09:24 -0400
Received: by mail-il1-f194.google.com with SMTP id h2so4205083ilo.12;
        Tue, 15 Sep 2020 13:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GL/iK4MMxOGKPng6kGRfPodjPoZgx0Aw08KCPQqP2Ew=;
        b=gjeBNLTcyNjM/7hvBM5dFtm+ZZ7kHlfQLdukqS9BiHtRAwA8Wbq+WP30DbvuloNv0D
         J/GvtqrwMMoFdG+IpCscSLx2uLzoqJIbddfa1XRxbayxUwgBWJrHtosctBRPtp7PuXJD
         EdpRpLnk4YHL0oPGyN4b7uLmPosWMMfZ7n5xFQaejmWElxNFZ1EQwsnAgPnblfXKaE+N
         dcc5ZpVXmVjuJ97Ls20el8cCRlq6uLjlrbZzRDghllr9jyVeYHvWgmLaZs8VUG4j5t4c
         cLhgGWUwr6/yoVfxIfyWZ07sdyKt67ipCa9Gj2PGPMTv31uE27UbtB744dMpLt50GsFh
         Pa4g==
X-Gm-Message-State: AOAM533VduITX/odA2pqgd19kRpmrfW6hHRrsrm/6SsbQxpLiDlr0H6F
        CJFoDE54QWQ8pqaKz+AH8w==
X-Google-Smtp-Source: ABdhPJwDVmKRQX1j5N0ydnm0jVfsW7t1F2Qhq77u6C7ELsMay9xSw6z8OQxtJP7aqF+7U8nk0Xl/BA==
X-Received: by 2002:a05:6e02:8f:: with SMTP id l15mr4915421ilm.119.1600200562480;
        Tue, 15 Sep 2020 13:09:22 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id m5sm328662ilc.79.2020.09.15.13.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 13:09:21 -0700 (PDT)
Received: (nullmailer pid 2423588 invoked by uid 1000);
        Tue, 15 Sep 2020 20:09:20 -0000
Date:   Tue, 15 Sep 2020 14:09:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v5] dt-bindings: media: mt9v111: Convert to json-schema
Message-ID: <20200915200920.GA2423555@bogus>
References: <20200910161949.613922-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910161949.613922-1-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 10 Sep 2020 18:19:49 +0200, Jacopo Mondi wrote:
> Convert the mt9v111 bindings document to json-schema and update
> the MAINTAINERS file accordingly.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> v4->v5:
> - No changes, sent separately as other patches in the series have been
>   under discussion while I think this one could be collected as is.
> 
> ---
>  .../bindings/media/i2c/aptina,mt9v111.txt     | 46 ------------
>  .../bindings/media/i2c/aptina,mt9v111.yaml    | 75 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 76 insertions(+), 47 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
