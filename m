Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F19CBC083F
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 17:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbfI0PDE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 11:03:04 -0400
Received: from www.linuxtv.org ([130.149.80.248]:48184 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727159AbfI0PDE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 11:03:04 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iDrlr-00073T-OY; Fri, 27 Sep 2019 15:02:59 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iDrmB-0004Sy-C5; Fri, 27 Sep 2019 15:03:19 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL v2 FOR v5.5] cec fixes and improvements
Date:   Fri, 27 Sep 2019 15:03:19 +0000
Message-Id: <20190927150319.17127-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <ad5d2c2f-3752-4082-1a01-c3a0a96abc8e@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/58979/
Build log: https://builder.linuxtv.org/job/patchwork/17977/
Build time: 00:05:37
Link: https://lore.kernel.org/linux-media/ad5d2c2f-3752-4082-1a01-c3a0a96abc8e@xs4all.nl

gpg: Signature made Fri 27 Sep 2019 02:49:24 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:

/var/lib/jenkins/workspace/patchwork/Documentation/output/cec.h.rst:6: WARNING: undefined label: cec_adap_g_connector_info (if the link has no caption the label must precede a section header)
/var/lib/jenkins/workspace/patchwork/Documentation/output/cec.h.rst:6: WARNING: undefined label: cec-cap-connector-info (if the link has no caption the label must precede a section header)
/var/lib/jenkins/workspace/patchwork/Documentation/output/cec.h.rst:6: WARNING: undefined label: cec-connector-type-no-connector (if the link has no caption the label must precede a section header)
/var/lib/jenkins/workspace/patchwork/Documentation/output/cec.h.rst:6: WARNING: undefined label: cec-connector-type-drm (if the link has no caption the label must precede a section header)
/var/lib/jenkins/workspace/patchwork/Documentation/output/cec.h.rst:6: WARNING: undefined label: cec-cap-connector-info (if the link has no caption the label must precede a section header)
/var/lib/jenkins/workspace/patchwork/Documentation/output/cec.h.rst:6: WARNING: undefined label: cec_adap_g_connector_info (if the link has no caption the label must precede a section header)
patches/0005-cec-document-CEC_ADAP_G_CONNECTOR_INFO-and-capabilit.patch:53: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-cec-document-CEC_ADAP_G_CONNECTOR_INFO-and-capabilit.patch

