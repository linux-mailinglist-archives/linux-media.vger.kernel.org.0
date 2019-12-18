Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4491125450
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 22:10:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbfLRVKS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 16:10:18 -0500
Received: from mout.gmx.net ([212.227.17.20]:44535 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725990AbfLRVKS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 16:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1576703416;
        bh=aZX82ztaN/nBBORWnh5+vMpNRzT/4NIR6q20QNyy/lM=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=RUiRYDhBlNN/EXP/fyQZUBZ4n5JqRBrLnydwUfneAaeSi7mvmjVc5Zfect1Jz1dzz
         1XesPVStDs1IIiH0XJp6fssXcrrbJSF/hjN6WOoBrlaXE/CZwPGlPSXmuz2hUo4+Mu
         8GszunZ2cmUEo2WEjSuR5JcsLWWWnKhqWuqaxT4I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.208.25]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEm27-1iS2Rn2iVP-00GIkw for
 <linux-media@vger.kernel.org>; Wed, 18 Dec 2019 22:10:16 +0100
From:   Peter Seiderer <ps.report@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] keymap.h needs sys/types.h and argp.h
Date:   Wed, 18 Dec 2019 22:10:16 +0100
Message-Id: <20191218211016.18796-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:uLMvZC55dFm6Hw0REw6l36uxL96OiizHJVlr6eX3QOgI0dYdFeN
 Es9LTQ9PyT2qmRQulfCCGzvcO/o4bHV5psnnijeEERaQX9tY/uMhJdS4W3IPSr4oBLOATFh
 icR8Un2pyBU8HKM6JooD/3YxiBVl08K3IZwCzdNxZlWOPqyYVyxrOcIubV17NkvSgCFWFWF
 Z6h8eqV4yUZ9d3gji57qQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8sMQssdYF/w=:9KegBsW0yfw9wAs6zmQ+h/
 upb27iLrUpSg7TTHOwQoEDntgGGtojSpAAjdXrlvP7PZNt8Pe1ONMYTAj9mobegOKrDgyInR3
 ZUO8yHMyCXrnCDDDvNapbHItA0AnBOqkNWnmeOmDfUsdn9SVidjDrBnMB019RLP6Mbdy9v4cT
 zGExL0GsXlA9/issVk8JRsMBut3l8dNVncqR1NA3Hg+gKi0XXpvPWLdE6Ji4uCNqjznuaG41+
 Z4cK5Q8HOG8g89nIDsNn1ElZI7SRHaihokz8d0P9PF3MySd1SvwXa4kKCO5Sfe/Wx1ORC480N
 mUWx3d3RIPY99YuA9QRsilT53KBUHMIlvixfABxvcRUZSdFeBgzTY4FWABWch3RomsrUeolFG
 72ABF7HIhcmg8P1N2SoLLLo6yjcYkOCnR+mWrvz1rO4l18n1mqHcC5ovWDiP8m/s7ezphidpo
 o3ynEm01ab0qYjD8sAgFaXtt9q9lEDxog11h+VNshGuR+OwoIteItPA+L92Umtvh5s+HNNUk5
 xImURmOukP7iLJVgLDpTaU/5bTbgxw6uOcti2Yg4hWq3ScKsA7tRfKDjBnbar+hqAdTAMsWJ0
 CGsF3pRiYBCysn1tEsqneyyIwQ+poyLHs10+nzFDEOEnWQig59sDgHJ80lkBeKhF4gahjVJg8
 KwIJfeZ3p17tnJzQPqckHVSV38Bl2H+hQiRkC4W1mlgibd1ceUTLFIMVHqDVBbbPpxG4hQzvi
 luLIzRFe716jhqTFlHNNE1JFCWit6ZlHBOiVp8zXWsSp4jlx57awzr13tHSex2x7vXDV6lFCV
 I2DWFEgUkxIeJTbSVqxeJZOoX6Tg6f5XMFvF7SipzyjejvepxW2SqvIKCDCwYLD7Inb5i0itR
 vHEiFWTqTNc65DQxLsp/MyEqhZzR82bHDSGMlmaCNuw0jnJ4rVvhGGcvTzkie1Zip8Bt04wOo
 oaZzAg4mFmSsOqpSb3e6yTrlKkgHdBH2e0saL3SbPSDqL+ltwMQ41o437W/TwJHRVATFlwF7o
 3u92lT5L6SIOacH8+WyTQmWfx+Eo7LrFWP/nW587h2kvNgWKyNmqRyX63tpIXoWjKZibN3Jod
 rO04oLnO4iCFBFJ3usOVAkSGsHjMLz3XxuCFpB+LRcEEv/uapPJPIRdliS1M7KrRmRUggsAse
 y+PHLJZ2esPJ2EbbQI+4QpBXVN30k659QC+PRfkzDmx5UACs/dknRJDYKHyu9zO917hlIgEPZ
 Fip94TMvajsQYnFX+Qv+5NCvretNTrb0ZLZGBUsmfL/TOiAgUuaqG4ppgna8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rml4ZXM6CgogIGtleW1hcC5oOjIzOjI6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJh1X2lu
dDMyX3TigJkKICBrZXltYXAuaDozNjoxOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg4oCYZXJy
b3JfdOKAmQoKU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0
PgotLS0KIHV0aWxzL2NvbW1vbi9rZXltYXAuYyAgICAgIHwgMiArKwogdXRpbHMvaXItY3RsL2Jw
Zl9lbmNvZGVyLmMgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvdXRpbHMvY29tbW9uL2tleW1hcC5jIGIvdXRpbHMvY29tbW9uL2tleW1hcC5jCmlu
ZGV4IGY1NzRmMjRmLi5kMDZkZWI1OSAxMDA2NDQKLS0tIGEvdXRpbHMvY29tbW9uL2tleW1hcC5j
CisrKyBiL3V0aWxzL2NvbW1vbi9rZXltYXAuYwpAQCAtOSw2ICs5LDggQEAKICNpbmNsdWRlIDxz
dHJpbmcuaD4KICNpbmNsdWRlIDxsaW1pdHMuaD4KICNpbmNsdWRlIDxzdGRib29sLmg+CisjaW5j
bHVkZSA8c3lzL3R5cGVzLmg+CisjaW5jbHVkZSA8YXJncC5oPgogCiAjaW5jbHVkZSAia2V5bWFw
LmgiCiAjaW5jbHVkZSAidG9tbC5oIgpkaWZmIC0tZ2l0IGEvdXRpbHMvaXItY3RsL2JwZl9lbmNv
ZGVyLmMgYi91dGlscy9pci1jdGwvYnBmX2VuY29kZXIuYwppbmRleCA4MmQxMmNjMC4uZTNlNzA1
ZTcgMTAwNjQ0Ci0tLSBhL3V0aWxzL2lyLWN0bC9icGZfZW5jb2Rlci5jCisrKyBiL3V0aWxzL2ly
LWN0bC9icGZfZW5jb2Rlci5jCkBAIC01LDYgKzUsNyBAQAogI2luY2x1ZGUgPGVycm5vLmg+CiAj
aW5jbHVkZSA8c3RyaW5nLmg+CiAjaW5jbHVkZSA8c3lzL3R5cGVzLmg+CisjaW5jbHVkZSA8YXJn
cC5oPgogCiAjaW5jbHVkZSAia2V5bWFwLmgiCiAKLS0gCjIuMjQuMAoK
