Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCAC1A8B3C
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 21:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505073AbgDNTlA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 15:41:00 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41189 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505065AbgDNTk5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 15:40:57 -0400
Received: by mail-ot1-f67.google.com with SMTP id f52so914914otf.8;
        Tue, 14 Apr 2020 12:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rA3IETH0xgn8ebwBJlBRbndhRKsHnPU2NvYNY3hNsKA=;
        b=nZFluG9hEo7sfn8b+ldOOvfj2fhe2WTx3SjvcYS5A0qWJYOytQr42p7WhgMn3avC9m
         WNXL4dLpQ+MBgjC1tSOVwQ29ntDd1nssIuN4CZHlbazbyaqtirEv6nSpnPDVun9I7j0B
         qJ9WnJNr7iMIjLjoYF3I8Fcdjl1PmBnCDux0UuUWlcJrXG6XRJnjpq8jJOiscx40iFYj
         FSw9XmwfuXuylYgpe/CpS1UGMMNfbZWLSLsZNu+SPlHtfHDbl+l1fgM46rb8gdru8a26
         d6up8Z+KGDPHnk93sXSudBYw5qN+4HB73E+4OCaauP+DaD4gG5P7kS3vgm+2YEG8ph3N
         P8MA==
X-Gm-Message-State: AGi0PuZWr3MwdPckGVjBM4JAEfXZMgMVFIAzK1AiXljfIoqDyL45WHFd
        RCSM2elKrR03/kgjMzU0uA==
X-Google-Smtp-Source: APiQypLI/AKUFg7kJsQaGhZnEKT2eudBr8nOypqMfZWA4MgD+9PzQn1dP3iPfKOpVxnuDsfLnEXp4g==
X-Received: by 2002:a9d:24a4:: with SMTP id z33mr18571236ota.326.1586893255888;
        Tue, 14 Apr 2020 12:40:55 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h14sm2044908oov.11.2020.04.14.12.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 12:40:55 -0700 (PDT)
Received: (nullmailer pid 14986 invoked by uid 1000);
        Tue, 14 Apr 2020 19:40:54 -0000
Date:   Tue, 14 Apr 2020 14:40:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 3/4] dt-bindings: media: add wiring property to
 video-interfaces
Message-ID: <20200414194054.GB29184@bogus>
References: <20200412182012.27515-1-sam@ravnborg.org>
 <20200412182012.27515-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200412182012.27515-4-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Apr 12, 2020 at 08:20:11PM +0200, Sam Ravnborg wrote:
> The wiring property is used to describe the wiring between
> the connector and the panel. The property can be used when the
> wiring is used to change the mode from for example
> BGR to RGB. The first users are the at91sam9 family where
> such a wiring trick is sometimes used.
> The possilbe values are so far limited to what is required
> by the at91sam9 family, but using "text" allows us to extend
> this in the future.
> 
> There exists similar properties today:
>  - display/tilcdc/tilcdc.txt: blue-and-red-wiring
>  - display/atmel,lcdc.txt: atmel,lcd-wiring-mode
> 
> Neither of the above are defined as endpoint properties.
> 
> The new property "wiring" has a more general name and
> is defined as an endpoint property.
> It will replace atmel,lcd-wiring-mode and may replace
> blue-and-red-wiring.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Hans Verkuil <hverkuil@xs4all.nl>
> Cc: linux-media@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/media/video-interfaces.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index f884ada0bffc..c3bb87c5c9a9 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -141,6 +141,9 @@ Optional endpoint properties
>  - link-frequencies: Allowed data bus frequencies. For MIPI CSI-2, for
>    instance, this is the actual frequency of the bus, not bits per clock per
>    lane value. An array of 64-bit unsigned integers.
> +- wiring: Wiring of data lines to display.
> +  "straight" - normal wiring.

Don't really need a property to express this...

> +  "red-blue-reversed" - red and blue lines reversed.

For a common property, I think this needs to be looked at in terms of 
formats and some of the format negotiation work Boris was doing.

Rob
