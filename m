Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48BC218C28
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 17:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730268AbgGHPpw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 11:45:52 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36439 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730157AbgGHPpv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 11:45:51 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200708154549euoutp02db86dca6313362a860aa56bb4d525d0b~f0YIYgSf42289922899euoutp02S
        for <linux-media@vger.kernel.org>; Wed,  8 Jul 2020 15:45:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200708154549euoutp02db86dca6313362a860aa56bb4d525d0b~f0YIYgSf42289922899euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1594223149;
        bh=HMJ3yByH9x8u/WfLOKpCRZRkPGqJDTK6bo8fYkMKWOk=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Zgu9aTFQI5AqoudAGxXbvvDh1jfSE+Mg/1gY3f3v/50lrX31irRUimTZGab2N5Ky8
         VNbiRTbvzdGXJrFXrEVYxhKacosCS2xYdNRGbxJlUXRRojtwNA21MEJ4VPv1YChZU4
         7Knaz/aQ9nuD9mCEqtbqb2YzIzorUg2d3dejpta8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200708154549eucas1p192dfbf443e4f9478ff2c7f1e0d9ae060~f0YH11yGo0235002350eucas1p12;
        Wed,  8 Jul 2020 15:45:49 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 52.60.05997.D2AE50F5; Wed,  8
        Jul 2020 16:45:49 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200708154548eucas1p2de7a70ca8516dc9ce735e7d41cd7e176~f0YHeGl8j1915419154eucas1p2p;
        Wed,  8 Jul 2020 15:45:48 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200708154548eusmtrp21e0a5faebc277bf84e2fe9b1ac93878a~f0YHXEscj2612426124eusmtrp2R;
        Wed,  8 Jul 2020 15:45:48 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-4a-5f05ea2dba3c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id DC.17.06017.C2AE50F5; Wed,  8
        Jul 2020 16:45:48 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200708154547eusmtip27ceef9549db8107c1b038000425ba4b9~f0YGtIgUk0555205552eusmtip2V;
        Wed,  8 Jul 2020 15:45:47 +0000 (GMT)
Subject: Re: [PATCH 06/11] media: exynos4-is: Properly set JPEG options when
 not using CSIS
To:     Tomasz Figa <tfiga@chromium.org>,
        Jonathan Bakker <xc-racer2@live.ca>
Cc:     kyungmin.park@samsung.com, mchehab@kernel.org, kgene@kernel.org,
        krzk@kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <e60ff1bb-730a-11b5-f870-61a4f24f6195@samsung.com>
Date:   Wed, 8 Jul 2020 17:45:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200707182322.GF2621465@chromium.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHe3bv7u5Gk6dpeLDIWIoY+VrUjcIyLBYiSB/6kKgtvankpuz6
        WoSiJqVOLYhyMxQzrRFpc7nSMhJrlU2TTDRNBUe+5EvijEx7cbtJfvud8/zOPf8DlyZkz4Ue
        dJI6jdWolclySkI2v1rq8vObEsYGWm0UUzb2lWC6uxtFjDVvWsQYx/qEzIeWSoopaXwkZG52
        twmYOuOKgFm49Jtieq5+Jg9LFPrcHlJhNFyhFE21OYqagR+kotRkQIoF47ZI6pTkYDybnJTB
        agJCTksSbVMjKLUeZ03Y35O56Km0CIlpwHugOd9KFiEJLcN3EYzW9P4r7AjejWopvlhA0HTb
        SKyNFFTMCB0sw/UITPqjvDSPoK//llNyxdHQfnkcOdgNH4e+0ULCIRF4GMGzxftOicJBoH1Z
        6pSkOAR+zplIB5PYC14XjDt5M46BhkmzgHc2wZsKm7MvXk0xMPHLmYLA7vDJViXg2RPMM5XO
        ZYC7RDDU+5DiY4fBVJWF5NkVpiwmEc9b4c8Tx7BjIB9BSeugiC/KEYxYqhFvHYChrp+rX6JX
        V/hCQ0sA3w6F/mEDcrQBu0D/zCY+hAtca75B8G0pXC6U8bYXLBtuCHj2gGLbH7IcyXXrTtOt
        O0e37hzd/73ViDQgdzadUyWwXLCazfTnlCouXZ3gH5eiMqLV36rzt8X+GLWsnGlHmEbyjdIJ
        ozBWJlRmcNmqdgQ0IXeTHrF2xsik8crs86wmJVaTnsxy7WgLTcrdpbtrJqNlOEGZxp5j2VRW
        s/YqoMUeuWjXx9nM6Z4TYZHe8ymDs3r1vdC26+PmC6mHFN7f2+j+6zPD6kNnv4R/K1uZN4Xv
        a9TWZf2wVB/TXQy8s7Rg3t+anRdUHPdgtLd2OGdrVvDGAXvDPbVnh37HW6zVv8i2Fi7uDTg5
        Zw7w7dBGLBt9F1Xc9gofn8UIcZS4MrNpQ1fUgJzkEpVBOwkNp/wLi9wPKVIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRmVeSWpSXmKPExsVy+t/xe7o6r1jjDb5dULPof/ya2eL8+Q3s
        Fmeb3rBbbHp8jdXi8q45bBY9G7ayWsw4v4/JYtmmP0wWn1v/sVlcnHiXxYHLY3bDRRaPTas6
        2Tw2L6n3WHTzB4tH35ZVjB6fN8kFsEXp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvH
        WhmZKunb2aSk5mSWpRbp2yXoZTx5dZ+xYLlAxYsvF1gaGPfwdjFyckgImEi0zHzLCmILCSxl
        lNj9Rq6LkQMoLiUxv0UJokRY4s+1LrYuRi6gkveMEhMn9DCBJIQFYiUOdTxnBLFFBDwlrj1o
        YwYpYha4xyjxdEYDVEc7k8SvX4fANrAJGEr0Hu0D6+AVsJP49X4LC4jNIqAicaLlOZgtKhAn
        sXzLfHaIGkGJkzOfgMU5gS69+eIv2BxmAXWJP/MuMUPY4hK3nsxngrDlJba/ncM8gVFoFpL2
        WUhaZiFpmYWkZQEjyypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzA2Nx27OeWHYxd74IPMQpw
        MCrx8L7YxBovxJpYVlyZe4hRgoNZSYTX6ezpOCHelMTKqtSi/Pii0pzU4kOMpkDPTWSWEk3O
        B6aNvJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUwfUwcnFINjK4i1wuSX7lt
        PbKQ+diF6U4RHW8s7SvUM9ucTtQc0ju4ZNqE+wk7rGPFmNk5Pz2QjmmeVOHqscNU5l6OipLd
        /r2/xXyDj+6Vybb/ItPBEyT7ZKlNxrHieQ7zo/wdOlL1X1wQvFB2hKnmcsTzRuWzx0UNp7Be
        2tq+9LWgNLNLuMS3W+uN3woHK7EUZyQaajEXFScCABAvYkvjAgAA
