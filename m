Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75D2CE1C2C
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2019 15:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391308AbfJWNSt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 09:18:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:37880 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726283AbfJWNSs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 09:18:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 5564EB59F;
        Wed, 23 Oct 2019 13:18:47 +0000 (UTC)
Date:   Wed, 23 Oct 2019 15:18:59 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Logitech C270 webcam floods the log
Message-ID: <20191023151859.30a8ce88@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

When my Logitech C270 webcam is plugged in, my kernel log gets filled
with this message:

usb 3-4.1: reset high-speed USB device number 4 using xhci_hcd

every 5 seconds. I have the same problem on 3 different Intel-based
computers (different generations), using 2 different webcams, same
brand "same model".

Is Logitech doing crappy hardware these days, or are we doing something
wrong? Is there any way to know the reason that triggers the reset?

I would be more than happy to provide any relevant debugging
information if anyone is able to make it stop. As it stands, I must
plug my webcam before using it and unplug it as soon as I'm done, which
isn't exactly convenient.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
