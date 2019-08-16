Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A19FB900D5
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 13:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbfHPLhP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 07:37:15 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50841 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbfHPLhP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 07:37:15 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190816113712euoutp02c14a433ffd0240028fc30f21e7f444d7~7ZCtVaHG51783117831euoutp02k
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2019 11:37:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190816113712euoutp02c14a433ffd0240028fc30f21e7f444d7~7ZCtVaHG51783117831euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1565955432;
        bh=Vgpr1nzJ3aHrHv9Wp637FwKA67B4r7LVOieA3Xrb+FQ=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=U6aw+jd1RAdDfzYj9exekCPExvstXReSmE5yhrg0JtGw3cqABaoJSQ5kjxE+4b5cB
         Heh2d5KxZPBIxU4zb3B2t3u+0W6lhbIviWPLJi4fV1Xs49nx3TzACLu3yOPEU+TG4e
         A0YiykDq1GYTeJP1uouz61VI6K96RCkWRGvkCAz0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190816113712eucas1p2781704b08df038df350e9df85a60abc9~7ZCsuveBB1228812288eucas1p2y;
        Fri, 16 Aug 2019 11:37:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 49.C3.04374.765965D5; Fri, 16
        Aug 2019 12:37:11 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190816113711eucas1p241f7a224c3cccc6591cbf5aa3534c3e5~7ZCr3-0WI2699326993eucas1p2j;
        Fri, 16 Aug 2019 11:37:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190816113710eusmtrp213e29c69a263b7cb3b1fc4606093c89a~7ZCrpLnbi0315403154eusmtrp2L;
        Fri, 16 Aug 2019 11:37:10 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-7b-5d569567fff2
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id E5.CE.04166.665965D5; Fri, 16
        Aug 2019 12:37:10 +0100 (BST)
