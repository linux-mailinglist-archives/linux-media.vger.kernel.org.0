Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 510B02B1F8
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 12:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfE0KS6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 06:18:58 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34705 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfE0KS6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 06:18:58 -0400
Received: by mail-wr1-f68.google.com with SMTP id f8so16392863wrt.1
        for <linux-media@vger.kernel.org>; Mon, 27 May 2019 03:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LwxUoJ6KHI7Lo4NCQzACEK8n04rpymIn25xi21VbxX4=;
        b=RqL1nQrOdTjnzSONL1IvtOuOlklcvbK1tF85BRV+pbcLrhXWlADQMKsenoa4tQjrLP
         N/jVWwsUuQT+XjDm/PuwIjgLVX5BGr1d0seSz7N3/TJFKnuxGwXn6zvBHJr8iqiRGXqJ
         Z7klCMvZWvov9l/aE0u3uUoRGZu9L6SoNhxal6ZE+toQPACBxnEfI5G5hMKfi4tNKRdj
         Qbu3Y1AmfGndb6R+aW7yydE0yPDplieWU4VQFk/39h9d5nojMZmT2NIi5pBnLocZ0ny1
         1G46SK/biSVszctEqgwekddHB74ixXLVykPdmeSKdsRVau0l90IfdDHDr4oVAV5UsSkS
         trnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LwxUoJ6KHI7Lo4NCQzACEK8n04rpymIn25xi21VbxX4=;
        b=gDGIQHiUmk0eBKhPIHXh9DSUmDwAU6GsXAcgw65H/oJrm3YyFZhF0DYhEFP23jrQ0H
         g8UDnS+Hm9RiEhidhubPGsfrXtD5GKBLFEEef/CiIOrU1lf1maoAzXkzG06mJQDZCGtb
         w0HkViQYlHfhKbYkjq3DoJfFSYOR0472/rQ3DdeZXZf205arQ12SSnT6uALwzQRgcE1R
         aPIs1l1NG2ydG/ca4xNsjIgRe3C3RRrVqEQGFKuz+RbeN4gzwk1hEXRpxY5tEIdtSM3l
         sJda8KslnucYxNOaJx3p6Z/mm4OD4gUVFXF2maMCK9FinM0TnJhOWYjjXncldAFLJaYv
         03iw==
X-Gm-Message-State: APjAAAUvP0Kfj3/OmZNP2uUjzl2H4ZsjtQD5BQLPmCumKpdQO4KzSGW7
        h6XgbjvjFCPGzA2QhlIUM1qadg==
X-Google-Smtp-Source: APXvYqyv3HYYF09TdDZ2Jkaw8zvFhG9+4dXf5+1hmublX7pzRHeL7KsnSbQ+YLYMrJThebn4SnCHdw==
X-Received: by 2002:adf:83c5:: with SMTP id 63mr43965605wre.33.1558952334994;
        Mon, 27 May 2019 03:18:54 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n10sm4553989wrr.11.2019.05.27.03.18.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 03:18:53 -0700 (PDT)
