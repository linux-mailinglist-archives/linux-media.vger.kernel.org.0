Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC821FFADE
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 20:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728830AbgFRSON (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 14:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbgFRSON (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 14:14:13 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6714C06174E
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 11:14:11 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u26so7187356wmn.1
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 11:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qTsokCZQ3qkD3gmU6orySz5wx9a0kjdCHHCwCQljKo8=;
        b=VL24XiTpgMInwdhlip+IPwySXB/ZhlcOUp9mxr5jqzwXyL2xK687TGVeaoLYnisnPA
         KA9yco9zhBTs9qfP8hTdVCi15PMZ0/y7hgXxyKP/vp971MQX19AjbBsHP437LO7yjVA6
         yOvbxANf3uj8DbBmShrFDvfgyn1GN1VlXnPFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qTsokCZQ3qkD3gmU6orySz5wx9a0kjdCHHCwCQljKo8=;
        b=DhNbfReH5TXRRLNzynrBC4SbD6rWSkPhSRtc7lW6tJI0EVFINFeSZCQRzZPKPFXTMF
         4AGFcqK049k+/KaSrHJrX9pFyiUK2/UmRERq1Gj7J5Lgqx02aCSATTFvi1G3koqDhkfY
         jSpH3tlmgmfuZYsB4tijN3F3oYNWTPv4bx9siRnXPVghh0HUMthWhBRT7zUhDB66mD9W
         SX7HkA3otRq7WXVt4nr5Wko9UkBAvEpBxeDLhrGVzQ6X8182RPQIQooZTOT8iKqWuLFi
         AgAkcY9NV2BxqpwZHgXDmWifOwnYheujFzd+yCipvWH2ntQGCjAnih0WL256Ivcxv1X+
         7s5w==
X-Gm-Message-State: AOAM531vkmFV/G2QBZ7+mN0e2iWm80ucOj88MuAFIlgBiEvtMT478Ixy
        lEECK5pMviSHAQ5BI6979ywHpg==
X-Google-Smtp-Source: ABdhPJxz3cKlge7PwHSTIvLtqDFuNMrmSXpcG59MmBjXTzkvnzaVbDE5OVOsX9qXQwszllNUAT437A==
X-Received: by 2002:a7b:c385:: with SMTP id s5mr5663214wmj.121.1592504049649;
        Thu, 18 Jun 2020 11:14:09 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id a15sm4981844wrh.54.2020.06.18.11.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 11:14:09 -0700 (PDT)
Date:   Thu, 18 Jun 2020 18:14:07 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH v4 2/4] media: staging: rkisp1: remove macro
 RKISP1_DIR_SINK_SRC
Message-ID: <20200618181407.GD10831@chromium.org>
References: <20200618113518.30057-1-dafna.hirschfeld@collabora.com>
 <20200618113518.30057-3-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618113518.30057-3-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 18, 2020 at 01:35:16PM +0200, Dafna Hirschfeld wrote:
> The macro RKISP1_DIR_SINK_SRC is a mask of two flags.
> The macro hides the fact that it's a mask and the code
> is actually more clear if we replace it the with bitwise-or explicitly.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-isp.c | 25 +++++++++++------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
