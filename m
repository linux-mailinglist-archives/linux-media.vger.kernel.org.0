Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B337C207299
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 13:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403818AbgFXLy2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 07:54:28 -0400
Received: from mail-ej1-f45.google.com ([209.85.218.45]:37971 "EHLO
        mail-ej1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403776AbgFXLyZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 07:54:25 -0400
Received: by mail-ej1-f45.google.com with SMTP id w16so2168054ejj.5;
        Wed, 24 Jun 2020 04:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ufsL1RSHA0Qgz7G5/lHH40o6RzNzgQ4/McWZWanPBsY=;
        b=Fg7OZxm087+vNsfLY5urGBRXysy6moHFaVEtbAvms/H1VBzoefwpVOOIVcWkNP+OGH
         92lzC1cfAQlpUicXO+sOEmEYQr+z0egzUvPyKOi5gnuJt51LTMN/1taNT3FLiU4r+LPr
         SnJOdjPuINkMWyWf0JjvNoInvms9EQxR7/V+Egl7WqAHdzEFQt4ghjJh4V0O3vFRdVdy
         XXj1smbzRoX/wobem0uD7EJSfnO0g8Zhp+FjldEqg082VFkhk7RpDghMSwAgNugGj0mZ
         BvRv8XtdRbxEdT5s3PRmlfV6PgwjZqpeA8WxzGs5ni9+3+NFmwiEEc0CHHPuoWp+AaW+
         ZswA==
X-Gm-Message-State: AOAM530s6WDrXtTLceJ9CQdN+IkMWoxF3LwpWr0Gzx+gE1UjNvFgnqFU
        m3yX7WkqdSVLZ0dkMZhQZLs=
X-Google-Smtp-Source: ABdhPJxZdMjAfmb/JyEFCVwoJTo0S1v0Zs4pAvQ4nQtg9i0282GzbVAxxPadw/CghDQJQ1NdFjPSGQ==
X-Received: by 2002:a17:906:4045:: with SMTP id y5mr15995409ejj.261.1592999662614;
        Wed, 24 Jun 2020 04:54:22 -0700 (PDT)
Received: from pi3 ([194.230.155.235])
        by smtp.googlemail.com with ESMTPSA id n16sm6577049ejo.54.2020.06.24.04.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 04:54:21 -0700 (PDT)
Date:   Wed, 24 Jun 2020 13:54:19 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jonathan Bakker <xc-racer2@live.ca>, kyungmin.park@samsung.com,
        s.nawrocki@samsung.com, mchehab@kernel.org, kgene@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH 00/11] media: exynos4-is: Improve support for s5pv210 and
 parallel ports
Message-ID: <20200624115419.GA20764@pi3>
References: <BN6PR04MB06602E7221CC7455F3142540A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <07fb9000-ae00-efcd-e91a-48765ff3d4bf@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <07fb9000-ae00-efcd-e91a-48765ff3d4bf@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 24, 2020 at 01:39:50PM +0200, Hans Verkuil wrote:
> Can someone from Samsung or someone who knows this SoC take a look at this series?
> 
> This series looks sane to me, so I'll probably merge this if nobody replies
> in the next two weeks or so.

Unfortunately I don't know the media part on S5Pv210 at all so I cannot
provide any feedback. There are not many active users of these SoCs
nowadays. One of hem is Jonathan, so if he wants to change something he will
mostly break/affect his own setup. :) Therefore I think it is safe to merge.

Best regards,
Krzysztof
