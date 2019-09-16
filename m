Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA3DAB39FE
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 14:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732409AbfIPMHl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 08:07:41 -0400
Received: from retiisi.org.uk ([95.216.213.190]:52002 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727813AbfIPMHl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 08:07:41 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 7F782634C87;
        Mon, 16 Sep 2019 15:07:07 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1i9pme-0001KI-Db; Mon, 16 Sep 2019 15:07:08 +0300
Date:   Mon, 16 Sep 2019 15:07:08 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCHv2 1/2] v4l: Add macros for printing V4L fourcc values
Message-ID: <20190916120708.GP843@valkosipuli.retiisi.org.uk>
References: <20190916100433.24367-1-hverkuil-cisco@xs4all.nl>
 <20190916100433.24367-2-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190916100433.24367-2-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 16, 2019 at 12:04:32PM +0200, Hans Verkuil wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Add two macros that facilitate printing V4L fourcc values with printf
> family of functions. v4l2_fourcc_conv provides the printf conversion
> specifier for printing formats and v4l2_fourcc_args provides the actual
> arguments for that conversion specifier.
> 
> These macros are useful in both user and kernel code whenever you want
> to report a pixelformat, therefore put them into videodev2.h.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> [hverkuil-cisco@xs4all.nl: rename v4l2_fourcc_to_conv to v4l2_fourcc_args]
> [hverkuil-cisco@xs4all.nl: add () around ? : expression]
> [hverkuil-cisco@xs4all.nl: add comment about fourcc reuse]
> [hverkuil-cisco@xs4all.nl: update Documentation/media/videodev2.h.rst.exceptions]

Were you going to add your SoB when merging the patch to your tree? Or is
it just missing here?

Feel free to add:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
