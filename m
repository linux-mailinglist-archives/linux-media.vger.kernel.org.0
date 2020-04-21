Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1C9D1B2422
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 12:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbgDUKor (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 06:44:47 -0400
Received: from www.linuxtv.org ([130.149.80.248]:44966 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726741AbgDUKoq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 06:44:46 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jQqLV-00AOOG-M1; Tue, 21 Apr 2020 10:41:41 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jQqQE-0004lz-Gu; Tue, 21 Apr 2020 10:46:34 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.8] Various fixes/enhancements (mostly imx/rkisp1) (#63118)
Date:   Tue, 21 Apr 2020 10:46:34 +0000
Message-Id: <20200421104634.18306-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1fe4c654-1b2f-8d26-dd35-95031ccb713d@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/63118/
Build log: https://builder.linuxtv.org/job/patchwork/47607/
Build time: 00:35:26
Link: https://lore.kernel.org/linux-media/1fe4c654-1b2f-8d26-dd35-95031ccb713d@xs4all.nl

gpg: Signature made Thu 16 Apr 2020 10:38:04 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-media-imx-utils-Make-imx_media_pixfmt-handle-variabl.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-media-imx-utils-Make-imx_media_pixfmt-handle-variabl.patch
patches/0008-media-imx-utils-Make-imx_media_pixfmt-handle-variabl.patch:63: ERROR: Macros with complex values should be enclosed in parentheses
patches/0008-media-imx-utils-Make-imx_media_pixfmt-handle-variabl.patch:73: CHECK: Lines should not end with a '('
patches/0008-media-imx-utils-Make-imx_media_pixfmt-handle-variabl.patch:83: CHECK: Lines should not end with a '('
patches/0008-media-imx-utils-Make-imx_media_pixfmt-handle-variabl.patch:112: CHECK: Lines should not end with a '('
patches/0008-media-imx-utils-Make-imx_media_pixfmt-handle-variabl.patch:168: CHECK: Lines should not end with a '('
patches/0008-media-imx-utils-Make-imx_media_pixfmt-handle-variabl.patch:181: CHECK: Lines should not end with a '('
patches/0008-media-imx-utils-Make-imx_media_pixfmt-handle-variabl.patch:195: CHECK: Lines should not end with a '('
patches/0008-media-imx-utils-Make-imx_media_pixfmt-handle-variabl.patch:209: CHECK: Lines should not end with a '('
patches/0008-media-imx-utils-Make-imx_media_pixfmt-handle-variabl.patch:223: CHECK: Lines should not end with a '('

