Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5F46154D1B
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 21:45:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgBFUpb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 15:45:31 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41883 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727830AbgBFUpb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 15:45:31 -0500
Received: by mail-pf1-f193.google.com with SMTP id j9so43715pfa.8;
        Thu, 06 Feb 2020 12:45:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H2tVfCzm70bqHn3/yPEccEJKGtHclRembq2rrvGRktQ=;
        b=XY1pBze54J/QBb4LhkW8czLaW4xkUbA5SCHEGNX7oFg+QNH7lR8hvWoHCtk/wbd3YV
         wz3+4hJiMfkzmkAGUPUIjBOGUYQgUVBnD7wslIboqFWTICWgGX7Gh36/RLaIE4KEUMP3
         n97BM74kRojMHdeoVHZ7IAMlEc6QozDWRGg98Bz6Qg14zInZFbg0s9Q7JX7yfa61dJ1D
         38Hw4DAWDD3VpaKZNLGdO0gSJdVih3BNrJ8U6msEL50C6lKeifwTp1CKqR46DDhs6ZI5
         VVvLo+3i+xBhZVATvNESwPnpwGdEccF89APE6TkLC0Pv4qBn/iC/gfktSkr10MG5mlQf
         tXgg==
X-Gm-Message-State: APjAAAUplqFfEEJLKo/JrXvb9IOfFxHqiZSAGeyXW2dyTXuVbxjHrGV1
        TnhRaPA9KAITXnvYYXbeWQ==
X-Google-Smtp-Source: APXvYqwfL4vZeTOwGsr6xUGNFEjJf8dH67j94K/HXOdtctgmKZDpYGF4Hd+jwY8XeBUB/qLzc7l6kg==
X-Received: by 2002:a62:c583:: with SMTP id j125mr6195854pfg.27.1581021930368;
        Thu, 06 Feb 2020 12:45:30 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net. [63.158.47.182])
        by smtp.gmail.com with ESMTPSA id b1sm282011pfp.44.2020.02.06.12.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 12:45:29 -0800 (PST)
Received: (nullmailer pid 28991 invoked by uid 1000);
        Thu, 06 Feb 2020 17:22:58 -0000
Date:   Thu, 6 Feb 2020 17:22:58 +0000
From:   Rob Herring <robh@kernel.org>
To:     Louis Kuo <louis.kuo@mediatek.com>
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        tfiga@chromium.org, keiichiw@chromium.org, matthias.bgg@gmail.com,
        mchehab@kernel.org, yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        frederic.chen@mediatek.com, Jerry-ch.Chen@mediatek.com,
        jungo.lin@mediatek.com, Rynn.Wu@mediatek.com,
        linux-media@vger.kernel.org, srv_heupstream@mediatek.com,
        devicetree@vger.kernel.org
Subject: Re: [RFC PATCH V5 2/3] dt-bindings: mt8183: Add sensor interface
 dt-bindings
Message-ID: <20200206172258.GA19946@bogus>
References: <20200129081650.8027-1-louis.kuo@mediatek.com>
 <20200129081650.8027-3-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200129081650.8027-3-louis.kuo@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 29, 2020 at 04:16:49PM +0800, Louis Kuo wrote:
> This patch adds the DT binding documentation for the sensor interface
> module in Mediatek SoCs.
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  .../bindings/media/mediatek-seninf.txt        | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.txt

Bindings have moved to DT schema. Please convert this to a schema.

Sorry to ask for this on a v5, but I don't recall seeing an earlier 
version recently.
