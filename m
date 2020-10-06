Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9461B2852AE
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 21:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbgJFTwU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 15:52:20 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40111 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgJFTwU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 15:52:20 -0400
Received: by mail-ot1-f65.google.com with SMTP id l4so9973503ota.7;
        Tue, 06 Oct 2020 12:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u2DfVGrA7Dca40TUTO1SF4Q2ibwiYm1KGNVrbJKCLVU=;
        b=oZ7r8OQ4iT9V2bkRIV6znSLC4/e/G2DjqC6uYTkYSe1L19aIrdTQSFzRaVocvExs81
         BI7+x/xghf+L8gjXIDC0xCPV8SRrrAhZBJfAH8H9Ts00sK/GXS1GeGYpvHgm7THe+M4Q
         +frQwtcK+x42e8sJI9kpeaU1sFJDy6ddHUyQlmVojVMJtF4tYHepPTjuqapJd0+aEka0
         GILwztACiA8kebCag6T6jOg+DLlUlBDIFlUdxRrQyB0FtYAdv7FuezwOfIWOTh215ctX
         gftL8w1AxZkx1ub/EDTzvmc88nRtmXkIhDieKJwI2HvWgMQ54m+E1X7Y+6sQhmsRDT+F
         UMdQ==
X-Gm-Message-State: AOAM533bhOsYJI8WbLy3ymRudgsibIWRL1VxCfCGeDd56aGIgVpVMk+b
        v+dyD/FZDYvCI9zT3N/dJw==
X-Google-Smtp-Source: ABdhPJzGQIy4X6H1CGbCwU3C1cjgolXerS1OKlHcl6Prk819PDSOcpvYSgtUXU42ck0OJmAXN+gv5w==
X-Received: by 2002:a05:6830:ca:: with SMTP id x10mr3731263oto.344.1602013939744;
        Tue, 06 Oct 2020 12:52:19 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n23sm1602402oon.14.2020.10.06.12.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 12:52:19 -0700 (PDT)
Received: (nullmailer pid 2724375 invoked by uid 1000);
        Tue, 06 Oct 2020 19:52:18 -0000
Date:   Tue, 6 Oct 2020 14:52:18 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH 022/100] dt-bindings: nokia,smia: Make vana-supply
 optional
Message-ID: <20201006195218.GA2724298@bogus>
References: <20200930201914.31377-1-sakari.ailus@linux.intel.com>
 <20200930201914.31377-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930201914.31377-4-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 30 Sep 2020 23:19:10 +0300, Sakari Ailus wrote:
> vana-supply is optional in the spec, therefore make it optional in
> bindings, too.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/nokia,smia.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
