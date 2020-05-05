Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 783001C5C71
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 17:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730627AbgEEPsl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 11:48:41 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46361 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729828AbgEEPsl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 May 2020 11:48:41 -0400
Received: by mail-ot1-f66.google.com with SMTP id z25so2006903otq.13;
        Tue, 05 May 2020 08:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kCQr2A1yVRSlZqXHXQYGpMp329yMREeOZVsfc6fgXVk=;
        b=tqaTX3W6aL8KJjYAEZlyzQWpnV1E+VBstXeVCv23HcTMgrbVh3OhHlHKHi5mq2GUdT
         DzDnkiLvYJPNWYwUu+BZDdry5QYw2T/K2pFIbcJhNPQBbMXjlKtekYlDWf18tfQNj02w
         TeeFol+/2JiLo0U0e2GxbwvpwC46HDocV+K9eYpSWVV+MGqaU9YzO5t4E32hh0wk8xnf
         TQDY0Y811sajk3xmOszGlvY8UjTHVZvkg+ckS6MF3nEo9GM3X0g+tuNio5EF66Ln1Xwc
         zdgJFgocVywcEOQHDUZDGDCT5VfEclgvBWEMBkCoPgKL4O5Bkv/WyJxyx2lNejF5XNtb
         132w==
X-Gm-Message-State: AGi0PubqxMFGTHxYVSVEqmBJqXe8glnlvWtCQb6JztjLSivtJqVNoWbo
        ShLCMR08QIbrKYQSm82XIg==
X-Google-Smtp-Source: APiQypJCQ6L9Z5niSmW5s26himlp5zzFw8N3HJiPoMh8Mhq/be6p7Kqv2MO27rDACBO141zFh4YN5A==
X-Received: by 2002:a9d:a55:: with SMTP id 79mr2843947otg.295.1588693719487;
        Tue, 05 May 2020 08:48:39 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r6sm657754oom.26.2020.05.05.08.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 08:48:38 -0700 (PDT)
Received: (nullmailer pid 16464 invoked by uid 1000);
        Tue, 05 May 2020 15:48:38 -0000
Date:   Tue, 5 May 2020 10:48:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Robert Foss <robert.foss@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, Ben Kao <ben.kao@intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v10 1/3] media: dt-bindings: ov8856: Document YAML
 bindings
Message-ID: <20200505154837.GA16403@bogus>
References: <20200505100129.104673-1-robert.foss@linaro.org>
 <20200505100129.104673-2-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505100129.104673-2-robert.foss@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue,  5 May 2020 12:01:29 +0200, Robert Foss wrote:
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> 
> This patch adds documentation of device tree in YAML schema for the
> OV8856 CMOS image sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> ---
> 
> - Changes since v9:
>   * Remove remote-endpoint property
>   * Marco: Make port property required again
>   * Sakari: Remove Ben as a maintainer
>   * Sakari: Replace data-lanes with const items
>   * Sakari: Remove clock-lanes property
>   * Sakari & Rob Herring: Change type of link-frequency
>     work around dt-schema bug
> 
> - Changes since v8:
>   * Maxime: Added r-b
> 
> - Changes since v7:
>   * Marco: Make 'port' property optional
>   * Maxime & Sakari: Add 'link-frequencies' property to dt binding
>   * robher: Improve description for 'port' property
> 
> - Changes since v6:
>   * Marco: remove qcom specifics from DT example
>    
> - Changes since v5:
>   * Add assigned-clocks and assigned-clock-rates
>   * robher: dt-schema errors
> 
> - Changes since v4:
>   * Fabio: Change reset-gpio to GPIO_ACTIVE_LOW, explain in description
>   * Add clock-lanes property to example
>   * robher: Fix syntax error in devicetree example
> 
> - Changes since v3:
>   * robher: Fix syntax error
>   * robher: Removed maxItems
>   * Fixes yaml 'make dt-binding-check' errors
> 
> - Changes since v2:
> 
> - Changes since v1:
>   Fixes comments from Sakari, Tomasz
>   * Add clock-frequency and link-frequencies in DT
> 
>  .../devicetree/bindings/media/i2c/ov8856.yaml | 142 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 143 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
