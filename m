Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA6A44E0FF
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 05:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232588AbhKLE0G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 23:26:06 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:35429 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbhKLE0C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 23:26:02 -0500
Received: by mail-oi1-f178.google.com with SMTP id m6so15715882oim.2;
        Thu, 11 Nov 2021 20:23:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3dQq4I227MVmj/mJuu+x0SuENW4zynmTgvI5Gd45HxM=;
        b=sS6Xfq7c7Es2WQVooq/kt8OYlDov7W5D2LeBKgb3EVTQw+iUsizCL4pFv3audF3JV6
         HdgvZZD1EobnxJvDvGXfsZa9o36+yvGLNSO552FlDURJ4MFNCQtSVvQ5IyrGR7nn3iXK
         CP/6y8fOQvurITMfDhHLpsnXEAp7SFGyCThifmt1msgkczlTXxhYxkbnKKghrM8ETLn/
         10XDjtD/xXhT1CRW7XIGIZB9vcXWzN4f+WdStLWfVIpA0wpLVZDFPbJtnvGkSQjUyp6e
         C2n1l1D7tqfZN+eV2SgHnpG1EX65fBVkb+eCB5Ksz/73PbnzNvbE424Np4cnnsET45Ca
         k3pQ==
X-Gm-Message-State: AOAM531saJ5vZ0A2vmSACowscANXm6hTmqLTqcS6ZWyPDpjfTtUkmqc1
        AVAqUrODcmSifub49qc37pV89bdY9Q==
X-Google-Smtp-Source: ABdhPJz047OAXv4R/Qs0MJ3SGiM6kjGIUNixhPWX42NYZTZDp+UDQEOZ/D6LcVgz05Pk6hIlKsaB2g==
X-Received: by 2002:aca:2b0f:: with SMTP id i15mr24664974oik.114.1636690991895;
        Thu, 11 Nov 2021 20:23:11 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id x16sm1013240ott.8.2021.11.11.20.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 20:23:11 -0800 (PST)
Received: (nullmailer pid 761481 invoked by uid 1000);
        Fri, 12 Nov 2021 04:23:10 -0000
Date:   Thu, 11 Nov 2021 22:23:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-media@vger.kernel.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: Re: [PATCH v2] bindings: media: venus: Drop redundant maxItems for
 power-domain-names
Message-ID: <YY3sLvysqWlB4f9Q@robh.at.kernel.org>
References: <d94924e1bd00f396f2106f04d4a2bb839cf5f071.1636453406.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d94924e1bd00f396f2106f04d4a2bb839cf5f071.1636453406.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 09 Nov 2021 11:29:41 +0100, Geert Uytterhoeven wrote:
> make dt_binding_check:
> 
>     Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml: ignoring, error in schema: properties: power-domain-names
>     warning: no schema found in file: Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
>     Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml: properties:power-domain-names: {'required': ['maxItems']} is not allowed for {'minItems': 2, 'maxItems': 3, 'items': [{'const': 'venus'}, {'const': 'vcodec0'}, {'const': 'cx'}]}
> 	   hint: "maxItems" is not needed with an "items" list
> 	   from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> 
> Fixes: e48b839b6699c226 ("media: dt-bindings: media: venus: Add sc7280 dt schema")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>   - Add Acked-by,
>   - s/bogus/redundant/,
>   - Include full error message.
> ---
>  Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks!
