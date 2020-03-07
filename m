Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCD4317CEC9
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 15:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgCGOjJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 09:39:09 -0500
Received: from www.linuxtv.org ([130.149.80.248]:46566 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726283AbgCGOjJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Mar 2020 09:39:09 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jAaZj-006G5q-Fv; Sat, 07 Mar 2020 14:37:11 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jAad4-0008N5-2F; Sat, 07 Mar 2020 14:40:38 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.6-rc5] media fixes (#61974)
Date:   Sat,  7 Mar 2020 14:40:38 +0000
Message-Id: <20200307144038.32138-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200307153554.1411ffb3@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61974/
Build log: https://builder.linuxtv.org/job/patchwork/41267/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20200307153554.1411ffb3@coco.lan

gpg: Signature made Sat 07 Mar 2020 01:14:02 PM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-pulse8-cec-INIT_DELAYED_WORK-was-called-too-la.patch doesn't apply:
Applying patch patches/0001-media-pulse8-cec-INIT_DELAYED_WORK-was-called-too-la.patch
patching file drivers/media/usb/pulse8-cec/pulse8-cec.c
Hunk #1 FAILED at 840.
Hunk #2 FAILED at 865.
2 out of 2 hunks FAILED -- rejects in file drivers/media/usb/pulse8-cec/pulse8-cec.c
Patch patches/0001-media-pulse8-cec-INIT_DELAYED_WORK-was-called-too-la.patch can be reverse-applied

