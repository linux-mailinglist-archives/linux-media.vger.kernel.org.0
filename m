Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58EF827465B
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 18:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgIVQQw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 12:16:52 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:45786 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbgIVQQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 12:16:52 -0400
Received: by mail-il1-f195.google.com with SMTP id h2so17845857ilo.12;
        Tue, 22 Sep 2020 09:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NbXtXi6vT1fphxteQRXGKtTiUcawLCXlMAwmp5r1Uw0=;
        b=sw6zdfG0Bxg4ubpdiBfAx82PP6vhvl/TZUQyJVe4yZBMWzW4vB3dehOoqlFsWA6BQ6
         BdLbPmhgBkTQvPsZJY/vBTHi3aB1oAUrqeBGMdefC8lH3bjscFtyn64Y5CltkEMeTQEN
         EbZEtLvkxHamnrDsOycDyyaPG3nnGUDBg0OLVyG/QQNa2WxDCtuSiUhskz2GHh5l9xQN
         JkkphOXlY0jiKqkB4Tf5TKUnAH1n2hNJiE0fGQT6RWIwdokwvXz8mnT+8hCBkv2Vpni7
         JvisBhZJlKY1FqOI02md0YRs8Z8FU/coNWVifVSnQ6LO8EKx+IURoPwUelXpxH4AH/di
         w9Fw==
X-Gm-Message-State: AOAM53335c/fUqMjO0hN5qrzn/rm2psRUoIAmwL1nOJSj/bQjvnJdtu+
        Al5I/vhdLp72PedvxJTCOA==
X-Google-Smtp-Source: ABdhPJzsKlHNnCI1y7/TzkbDHmB3go3160eOHRvU+qGdtjAZNwo89wtJ3Abqx6uTZbWF2sEWTVGZiw==
X-Received: by 2002:a92:9ad6:: with SMTP id c83mr4531982ill.155.1600791411103;
        Tue, 22 Sep 2020 09:16:51 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id k11sm7676478iof.40.2020.09.22.09.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 09:16:50 -0700 (PDT)
Received: (nullmailer pid 2788187 invoked by uid 1000);
        Tue, 22 Sep 2020 16:16:49 -0000
Date:   Tue, 22 Sep 2020 10:16:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: convert CODA VPU bindings to yaml
Message-ID: <20200922161649.GA2787699@bogus>
References: <20200922120007.12766-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922120007.12766-1-p.zabel@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 22 Sep 2020 14:00:07 +0200, Philipp Zabel wrote:
> Convert to YAML, add missing "fsl,imx6dl-vpu", "cnm,coda960"
> compatible, and specify the power-domain property for i.MX6.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  .../devicetree/bindings/media/coda.txt        |  31 -----
>  .../devicetree/bindings/media/coda.yaml       | 109 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 110 insertions(+), 32 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/coda.txt
>  create mode 100644 Documentation/devicetree/bindings/media/coda.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/coda.example.dt.yaml: video-codec@63ff4000: clock-names:0: 'per' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/coda.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/coda.example.dt.yaml: video-codec@63ff4000: clock-names:1: 'ahb' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/coda.yaml


See https://patchwork.ozlabs.org/patch/1369025

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

