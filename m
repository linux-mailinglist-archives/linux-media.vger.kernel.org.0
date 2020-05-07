Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 568AC1C9EDB
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 01:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbgEGXBw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 19:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgEGXBv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 May 2020 19:01:51 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85FB6C05BD43;
        Thu,  7 May 2020 16:01:51 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id v4so8546042wme.1;
        Thu, 07 May 2020 16:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Amh3I1P5I6BDFw+wjiIvKdrZM+vTRzn1yeHAQhH/mXQ=;
        b=JZvvpLly/WeFwEdPOAjsfNLtdVO1/saQlF77s8DN/ZF0BWu1MgILCIAn0AhqV/pkzw
         A0z4h7Q7Qvesyxx0pJK9xiME+nqD+bD7+zezYnuvLxdVrG7bfR2xuNnCOZbd7Dp6Aw9W
         FlL9tVfTviOY30rRUZm/SMF+6ks0eCV/FFZHuBJ0WdDjEBUfnVt31v0t9gAzu0jsoLVH
         AwOgqjj5EJZcN1de/fTVXyjqZ+mIoyGc2+9/yRLieRQErLNiDBjfrZDxmp+4ReKs+gkd
         qbJraJ6Wg1CzU+dZlm9aoFQFOrDAszZLkvflSUVLE3Z17CrA2vSTtqaGC/3MMcKqRqSQ
         qsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Amh3I1P5I6BDFw+wjiIvKdrZM+vTRzn1yeHAQhH/mXQ=;
        b=p/rg0Wa6yv46m788z5w0d3V2XuL+bOmX7K9qDmi0ZCTLK1FoTIElswqCajarVw83nc
         CpKc76+lnNrUbDaM+HECwcecKFzvFEwic4dAJzPw1FUth+4FP6jWyC6V34MW7xzcOT4/
         aaDoOgsRyc8OemaCDiF6dkfbEl7CJ7bshMMfTDtW3f9HRnxKNL2TuPNFZo1bd7vYfZXc
         i5hqIh7eSrOBzAx20oEOzHMI7oMNOtCPQqhsNrqVVgrr+XcKVhUF4eA9B5oW1Oltwuqh
         t0xj5ZF9EE9F8E/e969tLmjrtIY3kcIHN2dmaERTvIknGc7DBz1L6EoUuOCEPNMl7FJn
         dlUA==
X-Gm-Message-State: AGi0PuYot0Kvt7tfVomYwa39SbAm6ruAtwjbDtsN/3POpPGQaWrDNnFl
        Am/t0N7AwB9pZASXijWfQeQ=
X-Google-Smtp-Source: APiQypIXEPr64bDK5N2O7Q4uwKSHEOYR2e4k2roCXqGS0mC2od1qBH2YrfIpQ9yDJcfBWvqV0nWskg==
X-Received: by 2002:a1c:4b15:: with SMTP id y21mr12876858wma.150.1588892510056;
        Thu, 07 May 2020 16:01:50 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id o6sm10910992wrw.63.2020.05.07.16.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 16:01:49 -0700 (PDT)
Subject: Re: [PATCH v3 1/4] dt-bindings: rockchip-rga: Add PX30 compatible
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     devicetree@vger.kernel.org, ezequiel@collabora.com,
        hansverk@cisco.com, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        thomas.petazzoni@bootlin.com
References: <20200430164245.1630174-2-paul.kocialkowski@bootlin.com>
 <ed1ac7d6-12d3-5480-3699-70a88595cac2@gmail.com>
 <20200507202337.GJ2422122@aptenodytes>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <b3d65325-7383-f89b-f493-6219904c8931@gmail.com>
Date:   Fri, 8 May 2020 01:01:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507202337.GJ2422122@aptenodytes>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

With help of enum each additional compatibility string with fall back
'rockchip,rk3288-rga' adds only 1 extra line instead of 3.

See my and Heiko's response at the review of 'rockchip-saradc.yaml'.

Re: [PATCH v1 1/3] dt-bindings: iio: adc: convert rockchip saradc
bindings to yaml
https://lore.kernel.org/lkml/a35bdff4-601e-6186-584e-9a0b88cf3dbb@gmail.com/

The response of robh when I did something similar wrong as this patch.

Re: [PATCH 1/2] dt-bindings: usb: dwc2: add compatible property for
rk3328 usb
https://lore.kernel.org/lkml/20200310192933.GA15236@bogus/

Example of an approved patch with enum.

[PATCH v2 1/2] dt-bindings: usb: dwc2: add compatible property for
rk3328 usb
https://lore.kernel.org/lkml/20200311122121.8912-1-jbx6244@gmail.com/

Kind regards,

Johan

On 5/7/20 10:23 PM, Paul Kocialkowski wrote:
> Hi,
> 
> On Thu 30 Apr 20, 23:24, Johan Jonker wrote:
>> Hi Paul,
>>
>>>
>>> Add a new compatible for the PX30 Rockchip SoC, which also features
>>> a RGA block. It is compatible with the RK3288 RGA block.
>>>
>>> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>>> ---
>>>  Documentation/devicetree/bindings/media/rockchip-rga.yaml | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.yaml b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
>>> index dd645ddccb07..740586299da9 100644
>>> --- a/Documentation/devicetree/bindings/media/rockchip-rga.yaml
>>> +++ b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
>>> @@ -23,6 +23,9 @@ properties:
>>
>>
>>>        - items:
>>>            - const: rockchip,rk3228-rga
>>>            - const: rockchip,rk3288-rga
>>> +      - items:
>>> +          - const: rockchip,px30-rga
>>> +          - const: rockchip,rk3288-rga
>>
>> Use enum.
>>
>>       - items:
>>           - enum:
>>             - rockchip,px30-rga
>>             - rockchip,rk3228-rga
>>           - const: rockchip,rk3288-rga
> 
> Are you sure about this? The rk3228 above does it as I did it and other examples
> like allwinner,sun4i-a10-csi.yaml appear to be doing the same too.

The use of enum starts from 2 or more identical fall back strings.
'allwinner,sun4i-a10-csi.yaml' has 2 different fall back strings.

properties:
  compatible:
    oneOf:
      - const: allwinner,sun4i-a10-csi1
      - const: allwinner,sun7i-a20-csi0
      - items:
        - const: allwinner,sun7i-a20-csi1
        - const: allwinner,sun4i-a10-csi1
      - items:
        - const: allwinner,sun8i-r40-csi0
        - const: allwinner,sun7i-a20-csi0

> 
> The case with rockchip,rk3288-rga alone already seems covered.
See yaml examples in the links above.

> 
> Cheers,
> 
> Paul
> 
>>>  
>>>    reg:
>>>      maxItems: 1
>>> -- 
>>> 2.26.0
>>
> 

