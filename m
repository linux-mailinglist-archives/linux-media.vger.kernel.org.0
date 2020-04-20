Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5391AFF53
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgDTAkl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:40:41 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:17845 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725964AbgDTAkk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:40:40 -0400
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200420004037epoutp040f5322f020d4cbdc3626440f729a5e78~HYEOz1SXN1415214152epoutp04g
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 00:40:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200420004037epoutp040f5322f020d4cbdc3626440f729a5e78~HYEOz1SXN1415214152epoutp04g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1587343237;
        bh=WjUouuwpSjcCH4wCj3ionVKHepsaplZuTPFn5NqMPwI=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=vMLQlnAabD27ltP/v1cbTqNSjFpd45tm/xC2Anra6tRJTL2X3CATuIv0Xw/8TfTPt
         Z2lJQ3LvdHp8+D8auatah4T6zDvaYJ2z5TccyT4xt1f+kkrxfxrlliGpeVRuwRMhSK
         WxtgLCpIWQjvY3WswYMMhf49n6IoaVro0hNn7Fyc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20200420004037epcas2p4fc130492944c575178bcd633ab66328e~HYEOTd6s52437624376epcas2p4E;
        Mon, 20 Apr 2020 00:40:37 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.182]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4957CQ1Bs6zMqYl4; Mon, 20 Apr
        2020 00:40:34 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        3B.45.04598.28FEC9E5; Mon, 20 Apr 2020 09:40:34 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20200420004033epcas2p4b7509a3b89d73dc1cbe5912c66f12e5c~HYELQEnHm2654826548epcas2p4m;
        Mon, 20 Apr 2020 00:40:33 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200420004033epsmtrp2bc54ee3c4b3eff0e60a975bf83c0be59~HYELPT9Af1250412504epsmtrp2P;
        Mon, 20 Apr 2020 00:40:33 +0000 (GMT)
