Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDB8C48BDAA
	for <lists+linux-media@lfdr.de>; Wed, 12 Jan 2022 04:32:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345800AbiALDcP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 22:32:15 -0500
Received: from mout.gmx.net ([212.227.17.20]:33215 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236491AbiALDcO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 22:32:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641958333;
        bh=4qGlhJ+Qd1j0+2GVpfwdN+fh6ms0isNnvER8Z5zyajI=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=b2oc0NQ81OeqhpSU1UBgAojg//dSgyiroMtV0NmC/OdAAOULePsgyHKsleVHEXYzN
         pY6YjjLzMFK5pHCKDXJrDgNLPw74Pp+c8oAebzGYgVNaZPBJwtxNHebjnXle86nHMT
         gXB4YH6gXHid85ZDnND34HP0HFCGInyBEHsG8IPg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bap21.server.lan [172.19.172.91]) (via HTTP); Wed, 12 Jan 2022
 04:32:13 +0100
MIME-Version: 1.0
Message-ID: <trinity-20af6998-4ae7-4160-91c0-b68583655a76-1641958333231@3c-app-gmx-bap21>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/1] media: dvb_frontend: add missing DSS switch cases
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 12 Jan 2022 04:32:13 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:Wj1C7GjIcNzQ5zkJZx3auosQu8ApRa3yBZsZpsjArw+f34O3xjh4l+Xohm3YlKzIgWyV4
 i4Y8be4vOhCL9Mq5PEJNCSZsWu3dbovPw5yPEuI56etRggUT7BZPAfA2x9whDW40nok6/RCtXeFw
 itSURGkRsjU0YgDHu20GdIW6kMDjQRoXB6gWoVEa51OlTjRq9+tzuSGXUzY2gXboExW2p3WqB2XC
 TXtSkOy7rlMackRJTyZIJVfAr0RexLFdH/C/Jny+OMwk89sM8GFKLPE0xtLsNJMc5SAVp8hChGiD
 Ks=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OtcACsK6Rck=:xN6obtdRnPr5cS1Ftpojzw
 xzNoI3wlF5AW6VFSflbh29S4h3IRUwU7uB1kydOluetk+lXWPPJdZ4AlSOQTtZ9PTHf2Ruz0r
 pVvVSKDRC52NWe2XUQKXwuR8D0wdfHyPkXRjwIHYilLYLO2SaR9kE4G/ww1gO+rIm1OXijSKK
 hMCKMh7Aogyt3ukrt3TWWNKWZAIgLQBDK43INQSG+1ynD5lDPYHg+GP/Vi+xu9XaJxPp9SbNV
 IbIQscb45+jTodkNPvvYZc7D1cyUC+CXiuuYt2sR3s3jxt+N2P5OEkxo8rfMB2tkti4vGjJt/
 IFrryVWuMW3aXG955+PmP+erjhpbeC4eKwPYWKv541MkVGtoXhsk5RQksLQ9pccy0um5ojUNR
 LGqgaDlRTreTb/KyKxisvUkS+tLoZnUERjtngNp5QCIXysI11hPjumYj/5+Xqc5vwa1jW8nmG
 5kxfMyeTyaOejoPGfxtsVjk/PaGpxDDd5ruOdKE+cb0Jfno4jGRaxEufRO1uf6DHL53hnutt1
 tq5aSHNiYqD99Hh/GY+BF0NAagc1XhEPQ+1sc1U/i3KPt6T6ZWb32eJ35B1oWoX80u0mNM3no
 +0NDOopc2fYYv/9upKSRxsn1xW6LM8oag2JBruQu8kamrnFrnRgwXcMOHfupD7TEOaHdy8BvK
 GpeToUCsJ58QLba5ODtcc1UM4/g9ZP8mEE9hQk8vB68SOSODDquTDrHTAyRtIEkh3jNUbG7mL
 VVLR9EWtgHVvQsCk29ADWtSl8LPDqfgb2DnXQXwdS2nCIKWpdbsFS4uC33VmyOjhf4vGUTj+s
 U6l9QFk
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I was wondering why my multistandard scanning application, which tries
all delivery systems a frontend offers until it gets a signal, ended
up flooding the kernel log with messages like these:

DVB: adapter 0 frontend 0 frequency 1665500 out of range (850000000..2300000000)

Investigation brought about that this happened when the application
tried the SYS_DSS standard, which is a satellite delivery system as per
the documentation. However, it is missing from all but one switch
statement in dvb_frontend.c, causing the frequency requested to be
handled as being in Hz rather than kHz, and in consequence, dvb_frontend
to generate these log messages.

While I do not have any DSS signals to receive, nor expect to ever have
any, and from the omission in dvb_frontend.c presume noone else ever has,
I submit the following patch to put things right.

DSS is a pre-DVB-S standard with many similarities (such as modulation
being only QPSK), so the frontend drivers which support it handle it
mostly like DVB-S, meaning they expect to get the frequency in kHz.

For the rolloff factor, a popular search engine found a book which
states it is 0.20 in contrast DVB-S' 0.35. Code review of the existing
frontend drivers yielded they should have no issue with that, so I
added and used that value in dvb_frontend where applicable.

Signed-off-by: Robert Schlabbach <robert_s@gmx.net>
