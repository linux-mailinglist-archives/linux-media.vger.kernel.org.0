Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 434F4E8C23
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 16:51:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390145AbfJ2PvY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 11:51:24 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44416 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390120AbfJ2PvX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 11:51:23 -0400
Received: by mail-oi1-f195.google.com with SMTP id s71so9311618oih.11;
        Tue, 29 Oct 2019 08:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YpSu3327EMJc7oNGgiMNdmN1nJofI18y5n8Ne24yxQ4=;
        b=S8Y2eejTqopC/66ZVUz5o8SvH3EMWkT1z3dAr+QkowTAD9/2p5c5ZAsB+ov9SCXFtm
         58JJM/ZRg7l7AggDyoBC9VkDQ6UwQJNqBo/pQ03Bu75LlQvUZMx2CUW4zJIo1PEV/R/i
         nwABsnAw0AoRTv23jBwkzQjEgg40GM0ZOXsdU1hLfSilmuo2h076/OkbmtVKUQyY3cDs
         iDiCkBw3PW+oNhTY9elSOHcdi9ycwWVDx9HMSKwLFsylroahctaKZCoBBw+cHR5a4dif
         Pl7jwfQLFHkhs5KvC1SOrIrLLRxKIkFMVBYEo3onYem9mEeoUAM/oxuc2/tgNnnXU8nZ
         ddeg==
X-Gm-Message-State: APjAAAVTK/6Egyk38P7wnGHFVmTFNNPEbjJb6eh+Jgt1TEICFDJDAswa
        4E2dfQ1PZszl5pMtMdNvnw==
X-Google-Smtp-Source: APXvYqzt+tx5BfFF5YbYh2lxj2CgyldR2oHSMi/oZc5LMh2Q0dt11M0Wx6eWdfE4b6ijiRiHZ7uzuQ==
X-Received: by 2002:aca:4f04:: with SMTP id d4mr4717718oib.131.1572364281423;
        Tue, 29 Oct 2019 08:51:21 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o2sm4807145ota.3.2019.10.29.08.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 08:51:19 -0700 (PDT)
Date:   Tue, 29 Oct 2019 10:51:18 -0500
From:   Rob Herring <robh@kernel.org>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     robh+dt@kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: meson-ao-cec: convert to yaml
Message-ID: <20191029155118.GA15832@bogus>
References: <20191021121131.25017-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021121131.25017-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 21 Oct 2019 14:11:31 +0200, Neil Armstrong wrote:
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic AO-CEC controller over to a YAML schemas.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../media/amlogic,meson-gx-ao-cec.yaml        | 91 +++++++++++++++++++
>  .../bindings/media/meson-ao-cec.txt           | 37 --------
>  2 files changed, 91 insertions(+), 37 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/meson-ao-cec.txt
> 

Applied, thanks.

Rob
