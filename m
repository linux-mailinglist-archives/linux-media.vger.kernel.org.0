Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB1AF35A2A5
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 18:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233554AbhDIQHh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 12:07:37 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:41488 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhDIQHh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 12:07:37 -0400
Received: by mail-ot1-f43.google.com with SMTP id l12-20020a9d6a8c0000b0290238e0f9f0d8so6148224otq.8;
        Fri, 09 Apr 2021 09:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OCJr7Vk+1FJPSb9Nhdjq3OzP+a2tNeZU1Kg0OHLMxSE=;
        b=pPpdx7z5BDIZDegh3uJXHHm0MwSDc2qtfgTlZ94DiHNhc05w8qDqdcRygrvS5Gd3Mx
         /ZQuyz+h3PmkSSsumqNqxwwCcFM1Sb95A+D/hIsqpEuzIQERvUxpDnaYuW7QzPx10TNA
         YxKwN9UbhhnnevCJaQq9cDwYKyEJlrDCw3FJB1nQ+0X3goylTV0ElO2xABmVLJipsV+j
         VjU1AWRTrDm7pJZEXBzh7nebPw3innanf/dFce+QEJaIB/z6YddHtffVzH3GhrN2mILB
         lpPrbLr/CyIAimDgikmed+JavLRGoMLZnWMUpn/WKHc15AryN76wSFjl+eL8n0PuYbee
         aOyw==
X-Gm-Message-State: AOAM530pXodyWUV0S7cEWbUENvAz5btFgB47OduCUyusksy0JEQ0rYHa
        Vb3gWa7upYnnnew1u88hM22usLllFw==
X-Google-Smtp-Source: ABdhPJwfqJ/8w13GYqG7DeY3Ek9KCysjpMwYFpXqJFVhsBOItZGKZBDlG29F90Y9Brx/5lnXI8k28Q==
X-Received: by 2002:a9d:550b:: with SMTP id l11mr12532876oth.218.1617984443767;
        Fri, 09 Apr 2021 09:07:23 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d21sm554705oic.54.2021.04.09.09.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 09:07:22 -0700 (PDT)
Received: (nullmailer pid 3735531 invoked by uid 1000);
        Fri, 09 Apr 2021 16:07:22 -0000
Date:   Fri, 9 Apr 2021 11:07:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 28/30] dt-bindings: media: atmel: add microchip-xisc
 binding
Message-ID: <20210409160722.GA3733611@robh.at.kernel.org>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
 <20210405155105.162529-29-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210405155105.162529-29-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 05, 2021 at 06:51:03PM +0300, Eugen Hristev wrote:
> Add bindings for the microchip xisc, a driver based on atmel-isc.
> It shares common code with atmel-isc, but the xisc is the next generation
> ISC which is present on sama7g5 product.
> It has an enhanced pipeline, additional modules, formats, and it supports
> not only parallel sensors, but also serial sensors, by connecting to a demux
> endpoint present on sama7g5.
> One of the key points for creating a new binding is the clocking scheme, as
> atmel-isc requires 3 mandatory clocks, the microchip-xisc requires a single
> input clock.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> 
> Hello Rob, all,
> 
> I did not convert this yet to yaml because I would like first your feedback
> if the binding is good.
> If it's fine I will convert both this new binding and the old atmel-isc
> to yaml.

Looks pretty straight forward.

Rob
