Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24A381271E5
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2019 00:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbfLSX5n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 18:57:43 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41760 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbfLSX5m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 18:57:42 -0500
Received: by mail-ot1-f65.google.com with SMTP id r27so9391007otc.8;
        Thu, 19 Dec 2019 15:57:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OMWLX5Po0CxgTAHf6iS/ph0HUz8ijxk+7R2/Fb1wd4g=;
        b=seOXR6TEFYOuqMEWVZ2e4SS8NsWvqV6ThqwiRj0pEc1xXYh+XERibL6n4VcOd0ngKg
         Rh91jLk49lKRKsH8e34x7dfDyACgGgzsvWYqjBmYQF5tYYwNu9YBa1+GdicMC0GET/sI
         u1zHAOA5hHQlbQq7p0fWfjWSvObw1InkCgt7N7pU1EC7ySafj2Cim3+YVTghSgC8Bvr8
         rfWmQGE9grkE0zCZdMUnskmMRp3tDOtG0SgLPzNBJHkJghEml6HEitCDVKbPPPDzEfZL
         d7rzgDnMMwZ422eQHF5KDJ5zfKhr88CyF90kodiEeXBON4Vyv3+f4bl26vae8vp4XuLZ
         HmTw==
X-Gm-Message-State: APjAAAWZo9k31ONXBipv2J9J6YMj9WyG3969Jn565ysh+jO0ZRTceuxs
        AKW3ZJOWS6CDuxP33YEuzw==
X-Google-Smtp-Source: APXvYqxv+LQx4Guvz+TFTpgo3HvUnB9BUM567dRykno2DvnkBi1TbWKC+9CFro+YU4KP1Nf5E/9now==
X-Received: by 2002:a9d:7a88:: with SMTP id l8mr12190373otn.187.1576799861704;
        Thu, 19 Dec 2019 15:57:41 -0800 (PST)
Received: from localhost (ip-184-205-174-147.ftwttx.spcsdns.net. [184.205.174.147])
        by smtp.gmail.com with ESMTPSA id p184sm2574797oic.40.2019.12.19.15.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 15:57:41 -0800 (PST)
Date:   Thu, 19 Dec 2019 17:57:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 02/14] dt-bindings: media: sun4i-csi: Add compatible for
 CSI0 on R40
Message-ID: <20191219235738.GA11443@bogus>
References: <20191215165924.28314-1-wens@kernel.org>
 <20191215165924.28314-3-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191215165924.28314-3-wens@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 16 Dec 2019 00:59:12 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The CSI0 block in the Allwinner R40 SoC looks to be the same as the one
> in the A20. The register maps line up, and they support the same
> features. The R40 appears to support BT.1120 based on the feature
> overview, but it is not mentioned anywhere else. Also like the A20, the
> ISP is not mentioned, but the CSI special clock needs to be enabled for
> the hardware to function. The manual does state that the CSI special
> clock is the TOP clock for all CSI hardware, but currently no hardware
> exists for us to test if CSI1 also depends on it or not.
> 
> Add a compatible string for the CSI0 block in the R40, with the A20
> compatible string as a fallback.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml     | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
