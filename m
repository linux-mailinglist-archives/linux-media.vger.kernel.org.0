Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D73E0714529
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 09:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbjE2HDA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 03:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjE2HC5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 03:02:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31557E3
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 00:02:53 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E3A4836;
        Mon, 29 May 2023 09:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685343751;
        bh=u1KqU3UGoKPJAhHHiEf0TGWsDcd39O0cBi/ZjaY26UQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=sO2mPN/KOr5394Wx6Wq74WboCYNhhsPDn2qiKpnuEqmBSECNj3+EYetV4xXNGomPD
         fJO1TwAYqY1Y6eU0kaTi3JPq8vlY5cf0xjA1sK7HZ7ZlaXV+tyWiVldWiyoC2i5UZq
         DVxqI+BY190Dxj/2iEVVPJJgXfPe/GKOiDIICquc=
Message-ID: <24ce5041-5fd7-5ef9-a8d3-52a1dcf6b80c@ideasonboard.com>
Date:   Mon, 29 May 2023 10:02:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/8] v4l2-ctl: Add routing and streams support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
References: <20230421124428.393261-1-tomi.valkeinen@ideasonboard.com>
 <20230421124428.393261-2-tomi.valkeinen@ideasonboard.com>
 <20230424070455.GC4926@pendragon.ideasonboard.com>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230424070455.GC4926@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/04/2023 10:04, Laurent Pinchart wrote:

>> +		r = (v4l2_subdev_route *)routing.routes;
>> +		ref = end = strdup(optarg);
>> +		while ((tok = strsep(&end, ",")) != NULL) {
>> +			if (sscanf(tok, "%u/%u -> %u/%u [%u]",
>> +				   &r->sink_pad, &r->sink_stream,
>> +				   &r->source_pad, &r->source_stream,
>> +				   &flags) != 5) {
> 
> Requiring a space around '->' isn't nice, especially as it's not present
> in the help text. MC link parsing makes spaces optional, please do the
> same here.

The space are not required. sscanf skips white-space, so this parses 
fine "1/2->3/4[1]".

  Tomi

