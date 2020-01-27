Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 261AE14A302
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2020 12:26:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729342AbgA0L0W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jan 2020 06:26:22 -0500
Received: from mx1.emlix.com ([188.40.240.192]:35290 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726428AbgA0L0W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jan 2020 06:26:22 -0500
Received: from mailer.emlix.com (unknown [81.20.119.6])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.emlix.com (Postfix) with ESMTPS id 621A65F963;
        Mon, 27 Jan 2020 12:26:20 +0100 (CET)
Subject: Re: 14-bit pixel/media bus formats for i.MX8QM/QXP CSI
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
References: <8885ed8c-6121-d40e-bc45-3ed58f800a95@emlix.com>
 <20200127104233.GC21275@kekkonen.localdomain>
From:   =?UTF-8?Q?Daniel_Gl=c3=b6ckner?= <dg@emlix.com>
Openpgp: preference=signencrypt
Organization: emlix GmbH
Message-ID: <3b44ea7d-76d1-1837-8373-4ac653a47a7b@emlix.com>
Date:   Mon, 27 Jan 2020 12:26:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20200127104233.GC21275@kekkonen.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Am 01/27/20 um 11:42 schrieb Sakari Ailus:
> On Fri, Jan 24, 2020 at 09:36:25PM +0100, Daniel Glöckner wrote:
>> the i.MX8QM and i.MX8QXP contain MIPI CSI-2 controllers that forward the
>> received data on a parallel bus to the Image Sensing Interface (ISI) of
>> the chip. If the data on the MIPI bus is in any of the six RAW formats
>> defined for CSI-2, the CSI controller will shift the values so that the
>> msb is always in bit 13. This was most likely done to allow following
>> hardware to process the data as RAW14 regardless of the actual RAW format.
>> Unfortunately the ISI is not able to shift the bits back before writing it
>> to memory. RAW8 data therefore has to be saved in two bytes per sample with
>> two unused bits at the top and six unused bits at the bottom.

>>  - Is it acceptable to use MEDIA_BUS_FMT_Y14_1X14 in this case instead of
>>    using MEDIA_BUS_FMT_Y12_1X14_PADLO, MEDIA_BUS_FMT_Y10_1X14_PADLO,
>>    MEDIA_BUS_FMT_Y8_1X14_PADLO, MEDIA_BUS_FMT_Y7_1X14_PADLO,
>>    MEDIA_BUS_FMT_Y6_1X14_PADLO? Another 20 _PADLO formats would have to
>>    be added for Bayer.
> 
> I think I'd say yes, you could do this, *if* you're fully certain you'll
> *never* see this CSI-2 receiver paired with any other hardware than the
> ISI, which is the case for instance if it's part of the same device. As if
> there is hardware that can make use of the information on how many bits are
> actually used there, you'd need to expose that information on the uAPI as
> well. Changing that would be an uAPI change, something that should be
> avoided if at all possible.

Given that the NXP revealed that the MIPI DSI controller in the i.MX8 is from
Northwest Logic and the block diagram for the MIPI CSI controller in NXP's
reference manual looks like it was drawn by the same artist who drew the block
diagram in Northwest Logic's DSI product brief, I suspect that the CSI
controller is also an IP core from Northwest Logic. I believe the one currently
advertized on their website is the successor. I don't have access to Northwest
Logic's datasheet, so I can't compare the register layouts.

Looking at the driver from NXP we can probably rule out that the driver will be
used with anything else than NXP hardware. Half of the register accesses in that
driver go to additional logic specific to the i.MX8 (CSR registers) and there is
communication with the chip-internal Cortex-M4 to reset the CSI controller. NXP
placed it into drivers/media/platform/imx8/.

Best regards,

  Daniel
