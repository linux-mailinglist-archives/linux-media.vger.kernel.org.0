Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D29D304851
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 20:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388755AbhAZFp7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:45:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728654AbhAYQAS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 11:00:18 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D6DAC06178B
        for <linux-media@vger.kernel.org>; Mon, 25 Jan 2021 07:07:15 -0800 (PST)
Received: from [IPv6:2804:214:81d7:a6cc:f83c:66c3:4225:e59d] (unknown [IPv6:2804:214:81d7:a6cc:f83c:66c3:4225:e59d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 50B1F1F44F15;
        Mon, 25 Jan 2021 15:05:08 +0000 (GMT)
Subject: Re: [PATCH v2 01/14] media: v4l2-async: Clean
 v4l2_async_notifier_add_fwnode_remote_subdev
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20210118015258.3993-1-ezequiel@collabora.com>
 <20210118015258.3993-2-ezequiel@collabora.com>
 <d00fd549-79a1-5dc8-c239-52c9cbd94625@collabora.com>
 <20210125110229.GH27155@paasikivi.fi.intel.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <f9f79f6e-c8cb-10df-91f4-d9b3e2ed9853@collabora.com>
Date:   Mon, 25 Jan 2021 12:05:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210125110229.GH27155@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/25/21 8:02 AM, Sakari Ailus wrote:
> Hi Helen,
> 
> Thanks for the comments.
> 
> On Tue, Jan 19, 2021 at 03:51:32PM -0300, Helen Koike wrote:
>> Hi Ezequiel,
>>
>> Thanks for you patch, I just have minor comments.
>>
>> I think there are more improvements that could be done to
>> reduce some identation levels, but I see the idea here is
>> to change drivers the least as possible, so I won't comment
>> on that.
> 
> I discussed with Ezequiel that I can take the set forwards from here.
> 
> I'd be inclined to avoiding making larger than necessary changes here in
> drivers that won't end up being tested this time around. The set already
> does a lot, such changes could be done later on of course.
> 

Agreed.

Helen
