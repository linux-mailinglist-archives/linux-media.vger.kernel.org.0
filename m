Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5993139D17
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 00:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729123AbgAMXEs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 18:04:48 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42653 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729083AbgAMXEs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 18:04:48 -0500
Received: by mail-oi1-f196.google.com with SMTP id 18so9994443oin.9
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2020 15:04:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j72A3ysn20dtwXavsRrsZ0TJajmTyr3n32DpYKMjbOU=;
        b=NpiPQdW/Vc7ATosygP1mE7VGf/SPOVLbiBRETp2MOMyMRbiggp/47NKTrni7yFuoAl
         OmJf/quXJ62ptwOhIqnQDtofHOCyDiaTejHOIiYU+AhFOtmhR261fNsMMAfLJCbhtq1s
         zrhJpX8Pa+4Xh6dJvcnjZmGOmC2/StaVQP1jkK/Hw51/I2Ux2G8SFic+Jm3DGVqHW3X9
         N2beYJCS7MIvF01NVfUY4en6x2XCuvg577iCUJQg2Rs2iTcrW9i/k7lm/WBupDo7itSS
         XKiSUjxMLbKCh34aoUq7CaPDuVJfxV8gQBJQvC2sXC5zz4Hvzu5BjhYZJ9SDcKHLMnkv
         CCOg==
X-Gm-Message-State: APjAAAXTy+l5LrNWrGuvUhQ+HniF7awOTQchO+Uhc6cNUAr3gVJL15aL
        BSSGqhe5ukDD5OfuC8rjt8dq/xk=
X-Google-Smtp-Source: APXvYqy2uaRhJhSj+rPQUz4YunEOS2AJcKSF7oYt4zEIm+m6KEVuuIHrOYOS4t+JviTU2hZfwuOVUA==
X-Received: by 2002:aca:4ad1:: with SMTP id x200mr13955868oia.104.1578956686538;
        Mon, 13 Jan 2020 15:04:46 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f3sm4615496oto.57.2020.01.13.15.04.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 15:04:45 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220b00
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 17:04:44 -0600
Date:   Mon, 13 Jan 2020 17:04:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        peter.griffin@linaro.org, dave.stevenson@raspberrypi.com,
        ezequiel@collabora.com, sakari.ailus@linux.intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add IMX219 CMOS sensor
 binding
Message-ID: <20200113230444.GA3528@bogus>
References: <20200110200915.22575-1-andrey.konovalov@linaro.org>
 <20200110200915.22575-2-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200110200915.22575-2-andrey.konovalov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 10 Jan 2020 23:09:14 +0300, Andrey Konovalov wrote:
> Add YAML device tree binding for IMX219 CMOS image sensor, and
> the relevant MAINTAINERS entries.
> 
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  .../devicetree/bindings/media/i2c/imx219.yaml | 104 ++++++++++++++++++
>  MAINTAINERS                                   |   8 ++
>  2 files changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