Received: from [106.120.50.63] (unknown [106.120.50.63]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190816113710eusmtip27f233541a3e46a7a97aec2c3d0c08d7e~7ZCrMJ-gw0485504855eusmtip2h;
        Fri, 16 Aug 2019 11:37:10 +0000 (GMT)
Subject: Re: [PATCHv2 04/12] media: s5p_mfc_dec: set flags for OUTPUT coded
 formats
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Maxime Jourdan <mjourdan@baylibre.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <563e44c1-afed-4b08-b7f9-ebe30c17d522@samsung.com>
Date:   Fri, 16 Aug 2019 13:37:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5DQ_oAmsqBWVDWrCiTNxGH5PJ0OdX5Qk_=M+RKnbr=-_g@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djPc7rpU8NiDS4eM7S4te4cq8XFmXdZ
        LI6svcpkMfNEO6vF2aY37BY9G7ayWpx5/JjF4nPrPzYHDo/3N1rZPWY3XGTx6NuyitHj8yY5
        jytHGtk9Tn39zB7AFsVlk5Kak1mWWqRvl8CV0XpwEVvBWuOKC3tbWBoYz8h1MXJySAiYSKyd
        vo+pi5GLQ0hgBaPEzq+7oJwvjBJ/lnxnBakSEvjMKLF1qTNMx5xpt9khipYzSmx58RPKecso
        cWjFYnaQKmGBUInXF8+zgiREBF4ySrzf/xNsFLNAikRf700wm03AUKLrbRcbiM0rYCexcsd/
        RhCbRUBV4sCjM2CDRAViJHa+6WGGqBGUODnzCQuIzSkQKNG6bAYzxEx5ie1v50DZ4hK3nswH
        +0FC4BC7xJ1Z2xkh7naR6J9/iQnCFpZ4dXwLO4QtI/F/J0xDM6PEw3Nr2SGcHkaJy00zoLqt
        JQ4fvwh0NgfQCk2J9bv0IcKOEn8bT7ODhCUE+CRuvBWEOIJPYtK26cwQYV6JjjYhiGo1iVnH
        18GtPXjhEvMERqVZSF6bheSdWUjemYWwdwEjyypG8dTS4tz01GLjvNRyveLE3OLSvHS95Pzc
        TYzA1HT63/GvOxj3/Uk6xCjAwajEw5uRExorxJpYVlyZe4hRgoNZSYR3wsWgWCHelMTKqtSi
        /Pii0pzU4kOM0hwsSuK81QwPooUE0hNLUrNTUwtSi2CyTBycUg2MBx/Pfqhknrrn9RnW325l
        e5XiFjeFzBSS0+edu0Fx9iYFwwyxhEeTf+t/3q/8bulKLu6UYsaJ0kelWWQlcqoU3b15on+6
        nv+55U/oGpmTIen7grzi7afuvSZ1VOpdnmGo2iTLH6aFIXGNtZxyIVy866snCF8RTl4X+Uj9
        A5tczQHXD+87u9SUWIozEg21mIuKEwFXdZyCSQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xe7ppU8NiDX6eM7a4te4cq8XFmXdZ
        LI6svcpkMfNEO6vF2aY37BY9G7ayWpx5/JjF4nPrPzYHDo/3N1rZPWY3XGTx6NuyitHj8yY5
        jytHGtk9Tn39zB7AFqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Ka
        k1mWWqRvl6CX0XpwEVvBWuOKC3tbWBoYz8h1MXJySAiYSMyZdpu9i5GLQ0hgKaPE23N/mSES
        MhInpzWwQtjCEn+udbFBFL1mlJhweCMbSEJYIFTi9cXzYEUiAi8ZJT6/1Ohi5OBgFkiRWH5V
        HqK+h0ni5v1TYDVsAoYSXW+7wHp5BewkVu74zwhiswioShx4dIYdxBYViJHYd2Y7O0SNoMTJ
        mU9YQGxOgUCJ1mUzwI5jFjCTmLf5IZQtL7H97RwoW1zi1pP5TBMYhWYhaZ+FpGUWkpZZSFoW
        MLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIzEbcd+bt7BeGlj8CFGAQ5GJR5egazQWCHW
        xLLiytxDjBIczEoivBMuBsUK8aYkVlalFuXHF5XmpBYfYjQFem4is5Rocj4wSeSVxBuaGppb
        WBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamC0lop3W157n99190+/R04mUxNq
        X8b/ifjy4IhW36FY6dPn5E1X/vY8ybH28gKFONcjG04pv51qle7wW6f+l9OKhY4HLjzyjVow
        ObdLocQn6/5jhqt3uaQfHr5/e/n/pUz7N5hkJgjpVD3bkPk17Pjb/377CxrZxadN0EoWX6Di
        1XdFIX3y1uAVSizFGYmGWsxFxYkAOYNOQtoCAAA=
X-CMS-MailID: 20190816113711eucas1p241f7a224c3cccc6591cbf5aa3534c3e5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190815101443epcas2p15d0bf21de17dabe882fb5d526829fa26
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190815101443epcas2p15d0bf21de17dabe882fb5d526829fa26
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
        <20190812110513.23774-5-hverkuil-cisco@xs4all.nl>
        <CGME20190815101443epcas2p15d0bf21de17dabe882fb5d526829fa26@epcas2p1.samsung.com>
        <CAAFQd5DQ_oAmsqBWVDWrCiTNxGH5PJ0OdX5Qk_=M+RKnbr=-_g@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On 2019-08-15 12:14, Tomasz Figa wrote:
> Hi Hans,
>
> On Mon, Aug 12, 2019 at 8:05 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>> From: Maxime Jourdan <mjourdan@baylibre.com>
>>
>> Tag all the coded formats where the s5p_mfc decoder supports dynamic
>> resolution switching or has a bytestream parser.
>>
> I believe it depends on the MFC hardware version. v5 might have some
> additional restrictions.
>
> Let me add some more folks to figure out.

IIRC MFC v5 also supported resolution change.

>> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> [hverkuil-cisco@xs4all.nl: added CONTINUOUS_BYTESTREAM]
>> ---
>>   .../media/platform/s5p-mfc/s5p_mfc_common.h    |  1 +
>>   drivers/media/platform/s5p-mfc/s5p_mfc_dec.c   | 18 ++++++++++++++++++
>>   2 files changed, 19 insertions(+)
>>
>> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
>> index 96d1ecd1521b..31b133af91eb 100644
>> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
>> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
>> @@ -723,6 +723,7 @@ struct s5p_mfc_fmt {
>>          enum s5p_mfc_fmt_type type;
>>          u32 num_planes;
>>          u32 versions;
>> +       u32 flags;
>>   };
>>
>>   /**
>> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
>> index 61e144a35201..1423c33c70cb 100644
>> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
>> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
>> @@ -62,6 +62,8 @@ static struct s5p_mfc_fmt formats[] = {
>>                  .type           = MFC_FMT_DEC,
>>                  .num_planes     = 1,
>>                  .versions       = MFC_V5PLUS_BITS,
>> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION |
>> +                                 V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>>          },
>>          {
>>                  .fourcc         = V4L2_PIX_FMT_H264_MVC,
>> @@ -69,6 +71,8 @@ static struct s5p_mfc_fmt formats[] = {
>>                  .type           = MFC_FMT_DEC,
>>                  .num_planes     = 1,
>>                  .versions       = MFC_V6PLUS_BITS,
>> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION |
>> +                                 V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>>          },
>>          {
>>                  .fourcc         = V4L2_PIX_FMT_H263,
>> @@ -76,6 +80,7 @@ static struct s5p_mfc_fmt formats[] = {
>>                  .type           = MFC_FMT_DEC,
>>                  .num_planes     = 1,
>>                  .versions       = MFC_V5PLUS_BITS,
>> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION,
>>          },
>>          {
>>                  .fourcc         = V4L2_PIX_FMT_MPEG1,
>> @@ -83,6 +88,8 @@ static struct s5p_mfc_fmt formats[] = {
>>                  .type           = MFC_FMT_DEC,
>>                  .num_planes     = 1,
>>                  .versions       = MFC_V5PLUS_BITS,
>> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION |
>> +                                 V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>>          },
>>          {
>>                  .fourcc         = V4L2_PIX_FMT_MPEG2,
>> @@ -90,6 +97,8 @@ static struct s5p_mfc_fmt formats[] = {
>>                  .type           = MFC_FMT_DEC,
>>                  .num_planes     = 1,
>>                  .versions       = MFC_V5PLUS_BITS,
>> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION |
>> +                                 V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>>          },
>>          {
>>                  .fourcc         = V4L2_PIX_FMT_MPEG4,
>> @@ -97,6 +106,8 @@ static struct s5p_mfc_fmt formats[] = {
>>                  .type           = MFC_FMT_DEC,
>>                  .num_planes     = 1,
>>                  .versions       = MFC_V5PLUS_BITS,
>> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION |
>> +                                 V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>>          },
>>          {
>>                  .fourcc         = V4L2_PIX_FMT_XVID,
>> @@ -104,6 +115,7 @@ static struct s5p_mfc_fmt formats[] = {
>>                  .type           = MFC_FMT_DEC,
>>                  .num_planes     = 1,
>>                  .versions       = MFC_V5PLUS_BITS,
>> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION,
>>          },
>>          {
>>                  .fourcc         = V4L2_PIX_FMT_VC1_ANNEX_G,
>> @@ -111,6 +123,7 @@ static struct s5p_mfc_fmt formats[] = {
>>                  .type           = MFC_FMT_DEC,
>>                  .num_planes     = 1,
>>                  .versions       = MFC_V5PLUS_BITS,
>> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION,
>>          },
>>          {
>>                  .fourcc         = V4L2_PIX_FMT_VC1_ANNEX_L,
>> @@ -118,6 +131,7 @@ static struct s5p_mfc_fmt formats[] = {
>>                  .type           = MFC_FMT_DEC,
>>                  .num_planes     = 1,
>>                  .versions       = MFC_V5PLUS_BITS,
>> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION,
>>          },
>>          {
>>                  .fourcc         = V4L2_PIX_FMT_VP8,
>> @@ -125,6 +139,7 @@ static struct s5p_mfc_fmt formats[] = {
>>                  .type           = MFC_FMT_DEC,
>>                  .num_planes     = 1,
>>                  .versions       = MFC_V6PLUS_BITS,
>> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION,
>>          },
>>          {
>>                  .fourcc         = V4L2_PIX_FMT_HEVC,
>> @@ -132,6 +147,8 @@ static struct s5p_mfc_fmt formats[] = {
>>                  .type           = MFC_FMT_DEC,
>>                  .num_planes     = 1,
>>                  .versions       = MFC_V10_BIT,
>> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION |
>> +                                 V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>>          },
>>          {
>>                  .fourcc         = V4L2_PIX_FMT_VP9,
>> @@ -139,6 +156,7 @@ static struct s5p_mfc_fmt formats[] = {
>>                  .type           = MFC_FMT_DEC,
>>                  .num_planes     = 1,
>>                  .versions       = MFC_V10_BIT,
>> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION,
>>          },
>>   };
>>
>> --
>> 2.20.1
>>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

