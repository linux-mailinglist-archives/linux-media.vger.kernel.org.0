Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D81F31F598E
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 19:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbgFJRAL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 13:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgFJRAL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 13:00:11 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A51BAC03E96B
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 10:00:10 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id r7so3127361wro.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 10:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AnGNF+99rp4z6Bd3xiiJCSIf7sDeZbkZ8WOmNiX5eng=;
        b=PSOvnNhPIZFtIvLexVK5tr7FXA0cEmEy45eeKdKJKzKyvKa0XOIyEpWg7vauypi2eX
         rgJEQN/19i6TWj7rbbhYiuRoEE9HbtcIuZ8bRuYz+lwjtDCdQff2WGoJX3MfONDIwbxP
         IR/FGBu9KU9i4kLzff6Wt5EISfJWqKqIAsxqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AnGNF+99rp4z6Bd3xiiJCSIf7sDeZbkZ8WOmNiX5eng=;
        b=iOOIXQBcFGk08x8Dwa0vEH/6aWJp6zZ6RQP8swS9psS3ZCjGE8qj97n7oFhVKF6V3T
         5uzf78kmshHtygN49UK4SQnOmXzGiH6SqzAnRQTFvyowp8QjbEXcbcIIcoZq+cQAFwK6
         8Vzk1VIBG2siL2USPMnFpkJkegTfITUAaQEuSblaB4zTSdqDipxnmZKUekzkJf3IBYct
         zrcoiZTVjhAhMKT3fD2X5qK8ABwmFzhOSpG8hBJTMbrtMJ3XKEysIiiLDcGtIkywaraP
         5HvteeNOaWEVqtRbILu+rHPNwnwn6TYsXRxQVTGzCPkus+wVZz3sbeqLdC5yg43p/Oiv
         UYzQ==
X-Gm-Message-State: AOAM532Q4OWwiC+QP8kfj4uH5KJPFJwmaQN5NVuBJB9VdIoavtxyB9/z
        Rp32sY2xhZphIYNgZvjH2xtClQ==
X-Google-Smtp-Source: ABdhPJzb5Ucd1G9bJthu0S3u1TR58hi4HHCPychzyEyu+6ggnlNt9N0zGxdLMSnMSvIssd5p1tbGaA==
X-Received: by 2002:a5d:45cb:: with SMTP id b11mr4571396wrs.235.1591808409432;
        Wed, 10 Jun 2020 10:00:09 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id t8sm346018wmi.46.2020.06.10.10.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:00:08 -0700 (PDT)
Date:   Wed, 10 Jun 2020 17:00:07 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, skhan@linuxfoundation.org,
        niklas.soderlund@ragnatech.se--annotate
Subject: Re: [PATCH v4 3/5] media: staging: rkisp1: validate links before
 powering and streaming
Message-ID: <20200610170007.GB201868@chromium.org>
References: <20200522075522.6190-1-dafna.hirschfeld@collabora.com>
 <20200522075522.6190-4-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522075522.6190-4-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 22, 2020 at 09:55:20AM +0200, Dafna Hirschfeld wrote:
> In function rkisp1_vb2_start_streaming, the call to
> media_pipeline_start should be the first thing in order
> to validate the links and prevents their state from being modified
> before power up and streaming.
> 
> Adjust stop streaming to the same logic, call media_pipeline_stop
> after we disable streaming on the entities in the topology.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 21 ++++++++++---------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
