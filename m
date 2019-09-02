Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACF21A5A6B
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 17:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731965AbfIBPTt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 11:19:49 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52942 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729971AbfIBPTt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 11:19:49 -0400
Received: by mail-wm1-f68.google.com with SMTP id t17so15009581wmi.2;
        Mon, 02 Sep 2019 08:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BYClhC1HMbKOtcDh2ekKQYoHMN7cI/iCFy34UYI5bgA=;
        b=QFKYpmhZJYEBsx9qIycfVdU/AfAGfhmd03wkH/ReUnjrf8jQwtBJm4Dhu0/qVtod6J
         n7SGJDtiCU1o1oCCrxubOPOwj/ZnbyHDCknPMPjvs8+ULi+sv2J/CgzuINOVOfRfld2N
         n8UD/xl8YKciJGZ9iPax6/tIzcwdfhbtp9Llz1P0bI7aFKsO9dTRI3oBV4XSETj9/0VN
         VGouplGt/5cwhCgszOZsodR004OaM1C5/IlnwJaXT01kmXjSjE7vAsVNbrEGZjfPz1nB
         CBSA4tNtPzsDNlQQD0g9wbk6b+kGxKTfVO4vxivn6LiSdjOWVHCPUAyBFFfe/kGMcpGy
         cacQ==
X-Gm-Message-State: APjAAAX+P3f3Pg9+vAKDukdPDixUV7azMvbBOmTDsOnXhvqFo71wE7MO
        3+g6FVu1WvbKCKodjJGqcQ==
X-Google-Smtp-Source: APXvYqzPltxtt9uqfKOo42afUhD8XTeUDbKvzVR7ZFpwiX6WJd3Bppf5ESBy/KTIX5Udt+FC9pvaKA==
X-Received: by 2002:a1c:ef13:: with SMTP id n19mr4812723wmh.48.1567437587236;
        Mon, 02 Sep 2019 08:19:47 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id f13sm14101693wrq.3.2019.09.02.08.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 08:19:46 -0700 (PDT)
Date:   Mon, 2 Sep 2019 16:19:46 +0100
From:   Rob Herring <robh@kernel.org>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: Re: [PATCH] dt-bindings: sh-mobile-ceu: Remove now unimplemented
 bindings documentation
Message-ID: <20190902151946.GA27850@bogus>
References: <20190902084352.7974-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902084352.7974-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon,  2 Sep 2019 10:43:52 +0200, Simon Horman wrote:
> Remove the SH Mobile CEU bindings documentation as the corresponding driver
> was removed v5.1 by the following commit:
> 
> 43a445f188e1 ("media: sh_mobile_ceu_camera: remove obsolete soc_camera driver")
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  .../devicetree/bindings/media/sh_mobile_ceu.txt         | 17 -----------------
>  1 file changed, 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/sh_mobile_ceu.txt
> 

Acked-by: Rob Herring <robh@kernel.org>
