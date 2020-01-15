Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 204C413B65C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 01:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbgAOAIT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jan 2020 19:08:19 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40526 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728873AbgAOAIS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jan 2020 19:08:18 -0500
Received: by mail-ot1-f68.google.com with SMTP id w21so14480213otj.7
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2020 16:08:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=PEMFQk9O8jxAvzI8sFAtYfnpYGHToC52icRpafkpCkM=;
        b=jmKhR60RcSGadLlpLVg03ayJ5SDnjcHUa+OwIoqo7MdlvpL7wVCqNEvgy9g80izKS9
         eOLz+wRFGuR/PvTE2h9BTQBHKquFTFYy4j7shqTUcSklA5207nAkAI9+ZTDNQE1P371U
         sOV9jPhzZF0jPJ/gBnpdEDgB7tdqlEdMB+9zwgnBIYde5x01ZOhbT3NqIodtGXnFwdUK
         8xfHeByQM7F6u2NJqmaNcWuGV4G3K/awnho4by/Ilk222NbeKrAsbGU3LjW1m+HyhlNT
         cAoke0WhPeUwpHrOoq+umox3oF2mZ0CI1btuzv+3+fyefTdYQUoUrxqOT7d/AKdEGLhY
         NPQA==
X-Gm-Message-State: APjAAAVa/30yc45E0dSe8xiH0PQFFzTskoFw1YXrb3P+bgArrHmzl8OP
        SbWQGyAK4KvMyTANFwmYke3IwOA=
X-Google-Smtp-Source: APXvYqxfEDUd0Xjzfkd0iUKPvymgeXwdwUMsuR2f7q/dE6zPFjY45QShMgYXL8eUL5D6jnyrRP/tMA==
X-Received: by 2002:a9d:198b:: with SMTP id k11mr762184otk.295.1579046897427;
        Tue, 14 Jan 2020 16:08:17 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j186sm5126964oih.55.2020.01.14.16.08.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 16:08:16 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2209ae
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Tue, 14 Jan 2020 18:08:16 -0600
Date:   Tue, 14 Jan 2020 18:08:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2] dt-bindings: rcar-csi2: Convert bindings to
 json-schema
Message-ID: <20200115000816.GA10876@bogus>
References: <20200108215209.1825544-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200108215209.1825544-1-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed,  8 Jan 2020 22:52:09 +0100, =?UTF-8?q?Niklas=20S=C3=B6derlund?= wrote:
> Convert Renesas R-Car MIPI CSI-2 receiver bindings documentation to
> json-schema.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  .../bindings/media/renesas,csi2.txt           | 107 ----------
>  .../bindings/media/renesas,csi2.yaml          | 198 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 199 insertions(+), 108 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,csi2.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,csi2.yaml
> 

Applied, thanks.

Rob
