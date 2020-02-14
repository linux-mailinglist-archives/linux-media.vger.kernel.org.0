Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81E1115D4F2
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 10:47:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbgBNJrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 04:47:12 -0500
Received: from mga11.intel.com ([192.55.52.93]:25962 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728479AbgBNJrM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 04:47:12 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Feb 2020 01:47:11 -0800
X-IronPort-AV: E=Sophos;i="5.70,440,1574150400"; 
   d="scan'208";a="227544236"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Feb 2020 01:47:08 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A5AE12088D; Fri, 14 Feb 2020 11:47:06 +0200 (EET)
Date:   Fri, 14 Feb 2020 11:47:06 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH] media: staging: rkisp1: don't lock media's graph_mutex
 when calling rkisp1_create_links
Message-ID: <20200214094706.GH22481@paasikivi.fi.intel.com>
References: <20200204214446.20381-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204214446.20381-1-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 04, 2020 at 10:44:44PM +0100, Dafna Hirschfeld wrote:
> The function rkisp1_create_links calls media_entity_get_fwnode_pad
> and media_create_pad_link in the mc api. Those calls don't require
> locking the graph_mutex so remove the locking.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

For the three patches:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
