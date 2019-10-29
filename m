Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F71EE8965
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 14:24:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729690AbfJ2NY3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 09:24:29 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35073 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfJ2NY3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 09:24:29 -0400
Received: by mail-oi1-f193.google.com with SMTP id n16so6619319oig.2;
        Tue, 29 Oct 2019 06:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ao9RspYHEzBQ9eN4f1DjCqGPRN20nTdehZQvHqh9bXY=;
        b=EI/MksEUk/e9K7O4TtviyjSxQ3rDJSi1ZDKJMFrA4rCRfgHtSrT6l2RNAWZY9E86CJ
         ZkWW78wXlShbnjiqO/E/UM+ICTCjaT8kPQxYFwhHbyRNEJU0HuZA034opQ9f/6oWpCOd
         5saPP5PKuUNqdtEX4X/vGZW50DbkHOGP7UKytW770pNacEKal83eDykHSCgjLhFg5gBZ
         2M/EA3WfYNY5hNub4pk7qkAgFd/MYDq9fU9+XgvW2WdQAveaDCBblSZIalerR6j2KikR
         3vAo9jblXyqo84kK0Qs1YHF4tDFAuSkdw/vjyLIuFG3QQj49lUASQpDYlEkK/vouHMdV
         jUeQ==
X-Gm-Message-State: APjAAAUMwT90JqtI79I+hVSWIyGTvsqFKt8Bem1bbTypKf9TYnZMy/lz
        D/2ktL+P2wuMR65PvUsHjw==
X-Google-Smtp-Source: APXvYqwT8QqCfgaJHi78p4pBMJKQHgb2LpLE6tQ6Ddk7jT28VhCVGBQQxFLqNJcKFyiolPKeRazxoA==
X-Received: by 2002:a05:6808:a05:: with SMTP id n5mr3795641oij.104.1572355466554;
        Tue, 29 Oct 2019 06:24:26 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h8sm1360790otk.9.2019.10.29.06.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 06:24:25 -0700 (PDT)
Date:   Tue, 29 Oct 2019 08:24:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benoit Parrot <bparrot@ti.com>
Subject: Re: [Patch 13/19] dt-bindings: media: cal: update binding to add
 AM654 support
Message-ID: <20191029132424.GA2242@bogus>
References: <20191018153437.20614-1-bparrot@ti.com>
 <20191018153437.20614-14-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018153437.20614-14-bparrot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 18 Oct 2019 10:34:31 -0500, Benoit Parrot wrote:
> Update Device Tree bindings for the CAL driver to add AM654 support.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  Documentation/devicetree/bindings/media/ti-cal.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
