Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E371815DAD1
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 16:25:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729612AbgBNPZA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 10:25:00 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40212 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729530AbgBNPY7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 10:24:59 -0500
Received: by mail-wm1-f65.google.com with SMTP id t14so11023456wmi.5
        for <linux-media@vger.kernel.org>; Fri, 14 Feb 2020 07:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=maBMToArQnCrx/dt1eJF9aiB5uOcb9JUL9A80CsH4+M=;
        b=MjYwDU3fNmEVJD6CFwoQaf4p/ruk1zy0/XDPQIwNkpQrIGMbhcwyrWwf/4RkUOHLHc
         hmgXEMeDLDSzrEVG120QE4sOP0rp0zkgtUjeAHHv3KWXGhKtbGHuOUIPIYNeEiDtmLFr
         cQu1U0VcZuz21A4Ac2ORmiEp+jHmsRW53neoIx3LRX2b0sVQbfRAzgZT449GP/3dxa70
         bmZGxH19VgKIM4ZzPV6y/Rb3Pf3cvDxcMyzcQVbnttJ51QIJ7Xx9+7QYTKxyO9TioNH3
         qQ17DS4vQrZ0heCqUFnGTp+7FIVIwDUHA98kibccI/6tSv21s9xvfE8YvhUHjYJQ5SFo
         JPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=maBMToArQnCrx/dt1eJF9aiB5uOcb9JUL9A80CsH4+M=;
        b=ZUUJ+j+d3+JyHEsyW8CCRC4hzOTxyTy3UQms+owaYayW9QoGonhkLuIpyJc4eSlmEm
         34dXpbWJru6CyeVF+n0QaZq0BprN82Q5TcXjnAGurZo9/11ms13JFagxPQYUMqEGUuzo
         s34wxFRIEKmE2byITKQiLhP1t6Ch38STYEARL0sZvQC19nTB3nnVbr71jc16m5nNQTac
         opZaHAjaOe0aETWRSGYhatTKd2VNVlefTs9edY+E+XXChFIaWMYsiRPqeNVuvI57718M
         gO2mVaoij5R7T5f2qZaokz+JqSDSUjBegSaEgMCF6cL+kvc35Wp5jmTXF8MTbfFhFqzC
         GIlg==
X-Gm-Message-State: APjAAAUEvv2n1XpN0IRc6sWZdoZMgP5mmKPXPAGj5Zr5CwcfqRQQZ+fW
        puICoP4Hd2X8eF2j20cHxM1GnQ==
X-Google-Smtp-Source: APXvYqzUDD4X69QLxgMtwCPyW11ey3NvdbRWE8j0/WExycoGa4GbigxOOwILW1+3L74YZyCi2zmVFQ==
X-Received: by 2002:a05:600c:291d:: with SMTP id i29mr5407621wmd.39.1581693894457;
        Fri, 14 Feb 2020 07:24:54 -0800 (PST)
