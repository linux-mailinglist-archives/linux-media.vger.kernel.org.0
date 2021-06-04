Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6746F39C18B
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 22:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbhFDUqm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 16:46:42 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:35398 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbhFDUqm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 16:46:42 -0400
Received: by mail-oi1-f175.google.com with SMTP id v22so11023237oic.2;
        Fri, 04 Jun 2021 13:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/OM/wB6G0TcYiKxi3lHOYFVJpevT4bpYNZzrcyD4Qfo=;
        b=mtu5Fdm9C66juE0zIyZ+JULiXsIiDGLteu3ERSlOxNjJNP3FgV/QWeCKwAIlM0to+1
         3tQHp6XyU0rKhNyLOfrgPRB/HxJkW6kt79r8f0jIkuM6cGKi9PgiEVQRgXAi78BHoEp8
         u2cpAvEK8pDfsJn4FFFDKBuGuC9b1Zg4niFoewgkEoTd1hbnzuQI8rCf8ug7lZrsjIez
         xXu6o3vYgX0m+QMbNqsUzeyX5/pV0mAO+pcIBkYeJVUmEQ6y52rZOQCxtwaW2LtDPmpJ
         KD9p3di78ZPPXvLhiYtb54Zb9XLKphAvzm9kRRJDPplu0OMD3dtONwqCAuOf+IUjMldy
         S0Bg==
X-Gm-Message-State: AOAM532YKzGUw8CPMD45bGAW33yQai/yJg1zX/gFTBRRT8orDsqOcUHd
        3SQEWAfDMLVLZEkUYwCGyQ==
X-Google-Smtp-Source: ABdhPJx6Vi4fyJQ/2XM1k6LY9+2IiKO8TUuRqcHHUDu8/kg9JqjdV75l1sYPJvvEJMxfbHyrMzshqA==
X-Received: by 2002:a05:6808:992:: with SMTP id a18mr4087354oic.129.1622839495165;
        Fri, 04 Jun 2021 13:44:55 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l20sm647797oop.3.2021.06.04.13.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 13:44:54 -0700 (PDT)
Received: (nullmailer pid 3883662 invoked by uid 1000);
        Fri, 04 Jun 2021 20:44:52 -0000
Date:   Fri, 4 Jun 2021 15:44:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Alex Bee <knaerzche@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-rockchip@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 02/12] dt-bindings: media: rockchip-vpu: add new
 compatibles
Message-ID: <20210604204452.GA3883628@robh.at.kernel.org>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210527154455.358869-1-knaerzche@gmail.com>
 <20210527154455.358869-3-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527154455.358869-3-knaerzche@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 27 May 2021 17:44:45 +0200, Alex Bee wrote:
> Add compatibles for RK3036, RK3066, RK3188 and RK3228. Also reflect the
> changes to the additional clocks for RK3066/RK3188.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---
> 
>  Changes in v2:
>  - fix order
>  - fix indentation
> 
>  .../bindings/media/rockchip-vpu.yaml          | 33 ++++++++++++++-----
>  1 file changed, 25 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
