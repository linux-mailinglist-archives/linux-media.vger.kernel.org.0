Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 597B11FFAE1
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 20:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgFRSPU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 14:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbgFRSPT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 14:15:19 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C247C06174E
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 11:15:19 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l26so6072293wme.3
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 11:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rYZcCpEBWDuy84TWehiyL3pUu49gmGm9qhEhgRoOMIY=;
        b=Epis1GM3O69JLDO/yi6VV8g8PigR3KNz/q/7mBShFIl2phy4rGEZJadVA1+hKQOurA
         8SSJGhbelR0XrPxavyhM9mCPKMS1caIvzItVAJtEr42jU6xVnSHtKxbPjYTx1RmXuU14
         N4AqLjjWBUV7UAtf0WLysceEUzAArUH/2hy4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rYZcCpEBWDuy84TWehiyL3pUu49gmGm9qhEhgRoOMIY=;
        b=oLN2iBI+Oxqd/NO4fE6UX5NbitOriELUFjdSHPlD/jU/pZr/TUv+Osg/7Er/a0/bBF
         AHo3C9gvC4n1OZcZlM5FnR2M8flSrzkjCIco5OcvnQiCEqbcggIpwuL4HBH2nbNie2oF
         46Q2RzyqiGpJ3yVd9QhO3J/h5MV2ZD1wOshi0KGJz9iFJZgy1hvk1Fsg+ub5emQ7cZfh
         B1l+s3Nx8TxBQCgK4bj4ouOTMNZoKh4rJhR2lTSLwU5a08Zi4PUznMl1uoH8yt5oPcoa
         QDEbk5nvHiJqK9y1LJFEjxM1eBWA44jOPldIlQXDR4B2bquqHsKISu3qyMoEDnLa9gkG
         15cQ==
X-Gm-Message-State: AOAM533Xh5li3Fr1hgttYN18U+xV1XhjwJZmSniXzrTLhBWmjtcBdJH0
        2i4zqp74iX5tdRiCFei9OcoVog==
X-Google-Smtp-Source: ABdhPJyDhU5hxcx5VpXHjUYCJv/HKPXfuLMTNk7DOTZhjVFocxpfIzErerAlnJEwyggRxt1hvD4tmw==
X-Received: by 2002:a1c:80d4:: with SMTP id b203mr5303404wmd.138.1592504118101;
        Thu, 18 Jun 2020 11:15:18 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id t188sm4503006wmt.27.2020.06.18.11.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 11:15:17 -0700 (PDT)
Date:   Thu, 18 Jun 2020 18:15:16 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH v4 3/4] media: staging: rkisp1: rename macros
 'RKISP1_DIR_*' to 'RKISP1_ISP_SD_*'
Message-ID: <20200618181516.GE10831@chromium.org>
References: <20200618113518.30057-1-dafna.hirschfeld@collabora.com>
 <20200618113518.30057-4-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618113518.30057-4-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 18, 2020 at 01:35:17PM +0200, Dafna Hirschfeld wrote:
> The macros 'RKISP1_DIR_*' are flags that indicate on which
> pads of the isp subdevice the media bus code is supported. So the
> prefix RKISP1_ISP_SD_ is better.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-isp.c | 46 +++++++++++------------
>  1 file changed, 23 insertions(+), 23 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
