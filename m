Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E17144451C5
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 11:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbhKDK4X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 06:56:23 -0400
Received: from comms.puri.sm ([159.203.221.185]:34382 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230148AbhKDK4X (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 06:56:23 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 74CF9DF8FD;
        Thu,  4 Nov 2021 03:53:13 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 6Jh-WYjXlZqt; Thu,  4 Nov 2021 03:53:12 -0700 (PDT)
Message-ID: <209f26d7e2b156818e55eac357c434f599e2ecda.camel@puri.sm>
Subject: Re: [PATCH v3 0/2] media: hi846: minor build fixes
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     kernel@puri.sm, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, lkp@intel.com, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com
Date:   Thu, 04 Nov 2021 11:53:08 +0100
In-Reply-To: <YXASUAHcvQlWefwp@paasikivi.fi.intel.com>
References: <20211019155509.1018130-1-martin.kepplinger@puri.sm>
         <YXASUAHcvQlWefwp@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, dem 20.10.2021 um 15:57 +0300 schrieb Sakari Ailus:
> On Tue, Oct 19, 2021 at 05:55:07PM +0200, Martin Kepplinger wrote:
> > Similar to many other drivers this basically should fix the build
> > warning
> > where the const struct of_device_id we define can be unused.
> > Reported
> > here:
> > https://lore.kernel.org/linux-media/202110170632.b6umsB8m-lkp@intel.com/
> 
> Thanks, Martin!> 
> 

since the Intel test robot just reminded me that the issue still
remains: are these patches queued somewhere already?

thanks!
                         martin

