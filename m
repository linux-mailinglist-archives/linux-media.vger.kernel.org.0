Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D168AAD466
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 10:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbfIIIFs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 04:05:48 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:39371 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726385AbfIIIFs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Sep 2019 04:05:48 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 7EgAi0e3450xT7EgEi8eqU; Mon, 09 Sep 2019 10:05:46 +0200
Subject: Re: [PATCH] cec-compliance: system information give features
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190906164443.1748-1-c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e0c092da-407c-40f5-d6dd-a639508c19ef@xs4all.nl>
Date:   Mon, 9 Sep 2019 10:05:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906164443.1748-1-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPSsKYzSzGLUFox9FiHEkXtdtWJ82R/Ww268cjP2zVfCaMVTDxnGcie7U/vDLbZrqwxPwRL7+cXWF8azamAF1xun4GgtABCzvWnooHyjkHRvCh+Kjdgi
 Zp8ly1BSElUTObW6v908R1C+3GkGXQCtdHtsrrBx0W8RneIPpfnjtet7JALU42muWt8ocf9USYadfBQjmEurxk43ZRP935zLB/ls9fs+LkWNenPSUC6O8QoT
 DPw3qula2YZeKodO7mRYffNV8+YYpKbaFbtlrQ9ME00=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/6/19 6:44 PM, Jiunn Chang wrote:
> For devices on a HDMI ARC link, sinks can only support transmitter
> devices and sources can only support receiver devices.
> 
> Add two checks:
>  - Playback devices can only have has_arc_rx
>  - TVs can only have has_arc_tx
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
>  utils/cec-compliance/cec-test.cpp | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index bbd13989..839c0fb9 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -172,6 +172,10 @@ int system_info_give_features(struct node *node, unsigned me, unsigned la, bool
>  		return fail("Only Playback and Recording devices shall set the Supports Deck Control bit\n");
>  	if (!cec_has_tv(1 << la) && node->remote[la].has_rec_tv)
>  		return fail("Only TVs shall set the Record TV Screen bit\n");
> +	if (!cec_has_playback(1 << la) && node->remote[la].has_arc_rx)
> +		return fail("Only Playback devices shall set the Source Supports ARC Rx bit\n");

Actually, this test should be inverted: the test is that has_arc_tx can't be used
by Playback devices.

> +	if (!cec_has_tv(1 << la) && node->remote[la].has_arc_tx)
> +		return fail("Only TVs shall set the Sink Supports ARC Tx bit\n");

Same here.

Right now this would fail for e.g. Audio Systems since in theory those can have
ARC for both rx and tx.

I also think that the has_arc_tx/rx fields should be renamed in a preceding patch
to 'source_has_arc_rx' and 'sink_has_arc_tx'. That makes these fields easier to
understand, and they match better with the CEC_OP_FEAT_DEV_ defines.

Regards,

	Hans

>  
>  	fail_on_test(node->remote[la].rc_profile != *rc_profile);
>  	fail_on_test(node->remote[la].dev_features != *dev_features);
> 

