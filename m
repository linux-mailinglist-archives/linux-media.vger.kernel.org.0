Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82D29C9CE1
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 13:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729774AbfJCLKq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 07:10:46 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:36979 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728140AbfJCLKq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 07:10:46 -0400
Received: from [IPv6:2001:420:44c1:2577:6d0e:6b32:a8b6:66d9] ([IPv6:2001:420:44c1:2577:6d0e:6b32:a8b6:66d9])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Fz0LinDGPjZ8vFz0Oinpoe; Thu, 03 Oct 2019 13:10:44 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.5] Two cec fixes
Message-ID: <df1e93e3-25d9-6ff3-4ad2-2293c2feeddc@xs4all.nl>
Date:   Thu, 3 Oct 2019 13:10:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfH/853VceAVAn6c7R9puw26Mc2fEOYTUVddNA2A8BVN7rVLg77YHbPrJgMAMBZzPN0xgrX1u9QmFjBRwDkJ3DZYFoE55H/H8i1sWuFjG6bRGjlBc8wZC
 zP55GladT4v5uJawlpVu8mT5MEcuHJKX1on4OY54L/DvnT/lvJKYd7/8yHY0Y1HUMGSX/RRHfWu/J1EN89IRANkn/TbVwpzqP9KK/CqXA4uBjHuC9b3oJqgK
 QoNQQFhOOlvxhlmMWJHDMv8JL4O8eMwPDn6tXQwKU2A2J8DfsA4TqwyNleSuxmnh
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 503e59365dd134b2c63864f14e2de0476284b003:

  media: i2c: ov2659: Switch to SPDX Licensing (2019-10-01 17:39:16 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5e

for you to fetch changes up to 7a47b22e2051d688b45c8d0d62c098b797240c4c:

  cec-funcs.h: use new CEC_OP_UI_CMD defines (2019-10-03 12:51:29 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (2):
      cec-funcs.h: add status_req checks
      cec-funcs.h: use new CEC_OP_UI_CMD defines

 include/uapi/linux/cec-funcs.h | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)
