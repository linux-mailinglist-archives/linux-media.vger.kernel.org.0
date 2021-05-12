Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A322B37EE6B
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 00:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344147AbhELVnI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 17:43:08 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:44555 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385224AbhELUH2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 16:07:28 -0400
Received: by mail-ot1-f54.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so21670766otp.11;
        Wed, 12 May 2021 13:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=bDpn0xOsJEyqotdRpMYjw+ug9Gx1M8eSNlxTk3hCNS0=;
        b=cmLz7KCd4yXLXRfhpG/QNuLXC2EJEQaeTVBvTIEL+IqHWOd9TOTpNQ7+B8EP2fban0
         x85Nvz0Opy/N4OSMZ8Slb9QtjHbMY7PdH4KV5khFgr/s1OYBl6b4LT1l5Zi+P6EMXTNv
         Zi1fjrdNzhLuLUQ4xcb8/XtuB2sKbomIGhLIkO7OJrRSQ+VCJj8aln1wQiTMXwk3V9P7
         qIRCtp6c8Kx0EQsDbfsvhJxkPmz8PCBbjhJLBu0EG0j1k2hCYGr5QxwIO5Gg11fj5VUc
         1hMKK5bn6TK2kd7D63nH3KXsBj8ZcepBvlSbM6ozwI+LCCFC13Nt8ylnd0H9aROwmESD
         elug==
X-Gm-Message-State: AOAM531PTrudS7wIykYarpFvbEVc+KxXUqfnPf1yn9nAF7OmLGCXcG09
        Rt6vGkSV/9soQOXzJsoqrahTqAssEQ==
X-Google-Smtp-Source: ABdhPJyELr+EXup1zcc4RnO7m+0mc55//JTIHHm1eW0apyiwBCZ/i+5RMJseKGRLph6YtmWi0wGeCg==
X-Received: by 2002:a05:6830:30bc:: with SMTP id g28mr31982488ots.43.1620849979543;
        Wed, 12 May 2021 13:06:19 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k7sm215496ood.36.2021.05.12.13.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 13:06:18 -0700 (PDT)
Received: (nullmailer pid 204075 invoked by uid 1000);
        Wed, 12 May 2021 18:35:16 -0000
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, andrey.konovalov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>, robert.foss@linaro.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
In-Reply-To: <20210511180728.23781-18-jonathan@marek.ca>
References: <20210511180728.23781-1-jonathan@marek.ca> <20210511180728.23781-18-jonathan@marek.ca>
Subject: Re: [PATCH 17/17] media: dt-bindings: media: camss: Add qcom,sm8250-camss binding
Date:   Wed, 12 May 2021 13:35:16 -0500
Message-Id: <1620844516.475963.204074.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 11 May 2021 14:07:24 -0400, Jonathan Marek wrote:
> Add bindings for qcom,sm8250-camss in order to support the camera
> subsystem for SM8250.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/media/qcom,sm8250-camss.yaml     | 398 ++++++++++++++++++
>  1 file changed, 398 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/qcom,sm8250-camss.example.dts:20:18: fatal error: dt-bindings/clock/qcom,camcc-sm8250.h: No such file or directory
   20 |         #include <dt-bindings/clock/qcom,camcc-sm8250.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/media/qcom,sm8250-camss.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1477274

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

