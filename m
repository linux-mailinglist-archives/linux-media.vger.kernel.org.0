Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 812F9218A6B
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 16:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729952AbgGHOts (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 10:49:48 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48653 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729652AbgGHOts (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 10:49:48 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200708144946euoutp0215ed8e4bc576807a4d5d71408e5c2d23~fznL_gv7W2149921499euoutp02s
        for <linux-media@vger.kernel.org>; Wed,  8 Jul 2020 14:49:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200708144946euoutp0215ed8e4bc576807a4d5d71408e5c2d23~fznL_gv7W2149921499euoutp02s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1594219786;
        bh=FvnKpLpfAzSLRUm2zDE6RqfbQeB+7yAT2FnD5DmeapI=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=odQ4u8nwo9Jd82INCHGBA3ReWUSALaJ1h1Omrp926IBAnvTSJDu0M9mVVYnE4FDa9
         6gVsO/a5V7poAspknYNACao/1V02s687eNilcIAUmuJ+n2A3QA8+pKVx0H9P7jhG6P
         tRc9a0Fzqiy7qIgsyIGHwoqDWvA93gKDP/lTh3cc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200708144946eucas1p2cdb48155d4c4b27d6aeeb9a5f80e43a0~fznLyXjxp0172401724eucas1p2P;
        Wed,  8 Jul 2020 14:49:46 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 3A.79.05997.A0DD50F5; Wed,  8
        Jul 2020 15:49:46 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200708144945eucas1p262cbd0aacfb58e0ce579aaa6cd5d3119~fznLhnd9b0283102831eucas1p26;
        Wed,  8 Jul 2020 14:49:45 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200708144945eusmtrp223856cbb5fd52bdcab3e3d7f6b6203c8~fznLg8IxX2353923539eusmtrp2F;
        Wed,  8 Jul 2020 14:49:45 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-a0-5f05dd0a7b6c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id DF.01.06314.90DD50F5; Wed,  8
        Jul 2020 15:49:45 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200708144945eusmtip2712a08ec91f400a7a3cae14cf21b82b8~fznK4YwMv0154601546eusmtip2k;
        Wed,  8 Jul 2020 14:49:45 +0000 (GMT)
Subject: Re: [PATCH 03/11] media: exynos4-is: Fix nullptr when no CSIS
 device present
To:     Jonathan Bakker <xc-racer2@live.ca>, kyungmin.park@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <c4fd36f4-a241-1279-c62b-823a67c05d88@samsung.com>
Date:   Wed, 8 Jul 2020 16:49:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BN6PR04MB0660EE7304C2BB2E603A8824A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju287ZjqPJcSq+qBkNkRKvFXRCEYuIQX/CKEFSO+pBLTdl06n1
        Q0t0Ts3UInUZ3s2moEybNVFqkKO8lmVpitFWqGmWE7xkmfMo+e95n8v3vg98BFekx12JRFkq
        I5fRSWKeANP3rQ35Cqbw6ADVNJ+6Y/7OpYaH2/nU4K15PqUzj+HUqKGKRxW1P8GpiuFeDtWk
        2+BQb0qnsFA7iU6r5kk6GrIkdeOrmKS4U4skVp3HeTxCEBzHJCUqGbl/yBVBQlX9HyylEcvo
        zmnCslEPtwDZEUAeh5/vTPwCJCBEZDOCvNWbGDssI1DX5iF2sCK4a7Wi3cjj2pYd1yMEFXrV
        Tv4XgrF7D3Gby5EMhw96NccmOJE5HPjWXMmzCTwyEG6/LN5+SkiGgGXkB9+GMdIT1mZbMRt2
        JqOgbbaLw3oc4FWlZZu3IyPhs350m+eSLjBhqd7BB6FroYprWwakng/r71tx9tYzUL46wGOx
        I8yZOvksdofNZ9UcNpCDoKj7E58dShBMm2p2mgbB5ND6VprYWnEE2gz+LH0KltQTyEYDaQ8f
        FxzYI+yhTF/OZWkh5OeJWLcn/NaWc1jsCoWWTYzFEsg3fMFL0CHNnpqaPdU0e6pp/t9QgzAt
        cmHSFNJ4RnFUxqT7KWipIk0W7xebLNWhrd/U/9e0/BQZNmKMiCSQeL9wRodHi3BaqciUGhEQ
        XLGT8PRgf5RIGEdnXmfkydHytCRGYURuBCZ2ER6rm40UkfF0KnONYVIY+a7KIexcs5FXvc8F
        rw5VuE9LIe2u8Uh/MeAbsS8IV84UDK0EBp+9KImzxsa0mxfDyjod+zLuH3BTqlIu5TaqUbZp
        5cHzpeTensHxlS7n7MWBsFVx7tzkSP+5jli/3IlW5eVikXm69OtoXzm5fOKtNiuw2niD9o46
        fPWksCFg8/VQzPp8cmikGFMk0IHeXLmC/gfunvO7SQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRmVeSWpSXmKPExsVy+t/xe7qcd1njDbqPGFv0P37NbHH+/AZ2
        i7NNb9gtNj2+xmpxedccNoueDVtZLWac38dksWzTHyaLixPvsjhwemxa1cnmsXlJvceimz9Y
        PPq2rGL0+LxJLoA1Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUn
        syy1SN8uQS9jzuK/LAVLWSp2Ny9jaWDcy9zFyMkhIWAisXLhahYQW0hgKaPEoh7lLkYOoLiU
        xPwWJYgSYYk/17rYuhi5gEreM0qc+P+CESQhLBAusebuZ1aQhIhAM5PE/+XbWCCq7jJKvFo+
        H2wqm4ChRO/RPrAOXgE7iScX3rGD2CwCKhI/X64BqxEViJNYvmU+O0SNoMTJmU/A4pwCsRIP
        tl1mArGZBdQl/sy7xAxhi0vcejIfKi4vsf3tHOYJjIKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW
        56bnFhvqFSfmFpfmpesl5+duYgTG27ZjPzfvYLy0MfgQowAHoxIP74tNrPFCrIllxZW5hxgl
        OJiVRHidzp6OE+JNSaysSi3Kjy8qzUktPsRoCvTcRGYp0eR8YCrIK4k3NDU0t7A0NDc2Nzaz
        UBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAaDT7mxPH/DvXP56Z3mD1IFNKJX43k6AZl/u+
        L+IFektNI88UVFvmr9F0+zr3mfX7jIcVui0HWQo1LIVWGXUcr014H7h8I9/d771mJQkW5sUf
        7wQ+c/5yXnWG7NmzbDmbFsh6ay9fY9gYq+/woraZ6/vuKZseXpLYx/BhcuM988NXc7k3sF1e
        rMRSnJFoqMVcVJwIAIWvT8vNAgAA
X-CMS-MailID: 20200708144945eucas1p262cbd0aacfb58e0ce579aaa6cd5d3119
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200426022730eucas1p12b77bd3e1bb3ee123dcec1eb8b00bc6a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200426022730eucas1p12b77bd3e1bb3ee123dcec1eb8b00bc6a
References: <20200426022650.10355-1-xc-racer2@live.ca>
        <CGME20200426022730eucas1p12b77bd3e1bb3ee123dcec1eb8b00bc6a@eucas1p1.samsung.com>
        <BN6PR04MB0660EE7304C2BB2E603A8824A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26.04.2020 04:26, Jonathan Bakker wrote:
> Not all devices use the CSIS device, some may use the FIMC directly in
> which case the CSIS device isn't registered.  This leads to a nullptr
> exception when starting the stream as the CSIS device is always
> referenced.  Instead, if getting the CSIS device fails, try getting the
> FIMC directly to check if we are using the subdev API
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>

Thanks, the change looks good to me.

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
