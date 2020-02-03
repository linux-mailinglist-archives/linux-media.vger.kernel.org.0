Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B400A150A35
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 16:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbgBCPs2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 10:48:28 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37270 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727620AbgBCPs2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 10:48:28 -0500
Received: by mail-wm1-f68.google.com with SMTP id f129so17770144wmf.2;
        Mon, 03 Feb 2020 07:48:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=afJ9NnKQp7PyXqtyKvq2Ncapxl2sLhWMcC2ZgY83MY8=;
        b=XB38GdCkM7EGajjhoOh1609yXvVEPq82LoOwMKU5TjfWqLqFozXx8KipU7ESbF5s0S
         W6awMH7Pf3Yyo4zf9tBEAAFjHHiLsQSsmNjt1bKLCT0QkNqYaUDoVKoiiC2weB84miJ5
         u/abRi0ilByshTvwPxM9pJEmidBmEoCQSQCg+5qn6jiSFPftMLkSAtcL/iZS+duPQahn
         KnitJKHiDSNylQZ8+noV9Uy7TMKmHekD2jJf7B7HiuhDYrrBqUINS8gWeHR78Xvjyv6b
         B5SmA2PlVM+rA4QBuee6RabXnnAIbxvuPCPX3R1DwtscaCHw7ljGcxEtNuFgmbdXaDxd
         82cw==
X-Gm-Message-State: APjAAAUnCLbeif9Na7/Yt63lx6J0Z5QSBaoFd+TjqYEWiPe1LFYlfJff
        EG6ZR+AqOheYbWaxNBNKrQ==
X-Google-Smtp-Source: APXvYqzGuCIWbWw2i8bVfM/fZQ+6hFFwHGkTtJjO/5XdTvktJ8cdRX/uWRtt25gET6gNabVAIGUlDg==
X-Received: by 2002:a05:600c:2383:: with SMTP id m3mr30832163wma.32.1580744905443;
        Mon, 03 Feb 2020 07:48:25 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.163])
        by smtp.gmail.com with ESMTPSA id b17sm26278098wrp.49.2020.02.03.07.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 07:48:24 -0800 (PST)
Received: (nullmailer pid 21624 invoked by uid 1000);
        Mon, 03 Feb 2020 15:48:23 -0000
Date:   Mon, 3 Feb 2020 15:48:23 +0000
From:   Rob Herring <robh@kernel.org>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     mripard@kernel.org, wens@csie.org, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com,
        sboyd@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 5/8] media: dt-bindings: media: Add Allwinner A83T Rotate
 driver
Message-ID: <20200203154823.GA21568@bogus>
References: <20200124232014.574989-1-jernej.skrabec@siol.net>
 <20200124232014.574989-6-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200124232014.574989-6-jernej.skrabec@siol.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 25 Jan 2020 00:20:11 +0100, Jernej Skrabec wrote:
> 
> Some Allwinner SoCs like A83T and A64 contain rotate core which can
> rotate and flip images.
> 
> Add a binding for it.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  .../allwinner,sun8i-a83t-de2-rotate.yaml      | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-de2-rotate.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
