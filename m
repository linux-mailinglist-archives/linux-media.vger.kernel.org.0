Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22D033879EB
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 15:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243927AbhERN2w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 09:28:52 -0400
Received: from mail-oo1-f46.google.com ([209.85.161.46]:40472 "EHLO
        mail-oo1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241144AbhERN2v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 09:28:51 -0400
Received: by mail-oo1-f46.google.com with SMTP id j26-20020a4adf5a0000b029020eac899f76so443371oou.7;
        Tue, 18 May 2021 06:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IHXZvlUO3jV05DWP5EZXphwKoyIvvm4DuPG+6NVirv0=;
        b=fx3ysz2J4TXoel/0vqceZZrjSt7z/VbjaF/Am+RF3GD62lPtPV35vkqNILfj+C2duZ
         rmH+2/NNoD6mnsoceGJ8gcp18tjEI0c8Sr7ZLHuQhWZHTCo8QApeGTWXvda2Icv6b1vn
         E+TPA5MDyMihYSMzj/KpdJIxTYldOsBrAbUZFfry6a37KMVzD09gS8pP/zZEfrakIcPo
         W6cY5nXW/P8kBxGxs34Cy83LZZAP5rsGu8JNoqB67fJy1Hsc3w1XKO168eJq7+HTBtF5
         V1w/rzbqxyZoW4RJbxVJmBsrRnvWTV8TjKZrjJERXomgWXEC1K9xOb9w9lNGcdYkp94X
         jUtg==
X-Gm-Message-State: AOAM532jwdrOHQvaoMk2Y6/tniprabDNiOvHipPE2HZ5cN3idmyuCk51
        6WnWEd4/yVSOf39vpuPkvA==
X-Google-Smtp-Source: ABdhPJxgunOpUmfIudHnWiQKlHFIgCAv3Oik5Tz0h55nf1SOSuHVNPg4ihgRaitVdx5gPByxw9oujw==
X-Received: by 2002:a4a:250e:: with SMTP id g14mr4424879ooa.31.1621344452992;
        Tue, 18 May 2021 06:27:32 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w20sm3368087oic.54.2021.05.18.06.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 06:27:32 -0700 (PDT)
Received: (nullmailer pid 535930 invoked by uid 1000);
        Tue, 18 May 2021 13:27:30 -0000
Date:   Tue, 18 May 2021 08:27:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>, linux-imx@nxp.com,
        Marco Felsch <m.felsch@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: Re: [RFC PATCH 1/3] dt-bindings: media: nxp,imx7-csi: Add i.MX8MM
 support
Message-ID: <20210518132730.GA535876@robh.at.kernel.org>
References: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
 <20210516024216.4576-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210516024216.4576-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 16 May 2021 05:42:14 +0300, Laurent Pinchart wrote:
> The i.MX8MM integrates a CSI bridge IP core, as the i.MX7. There seems
> to be no difference between the two SoCs according to the reference
> manual, but as documentation may not be accurate, add a compatible
> string for the i.MX8MM, with a fallback on the compatible i.MX7.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/nxp,imx7-csi.yaml      | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
