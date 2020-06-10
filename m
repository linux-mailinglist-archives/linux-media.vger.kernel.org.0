Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05CCF1F5A24
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 19:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbgFJRUE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 13:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbgFJRUD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 13:20:03 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25499C03E96B
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 10:20:03 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l17so2571258wmj.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 10:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h8HyYgtFYXdwj3j5EqhXlU6JbKond+XQSDlH3SE1BY0=;
        b=e+r0chico50lMWOLTZK3FJguyDrSMPT1EfqOemgP9hggj2/qkJZGWILBvvruoF1zLZ
         vhAKV3QduMe+a9kck07cQ8zOawV6Xq/HHToytkWsRUXhEZXIlCC3vp39kONRdpOiqyuM
         g9c0AA6tCArSPIEJenVXkgzhf3psDfwMBcyGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h8HyYgtFYXdwj3j5EqhXlU6JbKond+XQSDlH3SE1BY0=;
        b=FMyem3LduXFtYcSyQfa312d7XyPs3rb7GhkBXMuklciKvQstlARbicBL1ZnNVNcdbM
         AZs5+CtutftiMOJ5Q9qOi1ParEd7iUrjN3B7BmdDdyK1XVP5LQ8OqFEFqtfSXnyKzMKC
         NaPIXhqQNNug25xldkYCeYFXnJOPHPi9YQaDak5EC/a8xmXJeiiX8jOsPan7ydKXS6qW
         iCcu+wIiV7naybxBnpnI6jiWbBwvuM0TVUPLv+LGlpm7lMsQK5xgJofNO+/dAJtS4I6r
         FI8WqeBFFjUlz9G2ix3qUMufO84+9PZmGNuFNLyq3bcpdZBAhtgTBcJ2NxgD/878EK4X
         pqmQ==
X-Gm-Message-State: AOAM5321WS+tZLtF0PyjuOLlOMJp8vxALlQbWAdznexExfFpooqQmiJd
        KBrvqVea00K70T86UHUDImFKmQ==
X-Google-Smtp-Source: ABdhPJxQurlAnyNlApFm06RmgK7xkepR1kY2Hj5RiumxoCo2vSUcxx1yxHKPDHDgb4UwMRt59MTxPw==
X-Received: by 2002:a1c:5683:: with SMTP id k125mr4364907wmb.55.1591809600677;
        Wed, 10 Jun 2020 10:20:00 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id c16sm388493wml.45.2020.06.10.10.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:20:00 -0700 (PDT)
Date:   Wed, 10 Jun 2020 17:19:58 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH v2 2/4] media: staging: rkisp1: rsz: set default format
 if the given format is not RKISP1_DIR_SRC
Message-ID: <20200610171958.GE201868@chromium.org>
References: <20200609152825.24772-1-dafna.hirschfeld@collabora.com>
 <20200609152825.24772-3-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609152825.24772-3-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Jun 09, 2020 at 05:28:23PM +0200, Dafna Hirschfeld wrote:
> When setting the sink format of the 'rkisp1_resizer'
> the format should be supported by 'rkisp1_isp' on
> the video source pad. This patch checks this condition
> and set the format to default if the condition is false.
> 
> Fixes: 56e3b29f9f6b "media: staging: rkisp1: add streaming paths"
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-common.h  | 4 ++++
>  drivers/staging/media/rkisp1/rkisp1-isp.c     | 4 ----
>  drivers/staging/media/rkisp1/rkisp1-resizer.c | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
