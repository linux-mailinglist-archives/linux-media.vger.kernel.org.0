Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB2B1FD5FF
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 22:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgFQU0t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 16:26:49 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:38028 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgFQU0t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 16:26:49 -0400
Received: by mail-il1-f193.google.com with SMTP id b5so3629415iln.5;
        Wed, 17 Jun 2020 13:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FtYug0tUqxYyOmHYqIp7a6FmVIpDrS3WKwscxWj8W8I=;
        b=p7GneibE4GORzXyKSbr1dCThkJHaHpH1oGlxGFuq5AJsV1MTf5wHrDGjMW3WSXVOvS
         vZY9yC1+dy1UtEK13M5d/uh8C/3fQibK0fJXo3Rs+E6jDPVx6hBKfJdsrX8VwesCYjxn
         sFrFnOHyc3AN0kbvTAvV+qomBtgS+5pT6lPsn0wjWSISX87ti7G+syYobtqgcqMjDAKL
         XhdgR/wtefTrHoFt1TT/hDCg+0R4fxXbWwsO7yTSJhBzkps4zkJBtCfzt0L1fIFa3QC1
         AnBS3ZqGCbUPj6FPCnEPjViLCCXpkNQjRvjNHnxnoqLvnBNGJQkpxaBwthPJJpcICQ3v
         7aVQ==
X-Gm-Message-State: AOAM5322BlBDfPdFg52rJfy1V8FvAXLQqc/kMRdyykLk0iyNfZ0qEf16
        80Ouq62nIuzWv6FZNVy83CpeW5QjtA==
X-Google-Smtp-Source: ABdhPJwkL0llprX5q916r2w2Emi9uTQIYlfJlzd54EYDj3cyOYjlfb3zwH9OsbYwfqHNtW/OwSKF+g==
X-Received: by 2002:a92:1f15:: with SMTP id i21mr638013ile.61.1592425608616;
        Wed, 17 Jun 2020 13:26:48 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id y12sm339197ili.83.2020.06.17.13.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 13:26:47 -0700 (PDT)
Received: (nullmailer pid 2729183 invoked by uid 1000);
        Wed, 17 Jun 2020 20:26:45 -0000
Date:   Wed, 17 Jun 2020 14:26:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeff Chase <jnchase@google.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: Add ch7322 media i2c device
Message-ID: <20200617202645.GA2728573@bogus>
References: <20200615193811.233737-1-jnchase@google.com>
 <20200615193811.233737-2-jnchase@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615193811.233737-2-jnchase@google.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 15 Jun 2020 15:38:10 -0400, Jeff Chase wrote:
> The ch7322 is a Chrontel CEC controller.
> 
> Signed-off-by: Jeff Chase <jnchase@google.com>
> ---
>  .../bindings/media/i2c/chrontel,ch7322.yaml   | 67 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

