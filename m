Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5A4FC0738
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 16:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbfI0OXh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 10:23:37 -0400
Received: from www.linuxtv.org ([130.149.80.248]:44222 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727140AbfI0OXh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 10:23:37 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iDr9h-0002qG-A8; Fri, 27 Sep 2019 14:23:33 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iDrA1-0005IZ-8u; Fri, 27 Sep 2019 14:23:53 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5] vimc: Collapse component structure into a single
Date:   Fri, 27 Sep 2019 14:23:53 +0000
Message-Id: <20190927142353.20326-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <6618e8ee-7ea8-6172-ac96-5228a769a3b3@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/58970/
Build log: https://builder.linuxtv.org/job/patchwork/17975/
Build time: 00:03:42
Link: https://lore.kernel.org/linux-media/6618e8ee-7ea8-6172-ac96-5228a769a3b3@xs4all.nl

gpg: Signature made Fri 27 Sep 2019 02:10:06 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:

patches/0002-media-vimc-Fix-gpf-in-rmmod-path-when-stream-is-acti.patch:20: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-vimc-Fix-gpf-in-rmmod-path-when-stream-is-acti.patch
/var/lib/jenkins/workspace/patchwork/Documentation/media/v4l-drivers/vimc.rst:81: WARNING: Definition list ends without a blank line; unexpected unindent.
/var/lib/jenkins/workspace/patchwork/Documentation/media/v4l-drivers/vimc.rst:64: WARNING: Unknown target name: "module options".

