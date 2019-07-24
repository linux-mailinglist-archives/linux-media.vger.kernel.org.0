Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70DAD72FEE
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 15:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbfGXNaR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 09:30:17 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:54015 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725882AbfGXNaR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 09:30:17 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qHLMhILSO0QvJqHLPh9WuE; Wed, 24 Jul 2019 15:30:15 +0200
Subject: Re: [PATCH 01/14] v4l2-ioctl.c: OR flags in v4l_fill_fmtdesc(), not
 don't overwrite
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
References: <20190724110523.29248-1-hverkuil-cisco@xs4all.nl>
 <20190724110523.29248-2-hverkuil-cisco@xs4all.nl>
 <1563974568.2914.11.camel@pengutronix.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <8559fd11-e6b7-092d-08b3-dc92f92ee089@xs4all.nl>
Date:   Wed, 24 Jul 2019 15:30:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1563974568.2914.11.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGJHlMCRrBW+WpoIJpsaDbapD9DVkLHRU+VJ4+IsnclSqXC4Q4BMy7OBm9583lrmMhEYrMFBtJDJE3Urce8In+8nR2bwUK08fFgUWX/VLtygmXK3fuO1
 rzSdMTg9VXugj/AB9E8T/nTKISZ9dbqwWx9kDWmS0YBk11Z9uHqulX6EGm3zvxhd1r1Rk1NDDpCWzRopvlPpNG4KGpHEByiemD0lxf1aBjIk0EWeS422hfib
 2X3ncnBPCVY8volQqudRarLO8kLGSEb9t3HET9yxnby53vPQJWPeSwd9FSYsNQKzcJxX5Pcal2nXHd2toffO69PjlWoyZE5s3nIKS/qFiSX62o32hmlcAPM0
 wc/wxZEGT672UZ/qy/xGO9A13PfHXnafPrJykETQwynXa4GlbDTNLzqrAbMcUS4ZM/KyJSsHearIEARjet6HCwFSDTsGWQeYkOIZ2tyU845OgG9ktgazOSk9
 5sgdQBf/5ndSNCemubtQ6Cuf4dCEMKGjm0xdIvJ8FgAy7JIBXF4w5EpJa66A1IXk49GwLzTpKqmdjQbwZy4xAXdloK0+Ki/XYxqQjN8Ze6LrXRIrN24r8bQm
 /aE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/24/19 3:22 PM, Philipp Zabel wrote:
> On Wed, 2019-07-24 at 13:05 +0200, Hans Verkuil wrote:
>> If a driver sets a FMT flag in the enum_fmt op, then that will be
>> ignored since v4l_fill_fmtdesc() overwrites it again.
>>
>> v4l_fill_fmtdesc() should OR its flag, not overwrite it.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 80efc581e3f9..911a20f915c5 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1390,7 +1390,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>  
>>  	if (descr)
>>  		WARN_ON(strscpy(fmt->description, descr, sz) < 0);
>> -	fmt->flags = flags;
>> +	fmt->flags |= flags;
>>  }
>>  
>>  static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
> 
> If the enum_fmt op does not write fmt->flags, will it not contain the
> value provided by userspace at this point? I think p->flags must be
> cleared in v4l2_enum_fmt() with this change, before the enum_fmt op is
> called.

All fields after 'type' in struct v4l2_fmtdesc are cleared by the core:
search for INFO_FL_CLEAR(v4l2_fmtdesc, type) in v4l2-ioctl.c.

So 'flags' is already zeroed when this function is called.

Regards,

	Hans
