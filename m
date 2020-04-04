Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4CCD19E688
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2020 19:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbgDDRAc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Apr 2020 13:00:32 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:37789 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgDDRAc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Apr 2020 13:00:32 -0400
Received: by mail-il1-f194.google.com with SMTP id a6so10572786ilr.4;
        Sat, 04 Apr 2020 10:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b4kl0NLLFcA0pn57UJb7veMZizU71qWwaJMkCLDmT14=;
        b=bTwG+72I/zpvdcle8kEay+ZzI43XVulBvGIJfU+HkKxt7FOVYnKU4jfYh6GF9A4WDN
         UmEUOf9MhTiZn1G+OTCIX6uLjCBvvc0kI5fq7p1WugkX/Ay24rLVfAQJ/5IF8hQzc0gT
         MuQ/+VrDFDSVpmSWaf6mUstB2xHzHEeGh4EofjpA66g6OfkoW1G3DUtKu80bc5DaAhMy
         fKUIRPA7dNlqVXdU2Fq/2Dafr1pPfAfderhikO2pGgqtVUkB3B24YupUaFltjVhbU4TC
         CZKbDvtEkWE6O6AlPdetaCn3La4a0Yeqkbk+2PLG3uWsR7t2H1y0GrWwyagEr/+bm/J4
         SECA==
X-Gm-Message-State: AGi0PuYq0NWJIEFZ2wlce1QlVXOhsIALO+9kAQcw+AwM3wZ7SNlv96RD
        4EpteDqzkcyNofLFOygW8hOVwpw=
X-Google-Smtp-Source: APiQypJ+bshZTlCGhsnPSYdXqvLk4YbF17FiZptNH1O88h8uIgBD2k4BdVMGGzXW6OxeszhF7KqufA==
X-Received: by 2002:a92:8c93:: with SMTP id s19mr12535365ill.222.1586019629542;
        Sat, 04 Apr 2020 10:00:29 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id t86sm4038008ili.82.2020.04.04.10.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:00:28 -0700 (PDT)
Received: (nullmailer pid 25017 invoked by uid 1000);
        Sat, 04 Apr 2020 17:00:26 -0000
Date:   Sat, 4 Apr 2020 11:00:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH 1/3] media: dt-bindings: media: Document Rockchip CIF
 bindings
Message-ID: <20200404170026.GA24638@bogus>
References: <20200403142122.297283-1-maxime.chevallier@bootlin.com>
 <20200403142122.297283-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403142122.297283-2-maxime.chevallier@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri,  3 Apr 2020 16:21:20 +0200, Maxime Chevallier wrote:
> Add a documentation for the Rockchip Camera Interface controller
> binding.
> 
> This controller can be found on platforms such as the PX30 or the
> RK3288, the PX30 being the only platform supported so far.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  .../bindings/media/rockchip-cif.yaml          | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-cif.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/media/rockchip-cif.yaml:  while scanning a simple key
  in "<unicode string>", line 13, column 1
could not find expected ':'
  in "<unicode string>", line 15, column 1
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/media/rockchip-cif.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/media/rockchip-cif.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
warning: no schema found in file: Documentation/devicetree/bindings/media/rockchip-cif.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-cif.yaml: ignoring, error parsing file
Makefile:1262: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1266070

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
