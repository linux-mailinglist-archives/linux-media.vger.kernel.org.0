Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3F31F5A46
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 19:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgFJR00 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 13:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbgFJR00 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 13:26:26 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E00C03E96B
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 10:26:25 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e1so3210459wrt.5
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 10:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pN4qz1OJ+BC71bQQgMJmBK/Rkr81r60RgNevtGOVJRw=;
        b=PjPq4t33YTJYhGikvp5ZvRE311q6JnUdjD5ZseotuyhX9vuY0ugbZuohTre+MvhoGL
         AuX07/T01LF1doxI0rRSL87hT+g2TyOl0VFpIUfRIUTiZw9rc+w2cQRWCwe+FfNVb40O
         k6bkWvWF8UEVtN/VIqLU7Fe9ppskcls1l7cbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pN4qz1OJ+BC71bQQgMJmBK/Rkr81r60RgNevtGOVJRw=;
        b=C22qKRsUC821hobaLlmf6pFDbgFsJZKApjAphcpclZEzHSj7KyC4Qu2XT/ecqvOG9D
         2Nd5ARyf3jxUZ0fLyIm+0ecPkdn1xyEW1YzB9nUoMEEj69IVU+OhiWSwm682vht48Qig
         vIMmoErbvrrgKZ3CVzbHmk8SjG+WSvCjfvkfWJ4rMkkDJtRikUssMwGUOH8WbknJO8iK
         Tcr8GOr+eiGdFv6piuRPsqnZSOCq3ePutAj0mWKno+SJ/FEt74OXBHbsHOfgT6goD1JM
         Qa3GxzV4ixXE97eb5fzCkH+XKCDduYd772MMWXSMLbilHLp4y+h9McZ25nNWrFpf8bE7
         k6lw==
X-Gm-Message-State: AOAM533/LFtvBKwCB8WMXm8l0bsZvav8UzwTI6wcCJSV3n1BBFjR6sAe
        Ghxl9S1qP3EY7zfe52BQDiTsAw==
X-Google-Smtp-Source: ABdhPJycBqFX8BS1ni07dLwx0DghAhGJcYIzvSfMyZ0y/3zEl5jFPCRUarF5/ZW+wN8AFqWV4oa6Jg==
X-Received: by 2002:adf:e588:: with SMTP id l8mr5198923wrm.255.1591809984517;
        Wed, 10 Jun 2020 10:26:24 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id h12sm648820wro.80.2020.06.10.10.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:26:24 -0700 (PDT)
Date:   Wed, 10 Jun 2020 17:26:22 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH v2 4/4] media: staging: rkisp1: rename the field
 'direction' in 'rkisp1_isp_mbus_info' to 'isp_pads_flags'
Message-ID: <20200610172622.GG201868@chromium.org>
References: <20200609152825.24772-1-dafna.hirschfeld@collabora.com>
 <20200609152825.24772-5-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609152825.24772-5-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Jun 09, 2020 at 05:28:25PM +0200, Dafna Hirschfeld wrote:
> The field 'direction' in 'struct rkisp1_isp_mbus_info' holds
> the flags of the supported pads of the mbus code. Therefore
> the name 'isp_pads_flags' is better.
> The patch also rename a local variable 'dir' that holds such flag
> to 'pad'.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-common.h  |  2 +-
>  drivers/staging/media/rkisp1/rkisp1-isp.c     | 46 +++++++++----------
>  drivers/staging/media/rkisp1/rkisp1-resizer.c |  2 +-
>  3 files changed, 25 insertions(+), 25 deletions(-)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> index a6cd9fc13b3d..1dda6d53adea 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -283,7 +283,7 @@ struct rkisp1_isp_mbus_info {

FYI, there is some missing documentation of the fields above. If
changing this field, perhaps its documentation could be added as well?

>  	u32 yuv_seq;
>  	u8 bus_width;
>  	enum rkisp1_fmt_raw_pat_type bayer_pat;
> -	unsigned int direction;
> +	unsigned int isp_pads_flags;

nit: Wouldn't "isp_pads_mask" represent the usage more precisely?

Best regards,
Tomasz
