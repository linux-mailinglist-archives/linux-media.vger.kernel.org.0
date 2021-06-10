Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFC803A30C8
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 18:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbhFJQjY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 12:39:24 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:42773 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhFJQjX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 12:39:23 -0400
Received: by mail-ot1-f47.google.com with SMTP id w23-20020a9d5a970000b02903d0ef989477so270799oth.9;
        Thu, 10 Jun 2021 09:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wdQKSCrcRex0e+UJ+sU32HCth0EXxp66LSDLxbGJ5hI=;
        b=DvSgGPc9R43Udo8ms1wE1+j8vqHgIHa37b9GSv4jvrYRvfIYlfFmcqdG4mcfqVGNgW
         z4HfEKXsahfWhbw9vlX4pmznvK3Chq5HsYZmaxkV5a0xGQnCFf9CEd838EXRzydwIefh
         2h6X3Mi2yuThDdsuGMwiXGdsKoIvAlHTugV6XkkVPVsXHonwayFHngYknLijgGDyifZZ
         1YPo3rX/1ifebKEI30UKKCVOMeP+SpIRM9s0I/o5Hae9gXVNbfK4Z8T0gmLCy6vuMh4l
         xo88KMzdqhDKWTzAQ3S+z5SUshV6BoZBXcDOC3DkjaGVKp5ocDG0OjcPmRuBfi6yzHtj
         3yiA==
X-Gm-Message-State: AOAM532Q7SdPM9ZvvqIDCiqOTRhKnepJW9s1y7M2OnmGjRa5tUD0HfSw
        Lcrn+wqBeZUf30P6fq/QBg==
X-Google-Smtp-Source: ABdhPJwDCcHfdElit0dk67HErzfQ95wKwnoorc+o7d4BDoNVAnuLCxH8V7KBFB5toXOck0p4yfCO7g==
X-Received: by 2002:a9d:7987:: with SMTP id h7mr3306882otm.98.1623343046512;
        Thu, 10 Jun 2021 09:37:26 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
        by smtp.gmail.com with ESMTPSA id h23sm647491oih.30.2021.06.10.09.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 09:37:25 -0700 (PDT)
Received: (nullmailer pid 1935041 invoked by uid 1000);
        Thu, 10 Jun 2021 16:37:20 -0000
Date:   Thu, 10 Jun 2021 11:37:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     linux-kernel@vger.kernel.org, paul.kocialkowski@bootlin.com,
        mchehab@kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, shawnx.tu@intel.com,
        linux-media@vger.kernel.org, pavel@ucw.cz,
        laurent.pinchart@ideasonboard.com,
        krzysztof.kozlowski@canonical.com, kernel@puri.sm
Subject: Re: [PATCH v4 2/5] dt-bindings: media: document SK Hynix Hi-846 MIPI
 CSI-2 8M pixel sensor
Message-ID: <20210610163720.GA1935008@robh.at.kernel.org>
References: <20210607105213.1211722-1-martin.kepplinger@puri.sm>
 <20210607105213.1211722-3-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607105213.1211722-3-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 07 Jun 2021 12:52:10 +0200, Martin Kepplinger wrote:
> Document the bindings used for the SK Hynix Hi-846 CMOS camera driver.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  .../bindings/media/i2c/hynix,hi846.yaml       | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
