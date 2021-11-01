Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2A54422BF
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 22:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbhKAViv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 17:38:51 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:39919 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhKAViu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 17:38:50 -0400
Received: by mail-ot1-f42.google.com with SMTP id x16-20020a9d7050000000b00553d5d169f7so25513735otj.6;
        Mon, 01 Nov 2021 14:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=90wG7Obp9B6dHPtoVog3pPpxjm6DgW7vC5lI8mfDfgw=;
        b=EIkvxP+vQ0dTcJZwNUSTCt+ExRKhytVH+9jNzhV6O4vePsXxEopZY8wmgBpYVYgmjb
         bt6F41QHUooqz/Jm2wqZOOvXwVqjWuyocGfLn+Gg3uB/eQtJ6tLjFH1gxMAL05b6+v6d
         ScF7EhJq1Fsw/8u1fK2ppNnt6qpAgreNduabJ2mQyt1kJUt9S4ZzXhx6mZt1u5CCJjr0
         m527mgiNSfcxsUKT7Scq/QXpdo0u2lYBxC0WPQeAYx8fezLWz5bIpoUPqBThP/BEMFr4
         Q1qZBvljOUQRxESbMYwwOPlc3r4UUu39fbDdlA8ntaamhZ3+P7vDXIXT1GUWy5P9Too9
         XLjg==
X-Gm-Message-State: AOAM532bWbZUwWIKMyTcsFFlGQmwAuVQ8LTI95ptRk4AMyww/jv0jHLD
        o7nHTT+F+3GkRGYJlMNMjg==
X-Google-Smtp-Source: ABdhPJwquV8eZYTxZdXaRA68R4NjOW8NuGpiTfWm1kpe3K8ni8vHnYs09eSX4/Vl3p8SCq+h1VeKmQ==
X-Received: by 2002:a9d:2f61:: with SMTP id h88mr23067465otb.36.1635802576755;
        Mon, 01 Nov 2021 14:36:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w5sm4528865otq.46.2021.11.01.14.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 14:36:16 -0700 (PDT)
Received: (nullmailer pid 1108565 invoked by uid 1000);
        Mon, 01 Nov 2021 21:36:15 -0000
Date:   Mon, 1 Nov 2021 16:36:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bindings: media: venus: Drop bogus maxItems for
 power-domain-names
Message-ID: <YYBdzwshhM5fmsEE@robh.at.kernel.org>
References: <097d8602906e9db279728330c6cf2837be184704.1635338663.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <097d8602906e9db279728330c6cf2837be184704.1635338663.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 27, 2021 at 02:45:30PM +0200, Geert Uytterhoeven wrote:
> make dt_binding_check:

I'd say it's redundant rather than bogus.

> 
>     Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml: ignoring, error in schema: properties: power-domain-names
>     warning: no schema found in file: Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> 
> Fixes: e48b839b6699c226 ("media: dt-bindings: media: venus: Add sc7280 dt schema")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>

