Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5C911271EC
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2019 00:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbfLSX6f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 18:58:35 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35433 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbfLSX6f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 18:58:35 -0500
Received: by mail-ot1-f66.google.com with SMTP id k16so4827621otb.2;
        Thu, 19 Dec 2019 15:58:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SKAwiiMoPd9Tn6Gy7OjwN1wuLYFMvkJCnI+ZJNtjSoU=;
        b=Itxj21/W/yj5+A0Rm98PmI2qhgdxEDi3ABhmEQBOhFZSudeLWQKakz4HxruvipzmGM
         4q8bUk5+YQ6Ci1Ni+EVCxCbti6YnJ70BT27Tk5lmNbXTynibq6k0Mf/2vuFtWt5+k0Wy
         jnhbqy7Olt81Ga/cRBTpWo6KgPN3sMlnOTlACyZ7nRI8dcnpLcRumZqHYDN+A4Xvn7wc
         wtZX+ME8ePrwMTh3fV82NuVgaSmx+jQ8e6T3VKTY2XcGep4zNPF12o/kv4SMKFcaemSL
         CdWKgfTSBv8VNWvR97/ih43zbxOIyOqhSGa/ervWY7GYErxdNW/J9yz1rUcSzDpRH9Jm
         +2hQ==
X-Gm-Message-State: APjAAAUMnbmfz51zrmCHxf+tfgRMfmdV57XIgsQyb18WRZGcYw9MKnu1
        tXDE9MU252gMePyDG7wyfg==
X-Google-Smtp-Source: APXvYqw55kJy7t/alrW7e/PbYwZqVLZg2Ona/8Txk725xAGbNLdEpYEc3R+GsZ69sJiZdx6g/aK/dg==
X-Received: by 2002:a9d:f26:: with SMTP id 35mr12255962ott.260.1576799914673;
        Thu, 19 Dec 2019 15:58:34 -0800 (PST)
Received: from localhost (ip-184-205-174-147.ftwttx.spcsdns.net. [184.205.174.147])
        by smtp.gmail.com with ESMTPSA id e65sm2709408otb.62.2019.12.19.15.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 15:58:34 -0800 (PST)
Date:   Thu, 19 Dec 2019 17:58:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 10/14] dt-bindings: bus: sunxi: Add R40 MBUS compatible
Message-ID: <20191219235824.GA12457@bogus>
References: <20191215165924.28314-1-wens@kernel.org>
 <20191215165924.28314-11-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191215165924.28314-11-wens@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 16 Dec 2019 00:59:20 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Allwinner R40 SoC also contains MBUS controller.
> 
> Add compatible for it.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/arm/sunxi/sunxi-mbus.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
