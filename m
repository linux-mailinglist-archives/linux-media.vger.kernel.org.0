Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD96193B92
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 10:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbgCZJOD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 05:14:03 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:13840 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgCZJOC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 05:14:02 -0400
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20200326091359epoutp015bf7913f5e3daf60f2dbb8ccb56db69f~-z8UUz6fF2909429094epoutp01q
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 09:13:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20200326091359epoutp015bf7913f5e3daf60f2dbb8ccb56db69f~-z8UUz6fF2909429094epoutp01q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585214039;
        bh=XDwUr5omWLEX6KUoejdgHkICdWZSb4CxbTrXJMBlFCM=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=b2jLwF0QefzHZohpwepuyRbOfkJf5PFlq1kyOp7ziDWT7WeVVDnpBWa3DIm3HDdcw
         ajorIYNnhOJR+F0hWknuRXCpk42v1UVHuuVJQESw/TDcHt2z99ISNPrEyaJ1kttzpl
         ONdlWfaofSuWzgWLh1AvTMKhSk0f8KUuTohSbJfI=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20200326091358epcas2p464e1b6c5b7c07467207dd82400377237~-z8T2hovZ1061810618epcas2p4v;
        Thu, 26 Mar 2020 09:13:58 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.184]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 48nznJ5R43zMqYlh; Thu, 26 Mar
        2020 09:13:56 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        77.65.04142.2527C7E5; Thu, 26 Mar 2020 18:13:54 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20200326091353epcas2p22ab6bd29f225aaf1e9d0197da47991ac~-z8PIoPg82614826148epcas2p26;
        Thu, 26 Mar 2020 09:13:53 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200326091353epsmtrp151319f5a7a15763c50a41ba1b0651a41~-z8PHd4CR1336813368epsmtrp1G;
        Thu, 26 Mar 2020 09:13:53 +0000 (GMT)
