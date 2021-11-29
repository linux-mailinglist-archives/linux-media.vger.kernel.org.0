Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B971460B91
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 01:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376533AbhK2A0W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Nov 2021 19:26:22 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:33450 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347452AbhK2AYW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Nov 2021 19:24:22 -0500
Received: by mail-ot1-f43.google.com with SMTP id 35-20020a9d08a6000000b00579cd5e605eso23226026otf.0;
        Sun, 28 Nov 2021 16:21:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jFihDUcfKe3tbkzkBwFzBaLZw10RQ1vQ6L3GlSqJBEQ=;
        b=tKI3f8/qOKMBlhR43gxLqJ6HZjIudfNMx33AF2UY8ytQRjNWBIglAJW5e0PhRQ0t9d
         ukMMIOKn/xx+f2BWvA1d5WjugOvW/C5HmOlFpFwTS6iMvqyGuPudZKVu19MFh2a8czCL
         mxQVxM1579tz93LMmIqRrG+25jvphTeJOEc+J0kL5yWlcOlggoutOf9qPEBLmRCmgZ9f
         BGc+S2Fxsv8EJR76ZEjea+pTflRJ0tBfj0w0McRw4bmheisTBx2Cf6Jqkov8w3tGj3CE
         JndRQRYNF1VKyMRiyR/8D0m8BWOnqzgSbrCiZg15n75ibKW/RDUYCDUNC3kf1Piq+if3
         LE2g==
X-Gm-Message-State: AOAM530I1dZt6vEgnpnNq3CZjPIinI3v8NezdkMdZDoTmFFufCuocmtO
        zeKBizQlXS72YnoAGxBJvA==
X-Google-Smtp-Source: ABdhPJwYjKHDjVIegEOQV55jA7l4/9WTjF6keTH5n1iSKGRRzxX7i0fjyfHVmkuIsJ7CsEIZEO9Ahw==
X-Received: by 2002:a05:6830:1154:: with SMTP id x20mr42304686otq.205.1638145264911;
        Sun, 28 Nov 2021 16:21:04 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.242])
        by smtp.gmail.com with ESMTPSA id f18sm2373686otl.28.2021.11.28.16.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 16:21:04 -0800 (PST)
Received: (nullmailer pid 2877730 invoked by uid 1000);
        Mon, 29 Nov 2021 00:21:01 -0000
Date:   Sun, 28 Nov 2021 18:21:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     devicetree@vger.kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        bjorn.andersson@linaro.org, Stephan Gerhold <stephan@gerhold.net>,
        agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        angelogioacchino.delregno@somainline.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: dt-bindings: media: camss: Remove
 clock-lane property
Message-ID: <YaQc7cf2vHhlNAy0@robh.at.kernel.org>
References: <20211118124819.1902427-1-robert.foss@linaro.org>
 <20211118124819.1902427-3-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118124819.1902427-3-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 18 Nov 2021 13:48:17 +0100, Robert Foss wrote:
> The clock-lanes property is not programmable by the hardware,
> and as such it should not be exposed in the dt-binding.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  .../bindings/media/qcom,msm8916-camss.yaml    | 10 ----------
>  .../bindings/media/qcom,msm8996-camss.yaml    | 20 -------------------
>  .../bindings/media/qcom,sdm660-camss.yaml     | 20 -------------------
>  .../bindings/media/qcom,sdm845-camss.yaml     | 17 ----------------
>  4 files changed, 67 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
