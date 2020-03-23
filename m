Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 694B518F029
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 08:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbgCWHNl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 03:13:41 -0400
Received: from retiisi.org.uk ([95.216.213.190]:55524 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727369AbgCWHNl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 03:13:41 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 60931634C8B;
        Mon, 23 Mar 2020 09:13:36 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jGHHD-0000Mq-AD; Mon, 23 Mar 2020 09:13:35 +0200
Date:   Mon, 23 Mar 2020 09:13:35 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Matt Ranostay <matt.ranostay@konsulko.com>
Cc:     linux-media@vger.kernel.org, rdunlap@infradead.org
Subject: Re: [PATCH] media: i2c: video-i2c: fix build errors due to 'imply
 hwmon'
Message-ID: <20200323071335.GA853@valkosipuli.retiisi.org.uk>
References: <20200322011833.231963-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200322011833.231963-1-matt.ranostay@konsulko.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Mar 21, 2020 at 06:18:33PM -0700, Matt Ranostay wrote:
> Fix build fault when CONFIG_HWMON is a module, and CONFIG_VIDEO_I2C
> as builtin. This is due to 'imply hwmon' in the respective Kconfig.
> 
> Issue build log:
> 
> ld: drivers/media/i2c/video-i2c.o: in function `amg88xx_hwmon_init':
> video-i2c.c:(.text+0x2e1): undefined reference to `devm_hwmon_device_register_with_info
> 
> Cc: rdunlap@infradead.org
> Fixes: acbea6798955 (media: video-i2c: add hwmon support for amg88xx)
> Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
