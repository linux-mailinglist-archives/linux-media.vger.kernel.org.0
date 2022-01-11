Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6414C48ACC5
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 12:39:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238804AbiAKLjl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 06:39:41 -0500
Received: from mga11.intel.com ([192.55.52.93]:51767 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238917AbiAKLjk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 06:39:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641901180; x=1673437180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gKdC5Ldb1IdnKq1HEfgSMNhCsMMbvQwsa0nry4LiHvI=;
  b=ZHJzSQrbbcBftB112JUN43Rt+1yKLbi89VyNUBeA/f1ElXtKJGoBTC/s
   FlkqIRskhdxozDLZ4tan6EB39p5MaO4pKoGtQclQVi11Vp0Ax0oq1BUPt
   PMe6RimiFk0t4d3t1lXQ1NCIwUcvUJPaOGplkPIrKAtaEfGd+w01RgRth
   HQFacitYxDj/v/OdiPPCfLzP1tkC9MXel5lgf+yDs2Cc66GNhB09t4T9Z
   QdJhtafvAKP33bynjGM4BJqfRIgCSHMofo5l3eZhxcQB1IK0rYcaFB29z
   s+yJYmNZlufLCNg6+gAezYcRSAEdA8OyytS4nepUkLPEoqWMYQWcTBHob
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="241018977"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="241018977"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 03:38:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="623044608"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 03:38:36 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 7EDC92017F;
        Tue, 11 Jan 2022 13:38:34 +0200 (EET)
Date:   Tue, 11 Jan 2022 13:38:34 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] ov5648: Don't pack controls struct
Message-ID: <Yd1sOmFjJfsFHrT2@paasikivi.fi.intel.com>
References: <20220110224831.266749-1-sakari.ailus@linux.intel.com>
 <Yd0/nL7iQityle6P@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yd0/nL7iQityle6P@aptenodytes>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Tue, Jan 11, 2022 at 09:28:12AM +0100, Paul Kocialkowski wrote:
> Hi Sakari,
> 
> On Tue 11 Jan 22, 00:48, Sakari Ailus wrote:
> > Don't pack the driver specific struct containing control pointers. This
> > lead to potential alignment issues when working with the pointers.
> 
> Thanks for looking into the report and making this fix.
> 
> Honestly I was a bit puzzled because I explicitly added the __packed
> to avoid possible holes in the structures that could be problematic
> when using v4l2_ctrl_auto_cluster and I think the problem still stands.
> 
> I feel like solving both issues at once would require having the controls
> that belong in the same cluster declared as an array and not individual
> members of the struct.
> 
> What do you think?

No architecture used in Linux requires adding padding between two pointers
to my knowledge --- generally the alignment is at most the size of the
data: otherwise arrays would not work either. Therefore packing isn't
required.

-- 
Kind regards,

Sakari Ailus
