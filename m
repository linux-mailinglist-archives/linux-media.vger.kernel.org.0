Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13ACF1B1CDF
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 05:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgDUDdw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 23:33:52 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:33010 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727848AbgDUDdv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 23:33:51 -0400
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20200421033346epoutp03321e27999231dababfc7b64984c2375e~HuEswgVZa2798327983epoutp03X
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 03:33:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20200421033346epoutp03321e27999231dababfc7b64984c2375e~HuEswgVZa2798327983epoutp03X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1587440026;
        bh=HUZ2Oj4/FKTBOU/3hAHhyGWK1R7ISUziMoYCYLNnqYc=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=a4vikwSsuDr99ICUyufsBE3EwqO9qhzuxycJTvC/Dpff55eSCaDTtpTiGFMgeVFhS
         x6f46LL5rw4NWqq9rYinEjmmsAVc+lthQf57b4UU02H3kvX4b3wva8CM27jVml0GLR
         wPXF4btFD6dTYyYbWo9B1ZvC88afHYApC6qCYPRI=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20200421033346epcas2p4a6f59417ba1f64adf28040049ef0e8e4~HuEsYz1vj0973209732epcas2p4z;
        Tue, 21 Apr 2020 03:33:46 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.183]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 495q0m2FzGzMqYkj; Tue, 21 Apr
        2020 03:33:44 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        5D.3F.04647.7996E9E5; Tue, 21 Apr 2020 12:33:43 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20200421033343epcas2p25716fce73b5f7ed78dac5102a07404e5~HuEpn1L6c2349823498epcas2p2B;
        Tue, 21 Apr 2020 03:33:43 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200421033343epsmtrp1880f62ad77d80fcd312df06ae1504211~HuEpnDXvQ0929409294epsmtrp1V;
        Tue, 21 Apr 2020 03:33:43 +0000 (GMT)
