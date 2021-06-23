Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 875DE3B12EB
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 06:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhFWEeF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 00:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhFWEeF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 00:34:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B88C061574;
        Tue, 22 Jun 2021 21:31:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EEF1E9B1;
        Wed, 23 Jun 2021 06:31:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624422707;
        bh=l1ZULaROW9gWHST/MOQeNIVK+oALudp075K3sPPV7rk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pnHlnMnvII+G928SlZKYbEZt4WWhyittVVksbizkPQrp/81KQywaSli3j2l/mlfrp
         EUezmSrdcvnJ8S3R13wKhRxXky/Pa/z5mRk+TvRwoYlGLqmFfyLpFPcqzS7ETPex1D
         Qykp6Ddlm8JHIaQgfpeV2MjSmnrZF6GnWFdG3+KI=
Date:   Wed, 23 Jun 2021 07:31:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] MEDIA: Driver for ON Semi AR0521 camera sensor
Message-ID: <YNK5FhAXSpI1oHJV@pendragon.ideasonboard.com>
References: <m3wnqm5eqo.fsf@t19.piap.pl>
 <YNHQDNdpxcY8+IV2@pendragon.ideasonboard.com>
 <m3r1gt5hzm.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3r1gt5hzm.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Wed, Jun 23, 2021 at 06:21:01AM +0200, Krzysztof Hałasa wrote:
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:
> 
> > To spend time reviewing this code, I want to know it will be mergeable,
> > and that requires a SoB line. That's a blocker I'm afraid.
> 
> So how do you propose to solve the situation, in which my driver is
> rejected, but another persor takes it, makes changes (btw breaking it),
> and presents it as their own, and it's accepted? This is a paid work and
> I'm required to put in my employer's copyright over the code.
> I could have made this error once - but no more.
> 
> The code will be mergeable, as I already wrote. Why would I bother
> otherwise? But I cannot let that history to repeat itself.

How does a lack of an SoB line prevent someone from doing exactly what
you've described above ?

Maintainers usually understand these issues. They may fail to notice,
but if you point out a patch that would steal your work, that would
prevent it from being merged.

-- 
Regards,

Laurent Pinchart
