Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B43032A0A19
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 16:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgJ3PnJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 11:43:09 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33212 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgJ3PnJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 11:43:09 -0400
Received: by mail-ot1-f67.google.com with SMTP id i18so1207064ots.0;
        Fri, 30 Oct 2020 08:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qQnCpTL2n7MfqOJCYXtINnhpLooq+fy/JdUHJMJc17g=;
        b=WJSSruMkjas+kPjYDqmflBwVMzGBq5eN5e/Wenrt50MlfuKK3qLj9MIHeKEmo/LVSY
         gO6+OtX1IyEhEkmVW5wtCuWJ80xOzdUHjksRVC/oj2cW0xXfcL478jK4IdKJTNGcw6Ny
         EgDj2e6Ry5QCXvTTxZII4lZOpbs1GdVlSJDSMQ5q8u/lNaQiNlC6abmUFUk1mdmhabPU
         gsHdKbxIFO6okgcDK6HsAsJv+i7ONYl+X0UjbGAXUKUl5gdE5njspWXKdkdH2BF9Dnju
         vKurOoNZ0kK1sZ8WDdZTNt/dKoGczYm57lnGtfoivqJ8bgTWy66Za+pWvDGQqNUh6A36
         ztDQ==
X-Gm-Message-State: AOAM53031XQpY6sjM1ejOueZ8H5Gp+zGHVZmtqWp0EuH98RosW5isxCD
        JKcT4jCpV3gNRDhx9AHleQ==
X-Google-Smtp-Source: ABdhPJzFC6jxXMm/AwgFxaqnmiQsXOtJlVokFGyvuCqqoZ+wdlTz7QJ0w94vk91/TLuPVMet8ZtG6g==
X-Received: by 2002:a05:6830:15c8:: with SMTP id j8mr2279776otr.209.1604072588127;
        Fri, 30 Oct 2020 08:43:08 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d26sm1377879otp.3.2020.10.30.08.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 08:43:06 -0700 (PDT)
Received: (nullmailer pid 3896566 invoked by uid 1000);
        Fri, 30 Oct 2020 15:43:05 -0000
Date:   Fri, 30 Oct 2020 10:43:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     kholk11@gmail.com
Cc:     robert.foss@linaro.org, marijns95@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, todor.too@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        linux-media@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v2 6/7] media: dt-bindings: media: qcom,camss: Add
 bindings for SDM660 camss
Message-ID: <20201030154305.GA3896512@bogus>
References: <20201022174706.8813-1-kholk11@gmail.com>
 <20201022174706.8813-7-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201022174706.8813-7-kholk11@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 22 Oct 2020 19:47:05 +0200, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Add bindings for qcom,sdm660-camss in order to support the camera
> subsystem on SDM630/660 and SDA variants.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> ---
>  Documentation/devicetree/bindings/media/qcom,camss.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
