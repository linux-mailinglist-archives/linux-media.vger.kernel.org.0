Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0A9C386C35
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 23:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245058AbhEQVW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 17:22:27 -0400
Received: from mail-oo1-f49.google.com ([209.85.161.49]:39599 "EHLO
        mail-oo1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238105AbhEQVW0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 17:22:26 -0400
Received: by mail-oo1-f49.google.com with SMTP id t17-20020a4a3e110000b02901fab2f46a48so1776118oot.6;
        Mon, 17 May 2021 14:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H+xQb/YUD+zWL7WqcnM7Hx21NL++K+v/NLZ4vp4x8SU=;
        b=PIXWubEeuHcCchSmxMSUYsvCmo3QlVTVJMkr8gp+KCpI53feOXTI91TEux3UX1gCDU
         i4uu/qNHJ54xJdYlSY+/IzhIMu47qSOu+GyGJJ3A9ByQCClrlhBRpNKuyY1Psb0XZ283
         41KVT6Z3XId5hZ3kygF9Wt817Txr3cjcTXDSuzVgCBpd5DMoOgaI+xZMGVEGrFeGgZTY
         9AZ054F7EGpnzvJRlHb4n4EmFl/lk6oarDyLm+nzoGHP9J+omjWClSaqMbzr/QYMshbi
         2RDbk58QNhEnktQvIZ9XBqqo2T0Qs0RH+FnYKdpoTGedKfQd/7kdtQBHiJBQ/Z7udnXu
         c3uA==
X-Gm-Message-State: AOAM5317N4Y2qh9K7PLC365Rx6W1zavo0427YjVtjyE02VY6/rSt4QMb
        bAXEieS3cBgV+OtulTqu4Q==
X-Google-Smtp-Source: ABdhPJyu+2dIPk66FSdMtfquQSmsDuHMDfnfNSwCQ2FFAp04pH1ZoQnqsVu1q/S0rSJcdqJW//X4ew==
X-Received: by 2002:a4a:ea2b:: with SMTP id y11mr1504407ood.42.1621286468890;
        Mon, 17 May 2021 14:21:08 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r19sm3335527ooj.5.2021.05.17.14.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 14:21:07 -0700 (PDT)
Received: (nullmailer pid 3214427 invoked by uid 1000);
        Mon, 17 May 2021 21:18:11 -0000
Date:   Mon, 17 May 2021 16:18:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: renesas,drif: Use graph schema
Message-ID: <20210517211811.GA3214242@robh.at.kernel.org>
References: <20210510203514.603471-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510203514.603471-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 10 May 2021 15:35:14 -0500, Rob Herring wrote:
> Convert the renesas,drif binding schema to use the graph schema. The
> binding referred to video-interfaces.txt, but it doesn't actually use any
> properties from it as 'sync-active' is a custom property. As 'sync-active'
> is custom, it needs a type definition.
> 
> Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Ramesh Shanmugasundaram <rashanmu@gmail.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/media/renesas,drif.yaml          | 20 +++++++------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 

Applied, thanks!
