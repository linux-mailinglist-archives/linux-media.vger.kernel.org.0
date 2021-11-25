Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2670F45D5AD
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 08:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236932AbhKYHpm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 02:45:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234445AbhKYHnm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 02:43:42 -0500
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6F9C061574
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 23:40:23 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id q9Mdm5oGn1HGJq9Mgm2jiQ; Thu, 25 Nov 2021 08:40:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637826021; bh=qoJW8milJU0K39IKcYtQqBLhEmf5FvdYrGJBpumdZ9g=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fkMxRbbPssF1xKf6Jl2CkxjxnDVSN7Kmmn7QurDHbadew69Vx4TNl0Vq7WwnJFMdn
         Q5hWy+CQoOF6YNRhwb43d7S5sSUYZ9gm7ROjrwTzd/hkfIhYCRoPZkBfMzrd9EjBaM
         belDsMD3ltBNRuEwnBCKxhqdK1cw60mPchIo+xkg5OlubdEh5NMMzI5tDNNwSvgmXm
         zBoV3WHCaX/dRggKCPC/51A3JEINKG3XaQUJFxzKkG2HZUi9Ou0CWh2drU5v9cXLRC
         rRtiJz2kUDwwFhETX8s373x76YuR5UaHQTiJLm9LIqjf8dwqlBDu8c7K2oUCigsYDl
         lZoxO99qnPjwQ==
Subject: Re: [PATCH v4 2/2] media: imx-pxp: Add rotation support
To:     Fabio Estevam <festevam@denx.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org
References: <20211008131015.3303915-1-festevam@denx.de>
 <20211008131015.3303915-2-festevam@denx.de>
 <0f777e71e47bc64b193f7840ff86ddf9799f3b11.camel@pengutronix.de>
 <e9a03ead4a9a6b72b25587654d0239b2@denx.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <300f66b6-0f3c-c793-2e0a-3d64de951a23@xs4all.nl>
Date:   Thu, 25 Nov 2021 08:40:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e9a03ead4a9a6b72b25587654d0239b2@denx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfDDb8iZkzbpJyy8LwFFiqYUyNX7bSAU0Ady8ZfU/sDrvUs6EbS35xM9rDFBW8DMAOI4isGe+zGWLyvhukHrgx+yy3jQ9gnSNmjktXB23n87NLov6BkgM
 WS0xiMvoQ85WcDcoaCVkE3vrXQBE9oxXRyFw+vrXdhHNVVp20BJTn0TJ+9LPzTI10A6YlY11Sxy0v8tlze1bfh7r29Bg+OSzo0Rafhyf7Nh8aQ85cVmWauVA
 4HNeLK3QO8mrRMPXM6BvE//05Xz3MDZkNHeJ29YL+4w=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/11/2021 04:44, Fabio Estevam wrote:
> Hi Hans,
> 
> On 08/10/2021 11:17, Philipp Zabel wrote:
>> On Fri, 2021-10-08 at 10:10 -0300, Fabio Estevam wrote:
>>> PXP allows clockwise rotation of 0°, 90°, 180° and 270°.
>>>
>>> Add support for it.
>>>
>>> Tested on a imx6ull-evk.
>>>
>>> For example, to rotate 90° the following Gstreamer pipeline can
>>> be used:
>>>
>>> gst-launch-1.0 videotestsrc ! video/x-raw,width=640,height=480 ! \
>>> v4l2convert extra-controls=cid,rotate=90  ! \
>>> video/x-raw,width=120,height=160 ! fbdevsink
>>>
>>> Signed-off-by: Fabio Estevam <festevam@denx.de>
>>
>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>>
>> regards
>> Philipp
> 
> A gentle ping on this series.
> 

I hope to post the PR containing this series today.

Regards,

	Hans
