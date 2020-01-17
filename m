Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D07F71413CC
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2020 22:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729878AbgAQV7i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jan 2020 16:59:38 -0500
Received: from www.linuxtv.org ([130.149.80.248]:43122 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729080AbgAQV7i (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jan 2020 16:59:38 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1isZdU-00DbEr-DG; Fri, 17 Jan 2020 21:58:36 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1isZfZ-0001TW-Ob; Fri, 17 Jan 2020 22:00:46 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.6] DVB & RC (d) II
Date:   Fri, 17 Jan 2020 22:00:45 +0000
Message-Id: <20200117220045.5629-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200117214310.GA30645@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61214/
Build log: https://builder.linuxtv.org/job/patchwork/34111/
Build time: 00:10:29
Link: https://lore.kernel.org/linux-media/20200117214310.GA30645@gofer.mess.org

gpg: Signature made Fri 17 Jan 2020 06:11:28 PM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-rc-add-keymap-for-Videostrong-KII-Pro.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-rc-add-keymap-for-Videostrong-KII-Pro.patch
patches/0004-media-rc-add-keymap-for-Videostrong-KII-Pro.patch:31: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

