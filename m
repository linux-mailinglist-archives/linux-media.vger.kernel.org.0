Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9AF2C9210
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 21:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730242AbfJBTNy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 15:13:54 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:44146 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730237AbfJBTNx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 15:13:53 -0400
Received: by mail-qk1-f195.google.com with SMTP id u22so16171767qkk.11;
        Wed, 02 Oct 2019 12:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G8NWVG2Dj1ye1ZiHmvRqpD/iCq2t/RLgtgsIODbe7OE=;
        b=XpU2xaZKa7aZb7z1Jg/sOj5mLG3ZeMtLPAWhAC0WjPz34AsolA24J1YMqbeDF2uZtO
         QYzO8usjLx+zwvqfiB3v8q45pGGNZyJ9gxcXb0DSgszLCpGDpz7MUm0c4IFUyE3WwdxH
         4ty06CA9J+9dNx2ZHlD0OoH5bPdnAAkVEHt59WrDWoAgDo0WpYKBJ+vmZ86ZdtIhEbXz
         FVvh+SUdLusEEYZ93gEhdSFKhybOLhjsMAvf/jKhQy/HW/1Bk/SVIx6J/aMZ3CDKQw8q
         Fz/olC8EAW9HlfNE8Zgs1Oga2GQpJPh2gkk02FBtSIoP7o+GBUIIXsNJTcMqKOETnMBL
         jmkw==
X-Gm-Message-State: APjAAAWD6GKzk6afxv7WvUcRqQ0YeHK6ExZbaqssHCfesTSBTy5fR2oV
        VXcV1KCJD8XrbHROZ8yb7A==
X-Google-Smtp-Source: APXvYqxszfM5XF4Zum05FRGxqeN+JvSBLD1JzZOlm54uzBxlFDENqackZ5zy7IoeeOGbKAU9cJbZAg==
X-Received: by 2002:a37:a446:: with SMTP id n67mr420047qke.132.1570043632918;
        Wed, 02 Oct 2019 12:13:52 -0700 (PDT)
Received: from localhost ([132.205.229.212])
        by smtp.gmail.com with ESMTPSA id m136sm60797qke.78.2019.10.02.12.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 12:13:52 -0700 (PDT)
Date:   Wed, 2 Oct 2019 14:13:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>, mchehab@kernel.org,
        sean@mess.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] dt-bindings: media: rc: Fix redundant string
Message-ID: <20191002191352.GA17132@bogus>
References: <20191002144400.114541-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002144400.114541-1-mripard@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed,  2 Oct 2019 16:44:00 +0200, Maxime Ripard wrote:
> The linux,rc-map-name property is described using an enum, yet a value has
> been put in that enum twice, resulting in a warning. Let's fix that.
> 
> Fixes: 7c31b9d67342 ("media: dt-bindings: media: Add YAML schemas for the generic RC bindings")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/devicetree/bindings/media/rc.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks.

Rob
