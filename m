Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C461A9AD50
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 12:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389329AbfHWKdm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 06:33:42 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:49612 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730818AbfHWKdm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 06:33:42 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190823103340euoutp014b79d932135c0864600657d29826ab08~9hsOoZZHt1623616236euoutp01R
        for <linux-media@vger.kernel.org>; Fri, 23 Aug 2019 10:33:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190823103340euoutp014b79d932135c0864600657d29826ab08~9hsOoZZHt1623616236euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1566556420;
        bh=kFqQrtx1/TqEeK10XdGfz2YXBILsy2JMcnnvMmLZJKE=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=giRR+jsXAuFv8j+fXDTPIV6mwDTlkW6tZN+q7N9MfxspYcgLTFltW6jgjdXDaWUu4
         oWZH1ZPtbM1pHnn6dh9UJez4LXeVh4syoHxifZtHWZwZGRzEvNoejETS1GTu1tRB5v
         AIRxu7nSYDpzBn2zC+EWwQj7gnL527XjEOyYUHx8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190823103339eucas1p2eef3970acfe96374d1995e1f551ed0f3~9hsOP_Lkc2737127371eucas1p2I;
        Fri, 23 Aug 2019 10:33:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 65.11.04374.301CF5D5; Fri, 23
        Aug 2019 11:33:39 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190823103339eucas1p298829caab7a1d081535a4a3816736ace~9hsNiGPHl1115411154eucas1p2B;
        Fri, 23 Aug 2019 10:33:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190823103338eusmtrp2d4a6c10a77eaef9fa413ae37581b019f~9hsNMse_G3060130601eusmtrp2u;
        Fri, 23 Aug 2019 10:33:38 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-90-5d5fc103b31f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 95.0F.04117.201CF5D5; Fri, 23
        Aug 2019 11:33:38 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190823103338eusmtip29a9901264f01447309c89a070529a8fc~9hsMsywu00116101161eusmtip2r;
        Fri, 23 Aug 2019 10:33:38 +0000 (GMT)
