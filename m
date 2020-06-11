Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE6AA1F601C
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 04:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgFKCnu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 22:43:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgFKCnu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 22:43:50 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E505C08C5C1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 19:43:50 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id b5so924725pgm.8
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 19:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rG4EBpkKYS3JW1RXobU6KnYO5uwM+91gvULoZtUJWMg=;
        b=Z5m60rqspzG3uADSpAp9dSzcKuI//jDmQIeOHayGIoIWnhSRPBBuGN6vryIqT6GVHa
         X94NLApticHwldK9FT3ySN1a8+rjt4QOUVPrXb11S3Jj6uaXIsX3rQZa9SnnE+++RbYP
         UN95/5gSk/FRadspFiRBaHBzhJCYiaDhcZ0Yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rG4EBpkKYS3JW1RXobU6KnYO5uwM+91gvULoZtUJWMg=;
        b=EuzeKYBhlqLm/404vylc3APHMbjK8vEaQJjuIGuJkxuJedR+JjBMn3OFEYlJ430Ttu
         1vxqm+xR9zTbhJm9OZc0HGq7t0OkU/b/jvXbZUaCDnrJaPYeSpX4T0BYvHTKcvMnwCC0
         YhLmfkr5tt/bOgCfytB2oTE1HWKtV0VQvrMMEh6gHfZPObOECjxX7196Jbt4i2VMneBN
         tT85x2tQ/XidGza6IWg1q+1KXaoAv9v4YIk9XkApgXUYfkB5h9wG118LP7GaRMxeeswk
         jOZQ/77fVkMVaJOpxWQU776Wq2bVlb8tyms6dP/7KMX1YfmYuw7nqTTyFkvJU7jqcNVx
         3UaQ==
X-Gm-Message-State: AOAM533XL5qJCUSyROBHv0oRfjbSjxTQgLep/tbmqOr8ISLjTVyWwZVF
        jdFR26SlQoczhiZlphP+0jfx1g==
X-Google-Smtp-Source: ABdhPJzN+422z3vh2FLOIbIBeRGx6B8aza7Xm/xBxrMlmm/I7y2fjMhsteJLHUj7W2rH7WjVKeMBuQ==
X-Received: by 2002:a62:1a87:: with SMTP id a129mr5255314pfa.95.1591843428897;
        Wed, 10 Jun 2020 19:43:48 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id 71sm1313485pfb.20.2020.06.10.19.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 19:43:48 -0700 (PDT)
Date:   Thu, 11 Jun 2020 11:43:46 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [GIT PULL FOR v5.9 v2] Implement V4L2_BUF_FLAG_NO_CACHE_* flags
Message-ID: <20200611024346.GC166075@google.com>
References: <c4067de1-6fb2-1fda-9a75-0ad5e9ae78c2@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4067de1-6fb2-1fda-9a75-0ad5e9ae78c2@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/06/10 15:01), Hans Verkuil wrote:
> I'd like to have this series merged early in the 5.9 cycle if possible
> to give it as much test time as possible.
> 
> Sergey, thank you for working on this! Very nice to have this implemented
> at last.

Thank you!

	-ss
