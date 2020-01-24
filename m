Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8AF148F7C
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2020 21:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387633AbgAXUmW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 15:42:22 -0500
Received: from mx1.emlix.com ([188.40.240.192]:55106 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387395AbgAXUmW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 15:42:22 -0500
X-Greylist: delayed 355 seconds by postgrey-1.27 at vger.kernel.org; Fri, 24 Jan 2020 15:42:22 EST
Received: from mailer.emlix.com (unknown [81.20.119.6])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.emlix.com (Postfix) with ESMTPS id C4DFB5F831;
        Fri, 24 Jan 2020 21:36:25 +0100 (CET)
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
From:   =?UTF-8?Q?Daniel_Gl=c3=b6ckner?= <dg@emlix.com>
Openpgp: preference=signencrypt
Organization: emlix GmbH
Subject: 14-bit pixel/media bus formats for i.MX8QM/QXP CSI
Message-ID: <8885ed8c-6121-d40e-bc45-3ed58f800a95@emlix.com>
Date:   Fri, 24 Jan 2020 21:36:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

the i.MX8QM and i.MX8QXP contain MIPI CSI-2 controllers that forward the
received data on a parallel bus to the Image Sensing Interface (ISI) of
the chip. If the data on the MIPI bus is in any of the six RAW formats
defined for CSI-2, the CSI controller will shift the values so that the
msb is always in bit 13. This was most likely done to allow following
hardware to process the data as RAW14 regardless of the actual RAW format.
Unfortunately the ISI is not able to shift the bits back before writing it
to memory. RAW8 data therefore has to be saved in two bytes per sample with
two unused bits at the top and six unused bits at the bottom.

The drivers for the hardware are still being developed in NXP's repository
at CodeAurora. We have extended them to support greyscale and Bayer
cameras. Now all we need are stable defines for the pixel and media bus
formats for use in libraries and applications and documentation for people
to know their meaning.

To keep the number of needed formats low, we would like to ignore that
there might be unused bits at the bottom. Then we can use the existing
MEDIA_BUS_FMT_S{BGGR,GBRG,GRBG,RGGB}14_1X14 formats between the CSI
controller and the ISI and just have to add a MEDIA_BUS_FMT_Y14_1X14
format. For the pixel formats we would add V4L2_PIX_FMT_Y14 and rebase
e38d5f254ad8 from Sakari's packed12-postponed branch for Bayer.

Now the questions:

 - Is it acceptable to use MEDIA_BUS_FMT_Y14_1X14 in this case instead of
   using MEDIA_BUS_FMT_Y12_1X14_PADLO, MEDIA_BUS_FMT_Y10_1X14_PADLO,
   MEDIA_BUS_FMT_Y8_1X14_PADLO, MEDIA_BUS_FMT_Y7_1X14_PADLO,
   MEDIA_BUS_FMT_Y6_1X14_PADLO? Another 20 _PADLO formats would have to
   be added for Bayer.

 - Given the history of Sakari's packed12-postponed branch, is there a
   chance to get these definitions merged into mainline although the
   driver is not? I fear that NXP's drivers will not hit mainline for a
   long time.

 - Sakari, do you mind me adding the same license header to your
   pixfmt-y14.rst that is used by all other pixfmt-y*.rst files?

Best regards,

  Daniel
