Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2963F18EDFF
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 03:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbgCWCax (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Mar 2020 22:30:53 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:23803 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbgCWCaw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Mar 2020 22:30:52 -0400
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20200323023050epoutp0174ff71aa31392cf9265e84c447dc78e4~_zgeJxEU20537805378epoutp01C
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 02:30:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20200323023050epoutp0174ff71aa31392cf9265e84c447dc78e4~_zgeJxEU20537805378epoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1584930650;
        bh=PBdhHhXowl9TplAif7mn+5bR6K1fB0LE7KtzAtp1XqA=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=QT8qxzDl6E6RjJAKWAzdZijI4FdXcAKGBRcwlro8wn01s7bGCeL/t2b/Lyqd37n6e
         Bv6rEdNYf6H6S0zHvL9++PRLXthhelzZHnxoaJJXXZ3Nyb4/eOSEapZ91e3nSGoNzv
         Qt9c1qpOV1b03AkGuqje/6GpdaZaoN8W1N9kXdz4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20200323023050epcas2p1e7593128df93926c14d60253e176f250~_zgdvC67k1497414974epcas2p1v;
        Mon, 23 Mar 2020 02:30:50 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.190]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 48lyzW4x0rzMqYm9; Mon, 23 Mar
        2020 02:30:47 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        1F.35.04142.55F187E5; Mon, 23 Mar 2020 11:30:45 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20200323023045epcas2p12007502edd2a65efcccb00eb899d5532~_zgZOZXOw1498614986epcas2p1N;
        Mon, 23 Mar 2020 02:30:45 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200323023045epsmtrp14233112b63828a31209e55a44180f1d3~_zgZNx__71324713247epsmtrp1O;
        Mon, 23 Mar 2020 02:30:45 +0000 (GMT)
