Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24FCF1A88A7
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 20:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503427AbgDNSJF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 14:09:05 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39858 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731265AbgDNSJB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 14:09:01 -0400
Received: by mail-ot1-f68.google.com with SMTP id x11so598470otp.6;
        Tue, 14 Apr 2020 11:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=prDWIrMyWVL9le+9ZcGHN+BwfXt6qR13g2kfPV4NuLU=;
        b=sD52D5uY35Jxg9+tPH/hSaC4e0TKFlj9S0kHxtEr51tPa5mTishDdwXqaQDMJaw5qJ
         t1xJJ88H6N3Cmz1NX1wmHoduwnafE6VbyL21LSKre3EiTOzG6UJU8pXiva7yDnkNgA8u
         Rpiw74hJMblFIUkJhqHTcCtEqi3yzilU8L4zVZR0HNmSL1ncCwb3OimGorXbD5+2uYXT
         2H78Q2KriDl+ECgdEUKD65AobLms68uMPPVre+uZes3ZrdrVjqePsub6spJNpvMA1hqF
         TTzecpnDuCyQr9ihqjx/clh++epjJQpu5mVp1MgJ66xtxil05sBlnZErGU8zx5jjMHLs
         nrSQ==
X-Gm-Message-State: AGi0PuaQM+YXSM/IVdvPWTh8+D1NfWuGjwxUVBTyYiKgrrGNeoXpYUvj
        cKTMpS6agQb7iOcJXRcGBA==
X-Google-Smtp-Source: APiQypIh/leoxjlevMbuXjSNGpeuUA+hc90vGxRi1bhdKnjP1LzJUetWbjZ5GD/fYFx5Zd1kLiU9jw==
X-Received: by 2002:a9d:5b4:: with SMTP id 49mr18758120otd.210.1586887739227;
        Tue, 14 Apr 2020 11:08:59 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g12sm1060392otk.71.2020.04.14.11.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:08:58 -0700 (PDT)
Received: (nullmailer pid 829 invoked by uid 1000);
        Tue, 14 Apr 2020 18:08:57 -0000
Date:   Tue, 14 Apr 2020 13:08:57 -0500
From:   Rob Herring <robh@kernel.org>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, robh+dt@kernel.org, heiko@sntech.de,
        hverkuil-cisco@xs4all.nl, kernel@collabora.com,
        dafna.hirschfeld@collabora.com, ezequiel@collabora.com,
        mark.rutland@arm.com, karthik.poduval@gmail.com, jbx6244@gmail.com,
        kishon@ti.com
Subject: Re: [PATCH v2 6/9] dt-bindings: media: rkisp1: move rockchip-isp1
 bindings out of staging
Message-ID: <20200414180857.GA742@bogus>
References: <20200403161538.1375908-1-helen.koike@collabora.com>
 <20200403161538.1375908-7-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403161538.1375908-7-helen.koike@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri,  3 Apr 2020 13:15:35 -0300, Helen Koike wrote:
> Move rkisp1 bindings to Documentation/devicetree/bindings/media
> 
> Verified with:
> make ARCH=arm64 dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
> 
> V2:
> - no changes
> 
>  .../devicetree/bindings/media/rockchip-isp1.yaml                  | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename {drivers/staging/media/rkisp1/Documentation => Documentation}/devicetree/bindings/media/rockchip-isp1.yaml (100%)
> 

Acked-by: Rob Herring <robh@kernel.org>
