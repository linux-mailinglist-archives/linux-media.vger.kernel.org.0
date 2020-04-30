Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 109351C0922
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 23:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgD3VYW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 17:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726818AbgD3VYV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 17:24:21 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D7AC035494;
        Thu, 30 Apr 2020 14:24:21 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id o27so3754339wra.12;
        Thu, 30 Apr 2020 14:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:subject:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PyH2w2vQ2/ttTCu1gA9N4CJ/i81Ue6gR/CAS7sMwVvo=;
        b=IoQmpO3GmJlAH/aoZ8tWtIO9clTTbyYXCHpE2M77/yadwdU0QcXochTT58EyZDHPfo
         6Ky3UClDTBEDZlamB61fgp8qZ8OCa76ZhRK7PCf1ZYSRN8zSKzqPhG8h0VPaGqZTXUL2
         yje20nDGT3vNOE0lzNFrLnkDlkIS/Lxep7a8e+fkTXlTHDWUjttPDuIgBnL7f3PWCqp9
         avT6HHDbqVptfl4xXRqNLgAk6IcykEH///zA92BxQTXvxA7iRPE7W92qEzXE0sOvvLvp
         0jXXGlrGL1ihnwZ2ONmbCaOgoV2X5rbGStpJWh0J+zX62jGXhLc2ZMzx9VtOUdIoz0VQ
         g4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:subject:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PyH2w2vQ2/ttTCu1gA9N4CJ/i81Ue6gR/CAS7sMwVvo=;
        b=q087K/TrDvlFLH1OjW3rvZwa92MN0dstGZLfFClYJ2C+0ckVawGkrF/+ywcBQ/qEXE
         hyJKEvIhHbL+quztmGzh0uhIVedwXLcJbU/AF8yiY15Qyb0CY0KJFgrVtP4ohrbJjxcp
         tQhMfN6Q1tYiZDsJtDiXv35WEpAzKkRWYTI7dhRLmAOxmFLLYOKQgYYdCW4AEpGPe8Q1
         BSGXWO00L+6LyGxUqrUQStS3SJmylwNX1cLtokw5CHbMCDIFOtdDJn4nLeaxbvlkdnok
         sUY518JMc6KmZbfOkQiui2DzZxTAHoHofmi2ZL/h0acn/D+mtPDBiwjKP3Eq1c5cj8ls
         lePg==
X-Gm-Message-State: AGi0PuZllKaCoOExBoTyqMrFFwzWR0hYZEvYY+z26DlbQrWo5hvZacJe
        MuKFzlhZAWOjeKgOsAFPlQE=
X-Google-Smtp-Source: APiQypJ38a1LjrxqECLlYtfvpgXWAwQDQASib0V5TWlj0xUr7UPGEVPRcz1A/vXoxpgrmLk5qeo7cA==
X-Received: by 2002:adf:ec09:: with SMTP id x9mr560156wrn.364.1588281860038;
        Thu, 30 Apr 2020 14:24:20 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id z22sm1237653wma.20.2020.04.30.14.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 14:24:19 -0700 (PDT)
To:     paul.kocialkowski@bootlin.com
Cc:     devicetree@vger.kernel.org, ezequiel@collabora.com,
        hansverk@cisco.com, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        thomas.petazzoni@bootlin.com
References: <20200430164245.1630174-2-paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: rockchip-rga: Add PX30 compatible
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <ed1ac7d6-12d3-5480-3699-70a88595cac2@gmail.com>
Date:   Thu, 30 Apr 2020 23:24:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430164245.1630174-2-paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

> 
> Add a new compatible for the PX30 Rockchip SoC, which also features
> a RGA block. It is compatible with the RK3288 RGA block.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  Documentation/devicetree/bindings/media/rockchip-rga.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.yaml b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
> index dd645ddccb07..740586299da9 100644
> --- a/Documentation/devicetree/bindings/media/rockchip-rga.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
> @@ -23,6 +23,9 @@ properties:


>        - items:
>            - const: rockchip,rk3228-rga
>            - const: rockchip,rk3288-rga
> +      - items:
> +          - const: rockchip,px30-rga
> +          - const: rockchip,rk3288-rga

Use enum.

      - items:
          - enum:
            - rockchip,px30-rga
            - rockchip,rk3228-rga
          - const: rockchip,rk3288-rga

>  
>    reg:
>      maxItems: 1
> -- 
> 2.26.0

