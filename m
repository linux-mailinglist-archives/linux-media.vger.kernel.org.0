Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1669226A47
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 18:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388887AbgGTQci (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 12:32:38 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35245 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731808AbgGTQch (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 12:32:37 -0400
Received: by mail-io1-f65.google.com with SMTP id v8so18270263iox.2;
        Mon, 20 Jul 2020 09:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yQyvs1jRHaG4iCDzDf8+qWStV4fhrEVZDcK1+1MvdZw=;
        b=ffUUXhgl8xxspbPMTooZU2d7B4r17cpo6A9CTfFnq94BrfIi7vzstq7va/c0S0uB0t
         NpL1p1+Q1Uo5xCCennh53Fmaq0mSuyIKepPP8quROzY9M5H2WBIWk++QmOeenBTVJqX3
         kcN5Wtd0dnngvGKYzNxAOfhfRqfRcvQrIovgua9EiDDPyr1j4vruW30DKOM4y+ciOHv+
         PXOZs7POL9n0wn58lq2bMVe271C6lcYjFyN+Eg02Bc7S+hydD04L/erqwMzFc9sfHrJe
         ME6zOx7QU0hC1n1kW8aAWC+e+kSwV2KCw4JYKz8nH1AbXe+EIQKIdEk6/rqdct49UdKb
         L0Ig==
X-Gm-Message-State: AOAM532sQLGgyDuAqJ9XC3BIEIJWmftyzpD0QphuciiXNcnzPEfsrdr4
        Bto2SuhgozTvGLdMc5N/dG5F+dJQgw==
X-Google-Smtp-Source: ABdhPJwknigBOGgNYAdUjh4u6rS8PisVTTSLhhXo4Mpm0o84omeZS5Hi+Wkk+jC2ZNgZWLbPh0RBwg==
X-Received: by 2002:a5d:964b:: with SMTP id d11mr6997577ios.30.1595262756173;
        Mon, 20 Jul 2020 09:32:36 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id v7sm563525iol.53.2020.07.20.09.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 09:32:35 -0700 (PDT)
Received: (nullmailer pid 2625208 invoked by uid 1000);
        Mon, 20 Jul 2020 16:32:34 -0000
Date:   Mon, 20 Jul 2020 10:32:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, slongerbeam@gmail.com
Subject: Re: [PATCH 01/13] dt-bindings: media: ov5640: Convert to json-schema
Message-ID: <20200720163234.GA2624150@bogus>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717132859.237120-2-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 17 Jul 2020 15:28:47 +0200, Jacopo Mondi wrote:
> Convert the ov5640 bindings document to json-schema.
> 
> This commit ports the existing bindings, clean up patches
> will follow.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../devicetree/bindings/media/i2c/ov5640.txt  |  92 ---------
>  .../devicetree/bindings/media/i2c/ov5640.yaml | 181 ++++++++++++++++++
>  2 files changed, 181 insertions(+), 92 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/ti,cal.example.dt.yaml: camera-sensor@3c: 'DOVDD-supply' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/ti,cal.example.dt.yaml: camera-sensor@3c: 'AVDD-supply' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/ti,cal.example.dt.yaml: camera-sensor@3c: 'DVDD-supply' is a required property


See https://patchwork.ozlabs.org/patch/1331124

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

