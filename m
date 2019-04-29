Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5B2E970
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 19:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728993AbfD2Rp6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 13:45:58 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41334 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbfD2Rp6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 13:45:58 -0400
Received: by mail-ot1-f67.google.com with SMTP id g8so8415762otl.8;
        Mon, 29 Apr 2019 10:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jAzJmF2TDQHSyudozQ8MRP+x53QYDHzdtWrUcOyie5o=;
        b=g+R92KDFW0x6NHaON6tGIwOzwahJ1uY0f2uFCkM4ehSXaRpBAy18WwSJwtH24yiNe8
         Dg6R8os/+N3ERC8WIGnbGzbVmntXuD3l6v60G+bWPUzFAUYTgXamkoM8+k0Hygiag358
         GhJSY0zjzqtA+iVigi21JwYab0ZHSptzDZa3GUb+5ElgDPZSLLDfbjpAHCd+XoXNw3W1
         fUo9gVCXk3klCJArpYi8zt+LC0xiTwZp08rGBvCJaPEVcuBd7S06+vaQ0G9Ii2T0Ol6N
         +wb+8004MAeSHDVZQJI9zLO9mqyT9QTIsihnsVlEJRJYudAGAISx7wr+ryHl4Xk4q3WW
         3lAA==
X-Gm-Message-State: APjAAAXP/1pUa26HJGkf/eXsNAxq4jxGUKPhrIqtba3Po3E4Tvs+/7yL
        Wu+pL+cVudy8UBa+4r+JhGhHMoc=
X-Google-Smtp-Source: APXvYqyDmhrZrBxVsjETXa+G0jMSBEdawMchYDvBe7bdT/A54hBJgsvfF2vIblFu+/8+xxw3vWkkFw==
X-Received: by 2002:a9d:7f89:: with SMTP id t9mr23252837otp.169.1556559413449;
        Mon, 29 Apr 2019 10:36:53 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s26sm13741338otk.24.2019.04.29.10.36.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 10:36:52 -0700 (PDT)
Date:   Mon, 29 Apr 2019 12:36:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH 2/6] dt-bindings: media: sun6i-csi: Add compatible string
 for A83T variant
Message-ID: <20190429173651.GA6551@bogus>
References: <20190408165744.11672-1-wens@kernel.org>
 <20190408165744.11672-3-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190408165744.11672-3-wens@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue,  9 Apr 2019 00:57:40 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The A83T SoC has a camera sensor interface (known as CSI in Allwinner
> lingo), which is similar to the one found on the A64 and H3. The only
> difference seems to be that support of MIPI CSI through a connected
> MIPI CSI-2 bridge.
> 
> Add a compatible string for this variant.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/media/sun6i-csi.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