X-CMS-MailID: 20200708154548eucas1p2de7a70ca8516dc9ce735e7d41cd7e176
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200707182328eucas1p284f1ed2d1d10a67c88e15ce01653885b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200707182328eucas1p284f1ed2d1d10a67c88e15ce01653885b
References: <20200426022650.10355-1-xc-racer2@live.ca>
        <BN6PR04MB06606F63C7ACE765B57331A1A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
        <CGME20200707182328eucas1p284f1ed2d1d10a67c88e15ce01653885b@eucas1p2.samsung.com>
        <20200707182322.GF2621465@chromium.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 07.07.2020 20:23, Tomasz Figa wrote:
> On Sat, Apr 25, 2020 at 07:26:45PM -0700, Jonathan Bakker wrote:
>> Commit ee7160e57c98 ("[media] s5p-fimc: Add support for JPEG capture")
>> added support for JPEG capture, but missed setting a register when the
>> CSIS device wasn't in use.

> nit: Since this isn't really about using the CSIS device or not, but
> rather about the interface that the sensor is connected with, could we
> instead say "when a parallel interface is used"?

>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>> ---
>>  drivers/media/platform/exynos4-is/fimc-reg.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/media/platform/exynos4-is/fimc-reg.c b/drivers/media/platform/exynos4-is/fimc-reg.c
>> index 5ce2bdebd424..269a98fca1e8 100644
>> --- a/drivers/media/platform/exynos4-is/fimc-reg.c
>> +++ b/drivers/media/platform/exynos4-is/fimc-reg.c
>> @@ -606,6 +606,11 @@ int fimc_hw_set_camera_source(struct fimc_dev *fimc,
>>  	switch (source->fimc_bus_type) {
>>  	case FIMC_BUS_TYPE_ITU_601:
>>  	case FIMC_BUS_TYPE_ITU_656:
>> +		if (fimc_fmt_is_user_defined(f->fmt->color)) {
>> +			cfg |= FIMC_REG_CISRCFMT_ITU601_8BIT;
>> +			break;
>> +		}
>> +
>>  		for (i = 0; i < ARRAY_SIZE(pix_desc); i++) {
>>  			if (vc->ci_fmt.code == pix_desc[i].pixelcode) {
>>  				cfg = pix_desc[i].cisrcfmt;
>> @@ -707,6 +712,8 @@ int fimc_hw_set_camera_type(struct fimc_dev *fimc,
>>  	case FIMC_BUS_TYPE_ITU_601...FIMC_BUS_TYPE_ITU_656:
>>  		if (source->mux_id == 0) /* ITU-A, ITU-B: 0, 1 */
>>  			cfg |= FIMC_REG_CIGCTRL_SELCAM_ITU_A;
>> +		if (vid_cap->ci_fmt.code == MEDIA_BUS_FMT_JPEG_1X8)
>> +			cfg |= FIMC_REG_CIGCTRL_CAM_JPEG;
> 
> Should we also handle MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8 as in the CSI
> case? The S5C73M3 sensor supports the parallel interface as well.

The parallel interface has too low bandwidth to transfer image data
with the maximum supported resolution and frame rate, I doubt anyone would
ever use S5C73MC in such a configuration.

-- 
Regards,
Sylwester
