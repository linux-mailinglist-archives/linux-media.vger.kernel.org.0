Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5FA2A06A7
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 14:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgJ3NnH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 09:43:07 -0400
Received: from www.linuxtv.org ([130.149.80.248]:44796 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726662AbgJ3NnH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 09:43:07 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kYUgK-007ImR-DV; Fri, 30 Oct 2020 13:43:04 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kYUjH-0001ha-Vc; Fri, 30 Oct 2020 13:46:08 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.11] V4L2 cleanups and fixes mostly (#68448)
Date:   Fri, 30 Oct 2020 13:46:07 +0000
Message-Id: <20201030134607.6501-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201030125658.GD6899@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20201030125658.GD6899@valkosipuli.retiisi.org.uk/
Build log: https://builder.linuxtv.org/job/patchwork/74835/
Build time: 00:34:38
Link: https://lore.kernel.org/linux-media/20201030125658.GD6899@valkosipuli.retiisi.org.uk

gpg: Signature made Fri 30 Oct 2020 12:47:54 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Can't check signature: No public key

Summary: got 14/73 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0027-media-ov2740-select-regmap.patch:

   checkpatch.pl:
	$ cat patches/0027-media-ov2740-select-regmap.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:8: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0034-dt-bindings-media-mt9v111-Convert-to-json-schema.patch:

   checkpatch.pl:
	$ cat patches/0034-dt-bindings-media-mt9v111-Convert-to-json-schema.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:25: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:73: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

patches/0035-dt-bindings-media-imx214-Convert-to-json-schema.patch:

   checkpatch.pl:
	$ cat patches/0035-dt-bindings-media-imx214-Convert-to-json-schema.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:25: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:80: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

patches/0036-dt-bindings-media-ov772x-Convert-to-json-schema.patch:

   checkpatch.pl:
	$ cat patches/0036-dt-bindings-media-ov772x-Convert-to-json-schema.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:26: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:68: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

patches/0039-media-dt-bindings-convert-CODA-VPU-bindings-to-yaml.patch:

   checkpatch.pl:
	$ cat patches/0039-media-dt-bindings-convert-CODA-VPU-bindings-to-yaml.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:50: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:83: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

patches/0045-dt-bindings-adv7604-Fix-documentation-for-hpd-gpios.patch:

   checkpatch.pl:
	$ cat patches/0045-dt-bindings-adv7604-Fix-documentation-for-hpd-gpios.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:11: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0046-dt-bindings-adv7604-Convert-bindings-to-json-schema.patch:

   checkpatch.pl:
	$ cat patches/0046-dt-bindings-adv7604-Convert-bindings-to-json-schema.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:22: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:25: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:114: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

patches/0047-MAINTAINERS-Add-ADV7604-bindings-documentation.patch:

   checkpatch.pl:
	$ cat patches/0047-MAINTAINERS-Add-ADV7604-bindings-documentation.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:25: WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic order

patches/0054-ipu3-cio2-Return-actual-subdev-format.patch:

   checkpatch.pl:
	$ cat patches/0054-ipu3-cio2-Return-actual-subdev-format.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:16: WARNING: email address 'stable@vger.kernel.org # v4.16 and up' might be better as 'stable@vger.kernel.org# v4.16 and up'

patches/0055-ipu3-cio2-Serialise-access-to-pad-format.patch:

   checkpatch.pl:
	$ cat patches/0055-ipu3-cio2-Serialise-access-to-pad-format.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:13: WARNING: email address 'stable@vger.kernel.org # v4.16 and up' might be better as 'stable@vger.kernel.org# v4.16 and up'

patches/0056-ipu3-cio2-Validate-mbus-format-in-setting-subdev-for.patch:

   checkpatch.pl:
	$ cat patches/0056-ipu3-cio2-Validate-mbus-format-in-setting-subdev-for.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:15: WARNING: email address 'stable@vger.kernel.org # v4.16 and up' might be better as 'stable@vger.kernel.org# v4.16 and up'

patches/0057-ipu3-cio2-Make-the-field-on-subdev-format-V4L2_FIELD.patch:

   checkpatch.pl:
	$ cat patches/0057-ipu3-cio2-Make-the-field-on-subdev-format-V4L2_FIELD.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:14: WARNING: email address 'stable@vger.kernel.org # v4.16 and up' might be better as 'stable@vger.kernel.org# v4.16 and up'

patches/0058-ipu3-cio2-Use-unsigned-values-where-appropriate.patch:

   checkpatch.pl:
	$ cat patches/0058-ipu3-cio2-Use-unsigned-values-where-appropriate.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:110: CHECK: Macro argument reuse 'dma' - possible side-effects?

patches/0061-ipu3-cio2-Remove-traces-of-returned-buffers.patch:

   checkpatch.pl:
	$ cat patches/0061-ipu3-cio2-Remove-traces-of-returned-buffers.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:12: WARNING: email address 'stable@vger.kernel.org # v4.16 and up' might be better as 'stable@vger.kernel.org# v4.16 and up'


Error #512 when building PDF docs

