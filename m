Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17478D4328
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 16:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbfJKOmp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 10:42:45 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43039 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbfJKOmm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 10:42:42 -0400
Received: by mail-ot1-f65.google.com with SMTP id o44so8138268ota.10;
        Fri, 11 Oct 2019 07:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eiwBs2aJ/mxnZiUA2T54VE8T9eC0Arc2KX94A7JP/5U=;
        b=dOMDwTkBVgzcr2fdtWsAZTS0m+gUr7fFLNrBoZ5jvh48nO+Npq1DW+dEVMA75dBQfV
         XfGHz0sknsX0z5osvoSofh0qMCgNGOLTrAcud2odM3e/fzCGg9mx+Q+Emyw/GrYkasv/
         NrnVJdwsc+G7/p086fzyO4mhAfjyl3VJgASbnpYjn6j9jclQyQN2c0hfNO56WkfyK0n+
         ZKPHy5d/lVSiMrwkbDcJFsBrpO3Tdfi9lJ9OarW70RFjcfbNGuobDArOvPILF0L3s3Tj
         vpGMfIpE8tN9reO36RE0bEZEbIIVEttPquCIr2cIjcbauTfjYLqxcGIquL2SVDvdQloK
         zyZg==
X-Gm-Message-State: APjAAAU8sr7RimQzY/wlXDU3/O0fJnwyTg/rwyKCI2/daUFI2Lq/rVTp
        zGgTSjkvrXfklvK9WDwfTg==
X-Google-Smtp-Source: APXvYqwfFLJ2vEbDguubnzCO2vBMLOijjMMqSQQJyn3yDzXCWnF6G0GmEZ9o9LSY6OLxopwzgwi1TA==
X-Received: by 2002:a05:6830:2001:: with SMTP id e1mr12633047otp.69.1570804480323;
        Fri, 11 Oct 2019 07:34:40 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k24sm2576532oic.29.2019.10.11.07.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 07:34:39 -0700 (PDT)
Date:   Fri, 11 Oct 2019 09:34:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     mripard@kernel.org, wens@csie.org, robh+dt@kernel.org,
        mark.rutland@arm.com, mchehab@kernel.org, hverkuil@xs4all.nl,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 2/6] clk: sunxi-ng: h3: Export MBUS clock
Message-ID: <20191011143439.GA24106@bogus>
References: <20190929161653.160158-1-jernej.skrabec@siol.net>
 <20190929161653.160158-3-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190929161653.160158-3-jernej.skrabec@siol.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 29 Sep 2019 18:16:49 +0200, Jernej Skrabec wrote:
> MBUS clock will be referenced in MBUS controller node.
>
> Export it.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-h3.h      | 4 ----
>  include/dt-bindings/clock/sun8i-h3-ccu.h | 2 +-
>  2 files changed, 1 insertion(+), 5 deletions(-)
>

Acked-by: Rob Herring <robh@kernel.org>
