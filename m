Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C692B4A0B
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 16:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731617AbgKPPx7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 10:53:59 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38388 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730396AbgKPPx7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 10:53:59 -0500
Received: by mail-ot1-f67.google.com with SMTP id a15so16458805otf.5;
        Mon, 16 Nov 2020 07:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rTmh5jusf0tDhr7bUvAqPaqtkGAA8RIhHW5W1uc7Cfc=;
        b=uIUAhnT5SRATksmkT1CUgepu0vXdOyjJpGefyK7qEhZ1vRlvwEDFRQCuwPGl+94hwE
         OrwxWdKcCgNBKncHj9VegaJsN+jaE2Uq/U+2kVNPdzOI6OPXlpo5tKEkeYmXp5savPla
         YppfNHhkEg7Db9hL/1T1CbPo80HfuW7GQjpU8M9pC5SAMTn3iODTicgv86pIOWk4ZPvV
         +Ew4AMFHYUIQcDc5EoZ7OO0XwaryXmGeZdOqJWumH8U8J6vQtCHJwPrPabHeoNIjMcnl
         fZms0VqvN260GslrjcrIrDEpJo0GNQXNRpZysTZxF3zkq13z+2jF770pFa0YuuiBWkB+
         qeug==
X-Gm-Message-State: AOAM531cj3+hYono+Iw9S8OdU9f/W+ax/ktUX95Y3DF3Po5C8JVE8d3E
        wJq8Y3PLxVXTt45PJcplew==
X-Google-Smtp-Source: ABdhPJyGgW1yh0pCHQ3a23FaVB/foP0RfV9uZA36M4IxOaZ5LNVVwZIiUm4TQvYgNQzCXj6y0u3yWg==
X-Received: by 2002:a9d:620d:: with SMTP id g13mr10474082otj.56.1605542038583;
        Mon, 16 Nov 2020 07:53:58 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w18sm4823639otl.38.2020.11.16.07.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 07:53:57 -0800 (PST)
Received: (nullmailer pid 1717829 invoked by uid 1000);
        Mon, 16 Nov 2020 15:53:57 -0000
Date:   Mon, 16 Nov 2020 09:53:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Maxime Ripard <mripard@kernel.org>,
        =?iso-8859-1?Q?K=E9vin_L'h=F4pital?= <kevin.lhopital@bootlin.com>,
        devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add OV8865 bindings
 documentation
Message-ID: <20201116155357.GA1717707@bogus>
References: <20201113170344.2252234-1-paul.kocialkowski@bootlin.com>
 <20201113170344.2252234-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201113170344.2252234-2-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 13 Nov 2020 18:03:42 +0100, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the OV8865
> image sensor.
> 
> Co-developed-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
> Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../bindings/media/i2c/ovti,ov8865.yaml       | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
