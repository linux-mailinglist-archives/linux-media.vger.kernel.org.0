Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 566B3180AB1
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 22:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727559AbgCJVnB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 17:43:01 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43366 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgCJVnB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 17:43:01 -0400
Received: by mail-ot1-f65.google.com with SMTP id a6so6835261otb.10;
        Tue, 10 Mar 2020 14:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=eW7ELASoG0OtB4K4kA9IffK9e9FfpEljMwdF56ZNsBk=;
        b=tO8O5zhXJbmoZC6uRx5s19hdIJa+1iRecyFxKk7xZMAyp/EP7eSf3hleGemuc0vXjM
         0h954VsG4gKP1CEL/6yGcU2JsNwmVoLOohLVihT/Cta8fvdsLYyrKzlgiksvcwZshFKa
         wWVOCYpt5ZCXwIbOKp3XcPzTkOnFFGQ+p0WvFoAgWieOPnT30Xv45Kqck5aOZeSYY5wT
         sFknNB/X4l7YwAqX1F+3lComIwhf9lGH6RdKNkWye6czwgoAsbJTQ2yGOCfDgi6IdQbE
         5qRT/RtKNmwePm5NJUOML3dhwtQ60HSV8knbOoyUiBXjq9x3votm8Jzzm4u+aRf1cowf
         pzBw==
X-Gm-Message-State: ANhLgQ2Z5NIdkEQE4phfiKnFAV4b9Xi0UMdVgrhtBO0hZnif5rgUU6VX
        pva4rTYhmYQfzDgfZiOVYRIwTa8=
X-Google-Smtp-Source: ADFU+vvwZI4JYSOwNE4eXQ6CWBvYrUySTEekRgHvm0zdXlyuecA4eZ99Vd7iwCtwQbRRdnA94c8SHw==
X-Received: by 2002:a9d:4007:: with SMTP id m7mr18762385ote.268.1583876580662;
        Tue, 10 Mar 2020 14:43:00 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j5sm16353458otl.71.2020.03.10.14.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 14:43:00 -0700 (PDT)
Received: (nullmailer pid 20627 invoked by uid 1000);
        Tue, 10 Mar 2020 21:42:59 -0000
Date:   Tue, 10 Mar 2020 16:42:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v3] dt-bindings: rcar-vin: Convert bindings to json-schema
Message-ID: <20200310214259.GA20527@bogus>
References: <20200305005537.385602-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200305005537.385602-1-niklas.soderlund@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu,  5 Mar 2020 01:55:37 +0100, =?UTF-8?q?Niklas=20S=C3=B6derlund?= wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Convert Renesas R-Car VIN bindings documentation to json-schema.
> 
> As the examples in the bindings now can be tested add a new one which
> describes how the both a parallel and a CSI-2 source can be connected on
> Gen3 SoCs.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../devicetree/bindings/media/renesas,vin.txt | 217 ----------
>  .../bindings/media/renesas,vin.yaml           | 402 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 403 insertions(+), 218 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,vin.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,vin.yaml
> 

Applied, thanks.

Rob
