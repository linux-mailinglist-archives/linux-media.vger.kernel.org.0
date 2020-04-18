Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB8F1AE984
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 05:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgDRDOP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 23:14:15 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:19960 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgDRDOP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 23:14:15 -0400
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20200418031412epoutp024281ae008ee87c356c0cce8f55c04e7e~Gy3wwx6_v2406724067epoutp02i
        for <linux-media@vger.kernel.org>; Sat, 18 Apr 2020 03:14:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20200418031412epoutp024281ae008ee87c356c0cce8f55c04e7e~Gy3wwx6_v2406724067epoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1587179652;
        bh=crD58NOw86V85XwGNNcCoav9TwvzhMw5wIbsy3PoxVQ=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=JpnN7FzCjGnm0Cj+kBHAZiBqDeqvB86fLt7+dIG+H02dvjDOfEV4uDxejuF/DH40t
         uI8IIvqdxVoBqzaqyT+/yW3lhbb42VFrsglV/ANo9K8ToOeSgAX8jTBAkpDjdnbdLf
         h08Yo//cVW8CWXyX10hPiZLp73JhNb+txdosXL2c=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20200418031412epcas2p358a37f6d306712e71b47cf9faac6921d~Gy3wRM6r32383623836epcas2p3_;
        Sat, 18 Apr 2020 03:14:12 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.185]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 493yjZ1mgLzMqYkV; Sat, 18 Apr
        2020 03:14:10 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        C8.FE.04647.2807A9E5; Sat, 18 Apr 2020 12:14:10 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20200418031409epcas2p320d403d8caaa77bfe526def8d237b0f7~Gy3t4pbOx0279702797epcas2p3E;
        Sat, 18 Apr 2020 03:14:09 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200418031409epsmtrp18cb216f595057f72fc7d8a8d837144a2~Gy3t37qND0377203772epsmtrp19;
        Sat, 18 Apr 2020 03:14:09 +0000 (GMT)
