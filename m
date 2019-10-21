Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9A62DEF82
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 16:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbfJUO3v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 10:29:51 -0400
Received: from www.linuxtv.org ([130.149.80.248]:56235 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727406AbfJUO3v (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 10:29:51 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iMYgs-00031a-Rl; Mon, 21 Oct 2019 14:29:47 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iMYhM-0005za-Mn; Mon, 21 Oct 2019 14:30:16 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5] imon & SPDX patches
Date:   Mon, 21 Oct 2019 14:30:16 +0000
Message-Id: <20191021143016.22993-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191021141829.GA28605@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59583/
Build log: https://builder.linuxtv.org/job/patchwork/21404/
Build time: 00:10:03
Link: https://lore.kernel.org/linux-media/20191021141829.GA28605@gofer.mess.org

gpg: Signature made Mon 21 Oct 2019 02:13:15 PM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-imon-invalid-dereference-in-imon_touch_event.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-imon-invalid-dereference-in-imon_touch_event.patch
patches/0002-media-imon-invalid-dereference-in-imon_touch_event.patch:13: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

