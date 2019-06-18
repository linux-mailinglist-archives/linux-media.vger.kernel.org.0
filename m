Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 982A64AA20
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 20:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730323AbfFRSoz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 14:44:55 -0400
Received: from smtprelay0102.hostedemail.com ([216.40.44.102]:36329 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729642AbfFRSoz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 14:44:55 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id A58883AA7;
        Tue, 18 Jun 2019 18:44:52 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::::::::::::::::::::::::::::::::::::::::::,RULES_HIT:41:355:379:599:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1537:1566:1593:1594:1711:1714:1730:1747:1777:1792:2110:2393:2559:2562:2828:3138:3139:3140:3141:3142:3622:3865:3866:3868:3870:3872:3874:4321:5007:6742:6743:8784:10004:10400:10848:11232:11658:11914:12048:12555:12740:12760:12895:13069:13255:13311:13357:13439:14659:21080:21451:21627,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:28,LUA_SUMMARY:none
X-HE-Tag: beds50_4715d8d57491f
X-Filterd-Recvd-Size: 2402
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf15.hostedemail.com (Postfix) with ESMTPA;
        Tue, 18 Jun 2019 18:44:48 +0000 (UTC)
Message-ID: <1d206e92d9882865c11016d315f8edcd4344cbb8.camel@perches.com>
Subject: Re: [PATCH v2 1/4] staging: media: tegra-vde: Remove BIT() macro
 from UAPI header
From:   Joe Perches <joe@perches.com>
To:     Johannes Berg <johannes@sipsolutions.net>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Jamal Hadi Salim <jhs@mojatatu.com>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Jiri Pirko <jiri@resnulli.us>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>
Date:   Tue, 18 Jun 2019 11:44:47 -0700
In-Reply-To: <e5b8756590260b4d6a26cf9f02deb9d157cfca83.camel@sipsolutions.net>
References: <20190618161458.20499-1-digetx@gmail.com>
         <20190618161458.20499-5-digetx@gmail.com>
         <26cd63896d6930385b4f770e305f0782a455a688.camel@perches.com>
         <e5b8756590260b4d6a26cf9f02deb9d157cfca83.camel@sipsolutions.net>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2019-06-18 at 20:37 +0200, Johannes Berg wrote:
> On Tue, 2019-06-18 at 11:23 -0700, Joe Perches wrote:
> > include/uapi/linux/nl80211.h: * bitmask of BIT(NL80211_BAND_*) as described in %enum
> > 
> > 
> That's a comment :P

That's true and that's nice.

It was a casual grep and the comment should
probably be improved anyway.

<insert appropriate emoji here>

cheers, Joe

