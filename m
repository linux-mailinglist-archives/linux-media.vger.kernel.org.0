Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C69218CB7
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 18:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730357AbgGHQPN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 12:15:13 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:43117 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730141AbgGHQPK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 12:15:10 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200708161507euoutp02ef56f105a40d80ef11e3047000c63ef8~f0xtlbJrZ0923209232euoutp02N
        for <linux-media@vger.kernel.org>; Wed,  8 Jul 2020 16:15:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200708161507euoutp02ef56f105a40d80ef11e3047000c63ef8~f0xtlbJrZ0923209232euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1594224907;
        bh=vJfvmVF8vcAgmxnCgS3wKbE10DIPei7sXr/YrJ17xYQ=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=sp5vy7rmCCJgX0gCZB6VfD7gA/lWbc7ck5IDxS6Yuko8uvfkL7ohgEVwt1uPOgU/n
         OAP/KxES3e5qAMTUxFu6iYIYZ4Pclq9xPPr4r/t7ZSVKfgjANK2Wa8NHdSoBEFz0Lb
         I05JJCOMWnCJjFllz4g605uheFjcWFC5VMefH5S8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200708161507eucas1p286d8adcbcff18ae68b0ae189cbc5e5df~f0xtNr1VY3193831938eucas1p2O;
        Wed,  8 Jul 2020 16:15:07 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 50.AD.06318.B01F50F5; Wed,  8
        Jul 2020 17:15:07 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200708161506eucas1p2273cb7bd714705ff2d0a99d7394b6baf~f0xsvvxU10142801428eucas1p2Z;
        Wed,  8 Jul 2020 16:15:06 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200708161506eusmtrp1356dceb2c2b3c89ab2cc2819b88bf8f8~f0xsvDZti0476504765eusmtrp1s;
        Wed,  8 Jul 2020 16:15:06 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-86-5f05f10b2b78
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 8B.2A.06314.A01F50F5; Wed,  8
        Jul 2020 17:15:06 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200708161506eusmtip17cfa99d68b1fe2018a5a5a5bbb86de61~f0xsLkASF1337513375eusmtip1e;
        Wed,  8 Jul 2020 16:15:06 +0000 (GMT)
