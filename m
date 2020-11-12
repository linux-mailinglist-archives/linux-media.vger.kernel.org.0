Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37DFB2B0F8E
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 21:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbgKLUwv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 15:52:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbgKLUwk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 15:52:40 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD6B5C0613D1;
        Thu, 12 Nov 2020 12:52:24 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id p12so7856889ljc.9;
        Thu, 12 Nov 2020 12:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1PCFmHL9jxrDlNiGQDUfgb342r/C9J4p4TiODQIPVOw=;
        b=C63BcFLRmMr6BjHdPJ7x+/20OwIZr8EGZJtJJ4RUUXncWxDVDH1Iz8zxrSZHZLKTLj
         +F9aerhCccVLbn2X9zerIbeRVUzlYAP/o65kOtfDBuVR/8Y6UTQD5wOAn57BNRhJSh6G
         IOtcOO/fdhktDOleXsEquTQMqhm3Wuqo7d+gB/9SVCX8D+9I+G0lpAwcKrpLGyH100BY
         ohFUh/GCIqbsIyAe0JIIp9NpJ1tHPJuYGnZAX/w98JJIrfmaqoeaJEUU54rbCdQFABnn
         9oLcgvhSgxpKgBVBc3c0lXz8KARttpEb8QMmZcR3CAyet/WuvsZLK+BZOQDPxDitvT6j
         JOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1PCFmHL9jxrDlNiGQDUfgb342r/C9J4p4TiODQIPVOw=;
        b=A+XvAZD457S00UcIBPxhlWfu6exXX3qqmFLMyTAuPD88iXgtXPspztAklAQ1l0jdUm
         HuEDqwURucebiJOgbAA7tb/lSIDwccS4ZzOEbCMnfmSDmkG9VPgfL/PzQ3FR+vzqYLNm
         GtqQFXVyj3HuaJLLCW9FANe0e0JQlTbO0DeFUae0YNhvwOZxgNpBc5Vg5CKAtENgEB8V
         5FqV2332k4omo2jq6OAy/xnkevbMTwEahDZvdMQsnv7Fkohw0Vg0cunS3lwa17o8PKGY
         V/fQye7bbWH9SYXWXavJilkn5wOgG5w75R+tIy671Em+p2wWM9gE1kpTZCFJb78nhmEl
         FeXA==
X-Gm-Message-State: AOAM532xckMo0dcQYy8KMCVTERDAa3GkfILIQFgjN6dt6rV+jQgfKHUw
        T/7KsMtXe1ympnaSShZPRjE=
X-Google-Smtp-Source: ABdhPJzYoce87YJRWsbhq+RalWwn+eUR1b2DdBQr+FozZ4VysHewXyTW07CNWbyl+Sig9NxEz+urwg==
X-Received: by 2002:a2e:9c89:: with SMTP id x9mr607563lji.461.1605214343302;
        Thu, 12 Nov 2020 12:52:23 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:4662:fa95:113a:ced3:2a3e:b3a4? ([2a00:1fa0:4662:fa95:113a:ced3:2a3e:b3a4])
        by smtp.gmail.com with ESMTPSA id c9sm904777lfd.98.2020.11.12.12.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2020 12:52:22 -0800 (PST)
Subject: Re: [PATCH v4 8/8] [DNI] arm64: dts: renesas: eagle: Specify channel
 amplitude
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20201112162729.101384-1-jacopo+renesas@jmondi.org>
 <20201112162729.101384-9-jacopo+renesas@jmondi.org>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <3a659060-8e73-0d58-0415-7f567556f966@gmail.com>
Date:   Thu, 12 Nov 2020 23:52:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201112162729.101384-9-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/12/20 7:27 PM, Jacopo Mondi wrote:

> Use the newly introduced 'maxim,maxim,initial-reverse-channel-mV'

   "maxim," repeated twice.

> property to specify the initial reverse channel amplitude when the
> remote serializers are not pre-programmed with noise immunity threshold
> enabled.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> index 45b947d44cee..75296865104c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -308,6 +308,7 @@ gmsl: gmsl-deserializer@48 {
>  
>  		/* eagle-pca9654-max9286-pwdn */
>  		enable-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
> +		maxim,initial-reverse-channel-mV = <100>;
>  
>  		/*
>  		 * Workaround: Hog the CAMVDD line high as we can't establish a

MBR, Sergei