Subject: Re: [PATCH 4/7] media: ov9650: add a sanity check
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Akinobu Mita <akinobu.mita@gmail.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <2bec8aeb-2fe0-3b93-1f5a-e03a3c4f250d@samsung.com>
Date:   Fri, 23 Aug 2019 12:33:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2868a99c83f1cfef93058f7e49aefa4b104b644f.1566502743.git.mchehab+samsung@kernel.org>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRmVeSWpSXmKPExsWy7djP87rMB+NjDTaeUbF4daCD0aJnw1ZW
        i/efOpksdpxaxGzxacs3JgdWj52z7rJ7bF6h5bFpVSebx7yTgR6fN8kFsEZx2aSk5mSWpRbp
        2yVwZWxd08JaMJOr4s3xFuYGxrkcXYycHBICJhLTGk6xdzFycQgJrGCUOLToMhuE84VR4tqC
        p0wQzmdGiR3v+oAcDrCW9ntWEPHljBIPJq1jhHDeMkpsP/CdFWSusICVROu6/cwgtohAgcSF
        9wvAJjELtDNK/JtyjQ0kwSZgKNF7tI8RxOYVsJNYc+4lE4jNIqAqsfH9WTBbVCBC4tODw6wQ
        NYISJ2c+YQGxOQUSJXbOeMcOYjMLiEs0fVnJCmHLS2x/O4cZZJmEwCJ2iUN/FjJBfOoisfHw
        UXYIW1ji1fEtULaMxP+d85kgGpoZJXp232aHcCYwStw/voARospa4vDxi6ygAGAW0JRYv0sf
        EhaOEs9WCEGYfBI33gpC3MAnMWnbdGaIMK9ER5sQxAwVid+rpkNdIyXR/eQ/ywRGpVlIPpuF
        5JtZSL6ZhbB2ASPLKkbx1NLi3PTUYuO81HK94sTc4tK8dL3k/NxNjMBkc/rf8a87GPf9STrE
        KMDBqMTDe6IrLlaINbGsuDL3EKMEB7OSCG/ZRKAQb0piZVVqUX58UWlOavEhRmkOFiVx3mqG
        B9FCAumJJanZqakFqUUwWSYOTqkGRrn6bFk23cV2xjV99+JCpZ1/HbTuyPx/VTl1ZmJLaJnA
        lW6vxfM4C3remDeufnR3Ye4/n/v1ioXXLx+bxJ4SyJUgt+9Py5G4DUJOPHl6OuYNnnftLl2t
        F91yzfnI2+0cO9oD7kY21y3pfmd++emVwMiazbffxvbPCKmq2x7/w5xj5ez/nxd0K7EUZyQa
        ajEXFScCAJtlnI8yAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsVy+t/xe7pMB+NjDf5cUbd4daCD0aJnw1ZW
        i/efOpksdpxaxGzxacs3JgdWj52z7rJ7bF6h5bFpVSebx7yTgR6fN8kFsEbp2RTll5akKmTk
        F5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZWxd08JaMJOr4s3xFuYG
        xrkcXYwcHBICJhLt96y6GLk4hASWMkocu/WPFSIuJTG/RamLkRPIFJb4c62LDaLmNaPE2Vc9
        jCAJYQEridZ1+5lBbBGBAol1i5azgxQxC3QySnzdeokdoqObSeLw7cNMIFVsAoYSvUf7wLp5
        Bewk1px7CRZnEVCV2Pj+LJgtKhAhcXjHLKgaQYmTM5+wgNicAokSO2e8YwexmQXUJf7Mu8QM
        YYtLNH1ZyQphy0tsfzuHeQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW56bnFRnrFibnFpXnp
        esn5uZsYgdG17djPLTsYu94FH2IU4GBU4uE90RUXK8SaWFZcmXuIUYKDWUmEt2wiUIg3JbGy
        KrUoP76oNCe1+BCjKdBzE5mlRJPzgZGfVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7
        NbUgtQimj4mDU6qBsZU1oizg/lHGiu9W1YxrkyecKrGYmjXHNfbrh4Uvkl4ey9mUtCdh/5Ln
        23812ssLrJW2yqpOEZXTT7ARUPgbGn+t6uM7aZ2qD2KK1b+DmlQ22bzNP6dteCHG9P2JphiF
        DQEe+skp8ezp6gzZWwyuf3Lcs6XLi5XRQmie0rm/KatYKwumOKUpsRRnJBpqMRcVJwIA/TLf
        fcQCAAA=
X-CMS-MailID: 20190823103339eucas1p298829caab7a1d081535a4a3816736ace
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190822193944epcas3p19b687f4c5d058bd92d9d267002afa30d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190822193944epcas3p19b687f4c5d058bd92d9d267002afa30d
References: <4a411ba155eb062b6575aba0824123c840806c0b.1566502743.git.mchehab+samsung@kernel.org>
        <CGME20190822193944epcas3p19b687f4c5d058bd92d9d267002afa30d@epcas3p1.samsung.com>
        <2868a99c83f1cfef93058f7e49aefa4b104b644f.1566502743.git.mchehab+samsung@kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/22/19 21:39, Mauro Carvalho Chehab wrote:
> As pointed by cppcheck:
> 
> 	[drivers/media/i2c/ov9650.c:706]: (error) Shifting by a negative value is undefined behaviour
> 	[drivers/media/i2c/ov9650.c:707]: (error) Shifting by a negative value is undefined behaviour
> 	[drivers/media/i2c/ov9650.c:721]: (error) Shifting by a negative value is undefined behaviour
> 
> Prevent mangling with gains with invalid values
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  drivers/media/i2c/ov9650.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
> index 8b56011446a9..cb49fda902fd 100644
> --- a/drivers/media/i2c/ov9650.c
> +++ b/drivers/media/i2c/ov9650.c
> @@ -703,6 +703,11 @@ static int ov965x_set_gain(struct ov965x *ov965x, int auto_gain)
>  		for (m = 6; m >= 0; m--)
>  			if (gain >= (1 << m) * 16)
>  				break;
> +
> +		/* Sanity check: don't adjust the gain with a negative val */

s/val/value ?

> +		if (m < 0)
> +			return -EINVAL;

This will never happen as min value of V4L2_CID_GAIN control is 16
(gain is always >= 16 and m is always >= 0).
But if it suppresses the warning I'm fine with it.

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
