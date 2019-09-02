Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4FEA553D
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 13:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731059AbfIBLqx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 07:46:53 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:35291 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730538AbfIBLqw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Sep 2019 07:46:52 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 4knDidaguzaKO4knGiXWBB; Mon, 02 Sep 2019 13:46:50 +0200
Subject: Re: [RFC 10/12] media: hantro: Add support for H264 decoding on
 RK3399
To:     Jonas Karlman <jonas@kwiboo.se>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20190901124531.23645-1-jonas@kwiboo.se>
 <HE1PR06MB40119DE07D38060F531D1070ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <99943cdf-7e3b-f819-5d81-2e007e788682@xs4all.nl>
Date:   Mon, 2 Sep 2019 13:46:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <HE1PR06MB40119DE07D38060F531D1070ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLcXWzujJMuvci893htW5/WH0F/hjHWkpTFnm1lpE6jVMZ59ZbS6Eni3lm0qlKUCmfvUXf6qHGyk2IEHuqBmSZoYZZymoYBlsbWur39VwOSFGABlHlOh
 5vXpnNgjLuR1vHu25PXGdwLfaXhPgBLaxfVDPgqeTzIgkn5/REE30xKONjS1s25hl6DWtbikdXZPWPMNLQLMOohdOrgoRHO7izlXFfnDg/LBUNlGWANVrgbL
 qVHKJH+xn2AQHo2tRJ01VTj5obrHdS7y8ugriStMbqYSV0QlZcRg+41avsTPyOnzuDpKe2cFq4a17WFJWf2IsLRHdEjkXgaajZsY/U1YlR19KstUIsL3fO1T
 7mcBwlE52DuB2xnJV8lervEKe0pAn+2mwI+Lvr3QF2EN8j9fkIizk2w0TW3L7LfpuNpd9e9czcc+D4cnKVau1QZhVAcm/9xVArmOyBsoN9bEx9EHDZ6+oa6T
 WZMUtkD2PGdJdRCd
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/1/19 2:45 PM, Jonas Karlman wrote:
> Rockchip RK3399 SoC has the same Hantro G1 IP block
> as RK3288, but the registers are entirely different.
> 
> In a similar fashion as MPEG-2 and VP8 decoding,
> it's simpler to just add a separate implementation.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/staging/media/hantro/Makefile         |   1 +
>  .../staging/media/hantro/hantro_g1_h264_dec.c |   1 -
>  drivers/staging/media/hantro/hantro_hw.h      |   1 +
>  .../media/hantro/rk3399_vpu_hw_h264_dec.c     | 486 ++++++++++++++++++
>  4 files changed, 488 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/staging/media/hantro/rk3399_vpu_hw_h264_dec.c
> 
> diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
> index 5d6b0383d280..8d33b0e8aa6c 100644
> --- a/drivers/staging/media/hantro/Makefile
> +++ b/drivers/staging/media/hantro/Makefile
> @@ -8,6 +8,7 @@ hantro-vpu-y += \
>  		hantro_g1_mpeg2_dec.o \
>  		hantro_g1_vp8_dec.o \
>  		rk3399_vpu_hw_jpeg_enc.o \
> +		rk3399_vpu_hw_h264_dec.o \
>  		rk3399_vpu_hw_mpeg2_dec.o \
>  		rk3399_vpu_hw_vp8_dec.o \
>  		hantro_jpeg.o \
> diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> index 4b82b9fd5252..ec2736fb473d 100644
> --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> @@ -202,7 +202,6 @@
>  #define G1_REG_REFBU_E(v)		((v) ? BIT(31) : 0)
>  
>  #define G1_REG_APF_THRESHOLD(v)		(((v) << 0) & GENMASK(13, 0))
> ->>>>>>> b22734fb5e2c... Ymedia: hantro: Refactor G1 H264 code

^^^^^^^^^^^^^^^

Seems to be a left-over from patch 9?

Regards,

	Hans

>  
>  void hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
>  {
