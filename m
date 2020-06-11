Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C5D1F6C58
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 18:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgFKQtD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 12:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgFKQtC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 12:49:02 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D63C08C5C1
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2020 09:49:02 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id d128so5713338wmc.1
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2020 09:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m9GN5WBKEYYIgIwqXSwTbOuQ7tSpufKewkY859VD9LM=;
        b=HSWrP87UGB+MThNp2ov2M6zIYZLHZyM9tjClOB6qyUS4MR3lFJvhcbxgMQPtlX4keX
         Guz1BkTJfTJJDseuVmY0mAHX/qTGcvJH8UBW43emcyHkEAcsZ5fyGYoIQG5zaCXbRwMp
         2x9t0TjTVlzuACBZ5Ey7aewg3gb+W2fxfZdLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m9GN5WBKEYYIgIwqXSwTbOuQ7tSpufKewkY859VD9LM=;
        b=PiRF9MKBSrKnDbDzFWR7Ahi6zZBSeeGhsPoNRpKS5FHzMZi+Q/jdPTkaeqWeSsgeei
         5RxTsoA3Oxl2jmUzFWsHi/olGclQgxmb0Yv7AJW7IEt5jxH8MzMPeVu4I6s8/U7byUZq
         aS8G5RecKHfBRxuABH+haTzjIugZKIVgvTJbJydvkJPVwuXVE9vJcPr8tyQ/bLNUKeSC
         1nIU+4JRHe5t5Ymz6s4VNamyp/kL5y/8P8C3JR/gakgEvJ3+QxctoGDjsSI/4g0zIjTX
         W2RJJRUnEBo9GWGYjNGjQYZOzVxNpMRTqkC7FjCOi7v2BPYNJNyLw43wglc5lO3N/mW0
         2yNg==
X-Gm-Message-State: AOAM531B+gZaczI9xRabdOZay99GlY065+vtVm9ZsAk28KxzQ3m3yKKE
        NhDXkqs1eHomz2mlRPwxVr4LsQ==
X-Google-Smtp-Source: ABdhPJxVAMW67/K46mT3Ow+twrNQzG3BwFWjaG3jRfjfJfAuUr3TOn/DQ9B52KybIBJfI0dVIFdeDA==
X-Received: by 2002:a1c:38c2:: with SMTP id f185mr9376689wma.79.1591894141050;
        Thu, 11 Jun 2020 09:49:01 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id n23sm4666480wmc.21.2020.06.11.09.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 09:49:00 -0700 (PDT)
Date:   Thu, 11 Jun 2020 16:48:59 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        srv_heupstream@mediatek.com, senozhatsky@chromium.org,
        mojahsu@chromium.org, drinkcat@chromium.org,
        maoguang.meng@mediatek.com, sj.huang@mediatek.com
Subject: Re: [PATCH RESEND v9 17/18] media: platform: Rename existing
 functions/defines/variables
Message-ID: <20200611164859.GA8694@chromium.org>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-19-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604090553.10861-19-xia.jiang@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Thu, Jun 04, 2020 at 05:05:52PM +0800, Xia Jiang wrote:
> Rename existing funcitons/defines/variables with a  _dec prefix and
> without dec_ prefix to prepare for the addition of the jpeg encoder
> feature.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v9: new patch
> ---
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 200 +++++++++---------
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |   8 +-
>  .../media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h |   7 +-
>  3 files changed, 109 insertions(+), 106 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
