Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0919D4968CC
	for <lists+linux-media@lfdr.de>; Sat, 22 Jan 2022 01:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbiAVAe5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jan 2022 19:34:57 -0500
Received: from mail-oo1-f46.google.com ([209.85.161.46]:41906 "EHLO
        mail-oo1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiAVAe4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jan 2022 19:34:56 -0500
Received: by mail-oo1-f46.google.com with SMTP id v124-20020a4a5a82000000b002e303ad3241so3804395ooa.8;
        Fri, 21 Jan 2022 16:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vc+JYnBRwo1pEK1yl3QaAhBLsc7VJ22wJW4H1iFpK14=;
        b=1OnBPcvD6WDLWd64Jstv8dQEOHqk4eN3roc2MY3n/mxS1FBBdyjRdtes5uIHQM832r
         sqeB97eGr4LQ4cWLn6e6lXQm4HJWL0AW7KhMZEGdLpmixgmgCG+GwSos4xSeBNgEXXW8
         aKcxNWFZ1gQwlA6xBaflLoWMo7WD2EU64banvoIsTpednihsnroRevFN8CVoSRoGXOFb
         a6xzQcyw2rZ37N39INZ5jrNGBHh6QY6OjOWM5PeW0OE5ywFeiJM1Dqsfe6wfAD86SkRn
         5BfxjpENVJQo0O6R85jSK1tZAwcf0L8QzaKDgtmyAYNpCyxu+9H9ax9U5aUApNW4Txqb
         KT8g==
X-Gm-Message-State: AOAM531K6PzpmDciQQhBfsKiUHxf1Y72zd5w/D0x+MELfMpMes+8arhs
        egsnD4EcXyCNOi6HLI8fQw==
X-Google-Smtp-Source: ABdhPJwPPd9CYFyMtbaomjiAuDOyVVNfQQqJelCDVQAQPAvrrZOo7eoi/yzvVGpESPIuL4fqYQ9vdQ==
X-Received: by 2002:a4a:e14f:: with SMTP id p15mr4077176oot.21.1642811695598;
        Fri, 21 Jan 2022 16:34:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g20sm1934464oiy.34.2022.01.21.16.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 16:34:54 -0800 (PST)
Received: (nullmailer pid 1919614 invoked by uid 1000);
        Sat, 22 Jan 2022 00:34:53 -0000
Date:   Fri, 21 Jan 2022 18:34:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     jonathan@marek.ca, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, hverkuil@xs4all.nl,
        linux-arm-msm@vger.kernel.org, andrey.konovalov@linaro.org,
        agross@kernel.org, linux-media@vger.kernel.org,
        dmitry.baryshkov@linaro.org, hfink@snap.com, todor.too@gmail.com,
        vladimir.zapolskiy@linaro.org, mchehab@kernel.org,
        robert.foss@linaro.org, jgrahsl@snap.com
Subject: Re: [PATCH v3 2/8] media: dt-bindings: media: camss: Add vdda supply
 declarations sm8250
Message-ID: <YetRLZ771eGeXgQ2@robh.at.kernel.org>
References: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
 <20220111125212.2343184-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111125212.2343184-3-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 11 Jan 2022 12:52:06 +0000, Bryan O'Donoghue wrote:
> Add in missing vdda-phy-supply and vdda-pll-supply declarations. The
> sm8250 USB, PCIe, UFS, DSI and CSI PHYs use a common set of vdda rails.
> Define the CSI vdda regulators in the same way the qmp PHY does.
> 
> Cc: devicetree@vger.kernel.org
> Cc: robh@kernel.org
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/qcom,sm8250-camss.yaml           | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
