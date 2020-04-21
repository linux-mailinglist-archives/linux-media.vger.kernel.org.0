Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F20D1B2787
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 15:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729028AbgDUNTl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 09:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726691AbgDUNTk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 09:19:40 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B5F0C061A10;
        Tue, 21 Apr 2020 06:19:40 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id x25so3550698wmc.0;
        Tue, 21 Apr 2020 06:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TAO+0ZkQGzRlz79i9so3eTTstzU170GvA9NPAGQEIMQ=;
        b=D9x5mxHFMGg+HnZopS9+Zgl4ocxvopuSEo6BqEwDW+5f7Jn7eo+EHmjtUGZw43My+S
         nIDulDrnrMxWXgjM4y+tGlVDAEjZkxqJfKld3UD7pDfmcQWp7ayYOkwv3kHM9k3z3L4B
         y5BRcojU/DG5+0lIoEZ9XlRNCvYgxfhnxkwo3KIpIcdX7iZZSfh5ZbR7OrNk/g0LvUCs
         Lf84VWlivj4vXdm6uRvwXD+7ay1CdeqM6cDVKe7MNMOVKUryPAnqYJDMGUwlWZc1zEvL
         O76dUv+liatt0wUeHHESLmXa+leq7LgDWVVEXEf+nAEFNd5+7kvSQVgncU87Xi2rarAD
         Ok5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TAO+0ZkQGzRlz79i9so3eTTstzU170GvA9NPAGQEIMQ=;
        b=DXP+6cR1TQYsUf649J0ij4gQNtQcfS70MwPi3Qfy/5DnwM84Vs3wxXXvI/QQSAEygC
         waNs2FBXPHVZr1SmgRvGunCdPnTxWZNAlVAmV3EM4s2BTve7obb9+OKZA6YXVqkTu/Tw
         r1ItWUHIHLuRJy/CFYuopToEkks1nRY9XLf2RljmqyMTh7eOrADKtbZG2ZFJ8lyIgE0j
         5vZdVRiLOgHV8ePbs+/Ixiuq/ncy9cr3dUaGj1FpWHNX1CdTqO8+ghXe+oJgZYLRy0AO
         2j72HLNGI2FmR6f6bkcUi5PIRePLBxJe6AYgN42GLUvhVvFVOwChovoQGywn+I7VqZeT
         Pl7A==
X-Gm-Message-State: AGi0PuYHbUPkMVdZUYET/jQXvHLnZpDGJY88Rh07QKlrIs1pjWoUsU5x
        quB6vchIV1Tjo3h9t+5L5cY=
X-Google-Smtp-Source: APiQypLr/7nO9p+xL01dDsn1rdwzQMyND4hb6/GRHkqQt+WjCBL145fU5drl2P0dW+IH4WO5WuiZew==
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr4981350wmc.67.1587475178825;
        Tue, 21 Apr 2020 06:19:38 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id w6sm3847410wrm.86.2020.04.21.06.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 06:19:38 -0700 (PDT)
Subject: Re: [PATCH v4] dt-bindings: rockchip-vpu: Convert bindings to
 json-schema
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     ezequiel@collabora.com, devicetree@vger.kernel.org,
        hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        mark.rutland@arm.com, robh@kernel.org
References: <20200326191343.1989-1-ezequiel@collabora.com>
 <12f6d7cf-6af6-4f54-3188-65e73b703a72@gmail.com>
Message-ID: <9328212d-139f-6a0e-7d0c-3a5529a392f2@gmail.com>
Date:   Tue, 21 Apr 2020 15:19:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <12f6d7cf-6af6-4f54-3188-65e73b703a72@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Question for the media maintainers Hans & Co. :

What's nxp,imx8mq-vpu.yaml doing under rga?
Why is rockchip-vpu.yaml inserted under rga instead of vpu?

Johan

> diff --git a/MAINTAINERS b/MAINTAINERS
> index f0e7b4d17fcc..0cfd86594b0b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14471,7 +14471,8 @@ M:	Jacob Chen <jacob-chen@iotwrt.com>
>  M:	Ezequiel Garcia <ezequiel@collabora.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/media/rockchip-rga.txt
> +F:	Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> +F:	Documentation/devicetree/bindings/media/rockchip-vpu.yaml
>  F:	drivers/media/platform/rockchip/rga/

HANTRO VPU CODEC DRIVER
M:	Ezequiel Garcia <ezequiel@collabora.com>
M:	Philipp Zabel <p.zabel@pengutronix.de>
L:	linux-media@vger.kernel.org
L:	linux-rockchip@lists.infradead.org
S:	Maintained
F:	Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
F:	Documentation/devicetree/bindings/media/rockchip-vpu.txt
F:	drivers/staging/media/hantro/

ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
M:	Jacob Chen <jacob-chen@iotwrt.com>
M:	Ezequiel Garcia <ezequiel@collabora.com>
L:	linux-media@vger.kernel.org
S:	Maintained
F:	Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
F:	Documentation/devicetree/bindings/media/rockchip-vpu.yaml
F:	drivers/media/platform/rockchip/rga/
