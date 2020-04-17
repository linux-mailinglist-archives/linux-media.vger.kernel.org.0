Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0141AD49E
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 04:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729377AbgDQCwN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 22:52:13 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:25105 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728715AbgDQCwM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 22:52:12 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20200417025208epoutp02531bf914e3137d3d08b94ad5c065d118~Ge7NQ1YJw1284312843epoutp02T
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2020 02:52:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20200417025208epoutp02531bf914e3137d3d08b94ad5c065d118~Ge7NQ1YJw1284312843epoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1587091928;
        bh=uHjnAsWICGbvd2UvAeIMZ3j2WHQsGzQDZG6azlJmziU=;
        h=From:To:Cc:Subject:Date:References:From;
        b=JhOQXdgurggunbQNvEQMf+Z9nurqXVNpY1/hTjRmxz6jxvb8SlkmNyyAnPgc3bBmq
         qEqxMgaDZ4dwEIoa1+f0naKlf1qy5h+9fGuFqwoguYt38xB/trlTMFW06KZvqYhJqT
         +Yw1HSvhzvUDg645/6m1+bz28rrHJiXjLSxIDLcM=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20200417025208epcas2p38db948db38a6f7cdee1d09cf57c00699~Ge7MpVHTB3158331583epcas2p3i;
        Fri, 17 Apr 2020 02:52:08 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.188]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 493LGY6rsgzMqYkc; Fri, 17 Apr
        2020 02:52:05 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        5B.EA.04393.5D9199E5; Fri, 17 Apr 2020 11:52:05 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20200417025205epcas2p46d33e64f2de49041d2ca68ecc98fc83e~Ge7J_VXhG3180931809epcas2p4L;
        Fri, 17 Apr 2020 02:52:05 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200417025205epsmtrp11d28438d8dbd250622344386361fc7c6~Ge7J9d1lx3164331643epsmtrp1N;
        Fri, 17 Apr 2020 02:52:05 +0000 (GMT)
