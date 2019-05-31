Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B95D3155B
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 21:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfEaTad (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 15:30:33 -0400
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]:43735 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfEaTad (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 15:30:33 -0400
Received: from belgarion ([90.76.40.119])
        by mwinf5d45 with ME
        id K7Vx200082aFDoA037WRsS; Fri, 31 May 2019 21:30:29 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Fri, 31 May 2019 21:30:29 +0200
X-ME-IP: 90.76.40.119
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH v2] media: mt9m111: add regulator support
References: <67b53f91ede9e9ffdda913c818065095a726b92e.1559157595.git.mchehab+samsung@kernel.org>
        <20190531112723.ijhkpi354ussgvxq@kekkonen.localdomain>
        <20190531100240.6f9e5c12@coco.lan>
X-URL:  http://belgarath.falguerolles.org/
Date:   Fri, 31 May 2019 21:29:57 +0200
In-Reply-To: <20190531100240.6f9e5c12@coco.lan> (Mauro Carvalho Chehab's
        message of "Fri, 31 May 2019 10:03:44 -0300")
Message-ID: <87blzi5sne.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Mauro Carvalho Chehab <mchehab+samsung@kernel.org> writes:

> Hi Sakari,
>
> Em Fri, 31 May 2019 14:27:24 +0300
> Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
>
>> Hi Mauro,
>> 
>> On Wed, May 29, 2019 at 03:25:18PM -0400, Mauro Carvalho Chehab wrote:
>> > From: Robert Jarzmik <robert.jarzmik@free.fr>
>
> As stated here, this patch is not really mine. It is a rebased version of a 
> patch that was delegated to a sub-maintainer, being on his queue for more
> than 2 years.
Hi Mauro,

And if you need it, I can respin this patch for a v3, as I'm the original author
AFAIR. And as soon as my brain recovers from my flu, I can also test it if need
be.

You can ask whatever you need, I will help.

Cheers.

--
Robert
