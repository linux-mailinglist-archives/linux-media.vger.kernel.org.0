Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39DB9127199
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2019 00:39:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbfLSXjI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 18:39:08 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45957 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbfLSXjI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 18:39:08 -0500
Received: by mail-ot1-f66.google.com with SMTP id 59so9314524otp.12;
        Thu, 19 Dec 2019 15:39:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=49NkEdPVUTrClJQG9wypO7j+KSvP2cMEHBxilTCm4Oo=;
        b=RjUEkO+cKjVfqoGzr0G5WphvcZBMEx+n4wXH8DpnNwmt7fUpX0BuhS0P6CYrbOq6Vx
         LzGAe6q4BpJY4LOePLzOTxidpvwDX7xIuzK4aSErraDbrCkLYxJP5tFTQBIPi6ig/IMz
         nqjHNqzSwCflmt2JXYNzarJQCLmrE667BIwt/a8Xdw9nQpmwI22jf/jsdVoSI5AWRFEt
         uF1+hQ1nP9LibNRf/GJIR83PbeP5GI6HPLIAKWhxSXxFGvrKb8uDVQXOxe8ZtmdiO+RY
         ZnZ7wcuwSXnqjWLXvnTW12dx5gn2enTZpdBVc4Q9BiHo0I3hAh7zsP7kWnmr7TmBNEZ9
         s1IA==
X-Gm-Message-State: APjAAAXQ3S0LI/qf62jqqvcvuUGfaybwpaCnby32A+n1tX1sroIFG0VF
        uOh4OTX0+rOmNxKTPG4KwK73i24=
X-Google-Smtp-Source: APXvYqxzLHH4qXGeUb8cHj1eoRujkYAF2qvTXqb8zLYaI8LIyC64mQDJGqWuHCRdXoGlm/z+AQnO2w==
X-Received: by 2002:a9d:8f1:: with SMTP id 104mr9303245otf.107.1576798747100;
        Thu, 19 Dec 2019 15:39:07 -0800 (PST)
Received: from localhost (ip-184-205-174-147.ftwttx.spcsdns.net. [184.205.174.147])
        by smtp.gmail.com with ESMTPSA id w192sm842206oiw.8.2019.12.19.15.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 15:39:06 -0800 (PST)
Date:   Thu, 19 Dec 2019 17:39:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Guillaume La Roque <glaroque@baylibre.com>
Cc:     narmstrong@baylibre.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, khilman@baylibre.com,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: dt-bindings: media: meson-ao-cec: Add
 support of ao-sysctrl syscon
Message-ID: <20191219233904.GA18354@bogus>
References: <20191213132956.11074-1-glaroque@baylibre.com>
 <20191213132956.11074-2-glaroque@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191213132956.11074-2-glaroque@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 13 Dec 2019 14:29:54 +0100, Guillaume La Roque wrote:
> ao-sysctrl syscon phandle property is needed for CEC wakeup support.
> This property is optional.
> 
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  .../devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
