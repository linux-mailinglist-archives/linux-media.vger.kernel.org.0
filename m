Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22D793E315C
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 23:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245318AbhHFVrs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 17:47:48 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:33444 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241587AbhHFVrs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 17:47:48 -0400
Received: by mail-io1-f48.google.com with SMTP id n19so14339013ioz.0;
        Fri, 06 Aug 2021 14:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BnsmwWZ5UV2/LE+aqdhfs09L7FfJpBqefxeuDQt77V0=;
        b=fzpBgXoWW8yy3JLsV+xOPngXts/ZTyUi1jq9dDWruHulYyECjCaWyOhVkJ/lHXoqL/
         1bTYZIMErgW+Y6BK9TaCsy0Bf9B70EX4eDhVontnLWxzfhihiqYW5VADoTprX1H2FTQn
         Vy9mbT48z9oZiAov6QCeN5qM5dpqoeXEOYQtIWt5MF5zqzITuReN87JPcPfii/seJGnl
         KyLnKSdARFH5SygpGGBsb0A/tTpbG0xaQVCEoeY6x7spKfT3/khhZpzkELCI3AkNeijD
         IhwoGtdn7ALp1nbdO8m5WwUVU+jnZrnW9suRzLVn1HMLuomqRUI0LJ6uxlHwEB2aJK6p
         /CLg==
X-Gm-Message-State: AOAM532lGT56UplbA8HOFC3gOEOUd60VVGgTkvFNhvWu8mGY2CWPK+Pg
        /D026RkVTbm7jykh3mRfTg==
X-Google-Smtp-Source: ABdhPJwY3vn+yJ5z1R0ZdpqJAsHZRNWFU1oMd54Rjtxc4mGO4QSs/gfI94S40UfF3mOemJERn/2Ohw==
X-Received: by 2002:a05:6e02:1d8d:: with SMTP id h13mr289082ila.40.1628286450854;
        Fri, 06 Aug 2021 14:47:30 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q2sm1054502iog.22.2021.08.06.14.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 14:47:30 -0700 (PDT)
Received: (nullmailer pid 1862298 invoked by uid 1000);
        Fri, 06 Aug 2021 21:47:28 -0000
Date:   Fri, 6 Aug 2021 15:47:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Eizan Miyamoto <eizan@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        chunkuang.hu@kernel.org, Rob Herring <robh+dt@kernel.org>,
        yong.wu@mediatek.com, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, houlong.wei@mediatek.com,
        linux-arm-kernel@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        enric.balletbo@collabora.com, wenst@chromium.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 9/9] dt-bindings: mediatek: remove vpu requirement
 from mtk-mdp
Message-ID: <YQ2t8DMqz/Ju1Qng@robh.at.kernel.org>
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.9.If10dbdfade9f48710e485efe79e53e6e65144a2f@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802220943.v6.9.If10dbdfade9f48710e485efe79e53e6e65144a2f@changeid>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 02 Aug 2021 22:12:15 +1000, Eizan Miyamoto wrote:
> It is no longer needed by the mtk-mdp driver
> 
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  Documentation/devicetree/bindings/media/mediatek-mdp.txt | 3 ---
>  1 file changed, 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
