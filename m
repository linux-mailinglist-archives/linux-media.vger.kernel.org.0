Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC4A3AA780
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 01:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234630AbhFPXeO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 19:34:14 -0400
Received: from mail-io1-f42.google.com ([209.85.166.42]:41674 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234629AbhFPXeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 19:34:13 -0400
Received: by mail-io1-f42.google.com with SMTP id p66so1040131iod.8;
        Wed, 16 Jun 2021 16:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wfIo0PmRuzO8GRCXqxMnvdj1xpzU9qFtcs6L3FAP3/g=;
        b=Dbtauap9ouHzWQapF3riy4sjfCtDfh/lFGDv86EvqBQhvRqx+YIVCvk4L4yv+3+Yh0
         wRK7EO0pPQD1BznwQhJ0BHUWS+WRcx918HFpqAB0q0uiBg2co0Z1gwO+IbauCJyGGKbu
         RmwWoB4rMs/PYWdd6beJKax1NcO78TGdnAHZzoTyVa87RF1LR4E85v7WH/d0uyNtR0BN
         0GY1ioFogo4Yk3vCz4NiYuvPgj9NkWQEMypqHAJisW08VtGVhTsvanG0siugxjWrPrhH
         GVp35ZMqbZEO8aq00wDvEgOf4tB0OX76I7wEvMpTOUg/1u4qiNew3cAEls+lMaSrrzUV
         Ze3Q==
X-Gm-Message-State: AOAM532P5qF+mzWyJ9UaIcL+lnktvKV+ifsnyMRCsGaKSzKzukDxcTbu
        BlV6KXTYaC1KuzvpSdQz2A==
X-Google-Smtp-Source: ABdhPJxkaEwYRqwX8tOLH4uUuUH3EGmGCjbR6wM/OnagyZsvejKfnYNpcqtW9ON8QKmsYZ1K9u9gQA==
X-Received: by 2002:a5e:df42:: with SMTP id g2mr1403655ioq.166.1623886325974;
        Wed, 16 Jun 2021 16:32:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b15sm1929018iln.17.2021.06.16.16.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 16:32:05 -0700 (PDT)
Received: (nullmailer pid 289545 invoked by uid 1000);
        Wed, 16 Jun 2021 23:32:03 -0000
Date:   Wed, 16 Jun 2021 17:32:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     tharvey@gateworks.com, robh+dt@kernel.org,
        hverkuil-cisco@xs4all.nl, niklas.soderlund@ragnatech.se,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        lars@metafoo.de, matthew.michilot@gmail.com
Subject: Re: [PATCH v2 1/2] dt-bindings: adv7180: Introduce
 'adv,force-bt656-4' property
Message-ID: <20210616233203.GA289511@robh.at.kernel.org>
References: <20210604212217.70518-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604212217.70518-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 04 Jun 2021 18:22:16 -0300, Fabio Estevam wrote:
> Captured NTSC video would be out of sync when using the adv7280 with
> the BT.656-4 protocol. Certain registers (0x04, 0x31, 0xE6) need to
> be configured properly to ensure BT.656-4 compatibility.
> 
> Introduce the 'adv,force-bt656-4' property to allow the ADV7280
> behavior to be consistent with the ADV7180, where BT.656-4 timing
> is used by default.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Remove the part number from the property name (Rob)
> 
>  Documentation/devicetree/bindings/media/i2c/adv7180.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
