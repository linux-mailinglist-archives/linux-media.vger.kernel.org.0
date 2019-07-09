Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02A1463E36
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2019 01:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfGIXCJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 19:02:09 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41555 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbfGIXCJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 19:02:09 -0400
Received: by mail-io1-f68.google.com with SMTP id j5so561055ioj.8;
        Tue, 09 Jul 2019 16:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pcfzVHuGTYaM+j7i87z+SeIwIRADA9ILTB1ox662dYs=;
        b=t3i3tja4EcN7SbpClNw8QJ56hNls3RysUjYx2lcgg9JJxOv+h6YReFQdIZ97TQvlbf
         baEJ8ry5Z0H7TYAXGlQPO3/AOLFr39I/ue+EEUIu2ePia7agXm6ajdEgXOOpZPwZ77Ve
         oBvz8WPqZK+hpMoxQdYznmnwq6krg5v10hvIl1ZsYmjZmiAQuHVOeMIIyv353NJEGDGO
         Ki8bBd+b7Yj0EWVP749zqy4+XMUOVDzGmOGaGCMTiaYFBlgzK2ZwC/uvTa2LpoArcspv
         rEMvSXAbaFehM/KNOODTzjhaIWonjx1Cv0xuRIMejsGDk40QEiQcMiOATraeq4t3UX1p
         /pbA==
X-Gm-Message-State: APjAAAXUsurDeCwpvtLZSskRkFAo9lTBOXMvPCXylccJIVsXPpb3790A
        mGEFZRUTK4zswoW70E6R4A==
X-Google-Smtp-Source: APXvYqxr8IaXXWQHna/ksmbbhy36DTh6Ah1Gj4ZIqx5lFEKgGrqa4E+x4KguEAntWpLEUg1eJJrSsA==
X-Received: by 2002:a6b:1604:: with SMTP id 4mr27029736iow.245.1562713327886;
        Tue, 09 Jul 2019 16:02:07 -0700 (PDT)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id b14sm362851iod.33.2019.07.09.16.02.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 16:02:06 -0700 (PDT)
Date:   Tue, 9 Jul 2019 17:02:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: dt: bindings: tegra-vde: Document new optional
 IOMMU property
Message-ID: <20190709230205.GA1040@bogus>
References: <20190623170730.5095-1-digetx@gmail.com>
 <20190623170730.5095-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190623170730.5095-4-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 23 Jun 2019 20:07:26 +0300, Dmitry Osipenko wrote:
> All NVIDIA Tegra SoC generations provide IOMMU support for the video
> decoder engine. Document new optional device-tree property that connects
> VDE with the IOMMU provider.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> 
> No changes since v1.
> 
>  Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
