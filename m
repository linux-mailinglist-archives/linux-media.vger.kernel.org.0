Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8341E895F
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 14:24:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388354AbfJ2NYG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 09:24:06 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34640 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfJ2NYG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 09:24:06 -0400
Received: by mail-oi1-f193.google.com with SMTP id l202so891193oig.1;
        Tue, 29 Oct 2019 06:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8k1ghw94can+JRahpIGNrRyQL8DkL1oaO4K6wnzJKSc=;
        b=okjOd+OfNBR8GEeoPyigY5OuJO81j0Y91GSD+ulRXKPBRe3lb37gNa/3ab8CPZ4GoS
         6cOME2v1zlti3YzjmjMoZPKWVd05tCsbEa1lZfgQzP372VJ19XwuysmamUgB1/5X2KSX
         ssQTlbSLaFYreOMJIfaeG/OlvUNkU/Tkhwf55fynkD862eHT2JbXRbU5hM6VBPs71rF1
         2lNFp3nce7Yunp3+RyteiA4hzsdAOAKKnBybaWUQm7+uHNkRHOHIrXfGSZ3Td4nEF17d
         qBphfk9y6yOvirDGo7ydrH3c0wim5jX8kP31SnxhKy2ekuo35+vAtbTZlrOfJ0oJxbD/
         Bpqg==
X-Gm-Message-State: APjAAAVDW4I1LtaFYCmwTe+5A95ffTYPOKik2HLVYqlLkEK9aLI35/zu
        vne+PChgcTG5zDtNcO7Jew==
X-Google-Smtp-Source: APXvYqzU9LafiE3gAKzI2zQvKzgrh9l7F+NyRnfl9n32h6yAgchNT8oMdLpPAt59OI7tb8c30DbvQg==
X-Received: by 2002:aca:55d3:: with SMTP id j202mr1947356oib.152.1572355445556;
        Tue, 29 Oct 2019 06:24:05 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u130sm3934151oib.56.2019.10.29.06.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 06:24:03 -0700 (PDT)
Date:   Tue, 29 Oct 2019 08:24:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benoit Parrot <bparrot@ti.com>
Subject: Re: [Patch 11/19] dt-bindings: media: cal: update binding to add
 DRA76x support
Message-ID: <20191029132402.GA1527@bogus>
References: <20191018153437.20614-1-bparrot@ti.com>
 <20191018153437.20614-12-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018153437.20614-12-bparrot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 18 Oct 2019 10:34:29 -0500, Benoit Parrot wrote:
> Update Device Tree bindings for the CAL driver to add DRA76x support.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  Documentation/devicetree/bindings/media/ti-cal.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
