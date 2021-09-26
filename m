Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0A3418776
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhIZIgZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:36:25 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:43776 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229710AbhIZIgY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:36:24 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id U65gmeyQJczbLUPcWmV5Vo; Sun, 26 Sep 2021 08:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645288; bh=ZWPCi/y8M/9/YkWcZigZgJa8JhWtNze51PB762HLXD8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ACneMOR4rI3yl+Lkn9J0meu1nkHE8xhD3AIKpwXxbqaeWZx6j7NXedxW8yx9hOa2D
         LoO1vzV5SsytKU7836KfwLznTjd0XjWyfPMZrZ7K0YayprvnfN6YRl5VOWtMPs4AZ3
         oZnWgfyvaKp8/Y1hiGqrGHperoB4OJ7dQqQSNQ20OR1f1zyQdp/o8mv7KYK/NtCw5F
         Z5mayt7TGN13EveSxe53nzlcDsWVEERONVlam4nHdiC7Zm1BnB9whb8HxrlEYWCWDx
         T2abXHWoRr3b2LYeFH7tsuGq0cwkfr2gKTQX2xRTwo8uK9W46t07VGY7YuVii7ONkJ
         IEF7DspDxR1kA==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPcQm9l35U9pxUPcVmdRJX; Sun, 26 Sep 2021 08:34:48 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=615030a8
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=af2eKn9tGRu-v9Q6u-QA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 27/29] edid-decode: re-add one EDID
Date:   Sun, 26 Sep 2021 01:33:28 -0700
Message-Id: <20210926083330.5206-28-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGNU6YTvc/ydOa8gDtDDcH5FX0Kk2vTm7lXQBN9+OuFmPfr16+T6ERjuQeS94IvlWFrmCDsddG7jLhHde21d9B9lcxWG97Fc3G5sPb6dl+FMBpnt9Mi/
 lPklm5qY88PdBXNF2z7S9bsVw1DtZKwK054PWY13sZnaESeQWx/YZPbuzF33KfAZ8yvPwX3b0sGH0KY4YLTA3Lmzmoae/sJm2tE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- This one somehow got truncated.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 data/vizio-m60c3-hdmi-onkyo-txnr555 | Bin 0 -> 256 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/data/vizio-m60c3-hdmi-onkyo-txnr555 b/data/vizio-m60c3-hdmi-onkyo-txnr555
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..93369abc45fd4348188e5b3a3f285f38c27fe3b4 100644
GIT binary patch
literal 256
zcmZSh4+adjrvn5SKtPI-xuMm&f~zxqVYKgJbwLkL1qOzT2N+QRO9_L)r-G=44G~=o
z2V{&G8046&8YBuWbR8meTp1ql2?9lcX8mCZiO}^6GBq{jQUC&=2*eH`0|FQ|nV3Bb
zycwC8Sy=5AV&mc;S##F2^VhSBvj^C-9q?sh2xnuAuVap{V@$7SZ1!hh$YthX2xZt|
yqri{=)b)rjG5tpD5ypxJ29^?-145w=V3cJj3cMhvkf#yK;IIW~GssD3pbG#y;WhyP

literal 0
HcmV?d00001

-- 
2.24.3 (Apple Git-128)

