Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0D0150A3A
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 16:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727954AbgBCPtR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 10:49:17 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55133 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727620AbgBCPtR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 10:49:17 -0500
Received: by mail-wm1-f65.google.com with SMTP id g1so16465226wmh.4;
        Mon, 03 Feb 2020 07:49:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xDmbbJ5yTsThtIu3aslzxfoKzECwfla5yUHJc1NYGcE=;
        b=eYeOH9Pa8Y1h3PuM0SUzTeJHfz6Z7d12UoxFUCzIcUBl5VkrtgthQHZcDR+86re5Rw
         k5i5mTCLMzKx1Dx/XSwuDQ3rPPYxA4xU5X1+FAQRvT14xjX+TjyWfoDi98md8ErM/Ngp
         m5qIrf1GW23iplkwo8gTgauV0bCH1zoAYuOHnw71LU5IjsPN/TdRA86n0DpSMoKC8ZtU
         lbsjJJUKKlgVE6sy6I4ya9I/Ub2pFU31//XT7h1Ivo/COb/rh9b33iP8EztlYHGC1Lzj
         a2p075jCMVcV63AhXkkslNtRre056cpNx4sEqTmNx7CU2SSPzS77sBHlpkJ/gYqUYs2D
         EiSQ==
X-Gm-Message-State: APjAAAVy137d9zE8thF+RkBeHroQMFBs1YvbEbPLNpD5Z83uI39UI3t7
        YRpH6hdz+vKOjprtADQ6Cg==
X-Google-Smtp-Source: APXvYqxiBN2aBKndQt7A20lKHnBEuu3PnQ2ceap8QDoTokh8/GBYU7fW/d8zvuf5BGABtbfmyWNxWw==
X-Received: by 2002:a05:600c:2207:: with SMTP id z7mr30204715wml.138.1580744954980;
        Mon, 03 Feb 2020 07:49:14 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.163])
        by smtp.gmail.com with ESMTPSA id f189sm25570525wmf.16.2020.02.03.07.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 07:49:14 -0800 (PST)
Received: (nullmailer pid 23082 invoked by uid 1000);
        Mon, 03 Feb 2020 15:49:13 -0000
Date:   Mon, 3 Feb 2020 15:49:13 +0000
From:   Rob Herring <robh@kernel.org>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     mripard@kernel.org, wens@csie.org, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 1/5] dt-bindings: interconnect: sunxi: Add A64 MBUS
 compatible
Message-ID: <20200203154913.GA23022@bogus>
References: <20200125110353.591658-1-jernej.skrabec@siol.net>
 <20200125110353.591658-2-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200125110353.591658-2-jernej.skrabec@siol.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 25 Jan 2020 12:03:49 +0100, Jernej Skrabec wrote:
> 
> A64 contains MBUS controller. Add a compatible for it.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  .../devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml  | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
