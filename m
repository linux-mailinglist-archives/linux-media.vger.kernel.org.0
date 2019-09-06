Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7434AB2B2
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 08:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404046AbfIFG73 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 02:59:29 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:38869 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2403977AbfIFG72 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Sep 2019 02:59:28 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 68DKi9way9b7T68DOiYf5x; Fri, 06 Sep 2019 08:59:26 +0200
Subject: Re: [PATCH] cec-compliance: audio return channel tests
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190906035129.18447-1-c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f2dcb4db-e8d3-132a-e6b4-5e789337e02f@xs4all.nl>
Date:   Fri, 6 Sep 2019 08:59:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906035129.18447-1-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfD814JkYqDxmIuD5Ketdk0g7s4bkh5DPEsJmsBoMpI+4FA8/R1Q/m3Z6GXfmYilkhatK2Kxy4rOFl9Hzat2UhrAAjuAqZaHU8zTZJHZfY4Vobb4LFqUg
 +yxvIuTnYg3fE6s6a+GusSvD2bsTCHJRZ/mflrPYQUi4uTETF4+rwvT2gNdBZvBRV2SyMg+uLi2RyUoTkg+dJvzO/8A4pIzWXjBhR7pco5tPxARCN4bhGM0r
 e3B9y/f4KcjuR4vZ0g+dXatiBcaeSoJW7bMW5FfRIeo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/6/19 5:51 AM, Jiunn Chang wrote:
> For devices on a HDMI ARC link, sinks can only support transmitter
> devices and sources and only support receiver devices.
> 
> This patch checks to see if the DUT is an transmitter or receiver and
> has the ARC flag set properly from the device.
> 
> This should apply to devices that support the HDMI CEC 1.4 spec going
> forward when ARC was introduced.
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
>  utils/cec-compliance/cec-test-audio.cpp | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
> index 872bb9ad..da2ed1d1 100644
> --- a/utils/cec-compliance/cec-test-audio.cpp
> +++ b/utils/cec-compliance/cec-test-audio.cpp
> @@ -297,11 +297,35 @@ static int arc_terminate_rx(struct node *node, unsigned me, unsigned la, bool in
>  	return 0;
>  }
>  
> +static int arc_sink_tx(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	/* Check if we are upstream from the device. If we are, then the device is
> +	   an HDMI source, which means that it is an ARC receiver, not a transmitter. */
> +	if (pa_is_upstream_from(node->phys_addr, node->remote[la].phys_addr))
> +		return NOTAPPLICABLE;
> +	fail_on_test(!node->remote[la].has_arc_tx);
> +
> +	return 0;
> +}
> +
> +static int arc_source_rx(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	/* Check if the DUT is upstream from us. If it is, then it is an
> +	   HDMI sink, which means that it is an ARC transmitter, not receiver. */
> +	if (pa_is_upstream_from(node->remote[la].phys_addr, node->phys_addr))
> +		return NOTAPPLICABLE;
> +	fail_on_test(!node->remote[la].has_arc_rx);
> +
> +	return 0;
> +}
> +
>  struct remote_subtest arc_subtests[] = {
>  	{ "Initiate ARC (RX)", CEC_LOG_ADDR_MASK_ALL, arc_initiate_rx },
>  	{ "Terminate ARC (RX)", CEC_LOG_ADDR_MASK_ALL, arc_terminate_rx },
>  	{ "Initiate ARC (TX)", CEC_LOG_ADDR_MASK_ALL, arc_initiate_tx },
>  	{ "Terminate ARC (TX)", CEC_LOG_ADDR_MASK_ALL, arc_terminate_tx },
> +	{ "Sink ARC (TX)", CEC_LOG_ADDR_MASK_ALL, arc_sink_tx },
> +	{ "Source ARC (RX)", CEC_LOG_ADDR_MASK_ALL, arc_source_rx },
>  };
>  
>  const unsigned arc_subtests_size = ARRAY_SIZE(arc_subtests);
> 

This isn't right. First of all, the remote device may not have ARC support
at all, so failing if has_arc_rx/tx is false is wrong. And in addition, CEC
versions < 2 do not signal ARC support since they don't have the
Give Device Features message.

The second is to test against pa_is_upstream_from: a remote device such as
and AV receiver may have ARC support on both sink and source.

Just add the checks to system_info_give_features(): there are already checks
for has_rec_tv, and the new checks are similar to that: a TV can't have
has_arc_rx, and a Playback device can't have has_arc_tx.

Regards,

	Hans
