Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E407A2D6BB8
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 00:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392275AbgLJXOe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 18:14:34 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:42487 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392221AbgLJXNi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 18:13:38 -0500
Received: by mail-yb1-f194.google.com with SMTP id j17so6315470ybt.9;
        Thu, 10 Dec 2020 15:13:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8kKmMiWcyzbiGl28UHvT780ogwdpkH+Z7+Rdd1Jmvvc=;
        b=NH4URcFzPmTQFJMkYDfLt9mFIZXi4IfC7WwpmFZ7ix9RItNB852AGCcvoV73wglCwk
         bzlObcHbvT6ug9Ua1BjJwZtBCdYURD7QcYqv/UvfhW858LCvFfq7yfyRRuiTr2ITigBB
         2DMthBp9TxBsM9yQcKG1Ak4RjgLgA235CbqDx6h3aAUWgEmLtUxwzC2LNdK3XtBopnrd
         /9fnrrOyG3qhK4H4685hqxSK5X5AywIAFgclkcoqJOjXi+b4bLW2R6tSC4zTNVBtSt6r
         4drC5L54fujpMqdudAB2lxo14SjVSHtS3ArOiZ+IC42qNxh+m6wqXY4dIeo7Q1vQN0vq
         0jsQ==
X-Gm-Message-State: AOAM5313Q5zWcjwZ4Ilre/S4IajEu7cqY05KdvC55EPhUvJiQNvg5cg3
        k0tcsuR6TnRtF5qLHO3wYSLg7XtYmQ==
X-Google-Smtp-Source: ABdhPJytBQRjROhKJFf7zPzfAlUi28CwvvAbDU5KoLfTI0t8eT7ORR6YE3rrdzFZ6SLGEaJ+uhrkwQ==
X-Received: by 2002:a05:6830:717:: with SMTP id y23mr7914339ots.268.1607639987153;
        Thu, 10 Dec 2020 14:39:47 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x72sm1327886oia.16.2020.12.10.14.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 14:39:46 -0800 (PST)
Received: (nullmailer pid 3187190 invoked by uid 1000);
        Thu, 10 Dec 2020 22:39:45 -0000
Date:   Thu, 10 Dec 2020 16:39:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 0/2] dt-bindings: media: Convert video-interfaces.txt
 to schemas
Message-ID: <20201210223945.GA651087@robh.at.kernel.org>
References: <20201210211625.3070388-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210211625.3070388-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 10, 2020 at 03:16:20PM -0600, Rob Herring wrote:
> This series converts video-interfaces.txt to DT schema which in turn is
> based on converting the graph binding to a schema. All the media users
> are converted to use the graph and video-interfaces schemas.
> 
> Based on media tree commit a3f132df0e5f. This is dependent on dt-schema
> changes not yet committed[1]. Please review those too.

Sigh, ignore the v2 patches...