X-AuditID: b6c32a48-88dff70000001227-0d-5e9a70823ee1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        A9.2C.04024.1807A9E5; Sat, 18 Apr 2020 12:14:09 +0900 (KST)
Received: from KORCO038849 (unknown [12.36.155.199]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20200418031409epsmtip141ab7faae12fac7e4e96d1addbddb9ff~Gy3tqaFNS2625326253epsmtip1R;
        Sat, 18 Apr 2020 03:14:09 +0000 (GMT)
From:   "Sunyoung Kang" <sy0816.kang@samsung.com>
To:     "'Greg Kroah-Hartman'" <gregkh@linuxfoundation.org>
Cc:     <mchehab@kernel.org>, "'Hans Verkuil'" <hverkuil-cisco@xs4all.nl>,
        "'Arnd Bergmann'" <arnd@arndb.de>,
        "'Thomas Gleixner'" <tglx@linutronix.de>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20200417083506.GB141762@kroah.com>
Subject: RE: [PATCH] media: v4l2-compat-ioctl32.c: copy reserved2 field in
 get_v4l2_buffer32
Date:   Sat, 18 Apr 2020 12:14:09 +0900
Message-ID: <145301d6152f$6d5b6240$481226c0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ7gu42VSZ3MiAb9Gs8yfburY36QgIZ9gAxAlM3OUqnD+90kA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUwTWxT2dtqZqbyaa0E98ow2Y4xBg7TVlgHpi1Gik2gIavyDhjqhE0rs
        MukUl5dnNM/I9ojiHiooUcKiJmgBxS2yGFGjKBISdyUCARNcaNQI1rwOUyP/vnPvt5xz76EJ
        fS0ZT+d5/ILPw7sYcqr6ckdCcuK/YiDb+KI4hg0fvkOx+842kGx3+Ss123OtgmRLLzZr2Jrg
        DxXbGDxGrKC48bHDiAueKya5D11dFHer8gLFhYJzuftfQlQmmeVKcwq8Q/AZBE+O15HnybUx
        azfaV9ktVqMp0ZTCJjMGD+8WbEz6uszE1XmuSC+MYTvvyo8cZfKSxCT9lebz5vsFg9Mr+W2M
        IDpcoskkLpF4t5TvyV2S43WnmoxGsyXC3Opyll5/TIoj2p19tXdUe9ERugRpacDLoG7oi7oE
        TaX1uAXBx+shlVKMIggPDlBK8RVB46k21S9J/aXqKOsmgoGh7mgxjODN6AMks0icBIX7P1My
        jsPJUNnXOWFF4F4EdTeaJqy02Ai191ojmKZjcTY8vbRQhmq8AK683SlDHU6B/Q9ny2Qdng73
        yvvVMibwPLgyUkEo/Rjg+0CNRklaCf0t41FOHJwsLiDkVMDjJLSebqZkT8Dp8PQlp2hj4X1n
        E6XgeBg+WBDFe+B4KKRRtGUIhqo6NcrFUggMFiLZh8AJ0HAtSbGcD7efR2OnQVFHOJqkg6IC
        vQIXwMVRs+LxJ4yM9KAyxAQmzRWYNFdgUv+B31FVSH0OzRREyZ0rSGZx2eSfDqKJJV3EtaDW
        rnXtCNOI+UNXdKA8W6/ht0u73O0IaIKJ07WtjhzpHPyuvwWf1+7LdwlSO7JEHv0QET8jxxtZ
        eY/fbrKYrVZjioW1WM0sM0sXjHm2RY9zeb+wTRBEwfdLp6K18XuRJebg1frFPzeccTXx7RnV
        Lfv+seFtIr37fRuz9GPOy6O9Jd13w+d9VOkJ/fFPfVndx7Kq6hrOxrY+fvegcIyzHi2cc7eZ
        7yBSaw5VLLfZ02fscK5xVqd9CozRGT2DveEt2uoLr9ePPyrrvz/PsUn9rjGcsXnKk9SEb45H
        8/v/6zrzmlFLTt60iPBJ/P87p9+IugMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsWy7bCSnG5jwaw4g1PbdCz+TjrGbtG8eD2b
        xcWZd1ksLu+aw2bRs2Erq8WyTX+YLDZvmsrswO7x+9ckRo9NqzrZPN6dO8fusX/uGnaPz5vk
        PE59/cwewBbFZZOSmpNZllqkb5fAldGz+wJbwVvOiofLjzE1ME7m6GLk5JAQMJFYuXEJUxcj
        F4eQwG5GiQWPl7B0MXIAJaQl9m/MhagRlrjfcoQVxBYSeM4oMfGUKIjNJqAv0d76kR3EFhEw
        l5j78Dg7yBxmgduMEmtOn2OBGLqJUaJ/21MWkCpOAQOJ5ScPMIHYwgIxEv/WzWYHWcYioCqx
        /UEFiMkrYCnRelYSpIJXQFDi5MwnYOcwC+hJtG1kBAkzC8hLbH87hxniNAWJn0+XsUKc4CTx
        ZMdvFogaEYnZnW3MExiFZyGZNAth0iwkk2Yh6VjAyLKKUTK1oDg3PbfYsMAwL7Vcrzgxt7g0
        L10vOT93EyM4orQ0dzBeXhJ/iFGAg1GJh9egZ2acEGtiWXFl7iFGCQ5mJRHeg25AId6UxMqq
        1KL8+KLSnNTiQ4zSHCxK4rxP845FCgmkJ5akZqemFqQWwWSZODilGhhXTX/grDnT0Hzt7ahY
        nX21dazyT4Au7I73Mb1eeqV8n1WOm3Sf4Jl7vGteiT8wtv8iJ63BmOM8syRv8YKA8JN2X2x/
        Los1CovzbQuKWSv+vEH0hEEgs1eLj7zV+R3vHdRdk11uXXsVd/+3eMUM1TKNdWcttua93fS+
        uj14VsoRvcvLm3x4lViKMxINtZiLihMBErvG/qQCAAA=
X-CMS-MailID: 20200418031409epcas2p320d403d8caaa77bfe526def8d237b0f7
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
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Exynos video codec driver uses reserved2 value. How will reserved2 be used
for future use?

Thanks
Sunyoung

> -----Original Message-----
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Friday, April 17, 2020 5:35 PM
> To: sy0816.kang@samsung.com
> Cc: mchehab@kernel.org; Hans Verkuil <hverkuil-cisco@xs4all.nl>; Arnd
> Bergmann <arnd@arndb.de>; Thomas Gleixner <tglx@linutronix.de>; linux-
> media@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] media: v4l2-compat-ioctl32.c: copy reserved2 field in
> get_v4l2_buffer32
> 
> On Fri, Apr 17, 2020 at 11:45:23AM +0900, sy0816.kang@samsung.com wrote:
> > From: Sunyoung Kang <sy0816.kang@samsung.com>
> >
> > get_v4l2_buffer32() didn't copy reserved2 field from userspace to
driver.
> > So the reserved2 value is not received through compat-ioctl32 in driver.
> > This patch copy reserved2 field of v4l2_buffer in get_v4l2_buffer32().
> >
> > Signed-off-by: Sunyoung Kang <sy0816.kang@samsung.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 1 +
> >  1 file changed, 1 insertion(+)
> 
> What driver is using the reserved fields?  They should be ignored as they
> are "reserved" for future use.
> 
> thanks,
> 
> greg k-h

