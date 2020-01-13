Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03C4E13981A
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 18:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbgAMRxM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 12:53:12 -0500
Received: from mga05.intel.com ([192.55.52.43]:30135 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbgAMRxL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 12:53:11 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Jan 2020 09:53:10 -0800
X-IronPort-AV: E=Sophos;i="5.69,429,1571727600"; 
   d="scan'208";a="217475489"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Jan 2020 09:53:09 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 11E7520AF3; Mon, 13 Jan 2020 19:53:07 +0200 (EET)
Date:   Mon, 13 Jan 2020 19:53:07 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: Re: [PATCH v2] media: staging/intel-ipu3: make imgu use fixed
 running mode
Message-ID: <20200113175306.GG5440@paasikivi.fi.intel.com>
References: <1577697985-10920-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5BvQApETgz++17yzSCfagNj2=unZ2sDC7XcD2PG+1BWYQ@mail.gmail.com>
 <51c16983-a2e5-d18d-1852-bed88e9ca8b8@linux.intel.com>
 <CAAFQd5AtRQDp-8ANKv1twwepS=okMBnnmxECJ2TdmFwL8tQ_rQ@mail.gmail.com>
 <a73250f5-6887-8f1e-3ebf-bf37c23749b7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a73250f5-6887-8f1e-3ebf-bf37c23749b7@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Thu, Jan 09, 2020 at 12:37:07PM +0800, Bingbu Cao wrote:
> 
> 
> On 1/9/20 12:06 PM, Tomasz Figa wrote:
> > On Thu, Jan 9, 2020 at 12:58 PM Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
> >>
> >>
> >>
> >> On 1/8/20 8:57 PM, Tomasz Figa wrote:
> >>> On Mon, Dec 30, 2019 at 6:21 PM Bingbu Cao <bingbu.cao@intel.com> wrote:
> >>>>
> >>>> Currently, the imgu running mode need user to set by v4l2 ctrl.
> >>>> However, imgu only support 2 pipes and 2 operation modes - video and
> >>>> still. This patch make the first imgu subdev running as video and second
> >>>> one running as still, it will make the user understand easily, it can
> >>>> also cover current camera use cases requirement. The running mode is set
> >>>> during subdev registering, no race-condition after change, so it is safe
> >>>> to change the mode data type to integer.
> >>>>
> >>>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> >>>> ---
> >>>>  Documentation/media/v4l-drivers/ipu3.rst        |  6 +-
> >>>>  drivers/staging/media/ipu3/include/intel-ipu3.h |  4 --
> >>>>  drivers/staging/media/ipu3/ipu3-v4l2.c          | 74 +++----------------------
> >>>>  drivers/staging/media/ipu3/ipu3.h               |  5 +-
> >>>>  4 files changed, 12 insertions(+), 77 deletions(-)
> >>>>
> >>>
> >>> Doesn't it make it impossible to use two video (aka fast) pipes?
> >> Hi, Tomasz,
> >> Yes, once applying this patch, you can not run two video pipes with same input.
> >> I have no idea what are fast pipes and which scenario need two video pipes if
> >> the driver did not support multiple camera?
> > 
> > Processing in video pipes is faster than in still pipes and so one
> > could still want to use two video pipes for lower system load and thus
> > also lower power consumption, even for a single camera scenario, but
> > with ZSL.
> > 
> > That said, AFAICT CIO2 wouldn't have problems handling 2 raw captures,
> > so why would we want to prevent anyone from having 2 video pipes for 2
> > different cameras?
> Tomasz, your comments make sense for me. we can not limit the usage.
> 
> Sakari,
> Do you have comments on that? Could we revert this patch?

Please send a revert if you feel like it.

-- 
Regards,

Sakari Ailus
