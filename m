Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7A973A1AAA
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 18:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235649AbhFIQSk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 12:18:40 -0400
Received: from mail-oo1-f43.google.com ([209.85.161.43]:42877 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231842AbhFIQSk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 12:18:40 -0400
Received: by mail-oo1-f43.google.com with SMTP id y18-20020a4ae7120000b02902496b7708cfso3484060oou.9;
        Wed, 09 Jun 2021 09:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=a1Y82Gv5X/hO0myBOxKSOalg56HUY7NAd/qCc46vtv0=;
        b=eUrLY8dQoWBWUFeMZT1ax09B04skohbY89etUXwmtRsmJKXabXJmLslgOPCTiHRp9O
         TDGgsxmEjGaqP5f18q0IRMR+rLZj1Cm8mbjmkAHV1O5jhyiEvBy9d22z4dKOo8uPI85I
         DdWX6ebvEmO9QL+sNqreyXcHkeQauRk4YqvpyjrpA4oTblLKkWtnIY1QzPQCSKjOqlCL
         sf11waAR+gWg0ee40eXrMKp4hIHCXNa4aMeFYL+GKJEF4q/ku6u8zYtR0r9Mh3xe5bU3
         pWpsCc46c06YoHYb+YPbD8W/IxoRxdlY3XOtNAzQBytAkHo9BE41MgCeXWT+TedsbQ6R
         hjug==
X-Gm-Message-State: AOAM530uPqv4gZtwbhpGXAt7ovvsEdPMeOTwwpncFvR7TqvF0nBi/eeq
        fYjOoW9Ern7LgXdF/9rEDA==
X-Google-Smtp-Source: ABdhPJxTzJymkBllAl87issVlptqVq8U4fWxhyfV28lUYraxKJza0WTdE41zISjAnDIoi6TJgQ1Grw==
X-Received: by 2002:a4a:5482:: with SMTP id t124mr594201ooa.42.1623255405104;
        Wed, 09 Jun 2021 09:16:45 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l19sm34219oou.2.2021.06.09.09.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 09:16:44 -0700 (PDT)
Received: (nullmailer pid 3763291 invoked by uid 1000);
        Wed, 09 Jun 2021 16:16:43 -0000
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        andrey.konovalov@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Todor Tomov <todor.too@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, robert.foss@linaro.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
In-Reply-To: <20210608223513.23193-18-jonathan@marek.ca>
References: <20210608223513.23193-1-jonathan@marek.ca> <20210608223513.23193-18-jonathan@marek.ca>
Subject: Re: [PATCH 17/17] media: dt-bindings: media: camss: Add qcom,sm8250-camss binding
Date:   Wed, 09 Jun 2021 11:16:43 -0500
Message-Id: <1623255403.596972.3763290.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 08 Jun 2021 18:35:06 -0400, Jonathan Marek wrote:
> Add bindings for qcom,sm8250-camss in order to support the camera
> subsystem for SM8250.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/media/qcom,sm8250-camss.yaml     | 399 ++++++++++++++++++
>  1 file changed, 399 insertions(+)
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
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1489658

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

