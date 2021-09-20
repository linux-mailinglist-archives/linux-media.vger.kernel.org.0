Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6C041136D
	for <lists+linux-media@lfdr.de>; Mon, 20 Sep 2021 13:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234732AbhITLWc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 07:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236497AbhITLWN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 07:22:13 -0400
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96F0CC061574;
        Mon, 20 Sep 2021 04:19:52 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id SHKtmv90WcSrkSHKumAXcF; Mon, 20 Sep 2021 13:19:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1632136789; bh=HXMTp7CaoqOdcgMbLwjsoBfZrna7G+6Y5/y+9DvzrT0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rp63vtbkq6rrVDqH/aryOXf9o74TLOEmWuv/ux+LrnA8Ii1C0cjOtSq0LBYxrkwcx
         L5dS5l7h71mnzM5mY9iV4Ak+lceAANt02NvXZ+E8OrBmqdvjQg+KZrl1/YQBCKTpxM
         IqRVWE/4LyiXweyttGmL3eyauutZLaeB9Uz8vvZGrq4GU4xAXJEX2IQ52X4Gz5POxA
         HjLe6uBnMzd+Sw4qRo6aRCS3RIrV/+DXPHkGBAd2WnfHGfm++/zqL6+KgXRBgqiKyB
         EFHiwc0OhLfYUxmhYmK/XiPMMTwAslRkPCC5uGvPWV50twzzvXF+CwnCNeD3ISlRw/
         kxnjJrcRdubSg==
Subject: Re: [PATCH] media: rc and cec: keep all menu entries together
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20210822000450.27329-1-rdunlap@infradead.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a2367e5c-015a-3731-fcf2-0c448af83fed@xs4all.nl>
Date:   Mon, 20 Sep 2021 13:19:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210822000450.27329-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfH35zTwZa8AZtNwGL1tdd01x5+N5PMKYtMBlZ6rV/gAwdj6q15h14GrFdjhwOzLO/He5+N8A/T3tOhp/m5tHNnS94v0lRNg37mIIc95JEkPiAfnsZAgn
 1KOL5hsWn9LEaMlC1leJLjNv3eL9p8FtJx0NO6V2XBpcX78OSLOqtGtz0lpFp4tZoIfnHPTFLKButi1CiBp4eVoV4yTeQ84rEsy94wsWxbN78B3qcTUMy2q0
 CAwcqDlSka0MlDsCAEhu+G/M8946eHy5TO25ZspFGN9KWCOVh9OBh1XJDPutzb5G5YzgIgpfHpy7k9/8paHUaQDmAF93SnZMm7aRcUj5zgVOXPYs4Ix1sPcz
 bnJZ89MqlLgn2p+qRevgG2hBa4zQfwKmfNAklvoInjcFdhlRZZVgwN1XpIlyppIbO48H9DegOijC+fdFn5q99vfqHJWSsA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Randy,

On 22/08/2021 02:04, Randy Dunlap wrote:
> Keep all of the Remote Controller and CEC menu entries grouped
> together. This is most relevant to 'make xconfig', where the
> entries for "HDMI CEC RC integration" and "Enable CEC error injection
> support" are not displayed (presented) anywhere near the other
> Remote Controller support options.
> By grouping all of these menu entries inside a menu/endmenu block,
> they are forced to be kept together.
> 
> Fixes: 46d2a3b964dd ("media: place CEC menu before MEDIA_SUPPORT")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sean Young <sean@mess.org>
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: linux-media@vger.kernel.org
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/Kconfig |    2 ++
>  1 file changed, 2 insertions(+)
> 
> --- linux-next-20210820.orig/drivers/media/Kconfig
> +++ linux-next-20210820/drivers/media/Kconfig
> @@ -6,8 +6,10 @@
>  #
>  # NOTE: CEC and Remote Controller support should not depend on MEDIA_SUPPORT
>  #
> +menu "Remote Controller and CEC support"
>  source "drivers/media/rc/Kconfig"
>  source "drivers/media/cec/Kconfig"
> +endmenu

Remote control and CEC really have very little to do with one another, except
for "HDMI CEC RC integration", which is a feature of CEC.

It would make more sense IMHO to make a "CEC support" menu and move the
CEC drivers and "HDMI CEC RC integration" and "Enable CEC error injection
support" to that new menu. It's a bit odd that those two CEC options are
directly under the Device Drivers menu.

Would that work for you?

Regards,

	Hans

>  
>  menuconfig MEDIA_SUPPORT
>  	tristate "Multimedia support"
> 

