Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16A7F481037
	for <lists+linux-media@lfdr.de>; Wed, 29 Dec 2021 06:56:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238862AbhL2F4l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Dec 2021 00:56:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238857AbhL2F4l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Dec 2021 00:56:41 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBA7C06173E
        for <linux-media@vger.kernel.org>; Tue, 28 Dec 2021 21:56:41 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id i8so9174119pgt.13
        for <linux-media@vger.kernel.org>; Tue, 28 Dec 2021 21:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yw8/kl2LGfHC+BRmnmcCo9TSrmmH3aT+nAaekBOiO84=;
        b=Jz2/jPkRYhFOljG62i4B7CbqP2s+5rpiUExqAr3THdm7ApWZCW3quUvQUc6TCbjvXz
         ZS14n6yc5QX7S5//GZczK8jcqzKPY5Zyj+klFtCJZ1s/5NB/NociQFp/J76l+mH64w6j
         vnrH+eOPmptJxsrYRNqWFoE4Edo4GPZq0MjWE/VuxP0VhL/nseetd/yZlI6GiXECgGuY
         VNRFeWWXwryJXwVTH2juslXxwWQn+tPh92CK6Y6p1Rji40oy52SzTwEXxgITl+fvCkjm
         yDjpc50piI01C8nsF6lTsHaNgygcBX82iTuGLucZYsVz+AFNhcyUPnhKP67hEITG4wrG
         TiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yw8/kl2LGfHC+BRmnmcCo9TSrmmH3aT+nAaekBOiO84=;
        b=CHGwB4fPAsf+Ixpq292lkjOdHMe3Is/itTvWt/VqbaQJLw8gy9kvQtmvD6JS18vp3C
         fUYlQVRd/rLmXyxtirWM6xGhERsW/XsZZMk/TNFgoWQVrYjoBl12xMXBzPQzSsgP9Ktn
         z1/XZML5TaVpHIR6km+wYzSq0A0b1cBnaaidI98Rv0NwbqgBbTg16rtTb9WX1rI99kV/
         H1y8rVo4FTHa43wJU3/vD/W+rEGJ0asfM5GMWTqt6fI7qo3nBZI4mapTYEAK7c4Sn9kG
         m/gBzJHIy3uEreyA00HkCd+0YR5JzZWXVr2kXOWFLwbmCEcl3qKCE8pIHBKXicAGaF0p
         rB8A==
X-Gm-Message-State: AOAM532ELQU/7h8J3xnb4FPDi/1o6oKNhtoZ4jIR3wYbGdrn/ESp87fS
        n9BL5gR68sWYHEUwlfd2kCmDPQ==
X-Google-Smtp-Source: ABdhPJzWVI7pbJHuImaGNh5XJMu92kFHsTAwgUYOuJm6wAZ5cXRl312R6S9VJqBw5q/POmfLp7/urg==
X-Received: by 2002:a63:ab08:: with SMTP id p8mr17578168pgf.617.1640757400456;
        Tue, 28 Dec 2021 21:56:40 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4dea:2b20:ea89:724b])
        by smtp.gmail.com with ESMTPSA id cx5sm20766657pjb.22.2021.12.28.21.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 21:56:40 -0800 (PST)
Date:   Wed, 29 Dec 2021 13:56:35 +0800
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2, 04/12] media: mtk-vcodec: Read max resolution from
 dec_capability
Message-ID: <Ycv4k+xHupjrualp@google.com>
References: <20211228094146.20505-1-yunfei.dong@mediatek.com>
 <20211228094146.20505-5-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211228094146.20505-5-yunfei.dong@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 28, 2021 at 05:41:38PM +0800, Yunfei Dong wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>

Just realized this on reviewing the 4th patch of the series.  Please fix it to prevent from showing the line in next version series.

> Supported max resolution for different platforms are not the same: 2K
> or 4K, getting it according to dec_capability.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
