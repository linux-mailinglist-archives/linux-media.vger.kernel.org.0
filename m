Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB692F8FD9
	for <lists+linux-media@lfdr.de>; Sun, 17 Jan 2021 00:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbhAPXY0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jan 2021 18:24:26 -0500
Received: from retiisi.eu ([95.216.213.190]:51250 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726788AbhAPXYY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jan 2021 18:24:24 -0500
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E053D634C89;
        Sun, 17 Jan 2021 01:22:40 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1l0uu0-0002pH-Qk; Sun, 17 Jan 2021 01:22:40 +0200
Date:   Sun, 17 Jan 2021 01:22:40 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        mchehab@kernel.org, hans.verkuil@cisco.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org
Subject: Re: [PATCH 3/3] media: videobuf2-v4l2: remove redundant error test
Message-ID: <20210116232240.GV850@valkosipuli.retiisi.org.uk>
References: <20210114180149.1755892-1-helen.koike@collabora.com>
 <20210114180149.1755892-4-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114180149.1755892-4-helen.koike@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 14, 2021 at 03:01:49PM -0300, Helen Koike wrote:
> request_fd is validated under media_request_get_by_fd() just below this
> check. Thus remove it.
> 
> Suggested-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
