Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E01D134DB0
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 21:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgAHUdZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 15:33:25 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41950 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgAHUdZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 15:33:25 -0500
Received: by mail-oi1-f196.google.com with SMTP id i1so3864148oie.8
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2020 12:33:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u9lGx1KGncwRhu5gmclKsigxLVgAIjFaP4Z6LNjc8ZM=;
        b=cobpn1oY5Fg0wnkuLIWbGGtlwfl6+jofZ6RCtMJYuMnJoy2F6OU5SX78mqWYVI9pEX
         0+ciDP9QagcTFuxFSGMdo+csI5EQIGmXaZcgEIco5WfU+77He3QH+h22jaTbflKRP404
         6aRDAueR8fASMlM8DDes/A+A8r6cz8bdh6U1QvghbOzalCL0q6un2YBN0Tln0b9FAB5+
         wNu+nAQDeMPXKw0vqqP69phy+mrF/AFlgMb750KMSZ6TC8rs3nLsLCpXHTm+nZEeBdCr
         P1ynk6toeB4rYx9jMFoVi8R3Z0m5Z9uXeoG5yDroY32t9RwWT0a+6F8O6ws1iYf3BOpk
         bynw==
X-Gm-Message-State: APjAAAXwK9pJISriI4eKYOPP8sgYZPgeC30P1tktG1GOcJWCnRmSEl8z
        gIqd6q6RcydlRfvJkemIXHGkJuo=
X-Google-Smtp-Source: APXvYqzH4MMz6SnDDiPYtRqw9azvGikjo6MVnkZibf4MROV/g2wAMZb2ZIVdkt8TW3n5anaTrkESFA==
X-Received: by 2002:aca:50cd:: with SMTP id e196mr365307oib.178.1578515604808;
        Wed, 08 Jan 2020 12:33:24 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 69sm1514737oth.17.2020.01.08.12.33.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 12:33:24 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2208fa
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 14:33:23 -0600
Date:   Wed, 8 Jan 2020 14:33:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH 2/3] Documentation: dt-bindings: media: add AST2600 Video
 Engine support
Message-ID: <20200108203323.GA18757@bogus>
References: <20200107011503.17435-1-jae.hyun.yoo@linux.intel.com>
 <20200107011503.17435-3-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107011503.17435-3-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon,  6 Jan 2020 17:15:02 -0800, Jae Hyun Yoo wrote:
> The AST2600 has Video Engine so add the compatible string into the
> document.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/media/aspeed-video.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
