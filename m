Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E795427D326
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 17:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728623AbgI2PwE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 11:52:04 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:43477 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728401AbgI2PwE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 11:52:04 -0400
Received: by mail-oo1-f67.google.com with SMTP id w25so1394555oos.10;
        Tue, 29 Sep 2020 08:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MhoFV9ElUshrcZczyvzu0eUgcLqJJOPkpBHv4bhmpeI=;
        b=RdsZrJzgENJ6Di1b0UM5oDw/IO41zWDh5yiJTVCS5+Z+Zm1rxZ2qHJLiA/Gq1MOdkW
         i6bUbusZksqV7s9voEhltvbRmh5ww+Oqx5rGEh/bZVJ08mG9xSJ9v/o+3qizMc+x0gHO
         m4SEq/YNNoNlI6NASKl2l/X1GqaF35zUFYZJTnXRnKiRVa4XuObyyvzmM/f4G/6VhcQc
         BwUKsQiAKkC9PVD/l2m0c787pJt9zGvMIsJdIWytudgaQ3LMczDJiqnThmPpWjm9OK16
         iq8GBpoiLSgXwuYGyrE4k66d1cNZp4h5p21j5hNpwd14HwfK2L0kX6SnJaSW3WeSXLTf
         kaNg==
X-Gm-Message-State: AOAM533ZJ2deEeNSYztqwdZywo4et0kiidEnWfEar13PBE7l6nx8jFfe
        UJorON87WB0v3cSb+Fye2A==
X-Google-Smtp-Source: ABdhPJwuG3Ld+elk2b1227zUoNomM14opr/hmEQ0EAWgc/iigZJuNC67UKZmjHIr3zDq+pDM9upmtA==
X-Received: by 2002:a4a:c541:: with SMTP id j1mr5123201ooq.13.1601394722536;
        Tue, 29 Sep 2020 08:52:02 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l136sm1071824oig.7.2020.09.29.08.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 08:52:02 -0700 (PDT)
Received: (nullmailer pid 668050 invoked by uid 1000);
        Tue, 29 Sep 2020 15:52:01 -0000
Date:   Tue, 29 Sep 2020 10:52:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     Joakim Zhang <qiangqing.zhang@nxp.com>
Cc:     mchehab@kernel.org, sean@mess.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-imx@nxp.com
Subject: Re: [PATCH V3 1/2] bindings: media: gpio-ir-receiver: add
 linux,autosuspend-period property
Message-ID: <20200929155201.GA665464@bogus>
References: <20200922190807.6830-1-qiangqing.zhang@nxp.com>
 <20200922190807.6830-2-qiangqing.zhang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922190807.6830-2-qiangqing.zhang@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 23, 2020 at 03:08:06AM +0800, Joakim Zhang wrote:
> Add linux,autosuspend-period property for gpio ir receiver. Some cpuidle
> systems wake from idle may take a bit long time, for such case, need
> disable cpuidle temporarily.
> 
> Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
> ---
> ChangeLogs:
> V1->V2:
> 	* New add.
> V2->V3:
> 	* linux,autosuspend-period = 125; -> linux,autosuspend-period = <125>;
> ---
>  Documentation/devicetree/bindings/media/gpio-ir-receiver.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt b/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
> index 58261fb7b408..e1447c9b0e26 100644
> --- a/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
> +++ b/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
> @@ -7,6 +7,8 @@ Required properties:
>  Optional properties:
>  	- linux,rc-map-name: see rc.txt file in the same
>  	  directory.
> +        - linux,autosuspend-period: autosuspend delay time,
> +          the unit is milisecond.

What makes this linux specific?
