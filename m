Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E52AEA6321
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 09:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbfICHyu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 3 Sep 2019 03:54:50 -0400
Received: from mail-oln040092066037.outbound.protection.outlook.com ([40.92.66.37]:22853
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726840AbfICHyt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Sep 2019 03:54:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+JrzNBJKJWVQcreGUBWYsRIyVVgLxphGPbgdEIQ8A2X9L6aE7wq5/ynIWJIi5c0zZIKauoIcEHYhtzlSX3QUhfiCnhpGJFK4fznD7LFLA0WYgIO9DEwUL0HmgbwIZ2hmTeqoOMLYrGXk4gYe3USu7WKHHrJFpslKpr470hT2qj26GgwDdCrLAvDjRsLdKgxAMnJml5Z2JV5ktT4xLrrZA36qpp3AiMHl585iFI0oPrG492brHpt0GRBblMTxlxTmFa6KqR2mbI3dUQra6ASvtIiRJRDyqIJ1UDxMLeHtV/YNT+AW9I+83YqvOS0KhhnOcHUJlEkCHLaW3EOG6Jdvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuOSWVAZu1UU0UqJFhnZvN9/ABpumqO80ZehfKB+Poc=;
 b=PXimOnsBqeeH5pTM52asB6KuK1JnLpgiJlReoV3T41/o7h85/cdAwSzrcVzplZu/CzUVHr+vyd4R8GeutEcAQEJ6QBvhIipuEC1SfjZBUB1R90/TiwSYigh0PcVEFKqvtX2HpHsNI3JUE/Q44V7uyBAJ10MAO2zNKAwUl4NyWzUWWYul+Viwhj5tTxGQwPGibXCXhWzeJhwPhs6dVXgkJ/Woc0S38cj878DrLbUITCucP6PwPcg5AhDn45BL2TGrbOPZe+Iqrzf0UhyrYTIT6RnsS4V7n5hDJkvHeAUEcwIYHAsLoosoFiDRxvYLx+09J3UDgUAxJu4ebgMjf7MzdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT018.eop-EUR01.prod.protection.outlook.com
 (10.152.0.54) by HE1EUR01HT052.eop-EUR01.prod.protection.outlook.com
 (10.152.0.253) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Tue, 3 Sep
 2019 07:54:41 +0000
Received: from DB6PR06MB4007.eurprd06.prod.outlook.com (10.152.0.58) by
 HE1EUR01FT018.mail.protection.outlook.com (10.152.0.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Tue, 3 Sep 2019 07:54:41 +0000
Received: from DB6PR06MB4007.eurprd06.prod.outlook.com
 ([fe80::ed3f:186c:c80e:a861]) by DB6PR06MB4007.eurprd06.prod.outlook.com
 ([fe80::ed3f:186c:c80e:a861%6]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 07:54:41 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH 02/12] media: hantro: Do not reorder H264 scaling list
Thread-Topic: [PATCH 02/12] media: hantro: Do not reorder H264 scaling list
Thread-Index: AQHVYMMq6YIWopjAr0aH2udYAseNuKcYbBiAgAAmcoCAAQWaAA==
Date:   Tue, 3 Sep 2019 07:54:41 +0000
Message-ID: <DB6PR06MB4007C140420365E83064C5BEACB90@DB6PR06MB4007.eurprd06.prod.outlook.com>
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20190901124531.23645-1-jonas@kwiboo.se>
 <HE1PR06MB40116C92C3D52C5957EF48E9ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <1567432843.3666.6.camel@pengutronix.de>
 <HE1PR06MB4011A8F99D58E5ACFAE3CECAACBE0@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB4011A8F99D58E5ACFAE3CECAACBE0@HE1PR06MB4011.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0501CA0019.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::29) To DB6PR06MB4007.eurprd06.prod.outlook.com
 (2603:10a6:6:4e::32)
x-incomingtopheadermarker: OriginalChecksum:22665D6C63946FAB0C1BAE9F9F1E1758E353A799EE1B6B33C9305A69C728CC71;UpperCasedChecksum:19BDF4D3801EF3B32D60D1C37C1F1E8DD5C350F76061FDB222B1136F2963D65A;SizeAsReceived:8095;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [QVut8zgzLocyaE/3IPiHWZtztoXL8nKv]
x-microsoft-original-message-id: <6c6529b4-84ad-4eb3-80be-6987883384a8@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);SRVR:HE1EUR01HT052;
x-ms-traffictypediagnostic: HE1EUR01HT052:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-message-info: XXQY4RzIbPiBLx2PMRnyKfx6NAakeRQWWkofVWRiEbGIfAxRQyRJ10we8x1ULRUkMtIivZk7WEKvctQFduzxaJaKN9uQNDO//UcJ1D6767EyYJM0u7v/EGHNIMJjUDFZ0nROuZBKD7JZwSU8QVnbK4T7EVelLq6OACmTMrmBiVL8CD17tnCWAzT3hJFpmfXp
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <C0226E9BC9AE3841937AE2A44272B4B6@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea64c1d-7414-4428-910d-08d73043fa15
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 07:54:41.7181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT052
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2019-09-02 18:18, Jonas Karlman wrote:
> On 2019-09-02 16:00, Philipp Zabel wrote:
>> Hi Jonas,
>>
>> On Sun, 2019-09-01 at 12:45 +0000, Jonas Karlman wrote:
>>> Scaling list supplied from userspace using ffmpeg and libva-v4l2-request
>>> is already in matrix order and can be used without applying the inverse
>>> scanning process.
>> "in matrix order" is equivalent to "in raster scan order"?
> The values supplied by ffmpeg and libva-v4l2-request is in the order after the
> inverse scanning process has been applied (scaling list has been transformed
> into a scaling matrix). Not sure what this is called, "matrix order" seemed
> close enough.
>
> Since there is two scan orders, zig-zag and field, and cedrus already expecting
> the values in "matrix" order, it seems more logical to let userspace handle the
> inverse scanning process.

