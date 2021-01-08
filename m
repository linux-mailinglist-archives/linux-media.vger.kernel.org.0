Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9A32EF2D7
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 14:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbhAHNEl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 08:04:41 -0500
Received: from smtp2.macqel.be ([109.135.2.61]:29587 "EHLO smtp2.macqel.be"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726011AbhAHNEl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Jan 2021 08:04:41 -0500
X-Greylist: delayed 619 seconds by postgrey-1.27 at vger.kernel.org; Fri, 08 Jan 2021 08:04:41 EST
Received: from localhost (localhost [127.0.0.1])
        by smtp2.macqel.be (Postfix) with ESMTP id 696AF150A82
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 13:53:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at macqel.be
Received: from smtp2.macqel.be ([127.0.0.1])
        by localhost (mail.macqel.be [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id jFilgJT1WiYR for <linux-media@vger.kernel.org>;
        Fri,  8 Jan 2021 13:53:34 +0100 (CET)
Received: from frolo.macqel.be (frolo.macqel [10.1.40.73])
        by smtp2.macqel.be (Postfix) with ESMTP id C8FAD150A81
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 13:53:34 +0100 (CET)
Received: by frolo.macqel.be (Postfix, from userid 1000)
        id 9F443BEC0C8; Fri,  8 Jan 2021 13:53:34 +0100 (CET)
Date:   Fri, 8 Jan 2021 13:53:34 +0100
From:   Philippe De Muyter <phdm@macq.eu>
To:     linux-media@vger.kernel.org
Subject: UTC timestamps in v4l2 buffers
Message-ID: <20210108125334.GA30740@frolo.macqel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.16 (2007-06-09)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I need to have the v4l2 buffers of my camera sensor timestamped with a
precise (1ms) UTC timestamp, in order to be able to match images from cameras
from several computers (that are of course synchronised with NTP, GPS or PTP).

While I had that some years ago and still have in computers running
freescale's 4.1.15 port for imx6q, I have now discovered that 8 years ago
a decision has been taken by the v4l2 maintainers to switch the timestamp
of the v4l2 buffers to CLOCK_MONOTONIC, which is useless when one needs
to synchronise timestamps of images taken by cameras on different computers,
which of course were not booted at the same time.

At that time a new flag "V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC" was introduced
to tell new users that the timestamp was no more the old and not standardized
behaviour for timestamp, but the new CLOCK_MONOTONIC-based timestamp, but
no other flag for UTC or way to choose which kind of timestamp one wants.

Are there since then new standardized or work-in-progess flag to tell users
that the timestamp is UTC, and way to ask the camera-acquisistion driver to
give that UTC timestamp instead of the CLOCK_MONOTONIC one ?

Best regards.

Philippe

-- 
Philippe De Muyter +32 2 6101532 Macq SA rue de l'Aeronef 2 B-1140 Bruxelles
