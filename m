Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1175286326
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 18:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729028AbgJGQEd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 12:04:33 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41571 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728559AbgJGQEd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 12:04:33 -0400
Received: by mail-ot1-f66.google.com with SMTP id q21so2684341ota.8;
        Wed, 07 Oct 2020 09:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eSqCzSwwBG+GjccoPmjZ+1FqbVkOH8cKAN9mSm+4UII=;
        b=J6yJqT7c4aicytLUqfAP9z16+NNHDJEOQo/wnFwLNvRDzpR5D2QRPgSo9+SeIjN4yR
         mJSKHExPfVQ3MakAAlMLTH8E/Vivc7tf83KFrRjFEEyZQPZh5PpHKlaDUInmbLWGg3zK
         khopUjbdme2r4XOdNqYtHReZIcUu41zfccZqEnGC9ol0af+5/TlkAl495pcfDHiVLlkv
         dPnIDcrNHsgzaw/fP5bZGULbgIU7VZqbtSUW0+olWSfYAQn0pXYG4v10rjwkP8+e5zII
         KOOfCn27TDkXscCakb0+Ji3A+zlqs/qFyUZShYUxKhjZM4S71vJhUlc3xuUFPELwI1XT
         mKvw==
X-Gm-Message-State: AOAM53027DlRmenV29VSIEaBqkxwPTrlU+UTzQmBejRq+KDhlc6SqdcB
        FMRHqM2XnVluCF1O8GuGFzq7ywWLNazV
X-Google-Smtp-Source: ABdhPJwNGTTkdkx3YXWsMX+Lb5mn/8JDtxmJHrpVfEzm1wKBlefFyZ1647SAUWT84Sn/aqVhDsWEeA==
X-Received: by 2002:a05:6830:2436:: with SMTP id k22mr2372403ots.185.1602086672356;
        Wed, 07 Oct 2020 09:04:32 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o10sm1592168oib.1.2020.10.07.09.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 09:04:31 -0700 (PDT)
Received: (nullmailer pid 303558 invoked by uid 1000);
        Wed, 07 Oct 2020 16:04:31 -0000
Date:   Wed, 7 Oct 2020 11:04:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 022/106] dt-bindings: nokia,smia: Remove
 nokia,nvm-size property
Message-ID: <20201007160431.GA303512@bogus>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084505.25761-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007084505.25761-4-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 07 Oct 2020 11:44:59 +0300, Sakari Ailus wrote:
> nokia,nvm-size property was removed from the bindings but it was left in
> the example. Remove it from the example, too.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/nokia,smia.txt | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
