Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 284D03C6354
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 21:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234498AbhGLTNy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 15:13:54 -0400
Received: from mail-il1-f172.google.com ([209.85.166.172]:42616 "EHLO
        mail-il1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233504AbhGLTNx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 15:13:53 -0400
Received: by mail-il1-f172.google.com with SMTP id h3so20627703ilc.9;
        Mon, 12 Jul 2021 12:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KDeCEh+D/0pr2XfzfVAb7hT42m+8aaWxMNpNgHC5hY8=;
        b=OsTLrovMvPLOL/pguYjlluLXDrA9Bbl4CgXGVDvxjiLzO7eZ9uKAU1e8OLokmP9IaT
         sLAs+q6VhkWBe5nas7d2Xkx+fNfBgFySTemNWHjRFf5ycSBp3W9x3CcwTQ9ZLgbJZdYx
         Z9oIJXJ4KdMwj9djpYbUOXhN9rrcVl4ymqcC+qnFmfg2wUXP2WFn9UINJgsU24qPXZmk
         bhsm204396M/d+uBFLvpVTU6U9B8j9y1AqRT8oWttAf7iuJmtv/4JIFNv3E4nPYtuoC4
         FDEFzbVdWYYLcxy21TKd9CgDC6TdKvyDXXonSoPZmEGnl1ULdMuVO9zr3N4JmgXk+TYO
         uK7w==
X-Gm-Message-State: AOAM531AxO+wE9EU1qTXQ1dkFRXX+WQg6G7qrAOe5uxx/NUFgqfZ4z3N
        xDDKkq0YfsfXPBP6EG7/vQ==
X-Google-Smtp-Source: ABdhPJxINxOQbkOPSUeTHrh+j560TiyF4+WVEtfyHKvmJlOXN+oa6fjedFHors7KConAc0zn96SOSw==
X-Received: by 2002:a92:c805:: with SMTP id v5mr221476iln.293.1626117064532;
        Mon, 12 Jul 2021 12:11:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d8sm5312716ilq.88.2021.07.12.12.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 12:11:03 -0700 (PDT)
Received: (nullmailer pid 2316421 invoked by uid 1000);
        Mon, 12 Jul 2021 19:11:00 -0000
Date:   Mon, 12 Jul 2021 13:11:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     festevam@gmail.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        phone-devel@vger.kernel.org, kernel@puri.sm,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev, shawnguo@kernel.org,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        mchehab@kernel.org, slongerbeam@gmail.com, krzk@kernel.org,
        m.felsch@pengutronix.de
Subject: Re: [PATCH v5 1/3] dt-bindings: media: document the
 nxp,imx8mq-mipi-csi2 receiver phy and controller
Message-ID: <20210712191100.GA2316363@robh.at.kernel.org>
References: <20210618095753.114557-1-martin.kepplinger@puri.sm>
 <20210618095753.114557-2-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618095753.114557-2-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 18 Jun 2021 11:57:51 +0200, Martin Kepplinger wrote:
> The i.MX8MQ SoC integrates a different MIPI CSI receiver as the i.MX8MM so
> describe the DT bindings for it.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  | 173 ++++++++++++++++++
>  1 file changed, 173 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
