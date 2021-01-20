Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 366852FDDDC
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 01:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388743AbhAUA1C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 19:27:02 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:40319 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731107AbhATVl0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 16:41:26 -0500
Received: by mail-ot1-f49.google.com with SMTP id i20so17041550otl.7;
        Wed, 20 Jan 2021 13:41:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J0YHlRvjXhbtWV7cijXv2s0PvO46nO52LNnMMyM6xCU=;
        b=SiDbyOrbM+SbwzpP+GFDDoUZc4I9ivahXpUERtpjDmswRQrllL8+B0nU2RDZV/t9YQ
         6p+lKldL0/XHE7h0rPcsCZWL5N9iDqu3wAyuR95kkWaEvtRDSUbTwE5jJXYJZ843A5k+
         J5Y2JR88sdxlcdolnJ2bECU/9BUx7TnyMjqssyRL5o+jxP2R+FP6dtn25wNn0c0cvMxV
         marz1N5FbFmaEbiM5v38++4DnbFLuqm+V9S/LZhelAmGD7SxlH+Oe8KPM095Kgv3Kilp
         oXxPu26LwAewhcC3zCq1UD5/xalzs5W7H+J49l1Jclrxz1XW/InxTVUAfaavZq6Xg3F4
         gIRg==
X-Gm-Message-State: AOAM531g+iWIBJlpC4Z5s79DVcL5PaSs48zCai4GwA+FFOw4bvEonRXl
        jrJ59w+029OiszoRipp0KQ==
X-Google-Smtp-Source: ABdhPJz8yQvdalhscvD/UWFVBlpc3iBJUiLJiA+LxvqqUzL5npHPn8oRMocYKWAWpTCbsHywe/bCkQ==
X-Received: by 2002:a9d:65d4:: with SMTP id z20mr8490633oth.349.1611178845104;
        Wed, 20 Jan 2021 13:40:45 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p132sm618863oia.41.2021.01.20.13.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 13:40:42 -0800 (PST)
Received: (nullmailer pid 883229 invoked by uid 1000);
        Wed, 20 Jan 2021 21:40:40 -0000
Date:   Wed, 20 Jan 2021 15:40:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: media: i2c: Fix $id of renamed
 ov5647.yaml
Message-ID: <20210120214040.GA882505@robh.at.kernel.org>
References: <20210120180403.1580423-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120180403.1580423-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 20, 2021 at 10:04:03AM -0800, Bjorn Andersson wrote:
> The recent rename of ov5647.yaml missed to update the $id, resulting in
> a binding check error. Fix this.
> 
> Fixes: 1b5071af8240 ("media: dt-bindings: media: i2c: Rename ov5647.yaml")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

There's already a patch for this one.

Rob
