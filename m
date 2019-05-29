Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82CFF2D9B3
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 11:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfE2JzV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 05:55:21 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:33929 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725861AbfE2JzU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 05:55:20 -0400
Received: from [IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae] ([IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae])
        by smtp-cloud7.xs4all.net with ESMTPA
        id VvIfh5RzU3qlsVvIghslMC; Wed, 29 May 2019 11:55:19 +0200
Subject: Re: [PATCH v2 00/11] Improve stability and add bug fixes of Aspeed
 video engine driver
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
References: <20190524231725.12320-1-jae.hyun.yoo@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c841359a-96fe-eb74-e14c-29e304c6ba16@xs4all.nl>
Date:   Wed, 29 May 2019 11:55:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524231725.12320-1-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPjUXrhJBvgXPPTEcsOCCcQshm3OE949Fo+PmiY2sJqd9MTPCcW7w/kbN4SONV4X4KXcJJglV8h/GN5HneFa6mBcsvu3y53EEeBXYrHYbT1eBEGkiDjF
 VKdE+PvDK344JZrQJbYA/Muy9gXbe1TepPLInRQ96MHSijq+SRwiCQ0XBXf3vWnGKPiOu4AL0xMNge3Rs+doGaKmESdhoBG1ET6VPSsMRjYPe83txEf+qWCJ
 DKC74tek992HCyelgeoJO4oo8ULpI0J0xMgLTn2jdokB2ZJSCQDcfAko9DgEVTXt36FtwyJ42VeafXofx99C0ZMCQZSkeihMW+n+xh90XgsrRiNC1yLpsm77
 ijEBlrvHa2pRGma9LnKxtN0KU98BY++vhvXA0EDHXcZ6C2oBjT+ZOQb0d33FmJf+O3prLZVDGwDDme3Jk2RybXviGbyWihNVIUGWOJFlF6Ehhao7RChc6qMU
 ByjxR2/nnl/baF6xBAOODTPuPRxRXEX/j9M/tQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Eddie,

Can you review the last 4 new patches? If all is OK, then I can make a pull
request for this series.

Regards,

	Hans

On 5/25/19 1:17 AM, Jae Hyun Yoo wrote:
> This patch series improves stability of Aspeed video engine driver by fixing
> clock control and irq handling logic in the driver. Also, it adds a couple of
> bug fixes and a workaroud for a silicon bug.
> 
> Changes since v1:
> - Removed spinlock handling code from 0001 patch.
> - Added 4 more patches.
> 
> Jae Hyun Yoo (11):
>   media: aspeed: fix a kernel warning on clk control
>   media: aspeed: refine clock control logic
>   media: aspeed: change irq to threaded irq
>   media: aspeed: remove IRQF_SHARED flag
>   media: aspeed: reduce noisy log printing outs
>   media: aspeed: remove checking of VE_INTERRUPT_CAPTURE_COMPLETE
>   media: aspeed: refine interrupt handling logic
>   media: aspeed: remove source buffer allocation before mode detection
>   media: aspeed: use different delays for triggering VE H/W reset
>   media: aspeed: fix an incorrect timeout checking in mode detection
>   media: aspeed: add a workaround to fix a silicon bug
> 
>  drivers/media/platform/aspeed-video.c | 140 +++++++++++++++-----------
>  1 file changed, 80 insertions(+), 60 deletions(-)
> 

