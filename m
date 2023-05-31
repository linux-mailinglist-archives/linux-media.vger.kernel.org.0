Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B75A07183FF
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 15:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237136AbjEaN4G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 09:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237628AbjEaNzB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 09:55:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140A046AA
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 06:48:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126205251136.34.openmobile.ne.jp [126.205.251.136])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E4567F5
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 15:45:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685540753;
        bh=mOdnb0iUiiZXOYuMPYYfCkBJ5PBBWTVBxwROL3Rg7uI=;
        h=Date:From:To:Subject:From;
        b=gpfoe1+8MeXIOuaURNFb0kbORIkOtnis0BjhFk9NeSIbEEPEPeHmXvbPuRbPJudq5
         mhT6ZlQavLahYH/L/DLCJb4kLz/IbAgrVGFr+duUE7dFlw0+X4+PkPOz/vvMEW5/ak
         Xc/8AReKPQFAdaytVLQXxJyENbVG6QhN94LYFhlk=
Date:   Wed, 31 May 2023 16:46:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR v6.4] uvcvideo fix
Message-ID: <20230531134613.GA25031@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit a05e9aabd9dc27fc8888678391e3bf78624f8253:

  media: staging: media: atomisp: init high & low vars (2023-05-26 10:52:50 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/fixes-20230531

for you to fetch changes up to 757374b220894ed81013df2bf359390ac040ca3f:

  media: uvcvideo: Don't expose unsupported formats to userspace (2023-05-31 16:15:59 +0300)

----------------------------------------------------------------
uvcvideo regression fix

----------------------------------------------------------------
Laurent Pinchart (1):
      media: uvcvideo: Don't expose unsupported formats to userspace

 drivers/media/usb/uvc/uvc_driver.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

-- 
Regards,

Laurent Pinchart
