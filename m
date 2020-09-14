Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA9C269682
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 22:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgINU1L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 16:27:11 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40878 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbgINU0q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 16:26:46 -0400
Received: by mail-io1-f66.google.com with SMTP id j2so1560924ioj.7;
        Mon, 14 Sep 2020 13:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7ipIPJe2L/N1mSae8aZjf9G0XjVWalEqSXPCFWqO68s=;
        b=lzg/LN2ZULjVBqY23wJmPY03fW5WlEJQNQtOu7zDaJPQFbCF0NIKd1XzgCwNmbDkD/
         Nmkgny3Z1QuZITtuSjj3SZAYT0hFCWYUWADLprRiLNiUab54F/unuJkft/vT+rOGeZOu
         HlQUa37D73SCiIAyLLk8DdBuo5R1ToEupJ+4ExPyetcst6RSYniZmDwrlhPglNBkv52B
         p2qQVdD5Vi/WZe2gL7s6KZ2ijfjcXtYlG4CBq24VS7exMid3w8GQ28ZdLd+wf1Ruih9o
         GGuEiVBUArTAAo2e8Xqo2S04bEpnQ/c8MXRJ+gxWfm9S5QPatjJBCA9OO5fHhLdvRSwc
         8ZxQ==
X-Gm-Message-State: AOAM531a0/RMkASF1viqE8qhFru7PAvx2vSxGv/AlwmtNCdF02wMcPqz
        ps563SZaYh6IVwl3A/HVXCcTVoBdX02W
X-Google-Smtp-Source: ABdhPJz3q27/HgUYvYMDzZ9LdXeisjOQqJBGsOR1ICGmVHQRJ1jvhha/ip4X8aXDn9NmBic8aiDUUQ==
X-Received: by 2002:a05:6602:2a4b:: with SMTP id k11mr12472990iov.85.1600115204493;
        Mon, 14 Sep 2020 13:26:44 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id y19sm7277736ili.47.2020.09.14.13.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 13:26:43 -0700 (PDT)
Received: (nullmailer pid 184240 invoked by uid 1000);
        Mon, 14 Sep 2020 20:26:42 -0000
Date:   Mon, 14 Sep 2020 14:26:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>, darfur_liu@gcoreinc.com,
        linux-kernel@vger.kernel.org, sj.huang@mediatek.com,
        Xingyu Wu <wuxy@bitland.com.cn>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org, hao.he7@gmail.com,
        drinkcat@chromium.org, linux-media@vger.kernel.org,
        Hao He <hao.he@bitland.com.cn>, dongchun.zhu@mediatek.com
Subject: Re: [PATCH v4 1/4] dt-bindings: Add a vendor prefix for Galaxycore
 Inc.
Message-ID: <20200914202642.GA184185@bogus>
References: <20200902224813.14283-1-tfiga@chromium.org>
 <20200902224813.14283-2-tfiga@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902224813.14283-2-tfiga@chromium.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 02 Sep 2020 22:48:10 +0000, Tomasz Figa wrote:
> From: Hao He <hao.he@bitland.com.cn>
> 
> Add a vendor prefix for Galaxycore Inc. as a prerequisite for adding
> bindings for a new imaging sensor.
> 
> Signed-off-by: Hao He <hao.he@bitland.com.cn>
> Signed-off-by: Xingyu Wu <wuxy@bitland.com.cn>
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