X-AuditID: b6c32a47-667ff70000001129-a4-5e9919d584f4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        7D.32.04158.5D9199E5; Fri, 17 Apr 2020 11:52:05 +0900 (KST)
Received: from coldbrew.dsn.sec.samsung.com (unknown [12.36.155.201]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200417025205epsmtip10f68d62d315bad4db18b60a74fc0217f~Ge7JytNNp0040800408epsmtip1i;
        Fri, 17 Apr 2020 02:52:05 +0000 (GMT)
From:   sy0816.kang@samsung.com
To:     mchehab@kernel.org
Cc:     sy0816.kang@samsung.com, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l2-compat-ioctl32.c: copy reserved2 field in
 get_v4l2_buffer32
Date:   Fri, 17 Apr 2020 11:45:23 +0900
Message-Id: <20200417024543.66785-1-sy0816.kang@samsung.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm2znbjpfFcZW9rZudkNLSttn0KNqFxIZZSPUjJFsHPThpN3a2
        bhCZotXKtIumU2skiIxCWybLrMxC0R+rCLtBSHbBlKQ0o7xEZzuL/Pd8z/s83/O97/cSmNwp
        URCFJhtrNTEGShKKtz+OoeMGFtfuVxZf0tCzF3ukdElji4R+XvsOp1901Evoc613xHSTZ0ZE
        D31Kom97qrDNhHZ66iLSetxnJNoxn0+qfdhwQ6o93+ZG2gnPcm3/5IQ0W5pjSNWzTD5rjWJN
        eeb8QlNBGrV9t26rTpOoVMWpkukkKsrEGNk0Kj0rOy6j0MA/ioo6xBjsPJXNcBy1fmOq1Wy3
        sVF6M2dLo1hLvsGiUlniOcbI2U0F8XlmY4pKqVRreOUBg/7K4DPc8oo44nszKCpCXqkDhRBA
        bgBn+W/cgUIJOelFcN3Rh4TDOIKqD3UBlZz8ieDV073/HPdqm0WC6D4Cb39j0D6FoL7nC+5X
        SchlMN5VI/HjBWQkDLWPBEQYOY2g2dERKMwnc6CuqS6AcTIahia/if1YRqbCo/ZRkRC3AkpH
        vEjgI6Cv9mMgAOP5kjt1mP9SIDsl8Pr12aAhHar7BpGA58NIb1uwUwV8qSgL4hNQPTEhFsyV
        CIZdvWKhkADOz6d4M8EnxEBLx3o/BHIVPHkbzJ0Hpx/PSgVaBqfL5AKMhtZxtXDHEvj69QUS
        aC1UVFLCDHPhwc16vBKtcM7pxTmnF+f/VBfC3CiStXDGApZTWxLm/qkHBfYydpsXtfuyuhFJ
        ICpcdmBTzX65mDnEHTV2IyAwaoFsnoanZPnM0WOs1ayz2g0s1400/KgvYIqFeWZ+y002nUqj
        TkxUJmtoTaKaphbJPGFv9snJAsbGHmRZC2v95xMRIYoihItxteJcWFpm15oMeu29q2PGl7u+
        15SWVl0e2/GSqLp1Mo65W63bOrO5vHvUt2tlfbh+T3jnBleRO360Z2zd0iTX4aEGRj07nJnj
        8f5pbA7t3/JdzD40ONsyrddGO/edcazeOfB+rfRXWHrXBdXwj5RvruI1Zbkn8hZWRFSuO17e
        TOGcnlHFYlaO+QviXd1zrQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsWy7bCSnO5VyZlxBi8/cln8nXSM3aJ58Xo2
        i4sz77JYXN41h82iZ8NWVotlm/4wWTx6am6xedNUZgcOj9+/JjF6bFrVyebx7tw5do/9c9ew
        e/RtWcXo8XmTnMepr5/ZA9ijuGxSUnMyy1KL9O0SuDKm37/AUnCdo+LczftMDYw72LsYOTkk
        BEwkds9cwdTFyMUhJLCbUeLI3YUsXYwcQAlpif0bcyFqhCXutxxhhaj5wSjxZGkbI0iCTUBW
        4tOBGWwgtoiAmMSjba9YQIqYBRqZJK5u+QCWEBaIkNjxag+YzSKgKvHo6wdWEJtXwEbi4LbX
        TBAb5CVaX+1ghIgLSpyc+YQFxGYGijdvnc08gZFvFpLULCSpBYxMqxglUwuKc9Nziw0LjPJS
        y/WKE3OLS/PS9ZLzczcxgkNYS2sH44kT8YcYBTgYlXh4E+xnxAmxJpYVV+YeYpTgYFYS4eUz
        BQrxpiRWVqUW5ccXleakFh9ilOZgURLnlc8/FikkkJ5YkpqdmlqQWgSTZeLglGpg1LC9tLbS
        pznbUHg30w8+z8tVLQYCpx5vmmjGXxA/3U7T/P69nzu8nNMPRjhcDGUonLB8Z9P539lhFa5S
        t+sOP7t6v+YRYxxDoGD21bq4tATd9bcmvTRSEvea6s7x0fu/8KsdPY4TixOeWWut/L62fWt3
        lOvkh+913+tcm+zsXbBXyMRMVLVdiaU4I9FQi7moOBEANh8L710CAAA=
X-CMS-MailID: 20200417025205epcas2p46d33e64f2de49041d2ca68ecc98fc83e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200417025205epcas2p46d33e64f2de49041d2ca68ecc98fc83e
References: <CGME20200417025205epcas2p46d33e64f2de49041d2ca68ecc98fc83e@epcas2p4.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sunyoung Kang <sy0816.kang@samsung.com>

get_v4l2_buffer32() didn't copy reserved2 field from userspace to driver.
So the reserved2 value is not received through compat-ioctl32 in driver.
This patch copy reserved2 field of v4l2_buffer in get_v4l2_buffer32().

Signed-off-by: Sunyoung Kang <sy0816.kang@samsung.com>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index a99e82ec9ab6..e9b2b9c0ec9a 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -665,6 +665,7 @@ static int get_v4l2_buffer32(struct v4l2_buffer __user *p64,
 	if (V4L2_TYPE_IS_OUTPUT(type))
 		if (assign_in_user(&p64->bytesused, &p32->bytesused) ||
 		    assign_in_user(&p64->field, &p32->field) ||
+		    assign_in_user(&p64->reserved2, &p32->reserved2) ||
 		    assign_in_user(&p64->timestamp.tv_sec,
 				   &p32->timestamp.tv_sec) ||
 		    assign_in_user(&p64->timestamp.tv_usec,
-- 
2.20.1

