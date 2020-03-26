Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A43781944BA
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 17:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbgCZQzP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 12:55:15 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:35188 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbgCZQzP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 12:55:15 -0400
Received: by mail-il1-f194.google.com with SMTP id 7so6046387ill.2;
        Thu, 26 Mar 2020 09:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vVdQEQ7sYzGEqjW9g4tDgsuflsduuCDMUset/5YfDPE=;
        b=XTzXyIWgzXLJGJ0ywM+eCk2ZrJ40+3oYEGyCc12nUsxtrezfXbgzUtW/qSl0ZENm72
         9l6NTU1iDb5Jlsrg3f6ILWFWb7D5pzF9ocCcdcn4X+vT/iN+9xdP7hGTF8oUIjGS93b0
         8h3ZNrhvOkBAOjk903bBhVSVLgQf6+VoXEIhgZHfXGfVQAIO0HZe0yG5bMQGz7x7cnc1
         DqEG67FD8V2POY32zvLtGNf+gpcghXuQ95D9gqSJIB7woVKjhZOYqLcBCnJtRhnbQYHv
         8Pp+U8M5DDYNQBLRDQwy7Q0zlkWa+rLwBXyjQS2OxXlmBFss0F+rhbq0GYcuhSEhJ+Es
         U3mQ==
X-Gm-Message-State: ANhLgQ3f6dfKUlPh1yRq8yeYu+QEcsEZvQN77BseuK9P3XYv4Cch01Z0
        CTm3Y2DCOlyNZUwMNftKeA==
X-Google-Smtp-Source: ADFU+vsYLSSDAWb+PFaYg/iNpnKHWjxEl8YuPbb4mV1g+BY74zuyxxL1mGYiXVbV73u6V8GgemDOLQ==
X-Received: by 2002:a92:8410:: with SMTP id l16mr9701669ild.288.1585241713894;
        Thu, 26 Mar 2020 09:55:13 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id u5sm754957ion.51.2020.03.26.09.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 09:55:12 -0700 (PDT)
Received: (nullmailer pid 11967 invoked by uid 1000);
        Thu, 26 Mar 2020 16:55:11 -0000
Date:   Thu, 26 Mar 2020 10:55:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v3 7/7] dt-bindings: rockchip-vpu: Convert bindings to
 json-schema
Message-ID: <20200326165511.GA11084@bogus>
References: <20200325213439.16509-1-ezequiel@collabora.com>
 <20200325213439.16509-8-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325213439.16509-8-ezequiel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 25 Mar 2020 18:34:38 -0300, Ezequiel Garcia wrote:
> Convert Rockchip VPU (Hantro IP block) codec driver documentation to
> json-schema.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  .../bindings/media/rockchip-vpu.txt           | 43 ----------
>  .../bindings/media/rockchip-vpu.yaml          | 82 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 83 insertions(+), 44 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/rockchip-vpu.txt
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/media/rockchip-vpu.example.dts:28.41-42 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:311: recipe for target 'Documentation/devicetree/bindings/media/rockchip-vpu.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/media/rockchip-vpu.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1262: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1261669

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
