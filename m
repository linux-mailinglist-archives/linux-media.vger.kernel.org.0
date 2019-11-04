Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD39EDA6D
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 09:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbfKDIRI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 03:17:08 -0500
Received: from mga17.intel.com ([192.55.52.151]:56268 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726100AbfKDIRI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Nov 2019 03:17:08 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 00:17:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,266,1569308400"; 
   d="scan'208";a="205109594"
Received: from hbriegel-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.252.55.106])
  by orsmga006.jf.intel.com with ESMTP; 04 Nov 2019 00:17:04 -0800
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 9B9C521FAF; Mon,  4 Nov 2019 10:13:32 +0200 (EET)
Date:   Mon, 4 Nov 2019 10:13:32 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 7/8] ov6650: fix smatch warning
Message-ID: <20191104081332.GC11844@kekkonen.localdomain>
References: <20191103112338.22569-1-hverkuil-cisco@xs4all.nl>
 <20191103112338.22569-8-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191103112338.22569-8-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Nov 03, 2019 at 12:23:37PM +0100, Hans Verkuil wrote:
> Initialize ret to 0 to fix this smatch error:
> 
> drivers/media/i2c/ov6650.c:853 ov6650_video_probe() error: uninitialized symbol 'ret'.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