X-AuditID: b6c32a46-84f7f9c00000102e-61-5e781f556cfa
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        A7.D8.04158.55F187E5; Mon, 23 Mar 2020 11:30:45 +0900 (KST)
Received: from KORDO036463 (unknown [12.36.155.134]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20200323023045epsmtip1dc906dad6e779b43eb7c81110daaa27c~_zgZCnrVt1148611486epsmtip12;
        Mon, 23 Mar 2020 02:30:45 +0000 (GMT)
From:   "Seungchul Kim" <sc377.kim@samsung.com>
To:     <mchehab@kernel.org>
Cc:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sc377.kim@samsung.com>
In-Reply-To: 
Subject: [PATCH] media: v4l2-fh: define v4l2_fh struct regardless of
 condition
Date:   Mon, 23 Mar 2020 11:30:45 +0900
Message-ID: <000601d600bb$0e2d4320$2a87c960$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AdX+naBN45/Qp1YKQeqtNz/O47v16QCGcIMQAADYHZA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupik+LIzCtJLcpLzFFi42LZdljTXDdUviLO4NsTXYvLu+awWfRs2Mpq
        sWzTHyaLaXcmMDqweGxa1cnm0bdlFaPH501yAcxROTYZqYkpqUUKqXnJ+SmZeem2St7B8c7x
        pmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QNuUFMoSc0qBQgGJxcVK+nY2RfmlJakKGfnFJbZK
        qQUpOQWGhgV6xYm5xaV56XrJ+blWhgYGRqZAlQk5GYvXbWAqaOOsWNY5k7mB8TB7FyMnh4SA
        icTTae8YQWwhgR2MEjPXinYxcgHZnxgl5i+fyALhfGOU+PBrKTNMx6QbjawQib2MEh23ZkM5
        LxklVu64BFbFJqArMf/vf7C5IgISEn//fQTbxywQI7H38WugOAcHpwCvxIR/1iBhYYEAiTNd
        99lAbBYBVYnnO6aA2bwClhKfn+5kgbAFJU7OfMICMUZeYvvbOVAHKUjsOPsaapWVxNkp+5gg
        akQkZne2QdUcYJPYsNgdwnaReLBrMhOELSzx6vgWaFBISbzsb4OyyyU+PNrKBPKXhEAHo0TT
        1ztsEAljiVnP2sHuZxbQlFi/Sx/ElBBQljhyC+o0PomOw3/ZIcK8Eh1tQhCNyhKr//ZDXSMp
        sf/vCaYJjEqzkDw2C8ljs5A8MAth1wJGllWMYqkFxbnpqcVGBUbIUb2JEZwOtdx2MC4553OI
        UYCDUYmH90ZveZwQa2JZcWXuIUYJDmYlEV61GKAQb0piZVVqUX58UWlOavEhRlNguE9klhJN
        zgem6rySeENTIzMzA0tTC1MzIwslcd5N3DdjhATSE0tSs1NTC1KLYPqYODilGhgFg7ex/WIr
        d+pfvdnN/fSu89te6z5iCOq6Iiy3v6IgImpyoX6Rfp3xvA182/KFgk56xKoKZt96fed75lLN
        +Slzl8aVPvDNCMvY8Wt7nN7a3DOV57c/6pavWHchLMI2Rifk8jaHyC7hhneRR9WsEn//ihfP
        kn0x9VpyN0ff2YRZWWfeWNbqOyuxFGckGmoxFxUnAgBL1O+nnQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRmVeSWpSXmKPExsWy7bCSnG6ofEWcwbMdfBaXd81hs+jZsJXV
        YtmmP0wW0+5MYHRg8di0qpPNo2/LKkaPz5vkApijuGxSUnMyy1KL9O0SuDIWr9vAVNDGWbGs
        cyZzA+Nh9i5GTg4JAROJSTcaWbsYuTiEBHYzSnx+/gAowQGUkJRoOVwAUSMscb/lCFTNc0aJ
        vmt/WUESbAK6EvP//mcEsUUEJCT+/vsI1sssECdx75wBSFhIgEfi1Yb9jCBhTgFeiQn/rEHC
        wgJ+EtPPdLCB2CwCqhLPd0wBs3kFLCU+P93JAmELSpyc+YQFYqKeRNtGsEXMAvIS29/OYYa4
        TEFix9nXUAdYSZydso8JokZEYnZnG/MERuFZSCbNQpg0C8mkWUg6FjCyrGKUTC0ozk3PLTYs
        MMpLLdcrTswtLs1L10vOz93ECI4JLa0djCdOxB9iFOBgVOLhvdFbHifEmlhWXJl7iFGCg1lJ
        hFctBijEm5JYWZValB9fVJqTWnyIUZqDRUmcVz7/WKSQQHpiSWp2ampBahFMlomDU6qBUcUi
        80grW+j543s+1X97Kv707/5/qgseH0iu51inO2lBkLHyXtmNM19xVi2PPPuBM/FtrfquwxMc
        ridq7j+wxvu1ovHUtYsrnC3Edy0penp4ra7Lh0WWEl/l7O74RG17IMRn9/AMG2d+uE6Dho+N
        V1ym7vwPnzcI3zOe62HCX3JwT/DM8oo50kosxRmJhlrMRcWJAOSu/yOFAgAA
X-CMS-MailID: 20200323023045epcas2p12007502edd2a65efcccb00eb899d5532
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200323023045epcas2p12007502edd2a65efcccb00eb899d5532
References: <CGME20200323023045epcas2p12007502edd2a65efcccb00eb899d5532@epcas2p1.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2_fh struct define differently by CONFIG_V4L2_MEM2MEM_DEV.
If some vendors use CONFIG_V4L2_MEM2MEM_DEV by module, it can make the
mismatch of v4l2_fh sturct.

By the mismatch, the following error occurs.
===============================
[    7.533506] v4l2_mem2mem: disagrees about version of symbol video_devdata
[    7.533594] v4l2_mem2mem: Unknown symbol video_devdata (err -22)
[    7.535319] v4l2_mem2mem: disagrees about version of symbol
v4l2_event_pending
[    7.542532] v4l2_mem2mem: Unknown symbol v4l2_event_pending (err -22)
===============================

So v4l2_fh struct is modified to does not have dependency for
CONFIG_V4L2_MEM2MEM_DEV.

Signed-off-by: Seungchul Kim <sc377.kim@samsung.com>
---
 include/media/v4l2-fh.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h index
53b4dbb..b5b3e00 100644
--- a/include/media/v4l2-fh.h
+++ b/include/media/v4l2-fh.h
@@ -53,9 +53,7 @@ struct v4l2_fh {
 	unsigned int		navailable;
 	u32			sequence;
 
-#if IS_ENABLED(CONFIG_V4L2_MEM2MEM_DEV)
 	struct v4l2_m2m_ctx	*m2m_ctx;
-#endif
 };
 
 /**
--
2.7.4

