Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC3BE895B
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 14:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388463AbfJ2NXs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 09:23:48 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:32944 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfJ2NXs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 09:23:48 -0400
Received: by mail-oi1-f194.google.com with SMTP id m193so4399105oig.0;
        Tue, 29 Oct 2019 06:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p2B+14z0eCRXHxvbkj7JytCGGDPhVXOx4TkxnHsuYB4=;
        b=Jb3W1x7vP/8jqXXtFro4dotq3G+Kr5xCMnl9N1pP/a8FdhWYHIuYpfBGH/9wP2zrxh
         LksFkc+vMm+hAD71rYYzppoRnQ5zhqeEP/uLVlUanPO+I0GJxNdpLoPJYaAxz5DZphJ5
         qCHtq8U3FaGrgkbk8T3RhdKXviRfg/Q7PIlrXF/LiiLsm4xpgJwMsJHrONptVW0v8phb
         WqRLizsetlnU6FeJefS/AJv5r7yzg83mS8nekQhKhi1jyKvjUPrUktVbILyGqWM070nO
         d/WG9NgGDqDOtsifSqUZYJCzeYmCGHJ6lllFVQR9BcZ8FBvrSg0ZCxzx2DkZq/iHcs9I
         g4Jw==
X-Gm-Message-State: APjAAAVI1KTynYLnySMWgUaP9W/eSLWBKJjS/Wd6XPLYpfEYDRKMphL4
        2g9ElOIDBUHYHbSUuiJi9Q==
X-Google-Smtp-Source: APXvYqx2d5Cxswq9U3kJ7tmRKAjZNGonAtz1z6CDx+89WmBKnIJ+pI4QwFqcD1ZhgWj0YeAFswpB0Q==
X-Received: by 2002:aca:c583:: with SMTP id v125mr3876360oif.156.1572355427797;
        Tue, 29 Oct 2019 06:23:47 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q5sm2720418oih.55.2019.10.29.06.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 06:23:47 -0700 (PDT)
Date:   Tue, 29 Oct 2019 08:23:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benoit Parrot <bparrot@ti.com>, Jyri Sarha <jsarha@ti.com>
Subject: Re: [Patch 06/19] dt-bindings: media: cal: update binding to add PHY
 LDO errata support
Message-ID: <20191029132346.GA899@bogus>
References: <20191018153437.20614-1-bparrot@ti.com>
 <20191018153437.20614-7-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018153437.20614-7-bparrot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 18 Oct 2019 10:34:24 -0500, Benoit Parrot wrote:
> Update Device Tree bindings for the CAL driver to add support for
> the CSI2 PHY LDO errata workaround for pre-es2 devices.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  Documentation/devicetree/bindings/media/ti-cal.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
