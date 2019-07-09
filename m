Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03D3C62DE2
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 04:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbfGICHo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 22:07:44 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:36197 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfGICHo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jul 2019 22:07:44 -0400
Received: by mail-io1-f65.google.com with SMTP id o9so24196974iom.3;
        Mon, 08 Jul 2019 19:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=sOFyghnaWCkeP99kSdegfFUM8v38APOnZEvvVvq8Sa0=;
        b=sC8RDR/c1UT05N1Qs0ruhO3DTotH+H4MKLLNDPs8j7VwZ9EclfKttqNF6weN+73Fv6
         BP9l4p/78W3njA7/wrQ+XIDuv+s/rXapqjYRbIgMlyl8I7384H0l5yP1H1Fg7KGzqOf5
         1BQF+ah/tbES1D952DUt4uvjZ4ZlzlXyIwQBAYMx6no5MJRiKidQXzlqFBvPRZijmQ4v
         SPynIIedUahC33XVNKpbmmyLWgA57O+oJVHrNdh7GvvmycJg9TPurJTzYhYkxjlSFZ3/
         4CkF8MLccYO1ZmBmTjemqXnebYbMc7wgqWKJGRZOuXQRYUP+nlcnHkunVrveTLSZznq1
         Qysg==
X-Gm-Message-State: APjAAAWqv42DsWajdmw6cuH0Q9F8Tnyf52UCJAmDHLuvqeD6kGt/9wPP
        d1AgwEbwFTpduPhTdTamlQ==
X-Google-Smtp-Source: APXvYqyVrio6/VxZnlDP+8LCmVQs+p5SsnEoXO5dtLDm0cb3oOaffvZnChay6QuFgHKpKN1JAYYShg==
X-Received: by 2002:a5d:91d7:: with SMTP id k23mr2331578ior.163.1562638063383;
        Mon, 08 Jul 2019 19:07:43 -0700 (PDT)
Received: from localhost ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id k2sm15535104iom.50.2019.07.08.19.07.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 19:07:42 -0700 (PDT)
Date:   Mon, 8 Jul 2019 20:07:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
        Sean Young <sean@mess.org>
Subject: Re: [PATCH v5 01/13] dt-bindings: media: sunxi-ir: Add A31 compatible
Message-ID: <20190709020741.GA21447@bogus>
References: <20190607231100.5894-1-peron.clem@gmail.com>
 <20190607231100.5894-2-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190607231100.5894-2-peron.clem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat,  8 Jun 2019 01:10:48 +0200, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= wrote:
> Allwinner A31 has introduced a new memory mapping and a
> reset line.
> 
> The difference in memory mapping are :
> 
> - In the configure register there is a new sample bit
>   and Allwinner has introduced the active threshold feature.
> 
> - In the status register a new STAT bit is present.
> 
> Note: CGPO and DRQ_EN bits are removed on A31 but present on A13
> and on new SoCs like A64/H6.
> This is actually not an issue as these bits are togglable and new
> SoCs have a dedicated bindings.
> 
> Introduce this bindings to make a difference since this generation.
> And declare the reset line required since A31.
> 
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> Acked-by: Sean Young <sean@mess.org>
> Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/media/sunxi-ir.txt | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
