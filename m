Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC631B5CA3
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 15:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbgDWNdp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 09:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726926AbgDWNdp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 09:33:45 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D317FC08E934;
        Thu, 23 Apr 2020 06:33:44 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j1so6880690wrt.1;
        Thu, 23 Apr 2020 06:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0Mxnr6QHfY5l0I7jQqZWYhUgYSSrzd0fZHj7N3zbutY=;
        b=VuH56kWd003boJuQQcUlw8yVQmGe1BHZSvNdF/cY7EpN4JQOs8Miy6zpbzOtbAL5TA
         tD6pAoBxupOUJE+vpfkf1o1ofVZbwDudQV3/1JM8c6ZooCk2GazIUtTqKgUbISjq4KGQ
         +AC8O0Aphrq9v23aGS4oVwBJ2mm+nhjCa0WmRNmxlppUbHMLLAIkIB9OpYx+/UoW28s5
         DtHlCvRf6TUGyU2+w6WYWSjiQYowqvbr/uRLT7lcuG1y6fsRNSc4hJr9PZiRxgE0IW4N
         eg/Sar2b2uNOVTodH/4Ic8t8kbRSYHuRzc7TaMXuX5V+SFEsZfBeeyLJdhr5SuQ3VnmG
         ZBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0Mxnr6QHfY5l0I7jQqZWYhUgYSSrzd0fZHj7N3zbutY=;
        b=PkmCADQxRValKnz3QtQ6PU2eWcGmdgvKhR3A43yK0KqegKdeVs5znG09QMh1Iq4xVG
         1PSk3uHMXwSY8VFKzL/miR75Hyd9fyq1AJXDSfAFccpwRYkGRbB9Aee4fxSELbxmxl/C
         ZH66dogltxDoO3/LvPcwsahTpQUgMP/EHfiGNUNiBSC3XBxmMsYEmQbaO+mRjfCOWqPE
         HsMJFmfeeGWt9xnvdJG1jiVJ22rfTB+x8EezRYB24zq4ldQVsUHrL/ZfPwDW+q3RSeSx
         neU6r1yjdU52rViq47srWDkpBYd3GDDytnpBKNtDk6IV4c1Z4CMK0/LA/Gi9UjEB53ul
         Z+mw==
X-Gm-Message-State: AGi0PuYo3mYh0XdJN0meB2qGXo1F4r2odyWiu2Y9mfc5Sn1asYZG2P/M
        KgOsj310RrqyMoOPJY+M+sk=
X-Google-Smtp-Source: APiQypLpY8N4F27spciix9Sp0I6NywG1ZST5sjbgl6JI+cEYUmY2EnFBHiU/1vkTiDZA9R8SP6bOVA==
X-Received: by 2002:adf:f4cb:: with SMTP id h11mr589133wrp.191.1587648823644;
        Thu, 23 Apr 2020 06:33:43 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id v7sm12489779wmg.3.2020.04.23.06.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 06:33:43 -0700 (PDT)
Subject: Re: [PATCH v2 6/9] dt-bindings: media: rkisp1: move rockchip-isp1
 bindings out of staging
To:     Helen Koike <helen.koike@collabora.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com, kishon@ti.com
References: <20200403161538.1375908-1-helen.koike@collabora.com>
 <20200403161538.1375908-7-helen.koike@collabora.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <32115405-8a29-29ee-69e2-7c662689ecfd@gmail.com>
Date:   Thu, 23 Apr 2020 15:33:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403161538.1375908-7-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,


>   clocks:
>     items:
>       - description: ISP clock
>       - description: ISP AXI clock clock
>       - description: ISP AXI clock  wrapper clock
>       - description: ISP AHB clock clock

Too many clocks here             ^
Too many spaces here                 ^

>       - description: ISP AHB wrapper clock

We can expect 4 to 5 clocks.
With 5 clocks and a different description this layout is maybe not so handy.

As first change:

  clocks:
    maxItems: 5
    description:
      rk3399 clocks
        ISP clock
        ISP AXI clock
        ISP AXI wrapper clock
        ISP AHB clock
        ISP AHB wrapper clock

And then later:

  clocks:
    maxItems: 5
    description:
      rk3288 clocks
        ISP clock
        ISP AXI clock
        ISP AHB clock
        ISP Pixel clock
        ISP JPEG source clock
      rk3399 clocks
        ISP clock
        ISP AXI clock
        ISP AXI wrapper clock
        ISP AHB clock
        ISP AHB wrapper clock

With 4 clocks:

  clocks:
    minItems: 4
    maxItems: 5
    description:
      rk1808 clocks
      rk3288 clocks
      rk3326 clocks
      rk3368 clocks
      rk3399 clocks
[..]


> 
>   clock-names:
>     items:
>       - const: clk_isp
>       - const: aclk_isp
>       - const: aclk_isp_wrap
>       - const: hclk_isp
>       - const: hclk_isp_wrap



On 4/3/20 6:15 PM, Helen Koike wrote:
> Move rkisp1 bindings to Documentation/devicetree/bindings/media
> 
> Verified with:
> make ARCH=arm64 dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
> 
> V2:
> - no changes
> 
>  .../devicetree/bindings/media/rockchip-isp1.yaml                  | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename {drivers/staging/media/rkisp1/Documentation => Documentation}/devicetree/bindings/media/rockchip-isp1.yaml (100%)
> 
> diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> similarity index 100%
> rename from drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> rename to Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> 