Subject: Re: [PATCH 11/11] media: exynos4-is: Correct parallel port probing
To:     Jonathan Bakker <xc-racer2@live.ca>, kyungmin.park@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <05381b4a-3581-e57d-3ecc-43eaafd9d527@samsung.com>
Date:   Wed, 8 Jul 2020 18:15:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BN6PR04MB0660A14860692EAB2A658AEFA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+d3H7t1s4zqtnUwyl3+Y5CtLLhaS1R+DiB4ghaFz6U1NnWNX
        LSvwRWJq5gNZzlATKVuYunyUopFRUqJiopgm/eEQpy0zK8zUcl4r//uc8/0ezvfAoXF5M+lC
        x2mTOb1Wk6AUSYjW1z/7vR3mSbVfU4Eje3tyFmcHBhopti/rE8WaJ0dIdqj9rogtaGwh2TsD
        XRh737yMsYPFE8RhscpsuilSPalNV9W8XyRUhc0mpFow7zxFhkkORXMJcamc3jc4UhK7sOqu
        sxJX2rPnyAw0jechMQ3MfljJyUV5SELLmToE9RU9uFB8Q1BnyBYJxQKCRzWj/0Y+Z81QgvAA
        wfCXJcIuyJl5BNXjWjs7McehruQxZjc5M9kYTNWVi+yCiPGHW68KkZ2lTDDY6hsxOxOMBzwc
        HKXsvJWJgAZrGyZ4HOFNuWV9gZgJh6bn0+uMMwoYs1RhArtBm+3uem5gWikozCjDhKjHIH9p
        ZCO2E8z0NFMCu0JvaQEhDGQjKOgYp4SiCMHHnmokuA7Ch/6ltdj02oo90NDuK7RDoNTylbK3
        gZHBqM1RCCGDklYDLrSlkJsjF9we8Mtk2IjjAvmW34TAKvgx8ZIqQu7GTWcaN51m3HSa8X+G
        akSYkIJL4RNjOD5Ay1324TWJfIo2xicqKdGM1n6pd7Xn+1PUtXyhGzE0Um6RTptJtZzUpPJp
        id0IaFzpLD3S1xshl0Zr0q5y+iS1PiWB47vRDppQKqQBNdZwOROjSebiOU7H6f+qGC12yUCX
        9J1USQ1+zt3mfSOUlc3Fh4Xw+1zjFbNMtEw3lDkW3PG2uuXF3u08fibFAzewXYFDnelu245K
        V67tjhuOLAv0Ok0PVuqcO6iTVSc8w2Os9WL1xGzG9QOZ9/wWi4lhIx3UFfouTbar4pmnQ0uH
        RUK619JnLxrORwRVNsxETSkJPlbj74Xrec0f8Y8LfEcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRmVeSWpSXmKPExsVy+t/xu7pcH1njDfrfGlj0P37NbHH+/AZ2
        i7NNb9gtNj2+xmpxedccNoueDVtZLWac38dksWzTHyaLixPvsjhwemxa1cnmsXlJvceimz9Y
        PPq2rGL0+LxJLoA1Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUn
        syy1SN8uQS/j8z/FgpcsFbua37M2ML5g7mLk5JAQMJF41/SKvYuRi0NIYCmjxJ5z7SxdjBxA
        CSmJ+S1KEDXCEn+udbFB1LxnlLjyrYkNJCEs4C2xYtI6JpCEiEAzk8T/5dtYIKruMkqcPbwK
        rIpNwFCi92gfI4jNK2An8XbtBiYQm0VARWLlxRvsILaoQJzE8i3z2SFqBCVOznzCAmJzCsRK
        bNz/AsxmFlCX+DPvEjOELS5x68l8JghbXmL72znMExgFZyFpn4WkZRaSlllIWhYwsqxiFEkt
        Lc5Nzy021CtOzC0uzUvXS87P3cQIjLdtx35u3sF4aWPwIUYBDkYlHt4Xm1jjhVgTy4orcw8x
        SnAwK4nwOp09HSfEm5JYWZValB9fVJqTWnyI0RTouYnMUqLJ+cBUkFcSb2hqaG5haWhubG5s
        ZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgTHzsWAtT92l7S+amPt0doYEapeZFmSJ+Kur
        ZYXuS3Rv1T7yLEl0T+epu0EnuPf1HLNsCWR591Op4cOk1S+t1/05JFZXGabos8Pr140p3dFR
        4hZq92O3/PerOxJ8SFy5emPDjpQtx7aoOtc5LX60ep37Iy67U7vendAw4LjJuHTfB27x9O8T
        spVYijMSDbWYi4oTAelXiffNAgAA
X-CMS-MailID: 20200708161506eucas1p2273cb7bd714705ff2d0a99d7394b6baf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200426022757eucas1p2d10b653b3d974a1226560ccceed0d120
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200426022757eucas1p2d10b653b3d974a1226560ccceed0d120
References: <20200426022650.10355-1-xc-racer2@live.ca>
        <CGME20200426022757eucas1p2d10b653b3d974a1226560ccceed0d120@eucas1p2.samsung.com>
        <BN6PR04MB0660A14860692EAB2A658AEFA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 26.04.2020 04:26, Jonathan Bakker wrote:
> According to the binding doc[1], port A should be reg = 0
> and port B reg = 1.  Unfortunately, the driver was treating 0
> as invalid and 1 as camera port A.  Match the binding doc and
> make 0=A and 1=B.
> 
> [1] Documentation/devicetree/bindings/media/samsung-fimc.txt

Thank you for correcting this. I would prefer to correct the binding
documentation instead, so it says reg=1 for A and reg=2 for B. 
Then it would also match what we have in dts for Goni and 
enum fimc_input in include/media/drv-intf/exynos-fimc.h.


-- 
Regards,
Sylwester
