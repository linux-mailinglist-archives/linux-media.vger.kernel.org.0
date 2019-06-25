Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73F3355023
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 15:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbfFYNWb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 09:22:31 -0400
Received: from smtprelay0194.hostedemail.com ([216.40.44.194]:45882 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726707AbfFYNWb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 09:22:31 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 11F8D100E86CB;
        Tue, 25 Jun 2019 13:22:30 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::,RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1381:1431:1437:1515:1516:1518:1534:1539:1568:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3622:3865:3868:3872:4321:5007:7514:7576:10004:10400:10848:11232:11658:11914:12043:12048:12297:12740:12760:12895:13069:13161:13229:13311:13357:13439:14181:14659:14721:21080:21451:21627:21774:30054:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:26,LUA_SUMMARY:none
X-HE-Tag: wood78_8a0682b7adc37
X-Filterd-Recvd-Size: 1694
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf04.hostedemail.com (Postfix) with ESMTPA;
        Tue, 25 Jun 2019 13:22:28 +0000 (UTC)
Message-ID: <56190c099e31dd0c9f56296186fdb6296afbe630.camel@perches.com>
Subject: Re: [PATCH 1/1] staging: media: fix style problem
From:   Joe Perches <joe@perches.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aliasgar Surti <aliasgar.surti500@gmail.com>,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Date:   Tue, 25 Jun 2019 06:22:26 -0700
In-Reply-To: <6536b57d-fea2-e16d-2092-e9e27c51c0f1@xs4all.nl>
References: <1561099192-19638-1-git-send-email-aliasgar.surti500@gmail.com>
         <6536b57d-fea2-e16d-2092-e9e27c51c0f1@xs4all.nl>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2019-06-25 at 09:17 +0200, Hans Verkuil wrote:
> On 6/21/19 8:39 AM, Aliasgar Surti wrote:
> > From: Aliasgar Surti <aliasgar.surti500@gmail.com>
> > 
> > checkpatch reported "WARNING: line over 80 characters".
> > This patch fixes the warning for file soc_camera/soc_ov5642.c
> 
> FYI: we're not accepting patches for staging/media/soc_camera: these
> are obsolete and broken drivers.

Then mark the MAINTAINERS entry as Orphan / Obsolete

It's currently:

SOC-CAMERA V4L2 SUBSYSTEM
L:	linux-media@vger.kernel.org
T:	git git://linuxtv.org/media_tree.git
S:	Orphan
F:	include/media/soc_camera.h
F:	drivers/staging/media/soc_camera/


