Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B61F52E8231
	for <lists+linux-media@lfdr.de>; Thu, 31 Dec 2020 23:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgLaWN7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Dec 2020 17:13:59 -0500
Received: from mail-io1-f53.google.com ([209.85.166.53]:36286 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgLaWN6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Dec 2020 17:13:58 -0500
Received: by mail-io1-f53.google.com with SMTP id u26so15398379iof.3;
        Thu, 31 Dec 2020 14:13:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UfuFfmHD9d+5TwMD1+ZeFFV5g8rtAkP9j57ThhMOk1g=;
        b=A7fnlZo6aSwL6OxqyBrsDOJM0Lj0QmsrXfye2CkJzjYUeGQbmyIKAnsIBuecvC8Ywn
         QTP4z1a5B/ginKI+ew0RpkPpMDNoIIJat+C5dYQHG3KloDrM3I9V4Rz2Z9JtzmyrYEHW
         G+JS4KDIfQUtH0qqEydoNJWSLGdihut50+i992enDM8w1S/h+Osv8O1wQByPC3bSAwWk
         0PQnTh+2r7F2kz8Xut7vHLFeVq8Kk0O6y064t9b1fVPp7pBcrxP/h7fpIyaJvjS5cslo
         /qeMdYw9WZ2b9NIDIReWgs80TOn9Vgb9L/SK60QQkEL7dyGt8zKb42yltI3hZ+cqDfEs
         kNIQ==
X-Gm-Message-State: AOAM532O2oSBHx54Ax6gQ98KVjWQ1Fv1Fc5Igpec3iZB60f9xZpdlrBs
        TaAqo1S9vaq0AD1pBf8XI+zhR5Mu3Q==
X-Google-Smtp-Source: ABdhPJywluRRRPZqO97vN3Vxb3A7aqvA5hEd4iRVSXR4ZaNtJaub46ljOT7w95tcsRr26UwDaOVnnw==
X-Received: by 2002:a5d:9396:: with SMTP id c22mr48952567iol.12.1609452797850;
        Thu, 31 Dec 2020 14:13:17 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 12sm36876270ioz.41.2020.12.31.14.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 14:13:16 -0800 (PST)
Received: (nullmailer pid 2466486 invoked by uid 1000);
        Thu, 31 Dec 2020 22:13:15 -0000
Date:   Thu, 31 Dec 2020 15:13:15 -0700
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        heiko@sntech.de, ezequiel@collabora.com,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        jacob-chen@iotwrt.com, mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/4] media: dt-bindings: rockchip-rga: add more
 rga compatible properties
Message-ID: <20201231221315.GA2466452@robh.at.kernel.org>
References: <20201219112653.10705-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201219112653.10705-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 19 Dec 2020 12:26:50 +0100, Johan Jonker wrote:
> Add more rga compatible properties.
> 
> "rockchip,px30-rga", "rockchip,rk3288-rga"
> "rockchip,rk3328-rga", "rockchip,rk3288-rga"
> "rockchip,rk3368-rga", "rockchip,rk3288-rga"
> 
> make ARCH=arm64 dt_binding_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-rga.yaml
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/rockchip-rga.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