After a closer look both ffmpeg and rkmpp only apply zig-zag scan and not field scan,
ffmpeg will memcpy the scaling_matrix4/8 as is for vaapi, vdpau and nvdec,
for dxva2 there is a workaround flag that controls if zig-zag should be applied or not.

I suggest a clarification of the expect order of values and use of the same value order as vaapi, vdpau and nvdec.
i.e. have the scaling list values in "matrix order"/"raster order", after zig-zag scan has been applied,
as is currently expected by cedrus and hantro after this patch.

I would also suggest a change to the expected order of the 8x8 scaling lists to follow the H264 standard,
instead of the ffmpeg order like this patch and cedrus driver currently expects.

Expected scaling list order would then be,
for 4x4: Intra Y, Intra Cb, Intra Cr, Inter Y, Inter Cb, Inter Cr,
for 8x8: Intra Y, Inter Y, Intra Cb, Inter Cb, Intra Cr, Inter Cr.

Regards,
Jonas

>
>> Could you add this requirement to the
>> V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX documentation?
> Sure, I will update documentation in v2.
>
>>> The HW also only support 8x8 scaling list for the Y component, indices 0
>>> and 3 in the scaling list supplied from userspace.
>>>
>>> Remove reordering and write the scaling matrix in an order expected by
>>> the VPU, also only allocate memory for the two 8x8 lists used.
>>>
>>> Fixes: a9471e25629b ("media: hantro: Add core bits to support H264 decoding")
>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>>> ---
>>>  drivers/staging/media/hantro/hantro_h264.c | 64 +++++++---------------
>>>  1 file changed, 20 insertions(+), 44 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
>>> index 0d758e0c0f99..e2d01145ac4f 100644
>>> --- a/drivers/staging/media/hantro/hantro_h264.c
>>> +++ b/drivers/staging/media/hantro/hantro_h264.c
>>> @@ -20,7 +20,7 @@
>>>  /* Size with u32 units. */
>>>  #define CABAC_INIT_BUFFER_SIZE		(460 * 2)
>>>  #define POC_BUFFER_SIZE			34
>>> -#define SCALING_LIST_SIZE		(6 * 16 + 6 * 64)
>>> +#define SCALING_LIST_SIZE		(6 * 16 + 2 * 64)
>> This changes the size of struct hantro_h264_dec_priv_tbl. Did this
>> describe the auxiliary buffer format incorrectly before?
> Based on RKMPP and Hantro SDK the HW expects the 8x8 inter/intra list for
> Y-component to be located at indices 0 and 1, lists for Cr/Cb is only used for
> 4:4:4 and HW only supports 4:0:0/4:2:0 if I am not mistaken. So the unused
> extra 4 lists at the end of the auxiliary buffer seemed like a waste,
> also RKMPP and Hantro SDK only seemed to allocate space for 2 lists.
>
>>>  #define POC_CMP(p0, p1) ((p0) < (p1) ? -1 : 1)
>>>  
>>> @@ -194,57 +194,33 @@ static const u32 h264_cabac_table[] = {
>>>  	0x1f0c2517, 0x1f261440
>>>  };
>>>  
>>> -/*
>>> - * NOTE: The scaling lists are in zig-zag order, apply inverse scanning process
>>> - * to get the values in matrix order. In addition, the hardware requires bytes
>>> - * swapped within each subsequent 4 bytes. Both arrays below include both
>>> - * transformations.
>>> - */
>>> -static const u32 zig_zag_4x4[] = {
>>> -	3, 2, 7, 11, 6, 1, 0, 5, 10, 15, 14, 9, 4, 8, 13, 12
>>> -};
>>> -
>>> -static const u32 zig_zag_8x8[] = {
>>> -	3, 2, 11, 19, 10, 1, 0, 9, 18, 27, 35, 26, 17, 8, 7, 6,
>>> -	15, 16, 25, 34, 43, 51, 42, 33, 24, 23, 14, 5, 4, 13, 22, 31,
>>> -	32, 41, 50, 59, 58, 49, 40, 39, 30, 21, 12, 20, 29, 38, 47, 48,
>>> -	57, 56, 55, 46, 37, 28, 36, 45, 54, 63, 62, 53, 44, 52, 61, 60
>>> -};
>>> -
>>>  static void
>>>  reorder_scaling_list(struct hantro_ctx *ctx)
>>>  {
>>>  	const struct hantro_h264_dec_ctrls *ctrls = &ctx->h264_dec.ctrls;
>>>  	const struct v4l2_ctrl_h264_scaling_matrix *scaling = ctrls->scaling;
>>> -	const size_t num_list_4x4 = ARRAY_SIZE(scaling->scaling_list_4x4);
>>> -	const size_t list_len_4x4 = ARRAY_SIZE(scaling->scaling_list_4x4[0]);
>>> -	const size_t num_list_8x8 = ARRAY_SIZE(scaling->scaling_list_8x8);
>>> -	const size_t list_len_8x8 = ARRAY_SIZE(scaling->scaling_list_8x8[0]);
>>>  	struct hantro_h264_dec_priv_tbl *tbl = ctx->h264_dec.priv.cpu;
>>> -	u8 *dst = tbl->scaling_list;
>>> -	const u8 *src;
>>> -	int i, j;
>>> -
>>> -	BUILD_BUG_ON(ARRAY_SIZE(zig_zag_4x4) != list_len_4x4);
>>> -	BUILD_BUG_ON(ARRAY_SIZE(zig_zag_8x8) != list_len_8x8);
>>> -	BUILD_BUG_ON(ARRAY_SIZE(tbl->scaling_list) !=
>>> -		     num_list_4x4 * list_len_4x4 +
>>> -		     num_list_8x8 * list_len_8x8);
>>> -
>>> -	src = &scaling->scaling_list_4x4[0][0];
>>> -	for (i = 0; i < num_list_4x4; ++i) {
>>> -		for (j = 0; j < list_len_4x4; ++j)
>>> -			dst[zig_zag_4x4[j]] = src[j];
>>> -		src += list_len_4x4;
>>> -		dst += list_len_4x4;
>>> +	u32 *dst = (u32 *)tbl->scaling_list;
>>> +	u32 i, j, tmp;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(scaling->scaling_list_4x4); i++) {
>>> +		for (j = 0; j < ARRAY_SIZE(scaling->scaling_list_4x4[0]) / 4; j++) {
>>> +			tmp = (scaling->scaling_list_4x4[i][4 * j + 0] << 24) |
>>> +			      (scaling->scaling_list_4x4[i][4 * j + 1] << 16) |
>>> +			      (scaling->scaling_list_4x4[i][4 * j + 2] << 8) |
>>> +			      (scaling->scaling_list_4x4[i][4 * j + 3]);
>>> +			*dst++ = tmp;
>>> +		}
>> This looks like it could use swab32().
> Thanks for the tip, will look into and change in v2.
>
>>>  	}
>>>  
>>> -	src = &scaling->scaling_list_8x8[0][0];
>>> -	for (i = 0; i < num_list_8x8; ++i) {
>>> -		for (j = 0; j < list_len_8x8; ++j)
>>> -			dst[zig_zag_8x8[j]] = src[j];
>>> -		src += list_len_8x8;
>>> -		dst += list_len_8x8;
>>> +	for (i = 0; i < ARRAY_SIZE(scaling->scaling_list_8x8); i += 3) {
>>> +		for (j = 0; j < ARRAY_SIZE(scaling->scaling_list_8x8[0]) / 4; j++) {
>>> +			tmp = (scaling->scaling_list_8x8[i][4 * j + 0] << 24) |
>>> +			      (scaling->scaling_list_8x8[i][4 * j + 1] << 16) |
>>> +			      (scaling->scaling_list_8x8[i][4 * j + 2] << 8) |
>>> +			      (scaling->scaling_list_8x8[i][4 * j + 3]);
>>> +			*dst++ = tmp;
>>> +		}
>> After this change, the second 8x8 scaling list has moved to a different
>> offset. Is this where the hardware has always been looking for it, or is
>> there a change missing in another place?
> As mentioned above HW only looks at indices 0 and 1, and ffmpeg will store the
> inter/intra Y list at indices 0 and 3 as seen at [1], in similar way cedrus only
> use indices 0 and 3 at [2].
> FFmpeg memcpy entire scaling_matrix8 to scaling_list_8x8 for v4l2-request-api
> and memcpy scaling_matrix8[0] and scaling_matrix8[3] for vaapi.
>
> You can see the effect of this patch using the h264_tivo_sample.ts sample from
> cover letter, patch 3-8 must be applied. With this patch applied the green
> football field will stay green, without the patch the field will shift in colors.
>
> [1] https://github.com/FFmpeg/FFmpeg/blob/master/libavcodec/h264_ps.c#L299-L308
> [2] https://git.linuxtv.org/media_tree.git/tree/drivers/staging/media/sunxi/cedrus/cedrus_h264.c#n231
>
> Regards,
> Jonas
>
>> regards
>> Philipp