Subject: Re: [PATCH v6 3/4] media: meson: add v4l2 m2m video decoder driver
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
References: <20190514135612.30822-1-mjourdan@baylibre.com>
 <20190514135612.30822-4-mjourdan@baylibre.com>
 <07af1a22-d57c-aff6-b476-98fbf72135c1@xs4all.nl>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 mQENBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAG0KE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT6JATsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIW5AQ0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAYkBHwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8guQINBFYnf6QBEADQ+wBYa+X2n/xIQz/RUoGHf84Jm+yTqRT43t7sO48/cBW9vAn9
 GNwnJ3HRJWKATW0ZXrCr40ES/JqM1fUTfiFDB3VMdWpEfwOAT1zXS+0rX8yljgsWR1UvqyEP
 3xN0M/40Zk+rdmZKaZS8VQaXbveaiWMEmY7sBV3QvgOzB7UF2It1HwoCon5Y+PvyE3CguhBd
 9iq5iEampkMIkbA3FFCpQFI5Ai3BywkLzbA3ZtnMXR8Qt9gFZtyXvFQrB+/6hDzEPnBGZOOx
 zkd/iIX59SxBuS38LMlhPPycbFNmtauOC0DNpXCv9ACgC9tFw3exER/xQgSpDVc4vrL2Cacr
 wmQp1k9E0W+9pk/l8S1jcHx03hgCxPtQLOIyEu9iIJb27TjcXNjiInd7Uea195NldIrndD+x
 58/yU3X70qVY+eWbqzpdlwF1KRm6uV0ZOQhEhbi0FfKKgsYFgBIBchGqSOBsCbL35f9hK/JC
 6LnGDtSHeJs+jd9/qJj4WqF3x8i0sncQ/gszSajdhnWrxraG3b7/9ldMLpKo/OoihfLaCxtv
 xYmtw8TGhlMaiOxjDrohmY1z7f3rf6njskoIXUO0nabun1nPAiV1dpjleg60s3OmVQeEpr3a
 K7gR1ljkemJzM9NUoRROPaT7nMlNYQL+IwuthJd6XQqwzp1jRTGG26J97wARAQABiQM+BBgB
 AgAJBQJWJ3+kAhsCAikJEBaat7Gkz/iuwV0gBBkBAgAGBQJWJ3+kAAoJEHfc29rIyEnRk6MQ
 AJDo0nxsadLpYB26FALZsWlN74rnFXth5dQVQ7SkipmyFWZhFL8fQ9OiIoxWhM6rSg9+C1w+
 n45eByMg2b8H3mmQmyWztdI95OxSREKwbaXVapCcZnv52JRjlc3DoiiHqTZML5x1Z7lQ1T3F
 8o9sKrbFO1WQw1+Nc91+MU0MGN0jtfZ0Tvn/ouEZrSXCE4K3oDGtj3AdC764yZVq6CPigCgs
 6Ex80k6QlzCdVP3RKsnPO2xQXXPgyJPJlpD8bHHHW7OLfoR9DaBNympfcbQJeekQrTvyoASw
 EOTPKE6CVWrcQIztUp0WFTdRGgMK0cZB3Xfe6sOp24PQTHAKGtjTHNP/THomkH24Fum9K3iM
 /4Wh4V2eqGEgpdeSp5K+LdaNyNgaqzMOtt4HYk86LYLSHfFXywdlbGrY9+TqiJ+ZVW4trmui
 NIJCOku8SYansq34QzYM0x3UFRwff+45zNBEVzctSnremg1mVgrzOfXU8rt+4N1b2MxorPF8
 619aCwVP7U16qNSBaqiAJr4e5SNEnoAq18+1Gp8QsFG0ARY8xp+qaKBByWES7lRi3QbqAKZf
 yOHS6gmYo9gBmuAhc65/VtHMJtxwjpUeN4Bcs9HUpDMDVHdfeRa73wM+wY5potfQ5zkSp0Jp
 bxnv/cRBH6+c43stTffprd//4Hgz+nJcCgZKtCYIAPkUxABC85ID2CidzbraErVACmRoizhT
 KR2OiqSLW2x4xdmSiFNcIWkWJB6Qdri0Fzs2dHe8etD1HYaht1ZhZ810s7QOL7JwypO8dscN
 KTEkyoTGn6cWj0CX+PeP4xp8AR8ot4d0BhtUY34UPzjE1/xyrQFAdnLd0PP4wXxdIUuRs0+n
 WLY9Aou/vC1LAdlaGsoTVzJ2gX4fkKQIWhX0WVk41BSFeDKQ3RQ2pnuzwedLO94Bf6X0G48O
 VsbXrP9BZ6snXyHfebPnno/te5XRqZTL9aJOytB/1iUna+1MAwBxGFPvqeEUUyT+gx1l3Acl
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <480f2c43-9858-a4d3-7a6b-452756fb6076@baylibre.com>
Date:   Mon, 27 May 2019 12:18:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <07af1a22-d57c-aff6-b476-98fbf72135c1@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 27/05/2019 12:04, Hans Verkuil wrote:
> Hi Maxime,
> 
> First a high-level comment: I think this driver should go to staging.
> Once we finalize the stateful decoder spec, and we've updated the
> v4l2-compliance test, then this needs to be tested against that and
> only if it passes can it be moved out of staging.

I don't understand the reason since other stateful codecs are already
mainline and doesn't match the in-discussion stateful decoder spec either.

Neil

