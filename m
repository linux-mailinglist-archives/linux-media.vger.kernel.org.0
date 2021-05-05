Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51B2C374B0C
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 00:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233504AbhEEWNh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 18:13:37 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55130 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhEEWNh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 18:13:37 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B19C91F42E39
Message-ID: <0c0bf5d35c3098188dc594268e721f8133f38789.camel@collabora.com>
Subject: Re: [PATCH v3 1/1] v4l: async, fwnode: Improve module organisation
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel.garcia@collabora.com
Date:   Wed, 05 May 2021 19:12:30 -0300
In-Reply-To: <20210504210642.9568-1-sakari.ailus@linux.intel.com>
References: <20210504210642.9568-1-sakari.ailus@linux.intel.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-05-05 at 00:06 +0300, Sakari Ailus wrote:
> The V4L2 async framework is generally used with the V4L2 fwnode, which
> also depends on the former. There are a few exceptions but they are
> relatively few.
> 
> At the same time there is a vast number of systems that need videodev
> module, but have no use for v4l2-async that's now part of videodev.
> 
> In order to improve, split the v4l2-async into its own module. Selecting
> V4L2_FWNODE also selects V4L2_ASYNC.
> 
> This also moves the initialisation of the debufs entries for async subdevs
> to loading of the v4l2-async module. The directory is named as
> "v4l2-async".
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks!
Ezequiel

