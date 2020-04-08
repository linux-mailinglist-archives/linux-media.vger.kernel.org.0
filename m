Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 445731A274E
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 18:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728562AbgDHQhw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 12:37:52 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37576 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728443AbgDHQhw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 12:37:52 -0400
Received: by mail-pf1-f193.google.com with SMTP id u65so2649128pfb.4
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 09:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=qAk4SD/ATELXjDqN+ivnaqiB8olsrhUdZe9sE6YZPIE=;
        b=V5yYx/2849ZvS3leffs4kihQh1HA1ThY72OrcvYQNxCKf4saUpnH0v3HN7hUbjxJ1o
         Tv1Rz+6m/QV8CjI9Gb/6d/+UGytnVg1ubXTlzUpWqp9P2uv3GqWDmKi8gkHXGFTuBkA6
         jBANhnXDwTo9RlS6BBYNKaMtyiY1s/ZUdOsdEcnBp479EKjyDydhS/JOLoSki1PWzJiJ
         fYxAvpcszfBY8RXl43Tuc7pkfVIEg+V54OvO3F8ZTXQYerKfJ95a6uDMfURCifcnhugJ
         Z4hdnTMzWs0i2s+qMbMyRmkFWb6pZLSnwx/NF6k2XJUyFIZNrvy5DVBCwkEyGy9J1HIu
         Gnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qAk4SD/ATELXjDqN+ivnaqiB8olsrhUdZe9sE6YZPIE=;
        b=FsdnDIWZnq5zwrY85ugXjlTbaWY4hR/JTXkFyHKwvccX/M29FVagsZdcH7SSMoh3kP
         kxInvJSnuwZRuAeDYRDi6k0VyWqkj7WD5IvAYsTbzM6EUVVWcGkvdEXyZzHD0Sfrerey
         K77kdr3ic56lnsTOhrgvEoLJFi3KTeVCvpY74dQHMmQZWUPlgzQR4C0TNwwr6cKXK+8J
         RDijeo9sjJocgAHt05hv+5+9AmQUtsugJCP5TW78S1m45zj1iWBcgumjSwdp2EgwJktE
         p7Vnc0hw82cAE/S7U/FeauCKMuo2fP+rsJ0quuuH0H0Z7i9D4/7lX6SKJ2QFin4bFPE5
         L4mg==
X-Gm-Message-State: AGi0PubG4MMOwM3Eb3rsbMlBNi3l20amg5mjgfn3OQZZOQTBLGRxAC0G
        iHbJ1IsghF18MFWl7dZYqSfJ3lxXmVU=
X-Google-Smtp-Source: APiQypIst9fNDbMQ99RywCeWF6yPI+TKbo1bFENekyi6Uf/qAT+11m3fscmZDky/sIOLApIQNtqviA==
X-Received: by 2002:a63:513:: with SMTP id 19mr7866328pgf.48.1586363870669;
        Wed, 08 Apr 2020 09:37:50 -0700 (PDT)
Received: from [172.30.89.104] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id g3sm2800799pgd.64.2020.04.08.09.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 09:37:50 -0700 (PDT)
Subject: Re: [PATCH 3/4] media: imx.rst: Provide the OV560 module part number
To:     Fabio Estevam <festevam@gmail.com>, hverkuil-cisco@xs4all.nl
Cc:     p.zabel@pengutronix.de, linux-media@vger.kernel.org
References: <20200408123215.2531-1-festevam@gmail.com>
 <20200408123215.2531-3-festevam@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <671c0649-8f91-4255-0351-2f0d30593c87@gmail.com>
Date:   Wed, 8 Apr 2020 09:37:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200408123215.2531-3-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/8/20 5:32 AM, Fabio Estevam wrote:
> In order to improve the documentation, provide the OV5640 MIPI module
> part number that is used on the imx6q-sabresd board.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Steve Longerbeam <slongerbeam@gmail.com>

> ---
>   Documentation/media/v4l-drivers/imx.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
> index 3b4767f5f422..37b944f12d93 100644
> --- a/Documentation/media/v4l-drivers/imx.rst
> +++ b/Documentation/media/v4l-drivers/imx.rst
> @@ -641,8 +641,8 @@ connects to i2c bus 1 and the OV5640 to i2c bus 2.
>   The device tree for SabreSD includes OF graphs for both the parallel
>   OV5642 and the MIPI CSI-2 OV5640, but as of this writing only the MIPI
>   CSI-2 OV5640 has been tested, so the OV5642 node is currently disabled.
> -The OV5640 module connects to MIPI connector J5 (sorry I don't have the
> -compatible module part number or URL).
> +The OV5640 module connects to MIPI connector J5. The NXP part number
> +for the OV5640 module that connects to the SabreSD board is H120729.
>   
>   The following example configures a direct conversion pipeline to capture
>   from the OV5640, transmitting on MIPI CSI-2 virtual channel 0:

