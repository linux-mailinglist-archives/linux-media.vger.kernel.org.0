Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40A1962AE9
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2019 23:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732538AbfGHVWp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 17:22:45 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:36548 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732476AbfGHVWp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jul 2019 17:22:45 -0400
Received: by mail-io1-f65.google.com with SMTP id o9so23001753iom.3;
        Mon, 08 Jul 2019 14:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NSE5CY3redJsm4t7pRGU3s4fZIlD2BqMxCVPQ8FSzXo=;
        b=D/xe4Xmu7wluXapCVmOlm6+5VMspwstBpNLsPgbBdEX+0LWZBV/uN6T1dd5rAGRZS5
         fLl6r9OBT3NTMWdcACrHF9KdudccabR7S8pLL8AdEBjSQFbCohgu8ZI0OrRVzmRYhzPR
         4fqE+uOkBE5o0d17FXZhc/RVqx6+g0VzTQbEecqor6iGp27Mm4Pa7BGMfNwWG9QgrDs7
         DgyGtD3STpK8G2WWVZlIaOU9ncDv89GCHG2w3dGcPo32TZ5enWyaXK8E5Vnqud1noFrk
         oJCPWHOLJNzZzWSeHuvFTDYh/TCkgOfCN/WilwFHYNDkX/AfYzFTYN8Rx7zu940904AB
         dKzA==
X-Gm-Message-State: APjAAAWko8dEqzCTY0QcHDz0aCGHwfhsLO7hoXFZAn9z4Pvyz+wJdhLF
        B7cxH/P7ADLW0NwegDZ6pQ==
X-Google-Smtp-Source: APXvYqw5qAqE/dmkwfhr3DjK0T2ya0CbXFtEj4BEP2Zcfp4mzALzm2rCnDPK754kgXQMG20+5SSkmg==
X-Received: by 2002:a5d:9643:: with SMTP id d3mr22342957ios.227.1562620964562;
        Mon, 08 Jul 2019 14:22:44 -0700 (PDT)
Received: from localhost ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id u17sm15062781iob.57.2019.07.08.14.22.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 14:22:44 -0700 (PDT)
Date:   Mon, 8 Jul 2019 15:22:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Mark Rutland <mark.rutland@arm.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: dt-bindings: rockchip: Document RK3328 VPU binding
Message-ID: <20190708212243.GA18200@bogus>
References: <VI1PR03MB4206A833FF54A3235571896CAC1F0@VI1PR03MB4206.eurprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR03MB4206A833FF54A3235571896CAC1F0@VI1PR03MB4206.eurprd03.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 29 May 2019 10:54:27 +0000, Jonas Karlman wrote:
> Update devicetree binding documentation for Rockchip VPU on RK3328.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  .../devicetree/bindings/media/rockchip-vpu.txt | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
