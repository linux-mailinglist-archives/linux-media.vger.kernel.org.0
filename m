Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 998713AE88D
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 13:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbhFUMAn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 08:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhFUMAk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 08:00:40 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9318CC061760;
        Mon, 21 Jun 2021 04:58:26 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id j1so2118276wrn.9;
        Mon, 21 Jun 2021 04:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=80v3QdK6lvkTa+Gv+j5089kh4F58fian+x7X/sqsWnc=;
        b=P7V1sZttRDo+gv7B209QjtKRej8sON6YfC+dLoFsoPq4CA8F251j2apZkqH+4pB0+2
         m/cAVl7BEp+juNm9dbQIhvfxcfFQXhdNNbvQGXk+DtCEr8lmkBuzpBIMCG1uE5y37sCY
         CexGSEG9dMFHFVYLdP2D8pGVsI4wPuy10J6ZRYidmtSdouQYEjbOj4COwiCqYTzlIyvR
         YS/X/Dfm2oOhhci3ykaiyHOxSfwZS3XdezDqJc7VyJC/A2l/WHlDw6Jr6UVV/zanW2v9
         ufcT0/Q34EPzXx9geuhVC3JI3cs+OUNPQ69Tlbj8Kz/TkV0OAPdM3S4fGBRJ5syZ/swm
         C9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=80v3QdK6lvkTa+Gv+j5089kh4F58fian+x7X/sqsWnc=;
        b=nOd/nSKjKSMI1NXhHPblxaMreGyf25MoIqOZk08iJkX7DXgj1755yEUvFqJRkh5PJw
         9KR3tIDPZFOgaDiYRAIaVAwgsO9YCQxLOXEumGMbimpxmUY8LvS2r9CgrOzA0UUMeBlR
         CHtKRWrSu7txMo+SbVjfNnaFcKyBsGovYmv2cOOJPz0ViZ5U198XciKy37qpZyl9QoyE
         PuQinVpyUGE+IpV/KxZ5qj4QuRzdR90EXIlU6dOEFoLAPNeWHSGNk3xNlvQCS4Dtx9B5
         /M9Z7eaGidzkUvIyyX7uk1bOQghDuw+N8Nl8MQOOx7bsy8GW7oGTxH0QR+7Fhu8SxKeA
         ducA==
X-Gm-Message-State: AOAM532cHiFR+KQwTTJH9p/Fp+nqi06UUzRWVktrKDZSmGZtn0v+t8Sd
        y65SynM/yoaFZUTq1+1GVq6r5PfXeesG
X-Google-Smtp-Source: ABdhPJwFdShnzZcO1ddX2RbzeMUujpzXbXQzvHgGwyV+ILWRbHfPAIAbkr+xMsp7hH+KNcVvOyogDg==
X-Received: by 2002:a05:6000:89:: with SMTP id m9mr27342835wrx.8.1624276705168;
        Mon, 21 Jun 2021 04:58:25 -0700 (PDT)
Received: from [192.168.200.247] (ip5b434b8b.dynamic.kabel-deutschland.de. [91.67.75.139])
        by smtp.gmail.com with ESMTPSA id j17sm7254661wrx.0.2021.06.21.04.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 04:58:24 -0700 (PDT)
Subject: Re: [PATCH v2 08/12] ARM: dts: rockchip: add power controller for
 RK3036
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210527154455.358869-9-knaerzche@gmail.com>
 <1dc782cd3956598b2eb5f89ad0680d2ce38ffd54.camel@collabora.com>
 <3783580.yKVeVyVuyW@phil>
From:   Alex Bee <knaerzche@gmail.com>
Message-ID: <b7650d04-bfaf-696e-c492-e53c9a4408c1@gmail.com>
Date:   Mon, 21 Jun 2021 13:58:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3783580.yKVeVyVuyW@phil>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Heiko,

Am 13.06.21 um 18:22 schrieb Heiko Stuebner:
> Am Freitag, 11. Juni 2021, 17:58:58 CEST schrieb Ezequiel Garcia:
>> Hi Heiko,
>>
>> On Thu, 2021-05-27 at 17:44 +0200, Alex Bee wrote:
>>> Add the power controller node and the correspondending qos nodes for
>>> RK3036.
>>> Also add the power-domain property to the nodes that are already
>>> present.
>>> Note: Since the regiser offsets of the axi interconnect QoS are missing
>>> in the TRM (RK3036 TRM V1.0), they have been taken from vendor kernel.
>>>
>> Can you take care of the device tree changes (patches 8 to 12)?
> sure, I'll pick the power-domains now but need to wait for
> the vpu nodes for the driver parts to land in the media tree.

Looks like I'm too late for 5.14 - just in case you didn't follow or 
didn't receive a notification:

hantro patches of this series have been merged in media_tree and vpu 
node patches (please pick from v2) could get reviewed/applied now.

Thanks,

Alex

>
> Heiko
>
>
