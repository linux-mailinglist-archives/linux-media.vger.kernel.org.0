Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C71E92A8697
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 19:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731758AbgKES6t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 13:58:49 -0500
Received: from smtprelay0034.hostedemail.com ([216.40.44.34]:53966 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726729AbgKES6t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 13:58:49 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id 110091802914B;
        Thu,  5 Nov 2020 18:58:48 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 10,1,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:1801:2393:2525:2553:2560:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3872:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4384:4605:5007:7903:9025:9040:9149:10004:10400:10946:11026:11232:11233:11473:11658:11783:11914:12043:12296:12297:12438:12555:12740:12895:13069:13161:13229:13311:13357:13439:13894:14180:14181:14659:14721:21060:21080:21365:21451:21627:21773:21889:30012:30054:30060:30070:30080:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: fall10_5f020ee272cc
X-Filterd-Recvd-Size: 3471
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf20.hostedemail.com (Postfix) with ESMTPA;
        Thu,  5 Nov 2020 18:58:46 +0000 (UTC)
Message-ID: <92c85080ad6e1ded9c15479efe79a7eb7b0c7ee2.camel@perches.com>
Subject: Re: [PATCH v2 1/7] media: uvcvideo: Use pr_cont() macro
From:   Joe Perches <joe@perches.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Thu, 05 Nov 2020 10:58:45 -0800
In-Reply-To: <CANiDSCt8twP=JTkGjSVKdDwRhuHb7Jkv+=08U6oFdGtAjtrELw@mail.gmail.com>
References: <20201104180734.286789-1-ribalda@chromium.org>
         <20201104180734.286789-2-ribalda@chromium.org>
         <87769d554b4575bf9371380b013e66d70f1b21c4.camel@perches.com>
         <20201104214201.GH29958@pendragon.ideasonboard.com>
         <9d439214e8c83ebf7b93dccca2f848fbaf75b9d4.camel@perches.com>
         <CANiDSCvwvQUTt1QMQGGyZPag9VeHj4Ugmj8QJdBNtw00UNt6Pg@mail.gmail.com>
         <a00078e1311c09361e9e3357ba5dca037d7a8bff.camel@perches.com>
         <CANiDSCteVWin-Yy2ZVSMUJBPvJ-F0Ti+fEpi26apsDW0XXrpwg@mail.gmail.com>
         <79cad1a6a296761e672cfb0d85e7424fcb740032.camel@perches.com>
         <CANiDSCt8twP=JTkGjSVKdDwRhuHb7Jkv+=08U6oFdGtAjtrELw@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-11-05 at 10:50 +0100, Ricardo Ribalda wrote:
> Hi Joe

Rehi Ricardo.
 
> On Thu, Nov 5, 2020 at 12:59 AM Joe Perches <joe@perches.com> wrote:
> > It looks as if all the pr_cont uses in the code are odd and repetitive.
> > 
> > Perhaps it'd be sensible to add something like:
> 
> Looks like a great idea. Queued for my v3
> 
> https://github.com/ribalda/linux/commit/1623b648331d7f69c8a9f6b199e119f6c8ee61c6
> 
> I let Laurent decide if we should squash with the previous patch or not.
> 
> Thanks!
> 
> > 
> > #define uvc_trace_cont(flag, fmt, ...)                                  \
> > do {                                                                    \
> >         if (uvc_trace_param & (flag))                                   \
> >                 pr_cont(fmt, ##__VA_ARGS__);                            \
> > } while (0)
> > 
> > and change all the uses like:
> > 
> > -               if (uvc_trace_param & UVC_TRACE_PROBE)
> > -                       printk(KERN_CONT " <- SU %d", entity->id);
> > +               uvc_trace_cont(UVC_TRACE_PROBE, " <- SU %d", entity->id);
> > 

While I know the only uses of uvc_trace_cont are with UVC_TRACE_PROBE,
there are other existing uvc_trace(flag, ...) uses.

I think the uvc_trace_cont mechanism should require a flag and not
assume UVC_TRACE_PROBE so it's possible, even though currently unused,
for other uvc_trace calls to be continued.

$ git grep -Poh '\buvc_trace\(\w+' drivers/media | sort | uniq -c
      1 uvc_trace(flag
      6 uvc_trace(UVC_TRACE_CALLS
      1 uvc_trace(UVC_TRACE_CAPTURE
      2 uvc_trace(UVC_TRACE_CLOCK
     15 uvc_trace(UVC_TRACE_CONTROL
     42 uvc_trace(UVC_TRACE_DESCR
      6 uvc_trace(UVC_TRACE_FORMAT
     12 uvc_trace(UVC_TRACE_FRAME
      7 uvc_trace(UVC_TRACE_PROBE
      1 uvc_trace(UVC_TRACE_STATS
      6 uvc_trace(UVC_TRACE_STATUS
      4 uvc_trace(UVC_TRACE_SUSPEND
      6 uvc_trace(UVC_TRACE_VIDEO


