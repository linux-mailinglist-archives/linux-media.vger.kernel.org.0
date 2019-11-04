Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 170F0EDA68
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 09:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbfKDIPv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 03:15:51 -0500
Received: from mga09.intel.com ([134.134.136.24]:25831 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726100AbfKDIPu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Nov 2019 03:15:50 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 00:15:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,266,1569308400"; 
   d="scan'208";a="376265939"
Received: from hbriegel-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.252.55.106])
  by orsmga005.jf.intel.com with ESMTP; 04 Nov 2019 00:15:47 -0800
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 4023E21FAF; Mon,  4 Nov 2019 10:12:15 +0200 (EET)
Date:   Mon, 4 Nov 2019 10:12:15 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/8] smiapp: smiapp_start_streaming(): replace return by
 goto
Message-ID: <20191104081214.GB11844@kekkonen.localdomain>
References: <20191103112338.22569-1-hverkuil-cisco@xs4all.nl>
 <20191103112338.22569-3-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191103112338.22569-3-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Sun, Nov 03, 2019 at 12:23:32PM +0100, Hans Verkuil wrote:
> There were still two returns in smiapp_start_streaming() that should
> have been a goto to ensure mutex_unload was called before returning.
> 
> This fixes this smatch warning:
> 
> drivers/media/i2c/smiapp/smiapp-core.c:1483 smiapp_start_streaming() warn: inconsistent returns 'mutex:&sensor->mutex'.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks for the patch.

Dan Carpenter submitted one with equivalent content, and it's in my pull
request to Mauro:

<URL:https://patchwork.linuxtv.org/patch/59698/>

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
