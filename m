Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FFC32F252
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 06:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731397AbfE3EUm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 00:20:42 -0400
Received: from smtprelay0033.hostedemail.com ([216.40.44.33]:37168 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731287AbfE3EUl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 00:20:41 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id C3C53182251B2;
        Thu, 30 May 2019 04:20:39 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::,RULES_HIT:41:355:379:421:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1381:1437:1515:1516:1518:1534:1538:1567:1593:1594:1711:1714:1730:1747:1777:1792:1963:2393:2559:2562:2828:3138:3139:3140:3141:3142:3622:3865:3867:3868:3871:3872:3873:3874:4321:5007:9040:10004:10400:10848:11658:11914:12048:12740:12760:12895:13069:13160:13229:13311:13357:13439:14659:21080:21627:21789:30012:30054:30070:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:31,LUA_SUMMARY:none
X-HE-Tag: nose55_5a26eccd8617
X-Filterd-Recvd-Size: 1484
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf13.hostedemail.com (Postfix) with ESMTPA;
        Thu, 30 May 2019 04:20:38 +0000 (UTC)
Message-ID: <a47d7093b10d671ae89fa6f6962d69d6913a30f7.camel@perches.com>
Subject: Re: [PATCH v2] drivers/media/dvb-frontends: Implement probe/remove
 for stv6110x
From:   Joe Perches <joe@perches.com>
To:     Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, sean@mess.org
Date:   Wed, 29 May 2019 21:20:37 -0700
In-Reply-To: <d1afd4d3-0dc5-718d-f7b4-f763f367ca1e@mni.thm.de>
References: <20190509195118.23027-1-tobias.johannes.klausmann@mni.thm.de>
         <20190529165633.8779-1-tobias.johannes.klausmann@mni.thm.de>
         <bcd12350374533ef090ae911be444e702e85134b.camel@perches.com>
         <d1afd4d3-0dc5-718d-f7b4-f763f367ca1e@mni.thm.de>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-05-29 at 21:03 +0200, Tobias Klausmann wrote:
> thanks for the comments! If really desired i can change the code 
> further, adapting to your comments, but note that the code was 
> essentially just moved around to cater to both _probe() and attach(), 
> intentionally leaving it as it was before the patch!

Up to you.
My general preference is for human intelligible and simple code.

