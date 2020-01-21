Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8771144530
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 20:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728668AbgAUTbX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 14:31:23 -0500
Received: from www.linuxtv.org ([130.149.80.248]:58588 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727383AbgAUTbX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 14:31:23 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1itzE8-000o0H-R7; Tue, 21 Jan 2020 19:30:16 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1itzGK-0004V2-R1; Tue, 21 Jan 2020 19:32:32 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.6] uvcvideo changes
Date:   Tue, 21 Jan 2020 19:32:32 +0000
Message-Id: <20200121193232.17255-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200121192713.GH5003@pendragon.ideasonboard.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61242/
Build log: https://builder.linuxtv.org/job/patchwork/34673/
Build time: 00:02:24
Link: https://lore.kernel.org/linux-media/20200121192713.GH5003@pendragon.ideasonboard.com

gpg: Signature made Tue 21 Jan 2020 07:21:24 PM UTC
gpg:                using RSA key BD94648A8E47ECEDBF199B1862255D299E280B24
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Good signature from "Laurent Pinchart <laurent.pinchart@ideasonboard.com>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-uvcvideo-Avoid-cyclic-entity-chains-due-to-mal.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-uvcvideo-Avoid-cyclic-entity-chains-due-to-mal.patch
patches/0001-media-uvcvideo-Avoid-cyclic-entity-chains-due-to-mal.patch:13: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
patches/0001-media-uvcvideo-Avoid-cyclic-entity-chains-due-to-mal.patch:91: WARNING: quoted string split across lines
patches/0001-media-uvcvideo-Avoid-cyclic-entity-chains-due-to-mal.patch:103: WARNING: quoted string split across lines

