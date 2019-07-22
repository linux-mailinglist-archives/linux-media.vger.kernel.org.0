Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C599170499
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 17:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730449AbfGVPw2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 11:52:28 -0400
Received: from retiisi.org.uk ([95.216.213.190]:56432 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730371AbfGVPwK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 11:52:10 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id D11E5634C88;
        Mon, 22 Jul 2019 18:52:03 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hpabb-0000QP-3Q; Mon, 22 Jul 2019 18:52:03 +0300
Date:   Mon, 22 Jul 2019 18:52:03 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com
Subject: Re: [PATCH v5] media: v4l: ctrls: Add debug messages
Message-ID: <20190722155202.GB1263@valkosipuli.retiisi.org.uk>
References: <20190720114707.17990-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190720114707.17990-1-ezequiel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Sat, Jul 20, 2019 at 08:47:07AM -0300, Ezequiel Garcia wrote:
> Currently, the v4l2 control code is a bit silent on errors.
> Add debug messages on (hopefully) most of the error paths.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> Changes from v3:
> * Add missing parenthesis around macro argument.
> 
> Changes from v3:
> * Fix checkpatch.pl warnings about long lines.
> 
> Changes from v2:
> * Check and noisy-warn if vdev is NULL.

As you require the vdev argument to be non-NULL, you may as well drop the
mdev argument: video device is always specific to a media device, and the
pointer to the media device can be found in vdev->entity.graph_obj.mdev if
MEDIA_CONTROLLER is enabled (AFAIR).

-- 
Kind regards,

Sakari Ailus
