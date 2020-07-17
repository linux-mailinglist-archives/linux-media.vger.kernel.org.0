Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A528223132
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 04:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgGQCb2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 22:31:28 -0400
Received: from www.linuxtv.org ([130.149.80.248]:41014 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726229AbgGQCb2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 22:31:28 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jwG4v-000bio-Gg; Fri, 17 Jul 2020 02:26:25 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jwGC4-0007RP-Cg; Fri, 17 Jul 2020 02:33:48 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.9] Convert Renesas DT bindings to YAML (#20200717021308)
Date:   Fri, 17 Jul 2020 02:33:48 +0000
Message-Id: <20200717023348.28562-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200717021308.GA359@pendragon.ideasonboard.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20200717021308.GA359@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/60047/
Build time: 00:13:32
Link: https://lore.kernel.org/linux-media/20200717021308.GA359@pendragon.ideasonboard.com

gpg: Signature made Fri 17 Jul 2020 02:10:58 AM UTC
gpg:                using RSA key BD94648A8E47ECEDBF199B1862255D299E280B24
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Good signature from "Laurent Pinchart <laurent.pinchart@ideasonboard.com>" [full]

Summary: 4 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0001-dt-bindings-media-renesas-fcp-Convert-binding-to-YAM.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0001-dt-bindings-media-renesas-fcp-Convert-binding-to-YAM.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:27: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
-:63: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

Error #256 when running cat patches/0004-dt-bindings-media-renesas-fdp1-Convert-binding-to-YA.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0004-dt-bindings-media-renesas-fdp1-Convert-binding-to-YA.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:27: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
-:66: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

Error #256 when running cat patches/0007-dt-bindings-media-renesas-vsp1-Convert-binding-to-YA.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0007-dt-bindings-media-renesas-vsp1-Convert-binding-to-YA.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:27: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
-:59: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

