Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF47A2852BF
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 21:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbgJFT6o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 15:58:44 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36124 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgJFT6n (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 15:58:43 -0400
Received: by mail-ot1-f67.google.com with SMTP id 60so13474515otw.3;
        Tue, 06 Oct 2020 12:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vbQIfPMKQTQ0AiYLX3yRVyo+SXBUMBbhxIwSLgb6i0Y=;
        b=myG4e7Ck0MMrOQZcWjpNVKZTEapowMCV1o3yU6h4kfey3+VB4bkjgrpthwR9eCNvl8
         A37hfFGGQiGdHX2+nbeYuRWrD56HGmjWWMi5n+P+5E2lg7/Z42PTVaNKqWZ1FA+sSMvQ
         muWUT5s5PCTKUin607Ec5hOVTbHoOCFuf/7EsRmBNC3jAXEZ+KS7c2bZtYTNgvMFTgTh
         sUhcmJbhi1cwYfmoyDwDDsyaUVGmBaT/607CrpA6xG5Dy4az+vcK2G/XUq/r50JiuNk6
         ptd6BrEjTIAcOS8rYlhkBV3s66Y3EdQRyfRvyFXk2tZUkiOuCuhjEbwWmq0XeeMa9iGt
         gzLw==
X-Gm-Message-State: AOAM5309ibi3Eio9bt+npneGawUgc0etPwdMH6F6+gS5jrhO0rI5SHDg
        i6eeu4fF3RfLFIrDcptJRF2fKukxub9m
X-Google-Smtp-Source: ABdhPJwyL/osF1k0AcDmkliXNpWpMn6TXT4PG2EpLtvyome3A3gETbskuH5LomRYogI47LyMnCu/oA==
X-Received: by 2002:a9d:798d:: with SMTP id h13mr3802209otm.298.1602014322960;
        Tue, 06 Oct 2020 12:58:42 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v18sm409352ooq.11.2020.10.06.12.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 12:58:42 -0700 (PDT)
Received: (nullmailer pid 2734218 invoked by uid 1000);
        Tue, 06 Oct 2020 19:58:41 -0000
Date:   Tue, 6 Oct 2020 14:58:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH 024/100] dt-bindings: nokia,smia: Use better
 active polarity for reset
Message-ID: <20201006195841.GA2734188@bogus>
References: <20200930201914.31377-1-sakari.ailus@linux.intel.com>
 <20200930201914.31377-6-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930201914.31377-6-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 30 Sep 2020 23:19:12 +0300, Sakari Ailus wrote:
> Generally reset signal is active low on camera sensors. The example had it
> high. Make it low, and use GPIO_ACTIVE_LOW in gpio.h for that.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
