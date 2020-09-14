Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 643BC2694DB
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 20:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgINS3A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 14:29:00 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:36474 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgINS2A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 14:28:00 -0400
Received: by mail-io1-f66.google.com with SMTP id d190so1191766iof.3;
        Mon, 14 Sep 2020 11:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l4g5OoxxF+9yzxAjLMDaIDUd18eI2/a5ro5lS6ONqCw=;
        b=UeZSKtY+bGKRKFz5J4s5eJx56xgyMQOEQbaw0h+wCH0zuZVU2TxcnLIzMeV9Oap5YH
         HpifrOxuU01GC84JwfHtJJ4UIvAGBbAqQV31qGALK45OfoFMikYxvVbknIT/1DXBl+KM
         LMCXuxPhI0a1jZFtuJ976DGsvvt3hJiLvEhzR11tAPDq8D/wAPyBlZsk1uyk6aht4Bf/
         RAfqi3CZfM7ypXteo8FGEkdf63cl8S7ejN71VLTIwa6oJI1iq8czBo1OUHGHS4phLguz
         UhYNlKLPlsCBp/tZYqwFh/V6+Cz7tk9rvZKiM6wDI3E35Ft60UjNVga6U4gWiFkfbDDM
         L9XA==
X-Gm-Message-State: AOAM530LfVkC61zGYIr2cCuCCDFvbma3zreYju6JSa6z4qOquhdLeEYi
        h2DXYYURqzyqdpYdC4H6Sg==
X-Google-Smtp-Source: ABdhPJwKld0xWWDnzmcZqPeA5m4c/eQUKyHKzBrV0bXyq635hMGM20j5yM+z0ilMPdD7q+8DX7cymg==
X-Received: by 2002:a05:6602:2201:: with SMTP id n1mr12091795ion.35.1600108079647;
        Mon, 14 Sep 2020 11:27:59 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id r11sm7363906ilt.76.2020.09.14.11.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 11:27:59 -0700 (PDT)
Received: (nullmailer pid 4191074 invoked by uid 1000);
        Mon, 14 Sep 2020 18:27:57 -0000
Date:   Mon, 14 Sep 2020 12:27:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Santiago Hormazabal <santiagohssl@gmail.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add KT Micro
Message-ID: <20200914182757.GA4191021@bogus>
References: <20200831220601.20794-1-santiagohssl@gmail.com>
 <20200831220601.20794-2-santiagohssl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200831220601.20794-2-santiagohssl@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 31 Aug 2020 19:05:59 -0300, Santiago Hormazabal wrote:
> Adds ktm as the prefix of KT Micro, Inc.
> 
> Signed-off-by: Santiago Hormazabal <santiagohssl@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