Received: from [10.1.3.173] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id g25sm18123444wmh.3.2020.02.14.07.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2020 07:24:54 -0800 (PST)
Subject: Re: [PATCH v5 4/4] media: meson: vdec: add H.264 decoding support
To:     Hans Verkuil <hverkuil@xs4all.nl>, mchehab@kernel.org,
        hans.verkuil@cisco.com
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200206082648.25184-1-narmstrong@baylibre.com>
 <20200206082648.25184-5-narmstrong@baylibre.com>
 <b0c90501-d35e-3b00-9299-5225cc413d14@xs4all.nl>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT7CwHsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIXOwU0EVid/pAEQAND7AFhr
 5faf/EhDP9FSgYd/zgmb7JOpFPje3uw7jz9wFb28Cf0Y3CcncdElYoBNbRlesKvjQRL8mozV
 9RN+IUMHdUx1akR/A4BPXNdL7StfzKWOCxZHVS+rIQ/fE3Qz/jRmT6t2ZkpplLxVBpdu95qJ
 YwSZjuwFXdC+A7MHtQXYi3UfCgKiflj4+/ITcKC6EF32KrmIRqamQwiRsDcUUKlAUjkCLcHL
 CQvNsDdm2cxdHxC32AVm3Je8VCsH7/qEPMQ+cEZk47HOR3+Ihfn1LEG5LfwsyWE8/JxsU2a1
 q44LQM2lcK/0AKAL20XDd7ERH/FCBKkNVzi+svYJpyvCZCnWT0TRb72mT+XxLWNwfHTeGALE
 +1As4jIS72IglvbtONxc2OIid3tR5rX3k2V0iud0P7Hnz/JTdfvSpVj55ZurOl2XAXUpGbq5
 XRk5CESFuLQV8oqCxgWAEgFyEapI4GwJsvfl/2Er8kLoucYO1Id4mz6N33+omPhaoXfHyLSy
 dxD+CzNJqN2GdavGtobdvv/2V0wukqj86iKF8toLG2/Fia3DxMaGUxqI7GMOuiGZjXPt/et/
 qeOySghdQ7Sdpu6fWc8CJXV2mOV6DrSzc6ZVB4SmvdoruBHWWOR6YnMz01ShFE49pPucyU1h
 Av4jC62El3pdCrDOnWNFMYbbon3vABEBAAHCwn4EGAECAAkFAlYnf6QCGwICKQkQFpq3saTP
 +K7BXSAEGQECAAYFAlYnf6QACgkQd9zb2sjISdGToxAAkOjSfGxp0ulgHboUAtmxaU3viucV
 e2Hl1BVDtKSKmbIVZmEUvx9D06IijFaEzqtKD34LXD6fjl4HIyDZvwfeaZCbJbO10j3k7FJE
 QrBtpdVqkJxme/nYlGOVzcOiKIepNkwvnHVnuVDVPcXyj2wqtsU7VZDDX41z3X4xTQwY3SO1
 9nRO+f+i4RmtJcITgregMa2PcB0LvrjJlWroI+KAKCzoTHzSTpCXMJ1U/dEqyc87bFBdc+DI
 k8mWkPxsccdbs4t+hH0NoE3Kal9xtAl56RCtO/KgBLAQ5M8oToJVatxAjO1SnRYVN1EaAwrR
 xkHdd97qw6nbg9BMcAoa2NMc0/9MeiaQfbgW6b0reIz/haHhXZ6oYSCl15Knkr4t1o3I2Bqr
 Mw623gdiTzotgtId8VfLB2Vsatj35OqIn5lVbi2ua6I0gkI6S7xJhqeyrfhDNgzTHdQVHB9/
 7jnM0ERXNy1Ket6aDWZWCvM59dTyu37g3VvYzGis8XzrX1oLBU/tTXqo1IFqqIAmvh7lI0Se
 gCrXz7UanxCwUbQBFjzGn6pooEHJYRLuVGLdBuoApl/I4dLqCZij2AGa4CFzrn9W0cwm3HCO
 lR43gFyz0dSkMwNUd195FrvfAz7Bjmmi19DnORKnQmlvGe/9xEEfr5zjey1N9+mt3//geDP6
 clwKBkq0JggA+RTEAELzkgPYKJ3NutoStUAKZGiLOFMpHY6KpItbbHjF2ZKIU1whaRYkHpB2
 uLQXOzZ0d7x60PUdhqG3VmFnzXSztA4vsnDKk7x2xw0pMSTKhMafpxaPQJf494/jGnwBHyi3
 h3QGG1RjfhQ/OMTX/HKtAUB2ct3Q8/jBfF0hS5GzT6dYtj0Ci7+8LUsB2VoayhNXMnaBfh+Q
 pAhaFfRZWTjUFIV4MpDdFDame7PB50s73gF/pfQbjw5Wxtes/0FnqydfId95s+eej+17ldGp
 lMv1ok7K0H/WJSdr7UwDAHEYU++p4RRTJP6DHWXcByVlpNQ4SSAiivmWiwOt490+Ac7ATQRN
 WQbPAQgAvIoM384ZRFocFXPCOBir5m2J+96R2tI2XxMgMfyDXGJwFilBNs+fpttJlt2995A8
 0JwPj8SFdm6FBcxygmxBBCc7i/BVQuY8aC0Z/w9Vzt3Eo561r6pSHr5JGHe8hwBQUcNPd/9l
 2ynP57YTSE9XaGJK8gIuTXWo7pzIkTXfN40Wh5jeCCspj4jNsWiYhljjIbrEj300g8RUT2U0
 FcEoiV7AjJWWQ5pi8lZJX6nmB0lc69Jw03V6mblgeZ/1oTZmOepkagwy2zLDXxihf0GowUif
 GphBDeP8elWBNK+ajl5rmpAMNRoKxpN/xR4NzBg62AjyIvigdywa1RehSTfccQARAQABwsBf
 BBgBAgAJBQJNWQbPAhsMAAoJEBaat7Gkz/iuteIH+wZuRDqK0ysAh+czshtG6JJlLW6eXJJR
 Vi7dIPpgFic2LcbkSlvB8E25Pcfz/+tW+04Urg4PxxFiTFdFCZO+prfd4Mge7/OvUcwoSub7
 ZIPo8726ZF5/xXzajahoIu9/hZ4iywWPAHRvprXaim5E/vKjcTeBMJIqZtS4u/UK3EpAX59R
 XVxVpM8zJPbk535ELUr6I5HQXnihQm8l6rt9TNuf8p2WEDxc8bPAZHLjNyw9a/CdeB97m2Tr
 zR8QplXA5kogS4kLe/7/JmlDMO8Zgm9vKLHSUeesLOrjdZ59EcjldNNBszRZQgEhwaarfz46
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <373c26a0-7bb9-8e7f-521e-740ccbaca0bc@baylibre.com>
Date:   Fri, 14 Feb 2020 16:24:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <b0c90501-d35e-3b00-9299-5225cc413d14@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/02/2020 16:19, Hans Verkuil wrote:
> On 2/6/20 9:26 AM, Neil Armstrong wrote:
>> From: Maxime Jourdan <mjourdan@baylibre.com>
>>
>> Add support for the H264 compressed format (V4L2_PIX_FMT_H264).
>>
>> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/staging/media/meson/vdec/Makefile     |   2 +-
>>  drivers/staging/media/meson/vdec/codec_h264.c | 482 ++++++++++++++++++
>>  drivers/staging/media/meson/vdec/codec_h264.h |  14 +
>>  .../staging/media/meson/vdec/vdec_platform.c  |  61 +++
>>  4 files changed, 558 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/staging/media/meson/vdec/codec_h264.c
>>  create mode 100644 drivers/staging/media/meson/vdec/codec_h264.h
> 
> I get warnings when compiling this:
> 
> drivers/staging/media/meson/vdec/codec_h264.c:322: warning: Function parameter or member 'sess' not described in 'codec_h264_src_change'
> drivers/staging/media/meson/vdec/codec_h264.c:361: warning: Function parameter or member 'core' not described in 'get_offset_msb'
> drivers/staging/media/meson/vdec/codec_h264.c:361: warning: Function parameter or member 'frame_num' not described in 'get_offset_msb'

I'll fix these.

Neil

