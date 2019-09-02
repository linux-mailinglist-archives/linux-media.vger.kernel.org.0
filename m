Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60C7AA5A51
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 17:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730187AbfIBPRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 11:17:30 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:44283 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbfIBPR3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 11:17:29 -0400
Received: by mail-wr1-f44.google.com with SMTP id 30so3457595wrk.11;
        Mon, 02 Sep 2019 08:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=80MTxctpPeEJxgPgZ/13mVZGRU0dFKanpPh9EZ44fW4=;
        b=JE/PeQq4c/dogDoLqfXtiVnkmlW/AWykkMHIuvLplRFiHvKt30KaKUfDxz3reAokVN
         BV8thXEcOOob3g1fhqBD0hujscL90WMtEqcjaZ0nxvxp7eAqLqkfPSEUbJtjs4Jsqr25
         O1ei+KF2JrVEgGqDIGgIv75KC2ZiepsficextFy9gStCq8uHdC8PTA2uyRuvay6JdypI
         Em3kFVdFNX6xSJ3PAS0SYhc/zeyDeiAUnrb/M66pcqlzivvsMaTyzifWKgyW9CsssZdJ
         poAQy1DpH9OnewsNCs34/9nugPYHk9p9ipHdbhe1rx7ZCWOpL7VueanF4VNuOjsikIO9
         bVvw==
X-Gm-Message-State: APjAAAW1XIpYaiEI1xSzD3M9RZNLZmURX+9vg41lQjx0D6TalEbpVpmA
        QicfbAaoifPop4hb0djTrg==
X-Google-Smtp-Source: APXvYqyUxFqhZf5gOVlVL9+YYQqW1Y4BH7cJyeFs/cJ272ubXTUwNqtn/bRoE/+gbWsuh8C89AB7yQ==
X-Received: by 2002:adf:ed8f:: with SMTP id c15mr17553540wro.83.1567437447509;
        Mon, 02 Sep 2019 08:17:27 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id r1sm16747170wro.13.2019.09.02.08.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 08:17:26 -0700 (PDT)
Date:   Mon, 2 Sep 2019 16:17:26 +0100
From:   Rob Herring <robh@kernel.org>
To:     Jungo Lin <jungo.lin@mediatek.com>
Cc:     tfiga@chromium.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, matthias.bgg@gmail.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        srv_heupstream@mediatek.com, ddavenport@chromium.org,
        robh@kernel.org, Sean.Cheng@mediatek.com, sj.huang@mediatek.com,
        frederic.chen@mediatek.com, Jerry-ch.Chen@mediatek.com,
        frankie.chiu@mediatek.com, ryan.yu@mediatek.com,
        Rynn.Wu@mediatek.com, yuzhao@chromium.org, zwisler@chromium.org,
        shik@chromium.org, suleiman@chromium.org, jungo.lin@mediatek.com
Subject: Re: [RFC,v5, 1/5] media: dt-bindings: mt8183: Added camera ISP Pass 1
Message-ID: <20190902151726.GA24001@bogus>
References: <jungo.lin@mediatek.com>
 <20190902075135.1332-1-jungo.lin@mediatek.com>
 <20190902075135.1332-2-jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902075135.1332-2-jungo.lin@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2 Sep 2019 15:51:31 +0800, Jungo Lin wrote:
> This patch adds DT binding document for the Pass 1 (P1) unit
> in Mediatek's camera ISP system. The Pass 1 unit grabs the sensor
> data out from the sensor interface, applies ISP image effects
> from tuning data and outputs the image data or statistics data to DRAM.
> 
> Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> ---
>  .../bindings/media/mediatek,camisp.txt        | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,camisp.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
