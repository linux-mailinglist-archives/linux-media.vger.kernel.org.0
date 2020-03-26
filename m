Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 146A51935F0
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 03:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727689AbgCZCa3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 22:30:29 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:63627 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727690AbgCZCa1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 22:30:27 -0400
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20200326023024epoutp01d56d5c65dc7239b341563596e867d3b1~-ub85SXW92721927219epoutp01g
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 02:30:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20200326023024epoutp01d56d5c65dc7239b341563596e867d3b1~-ub85SXW92721927219epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585189824;
        bh=jtVYgCGuby3iSRnMo4bBnO6fEfC3+klbF+vAhRZg3Rw=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=dMfzkiA2befLb4neQnXI7sXqvdoYxhUp+Dm47CNDIaQ5H+m8YgJ3I7gTpWUV1KI+Y
         quGKHTWxZbpk1HobD8K7Q4gsDh5uS82HKLEKYuYwMDXc/ThHbqK25nQOe0S3vRiscG
         jDaVJen1cj3Vp/GxXm+qUJ6Gc9lqSW9L4ZBL6/R0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20200326023024epcas2p2b5f7373b8f13e9d1ad2722302766ec32~-ub8mbaNT2121121211epcas2p2i;
        Thu, 26 Mar 2020 02:30:24 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.188]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 48npqf1k91zMqYkn; Thu, 26 Mar
        2020 02:30:22 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        56.35.04142.CB31C7E5; Thu, 26 Mar 2020 11:30:20 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20200326023019epcas2p2a220ad74f38ac0598355b2c627317aeb~-ub4V05Fq2112621126epcas2p2v;
        Thu, 26 Mar 2020 02:30:19 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200326023019epsmtrp1a9edace3725effc03efaf04c89c5381a~-ub4U405V2328423284epsmtrp1U;
        Thu, 26 Mar 2020 02:30:19 +0000 (GMT)
