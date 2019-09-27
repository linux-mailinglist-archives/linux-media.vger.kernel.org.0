Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34638C0B15
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 20:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbfI0SbK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 14:31:10 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36966 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbfI0SbJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 14:31:09 -0400
Received: by mail-oi1-f193.google.com with SMTP id i16so6030136oie.4;
        Fri, 27 Sep 2019 11:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6Dwlt6dTGHs+BuziwsOZqU0wxeCKDgQXfVKRH/TdFRQ=;
        b=EELc4+q1M89Og+XVareDgv88cyvFuwhgs8GyMGn5d0lse99qFqUogsdmTp8afKr8VN
         9tl8yBh+ezHejThi9N83SLIcroDqFwsvvG0UAuxibFvdqybdQtVe+UAiGTA9V7ls0zuW
         W7Gn55YJ6WHPitMvzg8sYiQq0sdAqygcf8nGfdSxIdZI1H9j7zwcD0M2pDWq2+OgNnOv
         n88zDVgyxp8HDguGCVz4Wk++rs0YSOMj/sfUNNi4ZvqY/1tycJByUU8tpPhDGGt/ZU42
         5ed+PiS7aJLWoGt9YME8GA6YgcUBIG02LsvbL/pRYKuzkagrZQjzRYb0ef2HV8b8iuij
         P1Vg==
X-Gm-Message-State: APjAAAWG1N/GblYndroO4CSi/G2OKX/8gaGzXAJwbof0Hzm+3Eqb3nOx
        WSP+Vd9rIS/bG/oIlXlZsg==
X-Google-Smtp-Source: APXvYqxfTPOjoXw0r3K9xDZ396c+xBKOc4sDJsePcujHV58jUBs+kpOM2YeJOMmqzYt+9QKgSrRfXg==
X-Received: by 2002:a05:6808:9b6:: with SMTP id e22mr7980788oig.51.1569609068628;
        Fri, 27 Sep 2019 11:31:08 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 21sm1806756oin.26.2019.09.27.11.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 11:31:08 -0700 (PDT)
Date:   Fri, 27 Sep 2019 13:31:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com,
        Xia Jiang <xia.jiang@mediatek.com>
Subject: Re: [PATCH v3 1/5] media: dt-bindings: Add jpeg enc device tree node
 document
Message-ID: <20190927183107.GA16235@bogus>
References: <20190924074303.22713-1-xia.jiang@mediatek.com>
 <20190924074303.22713-2-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924074303.22713-2-xia.jiang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 24 Sep 2019 15:43:00 +0800, Xia Jiang wrote:
> Add jpeg enc device tree node document.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v3: change compatible to SoC specific compatible
> 
> v2: no changes
> ---
>  .../bindings/media/mediatek-jpeg-encoder.txt  | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
