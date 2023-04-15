Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1096E3364
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 22:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbjDOULD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 16:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbjDOULB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 16:11:01 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA9135AA
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 13:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1681589457; i=ps.report@gmx.net;
        bh=Mi/0Y/IY3iN+Mcv0hGw0f91+uTQ4LLLSS75q6F0OclM=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=o+cDSWIYB5QOY9b/FFN8FhVeU21BR+ML3kQ4Ak9dlALm6yKz8nJddX9B8DPXEm+CV
         L6AemO6WmmNP3BAjMOs8dArnvPJ0pILtUKJxwDWf1JtSnIkW3MjMp+NafnD4aMHnO/
         +73FbS+CJFBO5TABwkrRzCbmMMz9g/1XSGbw7Ujs//IJK5GvCMMtqsotv71+//iubv
         ewOjhq7qT5wEHdK6YLzHuApGyEb7+/YbGpKXCrEcfK9RaW084lI/gk9Y9s74RELAQM
         xEAmi+yIGeroQS4Gs7UdHYyMEVua611iB6AAZ728u5EvKf4i2PzosOfJNv80WqqWmg
         3aZli7adI4cZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.95]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9nxt-1pkDSe2SiD-005nfe for
 <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 22:10:57 +0200
From:   Peter Seiderer <ps.report@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1 03/11] qv4l2: update qmake project file for Qt6 (core5compat module)
Date:   Sat, 15 Apr 2023 22:10:48 +0200
Message-Id: <20230415201056.31080-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230415201056.31080-1-ps.report@gmx.net>
References: <20230415201056.31080-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:1D88osFGWnEYWMeKy5CTykchfT+3C1m5W11I4kkLIU20dX7ex+K
 D2oTj8+A7tzXfwiyMKhUoexmKOV0qogJWJy3dXjJ0IxOiJ+zRohMwjGXFkmHxQu9Rv6uGZt
 WsAPzh3oBKuCapSlhr9g4OuinvdbpzpYQloIWtg6G2n1QOrT5lBYqyO6y2BpOJMXa1tGwUQ
 IBvL0lLurV2OnTxwqZzKQ==
UI-OutboundReport: notjunk:1;M01:P0:IUeSmilBzh4=;u0QtrPJuKryZI16pnOFhNLwOKM7
 wzVgkKRQ+JmSKikSIV6gVr8ljHDJKY1I3M20JXN4djNVWDGH8mY+yn730ie63377vi2LmWD9C
 O4ICJtjCfP7RfbQehzR2IIVI8aVwGPkaguFZ7pQDgNn6IDXWrqjqIxwQr5/sfr3zmYRPQcnId
 ksXix4nd6FU3Rv8mZbEZiUKUZ+fnNOOeBmrqQB9v3xrSnjXvQltttCEE54V9/st9cmIbxeekc
 B9H0aaVNogZmaV17hc9vJLiZhHVT20WDVU3TIe/zLi7ijsGcQygLuhbkaYUDe4IwLh2kMZZ/7
 3zC3Q4SVFeeCX3skhwbYVQ565A5SG3KjJDod2TYhjruqAYv+u4j3Dof7CMZubX4fw5xp1BJAs
 tRqQ38qTASuNsfy7FAqjtzOBFWxWKoYC+3IhQUvLtrOxcpF/UQAEE+T7WXOwr0UBKdmSVF9jY
 jKq35fm5pWspMOMBBwn9xIla92Hjo9vQph94nxXmjKhdVDiJFlHQJSZWckkpjmpbB0lAFSsun
 t4PCiYE2GEs4zbOAsHCja1pF1Xht7iDXoMSMSkPOO6k0gShsW4fLBrQCa1MSxRcnGLlcJ6M1T
 f1jgzBMZW5Fdts2kgRYNJQ0BIpZ91FLedJZ5Q5JM7Nj/CmQai5xpohF0UzDQLtzh5VLjPsGW3
 aCvlSxMITfPeHM0ijhV+AhmfrdurDgCVwjkW1vR4qytz+5+xBpNa8RbyormiLDP8EiXxEm7Ui
 aWHkm57rSjdLxGWRo+leU4qc1PQCmhRUxzeFwRFuqTMQ0D3cJmOBxdRXgibDF6EHy8U6UD8qp
 lKL729tZSKFnZvjRz4NrB2SXqzOrZSwFrih1vFwf5Dh4gS+3eF8mz4G/jXQMAf+aVKLgkQDfD
 /QQyqfOHgFCadD4kzzsgQytNpZCqYTrEnoqcTtgiGtSQK9i1xe2UMD6Bl/cnvJ8Ql/bl4czqO
 MFZ7egp6Q/DFml6WqDWJG4U5mik=
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MIME_BASE64_TEXT,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_PDS_PRO_TLD,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

U2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PgotLS0KIHV0
aWxzL3F2NGwyL3F2NGwyLnBybyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
CgpkaWZmIC0tZ2l0IGEvdXRpbHMvcXY0bDIvcXY0bDIucHJvIGIvdXRpbHMvcXY0bDIvcXY0bDIu
cHJvCmluZGV4IDg2OTdkNTU0Li4xZWEwNzM3NCAxMDA2NDQKLS0tIGEvdXRpbHMvcXY0bDIvcXY0
bDIucHJvCisrKyBiL3V0aWxzL3F2NGwyL3F2NGwyLnBybwpAQCAtNyw2ICs3LDcgQEAgSU5DTFVE
RVBBVEggKz0gLiAuLi9saWJ2NGwydXRpbCAuLi8uLi9saWIvaW5jbHVkZSAuLi8uLi9pbmNsdWRl
CiBDT05GSUcgKz0gZGVidWcKIAogZ3JlYXRlclRoYW4oUVRfTUFKT1JfVkVSU0lPTiwgNCk6IFFU
ICs9IHdpZGdldHMKK2dyZWF0ZXJUaGFuKFFUX01BSk9SX1ZFUlNJT04sIDUpOiBRVCArPSBjb3Jl
NWNvbXBhdAogCiAjIGFkanVzdCB0byB5b3VyIGxvY2FsIG1lc29uIGJ1aWxkIHBhdGgKIE1FU09O
X0JVSUxEX1BBVEggPSAkJFBXRC9idWlsZC1tZXNvbgotLSAKMi40MC4wCgo=
