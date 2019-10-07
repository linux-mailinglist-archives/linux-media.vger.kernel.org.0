Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80542CEBFF
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 20:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbfJGSeA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 7 Oct 2019 14:34:00 -0400
Received: from mail-oln040092072071.outbound.protection.outlook.com ([40.92.72.71]:17542
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728081AbfJGSd7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Oct 2019 14:33:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzC+CtRz8zApziSU6RaGpNLSv5IMrDPgfE4oXxHtt5AxwE9ZbUyNMWM2aQkm4dfMlkTi3E9Z3he6Y6zYJeCcZnaHp0SMhLmUZxsPbFymR26e3daNXIcFn1q3NlT+MJwMXJUVkvDuUERz0v8KHUktoYhzFpXGs/F/Qe1pykOxmDVmbAvWo5a62vtmLZqcSinmIWYS6TOq0++CNlEoLP04cYJuCwsYFZOIISzx2Po86BkCzN7bwr8Fcjxrn8zWOfT9SFurm1eqrTdLeRynPGHqfhZ1yZt7RCWMfNYoopr2v41Ysc7TavfZ7Eg9aImcWh1xX9Hs8KyInzDqrEyTwAPUWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gv/rWJhNzSxfYffBOdNDgTZKoNhZl/1l0r+f1m1j2SQ=;
 b=ds0o4tZr0qtPaB/bqDF+k9Nj7guMaP4BJGb8jHsh+/TBLzT/IBjQxXvG1c2WKo5imGC+u2la5J82s6aUzarTjMKnuoNVJ2G2GV4ddCMqdGM3HkSvGKbRScLxHrv/nW60qb2HClXwU/wUZRvj6gP21YyMku+m7IuLN/uKrmKuBvx0HGA0Ziq09+rh2FhRHvI5xJIsS2lHTRpeNwpRGUsE/++rSjeca9U9Lri1C1aHdajRssqn6A6fhSCR6ugYcI5HZURkbELsgJ4IYo/cMoKwF7qQ4bXz6InfmdfIFZkqavXouZq5kVrVGyBcSUrS8JfOmTSFTEp0dPJewhGPFImL7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (10.152.16.58) by AM5EUR03HT008.eop-EUR03.prod.protection.outlook.com
 (10.152.16.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.15; Mon, 7 Oct
 2019 18:33:53 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.16.55) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 7 Oct 2019 18:33:53 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8%4]) with mapi id 15.20.2305.023; Mon, 7 Oct 2019
 18:33:52 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     "kernel@collabora.com" <kernel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        "fbuergisser@chromium.org" <fbuergisser@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 for 5.4 3/4] media: hantro: Fix motion vectors usage
 condition
Thread-Topic: [PATCH v2 for 5.4 3/4] media: hantro: Fix motion vectors usage
 condition
Thread-Index: AQHVfTc5j58jepLQQEujLcDcYkaduadPgRaA
Date:   Mon, 7 Oct 2019 18:33:52 +0000
Message-ID: <HE1PR06MB4011204B3FC2DAABB4BD1BACAC9B0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <20191007174505.10681-1-ezequiel@collabora.com>
 <20191007174505.10681-4-ezequiel@collabora.com>
In-Reply-To: <20191007174505.10681-4-ezequiel@collabora.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0221.eurprd05.prod.outlook.com
 (2603:10a6:3:fa::21) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:49284390698F95E349DEB478EB2430A8870D4DB416F62A400A8F266140FFC451;UpperCasedChecksum:4F92DD6035FE886F19CD68B67CA8F12580B75676CED0F81661C49F4223916D9C;SizeAsReceived:8137;Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [3e3yQm2qrRRttsWuOTk9jkZyALgVhhVF]
x-microsoft-original-message-id: <f89199a9-0b23-343c-7456-d003ecedce2d@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: AM5EUR03HT008:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wyoIY13z+kw+xTtJwBbf+Am7TOKkl1qpmUuxROSTL+cqkjmiMbR2ftH4GR3wAMuYXlpOvzRPRx3A35cH9VFGayKYOjpBaBmVzf+ffN1ONC6J0NR1mVpOXp3UszProbQbtn6Lrgr1kdlyTEQQ7NNgpn6aBXq1XQLb26vtqkgd7ySHMATYmd+2RKC7IYJ60zMc
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <940378B8E35A0A4AAADCC3F80571F034@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d69403e-8247-4b01-23bb-08d74b54e68b
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 18:33:52.7590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR03HT008
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2019-10-07 19:45, Ezequiel Garcia wrote:
> From: Francois Buergisser <fbuergisser@chromium.org>
>
> The setting of the motion vectors usage and the setting of motion
> vectors address are currently done under different conditions.
>
> When decoding pre-recorded videos, this results of leaving the motion
> vectors address unset, resulting in faulty memory accesses. Fix it
> by using the same condition everywhere, which matches the profiles
> that support motion vectors.

This does not fully match hantro sdk:

  enable direct MV writing and POC tables for high/main streams.
  enable it also for any "baseline" stream which have main/high tools enabled.

  (sps->profile_idc > 66 && sps->constrained_set0_flag == 0) ||
  sps->frame_mbs_only_flag != 1 ||
  sps->chroma_format_idc != 1 ||
  sps->scaling_matrix_present_flag != 0 ||
  pps->entropy_coding_mode_flag != 0 ||
  pps->weighted_pred_flag != 0 ||
  pps->weighted_bi_pred_idc != 0 ||
  pps->transform8x8_flag != 0 ||
  pps->scaling_matrix_present_flag != 0

Above check is used when DIR_MV_BASE should be written.
And WRITE_MVS_E is set to nal_ref_idc != 0 when above is true.

I think it may be safer to always set DIR_MV_BASE and keep the existing nal_ref_idc check for WRITE_MVS_E.
(That is what I did in my "media: hantro: H264 fixes and improvements" series, v2 is incoming)
Or have you found any video that is having issues in such case?

Regards,
Jonas

>
> Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
> Signed-off-by: Francois Buergisser <fbuergisser@chromium.org>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> v2:
> * New patch.
>
>  drivers/staging/media/hantro/hantro_g1_h264_dec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> index 7ab534936843..c92460407613 100644
> --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> @@ -35,7 +35,7 @@ static void set_params(struct hantro_ctx *ctx)
>  	if (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)
>  		reg |= G1_REG_DEC_CTRL0_SEQ_MBAFF_E;
>  	reg |= G1_REG_DEC_CTRL0_PICORD_COUNT_E;
> -	if (dec_param->nal_ref_idc)
> +	if (sps->profile_idc > 66)
>  		reg |= G1_REG_DEC_CTRL0_WRITE_MVS_E;
>  
>  	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) &&

