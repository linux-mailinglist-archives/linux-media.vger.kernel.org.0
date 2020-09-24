Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04DB82777F7
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 19:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbgIXRm0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 13:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728621AbgIXRm0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 13:42:26 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA0F7C0613D3
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2020 10:42:25 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id n133so242269qkn.11
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2020 10:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ufQSouJEr6iOhClGNkcFys0+GmEFSbJ326GsTOQ2uLs=;
        b=nOuIzwWdqsKX//nOnPPcem2yIWA2yfus/bkl7atiAWOGJyts9EJzkywbm3/178bHdP
         GIu7YfCjro+GjducZXySGvlhKxo41hPz9qqgcCspT6ybspy4HJUpojHUeGNViEOVcXNy
         fO4CPjviAUOJPD8GxRMJF/DjJv6o/GlXwBkFaw7FJkBLnqMk5te1Fje9KkBzlkM5704K
         u2h3MKqbKzCIz7wJJPZiCHE15+a7tl6pKs8EgAMJiWPXX2n+81eU4hO3BQ5Ha40yYxla
         zTxeG4CNde9VZn0X6xyGpVZFPsqxt645OZjRsdX1PUkGvsz7HtBTIrUXZkdOKL1mPt+k
         BKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ufQSouJEr6iOhClGNkcFys0+GmEFSbJ326GsTOQ2uLs=;
        b=jN/wcSslwujLvHWlV2fKIa/VXTlPFzpJtVn+KsbDfFraaTTPrRU+uCm6xXg1omE97L
         eOGxVQz5bR2c8Uc2EMPh+Crv+X6kR4dzbsMbwyJLCYdEDhtHclcLHKSUzzJDZQIqipLS
         nWXo1D8slq7ocEE1Dddwu4HKALd96vyOSar72PHD2QkbRXXQ4PMnRXum19KskWEowSNl
         2rtDstGKzEd0c7Zj1dwoKCShHiMeGWqNpziItnnzFopg3W+zshNynVjt3cSORWWXb+1e
         SvIwnvn5UmeIoSLlwoTTLfMmCVhpEv1DoepUYKyPbkIuraELfJaHtHfOWYmR9oS1rqgf
         jQOg==
X-Gm-Message-State: AOAM530Hl90YFCbbicn+PCHCohdk85q6IaXWhj59xIjodl6VlHmrNY/J
        KC009KWnWM3wbkCKc3oWHJ1ZcgOtyTV/jlFE
X-Google-Smtp-Source: ABdhPJy3+e6AffcDB4O9E1FMQxXBkkIU1OHmqDYWUevKy9OJXSv9xTsK0X7FvrcZqGkh92CxjFaiRg==
X-Received: by 2002:a37:5fc6:: with SMTP id t189mr231569qkb.78.1600969344786;
        Thu, 24 Sep 2020 10:42:24 -0700 (PDT)
Received: from skullcanyon (marriott-chateau-champlain-montreal.sites.intello.com. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id a24sm85243qko.82.2020.09.24.10.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 10:42:24 -0700 (PDT)
Message-ID: <871d369fc987ac7cc24bdab9bc9df9fadf939c01.camel@ndufresne.ca>
Subject: Re: [PATCH v2 0/2] Add new controls for QP and layer bitrate
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@collabora.com, stanimir.varbanov@linaro.org,
        vgarodia@codeaurora.org, majja@codeaurora.org
Date:   Thu, 24 Sep 2020 13:42:22 -0400
In-Reply-To: <1600693440-3015-1-git-send-email-dikshita@codeaurora.org>
References: <1600693440-3015-1-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 21 septembre 2020 à 18:33 +0530, Dikshita Agarwal a écrit :
> This series adds frame specific min/max qp controls for hevc and layer
> wise bitrate control for h264.

Any chance you could append your driver changes with this set ? I don't
think new APIs ever make it without a driver using it.

> 
> Chnage since v1:
>  corrected email.
> 
> Dikshita Agarwal (2):
>   media: v4l2-ctrl: Add frame-specific min/max qp controls for hevc
>   media: v4l2-ctrl: Add layer wise bitrate controls for h264
> 
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 74 +++++++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ctrls.c               | 15 +++++
>  include/uapi/linux/v4l2-controls.h                 | 17 +++++
>  3 files changed, 104 insertions(+), 2 deletions(-)
> 

