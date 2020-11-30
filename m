Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E20932C87F0
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 16:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgK3PYI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 10:24:08 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:59490 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727875AbgK3PYI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 10:24:08 -0500
Received: from [IPv6:2a01:e0a:169:7140:a584:b2c9:4b50:852e] (unknown [IPv6:2a01:e0a:169:7140:a584:b2c9:4b50:852e])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C9FF97E;
        Mon, 30 Nov 2020 16:23:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606749806;
        bh=FzeSHTuXfRZ48SVnYhAbf46ei2QNThr/E0D1lAP+9P0=;
        h=From:Subject:To:Cc:Date:From;
        b=lK2EDMGnpWQ1p2YY9YDe2JxnNw2tbbswZqv0b4h3FduHZn4VelEDKkZ0Dju1BCG9p
         r/l9H2gdArE2iFeg53WgcR3rqpg2T/dUeg1Xp0xJYkNtVTTfeFpVHTJ8gREyGh27Wr
         va5M9QPUgTyQrc1PwuZoKrqtjFg6MLbTv2DmeCpc=
From:   Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Subject: Intel IPU3: can't retrieve 3A Auto Exposure (AE) statistics
To:     sakari.ailus@linux.intel.com
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Message-ID: <ae23247b-64cf-aecd-7d71-46581e0f9b1e@ideasonboard.com>
Date:   Mon, 30 Nov 2020 16:23:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari, all,

I am currently working with libcamera and trying to make it work on a
IPU3 pipeline (MS Surface Go 2)...
I can set the buffer parameters, thanks to Niklas work, but can't get
the 3A statistics buffer back.
More precisely, the buffers are queued/dequeued but the 'ae_en' bit is
never set to 1, and all the raw buffers are set to '0' values.

I suppose I have missed to set one parameter somewhere, but according to
https://www.kernel.org/doc/html/v5.6/media/uapi/v4l/pixfmt-meta-intel-ipu3.html#c.ipu3_uapi_ae_grid_config
setting the 'ae_en' bit in the ipu3_uapi_ae_grid_config structure should
be enough to trigger ?

I have pushed my (very work in progress) work here:
https://github.com/jhautbois/libcamera/tree/test-fake-ipu3-ipa

I would appreciate feedback on this stuff, as I can't see anything
missing from a user-space perspective right now... :-)

Thanks,
--
Regards,
JM
