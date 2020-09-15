Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A35E626AE7F
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 22:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727925AbgIOUKb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 16:10:31 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:45530 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727824AbgIOUKW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 16:10:22 -0400
Received: by mail-il1-f193.google.com with SMTP id h2so4207845ilo.12;
        Tue, 15 Sep 2020 13:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IV031jUP/TZu/JzVoFlGBKRBFgPmZZCmfyuxJ+ikJ5c=;
        b=Jul7GiVHuF950kAdgMMLpwmeY6KCDfMSk+OLD1RoiD4PkETINqb3DT2vDXG1rXxOC9
         HT1uXLFOIwpQ4GyuoGRc9TrN1sLsEn0HisYC4f+OVAZsXBa7tmFjj+nJ6bN/1ErACfjB
         m7u6aULap+osdPl7XMRQNJSaNfBpxvLBE22AE7l4SF6P0UOfv6llTQaH7yTlHqXR5PN5
         a9GLXwj7hCxoSpv+Y9juiJa0VTYNgrYMF+EpQfzKpnEouDtNtc2GYDLNDUzVqcSo07ZX
         XreD+UM5+K0QLkfcWB9BljGEcOd0Lhg8ICkehHERWLfqV2SbGLj1U7oAj2dodTs4I8C7
         Urpg==
X-Gm-Message-State: AOAM530fvyzE5uFty6QJ5/GQVWwk0DcOVZbxwyyTm6RN2yl+BzBWL9Qv
        o46eq1ut+tkCIFd0w/JrYw==
X-Google-Smtp-Source: ABdhPJxMj+1JHaFMwhb/m7+YgXw7/GvTBN9/8rXpOwkDV9gTVf9cv87SvilO2UgNo0mLSna7S0pT2w==
X-Received: by 2002:a92:d1d0:: with SMTP id u16mr13004991ilg.171.1600200620938;
        Tue, 15 Sep 2020 13:10:20 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id z18sm9674216ill.1.2020.09.15.13.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 13:10:20 -0700 (PDT)
Received: (nullmailer pid 2425186 invoked by uid 1000);
        Tue, 15 Sep 2020 20:10:17 -0000
Date:   Tue, 15 Sep 2020 14:10:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        Ricardo Ribalda <ribalda@kernel.org>,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Subject: Re: [PATCH v5] dt-bindings: media: imx214: Convert to json-schema
Message-ID: <20200915201017.GA2425154@bogus>
References: <20200910162030.614029-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910162030.614029-1-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 10 Sep 2020 18:20:30 +0200, Jacopo Mondi wrote:
> Convert the imx214 bindings document to json-schema and update
> the MAINTAINERS file accordingly.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/media/i2c/sony,imx214.txt        |  53 -------
>  .../bindings/media/i2c/sony,imx214.yaml       | 133 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 134 insertions(+), 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
