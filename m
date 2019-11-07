Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67AC6F362B
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 18:49:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730441AbfKGRtc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 12:49:32 -0500
Received: from mx2.suse.de ([195.135.220.15]:51358 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729830AbfKGRtc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Nov 2019 12:49:32 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id BCB72AECB;
        Thu,  7 Nov 2019 17:49:30 +0000 (UTC)
Date:   Thu, 7 Nov 2019 18:49:29 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: Logitech C270 webcam floods the log
Message-ID: <20191107184929.7ba13912@endymion>
In-Reply-To: <1573138580.3024.5.camel@suse.com>
References: <20191023151859.30a8ce88@endymion>
        <20191023142016.GA1904@pendragon.ideasonboard.com>
        <20191107143941.1649db47@endymion>
        <20191107145238.0e7c9388@endymion>
        <1573138580.3024.5.camel@suse.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 07 Nov 2019 15:56:20 +0100, Oliver Neukum wrote:
> Am Donnerstag, den 07.11.2019, 14:52 +0100 schrieb Jean Delvare:
> > One more data point: the log flood happens when the uvcvideo driver is
> > loaded but the webcam is unused. If I start e.g. cheese, it takes a
> > long time to start but once started, the log flood stops. As soon as I
> > stop cheese, the log flood starts again.
> 
> try
> 
> usbcore.autosuspend=-1
> 
> on the kernel command line.

That did not help, I still get the USB reset message in a loop.

-- 
Jean Delvare
SUSE L3 Support
