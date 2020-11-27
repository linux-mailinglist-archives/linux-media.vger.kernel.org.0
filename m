Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4023F2C697F
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 17:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731499AbgK0Qft (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 11:35:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731440AbgK0Qft (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 11:35:49 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1144CC0613D1;
        Fri, 27 Nov 2020 08:35:49 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id w4so4705952pgg.13;
        Fri, 27 Nov 2020 08:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oeonf9+ssH3tiDFtNGxaIF9eFeoLL2QUF0mZX8JcTPU=;
        b=u5qG5VuqAze9SNNcnAbaUKVq1mkcdhDQWZM6B3QdZEl7iWEHODXsr8rpisnEYNdjRC
         S7jXTIe03qoBCAmKmp8gG6sdaPJTd09SObWlJ8gTHqdza5Ki4LK6T2BWVRKtk2OBRsFF
         PJ3boGvmfUsNNlvg58QC5VGBLRlamzW4piMxa8naYTcSrZHGcVtv8dCeOQInXNiEvr21
         WM1/EZTauFRLacGMfrYjQFOZDwS5QflyeuD8xrXa9uW8riWHQSEyPHvnzfHJ5mPQMgDJ
         5YcUrL+v2FYYOIJTRJinpVJ0vmMcAWW6FLdpnRld/u62AMycLSGZoE/MjrJIqdGPD9VL
         pYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oeonf9+ssH3tiDFtNGxaIF9eFeoLL2QUF0mZX8JcTPU=;
        b=qRyWqx4isHZBGA/A1YVpLNPYXmW8LKD8ZKsX8JO9nGS83+KZB71ZJ+6gLK7HFnA63z
         zFl+qCljylP1+jvkREnUSZtAVmMflZ80z0nbPgq8yc6k187jGECfaJElDqqDY8mdJc6D
         rttsmRbspdzO/MgcdKhabYz8LaBBRoIzhiFE6B5W8veMJABcbhPDdLoo0u76O4mGivcP
         stmENzff0oyKjrGbtGG/vWpqnusR+Z8Sibo8o2upwxVqjvmBJL+5fQrmczxPKcUZONei
         lRnL2AtDOd/6ODYW3cVWngFzA/iaaWXDtT+xLqtK8QolOcoIAopx9hFsl+XbD9VUybcE
         yLjg==
X-Gm-Message-State: AOAM5315TiknG2nZIPooPpynSFaFGUh6fdzr5jJ6ojajqIJSE6St6o4V
        MU7QmMbHw+l4sEH9FJil4SM=
X-Google-Smtp-Source: ABdhPJwg4EZ6JVGBOSAvWBiU1oI12df1VgK0NvLDh7IgBhGg5n0xDwue/6e6MsifLBu3LnHveI+RLA==
X-Received: by 2002:a63:5845:: with SMTP id i5mr7290832pgm.355.1606494948492;
        Fri, 27 Nov 2020 08:35:48 -0800 (PST)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id u3sm8091620pfu.47.2020.11.27.08.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 08:35:47 -0800 (PST)
Date:   Sat, 28 Nov 2020 01:35:45 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] media: vb2: always set buffer cache sync hints
Message-ID: <X8Eq4V++hRsKuYSF@jagdpanzerIV.localdomain>
References: <20201127094136.1051071-1-sergey.senozhatsky@gmail.com>
 <0dbfa509-8c82-7470-c18b-24ab5c92dc4b@xs4all.nl>
 <X8ENifLanjYuhF/r@jagdpanzerIV.localdomain>
 <509cc69b-39d7-4b13-f392-ebf25530c8fe@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <509cc69b-39d7-4b13-f392-ebf25530c8fe@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/11/27 15:56), Hans Verkuil wrote:
> Yes.
> 
> BTW, wouldn't it be sufficient to change this code to:
> 
> 	if (!q->allow_cache_hints && q->memory != VB2_MEMORY_DMABUF) {
> 		vb->need_cache_sync_on_prepare = 1;
> 		vb->need_cache_sync_on_finish = 1;
> 	}

I think it would be sufficient.

	-ss
