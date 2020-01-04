Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94CF7130158
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2020 08:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgADH7J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Jan 2020 02:59:09 -0500
Received: from www.linuxtv.org ([130.149.80.248]:51492 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbgADH7J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 4 Jan 2020 02:59:09 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ineKE-00BJhy-Bg; Sat, 04 Jan 2020 07:58:22 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ineLz-0008Mh-AG; Sat, 04 Jan 2020 08:00:11 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.5-rc5] media fixes
Date:   Sat,  4 Jan 2020 08:00:11 +0000
Message-Id: <20200104080011.32114-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200104085420.5fe6a671@kernel.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/60978/
Build log: https://builder.linuxtv.org/job/patchwork/32157/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20200104085420.5fe6a671@kernel.org

gpg: Signature made Sat 04 Jan 2020 07:45:25 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-cec-CEC-2.0-only-bcast-messages-were-ignored.patch doesn't apply:
Applying patch patches/0001-media-cec-CEC-2.0-only-bcast-messages-were-ignored.patch
patching file drivers/media/cec/cec-adap.c
Hunk #1 FAILED at 1085.
1 out of 1 hunk FAILED -- rejects in file drivers/media/cec/cec-adap.c
Patch patches/0001-media-cec-CEC-2.0-only-bcast-messages-were-ignored.patch can be reverse-applied

