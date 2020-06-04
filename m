Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B921EEAAC
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 20:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729093AbgFDSzR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 14:55:17 -0400
Received: from mailoutvs56.siol.net ([185.57.226.247]:52635 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728476AbgFDSzQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 14:55:16 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 74C5F5204BB;
        Thu,  4 Jun 2020 20:55:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 69uBF3PPSFrh; Thu,  4 Jun 2020 20:55:13 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 0DE0952112F;
        Thu,  4 Jun 2020 20:55:13 +0200 (CEST)
Received: from kista.localdomain (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 5224F5204BB;
        Thu,  4 Jun 2020 20:55:08 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     paul.kocialkowski@bootlin.com, mripard@kernel.org
Cc:     mchehab@kernel.org, wens@csie.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, jonas@kwiboo.se, nicolas@ndufresne.ca,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] media: uapi: cedrus: Fix decoding interlaced H264 content
Date:   Thu,  4 Jun 2020 20:57:42 +0200
Message-Id: <20200604185745.23568-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently H264 interlaced content it's not properly decoded on Cedrus.
There are two reasons for this:
1. slice parameters control doesn't provide enough information
2. bug in frame list construction in Cedrus driver

As described in commit message in patch 1, references stored in
reference lists should tell if reference targets top or bottom field.
However, this information is currently not provided. Patch 1 adds
it in form of flags which are set for each reference. Patch 2 then
uses those flags in Cedrus driver.

Frame list construction is fixed in patch 3.

This solution was extensively tested using Kodi on LibreELEC with A64,
H3, H5 and H6 SoCs in slightly different form (flags were transmitted
in MSB bits in index).

Note: I'm not 100% sure if flags for both, top and bottom fields are
needed. Any input here would be welcome.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (3):
  media: uapi: h264: update reference lists
  media: cedrus: h264: Properly configure reference field
  media: cedrus: h264: Fix frame list construction

 .../media/v4l/ext-ctrls-codec.rst             | 40 ++++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 27 +++++++------
 include/media/h264-ctrls.h                    | 12 +++++-
 3 files changed, 62 insertions(+), 17 deletions(-)

--=20
2.27.0

