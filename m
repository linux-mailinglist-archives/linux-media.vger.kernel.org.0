Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85378C9D82
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 13:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730112AbfJCLjb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 07:39:31 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:39155 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725827AbfJCLjb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 07:39:31 -0400
Received: from [IPv6:2001:420:44c1:2577:6d0e:6b32:a8b6:66d9] ([IPv6:2001:420:44c1:2577:6d0e:6b32:a8b6:66d9])
        by smtp-cloud7.xs4all.net with ESMTPA
        id FzSAinS0sjZ8vFzSDio1xt; Thu, 03 Oct 2019 13:39:29 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.5] [v2] Two cec fixes
Message-ID: <e19af1d9-8a06-cedf-4982-29a72d1d13fc@xs4all.nl>
Date:   Thu, 3 Oct 2019 13:39:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAkpvkJbBsuavlU7cS8SHqRsDqEo6zjeCoeTX/LcvNGNo6spagLRpNL8yNmxfXRWn0LBPsiwb0CgWwDpKn5A32x3peZIXuUpg0Zeh8h2IVGGUatNhFK0
 4I3hvrpmZBQvU+PpUtnAA+D683O52o0V7appj9XDN7BjzfQ0e6jHN8f2N1hll1T5W3DMd9tMTNexMQ6IzzzMYSvwYlGwzv0R4+rWE2grtMgdc4+DxZy54Dmh
 97ufvebe4I4JEsLFveaYI65tQCDFazJCokQB16zf169zP0/T/wBxaFLgmqu5xckQ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since v1:

- Fixes too-long lines in commit logs.

The following changes since commit 503e59365dd134b2c63864f14e2de0476284b003:

  media: i2c: ov2659: Switch to SPDX Licensing (2019-10-01 17:39:16 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5e

for you to fetch changes up to 285daad9a5279968eca136a661435cce3c5a94cf:

  cec-funcs.h: use new CEC_OP_UI_CMD defines (2019-10-03 13:36:22 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (2):
      cec-funcs.h: add status_req checks
      cec-funcs.h: use new CEC_OP_UI_CMD defines

 include/uapi/linux/cec-funcs.h | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)
