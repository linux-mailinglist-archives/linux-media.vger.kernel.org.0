Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505273C64B0
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 22:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234523AbhGLUHv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 16:07:51 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:36745 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233299AbhGLUHv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 16:07:51 -0400
Received: by mail-io1-f50.google.com with SMTP id u7so24190340ion.3;
        Mon, 12 Jul 2021 13:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eU8NZJGeRlOXg3sl+j9LmKuiwWZGjFx2BmOO4WsxHwQ=;
        b=nXPfZB/XDMQgb6oGnBN3dPZeQstWqvdJ4R6jDxZTMj4dka2SzMWqy1KOfY6M3ovGIa
         TQg0sIqQZwfYugd2PVFlxl4AG2bo2eztyLuAm3F/Qio//V4PBdREc3TvqaY6fgwsEM8Y
         7uGvbMpf6Zja6MjwRIsRqyOFU8DVpHaMeQyYass82uz7duWFtrpMl2WvUXKQX/+wbEdf
         zLsIlI7zHEmtbkKG1Te+ZNK0R+e2okqrzs1u+aUxgvqU8Iue/M4eoYy8ac5cxBuljdCr
         dV4q44X/ByT+ZtP5woUMY6GqrKVqYvSClC+olpRlRT4f0A0iLsksEXZkAKOyR95K4ZVt
         cOZw==
X-Gm-Message-State: AOAM530TGQm6yUbMW4zOg5/btPdCP4zJqD7go/5CTIyAvnnsDhll9/HA
        wsjYkDFdCCR1ujlzfH4fk4xa9Y2txw==
X-Google-Smtp-Source: ABdhPJzzLX+ZdqoCfmxhhaV8Y94O6v7F+qOxJCcAbfAlxsuTPGYrt9RQmKau2ZsrZtOfICFUSyHGCQ==
X-Received: by 2002:a5d:83c4:: with SMTP id u4mr469396ior.21.1626120301443;
        Mon, 12 Jul 2021 13:05:01 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id n13sm8619755ilq.5.2021.07.12.13.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 13:05:00 -0700 (PDT)
Received: (nullmailer pid 2397426 invoked by uid 1000);
        Mon, 12 Jul 2021 20:04:58 -0000
Date:   Mon, 12 Jul 2021 14:04:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, robh+dt@kernel.org,
        Laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org
Subject: Re: [PATCH v6 02/10] dt-bindings: media: rkisp1: fix pclk clock-name
Message-ID: <20210712200458.GA2397368@robh.at.kernel.org>
References: <20210618130238.4171196-1-heiko@sntech.de>
 <20210618130238.4171196-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618130238.4171196-3-heiko@sntech.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 18 Jun 2021 15:02:30 +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> Having a clock name as "pclk_isp" suggests really hard a remnant from
> the vendor kernel.
> 
> Right now no driver _and_ no devicetree actually uses this clock name
> so there is still time to fix that naming.
> 
> Therefore drop the "_isp" suffix and only name it pclk.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>  Documentation/devicetree/bindings/media/rockchip-isp1.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
