Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A239B33957
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 21:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbfFCTzF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 15:55:05 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:39168 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfFCTzE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 15:55:04 -0400
Received: from belgarion ([90.76.40.119])
        by mwinf5d15 with ME
        id LKus200022aFDoA03Kuxvt; Mon, 03 Jun 2019 21:55:02 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Mon, 03 Jun 2019 21:55:02 +0200
X-ME-IP: 90.76.40.119
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH v2] media: mt9m111: add regulator support
References: <67b53f91ede9e9ffdda913c818065095a726b92e.1559157595.git.mchehab+samsung@kernel.org>
X-URL:  http://belgarath.falguerolles.org/
Date:   Mon, 03 Jun 2019 21:54:51 +0200
In-Reply-To: <67b53f91ede9e9ffdda913c818065095a726b92e.1559157595.git.mchehab+samsung@kernel.org>
        (Mauro Carvalho Chehab's message of "Wed, 29 May 2019 15:25:18 -0400")
Message-ID: <87y32i30ms.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Mauro Carvalho Chehab <mchehab+samsung@kernel.org> writes:

> From: Robert Jarzmik <robert.jarzmik@free.fr>
>
> In the soc_camera removal, the board specific power callback was
> dropped. This at least will remove the power optimization from ezx and
> em-x270 pxa based boards.
>
> As to recreate the same level of functionality, make the mt9m111 have a
> regulator providing it its power, so that board designers can plug in a
> gpio based or ldo regulator, mimicking their former soc_camera power
> hook.
>
> Fixes: 5c10113cc668 ("media: mt9m111: make a standalone v4l2 subdevice")
>
> [mchehab+samsung@kernel.org: check return values for regulator_enable and
>  fix a build warning]
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Tested-by: Robert Jarzmik <robert.jarzmik@free.fr>
(on mioa701, pxa architecture, platform data based, on top of 5.0-rc1)

Cheers.

--
Robert
