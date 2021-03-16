Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1BC33DBB3
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 18:58:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239433AbhCPR5a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 13:57:30 -0400
Received: from www.linuxtv.org ([130.149.80.248]:35950 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234310AbhCPR4W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 13:56:22 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lMDvW-001Yo9-0f; Tue, 16 Mar 2021 17:56:18 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lMDzN-00035N-3C; Tue, 16 Mar 2021 18:00:17 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.13] Add support for the SDM845 Camera Subsystem (#72347)
Date:   Tue, 16 Mar 2021 18:00:17 +0000
Message-Id: <20210316180017.11820-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <bf3510bc-5f42-2358-32c1-3ead7225cc74@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/bf3510bc-5f42-2358-32c1-3ead7225cc74@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/94553/
Build time: 00:08:48
Link: https://lore.kernel.org/linux-media/bf3510bc-5f42-2358-32c1-3ead7225cc74@xs4all.nl

gpg: Signature made Tue 16 Mar 2021 05:32:47 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 11/19 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0006-media-camss-Refactor-VFE-HW-version-support.patch:

   checkpatch.pl:
	$ cat patches/0006-media-camss-Refactor-VFE-HW-version-support.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:561: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:621: CHECK: Macro argument reuse 'n' - possible side-effects?
	-:639: CHECK: Macro argument reuse 'n' - possible side-effects?
	-:751: CHECK: Macro argument reuse 'n' - possible side-effects?
	-:876: CHECK: Macro argument reuse 'N' - possible side-effects?
	-:2438: CHECK: Macro argument reuse 'N' - possible side-effects?
	-:3610: CHECK: Macro argument reuse 'ptr_line' - possible side-effects?

patches/0007-media-camss-Add-support-for-VFE-hardware-version-Tit.patch:

   checkpatch.pl:
	$ cat patches/0007-media-camss-Add-support-for-VFE-hardware-version-Tit.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:44: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0008-media-camss-Add-missing-format-identifiers.patch:

   checkpatch.pl:
	$ cat patches/0008-media-camss-Add-missing-format-identifiers.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:34: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0009-media-camss-Refactor-CSID-HW-version-support.patch:

   checkpatch.pl:
	$ cat patches/0009-media-camss-Refactor-CSID-HW-version-support.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:37: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:73: CHECK: Prefer using the BIT macro
	-:75: CHECK: Prefer using the BIT macro
	-:406: CHECK: Prefer using the BIT macro
	-:408: CHECK: Prefer using the BIT macro
	-:1120: CHECK: Unnecessary parentheses around 'match_format_idx >= ncodes'

patches/0010-media-camss-Add-support-for-CSID-hardware-version-Ti.patch:

   checkpatch.pl:
	$ cat patches/0010-media-camss-Add-support-for-CSID-hardware-version-Ti.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:35: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0013-media-camss-Enable-SDM845.patch:

   checkpatch.pl:
	$ cat patches/0013-media-camss-Enable-SDM845.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:68: WARNING: DT compatible string "qcom,sdm845-camss" appears un-documented -- check ./Documentation/devicetree/bindings/

patches/0014-dt-bindings-media-camss-Add-qcom-msm8916-camss-bindi.patch:

   checkpatch.pl:
	$ cat patches/0014-dt-bindings-media-camss-Add-qcom-msm8916-camss-bindi.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0015-dt-bindings-media-camss-Add-qcom-msm8996-camss-bindi.patch:

   checkpatch.pl:
	$ cat patches/0015-dt-bindings-media-camss-Add-qcom-msm8996-camss-bindi.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0016-dt-bindings-media-camss-Add-qcom-sdm660-camss-bindin.patch:

   checkpatch.pl:
	$ cat patches/0016-dt-bindings-media-camss-Add-qcom-sdm660-camss-bindin.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0017-dt-bindings-media-camss-Add-qcom-sdm845-camss-bindin.patch:

   checkpatch.pl:
	$ cat patches/0017-dt-bindings-media-camss-Add-qcom-sdm845-camss-bindin.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0019-media-dt-bindings-media-Remove-qcom-camss-documentat.patch:

   checkpatch.pl:
	$ cat patches/0019-media-dt-bindings-media-Remove-qcom-camss-documentat.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:21: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst


Error #512 when building PDF docs

