Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 739B416468C
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 15:11:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgBSOLm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 09:11:42 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53926 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbgBSOLl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 09:11:41 -0500
Received: by mail-wm1-f68.google.com with SMTP id s10so796889wmh.3
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 06:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:autocrypt:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4nkXA+jvZycDtiW2JLZpr32cM5nz+bi6ODC7jxavZUE=;
        b=i2LVVonTox0RRUmtPWHDV0Yq/9wOU2t5ersHaNOYpEd9n78M44TXVwllGapPWQK+uj
         V3K4rcUyeO0ZYoo31eWZ6rlePLh1Vwhf/g60Rz5L/Ak814R4SwyuwMYIL8LV2jyv2vNi
         +EQJimL1wUU1AWEL7VXP71D9iDF3dRW9WIVdoqevWfvXIrsmjfaJ6hyP8s1Qs+JsF0ch
         jf86aRMNpYb/5S5YNfIAdu8jwQSItmxce+LCz/fLsEQZo0IRrmzjoS0mgvdW3+NTLR8A
         rdhRdFV2kxZTAlRQ7N05OzCQOdV/FjnxrsWRH1+yitKhEHmz6jSxsLxUdQT9poK+IVZ/
         Gtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=4nkXA+jvZycDtiW2JLZpr32cM5nz+bi6ODC7jxavZUE=;
        b=D7XtcsJ20OjT/9tXoywX6UZhRf4DJm2DXGMIHCaIrjdZmBwKuYv8NZ3C9F31v9wlIe
         RnYnMLCZKzL12Y3cuvEzQzDIcOWCzr+xP2ehhdCcRnAY8gyB8Zsf3C18teCuZdHwwZYk
         0qGbqSnonbnD1kM/sXlo5xHaBqC7IHLeACWJTqhZreD8QBRt2eGK3ad73p/unZmuiIF5
         chSlDB5+xfRv/DDSQQaeiRTDL8rx9F5kZmie2ELOL9rTp9l0MjK02JuD4/4d7/YxTXa2
         4UCDvBbKO1c+zjBmNnyjG+uCj+qTMkG9Zvxo1iJwgpJr0WKXTRNb0OWW+QV8wlNxJYPj
         92lg==
X-Gm-Message-State: APjAAAXvpfi8zfDfYKSaoqogSwilBhm/iRa8XzYjU4mSopOkgLzlPyJf
        rs6OMauEIYfSeGA9sRyLbWCQwQ==
X-Google-Smtp-Source: APXvYqyZMNlULMYfn0/K7gSsBMvb6w0SpWocpOKx9RpmrsPauoMuh18dJqy7LXMjX1NVnQDDYB4++Q==
X-Received: by 2002:a1c:8151:: with SMTP id c78mr9769819wmd.29.1582121498913;
        Wed, 19 Feb 2020 06:11:38 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858? ([2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858])
        by smtp.gmail.com with ESMTPSA id f62sm3217551wmf.36.2020.02.19.06.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2020 06:11:38 -0800 (PST)
Subject: Re: [PATCH v5 3/3] arm64: dts: amlogic: add rc-videostrong-kii-pro
 keymap
To:     Mohammad Rasim <mohammad.rasim96@gmail.com>,
        linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
References: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
 <20200214085802.28742-4-mohammad.rasim96@gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <7f5648f0-f04a-ab65-f096-f2cf259795c9@baylibre.com>
Date:   Wed, 19 Feb 2020 15:11:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214085802.28742-4-mohammad.rasim96@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/02/2020 09:58, Mohammad Rasim wrote:
> videostrong kii pro comes with a nec rc, add the keymap to the dts
> 
> Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> index 2f1f829450a2..6c9cc45fb417 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> @@ -76,3 +76,7 @@ eth_phy0: ethernet-phy@0 {
>  		};
>  	};
>  };
> +
> +&ir {
> +	linux,rc-map-name = "rc-videostrong-kii-pro";
> +};
> --
> 2.25.0
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
