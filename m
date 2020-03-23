Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C84718EDD3
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 03:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgCWCGK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Mar 2020 22:06:10 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:50979 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbgCWCGJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Mar 2020 22:06:09 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200323020607epoutp04f464dd280add20051403b8c66c5ee215~_zK5F00S12087720877epoutp04V
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 02:06:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200323020607epoutp04f464dd280add20051403b8c66c5ee215~_zK5F00S12087720877epoutp04V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1584929167;
        bh=PBdhHhXowl9TplAif7mn+5bR6K1fB0LE7KtzAtp1XqA=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=qantpfHHu715FhY7bLTnUUGXaB8Xl4m6w501w4TE7jlqJvzM6YBw9gb0U+jS5eD+c
         fnJ6STrG6Qn84OFnf4gZHJipvexTekqWP396lRgHALHuP8618OKb9tmYK+WOB29i2F
         BvTGy0nsQz61tNZG8yuE+A1sagwYcEuXQNA6Az8o=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20200323020607epcas2p1b117d73c76037f393935d8820ab8bce1~_zK41oFl_0095500955epcas2p1f;
        Mon, 23 Mar 2020 02:06:07 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.189]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 48lyR10BYHzMqYkv; Mon, 23 Mar
        2020 02:06:05 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        08.A3.04024.A89187E5; Mon, 23 Mar 2020 11:06:03 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20200323020602epcas2p2ea3273f48a5df7c8c17b3db0618c83e1~_zK0MgPHh0516305163epcas2p2B;
        Mon, 23 Mar 2020 02:06:02 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200323020602epsmtrp24fc0d78880fdbc33316d6195586825a5~_zK0GI9eA0523705237epsmtrp2K;
        Mon, 23 Mar 2020 02:06:02 +0000 (GMT)
X-AuditID: b6c32a48-5c1ff70000000fb8-7a-5e78198ac180
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        6C.66.04158.A89187E5; Mon, 23 Mar 2020 11:06:02 +0900 (KST)
Received: from KORDO036463 (unknown [12.36.155.134]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20200323020602epsmtip28dbbe7aa1f729e5c95814943fba1dafc~_zKz-O7qd2363123631epsmtip2O;
        Mon, 23 Mar 2020 02:06:02 +0000 (GMT)
From:   "Seungchul Kim" <sc377.kim@samsung.com>
To:     <mchehab@kernel.org>
Cc:     <linux-media@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <sc377.kim@samsung.com>
In-Reply-To: 
Subject: [PATCH] media: v4l2-fh: define v4l2_fh struct regardless of
 condition
Date:   Mon, 23 Mar 2020 11:06:02 +0900
Message-ID: <000501d600b7$9a4f45f0$ceedd1d0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AdX+naBN45/Qp1YKQeqtNz/O47v16QCGcIMQ
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplk+LIzCtJLcpLzFFi42LZdljTXLdbsiLO4FeARc+GrawWyzb9YbKY
        dmcCowOzx6ZVnWwefVtWMXp83iQXwByVY5ORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGto
        aWGupJCXmJtqq+TiE6DrlpkDtEdJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2Bo
        WKBXnJhbXJqXrpecn2tlaGBgZApUmZCTsXjdBqaCNs6KZZ0zmRsYD7N3MXJySAiYSLxfOJmt
        i5GLQ0hgB6PEuml/mCCcT4wS2ydtZoRwvjFKtE/7xALTsm3pC1aIxF5GiZ2bNjNDOC8ZJTbM
        2sUEUsUmoCsx/+9/RhBbREBC4u+/j0ALOTiYBaIlmlriQUxOAV6JCf+sQSqEBQIkznTdZwOx
        WQRUJdafewq2i1fAUmL/m342CFtQ4uTMJ2BxZgF5ie1v5zBD3KMgsePsa6hNRhKnnrYxQ9SI
        SMzubAM7TULgAJtEw5tVUA+4SByY8BeqWVji1fEt0LCQkvj8bi8bhF0u8eHRViaI5g5Giaav
        d6ASxhKznrUzQvyiKbF+lz6IKSGgLHHkFtRtfBIdh/+yQ4R5JTrahCAalSVW/+2H2iopsf/v
        CaYJjEqzkHw2C8lns5B8MAth1wJGllWMYqkFxbnpqcVGBSbIcb2JEZwEtTx2MB4453OIUYCD
        UYmH90ZveZwQa2JZcWXuIUYJDmYlEV61GKAQb0piZVVqUX58UWlOavEhRlNgwE9klhJNzgcm
        6LySeENTIzMzA0tTC1MzIwslcd5N3DdjhATSE0tSs1NTC1KLYPqYODilGhgnHGdYzdtZObuw
        rGLXuvV6vEaCM4yebAtc5JXM95Hl99U061DHE6ufHW39knqg9Lt99GbOsJtvts2u2lDDXZ1u
        cEI4+3rrzEsLs96yPTx+/UTn/ab0GfGyf7/qrsw828jazSIRMSX0ffRCL4n95VEPd8veaCsR
        /bt2Q3uw3cZXjzS8b343WSGmxFKckWioxVxUnAgAh75jDpgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHLMWRmVeSWpSXmKPExsWy7bCSvG6XZEWcwbv5YhY9G7ayWizb9IfJ
        YtqdCYwOzB6bVnWyefRtWcXo8XmTXABzFJdNSmpOZllqkb5dAlfG4nUbmAraOCuWdc5kbmA8
        zN7FyMkhIWAisW3pC9YuRi4OIYHdjBJdaw8wdzFyACUkJVoOF0DUCEvcbzkCVfOcUeLx2cds
        IAk2AV2J+X//M4LYIgISEn//fQQbyiwQK/Hj011WEFtIgEfi1Yb9jCAzOQV4JSb8swYJCwv4
        SUw/0wE2hkVAVWL9uacsIDavgKXE/jf9bBC2oMTJmU9YQFqZBfQk2jYyQkyXl9j+dg4zxGkK
        EjvOvoa6wEji1NM2ZogaEYnZnW3MExiFZyGZNAth0iwkk2Yh6VjAyLKKUTK1oDg3PbfYsMAo
        L7Vcrzgxt7g0L10vOT93EyM4FrS0djCeOBF/iFGAg1GJh/dGb3mcEGtiWXFl7iFGCQ5mJRFe
        tRigEG9KYmVValF+fFFpTmrxIUZpDhYlcV75/GORQgLpiSWp2ampBalFMFkmDk6pBkZ+vkOC
        E154Hz/jevPOjZbr1+IOdE0/mH8r4dbllFkHepuTMn7m6QaVNE6KmaLUUsF9OrOp1epZv6Wl
        9Lpbb+r9W3JO7uP2ST/4o6TDI+2fQH1w8LqCd/1ef2uMf0wsNW161OvVZ7rxT1W2XP6hdauX
        GnvvmrY29SsD2wVxh/ULjx789/3G7DglluKMREMt5qLiRADu93hTgQIAAA==
X-CMS-MailID: 20200323020602epcas2p2ea3273f48a5df7c8c17b3db0618c83e1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200323020602epcas2p2ea3273f48a5df7c8c17b3db0618c83e1
References: <CGME20200323020602epcas2p2ea3273f48a5df7c8c17b3db0618c83e1@epcas2p2.samsung.com>
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

