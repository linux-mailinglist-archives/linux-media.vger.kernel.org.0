Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2942C452C
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 17:29:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730816AbgKYQ2j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 11:28:39 -0500
Received: from www.linuxtv.org ([130.149.80.248]:38984 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730494AbgKYQ2j (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 11:28:39 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1khxen-009kvP-Cj; Wed, 25 Nov 2020 16:28:37 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1khxht-00035K-VN; Wed, 25 Nov 2020 16:31:50 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.11] RC/DVB fixes (#69348)
Date:   Wed, 25 Nov 2020 16:31:49 +0000
Message-Id: <20201125163149.11817-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201125161413.GA915@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20201125161413.GA915@gofer.mess.org/
Build log: https://builder.linuxtv.org/job/patchwork/78586/
Build time: 00:06:52
Link: https://lore.kernel.org/linux-media/20201125161413.GA915@gofer.mess.org

gpg: Signature made Wed 25 Nov 2020 04:09:11 PM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]

Summary: got 1/3 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0003-media-rc-add-keymap-for-KHAMSIN-remote.patch:

   checkpatch.pl:
	$ cat patches/0003-media-rc-add-keymap-for-KHAMSIN-remote.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:31: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:44: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


Error #512 when building PDF docs

