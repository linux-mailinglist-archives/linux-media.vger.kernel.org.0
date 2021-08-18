Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B89E3EF682
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 02:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236870AbhHRAJj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 20:09:39 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:44632 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232706AbhHRAJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 20:09:39 -0400
Received: by mail-oi1-f169.google.com with SMTP id w6so1828579oiv.11;
        Tue, 17 Aug 2021 17:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eDBf4HzWzpVkE1SU7HXUHyb2HdTJRgC3GqHbYNcFo5I=;
        b=HYxSxEwtPHtrzr+CHwV4sCoLlHWex9TlUeK1WZtb865ixIqJIEFc9W6w9JGGMHVssl
         ia8BT9Y7nYeTTo2z5qCbpX7/GNO0OriAa1LAbwHOtFTvyHnXRHJ0wvdCGzy4J6xxcaSS
         5UUnVakE+SOic+tlOQqsiM348UdXqjROfpWCZUS0FXlzaySBFCdtBS+x+TqMlYoPzAp8
         l5JyjdS/2NzKy2sj8/XCNNKmB3Wlg1hJRSuRKUaU//v6agy3UrOS0OYqze1pSXhxWAO2
         Uj0mGZqae87gMHUGZDdZiPlUxbuA20FoI+nwGc3W1MU9v5qVyCkra5EEQL8TYhlhaTF7
         4q7g==
X-Gm-Message-State: AOAM531mA3ZBPCoQkcoVfS4fTYoVDmvOFSmiWOZxlP3brBWFEcxlNwyz
        5gZlZDgrypXd28zS/DnGBA==
X-Google-Smtp-Source: ABdhPJzCNktKjCUlnDUCdBAcVfHU3+pFvJ9azk9tr2qfnql+0DXml7WDoPY0HuD1CexzuSC5qgwnfw==
X-Received: by 2002:a05:6808:5c7:: with SMTP id d7mr3066905oij.147.1629245345168;
        Tue, 17 Aug 2021 17:09:05 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u127sm878209oib.16.2021.08.17.17.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 17:09:04 -0700 (PDT)
Received: (nullmailer pid 1088706 invoked by uid 1000);
        Wed, 18 Aug 2021 00:09:03 -0000
Date:   Tue, 17 Aug 2021 19:09:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yong Wu <yong.wu@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        devicetree@vger.kernel.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Longfei Wang <longfei.wang@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@google.com>,
        linux-media@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [PATCH 1/9] dt-bindings: media: mtk-vcodec: Add binding for
 MT8195 two venc cores
Message-ID: <YRxPn1agQMdJtcpI@robh.at.kernel.org>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
 <20210816105934.28265-2-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816105934.28265-2-irui.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 16 Aug 2021 18:59:26 +0800, Irui Wang wrote:
> Enable MT8195 two H.264 venc cores, updates vcodec binding document.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
