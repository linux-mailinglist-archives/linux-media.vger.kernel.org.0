Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C524134090
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 12:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbgAHLdF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 06:33:05 -0500
Received: from www.linuxtv.org ([130.149.80.248]:42356 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727236AbgAHLdF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Jan 2020 06:33:05 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ip9ZN-0003cq-Nf; Wed, 08 Jan 2020 11:32:13 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ip9bF-0000wC-2i; Wed, 08 Jan 2020 11:34:09 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.6] Fix v4l2-ioctl regression
Date:   Wed,  8 Jan 2020 11:34:09 +0000
Message-Id: <20200108113409.3563-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <83d3c4fc-7a84-ef3f-cb82-11ff810e77a2@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61062/
Build log: https://builder.linuxtv.org/job/patchwork/32753/
Build time: 00:13:58
Link: https://lore.kernel.org/linux-media/83d3c4fc-7a84-ef3f-cb82-11ff810e77a2@xs4all.nl

gpg: Signature made Wed 08 Jan 2020 11:13:49 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: no issues
