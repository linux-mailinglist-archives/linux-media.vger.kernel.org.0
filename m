Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3411F5662
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 16:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgFJOB0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 10:01:26 -0400
Received: from www.linuxtv.org ([130.149.80.248]:59068 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726105AbgFJOB0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 10:01:26 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jj1EL-007DTV-2K; Wed, 10 Jun 2020 13:57:25 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jj1KJ-0006d9-NU; Wed, 10 Jun 2020 14:03:35 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.9 v2] Implement V4L2_BUF_FLAG_NO_CACHE_* flags (#64421)
Date:   Wed, 10 Jun 2020 14:03:35 +0000
Message-Id: <20200610140335.25446-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <c4067de1-6fb2-1fda-9a75-0ad5e9ae78c2@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/64421/
Build log: https://builder.linuxtv.org/job/patchwork/54797/
Build time: 00:53:23
Link: https://lore.kernel.org/linux-media/c4067de1-6fb2-1fda-9a75-0ad5e9ae78c2@xs4all.nl

gpg: Signature made Wed 10 Jun 2020 10:32:56 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time
