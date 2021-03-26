Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 407B234AF9A
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 20:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhCZTvm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 15:51:42 -0400
Received: from mail-io1-f42.google.com ([209.85.166.42]:34413 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230376AbhCZTv0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 15:51:26 -0400
Received: by mail-io1-f42.google.com with SMTP id x16so6595596iob.1;
        Fri, 26 Mar 2021 12:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DtFwYHBHWj9m6rEVipWhUpwvWVC2DTKwUNCl/ss4Kq4=;
        b=ANvz8SnPsl/4d33y1Ma6cs1EGc4tqsHWtvYvv4O0FOi0Ydsi0niROYIECOk+yPxPXx
         QlwBgP0LAJ6KStBlEv5DckShwnkTEf6H5kS5NHVNQrxTflkFcqV1pXzQEgXhy630zSlk
         PzPqL6s9XB3EaP/vgpaUHF8D9npAOzyQ96XCJCt1+CNKiU/dQ4CwhnhyYrwtK/L+8yK2
         I/8pqYh8oL+NYOoEd8OxduT8lH3gpjQYMQe7QX7HGfq/dabecJsIImBvI8Q8wcc/J6bu
         6GVzStxMcS16EU8X6qMJvtK2G3LheugNY6asgKlV4ue/cpaMmmTG8V0+jociPb+biT6p
         fYQQ==
X-Gm-Message-State: AOAM530yZdXq+ZWVVRjWmZ5DXNhr7Hvw6uhZMDCbG/VaiWOYQyJdpBQD
        E/2Ez5lXOziZtOHXyxghjQ==
X-Google-Smtp-Source: ABdhPJwmLZLvQHr1GWhzWdWadhO29XtJuY0BNXa2dZAGRf9FjQk9xZP8Iru6WcEK8XG8URIEZ1MfUg==
X-Received: by 2002:a5d:9599:: with SMTP id a25mr11547998ioo.25.1616788285847;
        Fri, 26 Mar 2021 12:51:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id s5sm4696815ild.13.2021.03.26.12.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 12:51:24 -0700 (PDT)
Received: (nullmailer pid 3758799 invoked by uid 1000);
        Fri, 26 Mar 2021 19:51:23 -0000
Date:   Fri, 26 Mar 2021 13:51:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: media: video-interfaces: Drop the example
Message-ID: <20210326195123.GA3758701@robh.at.kernel.org>
References: <20210324202253.3576798-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324202253.3576798-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 24 Mar 2021 14:22:53 -0600, Rob Herring wrote:
> The example in video-interfaces.yaml uses a bunch of undocumented
> bindings which will cause warnings when undocumented compatible checks
> are enabled. The example could be fixed to use documented bindings, but
> doing so would just duplicate other examples. So let's just remove the
> example.
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2: Drop instead of fixing the example
> 
>  .../bindings/media/video-interfaces.yaml      | 127 ------------------
>  1 file changed, 127 deletions(-)
> 

Applied, thanks!
