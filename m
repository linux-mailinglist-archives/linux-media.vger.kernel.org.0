Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF851DCE83
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 15:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729630AbgEUNrf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 09:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729431AbgEUNrf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 09:47:35 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC6F4C061A0F
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 06:47:34 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id z4so5635839wmi.2
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 06:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WigAm6R3JnrkS0bWmUO3ZB1tWo9KDMYSlwhtkqHAIps=;
        b=jyfLBevZAiI3qkkBfstEElorOWNvUcbZe8+NYJX9vsFk4WpXks+gPfEuN04Ws3MixW
         1mt8vxFWFKxT/FwXh70xQ7l9mzqNXQq5l4CvApuE0h0xAxvzt9GxF+lHFlAYvUYwaNDC
         XcFDRdRO+IS0Xt+i8dnhvNyGG05gut8vNkPUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WigAm6R3JnrkS0bWmUO3ZB1tWo9KDMYSlwhtkqHAIps=;
        b=ZZaLIId4nr2a7qzjKCzzUdnyF5w1kGHQVHylk+OP4G2FYWx3dJ9DFrSFxDsf3mgdVB
         qaGJ12C8xTAlXhaCxMBwSAS73CbHE31AfUgMVgBxbiiz41v9fnHljnfvrpgQcnKqhu/x
         VCfGxG1D+QXg8lyTdo7Q4x5poPtCBNwrIVoL1Zl0JWdi+dPS6vBh2XZJ79cY8Eg4fZfP
         BS5NKizTlnh+RFgIZUntMiwZ4mEy4gOXfPoroIJc1q1TtLNiKA1YkaJK6gvivKeA7EmZ
         rXrMBI3u+69Y1NTtglfGN4YLEowwRPJbvlggvr5yRpE1+5rsUAmlEG1pgTLfT9oa6los
         vgLQ==
X-Gm-Message-State: AOAM530Ed6sD0Yt+Mj4Es48UtaF6aFeEXayaG+fgMaqVSu5WXRbcZS1/
        is6JmA/nh2d9WR/6u89SfM89kg==
X-Google-Smtp-Source: ABdhPJycudi/4ZFEocfK7FGUn/bFSMM2TZDaR2Ql4yDG5QBmvorZtq7f/VZXArUqQ7+SPm0CNXRP+w==
X-Received: by 2002:a1c:2e46:: with SMTP id u67mr8770259wmu.156.1590068853633;
        Thu, 21 May 2020 06:47:33 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id q4sm6733605wma.9.2020.05.21.06.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 06:47:32 -0700 (PDT)
Date:   Thu, 21 May 2020 13:47:31 +0000
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
Subject: Re: [PATCH v8 03/14] media: platform: Improve getting and requesting
 irq flow for bug fixing
Message-ID: <20200521134731.GC209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-4-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403094033.8288-4-xia.jiang@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 03, 2020 at 05:40:22PM +0800, Xia Jiang wrote:
> Delete platform_get_resource operation for irq.
> Return actual value rather than EINVAL when fail to get and request
> irq.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
