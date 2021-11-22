Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46255458D74
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 12:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236514AbhKVLdP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 06:33:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237365AbhKVLdO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 06:33:14 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E22C061574
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 03:30:06 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 8730FC63A5; Mon, 22 Nov 2021 11:30:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1637580602; bh=/1da65a+UD+VfrEsLyVjKXP4RM9QyzJ5GHb/G7pbub8=;
        h=Date:From:To:Subject:From;
        b=ha6n44EOHd4fPsyV2PRp8jUD/OH8c19hyZAn6e2/sp2sKuG0GhoJAdVvO2Sp8F5/X
         SkCzcGP2uC7fegcAaX6zHeF8xszhHEEONeYQ7Z02jad7Yafu6G5TwKlhn23SLyxHj4
         uAsqved7MPv3wSDsJmjZ3bAlCaw/GdWr/o3bPSivtrHd5GgKG/ehiTSZwpNQGHZwWO
         GMKpb7n9K/DtkDIklSG4nDR4lw5q1rcGPUAByezYYId91GHueyI8Duw+On4ZSutLi0
         ghq2e3CR+/2g2Q7LNZhVFI8zBDbaifmxIupBnn7vc3mLWKjQj1fed6f3bJZPzo8Q1b
         ZsmdzxAwm50EA==
Date:   Mon, 22 Nov 2021 11:30:02 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.16] sparse fix
Message-ID: <20211122113002.GA5912@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 0d2517b3765aa331aee0a95f9b8072062d6bb7e5:

  media: hantro: Support NV12 on the G2 core (2021-11-22 07:53:37 +0000)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.17b

for you to fetch changes up to 572799dfa023b2902223d5696031eebd13ee2d11:

  media: meson-ir-tx: remove incorrect doc comment (2021-11-22 11:23:32 +0000)

----------------------------------------------------------------
v5.17b

----------------------------------------------------------------
Sean Young (1):
      media: meson-ir-tx: remove incorrect doc comment

 drivers/media/rc/meson-ir-tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
