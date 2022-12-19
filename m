Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E71E650CCF
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 14:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbiLSNse (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 08:48:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231712AbiLSNsc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 08:48:32 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1557E10B5A;
        Mon, 19 Dec 2022 05:48:31 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 762E9825;
        Mon, 19 Dec 2022 14:48:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671457708;
        bh=RpSn2vOqEZukIs1Pbj5MNpVE4yelT/wFEM48zH0mQiE=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=smFGbW9csXC9jki4qEM/zJUwAwbaavuZPlODPPwtfi4tdWVAay3acGF1uNfT4XEp2
         Ys0BGJ9E4di+H2IwpHgg99757y7z2sWBCYwv0m54gwhcCVIJ/v9jLEzWRCyrikixHB
         v5JHPuOAHHxERUMQ12LNeiVfeUUSA88yafZO4O38=
Message-ID: <6fad0920-0a66-8273-6bd3-2db20fa9c4d7@ideasonboard.com>
Date:   Mon, 19 Dec 2022 15:48:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/7] media: Add 2-10-10-10 RGB formats
Content-Language: en-US
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20221206133954.397098-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221206133954.397098-2-tomi.valkeinen+renesas@ideasonboard.com>
 <228a5a9416a891895ce0e108719ba0badbbd0ad8.camel@ndufresne.ca>
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <228a5a9416a891895ce0e108719ba0badbbd0ad8.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 06/12/2022 19:39, Nicolas Dufresne wrote:
> Hi,
> 
> Le mardi 06 décembre 2022 à 15:39 +0200, Tomi Valkeinen a écrit :
>> Add XBGR2101010, ABGR2101010 and BGRA1010102 formats.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> This patch is simply missing an update to
> 
> Documentation/userspace-api/media/v4l/pixfmt-rgb.rst

Right, I missed the doc change for this and for the next patch. I'll add 
docs for the next version.

  Tomi