> 
> It is just a bit too soon to have this in mainline at this time.
> 
> One other comment below:
> 
> On 5/14/19 3:56 PM, Maxime Jourdan wrote:
>> Amlogic SoCs feature a powerful video decoder unit able to
>> decode many formats, with a performance of usually up to 4k60.
>>
>> This is a driver for this IP that is based around the v4l2 m2m framework.
>>
>> It features decoding for:
>> - MPEG 1
>> - MPEG 2
>>
>> Supported SoCs are: GXBB (S905), GXL (S905X/W/D), GXM (S912)
>>
>> There is also a hardware bitstream parser (ESPARSER) that is handled here.
>>
>> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
>> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
>> ---
>>  drivers/media/platform/Kconfig                |   10 +
>>  drivers/media/platform/meson/Makefile         |    1 +
>>  drivers/media/platform/meson/vdec/Makefile    |    8 +
>>  .../media/platform/meson/vdec/codec_mpeg12.c  |  209 ++++
>>  .../media/platform/meson/vdec/codec_mpeg12.h  |   14 +
>>  drivers/media/platform/meson/vdec/dos_regs.h  |   98 ++
>>  drivers/media/platform/meson/vdec/esparser.c  |  323 +++++
>>  drivers/media/platform/meson/vdec/esparser.h  |   32 +
>>  drivers/media/platform/meson/vdec/vdec.c      | 1071 +++++++++++++++++
>>  drivers/media/platform/meson/vdec/vdec.h      |  265 ++++
>>  drivers/media/platform/meson/vdec/vdec_1.c    |  229 ++++
>>  drivers/media/platform/meson/vdec/vdec_1.h    |   14 +
>>  .../media/platform/meson/vdec/vdec_ctrls.c    |   51 +
>>  .../media/platform/meson/vdec/vdec_ctrls.h    |   14 +
>>  .../media/platform/meson/vdec/vdec_helpers.c  |  441 +++++++
>>  .../media/platform/meson/vdec/vdec_helpers.h  |   80 ++
>>  .../media/platform/meson/vdec/vdec_platform.c |  107 ++
>>  .../media/platform/meson/vdec/vdec_platform.h |   30 +
>>  18 files changed, 2997 insertions(+)
>>  create mode 100644 drivers/media/platform/meson/vdec/Makefile
>>  create mode 100644 drivers/media/platform/meson/vdec/codec_mpeg12.c
>>  create mode 100644 drivers/media/platform/meson/vdec/codec_mpeg12.h
>>  create mode 100644 drivers/media/platform/meson/vdec/dos_regs.h
>>  create mode 100644 drivers/media/platform/meson/vdec/esparser.c
>>  create mode 100644 drivers/media/platform/meson/vdec/esparser.h
>>  create mode 100644 drivers/media/platform/meson/vdec/vdec.c
>>  create mode 100644 drivers/media/platform/meson/vdec/vdec.h
>>  create mode 100644 drivers/media/platform/meson/vdec/vdec_1.c
>>  create mode 100644 drivers/media/platform/meson/vdec/vdec_1.h
>>  create mode 100644 drivers/media/platform/meson/vdec/vdec_ctrls.c
>>  create mode 100644 drivers/media/platform/meson/vdec/vdec_ctrls.h
>>  create mode 100644 drivers/media/platform/meson/vdec/vdec_helpers.c
>>  create mode 100644 drivers/media/platform/meson/vdec/vdec_helpers.h
>>  create mode 100644 drivers/media/platform/meson/vdec/vdec_platform.c
>>  create mode 100644 drivers/media/platform/meson/vdec/vdec_platform.h
>>
> 
> <snip>
> 
>> diff --git a/drivers/media/platform/meson/vdec/vdec_ctrls.c b/drivers/media/platform/meson/vdec/vdec_ctrls.c
>> new file mode 100644
>> index 000000000000..d5d6b1b97aa5
>> --- /dev/null
>> +++ b/drivers/media/platform/meson/vdec/vdec_ctrls.c
>> @@ -0,0 +1,51 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2018 BayLibre, SAS
>> + * Author: Maxime Jourdan <mjourdan@baylibre.com>
>> + */
>> +
>> +#include "vdec_ctrls.h"
>> +
>> +static int vdec_op_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct amvdec_session *sess =
>> +	      container_of(ctrl->handler, struct amvdec_session, ctrl_handler);
>> +
>> +	switch (ctrl->id) {
>> +	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
>> +		ctrl->val = sess->dpb_size;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	};
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_ctrl_ops vdec_ctrl_ops = {
>> +	.g_volatile_ctrl = vdec_op_g_volatile_ctrl,
>> +};
>> +
>> +int amvdec_init_ctrls(struct v4l2_ctrl_handler *ctrl_handler)
>> +{
>> +	int ret;
>> +	struct v4l2_ctrl *ctrl;
>> +
>> +	ret = v4l2_ctrl_handler_init(ctrl_handler, 1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ctrl = v4l2_ctrl_new_std(ctrl_handler, &vdec_ctrl_ops,
>> +		V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 1);
>> +	if (ctrl)
>> +		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
> 
> Why is this volatile? That makes little sense.
> 
>> +
>> +	ret = ctrl_handler->error;
>> +	if (ret) {
>> +		v4l2_ctrl_handler_free(ctrl_handler);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(amvdec_init_ctrls);
> 
> <snip>
> 
> Regards,
> 
> 	Hans
> 

