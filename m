Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF0D3A0CF7
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 09:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236861AbhFIHCf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 03:02:35 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:55703 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236892AbhFIHCe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Jun 2021 03:02:34 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qsCRlytcwhg8ZqsCUl9bck; Wed, 09 Jun 2021 09:00:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623222038; bh=f/Gg/RPO7uNzrNUc0IDgM55uFY/+3t/hG5lEXe/upLo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=N31qXlxpwcLUNKCnMqiKEwnJQh204DEimo+IW8MxPB+xLtZaQbiAZtM60CbZyM0aJ
         I9bag61kNROJs4rpKJoTxGjMEJ68N4K9i7wM12SjefUO4P5jAxozSvEFwn9Dg649o7
         21p9FkO7cIt910DHI2uGXg6j+PGOQiQ/PatjwcjXRoS7ePCL/3jriIkn8e9r5Glx1E
         HPfVhUa5HcNLQB/fcbbWGpYJk+rVg5dtKqkdv1LlShOv42ZsuUrxnwMLKq/X7EvUa/
         sIqq3z5WgowhbU6I2rXZ2sSHegfIgHeY7uE+MONg6GICNh1I5li7QvTweJsxiIW9Vo
         Pa3SQDhe1JmNA==
Subject: Re: [PATCH] drivers/media/usb/gspca: fix typo issues
To:     Joe Perches <joe@perches.com>, herman yim <herman.yim88@gmail.com>,
        "yanshuaijun@yulong.com" <yanshuaijun@yulong.com>
Cc:     mchehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210609033245.3410-1-yanshuaijun@yulong.com>
 <601ccbd8b792abd0177475dd09fdd2d6c6f4a6af.camel@perches.com>
 <60c05921.1c69fb81.dbb59.4019SMTPIN_ADDED_BROKEN@mx.google.com>
 <CAP6HEvL-wCAfBJLBoJ2gaUBN0G-CWFb95e2nd6nwPNdwF7VaJQ@mail.gmail.com>
 <9ebb46d4cb9f66c2bb3e6d1987d8e79fa20323f9.camel@perches.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e86f856e-f34f-6c48-a064-9265bc60516d@xs4all.nl>
Date:   Wed, 9 Jun 2021 09:00:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <9ebb46d4cb9f66c2bb3e6d1987d8e79fa20323f9.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfEPz7gxNfTV+Y7pi5rEntAapFdI2yd783V5ONelgUZPI80soAHiAMfc9789fazH7/DyK2+GYrK0EWAP9NSoQRn3U+aQh8Ji2JsaBTbRTeu8GIG1XQlqM
 ONGWYQX0jCTVaRBbTDgAOgY961RvUR2mc+8a0MDHFwi6dxxjQ9GBXzTYtoIb0A8ZpzhLmQe+vYHzOQj+fue9UXkIMH21yvVlLURFUteyxpVwXt1+ov4m1PhO
 7rgFVGjOr+YLmoHsUOV9NFO+A+UZQWGLD3spOCo/PdGAuGaAx3419Qd0j22H6rxXEOuadXzX/CHk9RytX8nUzZALUzO8iUCqCeUFp9zBJJa7T1FGbP+qA20x
 IeHd7o2kmB+Zm3XN3RY8wJjwfn9iCg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/06/2021 08:39, Joe Perches wrote:
> On Wed, 2021-06-09 at 14:29 +0800, herman yim wrote:
>> hi Joe,
>>  many flicker written into fliker in this file, relate to variable name and
>> function name.
>>  change them together ? what is your suggestion ?
> 
> Leave it alone.  It's old and probably obsolete.
> 
> 

Actually, this driver is still in use and maintained. Apparently these old
webcams refuse to die :-)

So I'll accept a patch changing the fliker typo in this driver (just make a
single patch changing this in the gscpa driver).

Regards,

	Hans
