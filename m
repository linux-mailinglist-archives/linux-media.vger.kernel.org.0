Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 659744C9A8
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 10:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730759AbfFTIpP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 04:45:15 -0400
Received: from mga05.intel.com ([192.55.52.43]:28960 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbfFTIpO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 04:45:14 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jun 2019 01:45:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,396,1557212400"; 
   d="scan'208";a="170814221"
Received: from pdaleax-wtg.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.252.61.225])
  by orsmga002.jf.intel.com with ESMTP; 20 Jun 2019 01:45:03 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 5B51021D88; Thu, 20 Jun 2019 11:44:58 +0300 (EEST)
Date:   Thu, 20 Jun 2019 11:44:58 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>
Subject: Re: [PATCH] media: Clarify the meaning of file descriptors in
 VIDIOC_DQBUF
Message-ID: <20190620084457.irkmv4wy7pbvlj5r@kekkonen.localdomain>
References: <20190612093648.47412-1-tfiga@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612093648.47412-1-tfiga@chromium.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 12, 2019 at 06:36:48PM +0900, Tomasz Figa wrote:
> When the application calls VIDIOC_DQBUF with the DMABUF memory type, the
> v4l2_buffer structure (or v4l2_plane structures) are filled with DMA-buf
> file descriptors. However, the current documentation does not explain
> whether those are new file descriptors referring to the same DMA-bufs or
> just the same integers as passed to VIDIOC_QBUF back in time. Clarify
> the documentation that it's the latter.
> 
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
