Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C39A47D5E6
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 18:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234189AbhLVRgh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 12:36:37 -0500
Received: from mail-qk1-f174.google.com ([209.85.222.174]:42531 "EHLO
        mail-qk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232852AbhLVRgh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 12:36:37 -0500
Received: by mail-qk1-f174.google.com with SMTP id r139so2133423qke.9;
        Wed, 22 Dec 2021 09:36:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MGvLxNbnv1yXnPfEUA4YmJD/7GmjFpBsuJy1d9gC7Jo=;
        b=LYJMpSB8p6V8HWBUlB4+47YbMNyUQOeePclnbr7KNVA1AT10zMFvOpkesxiBP7GTZa
         eKZ+8FTVBpvfq6VaJRYMa7NW2DjTpRzwl2846pmtMRAxPgF5JPICQ23uGVjN/c1wn4Lh
         iWMX3KMdHysvsBq1js39lRbZdXDTvcobea+4pfCqqrHEBPBJOKlfHUWnP11SZ9WVCjkQ
         eIX9o85HNDc9I5eH77tZs1SOdVuvT8OpFckwX07huBjusA6kpKRuOSTGmsl5S60awzSY
         w3AgvmAsOD7enDHJcNlvjJ/CI1fXqMQkXlTVqVI8qnBLI8u/9nhER61tZ+vDp5slwpt/
         125g==
X-Gm-Message-State: AOAM532HHDcwYw8/0DX383fHNu2E8MTu7VzJh4TxqdaAt4m5W37uzCey
        gkqtRGujt/omNshhX786rg==
X-Google-Smtp-Source: ABdhPJwr9vhWhKamfOxfcQFZ2fWm40jAdT9WTBnI7eQ5cw28bkPH4/1XsVoggivH0Uhbk7AWn06wqA==
X-Received: by 2002:a37:aa0f:: with SMTP id t15mr1355701qke.233.1640194596608;
        Wed, 22 Dec 2021 09:36:36 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
        by smtp.gmail.com with ESMTPSA id f141sm1463572qke.92.2021.12.22.09.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 09:36:36 -0800 (PST)
Received: (nullmailer pid 2377859 invoked by uid 1000);
        Wed, 22 Dec 2021 17:36:34 -0000
Date:   Wed, 22 Dec 2021 13:36:34 -0400
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX296 CMOS sensor
 binding
Message-ID: <YcNiIoNfu+XTcFhX@robh.at.kernel.org>
References: <20211219220948.28953-1-laurent.pinchart@ideasonboard.com>
 <20211219220948.28953-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211219220948.28953-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 20 Dec 2021 00:09:47 +0200, Laurent Pinchart wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Add YAML devicetree binding for IMX296 CMOS image sensor. Let's also
> add MAINTAINERS entry for the binding and driver.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v4:
> 
> - Rename to sony,imx296.yaml
> - Add Laurent Pinchart as maintainer
> - Rename power supplies
> - Rename clock to INCK
> - Drop clock-frequency property
> - Reference OF graph DT schema
> - Mention reset GPIO pin name
> - Fix schema $id
> - Fix port
> ---
>  .../bindings/media/i2c/sony,imx296.yaml       | 95 +++++++++++++++++++
>  MAINTAINERS                                   |  8 ++
>  2 files changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
