Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D319411D891
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 22:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731102AbfLLVam (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 16:30:42 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38726 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731097AbfLLVam (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 16:30:42 -0500
Received: by mail-wr1-f65.google.com with SMTP id y17so4357578wrh.5
        for <linux-media@vger.kernel.org>; Thu, 12 Dec 2019 13:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Ar3WGUfhwEDSSCq+9U1VZWrSE5XYUNVdZnayKnIhqMo=;
        b=tohT6lXBhBc2QJ3oUJgFUSmQ7INkSx6FdEKCFGb0sJVtpqkXC+tujNgxj/fj2RPgvC
         /ojbALCKFzuioc5m2Oc5vymHLHGEc1677h4HuhZrW9jfDHZOVEJgtMRcb3dSSvjHnkvu
         cnn2i2s9LuMyaFISELlYzr70zXQ+oHotcglIWaf7KuMdUj0mikYSoHWHeQMZE0a4gs3E
         c8MHuf4nOcEzqckIyTI7p0PVThKQ0grDjWKV7smF3qVSELFnMMsW1jxkx9ZEbrlwcHMV
         GeV3IATLxC5H7dJ0BUR96f3PGXYDZ6dqb0OpaIxx7YWvLonmEEpd2alYGb1eqgcvn1CG
         As8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Ar3WGUfhwEDSSCq+9U1VZWrSE5XYUNVdZnayKnIhqMo=;
        b=P05VcCPJ5PZJHUm1Itlx3CHWPi1jfbepZuaS0q8/pH1673cXWobXGnJN2M0pTn1Osi
         FEEmGZr9a+AmZfiF9Lej+459lleSNQ5NUR3SWfdzwGGjihzidyxde44VdJvEHNV2s3TH
         pUttAbccJoPOIueIWFtoWYSPs4NXw7oXZz6zXNa9P9ngiknEQBH/2lf725UqvSP+Mz9W
         kzoo/e+UxUtYU04doSKjSmX7SdFXTo+VmtVxeHSiGBYDKd8VoN1pR/ZIXZRdXFmevr27
         QPzNFDBby19/ThpnBF8mhMPnwki6GT4offv3NCEHJvbUBv1DahghEuNJuAvob6IFZEk8
         GKtw==
X-Gm-Message-State: APjAAAVuhGcfzcN0olCW85C/k0PHm0KqVo4CKb9YFjBETbTcuDg9W2eG
        ijLhOGJ/lnumZoCrztoP7yl5fM9XIZS2ew==
X-Google-Smtp-Source: APXvYqxdK6wPYL6bpRlBDpDABeuKHmVhx787FfsFi1e5hzInLniJKOGj9A9UNuqksGO6GoeLEepgOA==
X-Received: by 2002:adf:e3c1:: with SMTP id k1mr8247798wrm.151.1576186240242;
        Thu, 12 Dec 2019 13:30:40 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca? ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
        by smtp.gmail.com with ESMTPSA id n8sm7605285wrx.42.2019.12.12.13.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 13:30:39 -0800 (PST)
Subject: Re: [PATCH 3/3] media: platform: meson-ao-cec-g12a: add wakeup
 support
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, khilman@baylibre.com,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-media <linux-media@vger.kernel.org>
References: <20191212145925.32123-1-glaroque@baylibre.com>
 <20191212145925.32123-4-glaroque@baylibre.com>
 <CAFBinCDjfzQX=ZG=cgTYo=icGNU-t4Kqnu0Bu5qRLsRk_s6S_Q@mail.gmail.com>
From:   guillaume La Roque <glaroque@baylibre.com>
Message-ID: <b923c0f0-3627-121a-fa4f-49bd0c40825b@baylibre.com>
Date:   Thu, 12 Dec 2019 22:30:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCDjfzQX=ZG=cgTYo=icGNU-t4Kqnu0Bu5qRLsRk_s6S_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,


thanks for review

On 12/12/19 8:57 PM, Martin Blumenstingl wrote:
> Hi Guillaume,
>
> (I don't know the specifics of this hardware but I have two general
> comments below)
>
> On Thu, Dec 12, 2019 at 4:00 PM Guillaume La Roque
> <glaroque@baylibre.com> wrote:
>> +#define CECB_FUNC_CFG_REG              0xA0
>> +#define CECB_FUNC_CFG_MASK             GENMASK(6, 0)
>> +#define CECB_FUNC_CFG_CEC_ON           0x01
>> +#define CECB_FUNC_CFG_OTP_ON           0x02
>> +#define CECB_FUNC_CFG_AUTO_STANDBY     0x04
>> +#define CECB_FUNC_CFG_AUTO_POWER_ON    0x08
>> +#define CECB_FUNC_CFG_ALL              0x2f
>> +#define CECB_FUNC_CFG_NONE             0x0
>> +
>> +#define CECB_LOG_ADDR_REG      0xA4
>> +#define CECB_LOG_ADDR_MASK     GENMASK(22, 16)
> do these registers have some RTI_* prefix in the datasheet?
> that would make it easier to spot that these registers belong to AO /
> RTI (while all other registers belong to the CEC controller)

as i say register info come from amlogic BSP.

nothing in datasheet unfortunately. in amlogic code , this register are called AO_DEBUG_REG0 and AO_DEBUG_REG1 in amlogic BSP...

>
> [...]
>> +       if (ao_cec->regmap_ao_sysctrl)
>> +               ret |= regmap_update_bits(ao_cec->regmap_ao_sysctrl,
>> +                                        CECB_LOG_ADDR_REG,
>> +                                         CECB_FUNC_CFG_MASK,
> why do we need to mask CECB_FUNC_CFG_MASK (from register 0xa0) in the
> CECB_LOG_ADDR_REG register (0xa4)?
good point, it's an error i will fix
>
>> +                                         logical_addr << CECB_LOG_ADDR_SHIFT);
> FIELD_PREP(CECB_FUNC_CFG_MASK, logical_addr) would make it consistent
> with the rest of the driver
> then you can also drop the #define CECB_LOG_ADDR_SHIFT
i will
>
> Martin
