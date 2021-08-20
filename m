Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C13123F2455
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 03:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235004AbhHTBZn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 21:25:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34466 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232564AbhHTBZm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 21:25:42 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DCCD8C8
        for <linux-media@vger.kernel.org>; Fri, 20 Aug 2021 03:25:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1629422704;
        bh=BFmb3+X1zGKYMMzOzxFEHryTuoKNg7PgZvUXwbra/kE=;
        h=Date:From:To:Subject:From;
        b=tGNdE41i3TkhBhlG8Py1LlCb/Cu2iz7bW38ozBOUXYirJI+juavlstMLYyyRLjqYP
         6bMBsNr0He89PtrdMtgrgWGmClkLih5GU+u6YMTaqGlaArjGiiq1w9XABGDr63lFn1
         LHBouyZdMFGsPTg3umgomCV7UxsqniRhFhC7vsRs=
Date:   Fri, 20 Aug 2021 04:24:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.15] Misc uvcvideo fix
Message-ID: <YR8EZlycatoQXJJz@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead:

  Merge tag 'v5.14-rc4' into media_tree (2021-08-05 16:28:43 +0200)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/uvc-next-20210820

for you to fetch changes up to 2dcecf87f741bb3497186953816a6cb90945d282:

  media: uvcvideo: Remove unused including <linux/version.h> (2021-08-19 23:33:59 +0300)

----------------------------------------------------------------
- Drop version.h

----------------------------------------------------------------
Cai Huoqing (1):
      media: uvcvideo: Remove unused including <linux/version.h>

 drivers/media/usb/uvc/uvc_driver.c | 1 -
 1 file changed, 1 deletion(-)

-- 
Regards,

Laurent Pinchart
