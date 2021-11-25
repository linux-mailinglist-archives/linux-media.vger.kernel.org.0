Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B42345D3BB
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 04:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238519AbhKYDuC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 22:50:02 -0500
Received: from phobos.denx.de ([85.214.62.61]:53890 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231406AbhKYDsC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 22:48:02 -0500
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: festevam@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 2A27A8128B;
        Thu, 25 Nov 2021 04:44:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1637811890;
        bh=NxaAuKqNPabFRg6DTRrSmqXGLh2v6W9sWoG3+Qs13cM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qxBB+RaQQktPa6hubj1XvpLrMKoQ4+C7UWVENUD1p57i0OFF1qldUe8LFSEM5/lqL
         rG/+bumf+9K/3RCkuRn03eQpDq7LL778U60ZczOlRHHbqVeR+AM8SNFyrPDJ/IUqGP
         h1eHDVWTRxaDxf/ximKS9x3yvPgITWGq8szrxd1/vWYvirdL8fNGSC/5NqUj0skbGa
         7LjHKb7yaQAzNPuZTce6IDcF1ZLdgWS0m6bucPeHWPUIboN/9MgD+KfFRrkJvWJkRf
         PA+mQXzHAbqmOL9jSJO4d32G/T4JcZEpKCbXGX2tcuQHrRxNwWKeHuzMC1bgYqugJ2
         HuuxalZcyWohg==
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 25 Nov 2021 00:44:49 -0300
From:   Fabio Estevam <festevam@denx.de>
To:     Philipp Zabel <p.zabel@pengutronix.de>, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v4 2/2] media: imx-pxp: Add rotation support
In-Reply-To: <0f777e71e47bc64b193f7840ff86ddf9799f3b11.camel@pengutronix.de>
References: <20211008131015.3303915-1-festevam@denx.de>
 <20211008131015.3303915-2-festevam@denx.de>
 <0f777e71e47bc64b193f7840ff86ddf9799f3b11.camel@pengutronix.de>
Message-ID: <e9a03ead4a9a6b72b25587654d0239b2@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 08/10/2021 11:17, Philipp Zabel wrote:
> On Fri, 2021-10-08 at 10:10 -0300, Fabio Estevam wrote:
>> PXP allows clockwise rotation of 0°, 90°, 180° and 270°.
>> 
>> Add support for it.
>> 
>> Tested on a imx6ull-evk.
>> 
>> For example, to rotate 90° the following Gstreamer pipeline can
>> be used:
>> 
>> gst-launch-1.0 videotestsrc ! video/x-raw,width=640,height=480 ! \
>> v4l2convert extra-controls=cid,rotate=90  ! \
>> video/x-raw,width=120,height=160 ! fbdevsink
>> 
>> Signed-off-by: Fabio Estevam <festevam@denx.de>
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> regards
> Philipp

A gentle ping on this series.
