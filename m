Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADC6E123CEA
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 03:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbfLRCLS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 21:11:18 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38499 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbfLRCLS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 21:11:18 -0500
Received: by mail-ot1-f65.google.com with SMTP id h20so402846otn.5;
        Tue, 17 Dec 2019 18:11:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZcqLEa5n7h3ikutpdSd3t6thjVHG/YAZxYICg213uf4=;
        b=jIqnk4dJ30b5rqQSmB/mTqNdbf0LqXeWPCSpIKRyVf1iLXSYJJ4coFZvAKM6FqVK3P
         wgyIxTMmkghkw45l1HsCm1GPu7EW68S4t6XEqLbCWPtbPwtBPvASi+xvmIwC23cW8wBl
         9jTkdPoC3HqYGbpgMn5GEbcndaWDitO82b/lUbguXPs1VEgMlZGEXh5rpr4ttxA/T14k
         ZWMo2VwlC06WjKg++Il4SG4AKpI+79C+8WU13+LMU0S8N2QLUpvXD3JT/uwoL/41sX2h
         JcCxpquDu/TxkFW0enKin4dOtxz6fjAK3/Al6EvdtymnQaZUj8qMO8WtdNgFLtTR2YAQ
         Wtlg==
X-Gm-Message-State: APjAAAXw78Lg1SQtuAD8w8FuVtTC6vM6NKyXgySbpiOg1VWYKyZ5821i
        2nTY/bojeVRhvxjr87drLw==
X-Google-Smtp-Source: APXvYqwNcQwVqUwr8FXCji1vP3issJ1yUDzKoqK0jsEeQj5heCaceaFAzEMZxWYmnxxHXcOyZolM/w==
X-Received: by 2002:a9d:eea:: with SMTP id 97mr367606otj.177.1576635077244;
        Tue, 17 Dec 2019 18:11:17 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a65sm245302otb.68.2019.12.17.18.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 18:11:16 -0800 (PST)
Date:   Tue, 17 Dec 2019 20:11:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] dt-bindings: media: Convert Allwinner A31 CSI to a schema
Message-ID: <20191218021115.GA23294@bogus>
References: <20191213074355.26840-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191213074355.26840-1-maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 13 Dec 2019 08:43:55 +0100, Maxime Ripard wrote:
> The newer Allwinner SoCs have a camera controller that is supported in
> Linux, with a matching Device Tree binding.
> 
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../media/allwinner,sun6i-a31-csi.yaml        | 115 ++++++++++++++++++
>  .../devicetree/bindings/media/sun6i-csi.txt   |  61 ----------
>  2 files changed, 115 insertions(+), 61 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/sun6i-csi.txt
> 

Applied, thanks.

Rob
