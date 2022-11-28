Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C53A163A9C0
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 14:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbiK1NjZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 08:39:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbiK1NjQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 08:39:16 -0500
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 274111E710
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 05:39:14 -0800 (PST)
Date:   Mon, 28 Nov 2022 13:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1669642752; x=1669901952;
        bh=j6kZeSNa5n4OY2B5LtGRcQE9SBFPnH8Ye3e9Fe3mcQk=;
        h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=aDeOmgSiSt4z7wm7r8jKuoPazKnguig03wwkJIauTIrVw1BEOyFFTzABHig7fMzQS
         XLEC7GbqCZ5YSDQLqzSpo8LPGdlWpbHU8gDldhl5QnUYtc3I44rGjgHtHq4y/uSOA4
         KPAz4rOw1FvSYUcWpqsoT2fQpwvZweS/8MkQEc3xZ+pmxweQk52Uo/qBJcq0Hkq6v7
         WPT8HlozCfnR2AyDR5EGSEtqq0yDzLFg0qgFT5KPzMwBUVt1XxiGF91/z4bQd/cCYW
         8a87PxZwMpsrOMB9/ldCKeL6ABrcrAkeaO9+i6S+bYWR0DjZhfxMqbyk7DaO9OZ79g
         NqbaLxmEv72sQ==
To:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
From:   Simon Ser <contact@emersion.fr>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH] doc: add dma-buf IOCTL code to table
Message-ID: <20221128133853.355645-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code 'b' is used for dma-buf IOCTLs.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documenta=
tion/userspace-api/ioctl/ioctl-number.rst
index 5f81e2a24a5c..184a7a222701 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -221,6 +221,7 @@ Code  Seq#    Include File                             =
              Comments
 'a'   00-0F  drivers/crypto/qat/qat_common/adf_cfg_common.h          confl=
ict! qat driver
 'b'   00-FF                                                          confl=
ict! bit3 vme host bridge
                                                                      <mail=
to:natalia@nikhefk.nikhef.nl>
+'b'   00-0F  linux/dma-buf.h                                         confl=
ict!
 'c'   all    linux/cm4000_cs.h                                       confl=
ict!
 'c'   00-7F  linux/comstats.h                                        confl=
ict!
 'c'   00-7F  linux/coda.h                                            confl=
ict!
--=20
2.38.1


