Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1999824E
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 20:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbfHUSFI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 14:05:08 -0400
Received: from www.linuxtv.org ([130.149.80.248]:41354 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727291AbfHUSFI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 14:05:08 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1i0Uyn-00087z-1q; Wed, 21 Aug 2019 18:05:05 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1i0Uyq-00027R-UX; Wed, 21 Aug 2019 18:05:08 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.4] More DVB/RC changes
Date:   Wed, 21 Aug 2019 18:05:08 +0000
Message-Id: <20190821180508.8104-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821130434.gh4drkm6tiawzbpg@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/58337/
Build log: https://builder.linuxtv.org/job/patchwork/12667/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20190821130434.gh4drkm6tiawzbpg@gofer.mess.org

gpg: Signature made Wed 21 Aug 2019 12:58:58 PM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: A624 251A 2608 4A9E D9E4  C8B6 425F 639D 3960 FA9E


Build aborted due to a fatal error:
FAILED: patch patch patches/0009-dt-bindings-media-Convert-Allwinner-A10-IR-to-a-sche.patch doesn't apply:
Applying patch patches/0009-dt-bindings-media-Convert-Allwinner-A10-IR-to-a-sche.patch
patching file Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
patching file Documentation/devicetree/bindings/media/sunxi-ir.txt
Hunk #1 FAILED at 1.
Not deleting file Documentation/devicetree/bindings/media/sunxi-ir.txt as content differs from patch
1 out of 1 hunk FAILED -- rejects in file Documentation/devicetree/bindings/media/sunxi-ir.txt
Patch patches/0009-dt-bindings-media-Convert-Allwinner-A10-IR-to-a-sche.patch does not apply (enforce with -f)

