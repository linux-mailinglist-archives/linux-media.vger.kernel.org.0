Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97DE0457AC7
	for <lists+linux-media@lfdr.de>; Sat, 20 Nov 2021 04:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbhKTD3T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Nov 2021 22:29:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbhKTD3R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Nov 2021 22:29:17 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D38C061574
        for <linux-media@vger.kernel.org>; Fri, 19 Nov 2021 19:26:15 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id g19so10927561pfb.8
        for <linux-media@vger.kernel.org>; Fri, 19 Nov 2021 19:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gsgjDbrWIZeqXVwkQrytkOGTvKrrH2jvEtAAo2wLmOM=;
        b=VyeRH8C2hVBaVTsPeWo4XnDskj/7BQ8XMc7G+0qoUAuRkF8c1DX7lateX5hkLSvokt
         PO1Lj7ylo6ObaFzNqwVdj+bHKJmTlrUnUFQoWkgyFvTl2/pAWTyt0Ol1RzHpm7TXTeZ0
         bCFnv+jaGBjmYPBnTqfTntM5DwWYM05Jdm4i4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gsgjDbrWIZeqXVwkQrytkOGTvKrrH2jvEtAAo2wLmOM=;
        b=ucCR3Og0juiXNOWYJot8oz095FaUnCTyUctVmT4tOW65JxHVRnuVr/vKZjaswgR37m
         0f+JdeQLNzSziqs1mNR4LdszPYWuY2Yr9WGUtgyvTNSUEMByErFu0sfggPiF7x0XsRew
         +pP3grihcud3hLpr+Mo9MX/pQYUBnNvU+0I9xAInWUvrfhb9fcIivsQ00Bm47MK1rxfq
         DknuuJZuECwk6WE7qQEHKqR7Ef1ZlQbv9d9eIcNSWlUSSdpw6AkQhHX2EfSnppaYG01L
         RudSrY1A3yUMhiq8jvOt9zYyeq785oSNj2fJ0Eyi6sT4O+8JdSbYTsW5hET+J/c3KdfX
         1x/Q==
X-Gm-Message-State: AOAM53376JtLKRIeB7hd3qzC4pObUvFlTj3bo1NGpC7vvq/82dHquQzB
        0l7tVpqFaCk0eRACj0AUV/h+zNIdxNTj/Q==
X-Google-Smtp-Source: ABdhPJwqayyHZdP3sX1H3TFKR2Yulr3JGQf73nVtZVbbcbD3pSWXxF6Lmd9GU5e+fYcr3xPj1Ho4Dw==
X-Received: by 2002:a05:6a00:b49:b0:49f:cc01:10ff with SMTP id p9-20020a056a000b4900b0049fcc0110ffmr67763349pfo.42.1637378774787;
        Fri, 19 Nov 2021 19:26:14 -0800 (PST)
Received: from google.com ([240f:75:7537:3187:3354:fc76:7e1f:c44a])
        by smtp.gmail.com with ESMTPSA id o129sm997799pfg.44.2021.11.19.19.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 19:26:14 -0800 (PST)
Date:   Sat, 20 Nov 2021 12:26:10 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     senozhatsky@chromium.org, hverkuil-cisco@xs4all.nl,
        mchehab+huawei@kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Kernel oops bisected to media: videobuf2: move cache_hints
 handling to allocators
Message-ID: <YZhq0o7p0dVWeueC@google.com>
References: <d0dcd227-0753-5e9d-f757-4819cc271d4f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0dcd227-0753-5e9d-f757-4819cc271d4f@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On (21/11/19 22:41), Daniel Scally wrote:
> Hi all
> 
> I've been experiencing an oops trying to run libcamera's qcam util
> (which starts streaming on a camera sensor - the ov8865), which I
> bisected down to the patch cde513fd9b35: "media: videobuf2: move
> cache_hints handling to allocators"

Can you please check if you have these two patches in your tree:

https://lore.kernel.org/lkml/20210928034634.333785-1-senozhatsky@chromium.org/raw
https://lore.kernel.org/all/20211101145355.533704-1-hdegoede@redhat.com/raw

If not then please apply, this should fix the problems you're seeing.
