Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B59B2242F00
	for <lists+linux-media@lfdr.de>; Wed, 12 Aug 2020 21:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgHLTPg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Aug 2020 15:15:36 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:42665 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbgHLTPe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Aug 2020 15:15:34 -0400
Received: by mail-il1-f196.google.com with SMTP id t13so2983766ile.9;
        Wed, 12 Aug 2020 12:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=afi3llV2EPe4Y8Y32WwKuYJ0I6s5AGYAmnoxQ7HHMxY=;
        b=rSanSJAWvEvyZi7aLFZlvnb7e5opPwoUl8PEbA5Geck3/R9uG0Qy33b51SfbRx0LEt
         2ZAZ6rDFvL2pQyQU/dl8rXTYiNpplgUllKjOrEHsj7gpbCIw5e9vUSvzjoACe9nQlaHn
         Dzu4o+tXoBIJ3K+RWVwAIh62zMg4fWTHLwPis9/WWSfmRvdN4FDVm6Z7XOtUDIcN1orX
         7H8oTT/5FLRnAn9Y+JXqrG8+0nCPq5tTNhvxLsXrL7EmucbZFWTchtYzEBVk/wSBYTNG
         9RjBVusn6AtRh0i6EMG3OggfecD3+1s4kOML8kb69d0MxcnfRfJ8pqenKqz8yE3gb4ht
         ZeSA==
X-Gm-Message-State: AOAM530bQDQxndQUCHkLS2JExEqA5OXqVtgf164cyQ7ONsAUUJByhBRO
        XTl/z+QKztXFzacp78mw/A==
X-Google-Smtp-Source: ABdhPJzBRv/bNqO291He4v741bwaIa0Q5f8vFZ18ShTcjF8vo3A7x5RkYAOjbNJrOPgjGHrrPNhgUQ==
X-Received: by 2002:a92:980f:: with SMTP id l15mr1102831ili.51.1597259734263;
        Wed, 12 Aug 2020 12:15:34 -0700 (PDT)
Received: from xps15 ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id y7sm1514370ili.74.2020.08.12.12.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 12:15:33 -0700 (PDT)
Received: (nullmailer pid 2548978 invoked by uid 1000);
        Wed, 12 Aug 2020 19:15:32 -0000
Date:   Wed, 12 Aug 2020 13:15:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        linux-renesas-soc@vger.kernel.org, dave.stevenson@raspberrypi.com,
        laurent.pinchart@ideasonboard.com,
        Jacopo Mondi <jacopo@jmondi.org>, robh+dt@kernel.org,
        roman.kovalivskyi@globallogic.com, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v4 2/4] dt-bindings: media: ov5647: Document pwdn-gpios
Message-ID: <20200812191532.GA2548922@bogus>
References: <20200810215543.113206-1-jacopo+renesas@jmondi.org>
 <20200810215543.113206-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200810215543.113206-3-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 10 Aug 2020 23:55:41 +0200, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo@jmondi.org>
> 
> Document in dt-schema bindings for the ov5647 sensor the optional
> 'pwdn-gpios' property.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov5647.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
