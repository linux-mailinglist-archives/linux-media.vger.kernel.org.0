Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A579037F4F7
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 11:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232458AbhEMJnZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 May 2021 05:43:25 -0400
Received: from honk.sigxcpu.org ([24.134.29.49]:60984 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231980AbhEMJnY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 May 2021 05:43:24 -0400
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 09A8FFB03;
        Thu, 13 May 2021 11:42:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id j5roLQSI2tEf; Thu, 13 May 2021 11:42:12 +0200 (CEST)
Date:   Thu, 13 May 2021 11:42:10 +0200
From:   Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     phone-devel@vger.kernel.org, martijn@brixit.nl,
        linux-media@vger.kernel.org, martin.kepplinger@puri.sm,
        dorota.czaplejewicz@puri.sm
Subject: Re: Recording videos on phones and camera on Librem 5 devboard
Message-ID: <YJz0cn4OrXNhRDoO@bogon.m.sigxcpu.org>
References: <20210512214702.GB27652@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512214702.GB27652@duo.ucw.cz>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pavel,
On Wed, May 12, 2021 at 11:47:02PM +0200, Pavel Machek wrote:
> Hi!
> 
> Who is the right person to talk about Librem 5 cameras? Is there
> mailing list I should use?

I think most of the coordination is mostly happening via the gitlab issues in

https://source.puri.sm/Librem5/linux-next

Maybe Martin and Dorota who are working on the camera drivers (put in cc:)
have a more suggestions.

> 
> AFAICS from bugzillas, it is still not compeletely working. I see
> megapixels packaged in the repository, but without required config
> files. Are there work-in-progress configurations somewhere? Would it
> be useful if I tried to get it to work on the devboard?

Megapixels work is mostly happening here atm:

https://source.puri.sm/dorota.czaplejewicz/megapixels

Cheers,
 -- Guido

> 
> I created simple python+gtk+gstreamer application to take photos,
> pictures and record videos. It is in tui repository; it is work on
> progress but some functionality is available on PinePhone, Librem 5
> devboard and a PC. If someone could test it on actual Librem 5... that
> would be nice.
> 
> https://gitlab.com/tui/tui/-/tree/master/cam
> 
> Best regards,
> 										Pavel
> 
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> 


