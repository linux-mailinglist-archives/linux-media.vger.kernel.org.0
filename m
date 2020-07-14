Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1849321E5DB
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 04:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgGNCpQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 22:45:16 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:33695 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgGNCpP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 22:45:15 -0400
Received: by mail-io1-f68.google.com with SMTP id d18so15793735ion.0;
        Mon, 13 Jul 2020 19:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=s7/p0LKnwYztNP3yOyVMCmJC/s32uIp93cOd4bT8YX0=;
        b=D6ZHextqPjOP+2wMsTYsLaGqc8dzeeHh+7ztg9wrtwg5xUTe6tVWEUS1vj1uvy1ZTW
         xSBe8ZQCtYfeZNSxwPpNkMDSo5sZ8LDn+uS2Vg8HLuXSE1+XkJfiT2zBatZxDdMoDPwz
         KPDDh1kBXWj5YOrxfTaXHcmTbTO0Kq9zgTzz01koEhD+2eg2z2LsnpufIiwVpXpcEmrv
         fWu9tN8XwQOStcCpCY11bGB31M5nHhDZXrXfp642JDUQKg5YjZHa4G5oUUAry/67D1rF
         78o0AggzJsCs98KfQt75dj1SPCjEndoYzh6DQ76LwUDPdD1vrws8AbPUMcXvMNHBwY7/
         N7wA==
X-Gm-Message-State: AOAM530BhLZKEl3EfcefUQ7uXfnLHbkWLvENio7Ufrzu16r3GUzW0Ie2
        wDwWWQ8vwwthDFipRkz6SA==
X-Google-Smtp-Source: ABdhPJyx8UdIhIEKvxzTLlJNVLkJWx6cbMd1XvZ0aLeHH8iTfpfkEERxAxkFXceQErzACPH/C0jATg==
X-Received: by 2002:a5d:9699:: with SMTP id m25mr2884313ion.74.1594694714687;
        Mon, 13 Jul 2020 19:45:14 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id i12sm4158331ioi.48.2020.07.13.19.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 19:45:13 -0700 (PDT)
Received: (nullmailer pid 1181804 invoked by uid 1000);
        Tue, 14 Jul 2020 02:45:12 -0000
Date:   Mon, 13 Jul 2020 20:45:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2.1 1/8] dt-bindings: media: renesas, fcp: Convert
 binding to YAML
Message-ID: <20200714024512.GA1181735@bogus>
References: <20200701060349.GE5963@pendragon.ideasonboard.com>
 <20200701060525.9748-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200701060525.9748-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 01 Jul 2020 09:05:25 +0300, Laurent Pinchart wrote:
> Convert the Renesas R-Car FCP text binding to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> Changes since v2:
> 
> - Refer to the correct device in the comment above the example
> 
> Changes since v1:
> 
> - Simplify comments on compatible strings
> - Update MAINTAINERS
> ---
>  .../devicetree/bindings/media/renesas,fcp.txt | 34 -----------
>  .../bindings/media/renesas,fcp.yaml           | 56 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 57 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
