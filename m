Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7DA1806FF
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 19:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgCJSiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 14:38:09 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:42779 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgCJSiJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 14:38:09 -0400
Received: by mail-ot1-f44.google.com with SMTP id 66so14166445otd.9;
        Tue, 10 Mar 2020 11:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=chsItn4WiJE7pzsGnhBJBMqcVhnfvQYQFixkTol5ZYk=;
        b=EaGUxDpyspCcQquluDu2I+ZoHZ0/Go9Wqypajd204FqIReX2CZ4JXhzFdNA3T0YIXw
         gjDy1IclucFf0khod4x/bJShlEZp1V4POp54fZD9oUMhpTyw8wVB2kenSBw4jqh+x4pZ
         K4SBHeJIh85C1q4KoiPW5fLI/iAXGF8rjfkFvrQ3zT7MTNZrEmKVTOmPYe/LgE7lhOJS
         r+3iIydPOE+jjfEOBsR3OJlPnSxqsVA6aIOePSWECAAMMDkt8e7jzJPBGiuRRuWf9jDS
         uz+VRkPhFttUo56n5IDUYXjshXdRqv0RIfZBDUPTYx30/e9+f3MJG1r9IDO+WFU1PDwu
         du0g==
X-Gm-Message-State: ANhLgQ149nJdSCZEYCPehllOv/QdmBYwbKkp2yctYi9kzZvLt3n0akRJ
        dhXLTjsXt6Kcm9TASbsqnw==
X-Google-Smtp-Source: ADFU+vsSy3ToLL01JhINM1D/WNZOi2tkQmSVGZYt2683m4vdKUspzQPGZvwOiv6OZuKRB8eB55EM0g==
X-Received: by 2002:a05:6830:1d6f:: with SMTP id l15mr17301226oti.299.1583865488168;
        Tue, 10 Mar 2020 11:38:08 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s83sm4446188oif.33.2020.03.10.11.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 11:38:06 -0700 (PDT)
Received: (nullmailer pid 25739 invoked by uid 1000);
        Tue, 10 Mar 2020 18:38:05 -0000
Date:   Tue, 10 Mar 2020 13:38:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     ben.kao@intel.com, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, matthias.bgg@gmail.com, davem@davemloft.net,
        gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
        andriy.shevchenko@linux.intel.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Robert Foss <robert.foss@linaro.org>
Subject: Re: [v1 1/3] media: dt-bindings: ov8856: Document YAML bindings
Message-ID: <20200310183805.GA24623@bogus>
References: <20200310134603.30260-1-robert.foss@linaro.org>
 <20200310134603.30260-2-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310134603.30260-2-robert.foss@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 10 Mar 2020 14:46:01 +0100, Robert Foss wrote:
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> 
> This patch adds documentation of device tree in YAML schema for the
> OV8856 CMOS image sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> - Changes since v3:
>   * robher: Fix syntax error
>   * robher: Removed maxItems
>   * Fixes yaml 'make dt-binding-check' errors
> 
> - Changes since v2:
>   Fixes comments from from Andy, Tomasz, Sakari, Rob.
>   * Convert text documentation to YAML schema.
> 
> - Changes since v1:
>   Fixes comments from Sakari, Tomasz
>   * Add clock-frequency and link-frequencies in DT
> 
>  .../devicetree/bindings/media/i2c/ov8856.yaml | 129 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/media/i2c/ov8856.example.dts:26.28-29 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:311: recipe for target 'Documentation/devicetree/bindings/media/i2c/ov8856.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/media/i2c/ov8856.example.dt.yaml] Error 1
Makefile:1262: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1252173
Please check and re-submit.
