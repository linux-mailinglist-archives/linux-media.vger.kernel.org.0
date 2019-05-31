Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2B831587
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 21:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727401AbfEaTnF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 15:43:05 -0400
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]:40440 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727147AbfEaTnF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 15:43:05 -0400
Received: from belgarion ([90.76.40.119])
        by mwinf5d45 with ME
        id K7j2200032aFDoA037j2ME; Fri, 31 May 2019 21:43:03 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Fri, 31 May 2019 21:43:03 +0200
X-ME-IP: 90.76.40.119
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH v2] media: mt9m111: add regulator support
References: <67b53f91ede9e9ffdda913c818065095a726b92e.1559157595.git.mchehab+samsung@kernel.org>
        <CAC5umyiXQ_20okmTgs1uJ1Jqi=SkwRWYHsz4ugP3tarozNqqAg@mail.gmail.com>
X-URL:  http://belgarath.falguerolles.org/
Date:   Fri, 31 May 2019 21:43:02 +0200
In-Reply-To: <CAC5umyiXQ_20okmTgs1uJ1Jqi=SkwRWYHsz4ugP3tarozNqqAg@mail.gmail.com>
        (Akinobu Mita's message of "Thu, 30 May 2019 23:21:49 +0900")
Message-ID: <877ea65s1l.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Akinobu Mita <akinobu.mita@gmail.com> writes:

>> Can anyone test this patch and send a tested-by?
>
> In my devicetree, vdd-supply is not defined.  So it falls back to the dummy
> regulator and works fine.
Would that work also in a non devicetree build, ie. in a platform_data based one
(as this is one of the mach-pxa targets) ?

Cheers.

-- 
Robert
