Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC4722B841
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 22:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgGWU5a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 16:57:30 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34702 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgGWU53 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 16:57:29 -0400
Received: by mail-io1-f68.google.com with SMTP id q74so7755098iod.1;
        Thu, 23 Jul 2020 13:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZKEsUsuJIbZrXn6bbTn+pQozwM4jxWor3S9XuDvFA1c=;
        b=OOALpNG4AQan8HOx0nQ7wUbZB393mtXljj86MmRXfDB02wprfl6Lz1SBMqdwKluEbe
         keTld2uoURAxIVJL2VodCpT9o4243CxHN437Ybe5/La+9lrrcX6Dd5P1jSOiIqyXgiGz
         loPpiq7yorK/cA6OlyYjzTHx4x1p+RvI2yg4kOUrU9p7GU3ArzCcy87zA75KmDa5OShf
         1klwPGhDplHfT4twYnUl9zLjzV0nkZDbRVXefJm0fWd+biburCkyBtXKnYub45j++z+I
         k4KDRbmarN46dRoVcEy3T1rI/yGE9VEeIMDtSx16z7tjCJ+s+tybUeLSRipiXBnhMaXA
         flxQ==
X-Gm-Message-State: AOAM530S7j5sCaacVbrQOu4OzwS4ViDV8EmFUWBLBVz9FMcAj/sh3lBc
        eusd0by/aEHB4zHenseQgDWnRcLS1A==
X-Google-Smtp-Source: ABdhPJwU98oXLS4jDcGtL+DAmyecuLWM+bVPp8A7ELvPpvQRVNFF3esKEXIvzAViY9wBD0Y0z4MBhw==
X-Received: by 2002:a6b:2b12:: with SMTP id r18mr6733996ior.88.1595537848905;
        Thu, 23 Jul 2020 13:57:28 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id h11sm2024389ilh.69.2020.07.23.13.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 13:57:28 -0700 (PDT)
Received: (nullmailer pid 846854 invoked by uid 1000);
        Thu, 23 Jul 2020 20:57:27 -0000
Date:   Thu, 23 Jul 2020 14:57:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, bparrot@ti.com,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, slongerbeam@gmail.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 04/13] dt-bindings: media: ti,cal: Remove sensor from
 example
Message-ID: <20200723205727.GA846806@bogus>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-5-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717132859.237120-5-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 17 Jul 2020 15:28:50 +0200, Jacopo Mondi wrote:
> The newly introduced dt-schema bindings for the ov5640 image
> sensor triggered a warning in the ti,cal.yaml bindings file, which
> has a camera sensor node marked compatible with the sensor.
> 
> As in the example is enough to report a node for the device that
> the bindings is about, and maintaining the sensor node up-to-date
> is a non-necessary burden, remove the image sensor node from the
> ti,cal bindings file.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../devicetree/bindings/media/ti,cal.yaml     | 22 -------------------
>  1 file changed, 22 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
