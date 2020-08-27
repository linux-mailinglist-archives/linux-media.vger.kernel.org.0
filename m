Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 472B9254A36
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 18:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgH0QHH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 12:07:07 -0400
Received: from www.linuxtv.org ([130.149.80.248]:56384 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbgH0QHH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 12:07:07 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kBKKz-003ywT-Mx; Thu, 27 Aug 2020 16:01:17 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kBKTC-0004qY-Oc; Thu, 27 Aug 2020 16:09:46 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR v5.9] v4l2_ctrl_request_hdl_put() fixes (#66414)
Date:   Thu, 27 Aug 2020 16:09:46 +0000
Message-Id: <20200827160946.18589-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <533e5d24-927a-8d9e-4725-700610246b6d@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/533e5d24-927a-8d9e-4725-700610246b6d@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/65989/
Build time: 00:02:37
Link: https://lore.kernel.org/linux-media/533e5d24-927a-8d9e-4725-700610246b6d@xs4all.nl

gpg: Signature made Wed 19 Aug 2020 11:43:24 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time
