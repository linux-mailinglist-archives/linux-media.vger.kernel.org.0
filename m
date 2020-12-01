Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8D72CAC84
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 20:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389584AbgLATiz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 14:38:55 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:36504 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727534AbgLATiy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 14:38:54 -0500
Received: by mail-il1-f195.google.com with SMTP id z10so2861817ilu.3;
        Tue, 01 Dec 2020 11:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DYI9qxONvfFsX93NLUdjcCc5cniO135LSRFDHLJMHNc=;
        b=Wh7K3trIKSFpJAQxplfh0P0wuCQFUKxfvTNValVQ5LhooiuwIwXDf5eDImVAZk86oc
         FfQuDREbLWtCZcIXbK4Cedy8peJoGBz/5Qhkj5jmF9whXJSONFjl6A/k/Wy4GJA1zln7
         FEiMj+rkmaaeEwdu2URuCCpMkiHF7ysHbb0EohjdnU+JWsBOTXrpYgIomxCBzdIfhRGe
         +xd59A4rDLAfgP3uDld/yJs2IAspVj1gSBbnfXXV00CjSQwlPOmZJX6q/434LKExFTAZ
         bTxgZuNXpSRc7GFVNEIpNXObCGYju44Ke8g4JcJr1exCb6XNmc9od3ZXVN8OltSEH57F
         Mmyg==
X-Gm-Message-State: AOAM530awpVkRsFgFUMJE0pEpLCqFHAfYDF5qPVycWqoipAtrz5pHKbZ
        THzuLxvYACRMCuKDgoS8CA==
X-Google-Smtp-Source: ABdhPJyvVD5SrSLhVY6E2GMjFTusn8xdbN/fL5/dU9/BGT2sTIfo6kFY4V/phZjd812h0KRt9YFXMA==
X-Received: by 2002:a92:d3c6:: with SMTP id c6mr4237207ilh.7.1606851487685;
        Tue, 01 Dec 2020 11:38:07 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id c89sm279355ilf.26.2020.12.01.11.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 11:38:06 -0800 (PST)
Received: (nullmailer pid 928924 invoked by uid 1000);
        Tue, 01 Dec 2020 19:38:03 -0000
Date:   Tue, 1 Dec 2020 12:38:03 -0700
From:   Rob Herring <robh@kernel.org>
To:     Martin Cerveny <m.cerveny@computer.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, Lee Jones <lee.jones@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH v3 2/6] dt-bindings: sram: allwinner,
 sun4i-a10-system-control: Add V3s compatibles
Message-ID: <20201201193803.GA928894@robh.at.kernel.org>
References: <20201116125617.7597-1-m.cerveny@computer.org>
 <20201116125617.7597-3-m.cerveny@computer.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116125617.7597-3-m.cerveny@computer.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 16 Nov 2020 13:56:13 +0100, Martin Cerveny wrote:
> Allwinner V3s has system control similar to that in H3.
> Add compatibles for system control with SRAM C1 region.
> 
> Signed-off-by: Martin Cerveny <m.cerveny@computer.org>
> ---
>  .../bindings/sram/allwinner,sun4i-a10-system-control.yaml      | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
