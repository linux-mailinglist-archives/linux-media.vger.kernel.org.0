Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 458D8154D31
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 21:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbgBFUqC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 15:46:02 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39080 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728083AbgBFUqA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 15:46:00 -0500
Received: by mail-pl1-f195.google.com with SMTP id g6so36444plp.6;
        Thu, 06 Feb 2020 12:46:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ITfgawVi1o3ZrkVgoG14aNaXMoHE4l1uh0uke02a5xY=;
        b=lXD+QnYtL8ofyTlCxpHyFfYen0wBuqv5k74C1fW9D6bEKO9Z/bAr+lvbLRrWSB5Uom
         8iQXS/rED7M6jhIJpltuntEN3LXE2xoZp2JjN9ca+EZyiNU0yQeVLDbPe1teO4KMNAzC
         806ID/klKsaSsITlCHjJGaC00wLBr/Ld0G+u9EFMmBVkyTdAsavOKiQD0Bql8kk3Tccn
         QnU0iG2S/txl0Y3M7aymNjqJgb/7/mq+TkrSiI83S+bCfiE5MoKaFlPl2qaKCmvUItqd
         kAM2N8g/pMWCB9m9EhjQGX6mwD2ASvpKnqylvwTTyrtYOIea+TwkYlYCZ/dFg2V2OYpw
         BOGQ==
X-Gm-Message-State: APjAAAUyKP0nh7oxa17uTaBMYJS9fGxZRssnsAIzW6LurRgu5TeWy4v4
        W99wy1bZ1f8IOzz6hzRtXw==
X-Google-Smtp-Source: APXvYqw5PrR4A4sMr3Pru2treXn0yygxf34oC36OJZ6C0iA981eFQHEE0V6TkhLX+FkDPa+g1ctGBw==
X-Received: by 2002:a17:90a:db0f:: with SMTP id g15mr6519888pjv.40.1581021960029;
        Thu, 06 Feb 2020 12:46:00 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net. [63.158.47.182])
        by smtp.gmail.com with ESMTPSA id x12sm287307pfr.47.2020.02.06.12.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 12:45:59 -0800 (PST)
Received: (nullmailer pid 11050 invoked by uid 1000);
        Thu, 06 Feb 2020 19:06:34 -0000
Date:   Thu, 6 Feb 2020 19:06:34 +0000
From:   Rob Herring <robh@kernel.org>
To:     Justin Swartz <justin.swartz@risingedge.co.za>
Cc:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Justin Swartz <justin.swartz@risingedge.co.za>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] [media] dt-bindings: Add binding for rk3228 rga
Message-ID: <20200206190634.GA10940@bogus>
References: <cover.1580768038.git.justin.swartz@risingedge.co.za>
 <4e66b3f029c56d7c7709d39ed15894b86f51fd37.1580768038.git.justin.swartz@risingedge.co.za>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e66b3f029c56d7c7709d39ed15894b86f51fd37.1580768038.git.justin.swartz@risingedge.co.za>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon,  3 Feb 2020 22:40:15 +0000, Justin Swartz wrote:
> Indicate that the rk3228 rga is compatible with that of the rk3288.
> 
> But if any rk3228-specific quirks are identified in future that
> require handling logic that differs from what is provided for the
> rk3288, then allow for the compatibility string "rockchip,rk3228-rga"
> to be matched instead of "rockchip,rk3288-rga".
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> ---
>  Documentation/devicetree/bindings/media/rockchip-rga.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
