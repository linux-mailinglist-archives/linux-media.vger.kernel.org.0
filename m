Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEA235892B
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 18:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbhDHQBL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 12:01:11 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:42531 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231772AbhDHQBL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 12:01:11 -0400
Received: by mail-ot1-f48.google.com with SMTP id c24-20020a9d6c980000b02902662e210895so2748683otr.9;
        Thu, 08 Apr 2021 09:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yqjpKdQ91clhP2CX3Ais7ztbNgmLiqbD3BZE+9peawI=;
        b=O/bhIbxLesyQOajUMfJXRxWq1FrfPN3GgwaFCuxHPvYah7rC9qgUyqEUDRxgXcnR1v
         hAsJrPwObCCUTPYcJxNwYMaQABzMXaO2uWDTB7aRR35tydTGEsRPwqzgDL/ljRpIQsxg
         IocIvtfIBJWYJJtKelvhSvRnZD5W5Igmbwa5uskPOba/aDW1oq+GVIeq1tS/Fobipq+R
         2y4rNsj7ny356/PoYriRGL/Cz0B9anzuRhyU9ATwomlskHjMrkUyuneR9AU+bhWIpRzQ
         Lgzfl1+sW5j+KsZlXj0EZBS/8KM5s+EgYz1R61+BXiSkwl4DQ2H4cMJpqBUa2+LprmEh
         FWmQ==
X-Gm-Message-State: AOAM532JA/XjwJAyh48QwyCvbhL4m84P+FtW5zcUIdLwCVXTR3hR14Ay
        4lp730CnlPzZWNvKx9NMOPuRwlQ0Vg==
X-Google-Smtp-Source: ABdhPJzdNKg2N31ad3G586sVgDuMZ1gN87t03vHRgqhgW2oN3O21tcWGPfE7EkP5wf1rlqUJfjkpoA==
X-Received: by 2002:a9d:68ce:: with SMTP id i14mr7916752oto.151.1617897658159;
        Thu, 08 Apr 2021 09:00:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y13sm43846oti.79.2021.04.08.09.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:00:57 -0700 (PDT)
Received: (nullmailer pid 1556334 invoked by uid 1000);
        Thu, 08 Apr 2021 16:00:56 -0000
Date:   Thu, 8 Apr 2021 11:00:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Emil Velikov <emil.l.velikov@gmail.com>
Cc:     linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-rockchip@lists.infradead.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v4 7/9] media: dt-bindings: Document SAMA5D4 VDEC bindings
Message-ID: <20210408160056.GA1556286@robh.at.kernel.org>
References: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
 <20210401144336.2495479-8-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401144336.2495479-8-emil.l.velikov@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 01 Apr 2021 15:43:34 +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> Add devicetree binding documentation for the Hantro G1/G2 VDEC on
> the Microchip SAMAS5D4 SoC.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
> v2
>  - Newly introduced
>  - s/Atmel/Microchip/ (Nicolas)
>  - Drop leading 0 in node name/address
> 
> v3.5
>  - Drop interrupt/clock names (RobH)
> ---
>  .../media/microchip,sama5d4-vdec.yaml         | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
