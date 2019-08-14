Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 234918CD2E
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 09:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfHNHrv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 03:47:51 -0400
Received: from www.linuxtv.org ([130.149.80.248]:45021 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725280AbfHNHru (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 03:47:50 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1hxo0U-0008Im-G3; Wed, 14 Aug 2019 07:47:42 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1hxo0V-000174-1E; Wed, 14 Aug 2019 07:47:43 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     Sean Young <sean@mess.org>, mchehab+samsung@kernel.org,
        linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.4] RC & DVB
Date:   Wed, 14 Aug 2019 07:47:42 +0000
Message-Id: <20190814074742.4235-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814073135.avafdlmfjml3cqqs@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/58121/
Build log: https://builder.linuxtv.org/job/patchwork/8398/
Build time: 00:14:29
Link: https://lore.kernel.org/linux-media/20190814073135.avafdlmfjml3cqqs@gofer.mess.orgSummary: 1 issues, being 0 at build time

Error/warnings:

patches/0013-media-tm6000-double-free-if-usb-disconnect-while-str.patch:30: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0013-media-tm6000-double-free-if-usb-disconnect-while-str.patch

