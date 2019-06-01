Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5470C31B47
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2019 12:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbfFAKjm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jun 2019 06:39:42 -0400
Received: from gofer.mess.org ([88.97.38.141]:45003 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726109AbfFAKjm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 1 Jun 2019 06:39:42 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A1C5260419; Sat,  1 Jun 2019 11:39:40 +0100 (BST)
Date:   Sat, 1 Jun 2019 11:39:40 +0100
From:   Sean Young <sean@mess.org>
To:     Brad Love <brad@nextdimension.cc>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org
Subject: Re: [PATCH v6 0/4] Add Hauppauge HVR1955/1975 devices
Message-ID: <20190601103940.c6bdizhdntifl3sq@gofer.mess.org>
References: <1559326785-26574-1-git-send-email-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559326785-26574-1-git-send-email-brad@nextdimension.cc>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 31, 2019 at 01:19:41PM -0500, Brad Love wrote:
> Hauppauge device HVR1955 and HVR1975 are old Cypress based
> devices. When originally produced the demods were lacking
> upstream drivers and the tuner was unsupported. Well fast
> forward to now and the only thing missing is the identification
> of si2177 tuner in the si2157 driver, as well as extension
> of the pvrusb2 driver to accommodate i2c client devices
> and multiple frontends. This series addresses what is necessary.
> 
> QAM/ATSC are fully tested and work, the DVB tuning
> *should* work, but is completely untested. Both demod
> drivers are compatible with multiple frontend usage due
> to previous patches I've submitted, so things should
> work in pvrusb2 as well.
> 
> Composite video input is tested. Unable to test s-video,
> but it should work. Radio is fully untested. Analog TV is
> a work in progress, coming soon.

Looks great!

Reviewed-by: Sean Young <sean@mess.org>

> 
> HVR-1955:
> - LGDT3306a ATSC/QAM demod
> - si2177 tuner
> - cx25840 decoder for analog tv/composite/s-video/audio
> 
> HVR-1975 dual-frontend:
> - LGDT3306a ATSC/QAM demod
> - si2168 DVB-C/T/T2 demod
> - si2177 tuner
> - cx25840 decoder for analog tv/composite/s-video/audio
> 
> Since v5:
> - le16_to_cpu fix
> Since v4:
> - Checkpatch strict fixes
> Since v3:
> - Fix firmware name to be consistent
> Since v2:
> - Patch 4/4 build fix
> Changes since v1:
> - Patch 4/4 build fixes and reorganization
> 
> 
> Brad Love (4):
>   si2157: add detection of si2177 tuner
>   pvrusb2: Add multiple dvb frontend support
>   pvrusb2: Add i2c client demod/tuner support
>   pvrusb2: Add Hauppauge HVR1955/1975 devices
> 
>  drivers/media/tuners/si2157.c                   |   6 +
>  drivers/media/tuners/si2157_priv.h              |   3 +-
>  drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c |  25 +++
>  drivers/media/usb/pvrusb2/pvrusb2-devattr.c     | 202 +++++++++++++++++++++---
>  drivers/media/usb/pvrusb2/pvrusb2-devattr.h     |   1 +
>  drivers/media/usb/pvrusb2/pvrusb2-dvb.c         |  88 ++++++++---
>  drivers/media/usb/pvrusb2/pvrusb2-dvb.h         |   5 +-
>  drivers/media/usb/pvrusb2/pvrusb2-fx2-cmd.h     |   4 +
>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c         |  36 ++++-
>  9 files changed, 330 insertions(+), 40 deletions(-)
> 
> -- 
> 2.7.4
