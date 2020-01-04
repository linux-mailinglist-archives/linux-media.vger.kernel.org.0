Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC4612FF8B
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2020 01:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbgADAZM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jan 2020 19:25:12 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:42285 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727159AbgADAZM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jan 2020 19:25:12 -0500
Received: by mail-io1-f68.google.com with SMTP id n11so36366783iom.9
        for <linux-media@vger.kernel.org>; Fri, 03 Jan 2020 16:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eR1DwePl12inkeFIjAXH/g5K3pWBVW6Bq++1sC/LWl8=;
        b=n+wNTHKVAmyFK3oUmc0rmXzQu8BY4fcMJMdVNw2McXbAYKZywfp5JEX+79i4+IcKQW
         W7M8HsnKInhvXUmsT0XXX/eKOkc+rFUAk2ZuV4aCu0hlMjiwQ9o2L13rIOq9y+e5UgsL
         G1Q2KAJMJC1QNEi+bUbZr3l4/2GDivbsdW9Z/o8FNLFvx/VgP1ge4dQqxSgmlRFZgtMK
         f9saBfFqGL679R3bcwTjJz3Qi8KD/U+Q2DDW0iVxMtvG10bttk4h4scWYuIU/uu3su2H
         hU5yqi4R/70RZbyxfOcnmFlpVV6Zbghr9LcX+u9MCMBnGeRIhOukEsKIMOh7p7r3IryQ
         Kv3A==
X-Gm-Message-State: APjAAAXYOhtfxAA86hFLugRillzqk8QizstduqQU8rxc8La5GaXrbiVY
        VxLjdOBsYA1zlrW7WceeoiPtB3Q=
X-Google-Smtp-Source: APXvYqwnVwt9Eby+i/IZaz98NpkszGoybi2hvEU7ho97bBLReI9tWK+u4j4uDVO88Mh1pfJnc1cwvQ==
X-Received: by 2002:a6b:4e08:: with SMTP id c8mr57629622iob.64.1578097511084;
        Fri, 03 Jan 2020 16:25:11 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id v13sm14709598ioh.53.2020.01.03.16.25.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:25:10 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219e3
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:25:09 -0700
Date:   Fri, 3 Jan 2020 17:25:09 -0700
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jun Nie <jun.nie@linaro.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: add "hisilicon,hi3796cv300-ir"
 compatible
Message-ID: <20200104002509.GA24062@bogus>
References: <20191226120222.14745-1-shawn.guo@linaro.org>
 <20191226120222.14745-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191226120222.14745-2-shawn.guo@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 26 Dec 2019 20:02:21 +0800, Shawn Guo wrote:
> It documents "hisilicon,hi3796cv300-ir" compatible for Hi3796CV300 IR
> device.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  Documentation/devicetree/bindings/media/hix5hd2-ir.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
