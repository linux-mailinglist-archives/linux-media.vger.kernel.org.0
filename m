Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ACAB2E13E
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 17:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbfE2Phi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 11:37:38 -0400
Received: from gofer.mess.org ([88.97.38.141]:50121 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbfE2Phi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 11:37:38 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D93D260664; Wed, 29 May 2019 16:37:36 +0100 (BST)
Date:   Wed, 29 May 2019 16:37:36 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.3] Minor dvb/rc patches
Message-ID: <20190529153736.gmko7bdr7hfepoxp@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Just a few minor patches.

Thanks,

Sean
--- 
The following changes since commit 8c03d845b86c5fc916cac9027eb5109e771e884f:

  media: sun6i: Support A83T variant (2019-05-29 11:27:55 -0400)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git for-v5.3b

for you to fetch changes up to 29d9472e193bb3d6d53e964c4a3064b9cad20f84:

  media: cx231xx-dvb: fix memory leak in dvb_fini() (2019-05-29 16:29:46 +0100)

----------------------------------------------------------------
Sean Young (3):
      media: em28xx: give RC device proper name
      media: em28xx: use common code for decoding nec scancodes
      media: em28xx: use usb_to_input_id() rather than handrolling it

Young Xiao (1):
      media: cx231xx-dvb: fix memory leak in dvb_fini()

 drivers/media/usb/cx231xx/cx231xx-dvb.c |  1 +
 drivers/media/usb/em28xx/em28xx-input.c | 35 ++++++---------------------------
 2 files changed, 7 insertions(+), 29 deletions(-)
