Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B46740C0F8
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 09:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbhIOHyv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 03:54:51 -0400
Received: from gofer.mess.org ([88.97.38.141]:39899 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231480AbhIOHyv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 03:54:51 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 89D85C63A9; Wed, 15 Sep 2021 08:53:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1631692411; bh=HYFGrTcP1zO9jCZIjnc+BispDfGzV2TWBMAwyFI7fZw=;
        h=Date:From:To:Subject:From;
        b=bAidln/gYIBVIbrUQdanW0USK7KSVRrj56sBvozuAsYidixpjZKckzTVqpeIV76dP
         qsqQGWoxgRMMYycRIrwG0e3jNkU/lmbP+uo8KSzreD6X1DRdbpWFW7CY+E6yPPuiNt
         1ZVQ2hdcWZStQimIUXBvUWCces4F1YI8l4MerGlvjC2YqbCv2W98TPL6oHfsvEP4vL
         GSGEgBMC5w0mGNSI/AkLt+I7Bc92UmaJGP29cwAwk5BxPZ+vSaW1jKC9S52KDp8VPh
         KfcuGnKxGs2rdvYvtoJXDooDPcOp58KL5bF9k0kiN0E1MCTMkOEwVssVJp17vw2iQJ
         3VFrgRRk+ggBg==
Date:   Wed, 15 Sep 2021 08:53:31 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR v5.15] Fix for IR Toy issue
Message-ID: <20210915075331.GA8620@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

The IR Toy device might hang if it receives IR while an transmit command
is sent. Presumably this is an issue in the firmware, however this works
around the issue.

Thanks

Sean

The following changes since commit 3ad02c27d89d72b3b49ac51899144b7d0942f05f:

  media: s5p-jpeg: rename JPEG marker constants to prevent build warnings (2021-09-07 07:57:59 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.15f

for you to fetch changes up to ec348aed3d14269855027751488bf4d33547f8db:

  media: ir_toy: prevent device from hanging during transmit (2021-09-14 22:09:48 +0100)

----------------------------------------------------------------
v5.15f

----------------------------------------------------------------
Sean Young (1):
      media: ir_toy: prevent device from hanging during transmit

 drivers/media/rc/ir_toy.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)
