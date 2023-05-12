Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6135A7006BD
	for <lists+linux-media@lfdr.de>; Fri, 12 May 2023 13:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241063AbjELL0R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 May 2023 07:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240883AbjELL0P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 May 2023 07:26:15 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F715129
        for <linux-media@vger.kernel.org>; Fri, 12 May 2023 04:26:11 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50db91640d3so7008434a12.0
        for <linux-media@vger.kernel.org>; Fri, 12 May 2023 04:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683890770; x=1686482770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mbPq67P6gJ9dXgZYBtClTV5Rh9Z1mkKYI0cLgNydB3U=;
        b=i7nO8Ew+d0L8sGWlC1lQAtiM7ECm798bsZk/6FjdF67wZpm0in7qVX7MC9idurTzAs
         DIiIsHhRzxGF/rQPaCfveSnKf26hTdRAEcQ4dkInvRvoHaKCFOIaJOpjufF5oy7FqYK4
         nXpNvsE7F3+WYIxgln9QDsLDHPogBrFdCCCy3Jp9kuE2C0hczs3QW8RtBWUC/6FPQxHJ
         qvKjuTV8I6zOVxE4mWfYPwPtArkpF1nDDNv5j4YoGm9fg1XrTa1u8+Cg6m82I7wy+C3w
         cRgWD99Undsd2eeUIv/Q0SC3EYJDtVFTM2QYTs2b7khZzQMRDjXyXnaxQfNIDYtmdBx8
         x3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683890770; x=1686482770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbPq67P6gJ9dXgZYBtClTV5Rh9Z1mkKYI0cLgNydB3U=;
        b=U5S1w98M2z8cQj4sQnoG9QCAoYUhpkQYf1v4EMD3DlhouCHbj/KpG4CvMXGaZpXBHn
         a0rlt6EMbK/rPgxvfVZQhNWA4jXXwsoFRoBMgFJZaWghd9qMtg6MIcqaKbW82yJ1bnA1
         vogQPVqEqiAVthWPSHLTMSPS14ehL6HUSpwOyuIGmKxtZbrqRBtRNs/og8PsEEK561g8
         oXJd+n4+a7UjK9Ir4qaIiGmcCSDU6PK1iIAb0hDG9XeZg/CjgX7A3PqP4gHh4xcTqIiv
         yMIP854wD+H5cr048KKwMM5H4hAIsMbx2a8Vv5F3P4eMQIsPz75vWiWjqMi/BRUXQkuq
         03Hw==
X-Gm-Message-State: AC+VfDy3X6XWQngWlSCYjb1S8hicC3gZLk82cqbvqKP3sNnrRt/03XX3
        XGbocLVAtO4sRH1jBr9Ju4VcEQ==
X-Google-Smtp-Source: ACHHUZ5o2aSSFy4AK3sp5VhqMn63oC1mo+kVpG0C8ZTwIOP6MaTObZGDJZvE5hzLBBGQzo9FjxRLfg==
X-Received: by 2002:a17:906:ee8e:b0:95e:c549:9ace with SMTP id wt14-20020a170906ee8e00b0095ec5499acemr20980652ejb.62.1683890769960;
        Fri, 12 May 2023 04:26:09 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id h10-20020a1709070b0a00b00965ac1510f8sm5301225ejl.185.2023.05.12.04.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 04:26:09 -0700 (PDT)
Date:   Fri, 12 May 2023 13:26:07 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jack Zhu <jack.zhu@starfivetech.com>
Cc:     changhuang.liang@starfivetech.com,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bryan.odonoghue@linaro.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Robert Foss <rfoss@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Todor Tomov <todor.too@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 1/6] media: dt-bindings: Add JH7110 Camera Subsystem
Message-ID: <20230512112607.gbf5m3vntr5h4giz@krzk-bin>
References: <20230512102844.51084-1-jack.zhu@starfivetech.com>
 <20230512102844.51084-2-jack.zhu@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230512102844.51084-2-jack.zhu@starfivetech.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 12 May 2023 18:28:39 +0800, Jack Zhu wrote:
> Add the bindings documentation for Starfive JH7110 Camera Subsystem
> which is used for handing image sensor data.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jack Zhu <jack.zhu@starfivetech.com>
> ---
>  .../bindings/media/starfive,jh7110-camss.yaml | 179 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 186 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/starfive,jh7110-camss.example.dtb: isp@19840000: ports:port@0:endpoint: 'bus-type' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml


See https://patchwork.ozlabs.org/patch/1780481

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
