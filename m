Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1DC347D31
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 17:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236775AbhCXQBG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 12:01:06 -0400
Received: from mail-io1-f41.google.com ([209.85.166.41]:36656 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236760AbhCXQAe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 12:00:34 -0400
Received: by mail-io1-f41.google.com with SMTP id f19so22015130ion.3;
        Wed, 24 Mar 2021 09:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KZ4fsIeUBgOFrkk3uMgapcWJ8o/nbEBCuiB/d2F8vRk=;
        b=AXKUTrWmEhM3pjihqNnys1GN+39cDBARLY0IiKa++Z01g8ayF6w0ytCMxS6YiiNTHA
         S5TWZlWuliVKSAUgWz6AH7IvOvMpl1uNnk5UYsq8fYHWD+TwvEYENomD1NKLsW4K9L6v
         xJbU++leFQcZjwgnNYLBVe6ixBi5Zqjf4O7KKWwxWpf6b8GmPLVrdSqNO7hzrZtvKWua
         nJLAGXtdUcoiEmhW24RK5wdT1C4u0EDOnMIIs+Ws7wLWXE1O6pzUuMi/8+rLyTPsfzX3
         NoLsn4REx29/VQsYjACI2jqwzvBZ7XRskEHttMch+ZhjYLSQ4hZDWQbC5HcwzWCAwQ7B
         IECQ==
X-Gm-Message-State: AOAM532lFHyeCM213ncv5dKI/DqIzf83Xzj4Mtqd08025AJMdbsMwUNB
        wA1TOfuCgj8wX3zEhfrSUQ==
X-Google-Smtp-Source: ABdhPJztDtcM0Oh6vCXlaNqlyCQKtq/ZL/vW7F0MRAAZg+GfVrp6bQ4uHM1OW2LlNOJSyAnyGEPaDg==
X-Received: by 2002:a05:6638:1614:: with SMTP id x20mr3499921jas.19.1616601634205;
        Wed, 24 Mar 2021 09:00:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id l14sm1314193ilc.33.2021.03.24.09.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:00:33 -0700 (PDT)
Received: (nullmailer pid 3150496 invoked by uid 1000);
        Wed, 24 Mar 2021 16:00:31 -0000
Date:   Wed, 24 Mar 2021 10:00:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     Longfei Wang <longfei.wang@mediatek.com>,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tfiga@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, yong.wu@mediatek.com,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>
Subject: Re: [PATCH v2, 3/5] dt-bindings: media: mtk-vcodec: Add binding for
 MT8192 VENC
Message-ID: <20210324160031.GA3150381@robh.at.kernel.org>
References: <20210312075542.5503-1-irui.wang@mediatek.com>
 <20210312075542.5503-4-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312075542.5503-4-irui.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 12 Mar 2021 15:55:40 +0800, Irui Wang wrote:
> Updates binding document for mt8192 encoder driver.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