X-AuditID: b6c32a46-3e1ff7000000102e-3d-5e7c13bcced0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        D7.25.04024.BB31C7E5; Thu, 26 Mar 2020 11:30:19 +0900 (KST)
Received: from KORDO036463 (unknown [12.36.155.134]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20200326023019epsmtip2a9da98dc87838188f1ac593db628b093~-ub4MCUUh3085630856epsmtip2b;
        Thu, 26 Mar 2020 02:30:19 +0000 (GMT)
From:   "Seungchul Kim" <sc377.kim@samsung.com>
To:     "'Hans Verkuil'" <hverkuil@xs4all.nl>, <mchehab@kernel.org>
Cc:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <1a0ad24c-e577-e6d2-32ca-514a645b008f@xs4all.nl>
Subject: RE: [PATCH] media: v4l2-fh: define v4l2_fh struct regardless of
 condition
Date:   Thu, 26 Mar 2020 11:30:19 +0900
Message-ID: <007b01d60316$7e554690$7affd3b0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Content-Language: ko
Thread-Index: AQKZs4uAsfK6WHGqjpC7tIjGw6qnkgHEzIy+AnQm2p+msO+rEA==
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0iTURjm7Nvmp7U8zZVvI2p9UmRgbrOtKa7sJoP5Q+hCRGlfetqk3di3
        eY2SorUksCvkVJKMIouSpSamXZyUGhapRHaBshJmSKIWBEpt+xb57znP+z7ned5zXpqSesVy
        usjmIk4ba2HEccK2QLIupTPhaJ6y/j3W9V8cE+iGOurEurPNrSLdDf+sIEto8DedERum/SsM
        /T+nY3KpfZZMM2ELiVNBbAX2wiKbSc8Yd+Zvy9dolaoUVbpuI6OwsVaiZ7bn5KZkF1lCboyi
        mLW4Q1Quy3FM6qZMp93tIgqznXPpGeIotDhUKsd6jrVybptpfYHdmqFSKtWaUOdBi3n0/UHH
        6/jSpjpZJXq1sArF0oA3wGDQi6pQHC3F7QjGa5+KwgUpnkIw0ruWL/xC0Dz5UPBPUX3pZgxf
        6ELQdX0meggi+H3hbaRLjFPg6twfFMYyvBlm3wyLw5jCW6CxbyCCY7Eegpc7Q2KaTsC7oGMm
        OUwL8WqY+jYRoSU4HUZerAjTErwY+mq+CvlbVsKDiTqKz6OA9oHviOdlUHvGQ/GuW+Hz49OR
        yQD3isE/zEcAvB0Ge66JeJwA489bYngsh2C1J4pLYHK0VcCLvQhO/PwQFaeBbyx8Kx1yS4Z7
        HalhCDgJet5Fsy0Cb2Auhqcl4PVIeWES3J6rjkZeBo/negXnEOObN5lv3mS+edP4/ns1IGET
        WkocnNVEOLVDPf+j/Siyheuy29H1lzndCNOIWShpTq/Ik4rYYq7M2o2AphiZ5D4pzZNKCtmy
        cuK05zvdFsJ1I03o3c9T8iUF9tBO21z5Ko1aq1Wma3QarVrHJEr8C0b2S7GJdZEjhDiI859O
        QMfKK9Hd+wYpHfBdzDI++vij7amz09znKcs8/kWu2FXQl8ie2tNfgdas7C3z7HhxzHSg/0aa
        Z7l2a7l1R2pWwJg2fWV8sCSjg+jdv1b13Om61/hpEXXeH7dUNGj5kthya2IJbaCnK+qHGp4N
        9VTVBFs3sE+MJ4OVsrt74zcf/rg7cCi+mRFyZla1jnJy7F+U71uRmwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRmVeSWpSXmKPExsWy7bCSvO5u4Zo4gxNXjS1OTX7GZHF51xw2
        i54NW1ktlm36w+TA4rFpVSebx+dNch6nvn5mD2CO4rJJSc3JLEst0rdL4Mp4dDuh4CJ/xao5
        Ig2M53m6GDk5JARMJPqnLGfvYuTiEBLYzSixcfV9xi5GDqCEpETL4QKIGmGJ+y1HWCFqnjNK
        nDw9lwUkwSagKzH/739GEFtEwFHie8MjsF5mAWeJB49tQMJCAnsYJS4/VAGxOQVsJV5O3cMO
        YgsLBEmseX0XzGYRUJX49PQtO0grr4ClxM3TciBhXgFBiZMzn4BtYhbQluh92MoIYctLbH87
        hxniNAWJHWdfQ8VFJGZ3tjFDXOMk8XB/O+MERuFZSEbNQjJqFpJRs5C0L2BkWcUomVpQnJue
        W2xYYJiXWq5XnJhbXJqXrpecn7uJERwTWpo7GC8viT/EKMDBqMTDu8GyOk6INbGsuDL3EKME
        B7OSCO/m1Io4Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rxP845FCgmkJ5akZqemFqQWwWSZODil
        GhgdlpQdMrYqaIlNLo/R37wh+miTTHeFaoBFT820WI3oc0tVlDovn3hzq3T5tGCxZc+i107c
        LnzIpuy2pXv+HkMeoRKXDzfvz7/L/mF2oekp3vVlmwt2HjmRzad/8VTqOzXRHS8m/t64cbe/
        61Pzd05dtx4mv94VPsXRLr75qmnPNW43lqQLfaJKLMUZiYZazEXFiQAj+JY4hQIAAA==
X-CMS-MailID: 20200326023019epcas2p2a220ad74f38ac0598355b2c627317aeb
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
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/25/20 5:54 PM, Hans Verkuil wrote:
> On 3/23/20 3:30 AM, Seungchul Kim wrote:
> > v4l2_fh struct define differently by CONFIG_V4L2_MEM2MEM_DEV.
> > If some vendors use CONFIG_V4L2_MEM2MEM_DEV by module, it can make the
> > mismatch of v4l2_fh sturct.
> >
> > By the mismatch, the following error occurs.
> > ===============================
> > [    7.533506] v4l2_mem2mem: disagrees about version of symbol
> video_devdata
> > [    7.533594] v4l2_mem2mem: Unknown symbol video_devdata (err -22)
> > [    7.535319] v4l2_mem2mem: disagrees about version of symbol
> > v4l2_event_pending
> > [    7.542532] v4l2_mem2mem: Unknown symbol v4l2_event_pending (err -22)
> > ===============================
> >
> > So v4l2_fh struct is modified to does not have dependency for
> > CONFIG_V4L2_MEM2MEM_DEV.
> >
> > Signed-off-by: Seungchul Kim <sc377.kim@samsung.com>
> > ---
> >  include/media/v4l2-fh.h | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h index
> > 53b4dbb..b5b3e00 100644
> > --- a/include/media/v4l2-fh.h
> > +++ b/include/media/v4l2-fh.h
> > @@ -53,9 +53,7 @@ struct v4l2_fh {
> >  	unsigned int		navailable;
> >  	u32			sequence;
> >
> > -#if IS_ENABLED(CONFIG_V4L2_MEM2MEM_DEV)
> >  	struct v4l2_m2m_ctx	*m2m_ctx;
> > -#endif
> 
> This is a good change, but please also remove the same #if from
> v4l2_ioctl_get_lock() in drivers/media/v4l2-core/v4l2-ioctl.c. That is now
> no longer needed there either and without removing that those vendor
> drivers would be using the wrong lock.
> 
> Regards,
> 
> 	Hans

Thank you for your comment. I worried about the same thing with you.
But vfh->m2m_ctx on v4l2_ioctl_get_lock() is always null
without CONFIG_V4L2_MEM2MEM_DEV, because m2m_ctx of v4l2-fh
is initialized only in v4l2_mem2mem.c.
Therefore it doesn't have a problem using an wrong lock
regardless of modification, so I did not fix it.

Regards,
	Seungchul Kim

