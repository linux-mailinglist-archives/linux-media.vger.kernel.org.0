Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE442C82AF
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 11:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727663AbgK3K4s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 05:56:48 -0500
Received: from www.linuxtv.org ([130.149.80.248]:46390 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbgK3K4s (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 05:56:48 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kjgql-00GgoE-2r; Mon, 30 Nov 2020 10:56:07 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kjgtu-0002sC-6y; Mon, 30 Nov 2020 10:59:22 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.11] Camera sensor and CSI-2 patches (mostly) (#69526)
Date:   Mon, 30 Nov 2020 10:59:22 +0000
Message-Id: <20201130105922.11003-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201130104221.GM4351@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20201130104221.GM4351@valkosipuli.retiisi.org.uk/
Build log: https://builder.linuxtv.org/job/patchwork/79271/
Build time: 00:07:58
Link: https://lore.kernel.org/linux-media/20201130104221.GM4351@valkosipuli.retiisi.org.uk

gpg: Signature made Mon 30 Nov 2020 10:30:25 AM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Can't check signature: No public key

Summary: got 1/15 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0004-media-dt-bindings-media-i2c-document-OV02A10-DT-bind.patch:

   checkpatch.pl:
	$ cat patches/0004-media-dt-bindings-media-i2c-document-OV02A10-DT-bind.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:195: WARNING: Possible repeated word: 'git'


Error #512 when building PDF docs

