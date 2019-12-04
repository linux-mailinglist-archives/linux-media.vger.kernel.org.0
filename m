Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2E71135B0
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 20:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728789AbfLDT1O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 14:27:14 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41724 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728110AbfLDT1O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 14:27:14 -0500
Received: by mail-oi1-f195.google.com with SMTP id i1so320692oie.8;
        Wed, 04 Dec 2019 11:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LV4dBd+pyosFpb8ZOXcuCmQqFB/Z1VrnDg7zb35XO+A=;
        b=IBJ8+w0w7Sa3A4inFuSw7YQfyliV6mVwaRIYAhRjYePzoZRfYGM/lCXspQwfIfPcgU
         Ojtf+vG5RR683jq5DXTjcy3VEw3woTNYXRfOgTcZCNIBWPBgVLQSMtPu4y265p8oZkBI
         r7AByAlKUlBrO7AV/ZYT109qeTVviDki1VCPmJ6Zh1Ew1XTpS82KfVyh5pDB+EiLBjZt
         S70OwCFSDmLMWUGcf0HAEjlf+e/kLBva2o/wsAl40W9NbS9mcMfXh0jjXD44M5x0TR8q
         UG6HESkiZCNbop8k4IMQGaM3iwyYE9mfyUr/A8lAUq7TYVYgkFfRaWCS9Q8EVF1tHUgS
         GzPQ==
X-Gm-Message-State: APjAAAW1DM7xx4rg/PHHFHnbMzioa1uVBYR1z2POyqRKWum1OB35YI2t
        uB8pgBoj//olgy7Z8NCipA==
X-Google-Smtp-Source: APXvYqyWJX9gBPsev6B4b8T+yjKHMepyHXDfO09PT+6reBKfa28zaBZj1dCvX8NyEatzxLKyG/Veng==
X-Received: by 2002:aca:3012:: with SMTP id w18mr4151923oiw.33.1575487633657;
        Wed, 04 Dec 2019 11:27:13 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v25sm2037370otk.51.2019.12.04.11.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 11:27:13 -0800 (PST)
Date:   Wed, 4 Dec 2019 13:27:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     mjourdan@baylibre.com, devicetree@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: amlogic,gx-vdec: add bindings
 for SM1 family
Message-ID: <20191204192712.GA6599@bogus>
References: <20191121101429.23831-1-narmstrong@baylibre.com>
 <20191121101429.23831-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191121101429.23831-2-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 21 Nov 2019 11:14:27 +0100, Neil Armstrong wrote:
> Add bindings to support the Amlogic Video Decoder on the Amlogic SM1 family.
> 
> SM1 has a slightly different power management handling, thus needing a
> separate compatible.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
