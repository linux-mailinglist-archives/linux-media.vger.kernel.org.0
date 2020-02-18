Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42DF716254F
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2020 12:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgBRLKw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Feb 2020 06:10:52 -0500
Received: from mx1.emlix.com ([188.40.240.192]:59276 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726402AbgBRLKw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Feb 2020 06:10:52 -0500
Received: from mailer.emlix.com (unknown [81.20.119.6])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.emlix.com (Postfix) with ESMTPS id 1E5735F8A2;
        Tue, 18 Feb 2020 12:10:50 +0100 (CET)
Subject: Re: 14-bit pixel/media bus formats for i.MX8QM/QXP CSI
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <8885ed8c-6121-d40e-bc45-3ed58f800a95@emlix.com>
 <20200218013404.GA24051@pendragon.ideasonboard.com>
From:   =?UTF-8?Q?Daniel_Gl=c3=b6ckner?= <dg@emlix.com>
Openpgp: preference=signencrypt
Organization: emlix GmbH
Message-ID: <328cdbf3-8c90-a649-51fc-63aac800e65f@emlix.com>
Date:   Tue, 18 Feb 2020 12:10:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20200218013404.GA24051@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

Am 02/18/20 um 02:34 schrieb Laurent Pinchart:
> On Fri, Jan 24, 2020 at 09:36:25PM +0100, Daniel Glöckner wrote:
>> the i.MX8QM and i.MX8QXP contain MIPI CSI-2 controllers that forward the
>> received data on a parallel bus to the Image Sensing Interface (ISI) of
>> the chip.

>> The drivers for the hardware are still being developed in NXP's repository
>> at CodeAurora.
> 
> Highjacking the thread a little bit, for my information (and thus
> without any commitment of any kind), do you know what the upstreaming
> plan (and in particular the upstreaming timeline) is ?

sorry, I have no information about that and I am not in direct contact
with NXP.

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
