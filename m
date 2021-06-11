Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D98493A3D7A
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 09:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231604AbhFKHrY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 03:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231197AbhFKHrY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 03:47:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD392C061574
        for <linux-media@vger.kernel.org>; Fri, 11 Jun 2021 00:45:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3AE684AD;
        Fri, 11 Jun 2021 09:45:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623397525;
        bh=2HHnc1i58p6zPOxbatBTXRfvk/5kL/j2ppzFUctk6eM=;
        h=Date:From:To:Cc:Subject:From;
        b=Fj1Evb4UsdNPVuVQX9TSRMBX/c1m/9hf9i4JuqsaDiLThtWO8X93WDHeg6Olab306
         4P7VTJRbfc54eLmJ2vONiOEJxDV46d7YoLBvsBqOetGgsOL+NUOY0AatPRPi/mnFh2
         aZ7PfegxnVZx3QqLXkQ+lA24MtHqTgAmI3T+O7zo=
Date:   Fri, 11 Jun 2021 10:45:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Benjamin Drung <bdrung@posteo.de>
Subject: [GIT PULL FOR v5.14] uvcvideo fix
Message-ID: <YMMUgjx67yfqvKNV@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 5b448065febe1c6bb6693735844f2fb2b7b654dc:

  media: pci: tw5864: avoid usage of some characters (2021-06-04 08:11:12 +0200)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/uvc-20210611

for you to fetch changes up to 8387e8c7534ca5fafa4db0551bf85f2349a99ad7:

  media: uvcvideo: Fix pixel format change for Elgato Cam Link 4K (2021-06-10 17:10:08 +0300)

----------------------------------------------------------------
- uvcvideo fix

----------------------------------------------------------------
Benjamin Drung (1):
      media: uvcvideo: Fix pixel format change for Elgato Cam Link 4K

 drivers/media/usb/uvc/uvc_video.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

-- 
Regards,

Laurent Pinchart
