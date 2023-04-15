Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF8616E3362
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 22:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbjDOULB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 16:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjDOULA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 16:11:00 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 057F0358C
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 13:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1681589457; i=ps.report@gmx.net;
        bh=da3N34QHsJeDnuEYf8KQ3UM5GlyFmh7SYmZX2qivMso=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=JeatWW8aiXCM1tvnJTRcc4nMEcZ9CYaIJmZBtoPLbPOdRg/AkjCWJiVa7mT2jvbxc
         3qX+WamH5jEpByBxbxssScwSg+uH0k2ZSKqt90hg3VzoxoIYn+bpuI5GMGtKKDmTUJ
         qD8+DTuWiOD7c0cYdnbiWMzbx5OZ7RW4JCDQaYxAUeuk7Jga1J98Ry5ntGxfSz9k7+
         B2rlbrh8rb+M4RKPz8Q222sTbfwoOVtPPCrcgq5OWtaC6CPwPVzXvHreTOuPfQJ7Ks
         A1CSTRqDimaH/XNy+D4c6aQPrxEvU2SChEKeaRJSg6SDWK+44Dq1NrcDOvU1rwbun3
         K4239DQczzSBQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.95]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mz9Ux-1qZZh40l4V-00wG8K for
 <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 22:10:57 +0200
From:   Peter Seiderer <ps.report@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1 01/11] qv4l2: remove leagcy alsa_stream.h include (ENABLE_ALSA protected)
Date:   Sat, 15 Apr 2023 22:10:46 +0200
Message-Id: <20230415201056.31080-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:QI4Ht54NO/nYu0rrgAyU462YWUW4VYeYyNdHwEK9U8vmsT8A+Fv
 pLFddyR0pY27IBB2jhmUvc75TvQVcTel+ZnGs/DGDMbaH2V89LbrMZo3+sWMlokNi6xZQ7S
 a5pD1jRD+bxcUnruY/Ll+qTC2g6ZX1/tdy0LF+gvUMzavusWQ5I0ptO6XpKFkJiZZhbv/f2
 mbkTKbhKqbGYxESZpJ6WQ==
UI-OutboundReport: notjunk:1;M01:P0:kl6vmwmrXb8=;ro5yblZs/+HB/K547wko2h84Sl6
 lnwjRmMr5R4MjoKzZjzXsj9W5SJQk3/mvgLZrH3CN3v1XiC2y2LQg/4pqDWazyytVuPxE7tQ6
 AFHFMNq/xI2PWbX+SUWrBhVu0EXEr4cdYvU1A80ww09Cukz+hEeXnW+5mlkEatIqUOs71rBeE
 BpfvzK1FefLQeDz3ghClyEYqWlrHR1mQwsOr4NnSeLurlA42r3NiSKpCJuCENaBBB/Xved3yK
 m/c4EX+7BVh8LfaBazKKgGwv0TY2aOMUAADJkrqA/lu79lZ7a7zv7NFojHAFYK1PrtDJ9xNxI
 MgYW11uXITM+kfGw0ur+V48OE+l22ZiyPrVD71k2Pb4PuYXiGCmnBe1DP+8Gf3vue3kJH3m5A
 ah18jNyFFOAZmV5FMZ/bLCPvuZHUNT6Q3fBjMukOC+cm/KEPC8TUzClRiBz/GCpBJRyW8rplg
 Ud0rQU/fWiBhQfGPFEEaJi1IrIsJW+bjHxSu3Br+lJWkzDvbZaLlTCBCMSr3+kYRZFoSiRitO
 LfYUlMQa36gjkvfkAJwQ85y8gupG914vq5hlHMPah8oADGaHJ9cp+j8aT4eA9e3ezz1lQ6c3Q
 c4QkFmv5738J5lzbrNG719nnxIRVYx2yo4uyAm6lBLsIX7Dgg9RFQ0+cF4Nz64RUVku9iy8wB
 bXmBzFFGnZCjrM7Tj/Xc09uK2XcP9jhPIB21f877ERmdZWTBNxFnl1Lg1DYk3/+IFCSfty//k
 jBSZvpfD6J608WPveMVTGGw4g6Ec648ElkC8PuzE2V2yRH8X0u1rCaRzx+kzWVPBho4LTZDxH
 qc83et43ffo14MROkwa/nGIJR78faHctEP59LZcY2zfOnsotGNiqHzKuXPCHFNV+pc3FxXoyW
 8Xr4SkLNcxxWArUvWX5Ga378r0F7bHVNq0Wbogj4DDPLjPg5nXHZi4ADFBoT0JKn3OBIXZ5d+
 p6OQAeuHkLGBdcZvUWMKgGwP1G0=
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MIME_BASE64_TEXT,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

UmVtb3ZlIGxlYWdjeSBhbHNhX3N0cmVhbS5oIGluY2x1ZGUgcHJvdGVjdGVkIGJ5IGxlZ2FjeS91
bmtub3duCicjaWZkZWYgRU5BQkxFX0FMU0EnLgoKU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVy
ZXIgPHBzLnJlcG9ydEBnbXgubmV0PgotLS0KIHV0aWxzL3F2NGwyL3F2NGwyLmNwcCB8IDYgLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS91dGlscy9x
djRsMi9xdjRsMi5jcHAgYi91dGlscy9xdjRsMi9xdjRsMi5jcHAKaW5kZXggNGNiYWE5OGUuLmVh
MWFjMjAxIDEwMDY0NAotLS0gYS91dGlscy9xdjRsMi9xdjRsMi5jcHAKKysrIGIvdXRpbHMvcXY0
bDIvcXY0bDIuY3BwCkBAIC0xNywxMiArMTcsNiBAQAogICogRm91bmRhdGlvbiwgSW5jLiwgNTEg
RnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAgMDIxMTAtMTMwMSwgVVNB
LgogICovCiAKLSNpZmRlZiBFTkFCTEVfQUxTQQotZXh0ZXJuICJDIiB7Ci0jaW5jbHVkZSAiYWxz
YV9zdHJlYW0uaCIKLX0KLSNlbmRpZgotCiAjaW5jbHVkZSA8UVRvb2xCYXI+CiAjaW5jbHVkZSA8
UVRvb2xCdXR0b24+CiAjaW5jbHVkZSA8UU1lbnVCYXI+Ci0tIAoyLjQwLjAKCg==
