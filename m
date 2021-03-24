Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04E06347D50
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 17:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232756AbhCXQIl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 12:08:41 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:36494 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231944AbhCXQIg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 12:08:36 -0400
Received: by mail-io1-f50.google.com with SMTP id f19so22046365ion.3;
        Wed, 24 Mar 2021 09:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=DC6sppFwNSh0V8SQXMfoXHnO/dG93+K4vUIX7b7Jn1g=;
        b=FNdqwgkC43A+JoKA+y5tn/TuAcyouEG7LLXV1fLeJBZ5bMgUiIrc5IE4782EGYOVdp
         6vBf7v8IDi6oDIzeQLPBEA/mJvitseSdKt2CaXr3hLYE5RtslId2OqL5/iSQ/HzfxG6U
         XuPkoVBZZf9SwQGalJLLNbYBabZ71+wAnvxkA5/VCINln5A+PyvpP277hfqzLsXU+THS
         Du8RHeplo2h65fxP38faGVv4A98gqCaC8FxVvSG/dx4Zj8AfmWEba1FHejfauIubrvtA
         qtW94Xg9+BDWClUN+lLtRn15XQyrUyBDMuALSsLs2VavVOW4H/DPE4s+WsqbHLHU8njS
         mmUA==
X-Gm-Message-State: AOAM533zzXhYIa/H2F27AntNy0vtOxQSSvj0Q/2xLUpzPW0E44oh/nSF
        xzqmgWL5U4AmEduDsTPJch4WiSCDDA==
X-Google-Smtp-Source: ABdhPJw2gQcj61bgnRXQyecLd4GvAnJhIsD87E+oxbVR95LbjoF/R/1ll6zJeKQ2LtJ63x71M5GSOw==
X-Received: by 2002:a5d:9807:: with SMTP id a7mr3092446iol.7.1616602116240;
        Wed, 24 Mar 2021 09:08:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id i18sm883584ilk.83.2021.03.24.09.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:08:35 -0700 (PDT)
Received: (nullmailer pid 3163532 invoked by uid 1000);
        Wed, 24 Mar 2021 16:08:33 -0000
Date:   Wed, 24 Mar 2021 10:08:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: renesas,csi2: Add r8a77961 support
Message-ID: <20210324160833.GA3163480@robh.at.kernel.org>
References: <20210312130421.1743226-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312130421.1743226-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 12 Mar 2021 14:04:21 +0100, Niklas Söderlund wrote:
> Add the compatible string for M3-W+ (r8a77961) to the list of supported
> SoCs.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
