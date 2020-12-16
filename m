Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A23E82DBE2A
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 11:02:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbgLPKCk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 05:02:40 -0500
Received: from www.linuxtv.org ([130.149.80.248]:45328 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725822AbgLPKCk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 05:02:40 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kpTd9-005UT2-IL; Wed, 16 Dec 2020 10:01:59 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kpTgO-0007Sa-Ru; Wed, 16 Dec 2020 10:05:20 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.12] allegro: fix + move to mainline (#70080)
Date:   Wed, 16 Dec 2020 10:05:20 +0000
Message-Id: <20201216100520.28635-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <dfb7d5c7-dd82-2cbb-48ef-9b9cc26f3f57@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/dfb7d5c7-dd82-2cbb-48ef-9b9cc26f3f57@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/81565/
Build time: 00:04:10
Link: https://lore.kernel.org/linux-media/dfb7d5c7-dd82-2cbb-48ef-9b9cc26f3f57@xs4all.nl

gpg: Signature made Wed 16 Dec 2020 09:47:51 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 1/5 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0003-dt-bindings-media-allegro-al5e-Convert-to-YAML.patch:

   checkpatch.pl:
	$ cat patches/0003-dt-bindings-media-allegro-al5e-Convert-to-YAML.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:136: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst


Error #512 when building PDF docs

