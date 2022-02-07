Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDF7C4ACD30
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 02:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbiBHBFF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 20:05:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245370AbiBGW6i (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 17:58:38 -0500
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB947C061355;
        Mon,  7 Feb 2022 14:58:36 -0800 (PST)
Received: by mail-oo1-f42.google.com with SMTP id k13-20020a4a948d000000b003172f2f6bdfso10147303ooi.1;
        Mon, 07 Feb 2022 14:58:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OuUO/3mep0ZxwUzB1eZmsPdUautSdpAaoSsbMdDIwvk=;
        b=xOPVbbBCNG+ykh5+lAZVxrJodpCXfYbUS4jbDtgWzoRT2Av5ykbV6zJDTdVU87WCtn
         Qayqdt62VQ2MoOlY8hg1LsopW6dwl5MSIl9DLRXzxUVUsxRD0szVLb+oyEU0fa9bVAYf
         6jf77RoBZ4BKXwnVsXPamJl/DzlGB3EnWInjckw/LDv4wHZWFYrPX5mpv6nijN5PWGkp
         U7+/F7HRvcVPfwNTQYxZ5MgUb357CAkoN8QAD4Z2dklbzolGFqDzmB7HKqJ9hPamxLeH
         yCd47AgdoIubOv+7cWfyVWClYnqoqCCkdhPNtura1huD7OyByNGw1o7JA1r/dgjTl0eJ
         p5lw==
X-Gm-Message-State: AOAM530V1OrxmcPh//qjqvjaQhkktDi6iUpV6rO7TwqoBQQwn8DjAaXd
        VeQon68Fc7VnaiSpO3jIHQ==
X-Google-Smtp-Source: ABdhPJz8tRKVh/KhZv13gwKCCkgM7u0aIme6netKeQV2jceD4HV3eIrTtFsAxLP8HBsa9x/6+GVTSw==
X-Received: by 2002:a05:6870:e14f:: with SMTP id z15mr405692oaa.115.1644274716319;
        Mon, 07 Feb 2022 14:58:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r19sm4645810oad.29.2022.02.07.14.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 14:58:35 -0800 (PST)
Received: (nullmailer pid 1085294 invoked by uid 1000);
        Mon, 07 Feb 2022 22:58:34 -0000
Date:   Mon, 7 Feb 2022 16:58:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chris Morgan <macroalpha82@gmail.com>
Cc:     mripard@kernel.org, Chris Morgan <macromorgan@hotmail.com>,
        dri-devel@lists.freedesktop.org, sam@ravnborg.org, emma@anholt.net,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, mchehab@kernel.org, daniel@ffwll.ch,
        thierry.reding@gmail.com, airlied@linux.ie
Subject: Re: [PATCH 1/6 v2] dt-bindings: vendor-prefixes: Add Geekworm
Message-ID: <YgGkGvRkAH+HAKTU@robh.at.kernel.org>
References: <20220124165526.1104-1-macroalpha82@gmail.com>
 <20220124165526.1104-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124165526.1104-2-macroalpha82@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 24 Jan 2022 10:55:21 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add vendor prefix for Geekworm (https://geekworm.com).
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
