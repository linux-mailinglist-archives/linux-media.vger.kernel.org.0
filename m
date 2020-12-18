Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E172DEADC
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 22:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbgLRVRX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 16:17:23 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:39270 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgLRVRX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 16:17:23 -0500
Received: by mail-ot1-f46.google.com with SMTP id d8so3263180otq.6;
        Fri, 18 Dec 2020 13:17:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=89ccsB8fwcyvR7nVAanEz4cE3mkZk/u5xESGL8Aypg0=;
        b=uhjPv7LS6QmRcMStJrwm79kGvRs3/AhzCjqI2FdIjIrJK1tv2sXDstBMPf3RHCeyWA
         BKLZlJ23CbMixR9Dc3nzacajqNk/CJ7U9u1h6isP238t2jPfe7Q3zt38TtHLrNa4gdLn
         WlMUqmekC5JBaUE1x973BGcumaWsO9nnPbZpf3136fYvxQVgfwXtZr/HTjDNucxlW6j8
         xfNkIEJW6zbkR6HdcOh39huUKnJ5d4JGdhdueMrW9qKcBZKcp9mMbrXADLFWZ7HYgJPe
         wTIZ3a3g5tC8SuQLQ4PhBkWkC3GzU/3DfsIQQxv1YM+4FlM2qVaB9Dx7EsqWOlJzf0So
         BLdg==
X-Gm-Message-State: AOAM531Y23OjXMSEf+b1y7VzZn+p0uhUZoTeGhKx7Bph78GZrjAoDUgn
        /psNmxYpY3xZmm8CKEhRKg==
X-Google-Smtp-Source: ABdhPJzY04T8aQwTYaKHVfnIc2gJ2xozigpSv7uj4DUWwOdV4MUVP7lFXhPV2ZveO5oUCilPaNGwFw==
X-Received: by 2002:a9d:347:: with SMTP id 65mr4404416otv.312.1608326202271;
        Fri, 18 Dec 2020 13:16:42 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w5sm1710731oow.7.2020.12.18.13.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 13:16:41 -0800 (PST)
Received: (nullmailer pid 2189895 invoked by uid 1000);
        Fri, 18 Dec 2020 21:16:40 -0000
Date:   Fri, 18 Dec 2020 15:16:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2] media: dt-bindings: coda: Add missing
 'additionalProperties'
Message-ID: <20201218211640.GA2188581@robh.at.kernel.org>
References: <20201117200752.4004368-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117200752.4004368-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 17 Nov 2020 14:07:52 -0600, Rob Herring wrote:
> 'additionalProperties' is now required by the meta-schema. Add it for
> coda. As a result, 'interrupts', 'interrupt-names' and 'power-domains'
> need to be reworked to be defined at the top level.
> 
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/media/coda.yaml       | 42 +++++++++----------
>  1 file changed, 21 insertions(+), 21 deletions(-)
> 

As this wasn't picked up for rc1, I've applied it.
