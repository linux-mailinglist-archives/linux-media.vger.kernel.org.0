Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E94B81633C8
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2020 22:04:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbgBRVEJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Feb 2020 16:04:09 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33931 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbgBRVEJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Feb 2020 16:04:09 -0500
Received: by mail-oi1-f196.google.com with SMTP id l136so21605270oig.1;
        Tue, 18 Feb 2020 13:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UwjjYnG/jWqlCLFoFu94p360e88borBKuEW+C88Dv3s=;
        b=US1cE3z0CNzcgktY/liULmQaqp1u5yoiWyvqyUGT9OQHZv06+NkaF7O+LhhJhQW9L7
         EjdCBPuyH86nduRbVou9wUIoVOVfFIwVYfHKlaLWqkGlLl2YH+F7vIghSTZQ3e1mSD3Z
         uia9OgOab93T1KB41VtcI9ybqYTlZiXLVkwhtti+iMnhEaajo+uBxHC6/OD0Ymn13UB8
         d+un4nZJoEJOuhrxPdUHiP6oWtwBfbXBV5TYelkB7qx0mEU1P6mGs/XpMMqwjbwt1+lN
         4Teu6XFF/gF0tfhMQhvi9IRRl3lwoq/qPF9VJuGw+sY8iCxTLSFt0iNopuwSjYK05imN
         6iyQ==
X-Gm-Message-State: APjAAAWLUD7Mg88rHQvR7qLmWdV37Wv4GkppW8dRMD+Vwog6gIpvPCwI
        hVphXXRYYEWe4bONoc0zVw==
X-Google-Smtp-Source: APXvYqwHJDNZjVGmm+GSa20E6MAlz3y9ic6qbHKnImkXJJw2j5CVcKD+jcgP7v4fZRSddspoiFrHBw==
X-Received: by 2002:aca:b808:: with SMTP id i8mr2457073oif.66.1582059847979;
        Tue, 18 Feb 2020 13:04:07 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b9sm1723745otf.56.2020.02.18.13.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 13:04:07 -0800 (PST)
Received: (nullmailer pid 974 invoked by uid 1000);
        Tue, 18 Feb 2020 21:04:06 -0000
Date:   Tue, 18 Feb 2020 15:04:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Cc:     linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        Mohammad Rasim <mohammad.rasim96@gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: media: add new kii pro key map
Message-ID: <20200218210406.GA917@bogus>
References: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
 <20200214085802.28742-3-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200214085802.28742-3-mohammad.rasim96@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 14 Feb 2020 11:58:01 +0300, Mohammad Rasim wrote:
> Add new entry for rc-videostrong-kii-pro in linux,rc-map-name
> 
> Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/rc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
