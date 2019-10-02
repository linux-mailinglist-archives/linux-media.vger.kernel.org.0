Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E893C93A0
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 23:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727764AbfJBVrr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 17:47:47 -0400
Received: from www.linuxtv.org ([130.149.80.248]:58782 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726638AbfJBVrr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 17:47:47 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iFmTC-0007ie-Kr; Wed, 02 Oct 2019 21:47:38 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iFmTZ-0006w6-1t; Wed, 02 Oct 2019 21:48:01 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5] DVB & RC (I)
Date:   Wed,  2 Oct 2019 21:48:00 +0000
Message-Id: <20191002214800.26594-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191002213433.GA12192@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59133/
Build log: https://builder.linuxtv.org/job/patchwork/18716/
Build time: 00:07:49
Link: https://lore.kernel.org/linux-media/20191002213433.GA12192@gofer.mess.org

gpg: Signature made Wed 02 Oct 2019 09:26:41 PM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-saa7164-use-debugfs-rather-than-procfs-for-deb.patch

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-rc-mark-input-device-as-pointing-stick.patch

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0019-media-dvb-usb-v2-gl861-remove-an-un-used-header-file.patch

