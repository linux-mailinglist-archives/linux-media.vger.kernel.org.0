Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51DC9155AA3
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2020 16:23:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbgBGPXN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Feb 2020 10:23:13 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:47587 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727114AbgBGPXN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Feb 2020 10:23:13 -0500
Received: from [IPv6:2001:420:44c1:2577:ad43:7060:21a6:befc]
 ([IPv6:2001:420:44c1:2577:ad43:7060:21a6:befc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 05TIjr2BWVuxO05TLjfMZL; Fri, 07 Feb 2020 16:23:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581088991; bh=z3rEOZjXBrkp50uci493bmfmb6vHap/JcWasG0+12/Y=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hbVNEjXgi8pnCJmqFzNknoajekMaDg5BDMX+lsBE7xhqlIhTkLeRDK0Xq9d5ZTRB/
         YBYfOGwqTVetTcdf3Wv3myantjGzu63QkyHX5JP76/+XotKdqgido8RIX5Qyquxq78
         XG6GaqWPVyiUTp9yHP3yU6G3uT9U5CJBVOOm7Hvqlz/1OQa744Im+u7rB+P0ZdeNI3
         94kLIV1GusqbPRMBwKmAhPetd+gXcnibg9ND6kafB1chDXgc3t46vjBO2U1v0U5M7+
         f5OUfHZU+mdzwf8CRSVEM7+U/Y4DJ+WMYGGPuW71end3/Y7gUks+wPmHGmGCxtchYv
         HLwfOWWgWVc3w==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.6] Fixes for v5.6
Message-ID: <3ead2ec9-dc64-4a1a-e21f-341490b86061@xs4all.nl>
Date:   Fri, 7 Feb 2020 16:23:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF9HX+KMHBmIGmM5LfyfmzQpgHhyRmCxrPTfWZJ87ckMP89rMqZT/ls0VQztYP9xFk8DM4ZU5NPmqkqorDz9Ofw72J5T9gL1SC0cvaKiXoVMhib+9ejH
 ybEQEyYuKkAeUyA4fpXFXqRJ8tge3R4kluxBkyaeR3LZayLRnUCh4XrHBsEj8D5XuGY6bkweKXOMU/s417Z9Ar0S0Q2dx9ghsD95ippuEtqebD4B3H2Jqprs
 F8sRaS3zLeJTDAXtWNa87B48yTUaq+39sdU9ECjBcM1bphQs9DFDM3TnirL/2PFj
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 1697d98124819aab09b86602978bd4f50e101e2d:

  media: staging/intel-ipu3: remove TODO item about acronyms (2020-01-23 15:50:53 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.6o

for you to fetch changes up to 8ab1e4becef0af32e3025ea93be761ccb90b407d:

  hantro: Fix broken media controller links (2020-02-07 14:06:56 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ezequiel Garcia (1):
      hantro: Fix broken media controller links

Hans Verkuil (3):
      vicodec: process all 4 components for RGB32 formats
      v4l2-mem2mem.c: fix broken links
      mc-entity.c: use & to check pad flags, not ==

 drivers/media/mc/mc-entity.c                     |  4 ++--
 drivers/media/platform/vicodec/codec-v4l2-fwht.c | 34 +++++++++-------------------------
 drivers/media/v4l2-core/v4l2-mem2mem.c           |  4 ++--
 drivers/staging/media/hantro/hantro_drv.c        |  4 ++--
 4 files changed, 15 insertions(+), 31 deletions(-)
