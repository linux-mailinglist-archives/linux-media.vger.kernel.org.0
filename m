Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF613080E1
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 23:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbhA1WBQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 17:01:16 -0500
Received: from smtp2.macqel.be ([109.135.2.61]:25713 "EHLO smtp2.macqel.be"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229596AbhA1WBL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 17:01:11 -0500
Received: from localhost (localhost [127.0.0.1])
        by smtp2.macqel.be (Postfix) with ESMTP id 748D8130D3D;
        Thu, 28 Jan 2021 23:00:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at macqel.be
Received: from smtp2.macqel.be ([127.0.0.1])
        by localhost (mail.macqel.be [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id s0elgoRQjQxI; Thu, 28 Jan 2021 23:00:09 +0100 (CET)
Received: from frolo.macqel.be (frolo.macqel [10.1.40.73])
        by smtp2.macqel.be (Postfix) with ESMTP id DBEA3130D3B;
        Thu, 28 Jan 2021 23:00:09 +0100 (CET)
Received: by frolo.macqel.be (Postfix, from userid 1000)
        id B58EABEC0C8; Thu, 28 Jan 2021 23:00:09 +0100 (CET)
Date:   Thu, 28 Jan 2021 23:00:09 +0100
From:   Philippe De Muyter <phdm@macq.eu>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media@vger.kernel.org
Subject: Re: UTC timestamps in v4l2 buffers
Message-ID: <20210128220009.GA7708@frolo.macqel>
References: <20210108125334.GA30740@frolo.macqel> <e3c363b505cef5a7310ae293bccf6fac43fa71c2.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3c363b505cef5a7310ae293bccf6fac43fa71c2.camel@ndufresne.ca>
User-Agent: Mutt/1.5.16 (2007-06-09)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Nicolas,

On Thu, Jan 28, 2021 at 03:14:03PM -0500, Nicolas Dufresne wrote:
> Le vendredi 08 janvier 2021 à 13:53 +0100, Philippe De Muyter a écrit :
> > Hello,
> > 
> > I need to have the v4l2 buffers of my camera sensor timestamped with a
> > precise (1ms) UTC timestamp, in order to be able to match images from cameras
> > from several computers (that are of course synchronised with NTP, GPS or PTP).
> > 
> > While I had that some years ago and still have in computers running
> > freescale's 4.1.15 port for imx6q, I have now discovered that 8 years ago
> > a decision has been taken by the v4l2 maintainers to switch the timestamp
> > of the v4l2 buffers to CLOCK_MONOTONIC, which is useless when one needs
> > to synchronise timestamps of images taken by cameras on different computers,
> > which of course were not booted at the same time.
> > 
> > At that time a new flag "V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC" was introduced
> > to tell new users that the timestamp was no more the old and not standardized
> > behaviour for timestamp, but the new CLOCK_MONOTONIC-based timestamp, but
> > no other flag for UTC or way to choose which kind of timestamp one wants.
> > 
> > Are there since then new standardized or work-in-progess flag to tell users
> > that the timestamp is UTC, and way to ask the camera-acquisistion driver to
> > give that UTC timestamp instead of the CLOCK_MONOTONIC one ?
> 
> Considering the CLOCK_MONOTONIC and CLOCK_REALTIME have the same slope (respond
> to adjtime), you can probably just sample both clock in your application in
> order to maintain a delta between both clocks. The more often your sample it,
> the more precise you can derive. Don't forget to read REALTIME/MONOTONIC and
> MONOTONIC/REALTIME orders, so you can averate to the real value. (GStreamer
> needs to be improved in this regard).

I am now actually working with nvidia jetson modules, with a 4.9-based
kernel containing added, but not mainstream, nvidia drivers.  Nvidia jetson
modules contain a separate cpu called rtcpu that does only image capture
and timestamps the captured frames with its clock ticking at 32 ns, and
then does exactly what you explain above to convert it to the MONOTONIC clock.
I have modified that code to convert it to the REALTIME clock instead, so
my driver really provides a very precise UTC timestamp with each captured frame.
Unfortunately v4l2src simply discards my UTC timestamp and replaces it by
what seems to be the MONOTONIC clock. It does not matter if I tag my timestamp
with V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC or V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN,
the result stay identical.

This is with gstreamer-1.14.

I still do not understand why v4l2 requires that the timestamp associated to
buffers are based on the MONOTONIC clock, and why v4l2src discards a 
REALTIME clock if v4l2 gives it.  On a well synchronized system, the
REALTIME clock is as monotonic as the MONOTONIC clock, except when a leap
second is sometimes subtracted at the end of June or December, and I can
live with that.  gstreamer may use its own clock for internal purposes,
but why forbid drivers to provide a REALTIME clock based timestamp ?

just my 2 cents

Philippe
