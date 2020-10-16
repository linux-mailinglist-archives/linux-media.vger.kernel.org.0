Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184132908C8
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 17:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436499AbgJPPqA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 11:46:00 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38189 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436492AbgJPPqA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 11:46:00 -0400
Received: by mail-ot1-f68.google.com with SMTP id i12so2805169ota.5;
        Fri, 16 Oct 2020 08:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iPvlTs6OoobJfJVJSiPEYBQcBLpEIvnmvgQxKnYTOdw=;
        b=PP4FsqTl4GIoCFGgjXH8yurgIN0w9K79BT80xtRWZYb43tckz+OytdnENizbCbbQbg
         DFK5A3C1Lo+m+/LS+Hkdl+k8WrvlKgkJb9dpmuN3wwNVCFyiNO2NyUQxOhfOWJNOVZVW
         78/nyaWO5tjTcCr4+nrmv7nuFbybbl7yVRSM9cn6VyjAjapTavE8NBtzVQrh1WzGLZAQ
         U6yAYXPXT9IjgHrD4imHnISxfUy3itN5F+4/ow/FET5lp19keyQ11YptT5LOjVw1Oq5m
         NTwneDtPhgx9bTPjmggpC/fL8cI+21cUt7p8ospNa8f8TCE8R7sI/WvHQGkn9HIdtE4Z
         Ajtw==
X-Gm-Message-State: AOAM532ET61vbV89eCvua8vtLx41TBVqGdKBcNGOoxaiJK+8wRRwkhY/
        nIwRACCSheEIlwpz3/gEEg==
X-Google-Smtp-Source: ABdhPJzsEx8YohXRxoZLwFQ6cq9xth/ljkv21fGHXMUMn2X/2dXe4dmrEqSBNAKZV/25Wl8t0ODUYA==
X-Received: by 2002:a9d:5d0c:: with SMTP id b12mr3245009oti.170.1602863159049;
        Fri, 16 Oct 2020 08:45:59 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k21sm1100315otr.27.2020.10.16.08.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 08:45:58 -0700 (PDT)
Received: (nullmailer pid 1469664 invoked by uid 1000);
        Fri, 16 Oct 2020 15:45:57 -0000
Date:   Fri, 16 Oct 2020 10:45:57 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     sakari.ailus@linux.intel.com, Hans Verkuil <hverkuil@xs4all.nl>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: imx7-mipi-csi2: convert bindings to
 yaml
Message-ID: <20201016154557.GA1469085@bogus>
References: <20201014142759.726823-1-rmfrfs@gmail.com>
 <20201014142759.726823-4-rmfrfs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014142759.726823-4-rmfrfs@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 14 Oct 2020 15:27:59 +0100, Rui Miguel Silva wrote:
> Convert imx7 mipi csi2 bindings documentation to yaml schema, remove
> the textual document and update MAINTAINERS entry.
> 
> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> ---
>  .../bindings/media/imx7-mipi-csi2.txt         |  90 ---------
>  .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 181 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 182 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

./Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml:111:15: [warning] wrong indentation: expected 12 but found 14 (indentation)


See https://patchwork.ozlabs.org/patch/1382165

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

