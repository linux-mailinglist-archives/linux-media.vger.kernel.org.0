Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B29599DA30
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 01:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfHZXzP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 19:55:15 -0400
Received: from mx4.ucr.edu ([138.23.248.66]:37841 "EHLO mx4.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726020AbfHZXzO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 19:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1566863715; x=1598399715;
  h=from:to:cc:subject:date:message-id;
  bh=iCjgpBsVvJ3spaD/Rrndfb8rLJ6fzZve2WlhemnbJX0=;
  b=o1ygiZY7wAfB8jHFh26shS2ekm0xK2HXQH40Fm0l6HIA6T+mJpLHMPTO
   wxgiMKZExIXzjc8EeAQojaZ0SYVR24h6xr93lFvXPDIM92E0NsAK73Cm0
   KJTWK+JcAoQ4h8Tq43Fr0Zfne6iw20gNCGaP/WBWpwUQukzpYuaAG2uw/
   upbSAEAclp7JdJk3Mj6WIQEcwXy2wBxIx1S0OJ6pbiMrc93utvxvcEhIR
   3ECyqKnhb85y7+NtxHbbzaiDoHqzAlr05FlnerwU0UtuusFnxmHILRo9H
   0Mjr3DxcT6F9AnxStAkho6pC5zysG7e2dxPA/YuscALib1RCcOBCSpnDT
   A==;
IronPort-SDR: rEh/x9tgwm0tM22ZBgDK8GXHE6Fe3Sf1fgKDBbtmCfzoISIpHxdH95ML4IEgPXOaYt+mbzWY4k
 LHXSnewXfhyI9rrhCej2/Lrhk5OcKYmnbdk/JX6vhL4OEEERmOaUTjjDRxEF3JUtxw7KEX3gA1
 C7ajjswiwbzbW0waI3ltunlpt/r2xpCpNOeQO0QLe2BVwYz1gGDHN8kKF6m8FbHByhotPPj+8I
 3Lix2wLpD2tuIYEGadLdex5uWzUWIsoP/Ajki61DhxMpLVrefPp769L9r2nlyyhi8vyMBR5tas
 pec=
IronPort-PHdr: =?us-ascii?q?9a23=3AEt251RTWS1IRe8T9KVv63m+CL9psv+yvbD5Q0Y?=
 =?us-ascii?q?Iujvd0So/mwa69bRaN2/xhgRfzUJnB7Loc0qyK6vqmADFdqsze+Fk5M7V0Hy?=
 =?us-ascii?q?cfjssXmwFySOWkMmbcaMDQUiohAc5ZX0Vk9XzoeWJcGcL5ekGA6ibqtW1aFR?=
 =?us-ascii?q?rwLxd6KfroEYDOkcu3y/qy+5rOaAlUmTaxe7x/IAiooQnLq8UbgYtvJqkvxh?=
 =?us-ascii?q?bLv3BFZ/lYyWR0KFyJgh3y/N2w/Jlt8yRRv/Iu6ctNWrjkcqo7ULJVEi0oP3?=
 =?us-ascii?q?g668P3uxbDSxCP5mYHXWUNjhVIGQnF4wrkUZr3ryD3q/By2CiePc3xULA0RT?=
 =?us-ascii?q?Gv5LplRRP0lCsKMSMy/XrJgcJskq1UvBOhpwR+w4HKZoGVKOF+db7Zcd8DWG?=
 =?us-ascii?q?ZNQtpdWylHD4O5bosPFPEBPeder4nyulAAswKwDhSiBOPu1DBIgmL51rA+3+?=
 =?us-ascii?q?kvDQ3K2QotFM8MvnvJttX4LKccX/6owqfGzjvNaOhb1Svh5IXSbhwsu+2AUa?=
 =?us-ascii?q?52fMHMyUcvDQTFjlCIpIPnPjOU1+QNs3Wc7+F9Uu+ui28mqwFrrTiu2ssglo?=
 =?us-ascii?q?fEi5kIyl/Y7yV12pg6KsClSENiZ9OvDZhetzmCOodoXs8vR3tktSU6x7Ecp5?=
 =?us-ascii?q?K3YSgHxI46yxPbb/GLa5WE7xPnWeqLPzt1inJodKihixuz60StyOLxW8+p21?=
 =?us-ascii?q?hQtCVFiMPDtnUV2hzW7ciIV+Vy81+62TaKywDT8uZEIV0olabDK54u3Lowlp?=
 =?us-ascii?q?0LvETGBCD2mUH2gLaOdkUr5+Sk8urnbqjiq5KYLYN0hQb+MqMhmsy7H+s0KB?=
 =?us-ascii?q?QBX2+e+eik1b3j+1P2QKlSg/EojqXUtIrWKMcbq6KjHQNZz4Yu5wyiAzqi1N?=
 =?us-ascii?q?kUhXwHI0hEeBKDgYjpIVbOIPXgAPa/glWskC1kx/HaMrH9DJjANWXDn6v7fb?=
 =?us-ascii?q?pn9UFT1RczwchF551IErEBPO7zWkjpudzcDx85NRG0wun+BNV4yIwRRGOPDb?=
 =?us-ascii?q?WCPaPMvl+H+PgvL/OPZIALojb9LeYq5/r0gX8+g18dcvrh84EQbSWJH+ZmPk?=
 =?us-ascii?q?LRNWv+gt4AST9Rlhc1VqrnhEDUAm0bXGq7Q69pvmJzM4mhF4qWA9/1jQ=3D?=
 =?us-ascii?q?=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GhIAAzcWRdgMfXVdFlHgEGBwaBZ4M?=
 =?us-ascii?q?FU0wQh2uFMoZdAQaDQCiHNxhxhXiDCIFkhTsBCAEBAQwBARsSAgEBgQSDO4J?=
 =?us-ascii?q?qIzgTAgoBAQUBAQEBAQYEAQECEAEBCQ0JCCeFNgyCOimBTF81CxYVUlY/AQU?=
 =?us-ascii?q?BNSI5gkcBgXYUBZ4cgQM8jCMzg3eEZAEIDIFJCQEIgSKHGYRZgRCBB4Nuc4J?=
 =?us-ascii?q?IgUWDVoJEBIEuAQEBlD+VeQEGAgGCDBSBcIR6jU0ngx+BDokXiwoBLYQFnWq?=
 =?us-ascii?q?DcgIKBwYPIYFGgXpNJYFsCoFECYJxhgSIKR8zgQiLeoJSAQ?=
X-IPAS-Result: =?us-ascii?q?A2GhIAAzcWRdgMfXVdFlHgEGBwaBZ4MFU0wQh2uFMoZdA?=
 =?us-ascii?q?QaDQCiHNxhxhXiDCIFkhTsBCAEBAQwBARsSAgEBgQSDO4JqIzgTAgoBAQUBA?=
 =?us-ascii?q?QEBAQYEAQECEAEBCQ0JCCeFNgyCOimBTF81CxYVUlY/AQUBNSI5gkcBgXYUB?=
 =?us-ascii?q?Z4cgQM8jCMzg3eEZAEIDIFJCQEIgSKHGYRZgRCBB4Nuc4JIgUWDVoJEBIEuA?=
 =?us-ascii?q?QEBlD+VeQEGAgGCDBSBcIR6jU0ngx+BDokXiwoBLYQFnWqDcgIKBwYPIYFGg?=
 =?us-ascii?q?XpNJYFsCoFECYJxhgSIKR8zgQiLeoJSAQ?=
X-IronPort-AV: E=Sophos;i="5.64,435,1559545200"; 
   d="scan'208";a="73200622"
Received: from mail-pg1-f199.google.com ([209.85.215.199])
  by smtpmx4.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2019 16:54:58 -0700
Received: by mail-pg1-f199.google.com with SMTP id h3so10658394pgc.19
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2019 16:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0xmb65xr0CBfxuC3uWVpQkR2Ek+p0pitIFWU9dtWX9A=;
        b=uOH7DfZbu16lOrqETt8WQz5qsUWK+Ewk4JAqTDcsLEcsYS/xTo7qcIy6Y8g7MKrx+F
         y7ufvvQ04mNlUIvcAw2GEQ7WgJM0ogg2HVRYF6AkpxSk0G0bcV7e8RuSzoBT1WIctsNy
         7Tq2Fc6p7a5cESsc1p96fiLHtVX5UsqMQzOlRO6Zws3iGPkbxSVeZx1COhfwyt9Yp94Z
         UUOO5v66rq7GRuuNCnFzE8rLl/ABSJ2Ev/j9deFP2R/1kwJ14Rqbuks1eo35JdzHc52G
         beUBDxgprRT6wYtKPUxsz3IsOJ/GKDXTJYsgZcd/NvxR6BiQmmqq4eJAemLJSTrsew5e
         CfBw==
X-Gm-Message-State: APjAAAWT7szBAXVDTBS/2NfI1Ic6SfLXfR9bev93kb8So79T/cNA3/sJ
        1NHg2ZNNVPNXt7LuUlR0+O+Pp4VQQdNlNdeuGD+uNteWbel8NodyT1pTVyK+vc7/s/5MlvLIRat
        X/nATLIAz7Sk9XErpa63ckO1W
X-Received: by 2002:a63:3805:: with SMTP id f5mr18549989pga.272.1566863696850;
        Mon, 26 Aug 2019 16:54:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqws6Si3A54Js/iWt7UYfiNmKzerD0mxC1IVR7kF2Zm1xDIh3F0K5ILCCloPy2Y9vz/RjxxDnA==
X-Received: by 2002:a63:3805:: with SMTP id f5mr18549967pga.272.1566863696509;
        Mon, 26 Aug 2019 16:54:56 -0700 (PDT)
Received: from Yizhuo.cs.ucr.edu (yizhuo.cs.ucr.edu. [169.235.26.74])
        by smtp.googlemail.com with ESMTPSA id z25sm5562854pfa.91.2019.08.26.16.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2019 16:54:55 -0700 (PDT)
From:   Yizhuo <yzhai003@ucr.edu>
Cc:     csong@cs.ucr.edu, zhiyunq@cs.ucr.edu, Yizhuo <yzhai003@ucr.edu>,
        Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [media] pvrusb2: qctrl.flag will be uninitlaized if  cx2341x_ctrl_query() returns error code
Date:   Mon, 26 Aug 2019 16:55:28 -0700
Message-Id: <20190826235528.9923-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Inside function ctrl_cx2341x_getv4lflags(), qctrl.flag
will be uninitlaized if cx2341x_ctrl_query() returns -EINVAL.
However, it will be used in the later if statement, which is
potentially unsafe.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index ad5b25b89699..66a34fb9e6b2 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -790,7 +790,7 @@ static int ctrl_cx2341x_set(struct pvr2_ctrl *cptr,int m,int v)
 
 static unsigned int ctrl_cx2341x_getv4lflags(struct pvr2_ctrl *cptr)
 {
-	struct v4l2_queryctrl qctrl;
+	struct v4l2_queryctrl qctrl = {};
 	struct pvr2_ctl_info *info;
 	qctrl.id = cptr->info->v4l_id;
 	cx2341x_ctrl_query(&cptr->hdw->enc_ctl_state,&qctrl);
-- 
2.17.1

