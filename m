Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D33E34B5F6
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 11:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbhC0KHw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 06:07:52 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:59399 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230322AbhC0KHs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 06:07:48 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Q5r6lwpUHMxedQ5r9lVmF0; Sat, 27 Mar 2021 11:07:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616839668; bh=BdZ2fOXdnEqZsqHgt6XjOcD5OGsJs9bpdRs1KuxkYHc=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=c1xbWPbpkoEdF8y6LZDa7ROHhl15vylpYD4Ai3095+rT2erkeQBGe/Oqai8pzkIbl
         7WfhV7+nLau7fsfFQ6HQafrefUe7y80XOYNsgXItrYmHIlHJwENdV8vbE8ee27ndxy
         v/Klp6T4a6Saxd4BuecM+cYrES1rJRmCsm/ll9zOAdnIedqhjCBGiId2Ud2OrSfeUt
         GZ8mfeOXkvXTLhkTpo3/gvTD33Hy0v8GxyZ4pOnj3wmokcQFR0wUphTY/TtpVLr8Dv
         LwAl/BuK29wge00KIShpE3eMiszpl23ehPQlFOTUlrxXByKJBFfVZtvV7eVUjY8VAQ
         DbC1VtYO5Wu9A==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.13] Various fixes
Message-ID: <b2a45eb6-df13-05e3-c24b-6025bb41fd04@xs4all.nl>
Date:   Sat, 27 Mar 2021 11:07:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfK/Ue1vchZeD5eNzQkRfi3TGbPPXHLFhXGUqGxGQnOrU8OirnH8KNjMflaXFJFqmIJIoktH7fi0pvUwJZvlIqDVPIilDTEBf6tqKm/wKIqm//QYp5KzZ
 YWydg0X7hCfzLLRaiYhHeIhMz6Js33JMjGVZrVx+pByhLMpNgAOe/rnMGemymdZt8XQgs3KdSd4jmB+cpYnZ8P9RXR4we0h3V/k=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 97b34809ec240d82c82af97626c2071a4062e0e6:

  media: staging: atomisp: reduce kernel stack usage (2021-03-23 16:55:52 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13c

for you to fetch changes up to 16ae2419145741848ce1dc98d69f01a2045aec6a:

  media: s5p-mfc: Fix kernel-doc entries in s5p_mfc_common.h (2021-03-27 10:50:40 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Daniel Almeida (1):
      rkvdec: Do not require all controls to be present in every request

Hans Verkuil (4):
      adv7604: fix HPD support for adv7611/12
      vivid: update EDID
      adv7604: support EDIDs up to 4 blocks
      adv7511-v4l2: correctly report EDIDs of 1 block

Sylwester Nawrocki (2):
      media: exynos4-is: Fix kernel-doc entries in fimc-is.h
      media: s5p-mfc: Fix kernel-doc entries in s5p_mfc_common.h

 drivers/media/i2c/adv7511-v4l2.c                |  12 +++----
 drivers/media/i2c/adv7604.c                     | 112 ++++++++++++++++++++++++++++++++++++++++++++----------------
 drivers/media/platform/exynos4-is/fimc-is.h     |  21 ++++++++++--
 drivers/media/platform/s5p-mfc/s5p_mfc_common.h |  23 +++++++++----
 drivers/media/test-drivers/vivid/vivid-core.c   |   6 ++--
 drivers/staging/media/rkvdec/rkvdec.c           |  48 +-------------------------
 drivers/staging/media/rkvdec/rkvdec.h           |   1 -
 7 files changed, 127 insertions(+), 96 deletions(-)
