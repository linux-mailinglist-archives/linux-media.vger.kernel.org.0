Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03C7EA9D27
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 10:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732712AbfIEIh1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 04:37:27 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:56055 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732711AbfIEIh0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 04:37:26 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 5nGciVsgH50xT5nGfipwT1; Thu, 05 Sep 2019 10:37:25 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT FIXES FOR v5.3] Fix nasty videobuf poll regression
Message-ID: <55501135-128f-f715-4608-07de0b8c46a1@xs4all.nl>
Date:   Thu, 5 Sep 2019 10:37:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKRiyi+XP4q7Gb1ZWBWPLjMXNVSaii0rK1ESWwKsOm6IYWNB6n/l9Y/q0w8KjF4SEfpa7VXMRrovd6V0rdl8/U0nhmsr/eaAkpF8vUjEcPjaJEdPnZCB
 zt9cO8ej6orc4iaE9qSbH/+yOpZf7EMctNhBh1e+kMczXr6HL7OcpbgQ3nY3IOqn9hcRXbcn0AZ1bwgGv9XjuuKwhTM5wG7O6nPxPS71l4ja5Ct4YJG7c9ZI
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Many thanks to Dan Carpenter for finding this stupid regression.

All vb1 drivers (luckily not that many anymore) are broken since 5.1.

Regards,

	Hans

The following changes since commit 20a438d53fd9d12a894161bc56cbeab7a9993c39:

  media: sun4i: Make sun4i_csi_formats static (2019-08-30 14:44:17 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3c2

for you to fetch changes up to e1d2b54010ee7f23ab4e9919b45ba5b4f535adc3:

  videobuf-core.c: poll_wait needs a non-NULL buf pointer (2019-09-05 10:25:56 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
      videobuf-core.c: poll_wait needs a non-NULL buf pointer

 drivers/media/v4l2-core/videobuf-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
