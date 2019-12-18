Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFBC7123CBF
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 02:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbfLRB4p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 20:56:45 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:47063 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbfLRB4p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 20:56:45 -0500
Received: by mail-ot1-f68.google.com with SMTP id c22so330739otj.13;
        Tue, 17 Dec 2019 17:56:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H0Yv40/gt7h76+Y6AxYij+vNwMNWt+JDljgPkgqqNPQ=;
        b=eMQY3JRVBlUl+8V4+FbmffGw21wtCAv7n5qUgH7djCJMIc5nWjI/2WgLBWVi1mzq8+
         OcLdEkhEA8lfpJOIqJr6XfOp1Sjkc22Ps0g0u3wiQ93osZcNSqdFG7ZZPpqEamMqXE9v
         ZIV7MwwYZVS+RyGqdhsSVrFCQFVy8KwKpU5Qa1/iaBn4aU9TMabhsm52yVDbDo239YkB
         1q7LmOGZv15zt52xg9kVqz66lwmtJ7bkkZ9By+SQ9LGi8Xc26ZKNkiug37xISPPN5Xkz
         TVq9QZnfPhvHQdPffj/aY8I92G5Gnh58Z1SIRU7TO1RWaEguj/16y6hwZ7ZJoP6Cz6MX
         if9g==
X-Gm-Message-State: APjAAAVKd0oe/IT7TNaBVss2k7phQqT+hTf0sVISF9GFY52wRx4SVAMX
        gBE1vkXgZ+qDTe5zXYEnug==
X-Google-Smtp-Source: APXvYqxNBgNUBjb/zwscs936FlF1h8bpF2gJXf9rpqAGoZ7u7ONgKK+a/CWN23/hJQnituubdjcoDw==
X-Received: by 2002:a05:6830:1492:: with SMTP id s18mr307725otq.285.1576634204003;
        Tue, 17 Dec 2019 17:56:44 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t9sm222580otm.76.2019.12.17.17.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 17:56:43 -0800 (PST)
Date:   Tue, 17 Dec 2019 19:56:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] dt-bindings: media: Convert Allwinner hardware codec to
 a schema
Message-ID: <20191218015642.GA32128@bogus>
References: <20191213074055.26193-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191213074055.26193-1-maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 13 Dec 2019 08:40:55 +0100, Maxime Ripard wrote:
> The Allwinner SoCs have a hardware video codec that is supported in Linux,
> with a matching Device Tree binding.
> 
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../allwinner,sun4i-a10-video-engine.yaml     | 83 +++++++++++++++++++
>  .../devicetree/bindings/media/cedrus.txt      | 57 -------------
>  2 files changed, 83 insertions(+), 57 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/cedrus.txt
> 

Applied, thanks.

Rob
