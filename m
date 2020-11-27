Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE3DD2C638C
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 12:04:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729127AbgK0LCj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 06:02:39 -0500
Received: from www.linuxtv.org ([130.149.80.248]:50062 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726952AbgK0LCj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 06:02:39 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kibWP-00CW4k-Nu; Fri, 27 Nov 2020 11:02:37 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kibZX-00039q-4E; Fri, 27 Nov 2020 11:05:51 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: =?UTF-8?q?Re=3A=20=5BGIT=20PULL=20v2=20for=20=3D=3Fiso-8859-1=3Fq=3F5=3D2E11=3D5D=3DA0Smiapp=3F=3D=20driver=20fixes=2C=20=28=2369435=29?=
Date:   Fri, 27 Nov 2020 11:05:50 +0000
Message-Id: <20201127110550.12087-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201127104144.GJ4351@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20201127104144.GJ4351@valkosipuli.retiisi.org.uk/
Build log: https://builder.linuxtv.org/job/patchwork/78839/
Build time: 00:13:30
Link: https://lore.kernel.org/linux-media/20201127104144.GJ4351@valkosipuli.retiisi.org.uk

gpg: Signature made Fri 27 Nov 2020 10:36:35 AM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Can't check signature: No public key

Summary: got 11/29 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-ccs-Add-the-generator-for-CCS-register-definitions-a.patch:

   checkpatch.pl:
	$ cat patches/0001-ccs-Add-the-generator-for-CCS-register-definitions-a.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:1074: ERROR: do not set execute permissions for source files

patches/0002-Documentation-ccs-Add-CCS-driver-documentation.patch:

   checkpatch.pl:
	$ cat patches/0002-Documentation-ccs-Add-CCS-driver-documentation.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:16: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0003-smiapp-Import-CCS-definitions.patch:

   checkpatch.pl:
	$ cat patches/0003-smiapp-Import-CCS-definitions.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:21: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:197: WARNING: line length of 109 exceeds 100 columns
	-:198: WARNING: line length of 125 exceeds 100 columns
	-:200: WARNING: line length of 109 exceeds 100 columns
	-:201: WARNING: line length of 125 exceeds 100 columns
	-:235: WARNING: line length of 101 exceeds 100 columns
	-:246: WARNING: line length of 103 exceeds 100 columns
	-:702: WARNING: line length of 104 exceeds 100 columns
	-:881: WARNING: line length of 116 exceeds 100 columns
	-:1012: WARNING: line length of 110 exceeds 100 columns
	-:1013: WARNING: line length of 110 exceeds 100 columns
	-:1016: WARNING: line length of 110 exceeds 100 columns
	-:1017: WARNING: line length of 110 exceeds 100 columns
	-:1020: WARNING: line length of 110 exceeds 100 columns
	-:1021: WARNING: line length of 110 exceeds 100 columns
	-:1024: WARNING: line length of 110 exceeds 100 columns
	-:1025: WARNING: line length of 110 exceeds 100 columns
	-:1026: WARNING: line length of 110 exceeds 100 columns
	-:1027: WARNING: line length of 110 exceeds 100 columns
	-:1057: WARNING: line length of 110 exceeds 100 columns
	-:1058: WARNING: line length of 110 exceeds 100 columns
	-:1061: WARNING: line length of 110 exceeds 100 columns
	-:1062: WARNING: line length of 110 exceeds 100 columns
	-:1086: WARNING: line length of 110 exceeds 100 columns
	-:1087: WARNING: line length of 110 exceeds 100 columns
	-:1090: WARNING: line length of 110 exceeds 100 columns
	-:1091: WARNING: line length of 110 exceeds 100 columns
	-:1175: WARNING: line length of 110 exceeds 100 columns
	-:1176: WARNING: line length of 110 exceeds 100 columns
	-:1177: WARNING: line length of 110 exceeds 100 columns
	-:1178: WARNING: line length of 110 exceeds 100 columns
	-:1179: WARNING: line length of 104 exceeds 100 columns
	-:1180: WARNING: line length of 104 exceeds 100 columns
	-:1253: WARNING: line length of 151 exceeds 100 columns
	-:1253: CHECK: Macro argument reuse 'n' - possible side-effects?
	-:1260: WARNING: line length of 151 exceeds 100 columns
	-:1260: CHECK: Macro argument reuse 'n' - possible side-effects?

patches/0006-smiapp-Remove-macros-for-defining-registers-merge-de.patch:

   checkpatch.pl:
	$ cat patches/0006-smiapp-Remove-macros-for-defining-registers-merge-de.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:546: WARNING: line length of 121 exceeds 100 columns
	-:547: WARNING: line length of 120 exceeds 100 columns
	-:559: WARNING: line length of 102 exceeds 100 columns
	-:884: WARNING: line length of 108 exceeds 100 columns
	-:885: WARNING: line length of 108 exceeds 100 columns
	-:888: WARNING: line length of 108 exceeds 100 columns
	-:889: WARNING: line length of 108 exceeds 100 columns
	-:892: WARNING: line length of 108 exceeds 100 columns
	-:893: WARNING: line length of 108 exceeds 100 columns
	-:896: WARNING: line length of 108 exceeds 100 columns
	-:897: WARNING: line length of 108 exceeds 100 columns
	-:898: WARNING: line length of 108 exceeds 100 columns
	-:899: WARNING: line length of 108 exceeds 100 columns
	-:911: WARNING: line length of 108 exceeds 100 columns
	-:912: WARNING: line length of 108 exceeds 100 columns
	-:915: WARNING: line length of 108 exceeds 100 columns
	-:916: WARNING: line length of 108 exceeds 100 columns
	-:1091: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0009-smiapp-Read-CCS-limit-values.patch:

    allmodconfig: return code #0:
	../drivers/media/i2c/smiapp/smiapp-core.c:161:12: warning: ‘ccs_get_limit’ defined but not used [-Wunused-function]

patches/0010-smiapp-Switch-to-CCS-limits.patch:

   checkpatch.pl:
	$ cat patches/0010-smiapp-Switch-to-CCS-limits.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:518: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0014-smiapp-Use-CCS-registers.patch:

   checkpatch.pl:
	$ cat patches/0014-smiapp-Use-CCS-registers.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:133: CHECK: Lines should not end with a '['
	-:144: CHECK: Lines should not end with a '['
	-:256: CHECK: Logical continuations should be on the previous line
	-:469: CHECK: Lines should not end with a '('
	-:478: CHECK: Lines should not end with a '('
	-:489: CHECK: Lines should not end with a '('
	-:497: CHECK: Lines should not end with a '('
	-:505: CHECK: Lines should not end with a '('
	-:513: CHECK: Lines should not end with a '('

patches/0016-smiapp-Rename-register-access-functions.patch:

   checkpatch.pl:
	$ cat patches/0016-smiapp-Rename-register-access-functions.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:264: CHECK: Alignment should match open parenthesis
	-:269: CHECK: Alignment should match open parenthesis
	-:281: CHECK: Lines should not end with a '('

patches/0017-smiapp-Internal-rename-to-CCS.patch:

   checkpatch.pl:
	$ cat patches/0017-smiapp-Internal-rename-to-CCS.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:15: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:53: WARNING: It's generally not useful to have the filename in the file
	-:66: CHECK: Macro argument reuse 'dim' - possible side-effects?
	-:1615: WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
	-:1636: WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
	-:2224: WARNING: It's generally not useful to have the filename in the file
	-:2380: WARNING: It's generally not useful to have the filename in the file
	-:2427: CHECK: Prefer using the BIT macro
	-:2443: CHECK: Macro argument reuse 'sensor' - possible side-effects?
	-:2443: CHECK: Macro argument reuse '_quirk' - possible side-effects?
	-:2443: CHECK: Macro argument '_quirk' may be better as '(_quirk)' to avoid precedence issues
	-:2449: CHECK: Macro argument reuse 'sensor' - possible side-effects?
	-:2449: CHECK: Macro argument '_quirk' may be better as '(_quirk)' to avoid precedence issues
	-:2659: WARNING: It's generally not useful to have the filename in the file
	-:2737: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:2751: CHECK: Prefer using the BIT macro

patches/0019-smiapp-Rename-as-ccs.patch:

   checkpatch.pl:
	$ cat patches/0019-smiapp-Rename-as-ccs.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:159: WARNING: It's generally not useful to have the filename in the file
	-:192: WARNING: It's generally not useful to have the filename in the file
	-:212: WARNING: It's generally not useful to have the filename in the file
	-:232: WARNING: It's generally not useful to have the filename in the file

patches/0025-dt-bindings-nokia-smia-Convert-to-YAML.patch:

   checkpatch.pl:
	$ cat patches/0025-dt-bindings-nokia-smia-Convert-to-YAML.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:24: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:93: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst


Error #512 when building PDF docs

