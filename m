Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19F86131B04
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 23:06:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbgAFWGA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 17:06:00 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33028 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgAFWF7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 17:05:59 -0500
Received: by mail-ot1-f68.google.com with SMTP id b18so51760826otp.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2020 14:05:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dOrlWUldD83XBK01h071I64wECD6WdEMkunkhAq43Js=;
        b=RIgncd4McImtMumLsgQlJd95AYCbl7yfcSrv00A3bhX+vQhvOYX1iDiqQN9bh9p6Ag
         YIkRvaQa8gk1qlSI70DVgx04SjWtiBNtKKMySD0lSmVSuoyIksrAPe0ScSoYabmyEpUo
         4nBlzo3DELGoSkrqSjOyTVn1Yfmy8G4zcr8w3CPI0zHEWXxXrP8cIPb5g2vDvo2BFZau
         /izlRmFWzB5/nagOHGX0v6WbCHNCKEUggHqMSiozCYhwHM4KFc/lm7lkNWu5vCuL96cV
         sBmoffK4GM9VY8vDokuLkqNH4MKs4/1o0wc8M1WCCApJzm+1GFIsJJK60InUBUUbOCxR
         CslQ==
X-Gm-Message-State: APjAAAXD35V1ZuorZHm8RkgkFIqvKg9aSf9LuL4Z2ddkGVLBLeiuNoNa
        E/x6jHj5WWHgRSRBqvfu5tEGxns=
X-Google-Smtp-Source: APXvYqz1AQvmxBz3ypNWcqCGiRSfwNNzSqdjiCc5MNCT1s2J7+3h0cOerqKb+MAzsk9kYf21EPwJ0A==
X-Received: by 2002:a9d:367:: with SMTP id 94mr111599488otv.329.1578348358503;
        Mon, 06 Jan 2020 14:05:58 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id f3sm24479991oto.57.2020.01.06.14.05.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 14:05:58 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2208aa
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 16:05:54 -0600
Date:   Mon, 6 Jan 2020 16:05:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v4 07/12] dt-bindings: media: venus: Convert msm8996 to
 DT schema
Message-ID: <20200106220554.GA13282@bogus>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
 <20200106154929.4331-8-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106154929.4331-8-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon,  6 Jan 2020 17:49:24 +0200, Stanimir Varbanov wrote:
> Convert qcom,msm8996-venus Venus binding to DT schema.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../bindings/media/qcom,msm8996-venus.yaml    | 153 ++++++++++++++++++
>  1 file changed, 153 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
