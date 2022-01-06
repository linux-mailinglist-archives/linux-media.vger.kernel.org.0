Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4596C486D5B
	for <lists+linux-media@lfdr.de>; Thu,  6 Jan 2022 23:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245208AbiAFWsP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jan 2022 17:48:15 -0500
Received: from mout.gmx.net ([212.227.17.22]:35047 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245167AbiAFWsP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jan 2022 17:48:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641509290;
        bh=2YuChdkLlpiNoE8Q7Y7yh3Y+E/O33DNnmQ7FR8fwyyk=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=gU3mXs723sCZr9GbHOyCdL9qPwowY2zP4QUVurSxR0Voj0GfIzRTRMeqJ2mKoIshW
         shMwRGRd0P36qcfTi8s2kuX6WG7tcb8d8h5aI/1gGPOx+KipSgnI/D14ajej5phW5l
         Hr3qaEKL899VsKhJczrIQnSxvs/nvrqLY+44vK/M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bap68.server.lan [172.19.172.68]) (via HTTP); Thu, 6 Jan 2022
 23:48:10 +0100
MIME-Version: 1.0
Message-ID: <trinity-597c1df9-5f5a-4de5-9a5f-82b0fc8069c3-1641509290301@3c-app-gmx-bap68>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 0/3] media: si2157: fix bandwidth set/get, add DVB-C Annex C
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 6 Jan 2022 23:48:10 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:piEMFPOCDH4sUydQdqbwVrdDpgqC3LThO7nIWOVEIT/lqvQCaUdbcJr5CbAKuH/kRHhmD
 3/Mj2y0ylKyFSjJbVzpCjwpCuBiu5yN5lR1h600BojR0X7z7XSBB3Jk2iZSrG66RwiSHHJU8lOcg
 4wuJDdH/GXE6EJXmMIIgjBBLZwZ32vEurYQ+MXwfaQ3poana9lfOI1LMglesl/FS8j5KXJl37p1v
 GD6RdUyAdSpObE6x/aWdE1DlCVfazusmEajWBUVetHCv6eYKkO5irD8Kq5+qpnsfJC8g2LOBqeoM
 Oo=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nfZDiPq7fPA=:QGghBaRc3vAjg1XVug5GAm
 fvx6wQc+ZeOj8cM2uL1VH3Jj6Wq2OPdUi7IC6xlvsEvjl2OEFt/krSFvnQNocUxPq/jr7SUdp
 yM6dMdhjxQebyi+E2fo9NcSe5C/hEVRzgQB/LEKXoI1ovq08nZSRYlJzLpYZECBuqhp0l9L0D
 jg2aLGJZs6mKVPUYAIMwQQadOLgma+vQQ5lRDjlCxZegqIFOuYx0aGKWQNmJ4Fx8xYVj4Cg6I
 NgaVxZsVwBC82WShocVs2ia4ckXCYAS61xP8pLvYiZjqukg5PjJVs/7FFKWcV4eeydxEE3ZDU
 Bt7FUnqfskYl/m4cP/1rCXgxNob9Lmbi0uNUWchAV4fcpWDux6L2lVUiSKDIA3MHd/q3p4WnY
 Q+3NcWqrOisoQz7JjwMu4yTo5+7fqYc99Ha1evVtAGkBaBJDu8QU67ky0iQYse3vPnyvn7N92
 /zSgO3nNkWj3FrsJieHkxJzNYj0pekcFCrVqd5C69FE5kSjogMM2Kf7NYxbxesj1R62tOhDYa
 xGRZn68gy/tLForccBrDHj/zPZGnXG7hr+piDgTcmovQ2Min5pTq/+juDRAyYYQiXDMiM6xzS
 jlYRvEqpbyUQjf8gV8EO62JtA4i3EQRKRXOGqiaEH9Lt20fW/u7aILVRMyk6SBFYtCMR4N8Mg
 Ol8b2A39cZto4W/HypYfOBWmC2Ydld2W/nSXBAGedQwbnAm2ZtQ4DhxLvE6pbuZz/YgTwy29U
 8R6EreDRw2sGxkfF234lKcyqHUiIsSDTeyv6P0xKMen+4X01BzUPmkiT0+HBtiNKLD/YM6hL0
 MUyQjXc
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The si2157 driver was recently broken so that trying to tune to channels
with a bandwidth of less than 7MHz always resulted in an error. Getting
the bandwidth after digital tuning has always returned erroneous values.
Furthermore, tune requests for DVB-C Annex C were rejected with -EINVAL,
although it should work with the same settings as for DVB-C Annex A.

The following three patches address all these issues.

With all three patches applied, the driver has been verified with a
Si2157-A30 to successfully:

- accept tune requests for DVB-C Annex A/B/C, DVB-T/T2 and ISDB-T
- receive actual 8MHz DVB-C Annex A, DVB-T and DVB-T2 signals

I do not have any DVB-C Annex B/C nor ISDB-T signals available.

Tested-by: Robert Schlabbach <robert_s@gmx.net>
Signed-off-by: Robert Schlabbach <robert_s@gmx.net>
