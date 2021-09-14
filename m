Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7781940AD5C
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 14:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232864AbhINMT7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 08:19:59 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:54812 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232341AbhINMT6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 08:19:58 -0400
Received: from shw-obgw-4003a.ext.cloudfilter.net ([10.228.9.183])
        by cmsmtp with ESMTP
        id PpLxmzRdzps7PQ7HgmGPUL; Tue, 14 Sep 2021 12:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1631621492; bh=xUAzxfQx+wO6pxV1q+XZKYuxn4tdBHoaUz+moPh7zh0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Z5DWZnUbnOQK0iq9BFKrda4vImty/QWNxDkYhgp6RtJr+uyT5DFXpxrX+GeT0k9Tm
         nUy2CBHS3HxZj3SevYlq7sXsv63nkaGglffHhQ21hRK01AxnpdM29hyOWPQhQojt/0
         El/+p3Ue4Kso4XE9U6dxuNFGaQomAgGUjUD9G+VJ4JQKbG010x9HGirj9X+6dIkDhk
         0mLfnWDpls91rFygKbwD68og/EHzcYmJ0R0Fyh7VmzDC2fVrUrMuyezDJf5MPoEkVe
         IE6Cw7ZZS6scu3E4EhL0WWgX+KGEccSrmPDi7Ins64o/zgYU+by4IhEt7NNHYcHWcH
         stULjw/FS7Gtg==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id Q7Hdmcu7dcHSBQ7Hgmpv0M; Tue, 14 Sep 2021 12:11:32 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=I4EG+Psg c=1 sm=1 tr=0 ts=61409174
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=lxccLaQHShOd5w9k618A:9 a=xoixtaejIAglAdD4eWDR:22 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 02/11] edid-decode: ignore dSYM
Date:   Tue, 14 Sep 2021 05:11:20 -0700
Message-Id: <20210914121129.51451-3-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210914121129.51451-1-joevt@shaw.ca>
References: <20210914121129.51451-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPkXWbOOfK4A6cN+DrysUdAbwD5jgWaQVFYksWb+cv9aJ/80adDtYY7J5G2KhTBRwtO9HLBzToQq3Rex2r3ZZWgbrO8G0Di6TANazfuGWTW7WJQWlXKx
 776QGoH9LciKSuqH+PGshIgfk+J1FRFW8j1u3APrkR8pOtYz1WSpGv+2q2jGplQ++lJA1mdBeXOOZglMAPmZQPo58CL1Qr4E7as=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Building in macOS may create a .dSYM file for debugger symbols.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 7f1fdb7..518bb5a 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1 +1,2 @@
 edid-decode
+*.dSYM
-- 
2.24.3 (Apple Git-128)

