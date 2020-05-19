Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEA441D9F99
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 20:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgESShD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 14:37:03 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:36941 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbgESShC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 14:37:02 -0400
Received: by mail-io1-f66.google.com with SMTP id t15so266539ios.4;
        Tue, 19 May 2020 11:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9gkfGJ7KJs1nebEF+m2qI6r0Zpzd4/7HhycMiWKPpMw=;
        b=Opub0kShFShF8UDNFVKjrW6AN/4qxFYf0IQuXZGdqv5gqfY5ipjtB9IELyQmGXNavr
         ZvtF70xvppZQhcZH50zn6ujyjtbcQwVb3DRmxr6+R2P5Vd9DCfcyXiW+0gukBSAGCKQB
         t9ddVBvB5MCzBIYoDXKaI3I8AyvLxsRj2MDXyEPuNteWRsknaE9yEHWX8oIgyusshXGh
         fnBWCKb5WJxTBIr8b7hmWBdycjRZLz2loxpp4WGAngMfhS552ZoEn+WU3/6TLpYi06qE
         Hr4kChnaSRxL0TKV/RV4IJ1NOe+W0XGmzITwNFO84qgwmxHQhwj+3e8fLipf8tVlxoDt
         V/kQ==
X-Gm-Message-State: AOAM531/jF7ricChrUHkmUKqo4yTGzYvRHovaf+Ap9Z0GIgWAMw+G2ZY
        msZ49gmR14DKvhxmE82zjmluRuY=
X-Google-Smtp-Source: ABdhPJyl4q7PFUuNkIc0fWw+vhM8J2A7oPKEXlt3TrTeH8BFs3YwXt5tc+5BYWSxSBiI1ACKn3OxAg==
X-Received: by 2002:a02:a895:: with SMTP id l21mr1005625jam.82.1589913422004;
        Tue, 19 May 2020 11:37:02 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id j16sm128705ild.8.2020.05.19.11.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 11:37:01 -0700 (PDT)
Received: (nullmailer pid 441282 invoked by uid 1000);
        Tue, 19 May 2020 18:37:00 -0000
Date:   Tue, 19 May 2020 12:37:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 10/11] dt-bindings: sound: Add Marvell MMP SSPA binding
Message-ID: <20200519183700.GA441251@bogus>
References: <20200511210134.1224532-1-lkundrak@v3.sk>
 <20200511210134.1224532-11-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511210134.1224532-11-lkundrak@v3.sk>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 11 May 2020 23:01:33 +0200, Lubomir Rintel wrote:
> Add binding documentation for the audio serial port interface (I2S) on
> Marvell MMP SoCs.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../bindings/sound/marvell,mmp-sspa.yaml      | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