X-AuditID: b6c32a48-8a5ff70000001227-98-5e9e6997bb42
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        D0.C0.04024.7996E9E5; Tue, 21 Apr 2020 12:33:43 +0900 (KST)
Received: from KORCO038849 (unknown [12.36.155.199]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20200421033343epsmtip201991a790fff12ebe6d9936886b695b6~HuEpbNFA32087720877epsmtip2L;
        Tue, 21 Apr 2020 03:33:43 +0000 (GMT)
From:   "Sunyoung Kang" <sy0816.kang@samsung.com>
To:     "'Arnd Bergmann'" <arnd@arndb.de>
Cc:     "'Greg Kroah-Hartman'" <gregkh@linuxfoundation.org>,
        "'Mauro Carvalho Chehab'" <mchehab@kernel.org>,
        "'Hans Verkuil'" <hverkuil-cisco@xs4all.nl>,
        "'Thomas Gleixner'" <tglx@linutronix.de>,
        "'Linux Media Mailing List'" <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <CAK8P3a37dAwH=gjUJjJE2061MD3jpqP8p+QkkZj9Ok3WcfH0dg@mail.gmail.com>
Subject: RE: [PATCH] media: v4l2-compat-ioctl32.c: copy reserved2 field in
 get_v4l2_buffer32
Date:   Tue, 21 Apr 2020 12:33:42 +0900
Message-ID: <046f01d6178d$a7fbc150$f7f343f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ7gu42VSZ3MiAb9Gs8yfburY36QgIZ9gAxAlM3OUoCfrlhmAFhRYnpAW7QxJwBlNz4gqbdjGUA
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJJsWRmVeSWpSXmKPExsWy7bCmhe70zHlxBhca1Cz+TjrGbtG8eD2b
        xcWZd1ksLu+aw2bRs2Erq8WyTX+YLDZvmsrswO7x+9ckRo9NqzrZPN6dO8fusX/uGnaPz5vk
        PE59/cwewBaVY5ORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6Dr
        lpkDdIuSQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8DQsECvODG3uDQvXS85P9fK
        0MDAyBSoMiEnY8WnnUwFT/gqbt3YwNjA+JW7i5GTQ0LAROLZ9G1sXYxcHEICOxglWt8sZYRw
        PjFKXPz6gx3C+cYoseL8HhaYlkk7j0C17GWU+PbhGyuE85JRYunCJYwgVWwC+hLtrR/ZQWwR
        AVWJV092g9nMAguYJA49cwOxOQUCJV7M/s3UxcjBISwQJ3FjozpImAWo/H7nbiYQm1fAUqJt
        xi9WCFtQ4uTMJywQY+Qltr+dwwxxkILEz6fLWCFWRUmcPbwSapWIxOzONmaQ2yQEvrNJ9Ded
        YYNocJFY+30tO4QtLPHq+BYoW0riZX8blF0vMe3zZ1aI5gmMEi8WHGeFSBhLzHrWzghyNLOA
        psT6XfogpoSAssSRW1C38Ul0HP7LDhHmlehoE4IwVSU2fDKCmCEt8fbtZcYJjEqzkDw2C8lj
        s5A8MAth1QJGllWMYqkFxbnpqcVGBSbIcb2JEZxMtTx2MB4453OIUYCDUYmHd4PYvDgh1sSy
        4srcQ4wSHMxKIrwWWkAh3pTEyqrUovz4otKc1OJDjKbAcJ/ILCWanA9M9Hkl8YamRmZmBpam
        FqZmRhZK4rybuG/GCAmkJ5akZqemFqQWwfQxcXBKNTAaFDotNNy54N/GBp868yvzHt28sLtP
        /ZdN5UYd9WqOPSscc3P9j4b8kv4+V9xAaVnXl7zLM9keyEYfsHgyJS6LY03Sb69JIQLV3s/m
        rr25qqR+9aWf05R+XK+X/DN130P7D2mzVP9GRlW4FOhpCX1dJFU39eSjXs8Yvl7uvcXrzv0w
        LWJ3tF2kxFKckWioxVxUnAgAhw+scbwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsWy7bCSvO70zHlxBh/WCFj8nXSM3aJ58Xo2
        i4sz77JYXN41h82iZ8NWVotlm/4wWWzeNJXZgd3j969JjB6bVnWyebw7d47dY//cNewenzfJ
        eZz6+pk9gC2KyyYlNSezLLVI3y6BK2PFp51MBU/4Km7d2MDYwPiVu4uRk0NCwERi0s4jbF2M
        XBxCArsZJRom97F2MXIAJaQl9m/MhagRlrjfcoQVouY5o8Sq35+YQRJsAvoS7a0f2UFsEQFV
        iVdPdrODFDELLGGSOHvkN9TUH0wSzTNvMYFUcQoESryY/RvMFhaIkfi3bjZYNwtQ9/3O3WBx
        XgFLibYZv1ghbEGJkzOfsIDYzALaEr0PWxkhbHmJ7W/nMEOcpyDx8+kyVogroiTOHl7JDlEj
        IjG7s415AqPwLCSjZiEZNQvJqFlIWhYwsqxilEwtKM5Nzy02LDDMSy3XK07MLS7NS9dLzs/d
        xAiOLS3NHYyXl8QfYhTgYFTi4d0gNi9OiDWxrLgy9xCjBAezkgivhRZQiDclsbIqtSg/vqg0
        J7X4EKM0B4uSOO/TvGORQgLpiSWp2ampBalFMFkmDk6pBkb25Z9+ylRlPovlWBoQw7ZU2J5N
        dYZWq4akzAkxhb0K+W2qn1Mq+U4vY/1UZllxruzMpdnmcZZz107Iy12fzXZsJd8jvn2HgtRf
        +FTbuSV7GF+cNUdv3zXpr22py4MUPWdendS6YE+SWP2Sv+mb8+bJqrnOer77nr5EprDznL2+
        Ll78l4WuWSuxFGckGmoxFxUnAgDuPHm/qQIAAA==
X-CMS-MailID: 20200421033343epcas2p25716fce73b5f7ed78dac5102a07404e5
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
        <000001d616ac$4ceaf1a0$e6c0d4e0$@samsung.com>
        <CAK8P3a37dAwH=gjUJjJE2061MD3jpqP8p+QkkZj9Ok3WcfH0dg@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you for your detailed guide.
And I'll look into how to handle the additional information.

Thanks
Sunyoung

> -----Original Message-----
> From: Arnd Bergmann <arnd@arndb.de>
> Sent: Monday, April 20, 2020 8:23 PM
> To: Sunyoung Kang <sy0816.kang@samsung.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; Hans Verkuil <hverkuil-cisco@xs4all.nl>; Thomas
> Gleixner <tglx@linutronix.de>; Linux Media Mailing List <linux-
> media@vger.kernel.org>; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] media: v4l2-compat-ioctl32.c: copy reserved2 field in
> get_v4l2_buffer32
> 
> On Mon, Apr 20, 2020 at 2:40 AM Sunyoung Kang <sy0816.kang@samsung.com>
> wrote:
> >
> > I understand what you mean.
> > However, the way to transmit information about the buffer is only
> > flags in v4l2_buffer In flags in v4l2_buffer, there is no reserved bit
> > field that can be used for custom.
> > Additional information about the buffer is needed to provide various
> > functions required by the customers but flags is not enough. So
> > reserved2 is used as an alternative.
> > Can you suggest a better opinion?
> 
> If you have a driver that needs to pass additional information that is not
> supported by the subsystem, this is generally either because there is
> something wrong in the driver, or because there is something wrong in the
> subsystem.
> 
> Whichever is at fault should be fixed. If it's the subsystem, then you
> should explain why it's wrong and make a suggestion for how to address it,
> e.g.
> introducing a new ioctl command or redefining the reserved members to be
> defined in the way you need.
> 
> In any case, the ioctl commands should be driver independent, so that any
> hardware with the same feature as your driver can work with the same user
> space.
> 
>      Arnd

