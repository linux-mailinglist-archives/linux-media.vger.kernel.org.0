Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C40A62C5150
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 10:32:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730660AbgKZJce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 04:32:34 -0500
Received: from www.linuxtv.org ([130.149.80.248]:38628 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727232AbgKZJce (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 04:32:34 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kiDdg-00B3qb-HI; Thu, 26 Nov 2020 09:32:32 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kiDgn-0002Oe-P7; Thu, 26 Nov 2020 09:35:45 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.11] RC/DVB fixes #2 (#69362)
Date:   Thu, 26 Nov 2020 09:35:44 +0000
Message-Id: <20201126093544.9171-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201126092412.GA16924@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20201126092412.GA16924@gofer.mess.org/
Build log: https://builder.linuxtv.org/job/patchwork/78689/
Build time: 00:04:10
Link: https://lore.kernel.org/linux-media/20201126092412.GA16924@gofer.mess.org

gpg: Signature made Thu 26 Nov 2020 09:22:27 AM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]

Summary: got 1/4 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0003-media-rc-add-keymap-for-KHAMSIN-remote.patch:

   checkpatch.pl:
	$ cat patches/0003-media-rc-add-keymap-for-KHAMSIN-remote.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:31: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:44: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


Error #512 when building PDF docs