> 
> Regards,
> 
> 	Hans
> 
>>
>> diff --git a/drivers/staging/media/meson/vdec/Makefile b/drivers/staging/media/meson/vdec/Makefile
>> index 6bea129084b7..711d990c760e 100644
>> --- a/drivers/staging/media/meson/vdec/Makefile
>> +++ b/drivers/staging/media/meson/vdec/Makefile
>> @@ -3,6 +3,6 @@
>>  
>>  meson-vdec-objs = esparser.o vdec.o vdec_helpers.o vdec_platform.o
>>  meson-vdec-objs += vdec_1.o
>> -meson-vdec-objs += codec_mpeg12.o
>> +meson-vdec-objs += codec_mpeg12.o codec_h264.o
>>  
>>  obj-$(CONFIG_VIDEO_MESON_VDEC) += meson-vdec.o
>> diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
>> new file mode 100644
>> index 000000000000..4528a6a01c3d
>> --- /dev/null
>> +++ b/drivers/staging/media/meson/vdec/codec_h264.c
>> @@ -0,0 +1,482 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2019 BayLibre, SAS
>> + * Author: Maxime Jourdan <mjourdan@baylibre.com>
>> + */
>> +
>> +#include <media/v4l2-mem2mem.h>
>> +#include <media/videobuf2-dma-contig.h>
>> +
>> +#include "vdec_helpers.h"
>> +#include "dos_regs.h"
>> +
>> +#define SIZE_EXT_FW	(20 * SZ_1K)
>> +#define SIZE_WORKSPACE	0x1ee000
>> +#define SIZE_SEI	(8 * SZ_1K)
>> +
>> +/*
>> + * Offset added by the firmware which must be substracted
>> + * from the workspace phyaddr
>> + */
>> +#define WORKSPACE_BUF_OFFSET	0x1000000
>> +
>> +/* ISR status */
>> +#define CMD_MASK		GENMASK(7, 0)
>> +#define CMD_SRC_CHANGE		1
>> +#define CMD_FRAMES_READY	2
>> +#define CMD_FATAL_ERROR		6
>> +#define CMD_BAD_WIDTH		7
>> +#define CMD_BAD_HEIGHT		8
>> +
>> +#define SEI_DATA_READY	BIT(15)
>> +
>> +/* Picture type */
>> +#define PIC_TOP_BOT	5
>> +#define PIC_BOT_TOP	6
>> +
>> +/* Size of Motion Vector per macroblock */
>> +#define MB_MV_SIZE	96
>> +
>> +/* Frame status data */
>> +#define PIC_STRUCT_BIT	5
>> +#define PIC_STRUCT_MASK	GENMASK(2, 0)
>> +#define BUF_IDX_MASK	GENMASK(4, 0)
>> +#define ERROR_FLAG	BIT(9)
>> +#define OFFSET_BIT	16
>> +#define OFFSET_MASK	GENMASK(15, 0)
>> +
>> +/* Bitstream parsed data */
>> +#define MB_TOTAL_BIT	8
>> +#define MB_TOTAL_MASK	GENMASK(15, 0)
>> +#define MB_WIDTH_MASK	GENMASK(7, 0)
>> +#define MAX_REF_BIT	24
>> +#define MAX_REF_MASK	GENMASK(6, 0)
>> +#define AR_IDC_BIT	16
>> +#define AR_IDC_MASK	GENMASK(7, 0)
>> +#define AR_PRESENT_FLAG	BIT(0)
>> +#define AR_EXTEND	0xff
>> +
>> +/*
>> + * Buffer to send to the ESPARSER to signal End Of Stream for H.264.
>> + * This is a 16x16 encoded picture that will trigger drain firmware-side.
>> + * There is no known alternative.
>> + */
>> +static const u8 eos_sequence[SZ_4K] = {
>> +	0x00, 0x00, 0x00, 0x01, 0x06, 0x05, 0xff, 0xe4, 0xdc, 0x45, 0xe9, 0xbd,
>> +	0xe6, 0xd9, 0x48, 0xb7,	0x96, 0x2c, 0xd8, 0x20, 0xd9, 0x23, 0xee, 0xef,
>> +	0x78, 0x32, 0x36, 0x34, 0x20, 0x2d, 0x20, 0x63,	0x6f, 0x72, 0x65, 0x20,
>> +	0x36, 0x37, 0x20, 0x72, 0x31, 0x31, 0x33, 0x30, 0x20, 0x38, 0x34, 0x37,
>> +	0x35, 0x39, 0x37, 0x37, 0x20, 0x2d, 0x20, 0x48, 0x2e, 0x32, 0x36, 0x34,
>> +	0x2f, 0x4d, 0x50, 0x45,	0x47, 0x2d, 0x34, 0x20, 0x41, 0x56, 0x43, 0x20,
>> +	0x63, 0x6f, 0x64, 0x65, 0x63, 0x20, 0x2d, 0x20,	0x43, 0x6f, 0x70, 0x79,
>> +	0x6c, 0x65, 0x66, 0x74, 0x20, 0x32, 0x30, 0x30, 0x33, 0x2d, 0x32, 0x30,
>> +	0x30, 0x39, 0x20, 0x2d, 0x20, 0x68, 0x74, 0x74, 0x70, 0x3a, 0x2f, 0x2f,
>> +	0x77, 0x77, 0x77, 0x2e,	0x76, 0x69, 0x64, 0x65, 0x6f, 0x6c, 0x61, 0x6e,
>> +	0x2e, 0x6f, 0x72, 0x67, 0x2f, 0x78, 0x32, 0x36,	0x34, 0x2e, 0x68, 0x74,
>> +	0x6d, 0x6c, 0x20, 0x2d, 0x20, 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x73,
>> +	0x3a, 0x20, 0x63, 0x61, 0x62, 0x61, 0x63, 0x3d, 0x31, 0x20, 0x72, 0x65,
>> +	0x66, 0x3d, 0x31, 0x20,	0x64, 0x65, 0x62, 0x6c, 0x6f, 0x63, 0x6b, 0x3d,
>> +	0x31, 0x3a, 0x30, 0x3a, 0x30, 0x20, 0x61, 0x6e,	0x61, 0x6c, 0x79, 0x73,
>> +	0x65, 0x3d, 0x30, 0x78, 0x31, 0x3a, 0x30, 0x78, 0x31, 0x31, 0x31, 0x20,
>> +	0x6d, 0x65, 0x3d, 0x68, 0x65, 0x78, 0x20, 0x73, 0x75, 0x62, 0x6d, 0x65,
>> +	0x3d, 0x36, 0x20, 0x70,	0x73, 0x79, 0x5f, 0x72, 0x64, 0x3d, 0x31, 0x2e,
>> +	0x30, 0x3a, 0x30, 0x2e, 0x30, 0x20, 0x6d, 0x69,	0x78, 0x65, 0x64, 0x5f,
>> +	0x72, 0x65, 0x66, 0x3d, 0x30, 0x20, 0x6d, 0x65, 0x5f, 0x72, 0x61, 0x6e,
>> +	0x67, 0x65, 0x3d, 0x31, 0x36, 0x20, 0x63, 0x68, 0x72, 0x6f, 0x6d, 0x61,
>> +	0x5f, 0x6d, 0x65, 0x3d,	0x31, 0x20, 0x74, 0x72, 0x65, 0x6c, 0x6c, 0x69,
>> +	0x73, 0x3d, 0x30, 0x20, 0x38, 0x78, 0x38, 0x64,	0x63, 0x74, 0x3d, 0x30,
>> +	0x20, 0x63, 0x71, 0x6d, 0x3d, 0x30, 0x20, 0x64, 0x65, 0x61, 0x64, 0x7a,
>> +	0x6f, 0x6e, 0x65, 0x3d, 0x32, 0x31, 0x2c, 0x31, 0x31, 0x20, 0x63, 0x68,
>> +	0x72, 0x6f, 0x6d, 0x61,	0x5f, 0x71, 0x70, 0x5f, 0x6f, 0x66, 0x66, 0x73,
>> +	0x65, 0x74, 0x3d, 0x2d, 0x32, 0x20, 0x74, 0x68,	0x72, 0x65, 0x61, 0x64,
>> +	0x73, 0x3d, 0x31, 0x20, 0x6e, 0x72, 0x3d, 0x30, 0x20, 0x64, 0x65, 0x63,
>> +	0x69, 0x6d, 0x61, 0x74, 0x65, 0x3d, 0x31, 0x20, 0x6d, 0x62, 0x61, 0x66,
>> +	0x66, 0x3d, 0x30, 0x20,	0x62, 0x66, 0x72, 0x61, 0x6d, 0x65, 0x73, 0x3d,
>> +	0x30, 0x20, 0x6b, 0x65, 0x79, 0x69, 0x6e, 0x74,	0x3d, 0x32, 0x35, 0x30,
>> +	0x20, 0x6b, 0x65, 0x79, 0x69, 0x6e, 0x74, 0x5f, 0x6d, 0x69, 0x6e, 0x3d,
>> +	0x32, 0x35, 0x20, 0x73, 0x63, 0x65, 0x6e, 0x65, 0x63, 0x75, 0x74, 0x3d,
>> +	0x34, 0x30, 0x20, 0x72,	0x63, 0x3d, 0x61, 0x62, 0x72, 0x20, 0x62, 0x69,
>> +	0x74, 0x72, 0x61, 0x74, 0x65, 0x3d, 0x31, 0x30,	0x20, 0x72, 0x61, 0x74,
>> +	0x65, 0x74, 0x6f, 0x6c, 0x3d, 0x31, 0x2e, 0x30, 0x20, 0x71, 0x63, 0x6f,
>> +	0x6d, 0x70, 0x3d, 0x30, 0x2e, 0x36, 0x30, 0x20, 0x71, 0x70, 0x6d, 0x69,
>> +	0x6e, 0x3d, 0x31, 0x30,	0x20, 0x71, 0x70, 0x6d, 0x61, 0x78, 0x3d, 0x35,
>> +	0x31, 0x20, 0x71, 0x70, 0x73, 0x74, 0x65, 0x70,	0x3d, 0x34, 0x20, 0x69,
>> +	0x70, 0x5f, 0x72, 0x61, 0x74, 0x69, 0x6f, 0x3d, 0x31, 0x2e, 0x34, 0x30,
>> +	0x20, 0x61, 0x71, 0x3d, 0x31, 0x3a, 0x31, 0x2e, 0x30, 0x30, 0x00, 0x80,
>> +	0x00, 0x00, 0x00, 0x01,	0x67, 0x4d, 0x40, 0x0a, 0x9a, 0x74, 0xf4, 0x20,
>> +	0x00, 0x00, 0x03, 0x00, 0x20, 0x00, 0x00, 0x06,	0x51, 0xe2, 0x44, 0xd4,
>> +	0x00, 0x00, 0x00, 0x01, 0x68, 0xee, 0x32, 0xc8, 0x00, 0x00, 0x00, 0x01,
>> +	0x65, 0x88, 0x80, 0x20, 0x00, 0x08, 0x7f, 0xea, 0x6a, 0xe2, 0x99, 0xb6,
>> +	0x57, 0xae, 0x49, 0x30,	0xf5, 0xfe, 0x5e, 0x46, 0x0b, 0x72, 0x44, 0xc4,
>> +	0xe1, 0xfc, 0x62, 0xda, 0xf1, 0xfb, 0xa2, 0xdb,	0xd6, 0xbe, 0x5c, 0xd7,
>> +	0x24, 0xa3, 0xf5, 0xb9, 0x2f, 0x57, 0x16, 0x49, 0x75, 0x47, 0x77, 0x09,
>> +	0x5c, 0xa1, 0xb4, 0xc3, 0x4f, 0x60, 0x2b, 0xb0, 0x0c, 0xc8, 0xd6, 0x66,
>> +	0xba, 0x9b, 0x82, 0x29,	0x33, 0x92, 0x26, 0x99, 0x31, 0x1c, 0x7f, 0x9b,
>> +	0x00, 0x00, 0x01, 0x0ff,
>> +};
>> +
>> +static const u8 *codec_h264_eos_sequence(u32 *len)
>> +{
>> +	*len = ARRAY_SIZE(eos_sequence);
>> +	return eos_sequence;
>> +}
>> +
>> +struct codec_h264 {
>> +	/* H.264 decoder requires an extended firmware */
>> +	void      *ext_fw_vaddr;
>> +	dma_addr_t ext_fw_paddr;
>> +
>> +	/* Buffer for the H.264 Workspace */
>> +	void      *workspace_vaddr;
>> +	dma_addr_t workspace_paddr;
>> +
>> +	/* Buffer for the H.264 references MV */
>> +	void      *ref_vaddr;
>> +	dma_addr_t ref_paddr;
>> +	u32	   ref_size;
>> +
>> +	/* Buffer for parsed SEI data */
>> +	void      *sei_vaddr;
>> +	dma_addr_t sei_paddr;
>> +
>> +	u32 mb_width;
>> +	u32 mb_height;
>> +	u32 max_refs;
>> +};
>> +
>> +static int codec_h264_can_recycle(struct amvdec_core *core)
>> +{
>> +	return !amvdec_read_dos(core, AV_SCRATCH_7) ||
>> +	       !amvdec_read_dos(core, AV_SCRATCH_8);
>> +}
>> +
>> +static void codec_h264_recycle(struct amvdec_core *core, u32 buf_idx)
>> +{
>> +	/*
>> +	 * Tell the firmware it can recycle this buffer.
>> +	 * AV_SCRATCH_8 serves the same purpose.
>> +	 */
>> +	if (!amvdec_read_dos(core, AV_SCRATCH_7))
>> +		amvdec_write_dos(core, AV_SCRATCH_7, buf_idx + 1);
>> +	else
>> +		amvdec_write_dos(core, AV_SCRATCH_8, buf_idx + 1);
>> +}
>> +
>> +static int codec_h264_start(struct amvdec_session *sess)
>> +{
>> +	u32 workspace_offset;
>> +	struct amvdec_core *core = sess->core;
>> +	struct codec_h264 *h264 = sess->priv;
>> +
>> +	/* Allocate some memory for the H.264 decoder's state */
>> +	h264->workspace_vaddr =
>> +		dma_alloc_coherent(core->dev, SIZE_WORKSPACE,
>> +				   &h264->workspace_paddr, GFP_KERNEL);
>> +	if (!h264->workspace_vaddr)
>> +		return -ENOMEM;
>> +
>> +	/* Allocate some memory for the H.264 SEI dump */
>> +	h264->sei_vaddr = dma_alloc_coherent(core->dev, SIZE_SEI,
>> +					     &h264->sei_paddr, GFP_KERNEL);
>> +	if (!h264->sei_vaddr)
>> +		return -ENOMEM;
>> +
>> +	amvdec_write_dos_bits(core, POWER_CTL_VLD, BIT(9) | BIT(6));
>> +
>> +	workspace_offset = h264->workspace_paddr - WORKSPACE_BUF_OFFSET;
>> +	amvdec_write_dos(core, AV_SCRATCH_1, workspace_offset);
>> +	amvdec_write_dos(core, AV_SCRATCH_G, h264->ext_fw_paddr);
>> +	amvdec_write_dos(core, AV_SCRATCH_I, h264->sei_paddr -
>> +					     workspace_offset);
>> +
>> +	/* Enable "error correction" */
>> +	amvdec_write_dos(core, AV_SCRATCH_F,
>> +			 (amvdec_read_dos(core, AV_SCRATCH_F) & 0xffffffc3) |
>> +			 BIT(4) | BIT(7));
>> +
>> +	amvdec_write_dos(core, MDEC_PIC_DC_THRESH, 0x404038aa);
>> +
>> +	return 0;
>> +}
>> +
>> +static int codec_h264_stop(struct amvdec_session *sess)
>> +{
>> +	struct codec_h264 *h264 = sess->priv;
>> +	struct amvdec_core *core = sess->core;
>> +
>> +	if (h264->ext_fw_vaddr)
>> +		dma_free_coherent(core->dev, SIZE_EXT_FW,
>> +				  h264->ext_fw_vaddr, h264->ext_fw_paddr);
>> +
>> +	if (h264->workspace_vaddr)
>> +		dma_free_coherent(core->dev, SIZE_WORKSPACE,
>> +				 h264->workspace_vaddr, h264->workspace_paddr);
>> +
>> +	if (h264->ref_vaddr)
>> +		dma_free_coherent(core->dev, h264->ref_size,
>> +				  h264->ref_vaddr, h264->ref_paddr);
>> +
>> +	if (h264->sei_vaddr)
>> +		dma_free_coherent(core->dev, SIZE_SEI,
>> +				  h264->sei_vaddr, h264->sei_paddr);
>> +
>> +	return 0;
>> +}
>> +
>> +static int codec_h264_load_extended_firmware(struct amvdec_session *sess,
>> +					     const u8 *data, u32 len)
>> +{
>> +	struct codec_h264 *h264;
>> +	struct amvdec_core *core = sess->core;
>> +
>> +	if (len < SIZE_EXT_FW)
>> +		return -EINVAL;
>> +
>> +	h264 = kzalloc(sizeof(*h264), GFP_KERNEL);
>> +	if (!h264)
>> +		return -ENOMEM;
>> +
>> +	h264->ext_fw_vaddr = dma_alloc_coherent(core->dev, SIZE_EXT_FW,
>> +					      &h264->ext_fw_paddr, GFP_KERNEL);
>> +	if (!h264->ext_fw_vaddr) {
>> +		kfree(h264);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	memcpy(h264->ext_fw_vaddr, data, SIZE_EXT_FW);
>> +	sess->priv = h264;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_fract par_table[] = {
>> +	{ 1, 1 },   { 1, 1 },    { 12, 11 }, { 10, 11 },
>> +	{ 16, 11 }, { 40, 33 },  { 24, 11 }, { 20, 11 },
>> +	{ 32, 11 }, { 80, 33 },  { 18, 11 }, { 15, 11 },
>> +	{ 64, 33 }, { 160, 99 }, { 4, 3 },   { 3, 2 },
>> +	{ 2, 1 }
>> +};
>> +
>> +static void codec_h264_set_par(struct amvdec_session *sess)
>> +{
>> +	struct amvdec_core *core = sess->core;
>> +	u32 seq_info = amvdec_read_dos(core, AV_SCRATCH_2);
>> +	u32 ar_idc = (seq_info >> AR_IDC_BIT) & AR_IDC_MASK;
>> +
>> +	if (!(seq_info & AR_PRESENT_FLAG))
>> +		return;
>> +
>> +	if (ar_idc == AR_EXTEND) {
>> +		u32 ar_info = amvdec_read_dos(core, AV_SCRATCH_3);
>> +
>> +		sess->pixelaspect.numerator = ar_info & 0xffff;
>> +		sess->pixelaspect.denominator = (ar_info >> 16) & 0xffff;
>> +		return;
>> +	}
>> +
>> +	if (ar_idc >= ARRAY_SIZE(par_table))
>> +		return;
>> +
>> +	sess->pixelaspect = par_table[ar_idc];
>> +}
>> +
>> +static void codec_h264_resume(struct amvdec_session *sess)
>> +{
>> +	struct amvdec_core *core = sess->core;
>> +	struct codec_h264 *h264 = sess->priv;
>> +	u32 mb_width, mb_height, mb_total;
>> +
>> +	amvdec_set_canvases(sess, (u32[]){ ANC0_CANVAS_ADDR, 0 },
>> +				  (u32[]){ 24, 0 });
>> +
>> +	dev_dbg(core->dev, "max_refs = %u; actual_dpb_size = %u\n",
>> +		h264->max_refs, sess->num_dst_bufs);
>> +
>> +	/* Align to a multiple of 4 macroblocks */
>> +	mb_width = ALIGN(h264->mb_width, 4);
>> +	mb_height = ALIGN(h264->mb_height, 4);
>> +	mb_total = mb_width * mb_height;
>> +
>> +	h264->ref_size = mb_total * MB_MV_SIZE * h264->max_refs;
>> +	h264->ref_vaddr = dma_alloc_coherent(core->dev, h264->ref_size,
>> +					     &h264->ref_paddr, GFP_KERNEL);
>> +	if (!h264->ref_vaddr) {
>> +		amvdec_abort(sess);
>> +		return;
>> +	}
>> +
>> +	/* Address to store the references' MVs */
>> +	amvdec_write_dos(core, AV_SCRATCH_1, h264->ref_paddr);
>> +	/* End of ref MV */
>> +	amvdec_write_dos(core, AV_SCRATCH_4, h264->ref_paddr + h264->ref_size);
>> +
>> +	amvdec_write_dos(core, AV_SCRATCH_0, (h264->max_refs << 24) |
>> +					     (sess->num_dst_bufs << 16) |
>> +					     ((h264->max_refs - 1) << 8));
>> +}
>> +
>> +/**
>> + * Configure the H.264 decoder when the parser detected a parameter set change
>> + */
>> +static void codec_h264_src_change(struct amvdec_session *sess)
>> +{
>> +	struct amvdec_core *core = sess->core;
>> +	struct codec_h264 *h264 = sess->priv;
>> +	u32 parsed_info, mb_total;
>> +	u32 crop_infor, crop_bottom, crop_right;
>> +	u32 frame_width, frame_height;
>> +
>> +	sess->keyframe_found = 1;
>> +
>> +	parsed_info = amvdec_read_dos(core, AV_SCRATCH_1);
>> +
>> +	/* Total number of 16x16 macroblocks */
>> +	mb_total = (parsed_info >> MB_TOTAL_BIT) & MB_TOTAL_MASK;
>> +	/* Number of macroblocks per line */
>> +	h264->mb_width = parsed_info & MB_WIDTH_MASK;
>> +	/* Number of macroblock lines */
>> +	h264->mb_height = mb_total / h264->mb_width;
>> +
>> +	h264->max_refs = ((parsed_info >> MAX_REF_BIT) & MAX_REF_MASK) + 1;
>> +
>> +	crop_infor = amvdec_read_dos(core, AV_SCRATCH_6);
>> +	crop_bottom = (crop_infor & 0xff);
>> +	crop_right = (crop_infor >> 16) & 0xff;
>> +
>> +	frame_width = h264->mb_width * 16 - crop_right;
>> +	frame_height = h264->mb_height * 16 - crop_bottom;
>> +
>> +	dev_dbg(core->dev, "frame: %ux%u; crop: %u %u\n",
>> +		frame_width, frame_height, crop_right, crop_bottom);
>> +
>> +	codec_h264_set_par(sess);
>> +	amvdec_src_change(sess, frame_width, frame_height, h264->max_refs + 5);
>> +}
>> +
>> +/**
>> + * The bitstream offset is split in half in 2 different registers.
>> + * Fetch its MSB here, which location depends on the frame number.
>> + */
>> +static u32 get_offset_msb(struct amvdec_core *core, int frame_num)
>> +{
>> +	int take_msb = frame_num % 2;
>> +	int reg_offset = (frame_num / 2) * 4;
>> +	u32 offset_msb = amvdec_read_dos(core, AV_SCRATCH_A + reg_offset);
>> +
>> +	if (take_msb)
>> +		return offset_msb & 0xffff0000;
>> +
>> +	return (offset_msb & 0x0000ffff) << 16;
>> +}
>> +
>> +static void codec_h264_frames_ready(struct amvdec_session *sess, u32 status)
>> +{
>> +	struct amvdec_core *core = sess->core;
>> +	int error_count;
>> +	int num_frames;
>> +	int i;
>> +
>> +	error_count = amvdec_read_dos(core, AV_SCRATCH_D);
>> +	num_frames = (status >> 8) & 0xff;
>> +	if (error_count) {
>> +		dev_warn(core->dev,
>> +			 "decoder error(s) happened, count %d\n", error_count);
>> +		amvdec_write_dos(core, AV_SCRATCH_D, 0);
>> +	}
>> +
>> +	for (i = 0; i < num_frames; i++) {
>> +		u32 frame_status = amvdec_read_dos(core, AV_SCRATCH_1 + i * 4);
>> +		u32 buffer_index = frame_status & BUF_IDX_MASK;
>> +		u32 pic_struct = (frame_status >> PIC_STRUCT_BIT) &
>> +				 PIC_STRUCT_MASK;
>> +		u32 offset = (frame_status >> OFFSET_BIT) & OFFSET_MASK;
>> +		u32 field = V4L2_FIELD_NONE;
>> +
>> +		/*
>> +		 * A buffer decode error means it was decoded,
>> +		 * but part of the picture will have artifacts.
>> +		 * Typical reason is a temporarily corrupted bitstream
>> +		 */
>> +		if (frame_status & ERROR_FLAG)
>> +			dev_dbg(core->dev, "Buffer %d decode error\n",
>> +				buffer_index);
>> +
>> +		if (pic_struct == PIC_TOP_BOT)
>> +			field = V4L2_FIELD_INTERLACED_TB;
>> +		else if (pic_struct == PIC_BOT_TOP)
>> +			field = V4L2_FIELD_INTERLACED_BT;
>> +
>> +		offset |= get_offset_msb(core, i);
>> +		amvdec_dst_buf_done_idx(sess, buffer_index, offset, field);
>> +	}
>> +}
>> +
>> +static irqreturn_t codec_h264_threaded_isr(struct amvdec_session *sess)
>> +{
>> +	struct amvdec_core *core = sess->core;
>> +	u32 status;
>> +	u32 size;
>> +	u8 cmd;
>> +
>> +	status = amvdec_read_dos(core, AV_SCRATCH_0);
>> +	cmd = status & CMD_MASK;
>> +
>> +	switch (cmd) {
>> +	case CMD_SRC_CHANGE:
>> +		codec_h264_src_change(sess);
>> +		break;
>> +	case CMD_FRAMES_READY:
>> +		codec_h264_frames_ready(sess, status);
>> +		break;
>> +	case CMD_FATAL_ERROR:
>> +		dev_err(core->dev, "H.264 decoder fatal error\n");
>> +		goto abort;
>> +	case CMD_BAD_WIDTH:
>> +		size = (amvdec_read_dos(core, AV_SCRATCH_1) + 1) * 16;
>> +		dev_err(core->dev, "Unsupported video width: %u\n", size);
>> +		goto abort;
>> +	case CMD_BAD_HEIGHT:
>> +		size = (amvdec_read_dos(core, AV_SCRATCH_1) + 1) * 16;
>> +		dev_err(core->dev, "Unsupported video height: %u\n", size);
>> +		goto abort;
>> +	case 0: /* Unused but not worth printing for */
>> +	case 9:
>> +		break;
>> +	default:
>> +		dev_info(core->dev, "Unexpected H264 ISR: %08X\n", cmd);
>> +		break;
>> +	}
>> +
>> +	if (cmd && cmd != CMD_SRC_CHANGE)
>> +		amvdec_write_dos(core, AV_SCRATCH_0, 0);
>> +
>> +	/* Decoder has some SEI data for us ; ignore */
>> +	if (amvdec_read_dos(core, AV_SCRATCH_J) & SEI_DATA_READY)
>> +		amvdec_write_dos(core, AV_SCRATCH_J, 0);
>> +
>> +	return IRQ_HANDLED;
>> +abort:
>> +	amvdec_abort(sess);
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t codec_h264_isr(struct amvdec_session *sess)
>> +{
>> +	struct amvdec_core *core = sess->core;
>> +
>> +	amvdec_write_dos(core, ASSIST_MBOX1_CLR_REG, 1);
>> +
>> +	return IRQ_WAKE_THREAD;
>> +}
>> +
>> +struct amvdec_codec_ops codec_h264_ops = {
>> +	.start = codec_h264_start,
>> +	.stop = codec_h264_stop,
>> +	.load_extended_firmware = codec_h264_load_extended_firmware,
>> +	.isr = codec_h264_isr,
>> +	.threaded_isr = codec_h264_threaded_isr,
>> +	.can_recycle = codec_h264_can_recycle,
>> +	.recycle = codec_h264_recycle,
>> +	.eos_sequence = codec_h264_eos_sequence,
>> +	.resume = codec_h264_resume,
>> +};
>> diff --git a/drivers/staging/media/meson/vdec/codec_h264.h b/drivers/staging/media/meson/vdec/codec_h264.h
>> new file mode 100644
>> index 000000000000..7cb4fb86ff36
>> --- /dev/null
>> +++ b/drivers/staging/media/meson/vdec/codec_h264.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2019 BayLibre, SAS
>> + * Author: Maxime Jourdan <mjourdan@baylibre.com>
>> + */
>> +
>> +#ifndef __MESON_VDEC_CODEC_H264_H_
>> +#define __MESON_VDEC_CODEC_H264_H_
>> +
>> +#include "vdec.h"
>> +
>> +extern struct amvdec_codec_ops codec_h264_ops;
>> +
>> +#endif
>> diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
>> index 066d4a055894..e9356a46828f 100644
>> --- a/drivers/staging/media/meson/vdec/vdec_platform.c
>> +++ b/drivers/staging/media/meson/vdec/vdec_platform.c
>> @@ -9,9 +9,22 @@
>>  
>>  #include "vdec_1.h"
>>  #include "codec_mpeg12.h"
>> +#include "codec_h264.h"
>>  
>>  static const struct amvdec_format vdec_formats_gxbb[] = {
>>  	{
>> +		.pixfmt = V4L2_PIX_FMT_H264,
>> +		.min_buffers = 2,
>> +		.max_buffers = 24,
>> +		.max_width = 1920,
>> +		.max_height = 1080,
>> +		.vdec_ops = &vdec_1_ops,
>> +		.codec_ops = &codec_h264_ops,
>> +		.firmware_path = "meson/vdec/gxbb_h264.bin",
>> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
>> +		.flags = V4L2_FMT_FLAG_COMPRESSED |
>> +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
>> +	}, {
>>  		.pixfmt = V4L2_PIX_FMT_MPEG1,
>>  		.min_buffers = 8,
>>  		.max_buffers = 8,
>> @@ -38,6 +51,18 @@ static const struct amvdec_format vdec_formats_gxbb[] = {
>>  
>>  static const struct amvdec_format vdec_formats_gxl[] = {
>>  	{
>> +		.pixfmt = V4L2_PIX_FMT_H264,
>> +		.min_buffers = 2,
>> +		.max_buffers = 24,
>> +		.max_width = 3840,
>> +		.max_height = 2160,
>> +		.vdec_ops = &vdec_1_ops,
>> +		.codec_ops = &codec_h264_ops,
>> +		.firmware_path = "meson/vdec/gxl_h264.bin",
>> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
>> +		.flags = V4L2_FMT_FLAG_COMPRESSED |
>> +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
>> +	}, {
>>  		.pixfmt = V4L2_PIX_FMT_MPEG1,
>>  		.min_buffers = 8,
>>  		.max_buffers = 8,
>> @@ -64,6 +89,18 @@ static const struct amvdec_format vdec_formats_gxl[] = {
>>  
>>  static const struct amvdec_format vdec_formats_gxm[] = {
>>  	{
>> +		.pixfmt = V4L2_PIX_FMT_H264,
>> +		.min_buffers = 2,
>> +		.max_buffers = 24,
>> +		.max_width = 3840,
>> +		.max_height = 2160,
>> +		.vdec_ops = &vdec_1_ops,
>> +		.codec_ops = &codec_h264_ops,
>> +		.firmware_path = "meson/vdec/gxm_h264.bin",
>> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
>> +		.flags = V4L2_FMT_FLAG_COMPRESSED |
>> +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
>> +	}, {
>>  		.pixfmt = V4L2_PIX_FMT_MPEG1,
>>  		.min_buffers = 8,
>>  		.max_buffers = 8,
>> @@ -90,6 +127,18 @@ static const struct amvdec_format vdec_formats_gxm[] = {
>>  
>>  static const struct amvdec_format vdec_formats_g12a[] = {
>>  	{
>> +		.pixfmt = V4L2_PIX_FMT_H264,
>> +		.min_buffers = 2,
>> +		.max_buffers = 24,
>> +		.max_width = 3840,
>> +		.max_height = 2160,
>> +		.vdec_ops = &vdec_1_ops,
>> +		.codec_ops = &codec_h264_ops,
>> +		.firmware_path = "meson/vdec/g12a_h264.bin",
>> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
>> +		.flags = V4L2_FMT_FLAG_COMPRESSED |
>> +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
>> +	}, {
>>  		.pixfmt = V4L2_PIX_FMT_MPEG1,
>>  		.min_buffers = 8,
>>  		.max_buffers = 8,
>> @@ -116,6 +165,18 @@ static const struct amvdec_format vdec_formats_g12a[] = {
>>  
>>  static const struct amvdec_format vdec_formats_sm1[] = {
>>  	{
>> +		.pixfmt = V4L2_PIX_FMT_H264,
>> +		.min_buffers = 2,
>> +		.max_buffers = 24,
>> +		.max_width = 3840,
>> +		.max_height = 2160,
>> +		.vdec_ops = &vdec_1_ops,
>> +		.codec_ops = &codec_h264_ops,
>> +		.firmware_path = "meson/vdec/g12a_h264.bin",
>> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
>> +		.flags = V4L2_FMT_FLAG_COMPRESSED |
>> +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
>> +	}, {
>>  		.pixfmt = V4L2_PIX_FMT_MPEG1,
>>  		.min_buffers = 8,
>>  		.max_buffers = 8,
>>
> 

