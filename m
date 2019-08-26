Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2499CB71
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 10:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730131AbfHZIUF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 04:20:05 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:40681 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726401AbfHZIUF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 04:20:05 -0400
Received: from [IPv6:2001:983:e9a7:1:3421:ddcd:2260:77e4] ([IPv6:2001:983:e9a7:1:3421:ddcd:2260:77e4])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 2AEMiuaSozaKO2AENiE5xn; Mon, 26 Aug 2019 10:20:03 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.3] Two cec improvements
Message-ID: <6ca756b8-67b3-dc3a-2f38-baf8ebb2a31b@xs4all.nl>
Date:   Mon, 26 Aug 2019 10:20:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP1Hk6OMOPQEbBTaFdXLVIkHqKjUDdlOd3jgg5OsOLXc2V+WOz0HlX87J7OYCk859dShVcMrVD3BfzhzMyeKGuu9fE7OsmGJN9v58MOCwseg/Rqd+jUa
 xQ1QBtu+kNjZNxbr1Bv4KGw/3i/3jrpwdYizOu4+7UK2isdkJnPJ1CGOm0s+djV8nYfEBIlfNVJecPW0OyuBNqY0c8gC6w6m53moqlvPXYuPDcFrVqxHCIjW
 SxIpho0p2338shVx9kBlh2w8rMFIz5LQA4J3uWZlqj0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This improves the robustness of cec_s_conn_info and cec_notifier_unregister.

Regards,

	Hans

The following changes since commit 577bbf23b758848f0c4a50d346460b690c753024:

  media: sunxi: Add A10 CSI driver (2019-08-23 07:31:35 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3b-fix

for you to fetch changes up to a4c9b7098d012265a86a9fb148fd6da0a5e5bc63:

  cec-notifier: clear cec_adap in cec_notifier_unregister (2019-08-26 09:42:31 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (2):
      cec-adap: return from cec_s_conn_info() if adap is invalid
      cec-notifier: clear cec_adap in cec_notifier_unregister

 drivers/media/cec/cec-adap.c     | 3 +++
 drivers/media/cec/cec-notifier.c | 2 ++
 2 files changed, 5 insertions(+)