X-AuditID: b6c32a46-3f9ff7000000102e-e9-5e7c7252945f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        86.97.04158.1527C7E5; Thu, 26 Mar 2020 18:13:53 +0900 (KST)
Received: from KORDO036463 (unknown [12.36.155.134]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20200326091353epsmtip233953896705fd6958c309b52784dad84~-z8O9XrRU2849628496epsmtip2E;
        Thu, 26 Mar 2020 09:13:53 +0000 (GMT)
From:   "Seungchul Kim" <sc377.kim@samsung.com>
To:     "'Hans Verkuil'" <hverkuil@xs4all.nl>, <mchehab@kernel.org>
Cc:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sc377.kim@samsung.com>
In-Reply-To: <3e38fc75-f555-7d91-2561-9c95f76694d1@xs4all.nl>
Subject: RE: [PATCH] media: v4l2-fh: define v4l2_fh struct regardless of
 condition
Date:   Thu, 26 Mar 2020 18:13:53 +0900
Message-ID: <001201d6034e$ded12830$9c737890$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 14.0
Content-Language: ko
Thread-Index: AQKZs4uAsfK6WHGqjpC7tIjGw6qnkgHEzIy+AnQm2p8BRxCVjwJyeszhppOho0A=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCJsWRmVeSWpSXmKPExsWy7bCmqW5QUU2cwZ+TfBanJj9jsri8aw6b
        Rc+GrawWyzb9YbKYdmcCowOrx6ZVnWwefVtWMXp83iTncerrZ/YAlqgcm4zUxJTUIoXUvOT8
        lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygvUoKZYk5pUChgMTiYiV9O5ui
        /NKSVIWM/OISW6XUgpScAkPDAr3ixNzi0rx0veT8XCtDAwMjU6DKhJyM6bf+Mxd8Fq14vWML
        YwPjC8EuRg4OCQETiTc3c7oYuTiEBHYwSvyb+YERwvnEKPGj8x87hPONUeL1mQ7mLkZOsI4b
        6+9BVe1llPi66x4LSEJI4CWjxML3eSA2m4CuxPy//xlBbBEBe4k/166wgdjMAjESex+/Botz
        CthKzG1ZywpyhrBAiMSuL5ogYRYBVYnHHcuZQGxeAUuJBde6WCBsQYmTM5+wQIzRlli28DXU
        PQoSO85CjGQWEJGY3dnGDLHWT+LLy26wByQErrNJTN2whA2iwUVi97/3UM3CEq+Ob2GHsKUk
        Xva3QdnlEh8ebWWCaO5glGj6egeq2Vhi1rN2RpCjmQU0Jdbv0ocEo7LEkVtQt/FJdBz+yw4R
        5pXoaBOCaFSWWP23H2qrpMT+vyeYJjAqzULy2Swkn81C8s0shF0LGFlWMYqlFhTnpqcWGxUY
        IUf1JkZwitRy28G45JzPIUYBDkYlHt4NltVxQqyJZcWVuYcYJTiYlUR4n0bWxAnxpiRWVqUW
        5ccXleakFh9iNAUG/ERmKdHkfGD6ziuJNzQ1MjMzsDS1MDUzslAS593EfTNGSCA9sSQ1OzW1
        ILUIpo+Jg1OqgfGqp1r44/aHj9Y6qEemhj0OU3u5sX85f+jjqWsKwn/fOOFr3PhtXU+i/fWF
        xQ67GjU7Gtd38QSvdtmTZPJj+5zk0w1eUXEzT9zkWX2rv5Ilad6z3Qt8Dm4+vXj3nROCRpZ/
        //Nv+L8t3GdqMxe33N93IskZ6bt/n8gX/VZap2OTKX3obi6P2lYlluKMREMt5qLiRACV+pkc
        pwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsWy7bCSvG5gUU2cQedWRYtTk58xWVzeNYfN
        omfDVlaLZZv+MFlMuzOB0YHVY9OqTjaPvi2rGD0+b5LzOPX1M3sASxSXTUpqTmZZapG+XQJX
        xreDC9kL7otW/L/A0cB4QrCLkZNDQsBE4sb6e4xdjFwcQgK7GSW+z7jN0sXIAZSQlGg5XABR
        Iyxxv+UIK0TNc0aJdRcfMoEk2AR0Jeb//c8IYosIOEp8b3jECNLLLBAnce+cAUT9bCaJg3fe
        MYPUcArYSsxtWcsKYgsLBEmseX2XHcRmEVCVeNyxHGwmr4ClxIJrXSwQtqDEyZlPwGxmAW2J
        3oetjDD2soWvmSGOU5DYcfY1VFxEYnZnGzPEPX4SX152s09gFJ6FZNQsJKNmIRk1C0n7AkaW
        VYySqQXFuem5xYYFRnmp5XrFibnFpXnpesn5uZsYwdGipbWD8cSJ+EOMAhyMSjy8EebVcUKs
        iWXFlbmHGCU4mJVEeJ9G1sQJ8aYkVlalFuXHF5XmpBYfYpTmYFES55XPPxYpJJCeWJKanZpa
        kFoEk2Xi4JRqYEz8tqnqd+5LbuNFO9bK7+DccdqF0f51d/WWzAQ/4TNzqo6tknO5nj7LfZfT
        vcVf7nJcmnTAQrBSKH/qKtftKUmax3UUZr/euTLCKDE3opXnn8muSZM2St5QeWHGkexo9fWt
        3f6g3o4Ajqzjq/3k21/y9un1v1vB/PN5do3phSQt3TtLozQ+dSmxFGckGmoxFxUnAgB4mCOl
        kgIAAA==
X-CMS-MailID: 20200326091353epcas2p22ab6bd29f225aaf1e9d0197da47991ac
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200323023045epcas2p12007502edd2a65efcccb00eb899d5532
References: <CGME20200323023045epcas2p12007502edd2a65efcccb00eb899d5532@epcas2p1.samsung.com>
        <000601d600bb$0e2d4320$2a87c960$@samsung.com>
        <1a0ad24c-e577-e6d2-32ca-514a645b008f@xs4all.nl>
        <007b01d60316$7e554690$7affd3b0$@samsung.com>
        <3e38fc75-f555-7d91-2561-9c95f76694d1@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/26/20 5:17 PM, Hans Verkuil wrote:
> On 3/26/20 3:30 AM, Seungchul Kim wrote:
> > On 3/25/20 5:54 PM, Hans Verkuil wrote:
> >> On 3/23/20 3:30 AM, Seungchul Kim wrote:
> >>> v4l2_fh struct define differently by CONFIG_V4L2_MEM2MEM_DEV.
> >>> If some vendors use CONFIG_V4L2_MEM2MEM_DEV by module, it can make
> >>> the mismatch of v4l2_fh sturct.
> >>>
> >>> By the mismatch, the following error occurs.
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >>> =5B    7.533506=5D v4l2_mem2mem: disagrees about version of symbol
> >> video_devdata
> >>> =5B    7.533594=5D v4l2_mem2mem: Unknown symbol video_devdata (err -2=
2)
> >>> =5B    7.535319=5D v4l2_mem2mem: disagrees about version of symbol
> >>> v4l2_event_pending
> >>> =5B    7.542532=5D v4l2_mem2mem: Unknown symbol v4l2_event_pending (e=
rr -22)
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >>>
> >>> So v4l2_fh struct is modified to does not have dependency for
> >>> CONFIG_V4L2_MEM2MEM_DEV.
> >>>
> >>> Signed-off-by: Seungchul Kim <sc377.kim=40samsung.com>
> >>> ---
> >>>  include/media/v4l2-fh.h =7C 2 --
> >>>  1 file changed, 2 deletions(-)
> >>>
> >>> diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h index
> >>> 53b4dbb..b5b3e00 100644
> >>> --- a/include/media/v4l2-fh.h
> >>> +++ b/include/media/v4l2-fh.h
> >>> =40=40 -53,9 +53,7 =40=40 struct v4l2_fh =7B
> >>>  	unsigned int		navailable;
> >>>  	u32			sequence;
> >>>
> >>> -=23if IS_ENABLED(CONFIG_V4L2_MEM2MEM_DEV)
> >>>  	struct v4l2_m2m_ctx	*m2m_ctx;
> >>> -=23endif
> >>
> >> This is a good change, but please also remove the same =23if from
> >> v4l2_ioctl_get_lock() in drivers/media/v4l2-core/v4l2-ioctl.c. That
> >> is now no longer needed there either and without removing that those
> >> vendor drivers would be using the wrong lock.
> >>
> >> Regards,
> >>
> >> 	Hans
> >
> > Thank you for your comment. I worried about the same thing with you.
> > But vfh->m2m_ctx on v4l2_ioctl_get_lock() is always null without
> > CONFIG_V4L2_MEM2MEM_DEV, because m2m_ctx of v4l2-fh is initialized
> > only in v4l2_mem2mem.c.
> > Therefore it doesn't have a problem using an wrong lock regardless of
> > modification, so I did not fix it.
>=20
> It is: if your out-of-tree driver sets CONFIG_V4L2_MEM2MEM_DEV, then I
> assume it will set vfh->m2m_ctx, and so the v4l2 core should also return
> the right lock for that out-of-tree driver.
>=20
> But in any case, if m2m_ctx is always part of v4l2-fh.h, then that =23if =
in
> v4l2-ioctl.c has become pointless and should be removed in any case.
>=20
> Regards,
>=20
> 	Hans

I agree with you, so I will update a patch, soon

