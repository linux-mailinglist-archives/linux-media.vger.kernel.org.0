Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47A6444F25
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 00:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbfFMWcK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 18:32:10 -0400
Received: from smtprelay0116.hostedemail.com ([216.40.44.116]:46495 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725616AbfFMWcK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 18:32:10 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 0234B1822408D;
        Thu, 13 Jun 2019 22:32:08 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 10,1,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::::::::::::::,RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2194:2199:2393:2559:2562:2691:2716:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3871:3872:4321:5007:6742:7901:7974:9036:10004:10400:10450:10455:10848:10967:11026:11232:11473:11657:11658:11914:12043:12296:12438:12740:12760:12895:13069:13311:13357:13439:14659:14721:19904:19999:21080:21325:21451:21627:30045:30054:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:26,LUA_SUMMARY:none
X-HE-Tag: bells74_f85ac43e0702
X-Filterd-Recvd-Size: 3034
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf15.hostedemail.com (Postfix) with ESMTPA;
        Thu, 13 Jun 2019 22:31:46 +0000 (UTC)
Message-ID: <39e6c0f7d7529da9906a17450a8bcdf416297520.camel@perches.com>
Subject: Re: [PATCH 2/2] media: v4l: xilinx: Add Xilinx UHD-SDI Rx Subsystem
 driver
From:   Joe Perches <joe@perches.com>
To:     Hyun Kwon <hyun.kwon@xilinx.com>,
        Vishal Sagar <vishal.sagar@xilinx.com>
Cc:     Hyun Kwon <hyunk@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michals@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>
Date:   Thu, 13 Jun 2019 15:31:44 -0700
In-Reply-To: <20190613220507.GA2473@smtp.xilinx.com>
References: <1559656556-79174-1-git-send-email-vishal.sagar@xilinx.com>
         <1559656556-79174-3-git-send-email-vishal.sagar@xilinx.com>
         <20190613220507.GA2473@smtp.xilinx.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-06-13 at 15:05 -0700, Hyun Kwon wrote:
> On Tue, 2019-06-04 at 06:55:56 -0700, Vishal Sagar wrote:

trivia:

> > diff --git a/drivers/media/platform/xilinx/xilinx-sdirxss.c b/drivers/media/platform/xilinx/xilinx-sdirxss.c
[]
> > +static int xsdirx_get_stream_properties(struct xsdirxss_state *state)
> > +{
[]
> > +	if (valid & XSDIRX_ST352_VALID_DS1_MASK) {
> > +		payload = xsdirxss_read(core, XSDIRX_ST352_DS1_REG);
> > +		byte1 = (payload >> XST352_PAYLOAD_BYTE1_SHIFT) &
> > +				XST352_PAYLOAD_BYTE_MASK;

Is XST352_PAYLOAD_BYTE_MASK correct ?
Should it be XST352_PAYLOAD_BYTE1_MASK ?

> > +		active_luma = (payload & XST352_BYTE3_ACT_LUMA_COUNT_MASK) >>
> > +				XST352_BYTE3_ACT_LUMA_COUNT_OFFSET;
> > +		pic_type = (payload & XST352_BYTE2_PIC_TYPE_MASK) >>
> > +				XST352_BYTE2_PIC_TYPE_OFFSET;
> > +		framerate = (payload >> XST352_BYTE2_FPS_SHIFT) &
> > +				XST352_BYTE2_FPS_MASK;
> > +		tscan = (payload & XST352_BYTE2_TS_TYPE_MASK) >>
> > +				XST352_BYTE2_TS_TYPE_OFFSET;
> 
> Please align consistently throughout the patch. I believe the checkpatch
> --strict warns on these.

I believe not.

Another possibility would be to use a macro like:

#define mask_and_shift(val, type)	\
	((val) & (XST352_ ## type ## _MASK)) >> (XST352_ ## type ## _OFFSET))

> > +		sampling = (payload & XST352_BYTE3_COLOR_FORMAT_MASK) >>
> > +			   XST352_BYTE3_COLOR_FORMAT_OFFSET;

So these could be something like:

		sampling = mask_and_shift(payload, BYTE3_COLOR_FORMAT);


