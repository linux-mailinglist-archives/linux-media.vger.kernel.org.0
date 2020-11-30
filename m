Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EFD42C8A4F
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 18:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729068AbgK3RBH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 12:01:07 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:42503 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729002AbgK3RBG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 12:01:06 -0500
Received: by mail-il1-f194.google.com with SMTP id f5so11952183ilj.9;
        Mon, 30 Nov 2020 09:00:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ys3u80YWm2n1y1SiIy+1AjD/yGj5IqZVpmp0UPeLTFc=;
        b=X3YLVEGzFOgIxCBEczHPp4fn7KmJZw7c6rDnEa1ByszNQlC7Vd+o7U9U13KgfRWppX
         +b2UgReL/KDcbCdX501YhCJDQjnBOcPKX/UfQmNMDsSM8NKPzopA2ZqASh+U5J4sB8B4
         VEsP1CRauDbVByui2psajUhJNomMGdIgitGRSYqxQNSfvTOY8qY0MUlzWAR+TPqlVeMT
         54xYkI4nhEqHattOUrBTTg5gU3vvWMjehVLvqU9IwpB/dQQ2vOgwDCoIRgxwvJ45uvcv
         m1bDD9/GRR5Xm5aJ0heGndD1gTsyTsKOdkLKAsDltdzesqAMKn5gXAFfUwqFV6Orp0Fe
         Rn2w==
X-Gm-Message-State: AOAM533razlbL0qQLbBJVFlKUEDW2Tqh1Xu0K+NscLopEZLQUaum6A8o
        ADrSyUE2deEzzSFQtbpUb0f9guyMkw==
X-Google-Smtp-Source: ABdhPJw6VaP/RnZBv3k7M+pa9KVTNDlb/oF2rO3Gs/4K5LDmZBrx0XWdO9CiO5XGY1kZa2zrXMeKUw==
X-Received: by 2002:a92:d03:: with SMTP id 3mr20233279iln.197.1606755620113;
        Mon, 30 Nov 2020 09:00:20 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id u12sm10962776ilg.10.2020.11.30.09.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 09:00:19 -0800 (PST)
Received: (nullmailer pid 2626733 invoked by uid 1000);
        Mon, 30 Nov 2020 17:00:18 -0000
Date:   Mon, 30 Nov 2020 10:00:18 -0700
From:   Rob Herring <robh@kernel.org>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     kernel@pengutronix.de, devicetree@vger.kernel.org,
        hverkuil-cisco@xs4all.nl, robh+dt@kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: media: allegro,al5e: Convert to YAML
Message-ID: <20201130170018.GA2626099@robh.at.kernel.org>
References: <20201126152941.3825721-1-m.tretter@pengutronix.de>
 <20201126152941.3825721-3-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126152941.3825721-3-m.tretter@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 26 Nov 2020 16:29:39 +0100, Michael Tretter wrote:
> Convert the Allegro DVT video IP codec text binding to Yaml.
> 
> Add the converted binding to the MAINTAINERS file.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  .../bindings/media/allegro,al5e.yaml          | 95 +++++++++++++++++++
>  .../devicetree/bindings/media/allegro.txt     | 43 ---------
>  MAINTAINERS                                   |  1 +
>  3 files changed, 96 insertions(+), 43 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/allegro,al5e.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/allegro.txt
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/allegro,al5e.yaml:24:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/allegro,al5e.yaml:27:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/allegro,al5e.example.dt.yaml: example-0: video-codec@a0009000:reg:0: [0, 2684391424, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/allegro,al5e.example.dt.yaml: example-0: video-codec@a0009000:reg:1: [0, 2684354560, 0, 32768] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/allegro,al5e.example.dt.yaml: example-1: video-codec@a0029000:reg:0: [0, 2684522496, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/allegro,al5e.example.dt.yaml: example-1: video-codec@a0029000:reg:1: [0, 2684485632, 0, 32768] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml


See https://patchwork.ozlabs.org/patch/1406739

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

