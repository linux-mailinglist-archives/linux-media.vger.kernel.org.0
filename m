Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC3A299097
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 16:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783216AbgJZPJA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 11:09:00 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34784 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782918AbgJZPJA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 11:09:00 -0400
Received: by mail-ot1-f67.google.com with SMTP id k3so7701934otp.1;
        Mon, 26 Oct 2020 08:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FW+t8otVO63gdbwrM5HEWVzVdWydfjpn2vXsjUM/qpc=;
        b=piy+Vv70f1pk9EFzYXLpw8DXzkR4MAiLntyJxpML2U1GaW0RvGH2NsOZXITlZ4HfNm
         XJPAmEFSssAUTNOFKbjaEli+xTRs/mj7cKd799JjmzB5Q9dJt7AVsi6GFi2OUgvvAz4V
         exB4taQ4RtgGMOpXS8kMjvP3Ee9S/eWmt07I0FPfTvgXbwmoTE1hzU95AWULQFAReyI1
         0W9L9shSaVLOJ9kKdsj9e7LNFp5hmk3eANPZDQUNEk6Jjg8bOipQaNjiUaSULMzumNfa
         H0jaljauLj1dkV3h7FsZEfwkFl+fzSynSmrlZRy7eXkOFt8gta3qSRNgq6NMtDMi240e
         FTFw==
X-Gm-Message-State: AOAM531ZmvfqF/FjvHXiumJelHo2fGaiuxIZbmNcOszYMJTMpNaA9E8m
        shxA7SIUbn1ZzP8lnJ64rw==
X-Google-Smtp-Source: ABdhPJzOL1uMPdWosApMoBfrHKXJ0Utv5FGu1I5dbGAf/8rsJV40/BEiYACzMAt1psu9O1ST9nQG5A==
X-Received: by 2002:a9d:2905:: with SMTP id d5mr2815181otb.343.1603724939376;
        Mon, 26 Oct 2020 08:08:59 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x83sm4071602oig.39.2020.10.26.08.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 08:08:58 -0700 (PDT)
Received: (nullmailer pid 164721 invoked by uid 1000);
        Mon, 26 Oct 2020 15:08:58 -0000
Date:   Mon, 26 Oct 2020 10:08:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v6 2/3] dt-bindings: imx7-csi: convert bindings to yaml
Message-ID: <20201026150858.GA164653@bogus>
References: <20201021212543.1920793-1-rmfrfs@gmail.com>
 <20201021212543.1920793-3-rmfrfs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021212543.1920793-3-rmfrfs@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 21 Oct 2020 22:25:42 +0100, Rui Miguel Silva wrote:
> Convert imx7-csi bindings documentation to yaml schema, remove the
> textual bindings document and update MAINTAINERS entry.
> 
> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../devicetree/bindings/media/imx7-csi.txt    | 42 -----------
>  .../bindings/media/nxp,imx7-csi.yaml          | 71 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 72 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/imx7-csi.txt
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
