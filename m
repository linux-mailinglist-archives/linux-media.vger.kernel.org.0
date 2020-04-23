Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40FE01B5BB8
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 14:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728366AbgDWMsN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 08:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726840AbgDWMsM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 08:48:12 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79BD0C08E934;
        Thu, 23 Apr 2020 05:48:12 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id v4so7382779wme.1;
        Thu, 23 Apr 2020 05:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AIWDZqBU/m1xMWhrZfTJgdQpK0v0DeS2ch8sjIFRn1o=;
        b=IWSs9nbgcZK6vbN6AxMc7DXCMIRSEXT+zXxFa2memXXRINJEoe9BBuUC1XuEul8cU5
         faG8X/sEDFm2OAPncZD6JmPNo/L1TCNX6CfNM11N3DEfoFStIKSDEELn15N3Z+5P4PUy
         wUaZgTs5CIAU/qMmi+8RxsyD9Ca+MjwUfOhdK2mWesajkf1G2Z7IYe5KxwnsnPiaMn9D
         35ZJSQFo6N12ePSS4VxpnFbMFNX8ublLbVA6itFGlvvFB7iRh5VEwbegt6KIanp/CSoF
         yY3yAFC6idyTWu1j/1GNB3sus005W1MD6LDsqf++mUuPvql+q7Y1flk4g+/GCpd8t7Vb
         yBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AIWDZqBU/m1xMWhrZfTJgdQpK0v0DeS2ch8sjIFRn1o=;
        b=Je4D179eryVt9OOrWvuT59OQEgr4MFxIKnD8893r98+GdeWJoR+lPzlnFBe+UmG9vN
         QHHCdGISb2kRQL5jgNVqdlj1n2t9gskyuvFPnFNEg/9SfOSaUUeuTqDHQZhxz4lLr5ee
         2u5jJY7lHCZuXdR9DfL60tKCi223MJueqRN6JqZB4Tkdw19Wx0WAiyemEv4VQ4SzmBXf
         npVVTJikJJW/HJR6oqJf8KdEMOkjJQS8/POfH1+Ui/cEMnbkNcM7l2LT2nGb9Dr8by96
         gVlNedSTmWDdy3e50ODwSdmHSZGcbISZax6fpKEjR+gRJYbtvuasdZs3ujbIMXzJAG8y
         4Qtg==
X-Gm-Message-State: AGi0PuZbh7jNgBIzxy3ayW5WbjyU4nZWUbfZzGIRnS/QOS7O+mVxU3vf
        3fvVAoNzwihBX+2p2yuNtsk=
X-Google-Smtp-Source: APiQypLbjw45ucXMMdNEze5vzTmLlFY1dYkm9XBnrtS1Rr4KNXzqteQX0stoMFeih45vI8iuRblXRQ==
X-Received: by 2002:a1c:5683:: with SMTP id k125mr3897667wmb.17.1587646091198;
        Thu, 23 Apr 2020 05:48:11 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id f8sm3626512wrm.14.2020.04.23.05.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 05:48:10 -0700 (PDT)
Subject: Re: [PATCH v2 7/9] media: MAINTAINERS: rkisp1: add path to
 dt-bindings
To:     Helen Koike <helen.koike@collabora.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com, kishon@ti.com
References: <20200403161538.1375908-1-helen.koike@collabora.com>
 <20200403161538.1375908-8-helen.koike@collabora.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <6cc8ac87-761b-de5d-7104-6f55f419a4d1@gmail.com>
Date:   Thu, 23 Apr 2020 14:48:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403161538.1375908-8-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

On 4/3/20 6:15 PM, Helen Koike wrote:
> The Rockchip ISP bindings was moved out of staging.
> Update MAINTAINERS file with the new path.
> 
> Suggested-by: Johan Jonker <jbx6244@gmail.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
> 
> V2:
> - This is a new patch in the series
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d66ac41ef5872..726044b84cf23 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14303,6 +14303,7 @@ M:	Helen Koike <helen.koike@collabora.com>
>  L:	linux-media@vger.kernel.org

L:	linux-rockchip@lists.infradead.org

>  S:	Maintained

>  F:	drivers/staging/media/rkisp1/
> +F:	Documentation/devicetree/bindings/media/rockchip-isp1.yaml

Rebase.
The MAINTAINERS document was recently sort.
Check entries with:

./scripts/parse-maintainers.pl --input=MAINTAINERS --output=MAINTAINERS
--order

>  
>  ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
>  M:	Jacob Chen <jacob-chen@iotwrt.com>
> 