X-AuditID: b6c32a45-eb9ff700000011f6-67-5e9cef822c75
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        32.D1.04158.18FEC9E5; Mon, 20 Apr 2020 09:40:33 +0900 (KST)
Received: from KORCO038849 (unknown [12.36.155.199]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20200420004033epsmtip1548dd0f1b37c5331ea680b19f9a61a4d~HYELHmlVw2612026120epsmtip1X;
        Mon, 20 Apr 2020 00:40:33 +0000 (GMT)
From:   "Sunyoung Kang" <sy0816.kang@samsung.com>
To:     "'Greg Kroah-Hartman'" <gregkh@linuxfoundation.org>
Cc:     <mchehab@kernel.org>, "'Hans Verkuil'" <hverkuil-cisco@xs4all.nl>,
        "'Arnd Bergmann'" <arnd@arndb.de>,
        "'Thomas Gleixner'" <tglx@linutronix.de>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20200418073719.GA2410414@kroah.com>
Subject: RE: [PATCH] media: v4l2-compat-ioctl32.c: copy reserved2 field in
 get_v4l2_buffer32
Date:   Mon, 20 Apr 2020 09:40:33 +0900
Message-ID: <000001d616ac$4ceaf1a0$e6c0d4e0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ7gu42VSZ3MiAb9Gs8yfburY36QgIZ9gAxAlM3OUoCfrlhmAFhRYnppvPm31A=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0gUURjlOrMzo7Z1W60+LGoZkygwd7ZWx3IrWIuFHkhRVNTaoJNa+2Jn
        txe9Ix+RZaKVm4oZSGmhrZXRO5U0saUnPcgeUKGFli1FL7Udx8h/5zvf+e45372XITRnqCgm
        y+4WXXbBylJh5KWmqQmxez+XWnT5r2i+r/AOze87VUvxD0o6SP7RlVKKP1h3UcVX+f6E8PW+
        YmIebf79qxCZfdV5lLnH76fNN8vO0uaAb6K57VuATqFWW5MyRSFddGlFe5ojPcueYWQXLks1
        pRridVwsl8gnsFq7YBONbPKilNgFWdZgFla7SbB6glSKIEls3Jwkl8PjFrWZDsltZEVnutXJ
        cc7pkmCTPPaM6WkO2yxOp9Mbgsp11sy31/JIpy98i7+mJ2Q3qgk9gEIZwDOhv/mx6gAKYzT4
        MoKiiiJKKb4iaKu9Q8oqDf6O4NLB9f8mbt5qGBJdR9DZUU4qRReC7yU+JKsoHAc5+3tpGUfi
        BCh720LLIgI/QXD62oUQuRGKOegfaA+aM0wEtsCz81NkmsQx8Ce/eFCixonw9E0npeDRcLfk
        3WAiAk+Chu5SQkmkhZ/vq1SK1xLofVhOK5pIOJGXTci+gAco+Lm/kFYGkiHvxnFKwRHwseXC
        EB8FgZ7rQ/wuOBoIqJThguCaFS0qpTEDvB9ykByawFOh9kqcDAFHQ/OLoWwjIbepj1ZoNeRm
        axQYA3Vf9coZ46G7+xEqQKx32GLeYYt5hy3g/W9VgchqNFZ0SrYMUdI7ueFv7UOD33Ta/Mvo
        uH9RI8IMYkeoV5aVWjQqYZO01daIgCHYSPXtBSUWjTpd2LpNdDlSXR6rKDUiQ/DejxBRY9Ic
        wU9vd6dyBn18vC7RwBvi9Tw7Tl0f/nyNBmcIbnGjKDpF17+5ECY0ajdyts55qauPdmR/UTXd
        a2yNa3g9gdzcl0tMPGRELzb0dh5ZbapcFS1d9b+Zt/jWueW+GNO5l4s5W8OW5vt1a01VEfhs
        q6Y/yXNyYG1Y/uTW7V2Hup7vXLFjZvKeisOzJ5hHJR0G6w3+R1Z5Qcrcym1FlmNTcqpM7Z9q
        u8/TxuIwamklS0qZAjeNcEnCXwnB6e68AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRmVeSWpSXmKPExsWy7bCSnG7j+zlxBr9vaFn8nXSM3aJ58Xo2
        i4sz77JYXN41h82iZ8NWVotlm/4wWWzeNJXZgd3j969JjB6bVnWyebw7d47dY//cNewenzfJ
        eZz6+pk9gC2KyyYlNSezLLVI3y6BK+Phnk6Wgk3cFedWv2NqYFzN2cXIySEhYCKx/8B2ti5G
        Lg4hgd2MEtOWvmDsYuQASkhL7N+YC1EjLHG/5QgrRM1zRol7z+YwgiTYBPQl2ls/soPYIgLm
        EnMfHmcHKWIWuM0oseb0ORaIjlYmiRuzfjCDVHEKGEr8+3+GFcQWFoiR+LduNlg3i4CqxJ/e
        qUwgNq+ApcT1By/YIGxBiZMzn7CAXMQsoCfRthFsMbOAvMT2t3OYIa5TkPj5dBkrxBF+Eh8v
        zWOHqBGRmN3ZxjyBUXgWkkmzECbNQjJpFpKOBYwsqxglUwuKc9Nziw0LjPJSy/WKE3OLS/PS
        9ZLzczcxguNKS2sH44kT8YcYBTgYlXh4I+bOiRNiTSwrrsw9xCjBwawkwnvQbWacEG9KYmVV
        alF+fFFpTmrxIUZpDhYlcV75/GORQgLpiSWp2ampBalFMFkmDk6pBsasX9NO7VMzC5rz0kHP
        9OalSfEFS+rutW1/pzGhwH2d5dMI9y/XAo9NlV6rE3p9t4xfe8y6BWuniXs5rnXR3adzvnep
        ++3zwdM3uAdr1TXVW1s4qnf2/1p87bnax3Opk7/NOR5rfOzzCqUDrrXV+64opTU3vF++8OvS
        cP3l5oEfZp/NOJKzYJWdEktxRqKhFnNRcSIAHNdGCacCAAA=
X-CMS-MailID: 20200420004033epcas2p4b7509a3b89d73dc1cbe5912c66f12e5c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200417025205epcas2p46d33e64f2de49041d2ca68ecc98fc83e
References: <CGME20200417025205epcas2p46d33e64f2de49041d2ca68ecc98fc83e@epcas2p4.samsung.com>
        <20200417024543.66785-1-sy0816.kang@samsung.com>
        <20200417083506.GB141762@kroah.com>
        <145301d6152f$6d5b6240$481226c0$@samsung.com>
        <20200418073719.GA2410414@kroah.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I understand what you mean.
However, the way to transmit information about the buffer is only flags in
v4l2_buffer
In flags in v4l2_buffer, there is no reserved bit field that can be used for
custom.
Additional information about the buffer is needed to provide various
functions required by the customers but flags is not enough. So reserved2 is
used as an alternative.
Can you suggest a better opinion?

And copy the reserved2 value in put_v4l2_buffer32(), but it is missing only
in get_v4l2_buffer32().
Can't I put it in get_v4l2_buffer32()?

Thanks,
Sunyoung

> -----Original Message-----
> From: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
> Sent: Saturday, April 18, 2020 4:37 PM
> To: Sunyoung Kang <sy0816.kang@samsung.com>
> Cc: mchehab@kernel.org; 'Hans Verkuil' <hverkuil-cisco@xs4all.nl>; 'Arnd
> Bergmann' <arnd@arndb.de>; 'Thomas Gleixner' <tglx@linutronix.de>; linux-
> media@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] media: v4l2-compat-ioctl32.c: copy reserved2 field in
> get_v4l2_buffer32
> 
> On Sat, Apr 18, 2020 at 12:14:09PM +0900, Sunyoung Kang wrote:
> > Exynos video codec driver uses reserved2 value. How will reserved2 be
> > used for future use?
> 
> No driver should be using the "reserved" fields, as they are "reserved"
> by the api for future expansion of it.  They are not driver-specific
> fields to be used that way at all.
> 
> thanks,
> 
> greg k-h

