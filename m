Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7148A1626BE
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2020 14:04:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgBRNE1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Feb 2020 08:04:27 -0500
Received: from mx1.emlix.com ([188.40.240.192]:59552 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726340AbgBRNE1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Feb 2020 08:04:27 -0500
Received: from mailer.emlix.com (unknown [81.20.119.6])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.emlix.com (Postfix) with ESMTPS id 8E6D25F8A5;
        Tue, 18 Feb 2020 14:04:25 +0100 (CET)
Subject: Re: 14-bit pixel/media bus formats for i.MX8QM/QXP CSI
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
References: <8885ed8c-6121-d40e-bc45-3ed58f800a95@emlix.com>
 <20200127104233.GC21275@kekkonen.localdomain>
 <3b44ea7d-76d1-1837-8373-4ac653a47a7b@emlix.com>
 <20200127114608.GD21275@kekkonen.localdomain>
From:   =?UTF-8?Q?Daniel_Gl=c3=b6ckner?= <dg@emlix.com>
Openpgp: preference=signencrypt
Organization: emlix GmbH
Message-ID: <57965d4b-87b8-bad5-068b-6e9a861d0279@emlix.com>
Date:   Tue, 18 Feb 2020 14:04:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20200127114608.GD21275@kekkonen.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Sakari,

sorry for the late reply.

Am 01/27/20 um 12:46 schrieb Sakari Ailus:
> On Mon, Jan 27, 2020 at 12:26:20PM +0100, Daniel Glöckner wrote:
>> Looking at the driver from NXP we can probably rule out that the driver will be
>> used with anything else than NXP hardware. Half of the register accesses in that
>> driver go to additional logic specific to the i.MX8 (CSR registers) and there is
> 
> What do those registers do, roughly?

Enable signals between the ISI and the CSI controller, change sync polarity,
provide PHY status bits, settings for interlaced mode, power management, etc.

>> placed it into drivers/media/platform/imx8/.
> 
> Should I assume this CSI-2 receiver will have its own compatible string
> specific to these two SoCs?

It is fsl,mxc-mipi-csi2.

And they wrote a second driver used on other SoCs (i.MX8MQ) that, according to
its first commit message, should eventually be merged with the first driver.
Its compatible string is simply fsl,mxc-mipi-csi2_yav. That driver accesses
just a single GPR register which contains a subset of the bits found in the
CSR registers of the i.MX8QXP.

Best regards,

  Daniel

-- 
Besuchen Sie uns auf der Embedded World 2020 in Nürnberg!
-> Halle 4, Stand 368

Dipl.-Math. Daniel Glöckner, emlix GmbH, http://www.emlix.com
Fon +49 551 30664-0, Fax +49 551 30664-11,
Gothaer Platz 3, 37083 Göttingen, Germany
Sitz der Gesellschaft: Göttingen, Amtsgericht Göttingen HR B 3160
Geschäftsführung: Heike Jordan, Dr. Uwe Kracke
Ust-IdNr.: DE 205 198 055

emlix - your embedded linux partner
