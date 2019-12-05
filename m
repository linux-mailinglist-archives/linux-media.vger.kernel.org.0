Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB825113CBA
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 09:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfLEICy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 03:02:54 -0500
Received: from mga12.intel.com ([192.55.52.136]:27420 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725974AbfLEICy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Dec 2019 03:02:54 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Dec 2019 00:02:53 -0800
X-IronPort-AV: E=Sophos;i="5.69,280,1571727600"; 
   d="scan'208";a="243159554"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Dec 2019 00:02:52 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1E8D220976; Thu,  5 Dec 2019 10:02:50 +0200 (EET)
Date:   Thu, 5 Dec 2019 10:02:50 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Andy Walls <awalls@md.metrocast.net>
Subject: Re: [PATCH] ivtv/cx18: remove ivtvdriver.org references
Message-ID: <20191205080249.GB5536@paasikivi.fi.intel.com>
References: <09ed5e97-084d-17a2-e22f-0817527ebcdc@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09ed5e97-084d-17a2-e22f-0817527ebcdc@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 04, 2019 at 12:57:10PM +0100, Hans Verkuil wrote:
> That URL is no longer valid, so either remove references to it or
> replace it with linuxtv.org.
> 
> Rather than updating the URL I've just dropped the cx18.rst driver
> documentation since it was really out of date.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
