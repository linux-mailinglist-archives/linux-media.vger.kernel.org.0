Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F37C8162601
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2020 13:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgBRMWz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Feb 2020 07:22:55 -0500
Received: from mga07.intel.com ([134.134.136.100]:36405 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726340AbgBRMWz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Feb 2020 07:22:55 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 04:22:54 -0800
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; 
   d="scan'208";a="229458741"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 04:22:51 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id DA69A20E95; Tue, 18 Feb 2020 14:22:49 +0200 (EET)
Date:   Tue, 18 Feb 2020 14:22:49 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH] media: staging: rkisp1: remove serialization item in the
 TODO file
Message-ID: <20200218122249.GB5379@paasikivi.fi.intel.com>
References: <20200217175209.8279-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200217175209.8279-1-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 17, 2020 at 06:52:09PM +0100, Dafna Hirschfeld wrote:
> The item 'Fix serialization on subdev ops.' was solved,
> so remove it from the TODO file.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
